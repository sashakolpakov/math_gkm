"""Neutral watcher controls; no real admissions, processes, research or proofs."""
import contextlib
import importlib.util
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent

def load(name,file):
    spec=importlib.util.spec_from_file_location(name,HERE/file)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

w=load('watch_under_test','watch_transition.py')
f=load('watch_neutral_fixtures','test_transition.py')
t=f.t


class WatchTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='neutral-boundary-watch-');self.addCleanup(self.tmp.cleanup)
        self.f=f.make_fixture(self.tmp.name);self.addCleanup(patch.stopall)
        patch.object(t,'ROOT',self.f.base).start()
        self.backend=f.FakeNative(self.f);patch.object(t,'Native',return_value=self.backend).start()
        activation=t.read(self.f.activation);activation['watch_source_sha256']=t.sha(w.__file__);f.put(self.f.activation,activation)
        self.watch=w.Watch(self.f.binding,self.f.destination,t);self.calls=0;self.times=[0];self.kept=0
    def clock(self):return self.times[0]
    def sleep(self,seconds):self.times[0]+=seconds
    @contextlib.contextmanager
    def keeper(self):
        self.kept+=1
        try:yield
        finally:self.kept-=1
    def run_watch(self,seconds=10):
        return self.watch.run(self.f.activation,wait_seconds=seconds,poll_seconds=1,
            clock=self.clock,sleep=self.sleep,keeper=self.keeper)
    def test_transient_then_success_and_keeper_closes(self):
        def activate(_):
            self.calls+=1
            if self.calls<3:raise t.Refused('original comparison and parent must actually finish finite epochs')
            return {'SYNTHETIC':'finished'}
        self.watch.gate.activate=activate
        result=self.run_watch();self.assertEqual(result['attempts'],3);self.assertEqual(self.times[0],2);self.assertEqual(self.kept,0)
    def test_busy_and_pending_transition_are_narrow_transients(self):
        sequence=[t.Busy('owned boundary or heavy admission is busy'),t.Refused('owner already has an unsettled epoch transition'),{}]
        def activate(_):
            item=sequence.pop(0)
            if isinstance(item,Exception):raise item
            return item
        self.watch.gate.activate=activate;self.assertEqual(self.run_watch()['attempts'],3)
    def test_fatal_refusal_stops_without_sleep(self):
        self.watch.gate.activate=lambda _:(_ for _ in ()).throw(t.Refused('pinned source changed'))
        with self.assertRaises(t.Refused):self.run_watch()
        self.assertEqual(self.times[0],0);self.assertEqual(self.kept,0)
    def test_unexpected_error_is_not_transient(self):
        self.watch.gate.activate=lambda _:(_ for _ in ()).throw(OSError('synthetic I/O failure'))
        with self.assertRaises(OSError):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_any_output_on_exception_prevents_retry(self):
        def activate(_):
            self.calls+=1;self.f.destination.mkdir()
            raise t.Busy('owned boundary or heavy admission is busy')
        self.watch.gate.activate=activate
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.calls,1);self.assertTrue(self.f.destination.exists())
    def test_request_on_exception_is_retained_without_retry(self):
        def activate(_):
            self.calls+=1;f.put(self.f.destination/'REQUEST.json',{'synthetic':'uncertain'})
            raise t.Refused('original comparison and parent must actually finish finite epochs')
        self.watch.gate.activate=activate
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.calls,1);self.assertTrue((self.f.destination/'REQUEST.json').exists())
    def test_source_binding_change_between_attempts_stops(self):
        self.watch.gate.activate=lambda _:(_ for _ in ()).throw(t.Busy('owned boundary or heavy admission is busy'))
        def change(seconds):
            self.sleep(seconds);value=t.read(self.f.binding);value['transition_source_sha256']='a'*64;f.put(self.f.binding,value)
        with self.assertRaises(w.Refused):self.watch.run(self.f.activation,wait_seconds=10,poll_seconds=1,
            clock=self.clock,sleep=change,keeper=self.keeper)
        self.assertEqual(self.times[0],1)
    def test_bounded_wait_stops_before_further_attempt(self):
        def activate(_):self.calls+=1;raise t.Busy('owned boundary or heavy admission is busy')
        self.watch.gate.activate=activate
        with self.assertRaises(w.Refused):self.run_watch(2)
        self.assertEqual(self.calls,2);self.assertEqual(self.times[0],2);self.assertEqual(self.kept,0)
    def test_no_outer_deadline_interrupts_gate_after_entry(self):
        def activate(_):self.times[0]=1000;return {'synthetic':'actual gate returned only after handle closure'}
        self.watch.gate.activate=activate
        self.assertEqual(self.run_watch(1)['attempts'],1)
    def test_default_inspection_never_activates_or_starts_keeper(self):
        with patch.object(self.watch.gate,'activate',side_effect=AssertionError('no default activation')):
            result=self.watch.inspect()
        self.assertFalse(result['lock_qualified']);self.assertEqual(self.kept,0)
        self.assertFalse((self.f.output/'STOP').exists());self.assertFalse(self.f.destination.exists())
    def test_watcher_specific_approval_is_required(self):
        activation=t.read(self.f.activation);activation.pop('watch_source_sha256');f.put(self.f.activation,activation)
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.kept,0)
    def test_user_stop_is_fatal_even_when_active_error_would_be_transient(self):
        (self.f.output/'STOP').write_text('user stop')
        self.watch.gate.activate=lambda _:(_ for _ in ()).throw(t.Refused('parent active, unsettled, or mathematically resolved'))
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_root_resolution_is_fatal_not_hidden_by_generic_active_error(self):
        path=self.f.initial/'arms/exploration/state.json';state=t.read(path)['state'];state['resolution']={'synthetic':True}
        f.put(path,{'state':state,'sha256':t.digest(state)})
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_cleanup_hold_is_fatal_before_retry(self):
        f.put(self.f.base/'.scratch/resources/UNRESOLVED_CLEANUP.json',{'synthetic':True})
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_paid_finalizer_history_is_fatal_despite_unfinished_epoch(self):
        f.put(self.f.output/'finalizations/finalization-ledger/paid.json',{'synthetic':'paid'})
        with self.assertRaises(t.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_changed_gate_is_refused_before_any_module_import(self):
        value=t.read(self.f.binding);value['transition_source_sha256']='a'*64;f.put(self.f.binding,value)
        with patch.object(w,'transition',side_effect=AssertionError('changed source must never import')):
            with self.assertRaises(w.Refused):w.Watch(self.f.binding,self.f.destination)
    def test_fatal_guard_is_rechecked_after_transient_before_sleep(self):
        def activate(_):
            (self.f.output/'STOP').write_text('user stop after attempted boundary')
            raise t.Busy('owned boundary or heavy admission is busy')
        self.watch.gate.activate=activate
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_terminal_owner_phase_is_fatal_without_waiting(self):
        for phase in ('needs_reconciliation','user_stopped','theorem_proved','conjecture_refuted'):
            with self.subTest(phase=phase):
                current=t.read(self.f.output/'CURRENT.json');current['phase']=phase;f.put(self.f.output/'CURRENT.json',current)
                with self.assertRaises(w.Refused):self.run_watch()
                self.assertEqual(self.times[0],0)
    def test_generic_active_reason_requires_actual_unsettled_work_and_running_phase(self):
        self.watch.gate.activate=lambda _:(_ for _ in ()).throw(t.Refused(w.ACTIVE_REFUSAL))
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_generic_active_with_null_resolution_and_running_phase_can_wait(self):
        path=self.f.initial/'arms/exploration/state.json';state=t.read(path)['state'];state['active']={}
        f.put(path,{'state':state,'sha256':t.digest(state)})
        current=t.read(self.f.output/'CURRENT.json');current['phase']='research_running';f.put(self.f.output/'CURRENT.json',current)
        def activate(_):
            self.calls+=1
            if self.calls==1:raise t.Refused(w.ACTIVE_REFUSAL)
            return {'synthetic':'source-qualified next boundary'}
        self.watch.gate.activate=activate
        self.assertEqual(self.run_watch()['attempts'],2)
    def test_legitimate_waiting_initial_closure_with_active_initial_work_retries(self):
        path=self.f.initial/'arms/exploration/state.json';state=t.read(path)['state'];state['active_intent']={}
        f.put(path,{'state':state,'sha256':t.digest(state)})
        current=t.read(self.f.output/'CURRENT.json');current['phase']='waiting_initial_closure';f.put(self.f.output/'CURRENT.json',current)
        def activate(_):
            self.calls+=1
            if self.calls==1:raise t.Refused(w.ACTIVE_REFUSAL)
            return {'synthetic':'first actual finite boundary'}
        self.watch.gate.activate=activate
        self.assertEqual(self.run_watch()['attempts'],2);self.assertEqual(self.times[0],1)
    def open_wrapper(self,kind='research',phase='research_running'):
        command=self.f.output/'commands/000001'
        argv=[w.PYTHON,'-m','machinery.study','run' if kind=='research' else 'recover','--study',str(self.f.initial)]
        if kind=='research':argv+=['--arm','both']
        f.put(command/'INTENT.json',{'kind':kind,'argv':argv,'study':str(self.f.initial),'created':123})
        (command/'private.log').write_text('SYNTHETIC own native wrapper')
        current=t.read(self.f.output/'CURRENT.json');current['phase']=phase
        f.put(self.f.output/'CURRENT.json',current);f.put(self.f.output/'OWNER_CHECKPOINT.json',current)
        return command
    def test_real_gate_waits_actual_wrapper_exit_after_early_finite_flag(self):
        command=self.open_wrapper()
        self.backend.on_sleep=lambda b:f.close_fixture(self.f,b)
        def actual_exit(seconds):
            self.sleep(seconds)
            f.put(command/'EXIT.json',{'returncode':0,'actual_numeric_exit_observed':True,'owned_handle':True,
                'log_sha256':t.sha(command/'private.log')})
            current=t.read(self.f.output/'CURRENT.json');current['phase']='epoch_closed_root_open'
            f.put(self.f.output/'CURRENT.json',current);f.put(self.f.output/'OWNER_CHECKPOINT.json',current)
        with patch.object(self.watch.gate,'activate',wraps=self.watch.gate.activate) as activate:
            result=self.watch.run(self.f.activation,wait_seconds=10,poll_seconds=1,
                clock=self.clock,sleep=actual_exit,keeper=self.keeper)
        self.assertEqual(self.times[0],1);self.assertEqual(activate.call_count,1)
        self.assertTrue(result['receipt']['actual_numeric_exit_observed'])
    def test_open_recovery_wrapper_waits_only_matching_recovery_phase(self):
        command=self.open_wrapper('recover','recovering_closed_receipts')
        self.assertTrue(self.watch.guards()['open_wrapper'])
        current=t.read(self.f.output/'CURRENT.json');current['phase']='epoch_closed_root_open';f.put(self.f.output/'CURRENT.json',current)
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertFalse((command/'EXIT.json').exists());self.assertEqual(self.times[0],0)
    def test_open_wrapper_with_different_argv_is_not_awaited(self):
        command=self.open_wrapper();intent=t.read(command/'INTENT.json');intent['argv'].append('--resume')
        f.put(command/'INTENT.json',intent)
        with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_open_finalizer_is_never_hidden_as_research_waiting(self):
        command=self.open_wrapper();intent=t.read(command/'INTENT.json');intent['kind']='finalization'
        f.put(command/'INTENT.json',intent)
        with self.assertRaises(t.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_present_nonnumeric_wrapper_exit_is_fatal_before_gate(self):
        command=self.open_wrapper()
        f.put(command/'EXIT.json',{'returncode':None,'actual_numeric_exit_observed':True,'owned_handle':True,
            'log_sha256':t.sha(command/'private.log')})
        with patch.object(self.watch.gate,'activate',side_effect=AssertionError('must wait actual numeric EXIT')):
            with self.assertRaises(w.Refused):self.run_watch()
        self.assertEqual(self.times[0],0)
    def test_cli_help_works_without_pythonpath_or_current_directory_imports(self):
        environment={k:v for k,v in os.environ.items() if k!='PYTHONPATH'}
        environment['PYTHONDONTWRITEBYTECODE']='1';environment['PYTHONSAFEPATH']='1'
        result=subprocess.run([sys.executable,str(HERE/'watch_transition.py'),'--help'],cwd=self.f.base,
            env=environment,stdin=subprocess.DEVNULL,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=10)
        self.assertEqual(result.returncode,0,result.stderr.decode());self.assertIn(b'--activate',result.stdout)

if __name__=='__main__':unittest.main()
