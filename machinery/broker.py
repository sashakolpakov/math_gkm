"""Codex/Astra: extensible bounded action/observation interface.
All output is provisional; protected supervisor services supply external facts.
"""
from __future__ import annotations
import copy
import json
from pathlib import Path
import shutil
import tempfile
import time
from .gate import ProofGate, Rejected, canonical, digest, check_graph
from .process import run
from .toolchain import ROOT
from .trust import environment


class AstraProposer:
    def propose(self, context, *, fixture=None):
        if fixture is None:
            raise Rejected('live inline proposer disabled; use machinery.engine durable transport')
        return {'provenance': 'explicit_protocol_fixture', 'context_hash': digest(context),
                'actions': copy.deepcopy(fixture)}


class Broker:
    def __init__(self, contract, *, limit=32, events=(), agenda=()):
        self.contract = copy.deepcopy(contract)
        self.limit = min(limit, contract.get('limits', {}).get('actions', limit))
        self._events = copy.deepcopy(list(events))
        self._agenda = copy.deepcopy(list(agenda))
        self.adapters = {}

    @property
    def events(self):
        return copy.deepcopy(self._events)

    @property
    def agenda(self):
        return copy.deepcopy(self._agenda)

    def register(self, kind, adapter):
        # Controller-owned extension point; proposal JSON cannot install code.
        if kind in self.adapters:
            raise Rejected('duplicate adapter')
        self.adapters[kind] = adapter

    def act(self, action):
        if len(self._events) >= self.limit:
            raise Rejected('action budget exhausted')
        start = time.monotonic_ns()
        action = copy.deepcopy(action)
        try:
            if not isinstance(action, dict):
                raise Rejected('action must be an object')
            if len(canonical(action).encode()) > 65536:
                raise Rejected('action byte limit')
            kind, payload = action.get('kind'), action.get('payload', {})
            result = self._dispatch(kind, payload)
        except Exception as e:
            result = {'evidence': 'execution_failure', 'error_type': type(e).__name__,
                      'message': str(e)[:4096], 'mathematical_resolution': False}
        event = {'action': action, 'result': copy.deepcopy(result),
                 'elapsed_ns': time.monotonic_ns() - start,
                 'contract_hash': digest(self.contract), 'index': len(self._events),
                 'previous': digest(self._events[-1]) if self._events else None,
                 'provenance': 'Codex/Astra experimental bootstrap'}
        self._events.append(copy.deepcopy(event))
        return copy.deepcopy(result)

    def _dispatch(self, kind, payload):
        if kind in self.adapters:
            return self.adapters[kind](copy.deepcopy(payload))
        if kind == 'experiment':
            tool = payload.get('tool')
            if tool == 'python_pure':
                from .experiment_worker import validate
                validate(payload['program'])
                directory = Path(tempfile.mkdtemp(prefix='experiment-', dir=ROOT/'.scratch'))
                request = directory/'input.json'
                request.write_text(canonical(payload))
                # Fixed trusted loader; proposal is read as data, never shell text.
                loader = ('import sys; from pathlib import Path; '
                          'sys.path.insert(0, '+repr(str(ROOT))+'); '
                          'from machinery.experiment_worker import main; '
                          'sys.stdin=open('+repr(str(request))+'); main()')
                execution = run(['/opt/homebrew/bin/python3','-I','-c',loader],
                    cwd=directory, env=environment(),
                    timeout=min(10, self.contract.get('limits',{}).get('experiment_seconds',10)),
                    output_bytes=min(65536,self.contract.get('limits',{}).get('output_bytes',65536)))
                return {'evidence': 'computation' if execution['returncode'] == 0 and not execution['termination'] else 'execution_failure',
                        'language': 'pure Python AST subset v1', 'execution': execution,
                        'program_hash': digest(payload), 'mathematical_resolution': False}
            if tool in ('python','gap','sage'):
                executable = shutil.which(tool if tool != 'python' else 'python3')
                return {'evidence': 'pending_supervisor_execution' if executable else 'capability_failure',
                        'tool': tool, 'executable': executable, 'request': payload,
                        'reason': 'full-language execution requires supervisor containment; nested sandbox unavailable',
                        'mathematical_resolution': False}
            return {'evidence': 'capability_failure', 'tool': tool, 'mathematical_resolution': False}
        if kind == 'external_observation':
            index=payload['event_index']
            if type(index) is not int or not 0 <= index < len(self._events):
                raise Rejected('unknown external request')
            event=self._events[index]
            if event['result'].get('evidence') not in ('pending_hosted_search','pending_supervisor_execution'):
                raise Rejected('event is not an external request')
            if payload.get('action_hash') != digest(event['action']):
                raise Rejected('external request binding mismatch')
            if any(e['result'].get('external_event_index') == index for e in self._events):
                raise Rejected('external response replay')
            return {'evidence':'external_observation_claim', 'verified':False,
                    'external_event_index':index, 'bound_action_hash':payload['action_hash'],
                    'observation':copy.deepcopy(payload['observation']),
                    'mathematical_resolution':False,
                    'trust':'Supervisor must authenticate outside candidate-writable storage.'}
        if kind == 'literature':
            return {'evidence': 'pending_hosted_search', 'request': payload,
                    'citation_claims_verified': False, 'mathematical_resolution': False}
        if kind in ('proof','refutation'):
            gate = ProofGate(self.contract)
            if payload.get('close_root'):
                receipt = gate.close_root(payload['target'], payload['proof'],
                                          'refutation' if kind == 'refutation' else 'proof')
            else:
                receipt = gate.check(payload['target'],payload['proof'],payload.get('dependencies',()))
            return {'evidence': 'bootstrap_proof_check', 'receipt': receipt,
                    'mathematical_resolution': False}
        if kind == 'lean_source':
            return {'evidence': 'pending_supervisor_execution', 'request': payload,
                    'reason': 'arbitrary Lean elaborators have host IO; isolated dependency rebuild and validator required'}
        if kind == 'attachment':
            order = check_graph(payload['cells'])
            self._agenda.append({'task': 'discharge_attachment_semantics', 'cells': payload['cells']})
            return {'evidence': 'structural_check_only', 'order': order, 'attached': False}
        if kind in ('representation','conjecture','strategy'):
            self._agenda.append({'task': kind, 'proposal': copy.deepcopy(payload), 'status': 'provisional'})
            return {'evidence': 'bootstrap_candidate', 'persistent_rewrite': False,
                    'mathematical_resolution': False}
        if kind == 'rewrite':
            return {'evidence': 'bootstrap_candidate', 'installed': False,
                    'reason': 'whole-continuation bridge, independent validation and cost obligations remain'}
        return {'evidence': 'capability_failure', 'reason': 'unknown action'}

    def context(self):
        def project(value):
            if isinstance(value,dict):
                return {k:project(v) for k,v in value.items() if k not in
                  {'complexity_audit','kolmogorov_audit','description_length_audit','compression_audit'}}
            if isinstance(value,list):
                return [project(v) for v in value]
            return value
        return project(self._context())

    def _context(self):
        # Explicit projection: arbitrary caller metadata/complexity audit is absent.
        return {'contract': copy.deepcopy(self.contract), 'agenda': self.agenda,
                'observations': [{'index': e['index'], 'kind': e['action'].get('kind') if isinstance(e['action'],dict) else None,
                                  'result': copy.deepcopy(e['result'])} for e in self._events],
                'remaining_actions': self.limit-len(self._events)}

    def save(self, path):
        path.write_text(canonical({'events': self.events, 'agenda': self.agenda})+'\n')
