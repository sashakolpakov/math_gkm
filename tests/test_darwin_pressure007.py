"""Focused source-only repair007 selectors; supervisor executes after source audit."""
from contextlib import ExitStack
from pathlib import Path
from types import SimpleNamespace
import unittest
from unittest.mock import patch
from machinery import resources as r


class Pressure007(unittest.TestCase):
    def fixture(self, darwin=True):
        stack=ExitStack()
        self.addCleanup(stack.close)
        stack.enter_context(patch.object(r,'darwin_profile',return_value=darwin))
        stack.enter_context(patch.object(Path,'exists',return_value=False))
        stack.enter_context(patch.object(r,'cleanup_hold'))
        stack.enter_context(patch.object(r,'disk_bytes',return_value=0))
        stack.enter_context(patch.object(r,'process_table',return_value={
            123:dict(ppid=1,rss=1,command='lean')}))
        stack.enter_context(patch.object(r,'current_process',return_value=dict(identity='birth',ppid=1)))
        stack.enter_context(patch.object(r,'native_footprint',return_value=dict(phys_footprint_bytes=1)))
        # Required observer stays real; only bounded OS command output is stubbed.
        self.observer=stack.enter_context(patch.object(r,'observation',return_value='System-wide memory free percentage: 30%\n'))
        self.raw=stack.enter_context(patch.object(r,'available_memory',return_value=16*r.GiB))
        self.disk=stack.enter_context(patch.object(r.shutil,'disk_usage',return_value=SimpleNamespace(free=8*r.GiB)))
        return r.Guard(123,r.ROOT)

    def percent(self, n):
        self.observer.return_value='System-wide memory free percentage: '+str(n)+'%\n'

    def test_admission_30_pass_29_fail(self):
        self.fixture()
        self.percent(30); record=r.headroom(r.limits())
        self.assertEqual(record['os_free_percent'],30)
        self.observer.assert_called_with(['/usr/bin/memory_pressure','-Q'])
        self.percent(29)
        with self.assertRaisesRegex(r.ResourceFailure,'admission_memory_headroom'): r.headroom(r.limits())

    def test_dynamic_25_pass_24_fail(self):
        guard=self.fixture()
        self.percent(25); guard.check(force=True)
        self.assertEqual(guard.samples[-1]['memory_observation']['os_free_percent'],25)
        self.percent(24)
        with self.assertRaisesRegex(r.ResourceFailure,'memory_pressure_or_low_available'): guard.check(force=True)

    def test_required_invalid_and_observer_failure_fail_closed(self):
        guard=self.fixture()
        valid='System-wide memory free percentage: 30%\n'
        for text in ('','other output','System-wide memory free percentage: nope%',valid*2,
                     valid+'System-wide memory free percentage: bad%',
                     'System-wide memory free percentage: 101%',
                     'System-wide memory free percentage: -1%',
                     'System-wide memory free percentage: 30.0%',
                     'System-wide memory free percentage: 30% extra'):
            self.observer.return_value=text
            for action in (lambda:r.headroom(r.limits()),lambda:guard.check(force=True)):
                with self.subTest(text=text),self.assertRaisesRegex(r.ResourceFailure,'monitor_unavailable'): action()
        for failure in ('observer nonzero exit','observer timeout','observer output bound'):
            self.observer.side_effect=r.ResourceFailure('monitor_unavailable: '+failure)
            with self.assertRaisesRegex(r.ResourceFailure,'monitor_unavailable'): r.headroom(r.limits())
            with self.assertRaisesRegex(r.ResourceFailure,'monitor_unavailable'): guard.check(force=True)
        self.raw.assert_not_called()  # required failure cannot consult fallback

    def test_raw_vm_audit_failure_and_low_bytes_never_rule(self):
        guard=self.fixture()
        self.raw.return_value=0
        self.assertEqual(r.headroom(r.limits())['raw_vm_audit_bytes'],0)
        guard.check(force=True)
        self.assertEqual(guard.samples[-1]['memory_observation']['raw_vm_audit_bytes'],0)
        self.raw.side_effect=r.ResourceFailure('audit vm_stat failed')
        record=r.headroom(r.limits()); self.assertIsNone(record['raw_vm_audit_bytes'])
        self.assertIn('audit vm_stat failed',record['raw_vm_audit_failure'])
        guard.check(force=True)
        self.assertIn('audit vm_stat failed',guard.samples[-1]['memory_observation']['raw_vm_audit_failure'])

    def test_linux_bytes_and_missing_fail_closed(self):
        guard=self.fixture(False)
        self.raw.return_value=8*r.GiB; r.headroom(r.limits())
        self.raw.return_value=8*r.GiB-1
        with self.assertRaisesRegex(r.ResourceFailure,'admission_memory_headroom'): r.headroom(r.limits())
        self.raw.return_value=5*r.GiB; guard.check(force=True)
        self.raw.return_value=5*r.GiB-1
        with self.assertRaisesRegex(r.ResourceFailure,'memory_pressure_or_low_available'): guard.check(force=True)
        self.raw.side_effect=r.ResourceFailure('monitor_unavailable: MemAvailable')
        with self.assertRaisesRegex(r.ResourceFailure,'monitor_unavailable'): r.headroom(r.limits())
        with self.assertRaisesRegex(r.ResourceFailure,'monitor_unavailable'): guard.check(force=True)
        self.observer.assert_not_called()

    def test_disk_floors_both_platforms(self):
        for darwin in (True,False):
            guard=self.fixture(darwin)
            self.disk.return_value=SimpleNamespace(free=8*r.GiB); r.headroom(r.limits())
            self.disk.return_value=SimpleNamespace(free=8*r.GiB-1)
            with self.assertRaisesRegex(r.ResourceFailure,'admission_disk_headroom'): r.headroom(r.limits())
            self.disk.return_value=SimpleNamespace(free=5*r.GiB); guard.check(force=True)
            self.disk.return_value=SimpleNamespace(free=5*r.GiB-1)
            with self.assertRaisesRegex(r.ResourceFailure,'disk_headroom'): guard.check(force=True)

    def test_percentage_floor_harden_only_and_numeric_guards(self):
        for key,bound in (('os_pressure_admission_percent',30),('os_pressure_dynamic_percent',25)):
            for value in (bound-1,True,False,float('nan'),float('inf'),float('-inf'),101,-1,0,'30',None):
                with self.subTest(key=key,value=value),self.assertRaises(r.ResourceFailure): r.limits({key:value})
            for value in (bound,bound+.5,100):
                self.assertEqual(r.limits({key:value})[key],value)
        guard=self.fixture()
        self.percent(30)
        with self.assertRaisesRegex(r.ResourceFailure,'admission_memory_headroom'):
            r.headroom(r.limits({'os_pressure_admission_percent':31}))
        guard.cap=r.limits({'os_pressure_dynamic_percent':26})
        self.percent(25)
        with self.assertRaisesRegex(r.ResourceFailure,'memory_pressure_or_low_available'): guard.check(force=True)
