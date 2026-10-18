"""Neutral report-interface repair checks; no live roles or campaign inputs."""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import study, study_policy
from machinery.study_common import ROOT, Invalid, digest, lock, read, sha, write
from tests import test_revision_static_checkpoint as neutral


class RoleReportContract(unittest.TestCase):
    def setUp(self):
        self.base = Path(tempfile.mkdtemp(prefix='role-report-repair-', dir=ROOT / '.scratch'))
        print('RETAINED', self.base, flush=True)
        (self.base / 'artifact.txt').write_text('Neutral existing producer.\n')
        (self.base / 'consumer.txt').write_text('Neutral existing consumer; reuse still unverified.\n')

    def test_role_specific_schemas_and_explicit_artifact_contract(self):
        for mode in ('baseline', 'exploration'):
            for role in ('proposer', 'researcher', 'reviewer', 'selector'):
                with self.subTest(mode=mode, role=role):
                    req = study_policy.request(study_policy.initial(mode), 0, study.DEFAULT, role)
                    instructions = study_policy.prompt(req).split('\nREQUEST:\n')[0]
                    self.assertIn(role.capitalize() + ' payload:', instructions)
                    for other in {'proposer', 'researcher', 'reviewer', 'selector'} - {role}:
                        self.assertNotIn(other.capitalize() + ' payload:', instructions)
                    if role in ('proposer', 'researcher'):
                        self.assertIn('Both artifact and consumer must name files that already exist', instructions)
                        self.assertIn('never intended future reuse', instructions)
                        self.assertIn('reported_use_pending_checked_interface', instructions)
                        self.assertIn('not evidence or use_links', instructions)
                    if role == 'proposer':
                        self.assertIn('Use use_links:[]', instructions)
                        self.assertNotIn('prospective_binding:request.prospective_binding', instructions)
                        self.assertNotIn('mathematical_claims:[]', instructions)
                    if role == 'researcher':
                        self.assertIn('prospective_binding:request.prospective_binding', instructions)
                        self.assertIn('fiber_gluings:[]', instructions)

    def test_future_work_survives_commit_and_request_without_reuse_credit(self):
        for mode in ('baseline', 'exploration'):
            with self.subTest(mode=mode):
                report = neutral.plan()
                report['agenda'] = ['Plan future.txt and later-consumer.txt for a bounded test']
                report['summary'] = 'Intend to try future.txt in later-consumer.txt; neither exists.'
                report['hypotheses'][0]['claim'] = 'future.txt might support later-consumer.txt'
                state = study_policy.initial(mode)
                before = copy.deepcopy(state)
                staged, commitment = study_policy.commit(state, report, self.base, 0, study.DEFAULT)
                self.assertEqual(state, before)
                req = study_policy.request(staged, 0, study.DEFAULT)
                self.assertEqual(req['agenda'], report['agenda'])
                self.assertEqual(req['observations'][-1]['summary'], report['summary'])
                self.assertEqual(commitment['selected']['claim'], report['hypotheses'][0]['claim'])
                self.assertEqual(req['delayed_use_links'], [])
                self.assertFalse((self.base / 'future.txt').exists())
                self.assertFalse((self.base / 'later-consumer.txt').exists())
                result = {**report, 'prospective_binding': digest(commitment)}
                study_policy.record(staged, result, self.base, 0, study.DEFAULT, prospective=commitment)
                self.assertEqual(staged['use_links'], [])

    def test_existing_links_stay_unverified_in_both_plan_and_execution(self):
        for mode in ('baseline', 'exploration'):
            report = neutral.plan()
            report['use_links'] = [{'artifact': 'artifact.txt', 'consumer': 'consumer.txt',
                                    'claim': 'Reported neutral reuse, not checked'}]
            staged, commitment = study_policy.commit(study_policy.initial(mode), report, self.base, 0, study.DEFAULT)
            study_policy.record(staged, {**report, 'prospective_binding': digest(commitment)},
                                self.base, 0, study.DEFAULT, prospective=commitment)
            self.assertEqual(len(staged['use_links']), 2)
            self.assertTrue(all(x['status'] == 'reported_use_pending_checked_interface'
                                for x in staged['use_links']))
            self.assertEqual(staged['knowledge'], {})

    def test_missing_endpoints_rejected_at_both_gates_without_committing_state(self):
        for mode in ('baseline', 'exploration'):
            state = study_policy.initial(mode)
            staged, commitment = study_policy.commit(state, neutral.plan(), self.base, 0, study.DEFAULT)
            for field in ('artifact', 'consumer', 'both'):
                with self.subTest(mode=mode, missing=field):
                    report = neutral.plan()
                    link = {'artifact': 'artifact.txt', 'consumer': 'consumer.txt', 'claim': 'future intention'}
                    for key in ('artifact', 'consumer') if field == 'both' else (field,):
                        link[key] = 'missing-' + key + '.txt'
                    report['use_links'] = [link]
                    original = copy.deepcopy(state)
                    with self.assertRaisesRegex(Invalid, 'missing artifact-use endpoint'):
                        study_policy.commit(state, report, self.base, 0, study.DEFAULT)
                    self.assertEqual(state, original)
                    with self.assertRaisesRegex(Invalid, 'missing artifact-use endpoint'):
                        study_policy.record(copy.deepcopy(staged), {**report, 'prospective_binding': digest(commitment)},
                                            self.base, 0, study.DEFAULT, prospective=commitment)

    def test_unsafe_directory_and_malformed_links_still_rejected(self):
        (self.base / 'directory').mkdir()
        (self.base / 'alias.txt').symlink_to(self.base / 'artifact.txt')
        for endpoint in ('../artifact.txt', str(self.base / 'artifact.txt'), 'directory', 'alias.txt'):
            for field in ('artifact', 'consumer'):
                report = neutral.plan()
                link = {'artifact': 'artifact.txt', 'consumer': 'consumer.txt', 'claim': 'neutral'}
                link[field] = endpoint
                report['use_links'] = [link]
                with self.subTest(endpoint=endpoint, field=field), self.assertRaises(Invalid):
                    study_policy.commit(study_policy.initial('baseline'), report, self.base, 0, study.DEFAULT)
        for extra in ({'status': 'checked'}, {'intended': True}):
            report['use_links'] = [{'artifact': 'artifact.txt', 'consumer': 'consumer.txt', 'claim': 'neutral', **extra}]
            with self.assertRaisesRegex(Invalid, 'invalid use link'):
                study_policy.commit(study_policy.initial('baseline'), report, self.base, 0, study.DEFAULT)

    def test_intentions_cannot_become_evidence_or_checked_facts(self):
        cases = [({'path': 'future.txt', 'sha256': '0' * 64, 'kind': 'experiment'}, 'evidence path/hash mismatch'),
                 ({'path': 'artifact.txt', 'sha256': '0' * 64, 'kind': 'experiment'}, 'evidence path/hash mismatch'),
                 ({'path': 'artifact.txt', 'sha256': sha(self.base / 'artifact.txt'), 'kind': 'theorem'},
                  'reports cannot self-certify a theorem')]
        for evidence, diagnostic in cases:
            report = neutral.plan()
            report['evidence'] = [evidence]
            with self.assertRaisesRegex(Invalid, diagnostic):
                study_policy.commit(study_policy.initial('exploration'), report, self.base, 0, study.DEFAULT)
        report = neutral.plan()
        report['hypotheses'][0]['evidence'] = ['future.txt']
        with self.assertRaisesRegex(Invalid, 'hypothesis evidence not bound to actual artifacts'):
            study_policy.commit(study_policy.initial('exploration'), report, self.base, 0, study.DEFAULT)

    def test_cached_invalid_plan_is_not_repaired_replayed_or_recharged(self):
        directory = self.base / 'study'
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(directory, {'rounds': 2}, contract=neutral.neutral_contract())
        with lock(directory / 'controller.lock') as fd:
            arm = study.Arm(directory, 'baseline', fd)
            key = 'plan-0000'
            req = study_policy.request(arm.s['research'], 0, arm.p, 'proposer')
            report = neutral.plan()
            report['use_links'] = [{'artifact': 'future.txt', 'consumer': 'later.txt', 'claim': 'intended'}]
            # Initial synthetic receipt, never a rewrite of an existing receipt.
            receipt = {'outcome': 'completed', 'payload': report, 'elapsed_seconds': 1,
                       'request_id': key, 'role': 'proposer', 'transport': 'fixture',
                       'classification': 'SYNTHETIC cached rejection fixture'}
            job = arm.root / 'jobs' / key
            arm.reserve('call-' + key, arm.p['call_seconds'])
            arm.s['calls'] += 1
            arm.s['meta_calls'] += 1
            arm.s.setdefault('counted_jobs', []).append(key)
            write(job / 'request.json', {**req, 'request_id': key,
                  'model': arm.p['model'], 'reasoning_effort': study.REASONING_EFFORT})
            write(job / 'receipt.json', receipt)
            arm.consume(job, receipt)
            before = {k: copy.deepcopy(arm.s.get(k)) for k in
                      ('calls', 'meta_calls', 'seconds', 'reservations', 'budget_pools', 'receipts', 'receipt_hashes')}
            hashed = sha(job / 'receipt.json')
            with patch('machinery.study.subprocess.Popen', side_effect=AssertionError('must not replay')):
                for _ in range(2):
                    arm = study.Arm(directory, 'baseline', fd)
                    cached = arm.call(key, 'proposer', req, readonly=True)
                    self.assertEqual(cached, receipt)
                    with self.assertRaisesRegex(Invalid, 'missing artifact-use endpoint'):
                        study_policy.commit(arm.s['research'], cached['payload'], arm.workspace, 0, arm.p)
                    self.assertEqual(before, {k: arm.s.get(k) for k in before})
                    self.assertEqual(sha(job / 'receipt.json'), hashed)
                    self.assertFalse((job / 'validated-plan.json').exists())


if __name__ == '__main__':
    unittest.main()
