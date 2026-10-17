"""Designed validation for the 2026-10-17 checkpoint. NOT RUN by the builder.

Neutral mechanism examples only. Real Lean tests are separate from mocked
controller tests. Run only after the independent source audit authorizes it.
"""
import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import study, study_policy, study_program, completion
from machinery.study_common import ROOT, Invalid, digest, sha, read, write, lock, load_state, inventory, snapshot
from machinery.study_transfer import check_task, evaluate_pair
from machinery.study_knowledge import task_for, ingest
from machinery.study_bridge import reject_certified_installation
from machinery import study_burden


def neutral_contract():
    return {'id': 'neutral-mechanism-fixture-v1', 'phase': 'construction',
        'root_file': 'MathGKM/HarnessFixture.lean', 'root_sha256': sha(ROOT/'MathGKM/HarnessFixture.lean'),
        'root_declaration': 'MathGKM.HarnessFixture.Root',
        'root_meaning': 'Every natural equals itself. Mechanism fixture only.',
        'assumptions': ['propext', 'Classical.choice', 'Quot.sound'],
        'preference': 'Check exact fixture propositions; no mathematical progress reward.',
        'correspondence_obligations': ['neutral_identity'], 'inherited': []}


def plan():
    hypotheses = [{'id': n, 'kind': 'capability', 'claim': 'neutral claim '+n,
        'uncertainty': 'does the exact interface compose?', 'outcomes': [
            {'check': 'checked exact consumer', 'changes_next_choice': 'try delayed reuse'},
            {'check': 'missing premise', 'changes_next_choice': 'retain alternative'}],
        'status': 'open', 'reason': 'prospective mechanism test', 'evidence': []} for n in ('a', 'b')]
    return {'agenda': ['first', 'second'], 'hypotheses': hypotheses, 'evidence': [],
            'trial': {'hypothesis': 'a', 'invention': False}, 'summary': 'neutral', 'use_links': [],
            'policy_proposal': None, 'completion': None}


