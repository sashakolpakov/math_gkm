"""Active bridge records and protected Lean protocol guard.

The executable guard is the same transition implementation used by Engine.
The receipts describe its narrow scope; they do not certify host effects or a
whole continuation. Open obligations are durable inputs to subsequent requests.
"""
import time
from . import protocol
from .study_common import ROOT, digest, sha, write

OBLIGATIONS = [
    {'id': 'D1-whole-continuation', 'status': 'open', 'required':
     'Concrete strict/nonstrict comparison under the previous contract for install-and-continue versus the entire incumbent, including future discoveries and rewrites.'},
    {'id': 'D2-host-refinement', 'status': 'open', 'required':
     'Simulation of Python interpreter, OS effects, role receipts, recovery and migration by the declared executable semantics.'},
    {'id': 'D3-cost-and-environment', 'status': 'open', 'required':
     'Justified common time baseline, validation/install costs, deadline/state transport, and timed response coupling or explicit environment quantification.'},
    {'id': 'D3-independent-installation', 'status': 'open', 'required':
     'Protected independent certificate validation and an actual guarded installation tied to contract/model/state/code/migration/deadline hashes.'}]


def initial(limit):
    return {'pending': None, 'consumed': [], 'count': 0, 'limit': limit, 'inflight': False}


def event(arm, command):
    before = arm.s.setdefault('protocol_state', initial(arm.p['max_calls']))
    start = time.monotonic()
    after = protocol.transition(before, command)
    elapsed = time.monotonic()-start
    index = len(arm.s.setdefault('semantic_events', []))
    record = {'index': index, 'before': before, 'command': command, 'after': after,
        'protocol_source_sha256': sha(ROOT/'MathGKM/Protocol.lean'),
        'bridge_source_sha256': sha(ROOT/'machinery/study_bridge.py'),
        'contract_sha256': sha(arm.workspace/'contract.json'),
        'program_hash': ((arm.s.get('active_intent') or {}).get('request', {}).get('program_execution', {}).get('program_hash')
                         or digest(arm.s['research'].get('program', {}))),
        'invocation_binding': digest(arm.s.get('active_intent')),
        'elapsed_seconds': elapsed, 'status': 'executed Lean epoch guard; host refinement OPEN',
        'previous': arm.s['semantic_events'][-1] if arm.s['semantic_events'] else None}
    write(arm.root/f'semantics/events/{index:06d}.json', record)
    arm.s['protocol_state'] = after
    arm.s['semantic_events'].append(digest(record))
    arm.s['seconds'] += elapsed
    arm.save()
    return record


def observation(arm, kind, before, after, evidence):
    """Bind actual non-role transitions without pretending Protocol proves them."""
    index = len(arm.s.setdefault('host_events', []))
    record = {'kind': kind, 'before_sha256': digest(before), 'after_sha256': digest(after),
        'evidence': evidence, 'contract_sha256': sha(arm.workspace/'contract.json'),
        'interpreter_sha256': sha(ROOT/'machinery/study_program.py'),
        'semantic_source_sha256': sha(ROOT/'MathGKM/ContinuationObligations.lean'),
        'status': 'actual hash-bound host transition; formal refinement obligation OPEN',
        'previous': arm.s['host_events'][-1] if arm.s['host_events'] else None}
    write(arm.root/f'semantics/host/{index:06d}.json', record)
    arm.s['host_events'].append(digest(record))


def reject_certified_installation(*_args, **_kwargs):
    from .study_common import Invalid
    raise Invalid('certified executable switch unavailable: D1/D2/D3 obligations are open')
