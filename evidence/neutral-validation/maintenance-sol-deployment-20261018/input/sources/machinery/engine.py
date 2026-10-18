"""Durable action transactions. Live orchestration is in machinery.controller.
The Lean protocol guards each bounded epoch, not arbitrary Python effects.
"""
import argparse
import copy
import fcntl
import json
from pathlib import Path
import uuid
import os
from .broker import Broker
from .protocol import transition
from .gate import canonical, digest, Rejected
from .toolchain import ROOT


def atomic(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix('.next')
    with tmp.open('w') as stream:
        stream.write(canonical(value)+'\n')
        stream.flush()
        os.fsync(stream.fileno())
    tmp.replace(path)
    fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


class Engine:
    def __init__(self, directory, *, adapters=None, continuing=False):
        self.directory = Path(directory)
        self.directory.mkdir(parents=True, exist_ok=True)
        self.state_path = self.directory/'state.json'
        self.adapters = adapters or {}
        self.continuing = continuing

    def broker(self, state):
        # Prior events remain visible; only the current epoch is budgeted.
        limit = len(state['events']) + state['protocol']['limit'] - state['protocol']['count']
        contract = copy.deepcopy(state['contract'])
        broker = Broker(contract, limit=limit, events=state['events'], agenda=state['agenda'])
        broker.limit = limit
        for kind, adapter in self.adapters.items():
            broker.register(kind, adapter)
        return broker

    def initialize(self, contract):
        if self.state_path.exists():
            raise Rejected('run already exists')
        atomic(self.state_path, {'contract': contract, 'events': [], 'agenda': [],
                                'generation': 0, 'consumed': [], 'pending': None,
                                'status': 'experimental_bootstrap',
                                'protocol': {'pending':None,'consumed':[],'count':0,
                                  'limit':min(32,contract.get('limits',{}).get('actions',32)),
                                  'inflight':False}})
        return self.request()

    def request(self):
        with (self.directory/'transaction.lock').open('a') as lock:
            fcntl.flock(lock,fcntl.LOCK_EX)
            return self._request()

    def _request(self):
        state = json.loads(self.state_path.read_text())
        if state.get('inflight'):
            raise Rejected('partially executed response: recover before requesting')
        if state['pending']:
            return json.loads((self.directory/state['pending']).read_text())
        if state['protocol']['count'] == state['protocol']['limit']:
            if not self.continuing:
                return {'status': 'action_budget_exhausted'}
            epoch = state.get('epoch', 0)
            atomic(self.directory/f'epoch-{epoch:06d}.json', {
                'protocol': state['protocol'], 'events_hash': digest(state['events']),
                'event_count': len(state['events']), 'contract_hash': digest(state['contract'])})
            state['epoch'] = epoch + 1
            state['protocol'] = {'pending': None, 'consumed': [], 'count': 0,
                                 'limit': state['protocol']['limit'], 'inflight': False}
            atomic(self.state_path, state)
        broker = self.broker(state)
        context = broker.context()
        req = {'schema': 'math-gkm.proposal.v2', 'id': uuid.uuid4().hex,
               'provider_model_requested': 'gpt-6-astra', 'generation': state['generation'],
               'epoch': state.get('epoch', 0),
               'context': context, 'context_hash': digest(context),
               'instructions': 'Choose an agenda from observations; return arbitrary supported actions. Do not use description length or complexity for decisions. Preserve exact mission and campaign order. No response constitutes a switch certificate.',
               'response_schema': {'request_id': 'exact id', 'context_hash': 'exact hash',
                 'origin': 'explicit_protocol_fixture | direct_bootstrap_proposer | supervisor_transport',
                 'decision': 'reason based on supplied observations', 'actions': 'array of kind/payload',
                 'provider': 'model identity, request id, token usage, elapsed time if transported'}}
        name = f'request-{state["generation"]:04d}.json'
        atomic(self.directory/name, req)
        state['protocol']=transition(state['protocol'],{'issue':{'id':req['id']}})
        state['pending'] = name
        atomic(self.state_path, state)
        return req

    def consume(self, response):
        with (self.directory/'transaction.lock').open('a') as lock:
            fcntl.flock(lock, fcntl.LOCK_EX)
            state = json.loads(self.state_path.read_text())
            if not state['pending']:
                raise Rejected('no pending request')
            req = json.loads((self.directory/state['pending']).read_text())
            if response.get('request_id') != req['id'] or response.get('context_hash') != req['context_hash']:
                raise Rejected('stale or mismatched response')
            if req['id'] in state['consumed']:
                raise Rejected('replayed response')
            if response.get('origin') not in ('explicit_protocol_fixture','direct_bootstrap_proposer','supervisor_transport'):
                raise Rejected('unknown response provenance')
            actions = response.get('actions')
            if state.get('inflight'):
                raise Rejected('partially executed response: use recover, not consume')
            broker = self.broker(state)
            if not isinstance(actions,list) or not 0 < len(actions) <= broker.limit-len(broker.events):
                raise Rejected('invalid action batch or exhausted budget')
            # Write-ahead consumption: interrupted jobs are not silently rerun.
            atomic(self.directory/f'response-{state["generation"]:04d}.json', response)
            state['protocol']=transition(state['protocol'],{'claim':{'id':req['id']}})
            state['inflight'] = {'request_id':req['id'], 'next':0, 'active':None,
                                 'response': response}
            atomic(self.state_path,state)
            self._execute(state)
        return self.request()

    def _execute(self, state, reconciliation=None):
        job = state['inflight']
        if 'response' not in job:
            raise Rejected('legacy interrupted transaction requires manual effect reconciliation')
        broker = self.broker(state)
        actions = job['response']['actions']
        if job['active'] is not None:
            if reconciliation is None:
                raise Rejected('uncertain action effect; explicit reconciliation required')
            action = actions[job['active']]
            # Record the reconciler observation without repeating its effect.
            broker.limit += 1  # the protocol slot was reserved before the crash
            adapter = broker.adapters.get(action.get('kind'))
            broker.adapters[action.get('kind')] = lambda _: reconciliation
            broker.act(action)
            if adapter is None:
                del broker.adapters[action.get('kind')]
            else:
                broker.adapters[action.get('kind')] = adapter
            job['next'] += 1
            job['active'] = None
            state['events'], state['agenda'] = broker.events, broker.agenda
            atomic(self.state_path, state)
        while job['next'] < len(actions):
            state['protocol'] = transition(state['protocol'], 'record')
            job['active'] = job['next']
            atomic(self.state_path, state)
            broker.act(actions[job['next']])
            job['next'] += 1
            job['active'] = None
            state['events'], state['agenda'] = broker.events, broker.agenda
            atomic(self.state_path, state)
        state['protocol'] = transition(state['protocol'], 'finish')
        state['consumed'].append(job['request_id'])
        state.update(pending=None, generation=state['generation']+1, inflight=None)
        atomic(self.state_path, state)

    def recover(self, reconciliation=None):
        with (self.directory/'transaction.lock').open('a') as lock:
            fcntl.flock(lock, fcntl.LOCK_EX)
            state = json.loads(self.state_path.read_text())
            if state.get('inflight'):
                self._execute(state, reconciliation)
        return self.request()


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('command', choices=['init','request','consume'])
    parser.add_argument('--run',required=True)
    parser.add_argument('--file')
    args=parser.parse_args()
    engine=Engine(ROOT/args.run)
    if args.command=='init':
        result=engine.initialize(json.loads((ROOT/args.file).read_text()))
    elif args.command=='consume':
        result=engine.consume(json.loads((ROOT/args.file).read_text()))
    else:
        result=engine.request()
    print(canonical(result))

if __name__=='__main__':
    main()
