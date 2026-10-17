"""Narrow observer acceptance regressions. Synthetic metadata is not proof admission."""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET

from machinery import study, study_burden, study_observer, study_completion
from machinery.study_common import ROOT, Invalid, read, write, lock, snapshot, digest
from tests import test_revision_static_checkpoint as neutral
from tests import test_round4 as round4


class ObserverAcceptance(unittest.TestCase):
    def setUp(self):
        self.base = Path(tempfile.mkdtemp(dir=ROOT/'.scratch', prefix='acceptance-observer-'))
        self.directory = self.base/'study'
        print('RETAINED', self.base, flush=True)
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(self.directory, {'rounds': 2}, contract=neutral.neutral_contract())

    def terminal(self, arm):
        result = round4.Round4.synthetic_resolution(self, arm)
        receipt = arm.root/'completion/synthetic/result.json'
        write(receipt, result)
        arm.s.update(resolution=result, resolution_receipt=str(receipt.relative_to(self.directory)))
        arm.save()
        study_completion.terminal(arm)

    def test_direct_resolution_is_separate_from_unmeasured_encoding(self):
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            self.terminal(arm)
        output = self.base/'report'
        study_burden.report(self.directory, output)
        terminal = next(r for r in read(output/'raw.json') if r['arm'] == 'exploration' and r['key'] == 'terminal')
        self.assertIsNotNone(terminal['resolution'])
        self.assertIsNone(terminal['direct_completion_proof_encoding_bytes'])
        self.assertIsNone(terminal['measured_witness_bytes'])
        self.assertIsNone(terminal['conditional_minimum_proof_complexity'])
        pair = read(output/'conditional-paired.json')[-1]
        self.assertEqual(pair['missing_checkpoints'], ['round-0001'])
        theory = pair['theories']['terminal']
        self.assertIsNotNone(theory['resolution'])
        self.assertEqual(theory['per_witness'], {})
        self.assertEqual(theory['conditional_portfolio_description']['unwitnessed_reference_tasks'][0]['task'], 'exact-root')
        self.assertIsNone(theory['direct_completion_proof_encoding_bytes'])
        self.assertIn('not an unresolved mathematical root', (output/'README.md').read_text())

    def test_later_and_terminal_witness_survive_gap_without_comparison_or_line(self):
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            arm.s['research']['knowledge']['route'] = {
                'id': 'route', 'kind': 'reductions', 'task': {}, 'proposal': {},
                'exports': ['Synthetic.route'], 'receipt_hash': 'synthetic-only',
                'dependencies': [], 'source_files': {}}
            arm.s['research']['remaining_obligations']['hole'] = {
                'source': 'route', 'status': 'open', 'target_constant': 'Unknown', 'context_binding': 'synthetic'}
            target = arm.root/'snapshots/round-0000'
            snapshot(arm.workspace, target, arm.s['research']['policy'], arm.admitted(arm.s['research']))
            study_observer.checkpoint(self.directory, arm.mode, 'round-0000', arm.s, target)
            self.terminal(arm)
        # Exercise missing-left and missing-right independently, including final endpoint.
        for old, new, available in [('round-0001', 'round-0000', 'round-0000'),
                                     ('round-0000', 'round-0001', 'round-0000'),
                                     ('round-0001', 'terminal', 'terminal')]:
            pair = study_burden.conditional_pair(self.directory, 'exploration', old, new)
            self.assertEqual(set(pair['theories']), {available})
            self.assertFalse(pair['comparison_available'])
            self.assertEqual(pair['per_witness_pairs'], [])
            self.assertIsNone(pair['description_change_bytes'])
            self.assertNotIn('overhead_bytes', pair)
            witness = pair['theories'][available]['per_witness']['route']
            self.assertGreater(witness['description_bytes'], 0)
            self.assertEqual(witness['unknown_proof_holes'], ['hole'])
            self.assertIsNone(witness['minimum_proof_complexity'])
        before = (arm.root/'state.json').read_bytes()
        output = self.base/'report'
        study_burden.report(self.directory, output)
        self.assertEqual(before, (arm.root/'state.json').read_bytes())
        svg = ET.parse(output/'conditional-descriptions.svg')
        ns = {'s': 'http://www.w3.org/2000/svg'}
        self.assertEqual(len(svg.findall('.//s:circle', ns)), 2)
        self.assertFalse(any(' L ' in p.attrib.get('d', '') for p in svg.findall('.//s:path', ns)))
        self.assertIn('terminal', (output/'conditional-descriptions.svg').read_text())
        for name in ('overhead.svg', 'costs.svg'):
            ET.parse(output/name)
        # A missing predecessor must not bypass validation of an available terminal.
        receipt = self.directory/read(arm.root/'observer-outbox/terminal.json')['resolution']['receipt']
        altered = copy.deepcopy(read(receipt)); altered['bundle_hash'] = 'forged'; write(receipt, altered)
        with self.assertRaises(Invalid):
            study_burden.conditional_pair(self.directory, 'exploration', 'round-0001', 'terminal')


if __name__ == '__main__':
    unittest.main()
