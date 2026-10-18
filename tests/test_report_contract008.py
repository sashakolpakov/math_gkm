"""Prepared neutral pure regressions for008; no workers, hosted roles or compilers."""
import copy
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest

from machinery import study, study_policy as policy
from machinery.study_common import ROOT, Invalid, digest, read, sha, write


def hypothesis():
    return dict(id='neutral-v0', kind='capability', claim='A neutral text check may succeed',
                uncertainty='Which text result occurs?', outcomes=[
                    dict(check='text matches', changes_next_choice='retain text check'),
                    dict(check='text differs', changes_next_choice='revise text check')])


def plan(kind='ordinary'):
    return dict(agenda=['Inspect existing neutral source'], summary='Neutral source observation',
                hypotheses=[] if kind == 'ordinary' else [hypothesis()], evidence=[],
                trial=None if kind == 'ordinary' else dict(hypothesis='neutral-v0', invention=False),
                work_kind=kind, findings=[], use_links=[], policy_proposal=None, completion=None)


def reference(h):
    return digest({**{k: h[k] for k in ('id', 'kind', 'claim', 'uncertainty', 'outcomes')},
                   'parent': h.get('parent'), 'revision': h.get('revision', 0)})


class ReportContract008(unittest.TestCase):
    def setUp(self):
        self.base = Path(tempfile.mkdtemp(prefix='report008-', dir=ROOT / 'local.scratch'))
        (self.base / 'contract.json').write_text('{"neutral":true}\n')
        (self.base / 'source.txt').write_text('Neutral existing source.\n')

    def commit(self, report, state=None):
        return policy.commit(state if state is not None else policy.initial('exploration'),
                             report, self.base, 0, study.DEFAULT)

    def test_both_failed_shapes_have_typed_field_diagnostic(self):
        for kind in ('ordinary', 'exploration'):
            report = plan(kind)
            report['evidence'] = [dict(path=p, sha256=sha(self.base / p), kind='source')
                                  for p in ('contract.json', 'source.txt')]
            report['findings'] = [dict(reference=p, observation='source observed', uncertainty='open')
                                  for p in ('contract.json', 'source.txt')]
            state = policy.initial('exploration'); before = copy.deepcopy(state)
            original = copy.deepcopy(report)
            with self.subTest(kind=kind), self.assertRaises(policy.FindingReferenceInvalid) as caught:
                self.commit(report, state)
            self.assertEqual(policy.report_diagnostic(caught.exception), dict(
                code='finding_reference_not_staged', field='findings[0].reference',
                expected=policy.FINDING_REFERENCE_RULE))
            self.assertEqual(state, before)
            self.assertEqual(report, original)

    def test_paths_ids_unknown_stale_changed_and_malformed_reject(self):
        old = hypothesis(); old_ref = reference(old)
        changed = {**old, 'claim': 'Changed neutral prediction'}
        state, _ = self.commit(plan('exploration'))
        for ref in ('source.txt', 'neutral-v0', 'f' * 64, reference(changed), None, [], {}):
            report = plan(); report['findings'] = [dict(reference=old_ref), dict(reference=ref)]
            with self.subTest(ref=ref), self.assertRaises(policy.FindingReferenceInvalid) as caught:
                self.commit(report, state)
            self.assertEqual(policy.report_diagnostic(caught.exception)['field'], 'findings[1].reference')
        # A previously computed reference absent from this exact registry is stale.
        report['findings'] = [dict(reference=old_ref)]
        with self.assertRaises(policy.FindingReferenceInvalid): self.commit(report)
        for malformed in (None, {}, 'source.txt', [None], ['source.txt']):
            report['findings'] = malformed
            with self.subTest(malformed=malformed), self.assertRaises(Invalid): self.commit(report)

    def test_existing_historic_and_same_report_version_references_succeed(self):
        state, _ = self.commit(plan('exploration'))
        parent_ref = state['portfolio']['neutral-v0']['reference']
        child = {**hypothesis(), 'id': 'neutral-v1', 'claim': 'Revised neutral prediction',
                 'parent': parent_ref, 'revision': 1}
        child_ref = reference(child)
        child['reference'] = child_ref
        report = plan(); report['hypotheses'] = [child]
        report['findings'] = [dict(reference=ref, observation='neutral', uncertainty='open')
                              for ref in (parent_ref, child_ref)]
        staged, commitment = self.commit(report, state)
        self.assertEqual(staged['portfolio']['neutral-v1']['reference'], child_ref)
        self.assertEqual(staged['portfolio']['neutral-v0']['reference'], parent_ref)
        # Researcher gate accepts both retained versions, without a latest-only filter.
        execution = {**plan(), 'findings': copy.deepcopy(report['findings']),
                     'prospective_binding': digest(commitment)}
        policy.record(staged, execution, self.base, 0, study.DEFAULT, prospective=commitment)
        bad = copy.deepcopy(report); bad['hypotheses'][0]['reference'] = '0' * 64
        with self.assertRaisesRegex(Invalid, 'content hash mismatch'): self.commit(bad, state)

    def test_empty_findings_valid_for_ordinary_and_exploration(self):
        for kind in ('ordinary', 'exploration'):
            staged, commitment = self.commit(plan(kind))
            self.assertEqual(commitment['work_kind'], kind)
            self.assertEqual(bool(staged['portfolio']), kind == 'exploration')

    def test_actual_rendered_prompts_define_hypothesis_namespace(self):
        for mode in ('baseline', 'exploration'):
            for role in ('proposer', 'researcher'):
                req = policy.request(policy.initial(mode), 0, study.DEFAULT, role)
                instructions = policy.prompt(req).split('\nREQUEST:\n')[0]
                for text in ('findings[i].reference', 'HYPOTHESIS CONTENT REFERENCE',
                             'NOT a source filename, ordinary hypothesis id or arbitrary hash',
                             'request.portfolio', 'commitment.selected_reference',
                             'Known retained historic/version references remain valid',
                             'staged before explicit findings', 'findings:[]',
                             'controller computes references', 'Ordinary work requires no artificial hypothesis',
                             'ensure_ascii=false', 'status, reason and evidence are not hashed'):
                    with self.subTest(mode=mode, role=role, text=text): self.assertIn(text, instructions)

    def test_external_role_own_repair_has_one_new_charged_id_and_no_early_research(self):
        # Deterministic external-role boundary, like existing pure repair fixtures.
        # Each call is charged here; no worker, model or campaign is launched.
        for kind in ('ordinary', 'exploration'):
            base = self.base / kind; base.mkdir()
            original = plan(kind)
            original['findings'] = [dict(reference='source.txt', observation='neutral', uncertainty='open')]
            corrected = copy.deepcopy(original); corrected['findings'] = []
            receipts = {}; hashes = {}; calls = []; charged = []
            arm = SimpleNamespace(root=base, p=study.DEFAULT)
            def external_role(key, role, req, workspace=None, readonly=False):
                if role == 'researcher':
                    self.assertTrue((base / 'jobs/plan-repair-1/validated-plan.json').exists())
                    self.assertEqual(req['commitment']['work_kind'], kind)
                    calls.append((key, role, copy.deepcopy(req))); return dict(outcome='completed')
                self.assertTrue(readonly)
                self.assertFalse(any(r == 'researcher' for _, r, _ in calls))
                payload = copy.deepcopy(original if key == 'plan' else corrected)
                if key != 'plan':
                    feedback = req['repair']
                    self.assertEqual(feedback['previous_payload'], original)
                    self.assertEqual(feedback['diagnostic']['field'], 'findings[0].reference')
                    self.assertEqual(feedback['diagnostic']['code'], 'finding_reference_not_staged')
                    self.assertEqual(feedback['receipt_hash'], digest(receipts['plan']))
                    self.assertEqual(feedback['invalid_receipt_sha256'], sha(base / 'jobs/plan/invalid-plan.json'))
                calls.append((key, role, copy.deepcopy(req))); charged.append(study.DEFAULT['call_seconds'])
                receipt = dict(outcome='completed', payload=payload, request_id=key, role=role,
                               transport='synthetic-external-role', elapsed_seconds=0)
                job = base / 'jobs' / key
                write(job / 'final.json', dict(payload_json=payload)); write(job / 'receipt.json', receipt)
                receipts[key] = copy.deepcopy(receipt)
                hashes[key] = (sha(job / 'final.json'), sha(job / 'receipt.json'))
                return receipt
            arm.call = external_role
            staged, commitment = study.Arm.plan_with_repair(arm, 'plan', {}, policy.initial('exploration'),
                                                           base, 0, study.DEFAULT)
            self.assertEqual([k for k, _, _ in calls], ['plan', 'plan-repair-1'])
            self.assertEqual(charged, [study.DEFAULT['call_seconds']] * 2)
            self.assertEqual(study.DEFAULT['proposal_repairs'], 1)
            invalid = base / 'jobs/plan/invalid-plan.json'; invalid_hash = sha(invalid)
            self.assertEqual(read(invalid)['diagnostic'], calls[1][2]['repair']['diagnostic'])
            self.assertEqual(read(base / 'jobs/plan/receipt.json')['payload'], original)
            self.assertEqual(read(base / 'jobs/plan-repair-1/receipt.json')['payload'], corrected)
            self.assertEqual(commitment['work_kind'], kind)
            req = policy.request(staged, 0, study.DEFAULT)
            req.update(commitment=commitment, committed_trial=commitment['trial'], prospective_binding=digest(commitment))
            external_role('research', 'researcher', req)
            for key, expected in hashes.items():
                self.assertEqual(expected, (sha(base / 'jobs' / key / 'final.json'), sha(base / 'jobs' / key / 'receipt.json')))
            self.assertEqual(sha(invalid), invalid_hash)

    def test_unclassified_errors_keep_generic_safe_feedback(self):
        self.assertIsNone(policy.report_diagnostic(Invalid('PRIVATE evaluator text')))
        arm = SimpleNamespace(root=self.base, p=study.DEFAULT)
        calls = []
        def call(key, role, req, *args):
            calls.append(copy.deepcopy(req))
            return dict(outcome='completed', payload={'agenda': False} if len(calls) == 1 else plan())
        arm.call = call
        study.Arm.plan_with_repair(arm, 'generic', {}, policy.initial('exploration'), self.base, 0, study.DEFAULT)
        self.assertNotIn('diagnostic', calls[1]['repair'])
        self.assertEqual(calls[1]['repair']['error'],
            'Invalid plan schema, identity, artifact binding or prospective commitment. Correct your own retained payload; no action executed.')


if __name__ == '__main__':
    unittest.main()
