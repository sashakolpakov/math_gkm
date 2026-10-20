"""Narrow exit-race regressions; no models, Lean, or host-cap changes.

The actual-child case terminates only a subprocess created by this test. Other
cases explicitly simulate ownership/query observations and intercept hold writes.
"""
from contextlib import ExitStack
import os
from pathlib import Path
import subprocess
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from machinery import resources
from machinery.study_common import ROOT, PYTHON


class ResourceExitRaceTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='resource-exit-race-', dir=ROOT/'.scratch')
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        self.stack = ExitStack(); self.addCleanup(self.stack.close)
        for name, value in [('darwin_profile', True), ('disk_bytes', 0),
                ('memory_observation', {'os_free_percent': 80,
                    'linux_mem_available_bytes': 16*resources.GiB})]:
            self.stack.enter_context(patch.object(resources, name, return_value=value))
        self.stack.enter_context(patch.object(resources.shutil, 'disk_usage',
                                              return_value=SimpleNamespace(free=16*resources.GiB)))
        self.hold = self.stack.enter_context(patch.object(resources, 'cleanup_hold'))

    def simulated(self, owned=None):
        owned = owned or {101: 'first-birth'}
        table = {pid: {'ppid': 1, 'rss': 1024**2, 'command': 'python'} for pid in owned}
        self.stack.enter_context(patch.object(resources, 'process_table', return_value=table))
        self.stack.enter_context(patch.object(resources, 'current_process',
            side_effect=lambda pid: {'identity': owned[pid], 'ppid': 1} if pid in owned else None))
        guard = resources.Guard(101, self.base)
        guard.owned = dict(owned)
        return guard

    def test_actual_owned_child_exits_after_enumeration_before_native_query(self):
        child = subprocess.Popen([PYTHON, '-c', 'import sys; sys.stdin.buffer.read(1)'],
                                 stdin=subprocess.PIPE, stdout=subprocess.DEVNULL,
                                 stderr=subprocess.DEVNULL, start_new_session=True)
        try:
            birth = resources.current_process(child.pid)['identity']
            table = {child.pid: {'ppid': os.getpid(), 'rss': 1024**2, 'command': 'python'}}
            strict_query = resources.native_footprint
            queried = []
            def exit_at_query(pid, expected_birth):
                queried.append((pid, expected_birth))
                self.assertIsNone(child.poll())
                child.stdin.close()
                child.wait(timeout=3)
                # Keep the strict public query unchanged; it must reject gone
                # identities. Only Guard's independent recheck can accept exit.
                return strict_query(pid, expected_birth)
            with patch.object(resources, 'process_table', return_value=table), \
                    patch.object(resources, 'native_footprint', side_effect=exit_at_query):
                guard = resources.Guard(child.pid, self.base)
                guard.check(force=True)
            self.assertEqual(queried, [(child.pid, birth)])
            self.assertEqual(guard.samples[-1]['native_birth_owned'], [])
            self.assertEqual(guard.samples[-1]['rss_sum'], 1024**2)
            self.assertEqual(guard.samples[-1]['owned_processes'], 1)
            self.assertEqual(guard.samples[-1]['charged_phys_footprint'], 0)
            self.hold.assert_not_called()
        finally:
            if child.poll() is None:
                child.kill()
            child.wait(timeout=3)
            if child.stdin and not child.stdin.closed:
                child.stdin.close()

    def test_live_same_birth_query_error_still_fails_and_records_hold(self):
        guard = self.simulated()
        with patch.object(resources, 'native_footprint', side_effect=resources.ResourceFailure(
                'monitor_unavailable: live native query failed')), \
                patch.object(resources, 'process_status', return_value={
                    'identity': 'first-birth', 'ppid': 1, 'zombie': False}):
            with self.assertRaisesRegex(resources.ResourceFailure, 'live native query failed'):
                guard.check(force=True)
        self.hold.assert_called_once()

    def test_reused_pid_live_or_zombie_is_not_treated_as_original_exit(self):
        for zombie in (False, True):
            guard = self.simulated()
            self.hold.reset_mock()
            with patch.object(resources, 'native_footprint', side_effect=resources.ResourceFailure(
                    'monitor_unavailable: footprint birth after query')), \
                    patch.object(resources, 'process_status', return_value={
                        'identity': 'different-birth', 'ppid': 1, 'zombie': zombie}):
                with self.subTest(zombie=zombie), self.assertRaisesRegex(
                        resources.ResourceFailure, 'footprint birth after query'):
                    guard.check(force=True)
            self.hold.assert_called_once()

    def test_same_birth_zombie_is_permitted_with_conservative_stale_counts(self):
        guard = self.simulated()
        with patch.object(resources, 'native_footprint', side_effect=resources.ResourceFailure(
                'monitor_unavailable: footprint birth before query')), \
                patch.object(resources, 'process_status', return_value={
                    'identity': 'first-birth', 'ppid': 1, 'zombie': True}):
            guard.check(force=True)
        self.hold.assert_not_called()
        sample = guard.samples[-1]
        self.assertEqual(sample['charged_phys_footprint'], 0)
        self.assertEqual(sample['rss_sum'], 1024**2)
        self.assertEqual(sample['owned_processes'], 1)

    def test_independent_status_permission_or_monitor_failure_remains_fatal(self):
        for failure in (PermissionError('BSD access denied'),
                        resources.ResourceFailure('monitor_unavailable: BSD query failed')):
            guard = self.simulated()
            self.hold.reset_mock()
            with patch.object(resources, 'native_footprint', side_effect=resources.ResourceFailure(
                    'monitor_unavailable: native query failed')), \
                    patch.object(resources, 'process_status', side_effect=failure):
                with self.subTest(error=type(failure).__name__), self.assertRaises(resources.ResourceFailure):
                    guard.check(force=True)
            self.hold.assert_called_once()

    def test_one_exit_does_not_hide_another_live_owned_failure(self):
        guard = self.simulated({101: 'first-birth', 102: 'second-birth'})
        with patch.object(resources, 'native_footprint', side_effect=resources.ResourceFailure(
                'monitor_unavailable: independently sampled query failure')) as metric, \
                patch.object(resources, 'process_status', side_effect=lambda pid: None if pid == 101 else {
                    'identity': 'second-birth', 'ppid': 1, 'zombie': False}):
            with self.assertRaisesRegex(resources.ResourceFailure, 'sampled query failure'):
                guard.check(force=True)
        self.assertEqual([call.args[0] for call in metric.call_args_list], [101, 102])
        self.hold.assert_called_once()

    def test_exited_identity_does_not_exclude_another_live_owned_charge(self):
        guard = self.simulated({101: 'first-birth', 102: 'second-birth'})
        def query(pid, birth):
            if pid == 101:
                raise resources.ResourceFailure('monitor_unavailable: exited query')
            return {'pid': pid, 'birth': birth, 'phys_footprint_bytes': 6*resources.GiB,
                    'resident_bytes': 1024**2, 'start_abstime': 1}
        with patch.object(resources, 'native_footprint', side_effect=query), \
                patch.object(resources, 'process_status', return_value=None):
            with self.assertRaisesRegex(resources.ResourceFailure, 'footprint_hard'):
                guard.check(force=True)
        self.assertEqual(guard.samples[-1]['charged_phys_footprint'], 6*resources.GiB)
        self.assertEqual(guard.samples[-1]['owned_processes'], 2)
        # A real limit violation remains fatal; it is not an unavailable monitor.
        self.hold.assert_not_called()

    def test_unrelated_process_is_never_queried_or_silenced_by_exit_rule(self):
        guard = self.simulated()
        table = {101: {'ppid': 1, 'rss': 1024**2, 'command': 'python'},
                 999: {'ppid': 998, 'rss': 6*resources.GiB, 'command': 'unrelated'}}
        with patch.object(resources, 'process_table', return_value=table), \
                patch.object(resources, 'native_footprint', side_effect=resources.ResourceFailure(
                    'monitor_unavailable: own gone')) as query, \
                patch.object(resources, 'process_status', return_value=None):
            guard.check(force=True)
        self.assertEqual([call.args[0] for call in query.call_args_list], [101])
        self.assertNotIn(999, guard.owned)
        self.assertEqual(guard.samples[-1]['owned_processes'], 1)
        self.hold.assert_not_called()

    def test_strict_native_query_public_api_still_rejects_absent_birth(self):
        with patch.object(resources, 'current_process', return_value=None):
            with self.assertRaisesRegex(resources.ResourceFailure, 'footprint birth before query'):
                resources.native_footprint(101, 'first-birth')


if __name__ == '__main__':
    unittest.main()
