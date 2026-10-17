"""Deterministic transport fixtures. Toy artifacts are NOT Markov results."""
import json
from pathlib import Path
import sys
import time
from .study_common import read, write, sha

def main(job):
    spec = read(job/'spec.json')
    req = read(job/'request.json')
    workspace = Path(spec['workspace'])
    behavior = spec.get('fixture_behavior', 'normal')
    if behavior == 'sleep':
        time.sleep(60)
    if behavior == 'missing':
        return
    if behavior == 'exit':
        sys.exit(7)
    if spec['role'] in ('researcher', 'proposer'):
        r = req['round']
        artifact = workspace/f'research/toy-{r}.txt'
        if spec['role'] == 'researcher':
            artifact.write_text(f'SYNTHETIC FIXTURE round {r}; no mathematical progress\n')
            if 'fixture component' in req['policy']['memory']:
                (workspace/'MathGKM/FixtureComponent.lean').write_text('import Lean\nnamespace FixtureComponent\ndef value (n : Nat) : Nat := n\ntheorem use (n : Nat) : value n = n := rfl\nend FixtureComponent\n')
        evidence = [] if spec['role'] == 'proposer' else [{'path': str(artifact.relative_to(workspace)), 'sha256': sha(artifact), 'kind': 'experiment'}]
        hypotheses = [{'id': name, 'kind': kind, 'claim': claim,
            'uncertainty': 'Does the toy interface preserve its observation?',
            'outcomes': [{'check': 'toy interface check passes', 'changes_next_choice': 'test a second consumer'},
                         {'check': 'toy interface check fails', 'changes_next_choice': 'retain alternative'}],
            'status': 'usefulness_not_demonstrated', 'reason': 'await independent checks', 'evidence': [e['path'] for e in evidence]}
            for name, kind, claim in [('h-a', 'capability', 'toy representation may help'),
                                      ('h-b', 'strategy', 'toy direct route may help')]]
        payload = {'agenda': [f'fixture continuation after round {r}'], 'summary': 'SYNTHETIC evidence only',
            'hypotheses': hypotheses, 'evidence': evidence,
            'trial': {'hypothesis': 'h-a' if r % 2 == 0 else 'h-b', 'invention': False},
            'use_links': [], 'policy_proposal': None, 'completion': None}
        if r == 0 and spec.get('fixture_policy_trial'):
            payload['policy_proposal'] = {**req['policy'], 'memory': 'toy candidate memory policy with fixture component'}
    elif spec['role'] == 'reviewer':
        payload = {'findings': [{'path': 'inbox/records.json', 'sha256': sha(workspace/'inbox/records.json'),
                                'finding': 'Fixture observes real process receipts; no theorem or transfer claim.'}],
                   'correctness': 'not_demonstrated', 'scope': 'toy_only', 'transfer': 'not_demonstrated',
                   'costs': 'read actual receipts', 'recommendation': 'incumbent'}
    elif spec['role'] == 'curator':
        payload = {'suite': {'schema': 'math-gkm.suite.v2', 'selector': 'SYNTHETIC independent fixture selector',
            'selection_basis': 'Deterministic empty suite; no mathematical claims', 'independent': True, 'tasks': []}}
    elif spec['role'] == 'adapter':
        payload = {'solutions': {t['id']: {'term': t.get('fixture_term', 'by rfl'),
            'module': t.get('fixture_module', 'MathGKM.Markov'),
            'interface_term': t.get('fixture_interface_term', 'by rfl'),
            'transport_term': t.get('fixture_transport_term', 'by rfl')}
            for t in req['tasks']}}
    else:
        records = read(workspace/'inbox/records.json')
        eligible = (records.get('comparison') or {}).get('eligible', False)
        payload = {'choice': 'candidate' if eligible else 'incumbent', 'reason': 'SYNTHETIC choice based only on supplied actual checked comparison eligibility',
            'evidence': [{'path': 'inbox/records.json', 'sha256': sha(workspace/'inbox/records.json')}]}
    write(job/'final.json', {'request_id': spec['request_id'], 'payload_json': json.dumps(payload)})
    print(json.dumps({'type': 'fixture.completed', 'usage': {'synthetic_calls': 1}}), flush=True)

if __name__ == '__main__':
    main(Path(sys.argv[1]))
