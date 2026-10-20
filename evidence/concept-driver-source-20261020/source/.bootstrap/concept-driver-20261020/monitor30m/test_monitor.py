"""Scheduler state fixtures only. No actual queue, model, research or timer."""
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from types import SimpleNamespace
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('concept_monitor',Path(__file__).with_name('monitor30m.py'))
monitor = importlib.util.module_from_spec(spec);spec.loader.exec_module(monitor)


TEST_THREAD='00000000-0000-4000-8000-000000000001'


class MonitorFixtures(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='math-gkm-concept-monitor-')
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name).resolve()
        p = patch.object(monitor,'BASE',self.base);p.start();self.addCleanup(p.stop)

    def state(self,**changes):
        value = dict({'enabled':True,'seq':0,'validation_done':True,'thread_id':TEST_THREAD},**changes)
        monitor.write(self.base/'state.json',value)
        return value

    def run_args(self,*args):
        with patch('sys.argv',['monitor30m.py',*args]),contextlib.redirect_stdout(io.StringIO()):monitor.main()

    def read(self):return json.loads((self.base/'state.json').read_text())

    def test_missing_state_defaults_disabled_without_queue(self):
        with patch.object(monitor.subprocess,'Popen') as process:self.run_args('--tick')
        process.assert_not_called()

    def test_explicit_stop_or_disabled_state_suppresses_queue(self):
        self.state(enabled=False)
        with patch.object(monitor.subprocess,'Popen') as process:self.run_args('--tick')
        process.assert_not_called()
        self.state();(self.base/'STOP').write_text('prepared only')
        with patch.object(monitor.subprocess,'Popen') as process:self.run_args('--tick')
        process.assert_not_called()

    def test_pending_tick_is_not_reset_or_resent(self):
        pending = {'seq':3,'kind':'monitor','phase':'queued_or_delivery_uncertain'}
        self.state(seq=3,pending=pending)
        with patch.object(monitor.subprocess,'Popen') as process:self.run_args('--tick')
        process.assert_not_called();self.assertEqual(self.read()['pending'],pending)

    def test_missing_or_invalid_local_thread_is_rejected_before_enqueue(self):
        for value in (None,'','new-thread','00000000-0000-4000-8000-000000000001 extra',
                      '00000000-0000-4000-8000-00000000000G'):
            self.state(thread_id=value)
            with patch.object(monitor.subprocess,'Popen') as process:
                with self.assertRaisesRegex(ValueError,'existing thread UUID'):self.run_args('--tick')
            process.assert_not_called()
            self.assertNotIn('pending',self.read())

    def test_queue_targets_existing_conversation_and_new_paths(self):
        self.state()
        child = SimpleNamespace(pid=12345,wait=lambda **kwargs:0)
        with patch.object(monitor.subprocess,'Popen',return_value=child) as process:self.run_args('--tick')
        argv = process.call_args.args[0]
        self.assertEqual(argv[:4],[monitor.CODEX,'queue','--thread',TEST_THREAD])
        self.assertIn('GKM-CONCEPT-20261020 scheduled monitor',argv[-1])
        self.assertIn(str(self.base/'MONITOR_INSTRUCTIONS.md'),argv[-1])
        self.assertIn(str(self.base/'monitor30m.py'),argv[-1])
        self.assertEqual(process.call_args.kwargs['cwd'],monitor.ROOT)
        self.assertEqual(self.read()['pending']['seq'],1)

    def test_ack_and_done_are_distinct_and_terminal_disables_only_scheduler(self):
        self.state(seq=1,pending={'seq':1,'kind':'monitor','phase':'queued_or_delivery_uncertain'})
        with patch.object(monitor.subprocess,'Popen') as process:
            with self.assertRaises(ValueError):self.run_args('--done','1')
            self.run_args('--ack','1')
            self.assertEqual(self.read()['pending']['phase'],'running')
            self.run_args('--done','1','--terminal')
            self.assertFalse(self.read()['enabled'])
            self.assertNotIn('pending',self.read())
        process.assert_not_called()

    def test_validation_done_requires_actual_ack_callback(self):
        self.state(validation_done=False)
        with patch.object(monitor.subprocess,'Popen') as process:self.run_args('--tick')
        process.assert_not_called()
        self.state(seq=1,validation_done=False,pending={'seq':1,'kind':'validation','phase':'queued_or_delivery_uncertain'})
        self.run_args('--ack','1');self.run_args('--done','1')
        self.assertTrue(self.read()['validation_done'])

    def test_uncertain_queue_attempt_does_not_trigger_resend(self):
        self.state()
        child = SimpleNamespace(pid=12345,wait=lambda **kwargs:7)
        with patch.object(monitor.subprocess,'Popen',return_value=child) as process:
            self.run_args('--tick');self.run_args('--tick')
        self.assertEqual(process.call_count,1)
        self.assertEqual(self.read()['pending']['queue_outcome'],'queue_failed_or_uncertain')

    def test_queue_return_preserves_concurrent_ack_done(self):
        self.state()
        def wait(**kwargs):
            value = self.read()
            completed = value.pop('pending');completed.update(phase='running',done_at=1)
            value['last_completed'] = completed;monitor.write(self.base/'state.json',value)
            return 0
        child = SimpleNamespace(pid=12345,wait=wait)
        with patch.object(monitor.subprocess,'Popen',return_value=child):self.run_args('--tick')
        value = self.read()
        self.assertNotIn('pending',value)
        self.assertEqual(value['last_completed']['seq'],1)
        self.assertEqual(value['last_completed']['queue_exit_code'],0)


if __name__ == '__main__':
    result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(MonitorFixtures))
    import hashlib
    directory = Path(__file__).resolve().parent
    (directory/'TEST_RESULT.json').write_text(json.dumps({
        'passed':result.wasSuccessful(),'tests_run':result.testsRun,
        'helper_sha256':hashlib.sha256((directory/'monitor30m.py').read_bytes()).hexdigest(),
        'tests_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'actual_queue_calls':0,'scope':'synthetic scheduler fixtures; no installation or delivery claimed'},sort_keys=True)+'\n')
    raise SystemExit(0 if result.wasSuccessful() else 1)
