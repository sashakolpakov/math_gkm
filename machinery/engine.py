"""Codex/Astra durable propose/action/observation/continuation protocol.
One foreground transaction per command. No network, secrets, or model subprocess.
The supervisor transports request.json to gpt-6-astra and returns response.json.
Responses influence exploration only and never supply proof-admission authority.
"""
import argparse
import copy
import fcntl
import json
from pathlib import Path
import uuid
from .broker import Broker
from .protocol import transition
from .gate import canonical, digest, Rejected
from .toolchain import ROOT


def atomic(path, value):
    tmp = path.with_suffix('.next')
    tmp.write_text(canonical(value)+'\n')
    tmp.replace(path)


class Engine:
    def __init__(self, directory):
        self.directory = Path(directory)
        self.directory.mkdir(parents=True, exist_ok=True)
        self.state_path = self.directory/'state.json'

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
        if state['pending']:
            return json.loads((self.directory/state['pending']).read_text())
        broker = Broker(state['contract'], events=state['events'], agenda=state['agenda'])
        context = broker.context()
        req = {'schema': 'math-gkm.proposal.v2', 'id': uuid.uuid4().hex,
               'provider_model_requested': 'gpt-6-astra', 'generation': state['generation'],
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
            broker = Broker(state['contract'], events=state['events'], agenda=state['agenda'])
            if not isinstance(actions,list) or not 0 < len(actions) <= broker.limit-len(broker.events):
                raise Rejected('invalid action batch or exhausted budget')
            # Write-ahead consumption: interrupted jobs are not silently rerun.
            atomic(self.directory/f'response-{state["generation"]:04d}.json', response)
            state['protocol']=transition(state['protocol'],{'claim':{'id':req['id']}})
            state['consumed'].append(req['id'])
            state['inflight'] = {'request_id':req['id'], 'status':'interrupted_unless_completed'}
            atomic(self.state_path,state)
            for action in actions:
                state['protocol']=transition(state['protocol'],'record')
                broker.act(action)
                state['events'], state['agenda'] = broker.events, broker.agenda
                atomic(self.state_path,state)
            state['protocol']=transition(state['protocol'],'finish')
            state.update(pending=None, generation=state['generation']+1, inflight=None)
            atomic(self.state_path,state)
        return self.request() if len(broker.events)<broker.limit else {'status':'action_budget_exhausted'}


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
