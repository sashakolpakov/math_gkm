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
            'prospective_binding': req.get('prospective_binding'),
            'use_links': [], 'policy_proposal': None, 'completion': None}
        if r == 0 and spec.get('fixture_policy_trial'):
            payload['policy_proposal'] = {**req['policy'], 'memory': 'toy candidate memory policy with fixture component'}
            payload['executable_proposal'] = {'schema': 'math-gkm.request-program.v1', 'code': [{'op': 'reverse_agenda'}]}
        if spec.get('fixture_connected') and spec['role'] == 'researcher':
            if read(workspace/'contract.json')['id'] != 'neutral-mechanism-fixture-v1':
                raise ValueError('connected mechanism fixture requires the neutral contract')
            if r == 0:
                payload['fiber_gluings'] = [{'id': 'fixture-family', 'module': 'MathGKM.ResearchSemantics',
                    'base': 'Nat', 'extended': 'Nat', 'map': 'fun n : Nat => n',
                    'family': 'fun _ : Nat => Nat', 'target_family': 'fun _ : Nat => Nat',
                    'family_map': 'fun (_ : Nat) (n : Nat) => n', 'dependencies': [], 'required_constants': []}]
                payload['attachments'] = [{'id': 'fixture-cell', 'module': 'MathGKM.ResearchSemantics',
                    'base': 'Nat', 'extended': 'Nat × Unit', 'forget': 'Prod.fst', 'extend': 'fun n => (n, ())',
                    'section_law': 'fun _ => rfl', 'predicate': 'fun n : Nat => n = n',
                    'base_proof': 'fun _ => rfl', 'dependencies': [], 'required_constants': []}]
                payload['reductions'] = [{'id': 'fixture-reduction', 'module': 'MathGKM.HarnessFixture',
                    'residuals': [{'id': 'fixture-residual', 'statement': '∀ n : Nat, n = n'}],
                    'term': 'fun h => h', 'dependencies': [], 'required_constants': []}]
            elif r == 1 and 'fixture-cell' in req.get('components', {}):
                cell = req['components']['fixture-cell']
                payload['mathematical_claims'] = [
                    {'id': 'fixture-discharge', 'module': 'MathGKM.HarnessFixture',
                     'statement': '∀ n : Nat, n = n', 'term': 'fun _ => rfl', 'discharges': ['fixture-residual']},
                    {'id': 'fixture-delayed-use', 'module': cell['export_module'],
                     'statement': '∀ e : Nat × Unit, e.1 = e.1', 'term': cell['exports'][0],
                     'dependencies': ['fixture-cell'], 'required_constants': [cell['exports'][0]]}]
                family = req['components'].get('fixture-family')
                if family:
                    payload['mathematical_claims'].append({'id': 'fixture-family-reuse', 'module': family['export_module'],
                        'statement': '∀ n : Nat, n = n', 'term': 'fun n => '+family['exports'][2]+' 0 n',
                        'dependencies': ['fixture-family'], 'required_constants': [family['exports'][2]]})
        if spec['role'] == 'researcher' and (workspace/'MathGKM/FixtureComponent.lean').exists():
            payload.setdefault('mathematical_claims', []).append({'id': 'fixture-strategy-component',
                'module': 'MathGKM.FixtureComponent', 'statement': '∀ n : Nat, n = n',
                'term': 'FixtureComponent.use', 'required_constants': ['FixtureComponent.use']})
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
        for task in req['tasks']:
            if task.get('fixture_strategy') == 'component_or_bounded':
                payload['solutions'][task['id']] = ({'module': 'MathGKM.FixtureComponent',
                    'term': 'FixtureComponent.use', 'interface_term': 'True.intro', 'transport_term': 'True.intro'}
                    if (workspace/'MathGKM/FixtureComponent.lean').exists() else
                    {'status': 'bounded_non_solution', 'reason': 'deterministic neutral adapter declines direct proof; no incapability claim'})
    else:
        records = read(workspace/'inbox/records.json')
        eligible = (records.get('comparison') or {}).get('eligible', False)
        payload = {'choice': 'candidate' if eligible else 'incumbent', 'reason': 'SYNTHETIC choice based only on supplied actual checked comparison eligibility',
            'evidence': [{'path': 'inbox/records.json', 'sha256': sha(workspace/'inbox/records.json')}]}
    write(job/'final.json', {'request_id': spec['request_id'], 'payload_json': json.dumps(payload)})
    print(json.dumps({'type': 'fixture.completed', 'usage': {'synthetic_calls': 1}}), flush=True)

if __name__ == '__main__':
    main(Path(sys.argv[1]))
