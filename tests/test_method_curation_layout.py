"""Generic curation-layout controls; no models, research or compilers."""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import study_curate as curator
from machinery.study_common import Invalid, read, write


class CurationLayoutTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='gkm-curation-layout-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.layout = {'method': 2, 'assessment': 1, 'final': 1}

    def tasks(self):
        return [{'id': role+str(index), 'kind': 'holdout', 'evaluation_scope': role}
                for role, count in self.layout.items() for index in range(count)]

    def run_synthetic(self, tasks, *, layout='configured', limits=None):
        """Only model execution and suite semantic validation are simulated."""
        layout = self.layout if layout == 'configured' else layout
        for name in ('Fixture', 'ResearchSemantics', 'ContinuationObligations'):
            path = self.root/'MathGKM'/(name+'.lean')
            path.parent.mkdir(exist_ok=True)
            path.write_text('-- orchestration fixture only; never compiled\n')
        directory = self.root/'curation'
        suite = {'tasks': copy.deepcopy(tasks)}
        captured = {}
        def fake_run(argv, **kwargs):
            captured.update(argv=argv, kwargs=kwargs,
                            request=read(directory/'job/request.json'),
                            prompt=(directory/'job/prompt.txt').read_text())
            write(directory/'job/receipt.json', {'role': 'curator', 'outcome': 'completed',
                'payload': {'suite': suite}, 'elapsed_seconds': 0,
                'usage_raw': {}, 'model': 'gpt-6.1-sol', 'reasoning_effort': 'high'})
            return {'returncode': 0, 'termination': None, 'synthetic_only': True}
        with patch.object(curator, 'ROOT', self.root), patch.object(curator, 'SEED', ()), \
                patch.object(curator, 'copy_seed', side_effect=lambda seed, ws: ws.mkdir()), \
                patch.object(curator, 'validate_suite') as validate, \
                patch('machinery.process.run', side_effect=fake_run) as launch:
            result = curator.curate(directory, 'fixture', 1,
                {'root_file': 'MathGKM/Fixture.lean', 'seed_sources': []},
                model='gpt-6.1-sol', task_limits=limits, layout=layout)
            self.assertEqual(launch.call_count, 1)
            self.assertEqual(validate.call_count, 1)
        return result, captured

    def test_none_retains_legacy_selection_without_a_layout_constraint(self):
        self.assertIsNone(curator.validate_layout(None))
        self.assertEqual(curator.layout_prompt(None), '')
        original = {'tasks': [{'kind': 'holdout'}]*20}
        saved = copy.deepcopy(original)
        curator.check_layout(original, None)
        self.assertEqual(original, saved)

    def test_layout_is_exact_positive_bounded_counts(self):
        examples = [[], {}, {'method': 2}, {'method': 2, 'assessment': 1, 'final': 1, 'extra': 1},
                    {'method': True, 'assessment': 1, 'final': 1},
                    {'method': 0, 'assessment': 1, 'final': 1},
                    {'method': -1, 'assessment': 1, 'final': 1},
                    {'method': 16, 'assessment': 1, 'final': 1},
                    {'method': 17, 'assessment': 1, 'final': 1}]
        for value in examples:
            with self.subTest(value=value), self.assertRaises(Invalid):
                curator.validate_layout(value)
        result = curator.validate_layout({'method': 8, 'assessment': 2, 'final': 2})
        self.assertEqual(result, {'method': 8, 'assessment': 2, 'final': 2})

    def test_prompt_only_supplies_roles_and_honest_experiment_sizing(self):
        text = curator.layout_prompt(self.layout)
        for phrase in ('2 method holdouts', '1 interim assessment holdouts',
                       '1 untouched final holdouts', 'evaluation_scope',
                       'mathematics independently', 'structurally varied',
                       'honest smaller or empty suite', 'never padded, relabeled or truncated'):
            self.assertIn(phrase, text)
        for forbidden in ('MathGKM', 'Gaussian', 'Markov', 'lemma ', 'theorem '):
            self.assertNotIn(forbidden, text)

    def test_complete_layout_keeps_the_independent_task_order_and_contents(self):
        tasks = list(reversed(self.tasks()))+[{'kind': 'regression'}]
        suite = {'tasks': tasks}; original = copy.deepcopy(suite)
        curator.check_layout(suite, self.layout)
        self.assertEqual(suite, original)

    def test_insufficient_overfull_and_misscoped_layouts_reject_intact(self):
        examples = [[], self.tasks()[:-1], self.tasks()+[self.tasks()[0]],
                    [{'kind': 'holdout'}]+self.tasks()[1:],
                    [{'kind': 'holdout', 'evaluation_scope': []}]+self.tasks()[1:],
                    [{'kind': 'holdout', 'evaluation_scope': 'wrong'}]+self.tasks()[1:],
                    self.tasks()+[{'kind': 'regression', 'evaluation_scope': 'method'}]]
        for tasks in examples:
            suite = {'tasks': tasks}; original = copy.deepcopy(suite)
            with self.subTest(tasks=tasks), self.assertRaisesRegex(Invalid, 'complete output retained'):
                curator.check_layout(suite, self.layout)
            self.assertEqual(suite, original)

    def test_invalid_or_incompatible_layout_stops_before_creating_a_directory(self):
        for index, kwargs in enumerate([{'layout': {'method': False, 'assessment': 1, 'final': 1}},
                {'layout': self.layout, 'task_limits': {'holdout': 3, 'regression': 1}}]):
            directory = self.root/str(index)
            with self.assertRaises(Invalid):
                curator.curate(directory, 'fixture', 1, **kwargs)
            self.assertFalse(directory.exists())

    def test_layout_enters_request_and_provenance_before_any_research(self):
        tasks = self.tasks()+[{'kind': 'regression'}]
        result, captured = self.run_synthetic(tasks, limits={'holdout': 4, 'regression': 1})
        self.assertEqual(captured['request']['layout'], self.layout)
        self.assertIn(curator.layout_prompt(self.layout), captured['prompt'])
        self.assertEqual(read(result['provenance'])['layout'], self.layout)
        self.assertEqual(read(result['suite'])['tasks'], tasks)
        self.assertTrue(captured['kwargs']['tree_only'])
        self.assertEqual(captured['kwargs']['scope'], self.root/'curation')

    def test_absent_layout_preserves_exact_legacy_prompt_request_and_provenance_shape(self):
        result, captured = self.run_synthetic([], layout=None)
        self.assertEqual(captured['prompt'], curator.PROMPT+'\nrequest_id=independent-curation\n')
        self.assertEqual(captured['request'], {'role': 'curator',
            'request_id': 'independent-curation', 'task_limits': None})
        self.assertEqual(set(read(result['provenance'])), {'role', 'receipt', 'model',
            'reasoning_effort', 'transport', 'task_limits', 'receipt_sha256', 'suite_sha256',
            'elapsed_seconds', 'usage_raw', 'accounting', 'independence_limit'})

    def test_honest_partial_selection_retains_raw_receipt_without_frozen_suite(self):
        tasks = self.tasks()[:-1]
        with self.assertRaisesRegex(Invalid, 'complete output retained'):
            self.run_synthetic(tasks)
        directory = self.root/'curation'
        self.assertEqual(read(directory/'job/receipt.json')['payload']['suite']['tasks'], tasks)
        self.assertFalse((directory/'suite.json').exists())
        self.assertFalse((directory/'provenance.json').exists())


if __name__ == '__main__':
    unittest.main()