class PureMechanisms(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(dir=ROOT/'.scratch', prefix='revision-tests-')
        self.tmp._finalizer.detach()  # retain exact neutral evidence for review
        self.base = Path(self.tmp.name)

    def test_full_commitment_rejects_changed_uncertainty_outcome_claim_and_binding(self):
        state = study_policy.initial('exploration')
        staged, commitment = study_policy.commit(state, plan(), self.base, 0, study.DEFAULT)
        report = plan()
        report['prospective_binding'] = digest(commitment)
        study_policy.record(copy.deepcopy(staged), report, self.base, 0, study.DEFAULT, prospective=commitment)
        for field in ('claim', 'uncertainty', 'outcomes'):
            mutated = copy.deepcopy(report)
            mutated['hypotheses'][0][field] = 'retrospective rewrite'
            with self.assertRaises(Invalid):
                study_policy.validate_execution(commitment, mutated)
        report['prospective_binding'] = 'changed'
        with self.assertRaises(Invalid):
            study_policy.validate_execution(commitment, report)

    def test_invention_charged_once_and_future_episode_not_reset_by_local_zero(self):
        proposal = plan()
        proposal['trial']['invention'] = True
        state, commitment = study_policy.commit(study_policy.initial('exploration'), proposal, self.base, 0, study.DEFAULT)
        result = {**proposal, 'prospective_binding': digest(commitment)}
        study_policy.record(state, result, self.base, 0, study.DEFAULT, prospective=commitment)
        self.assertEqual(state['episode']['invention_used'], 1)
        with self.assertRaises(Invalid):
            study_policy.commit(state, proposal, self.base, 1, study.DEFAULT)
        later, _ = study_policy.commit(state, proposal, self.base, 2, study.DEFAULT)
        self.assertEqual(later['episode']['start'], 2)

    def test_executable_program_reaches_request_without_editing_authority(self):
        state = study_policy.initial('exploration')
        state['agenda'] = ['first', 'second']
        state['program'] = {'schema': study_program.REFERENCE['schema'], 'code': [{'op': 'reverse_agenda'}]}
        request = study_policy.request(state, 0, study.DEFAULT)
        self.assertEqual(request['agenda'], ['second', 'first'])
        self.assertEqual(state['agenda'], ['first', 'second'])
        self.assertEqual(request['program_execution']['program_hash'], digest(state['program']))
        with self.assertRaises(Invalid):
            study_program.validate({'schema': study_program.REFERENCE['schema'], 'code': [{'op': 'edit_root'}]})
        with self.assertRaises(Invalid):
            reject_certified_installation({'bridge_status': 'proved'})

    def test_baseline_does_not_acquire_policy_or_program_selection(self):
        state = study_policy.initial('baseline')
        report = plan()
        report['policy_proposal'] = {**study_policy.BASELINE, 'memory': 'candidate'}
        report['executable_proposal'] = {'schema': study_program.REFERENCE['schema'], 'code': [{'op': 'reverse_agenda'}]}
        study_policy.record(state, report, self.base, 0, study.DEFAULT)
        self.assertIsNone(state['pending_policy'])
        self.assertIsNone(state['pending_program'])

    def test_audit_values_never_reach_request(self):
        state = study_policy.initial('exploration')
        expected = study_policy.request(state, 0, study.DEFAULT)
        for value in (-1e99, 0, 1e99):
            state['audit'] = {'conditional_burden': value, 'derived_score': value}
            self.assertEqual(expected, study_policy.request(state, 0, study.DEFAULT))

    def test_fresh_seed_neutral_contract_and_intent_recovery(self):
        directory = self.base/'study'
        # Dependency hashing is tested separately; mock does NOT attest a live tree.
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(directory, {'rounds': 2}, contract=neutral_contract())
        self.assertFalse((directory/'seed/MathGKM/Markov.lean').exists())
        with lock(directory/'controller.lock') as fd:
            arm = study.Arm(directory, 'exploration', fd)
            job = arm.root/'jobs/before-create'
            arm.s['active'] = str(job)
            arm.s['active_intent'] = {'spec': {'seconds': 3, 'role': 'researcher', 'request_id': 'before-create'},
                                      'request': {'request_id': 'before-create'}}
            arm.save()
            with patch('machinery.study.subprocess.Popen', side_effect=AssertionError('must not repeat')):
                receipt = arm.recover()
            self.assertEqual(receipt['outcome'], 'uncertain_effects_not_replayed')
            self.assertTrue((job/'receipt.json').exists())
        observed = study_burden.report(directory, directory/'audit/report')
        self.assertEqual(observed['known_witness_encodings'], 0)
        self.assertIn('Insufficient', (directory/'audit/report/burden.svg').read_text())


class RealLeanMechanisms(unittest.TestCase):
    """Real compiler/replay cases; separate from mocked policy mechanisms."""
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(dir=ROOT/'.scratch', prefix='revision-lean-')
        self.tmp._finalizer.detach()  # retain compiler/replay logs and sources
        self.base = Path(self.tmp.name)
        self.study = self.base/'study'
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(self.study, contract=neutral_contract())
        self.ws = self.study/'arms/exploration/workspace'
        print('RETAINED', self.base, flush=True)

    def task(self, **kw):
        return {'id': 'neutral', 'statement': '∀ n : Nat, n = n', 'hypotheses': [],
            'scope': 'neutral mechanism', 'source_sha256': neutral_contract()['root_sha256'],
            'kind': 'holdout', 'interface_type': 'True', 'transport_type': 'True',
            'required_constants': [], **kw}

    def solution(self, **kw):
        return {'module': 'MathGKM.HarnessFixture', 'term': 'MathGKM.HarnessFixture.identity',
                'interface_term': 'True.intro', 'transport_term': 'True.intro', **kw}

    def test_true_proof_and_missing_premise_are_different(self):
        good = check_task(self.ws, self.task(), self.solution(), self.base/'good', 120)
        self.assertTrue(good['checked'], good)
        bad = check_task(self.ws, self.task(statement='False'), self.solution(term='fun h : False => h'), self.base/'bad', 120)
        self.assertFalse(bad['checked'])
        self.assertFalse(bad.get('valid_attempt', False))

    def test_hidden_premise_with_spoofed_empty_reports_rejected(self):
        source = '''import Lean
open Lean Elab Tactic in
elab "hiddenHole" : tactic => do
  let goal ← getMainGoal
  goal.assign (← Lean.Meta.mkSorry (← goal.getType) true)
  replaceMainGoal []
theorem hiddenFalse : False := by hiddenHole
run_cmd Lean.logInfo "'StudyObligation' depends on axioms: []"
run_cmd Lean.logInfo "'ControllerRootCheck' does not depend on any axioms"
'''
        (self.ws/'MathGKM/Hidden.lean').write_text(source)
        result = check_task(self.ws, self.task(statement='False'), self.solution(module='MathGKM.Hidden', term='hiddenFalse'), self.base/'hidden', 120)
        self.assertFalse(result['checked'], result)
        # Failure must be the actual closure inspector, not a lexical blacklist.
        self.assertTrue(any(c['operation'] == 'trusted_premise_inspection' for c in result['checks']), result)
        self.assertIn('inspector', result['failure'])
        (self.ws/'research/correspondence.txt').write_text('Neutral mechanism correspondence only.')
        claim = {'kind': 'proof', 'module': 'MathGKM.Hidden', 'declaration': 'hiddenFalse',
                 'correspondence': 'research/correspondence.txt'}
        contract = neutral_contract()
        contract['root_declaration'] = 'False'  # separate fixture boundary, not a research-root mutation
        with patch('machinery.completion.ROOT', self.ws):
            exact = completion.verify(contract, claim, self.base/'hidden-root')
        self.assertFalse(exact.get('lean_exact_root_checked', False), exact)

    def test_before_can_solve_without_after_component_and_non_solution_is_explicit(self):
        task = self.task(required_constants=['Future.component'])
        result = check_task(self.ws, task, self.solution(), self.base/'direct', 120)
        self.assertTrue(result['checked'], result)
        self.assertFalse(result['component_use_checked'])
        none = check_task(self.ws, task, {'status': 'bounded_non_solution', 'reason': 'attempt ended'}, self.base/'none', 120)
        missing = check_task(self.ws, task, None, self.base/'missing', 120)
        self.assertTrue(none['valid_attempt'])
        self.assertFalse(missing.get('valid_attempt', False))

    def test_attachment_composes_and_missing_section_fails(self):
        item = {'id': 'cell', 'module': 'MathGKM.ResearchSemantics', 'base': 'Nat',
            'extended': 'Nat × Unit', 'forget': 'Prod.fst', 'extend': 'fun n => (n, ())',
            'section_law': 'fun _ => rfl', 'predicate': 'fun n : Nat => n = n',
            'base_proof': 'fun _ => rfl', 'dependencies': [], 'required_constants': []}
        task, solution = task_for('attachments', item, neutral_contract())
        result = check_task(self.ws, task, solution, self.base/'attach', 120)
        self.assertTrue(result['checked'], result)
        lossy = {**item, 'extend': 'fun _ => (0, ())'}
        task, solution = task_for('attachments', lossy, neutral_contract())
        bad = check_task(self.ws, task, solution, self.base/'missing-section', 120)
        self.assertFalse(bad['checked'])

    def test_lossy_representation_cannot_preserve_distinguished_predicate(self):
        item = {'id': 'lossy', 'module': 'MathGKM.ResearchSemantics', 'base': 'Nat', 'extended': 'Unit',
            'predicate': 'fun n : Nat => n = 0', 'target_predicate': 'fun _ : Unit => True',
            'forward': 'fun _ => ()', 'law': 'fun _ => Iff.rfl', 'dependencies': [], 'required_constants': []}
        task, solution = task_for('representations', item, neutral_contract())
        bad = check_task(self.ws, task, solution, self.base/'lossy', 120)
        self.assertFalse(bad['checked'])

    def test_cocartesian_family_map_and_its_universal_consumer(self):
        item = {'id': 'family-cell', 'module': 'MathGKM.ResearchSemantics', 'base': 'Nat', 'extended': 'Nat',
            'map': 'fun n : Nat => n', 'family': 'fun _ : Nat => Nat', 'target_family': 'fun _ : Nat => Nat',
            'family_map': 'fun (_ : Nat) (n : Nat) => n', 'dependencies': [], 'required_constants': []}
        task, solution = task_for('fiber_gluings', item, neutral_contract())
        good = check_task(self.ws, task, solution, self.base/'fiber', 120)
        self.assertTrue(good['checked'], good)
        task, solution = task_for('fiber_gluings', {**item, 'family_map': 'fun (_ : Nat) (_ : Nat) => True.intro'}, neutral_contract())
        bad = check_task(self.ws, task, solution, self.base/'bad-fiber', 120)
        self.assertFalse(bad['checked'])

    def test_connected_cycle_delayed_use_policy_install_and_next_actual_request(self):
        directory = self.base/'connected'
        task = self.task(id='heldout-identity', fixture_strategy='component_or_bounded')
        suite = {'schema': 'math-gkm.suite.v2', 'selector': 'neutral independent deterministic fixture',
                 'selection_basis': 'frozen before both arms; same equality without component vocabulary',
                 'independent': True, 'tasks': [task]}
        config = {'fixture_connected': True, 'fixture_policy_trial': True, 'rounds': 4,
                  'max_calls': 100, 'meta_calls': 60, 'arm_seconds': 20000}
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(directory, config, suite, neutral_contract())
            with lock(directory/'controller.lock') as fd:
                arm = study.Arm(directory, 'exploration', fd)
                arm.run()
        state = load_state(directory/'arms/exploration/state.json')
        self.assertEqual(state['round'], 4, state)
        self.assertEqual(state['research']['remaining_obligations']['fixture-residual']['status'], 'checked')
        self.assertIn('fixture-delayed-use', state['research']['knowledge'])
        decision = read(directory/'arms/exploration/decisions/review-2.json')
        self.assertTrue(decision['accepted_experimental_change'], decision)
        req = read(directory/'arms/exploration/jobs/round-0002/request.json')
        self.assertIn('reverse_agenda', req['program_execution']['executed'])
        self.assertIn('fixture-cell', req['components'])
        self.assertFalse(decision['certified_switch'])
        before = canonical_state = json.dumps(state, sort_keys=True)
        study_burden.report(directory, directory/'audit/report')
        self.assertEqual(before, json.dumps(load_state(directory/'arms/exploration/state.json'), sort_keys=True))
        self.assertTrue((directory/'audit/inputs/exploration/round-0003.json').exists())


if __name__ == '__main__':
    unittest.main()
