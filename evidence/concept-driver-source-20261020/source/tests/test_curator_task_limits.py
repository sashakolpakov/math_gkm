"""Size-only independent curator controls. No model or proof execution."""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import study_curate as curator
from machinery.study_common import Invalid, read, write


class CuratorTaskLimits(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='math-gkm-curator-size-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.limits = {'holdout':2,'regression':1}

    def test_absence_preserves_unrestricted_legacy_selection(self):
        self.assertIsNone(curator.validate_task_limits(None))
        self.assertEqual(curator.task_limits_prompt(None),'')
        curator.check_task_limits({'tasks':[{'kind':'holdout'}]*20},None)

    def test_limits_require_exact_bounded_integer_counts(self):
        for value in ({}, {'holdout':2}, {'holdout':2,'regression':1,'other':0},
                      {'holdout':True,'regression':1}, {'holdout':-1,'regression':1},
                      {'holdout':17,'regression':1}, {'holdout':0,'regression':0}, []):
            with self.subTest(value=value),self.assertRaises(Invalid):curator.validate_task_limits(value)
        value = curator.validate_task_limits(self.limits)
        self.assertEqual(value,self.limits)
        self.assertIsNot(value,self.limits)

    def test_prompt_limits_size_without_selecting_mathematics(self):
        prompt = curator.task_limits_prompt(self.limits)
        self.assertIn('at most 2 holdout',prompt)
        self.assertIn('at most 1 regression',prompt)
        self.assertIn('Select the mathematics independently',prompt)
        self.assertIn('upper bounds, not quotas',prompt)
        self.assertIn('empty suite',prompt)
        self.assertIn('never truncated',prompt)
        self.assertNotIn('MathGKM',prompt)

    def test_acceptable_and_empty_suites_are_not_modified(self):
        for tasks in ([],[{'kind':'holdout'}]*2+[{'kind':'regression'}]):
            suite = {'tasks':tasks}
            before = copy.deepcopy(suite)
            curator.check_task_limits(suite,self.limits)
            self.assertEqual(suite,before)

    def test_each_excess_is_rejected_as_a_whole_without_truncation(self):
        for tasks in ([{'kind':'holdout'}]*3,[{'kind':'regression'}]*2):
            suite = {'tasks':tasks}; before = copy.deepcopy(suite)
            with self.assertRaisesRegex(Invalid,'never truncated'):curator.check_task_limits(suite,self.limits)
            self.assertEqual(suite,before)

    def test_invalid_limits_fail_before_creating_job_or_directory(self):
        directory = self.root/'never-created'
        with self.assertRaises(Invalid):
            curator.curate(directory,'fixture',1,task_limits={'holdout':True,'regression':1})
        self.assertFalse(directory.exists())

    def fake_run(self, directory, suite):
        def run(*args,**kwargs):
            self.assertIn('at most 2 holdout',(directory/'job/prompt.txt').read_text())
            self.assertEqual(read(directory/'job/request.json')['task_limits'],self.limits)
            write(directory/'job/receipt.json',{
                'outcome':'completed','payload':{'suite':suite},'elapsed_seconds':0,
                'usage_raw':{},'model':'gpt-6.1-sol','reasoning_effort':'high'})
            return {'returncode':0,'termination':None,'fixture_only':True}
        return run

    def synthetic_curate(self, tasks):
        for name in ('Fixture','ResearchSemantics','ContinuationObligations'):
            p = self.root/'MathGKM'/(name+'.lean');p.parent.mkdir(exist_ok=True)
            p.write_text('-- neutral orchestration fixture; never compiled\n')
        contract = {'root_file':'MathGKM/Fixture.lean','seed_sources':[]}
        directory = self.root/'curator'
        suite = {'tasks':tasks}
        with patch.object(curator,'ROOT',self.root),patch.object(curator,'SEED',()), \
             patch.object(curator,'copy_seed',side_effect=lambda seed,ws:ws.mkdir()), \
             patch.object(curator,'validate_suite') as validator, \
             patch('machinery.process.run',side_effect=self.fake_run(directory,suite)) as process:
            try:
                result = curator.curate(directory,'fixture',1,contract,task_limits=self.limits)
                return result,directory,process.call_count,validator.call_count
            except Invalid:
                self.assertEqual(process.call_count,1)
                self.assertEqual(validator.call_count,1)
                raise

    def test_limits_enter_prompt_before_call_and_provenance_after_selection(self):
        result,directory,calls,validation_calls = self.synthetic_curate(
            [{'kind':'holdout'},{'kind':'regression'}])
        self.assertEqual(calls,1);self.assertEqual(validation_calls,1)
        self.assertEqual(read(result['provenance'])['task_limits'],self.limits)
        self.assertEqual(read(result['suite'])['tasks'],[{'kind':'holdout'},{'kind':'regression'}])

    def test_overfull_raw_selection_is_preserved_and_not_frozen(self):
        with self.assertRaisesRegex(Invalid,'never truncated'):
            self.synthetic_curate([{'kind':'holdout'}]*3)
        directory = self.root/'curator'
        self.assertEqual(len(read(directory/'job/receipt.json')['payload']['suite']['tasks']),3)
        self.assertFalse((directory/'suite.json').exists())
        self.assertFalse((directory/'provenance.json').exists())


if __name__ == '__main__':unittest.main()
