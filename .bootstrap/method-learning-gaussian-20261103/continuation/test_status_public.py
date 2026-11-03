"""Synthetic public-pointer controls; no native study data or processes."""
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[1]/'status_public.py'
spec = importlib.util.spec_from_file_location('goal_status_under_test', SOURCE)
status = importlib.util.module_from_spec(spec); spec.loader.exec_module(status)

class PublicPointer(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='gkm-public-pointer-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.old_root, self.old_study = status.ROOT, status.STUDY
        status.ROOT = self.root
        status.STUDY = self.root/'.scratch/studies/method-learning-gaussian-20261103'
        self.addCleanup(self.restore)
        self.base = self.root/'.bootstrap/method-learning-gaussian-20261103/continuation'
        self.base.mkdir(parents=True)
        for name in ('owner.py', 'epoch.py'):
            (self.base/name).write_text('pass\n')
        self.qualified = {'schema': 'math-gkm.gaussian-goal-qualified.v1',
            'owner_source_sha256': self.digest(self.base/'owner.py'),
            'epoch_source_sha256': self.digest(self.base/'epoch.py'), 'contract_sha256': 'a'*64}
        self.current = {'schema': 'math-gkm.gaussian-goal-current.v1',
            'current_study': str(self.root/'.scratch/studies/method-learning-gaussian-20261103-epoch-0001'),
            'epoch': 1, 'phase': 'research_running', 'root_proved': False,
            'owner_source_sha256': self.qualified['owner_source_sha256'], 'contract_sha256': 'a'*64}

    def restore(self):
        status.ROOT, status.STUDY = self.old_root, self.old_study

    def digest(self, path):
        return hashlib.sha256(path.read_bytes()).hexdigest()

    def publish(self):
        for name, value in [('QUALIFIED.json', self.qualified), ('CURRENT.json', self.current)]:
            (self.base/name).write_text(json.dumps(value))

    def test_initial_before_owner_has_no_pointer(self):
        target, owner = status.selected_study()
        self.assertEqual(target, status.STUDY); self.assertIsNone(owner)

    def test_qualified_successor_is_selected(self):
        self.publish(); target, owner = status.selected_study()
        self.assertEqual(str(target), self.current['current_study'])
        self.assertEqual(owner['epoch'], 1); self.assertFalse(owner['root_proved'])

    def test_other_campaign_or_external_study_is_refused(self):
        for target in [self.root/'.scratch/studies/markov-old', self.root/'outside/gaussian']:
            self.current['current_study'] = str(target); self.publish()
            with self.assertRaises(RuntimeError): status.selected_study()

    def test_changed_owner_source_is_refused(self):
        self.publish(); (self.base/'owner.py').write_text('pass # changed\n')
        with self.assertRaises(RuntimeError): status.selected_study()

    def test_changed_migration_source_is_refused(self):
        self.publish(); (self.base/'epoch.py').write_text('pass # changed\n')
        with self.assertRaises(RuntimeError): status.selected_study()

    def test_other_contract_or_unqualified_pointer_is_refused(self):
        self.current['contract_sha256'] = 'b'*64; self.publish()
        with self.assertRaises(RuntimeError): status.selected_study()
        (self.base/'QUALIFIED.json').unlink()
        with self.assertRaises(RuntimeError): status.selected_study()

    def test_invalid_epoch_is_refused(self):
        for value in [True, -1, None, '1']:
            self.current['epoch'] = value; self.publish()
            with self.assertRaises(RuntimeError): status.selected_study()

    def test_symlinked_metadata_is_refused(self):
        self.publish(); pointer = self.base/'CURRENT.json'; target = self.base/'elsewhere.json'
        pointer.rename(target); pointer.symlink_to(target)
        with self.assertRaises(RuntimeError): status.selected_study()

if __name__ == '__main__': unittest.main()
