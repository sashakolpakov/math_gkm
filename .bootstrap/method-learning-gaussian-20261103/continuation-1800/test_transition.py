"""Neutral filesystem/locking/receipt controls. No models, proofs or compilers."""
import contextlib
import copy
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('prospective_boundary_transition',HERE/'transition.py')
t=importlib.util.module_from_spec(spec);spec.loader.exec_module(t)


def put(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'))+'\n')


def pinned(path):return {'path':str(path),'sha256':t.sha(path)}


class FakeNative(t.Native):
    def __init__(self,fixture):self.f=fixture;self.sleeps=0;self.on_sleep=None;self.verified=[]
    def implementation(self):return '1'*64
    def verify(self,path):self.verified.append(str(path))
    def now(self):return 200+self.sleeps
    def sleep(self):
        self.sleeps+=1
        if self.sleeps>12:raise AssertionError('neutral fixture did not supply actual closure witness')
        if self.on_sleep:self.on_sleep(self)


def make_fixture(base):
    base=Path(base);initial=base/'studies/initial';output=base/'old-owner';output.mkdir(parents=True)
    (base/'.scratch/resources').mkdir(parents=True)
    (base/'.scratch/resources/heavy.lock').touch()
    oldsource=base/'oldowner.py';oldsource.write_text('old reviewed source\n')
    epoch=base/'epoch.py';epoch.write_text('old reviewed epoch\n')
    finalizer=base/'finalize.py';finalizer.write_text('old reviewed finalizer\n')
    contract={'goal':'SYNTHETIC True','scope':'neutral fixture only'}
    contract_path=base/'contract.json';put(contract_path,contract)
    oldprofile={'validation_seconds':600,'rounds':8,'call_seconds':1800,'arm_seconds':100000,'transport':'fixture'}
    profile_path=base/'old600.json';put(profile_path,oldprofile)
    newprofile_path=base/'new1800.json';put(newprofile_path,{**oldprofile,'validation_seconds':1800})
    initialbinding=base/'initial_binding.json';put(initialbinding,dict(study=str(initial),implementation_sha256='1'*64,
        profile_sha256=t.sha(profile_path),contract_sha256=t.digest(contract)))
    config=base/'oldconfig.json';put(config,dict(initial_study=str(initial),profile_path=str(profile_path),
        profile_sha256=t.sha(profile_path),contract_path=str(contract_path),contract_sha256=t.digest(contract),
        implementation_sha256='1'*64,owner_source_sha256=t.sha(oldsource),epoch_source=pinned(epoch),
        finalization_source=pinned(finalizer),initial_binding=str(initialbinding),initial_binding_sha256=t.sha(initialbinding),
        successor_root=str(base/'studies')))
    qualification=base/'QUALIFIED.json';put(qualification,dict(schema='math-gkm.gaussian-goal-qualified.v1',configuration_sha256=t.sha(config),
        finalization_source_sha256=t.sha(finalizer),owner_source_sha256=t.sha(oldsource),epoch_source_sha256=t.sha(epoch),
        contract_sha256=t.digest(contract)))
    current=dict(schema='math-gkm.gaussian-goal-current.v1',current_study=str(initial),epoch=0,
        phase='epoch_closed_root_open',root_proved=False,owner_source_sha256=t.sha(oldsource),contract_sha256=t.digest(contract))
    put(output/'CURRENT.json',current);put(output/'OWNER_CHECKPOINT.json',current)
    put(initial/'protocol.json',oldprofile);put(initial/'seed/contract.json',contract)
    (initial/'controller.lock').touch()
    for mode in ('baseline','exploration'):
        state=dict(round=8,phase='research',status='finite_budget_finished; root_open',active=None,active_intent=None,
            resolution=None,receipts=[],receipt_hashes={})
        put(initial/'arms'/mode/'state.json',{'state':state,'sha256':t.digest(state)})
    registration=base/'registration.json';exit_path=base/'ACTUAL_TOOL_EXIT.json'
    put(registration,dict(schema=t.REGISTRATION,legacy_output=str(output),legacy_owner_source_sha256=t.sha(oldsource),
        owned_tool_handle='SYNTHETIC owned execution handle',registered_at=100,exit_marker_path=str(exit_path)))
    binding=base/'binding.json';put(binding,dict(schema=t.SCHEMA,legacy_config=pinned(config),legacy_output=str(output),
        legacy_owner=pinned(oldsource),qualification=pinned(qualification),new_profile=pinned(newprofile_path),
        registration=pinned(registration),implementation_sha256='1'*64,contract_sha256=t.digest(contract),transition_source_sha256=t.sha(t.__file__)))
    activation=base/'activation.json';put(activation,dict(schema=t.ACTIVATION,activate=True,binding_sha256=t.sha(binding),transition_source_sha256=t.sha(t.__file__)))
    return SimpleNamespace(base=base,initial=initial,output=output,oldsource=oldsource,epoch=epoch,finalizer=finalizer,
        contract=contract,oldprofile=oldprofile,profile_path=profile_path,newprofile_path=newprofile_path,config=config,
        qualification=qualification,registration=registration,exit_path=exit_path,binding=binding,activation=activation,
        destination=base/'transition-output')


def witness(fixture,*,returncode=1):
    request=fixture.destination/'REQUEST.json';r=t.read(request)
    return dict(schema=t.EXIT,registration_sha256=t.sha(fixture.registration),request_sha256=t.sha(request),
        owned_tool_handle=t.read(fixture.registration)['owned_tool_handle'],actual_tool_handle_exit_observed=True,
        returncode=returncode,observed_at=r['requested_at']+1,tool_completion_reference='SYNTHETIC direct-handle completion')


def close_fixture(fixture,backend):
    put(fixture.exit_path,witness(fixture))
    current=t.read(fixture.output/'CURRENT.json');current['phase']='user_stopped'
    put(fixture.output/'CURRENT.json',current);put(fixture.output/'OWNER_CHECKPOINT.json',current)


class TransitionTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gaussian-neutral-boundary-')
        self.addCleanup(self.tmp.cleanup);self.f=make_fixture(self.tmp.name)
        self.addCleanup(patch.stopall);patch.object(t,'ROOT',self.f.base).start()
        self.backend=FakeNative(self.f);self.gate=t.Gate(self.f.binding,self.f.destination,self.backend)
    def mutate_state(self,mode,change):
        path=self.f.initial/'arms'/mode/'state.json';state=t.read(path)['state'];state.update(change)
        put(path,dict(state=state,sha256=t.digest(state)))
    def check_no_activation(self):
        self.assertFalse((self.f.output/'STOP').exists());self.assertFalse(self.f.destination.exists())
    def activate(self):
        self.backend.on_sleep=lambda b:close_fixture(self.f,b)
        return self.gate.activate(self.f.activation)
    def test_inspection_is_candidate_only_and_has_no_side_effects(self):
        value=self.gate.inspect();self.assertTrue(value['eligible_candidate']);self.assertFalse(value['lock_qualified'])
        self.check_no_activation()
    def test_explicit_activation_required(self):
        value=t.read(self.f.activation);value['activate']=False;put(self.f.activation,value)
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_native_running_final_evaluation_finite_state_is_fenced(self):
        with t.lock(self.f.initial/'controller.lock'):
            with self.assertRaises(t.Busy):self.activate()
        self.check_no_activation()
    def test_heavy_busy_releases_controller_without_request(self):
        with t.lock(self.f.base/'.scratch/resources/heavy.lock'):
            with self.assertRaises(t.Busy):self.activate()
            with t.lock(self.f.initial/'controller.lock'):pass
        self.check_no_activation()
    def test_finite_parent_all_conditions_checked(self):
        for change in ({'round':7},{'phase':'review'},{'status':'running'},{'active':{}},{'active_intent':{}},{'resolution':{}}):
            with self.subTest(change=change):
                self.mutate_state('exploration',dict(round=8,phase='research',status='finite_budget_finished; root_open',active=None,active_intent=None,resolution=None))
                self.mutate_state('exploration',change)
                with self.assertRaises(t.Refused):self.activate()
                self.check_no_activation()
    def test_original_comparison_baseline_must_finish(self):
        self.mutate_state('baseline',{'round':7})
        with self.assertRaises(t.Refused):self.activate()
    def test_missing_numeric_job_receipt_refuses(self):
        job=self.f.initial/'arms/exploration/jobs/plan-0000';job.mkdir(parents=True)
        put(job/'receipt.json',{'request_id':'plan-0000','returncode':None,'payload':'PRIVATE MUST NOT DECODE'})
        with self.assertRaises(t.Refused):self.activate()
    def test_numeric_receipt_must_be_registered_and_hash_bound(self):
        job=self.f.initial/'arms/exploration/jobs/plan-0000';job.mkdir(parents=True)
        receipt={'request_id':'plan-0000','returncode':0,'payload':'PRIVATE MUST NOT DECODE'};put(job/'receipt.json',receipt)
        with self.assertRaises(t.Refused):self.activate()
        self.mutate_state('exploration',{'receipts':[str(job)],'receipt_hashes':{str(job):t.digest(receipt)}})
        self.assertTrue(self.gate.inspect()['eligible_candidate'])
        receipt['returncode']=1;put(job/'receipt.json',receipt)
        with self.assertRaises(t.Refused):self.gate.inspect()
    def test_existing_owner_or_study_stop_is_never_overwritten(self):
        for path in (self.f.output/'STOP',self.f.initial/'STOP.json'):
            with self.subTest(path=path):
                path.write_text('user stop marker\n');old=path.read_bytes()
                with self.assertRaises(t.Refused):self.activate()
                self.assertEqual(path.read_bytes(),old);path.unlink()
    def test_source_or_old_allowance_mutation_refuses(self):
        self.f.oldsource.write_text('changed reviewed source')
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_source_change_after_probe_before_fence_refuses(self):
        actual=t.snapshot;count=0
        def changing(*a,**kw):
            nonlocal count
            result=actual(*a,**kw);count+=1
            if count==1:self.f.newprofile_path.write_text('changed')
            return result
        with patch.object(t,'snapshot',side_effect=changing):
            with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_current_advance_between_probe_and_fence_refuses(self):
        actual=t.snapshot;count=0
        def changing(*a,**kw):
            nonlocal count
            result=actual(*a,**kw);count+=1
            if count==1:
                current=t.read(self.f.output/'CURRENT.json');current['epoch']=1
                put(self.f.output/'CURRENT.json',current)
            return result
        with patch.object(t,'snapshot',side_effect=changing):
            with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_pending_migration_or_curation_refuses_before_request(self):
        for key in ('pending_successor','pending_curation'):
            current=t.read(self.f.output/'OWNER_CHECKPOINT.json');current[key]='synthetic pending'
            put(self.f.output/'OWNER_CHECKPOINT.json',current)
            with self.assertRaises(t.Refused):self.activate()
            current.pop(key);put(self.f.output/'OWNER_CHECKPOINT.json',current)
        self.check_no_activation()
    def test_unclosed_command_cannot_be_abandoned(self):
        command=self.f.output/'commands/000001';put(command/'INTENT.json',{'kind':'research'})
        with self.assertRaises((t.Refused,OSError)):self.activate()
        self.check_no_activation()
    def test_unresolved_cleanup_hold_prevents_stop(self):
        put(self.f.base/'.scratch/resources/UNRESOLVED_CLEANUP.json',{'synthetic':True})
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_paid_finalizer_ledger_is_not_dropped(self):
        put(self.f.output/'finalizations/finalization-ledger/paid.json',{'synthetic':'prior paid attempt'})
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_finished_noeligible_summary_is_retained_and_allowed(self):
        path=self.f.output/'finalizations/000000/summary.json'
        put(path,dict(status='no_eligible_current_exact_root',source_sha256=t.sha(self.f.finalizer),
            candidates=0,reviewed=0,rejected=0,new_attempts=0,resolved=False,more_eligible=False,implementation_sha256='1'*64))
        command=self.f.output/'commands/000000'
        put(command/'INTENT.json',dict(kind='finalization',argv=['python',str(self.f.finalizer),'--output',str(path.parent)]))
        (command/'private.log').write_text('synthetic own finalizer complete')
        put(command/'EXIT.json',dict(returncode=0,actual_numeric_exit_observed=True,owned_handle=True,log_sha256=t.sha(command/'private.log')))
        before=t.sha(path);receipt=self.activate()
        self.assertEqual(receipt['after']['preserved_files'][str(path)],before)
    def test_preexisting_exit_cannot_authorize_later_request(self):
        put(self.f.exit_path,{'actual_tool_handle_exit_observed':True,'returncode':0})
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_bad_markers_do_not_release_either_fence(self):
        checks=[]
        def progress(backend):
            for path in (self.f.initial/'controller.lock',self.f.base/'.scratch/resources/heavy.lock'):
                with self.assertRaises(t.Busy):
                    with t.lock(path):pass
            checks.append(backend.sleeps)
            marker=witness(self.f)
            if backend.sleeps==1:marker['returncode']=None
            elif backend.sleeps==2:marker['actual_tool_handle_exit_observed']=False
            elif backend.sleeps==3:marker['observed_at']=1
            elif backend.sleeps==4:marker['owned_tool_handle']='another handle'
            put(self.f.exit_path,marker)
        self.backend.on_sleep=progress
        receipt=self.gate.activate(self.f.activation)
        self.assertEqual(checks,[1,2,3,4,5]);self.assertTrue(receipt['actual_numeric_exit_observed'])
        for path in (self.f.initial/'controller.lock',self.f.base/'.scratch/resources/heavy.lock'):
            with t.lock(path):pass
    def assert_both_fences_held(self):
        for path in (self.f.initial/'controller.lock',self.f.base/'.scratch/resources/heavy.lock'):
            with self.assertRaises(t.Busy):
                with t.lock(path):pass
    def test_all_nonobject_exit_json_remains_fenced_until_actual_closure(self):
        malformed=[None,[],['not an object'],'a string',1,2.5,True,False]
        def progress(backend):
            self.assert_both_fences_held()
            if backend.sleeps<=len(malformed):put(self.f.exit_path,malformed[backend.sleeps-1])
            else:close_fixture(self.f,backend)
        self.backend.on_sleep=progress
        receipt=self.gate.activate(self.f.activation)
        self.assertEqual(self.backend.sleeps,len(malformed)+1)
        self.assertTrue(receipt['actual_numeric_exit_observed'])
    def test_ordinary_observation_exception_after_stop_does_not_drop_fences(self):
        def progress(backend):
            self.assert_both_fences_held();close_fixture(self.f,backend)
            raise OSError('synthetic transient observation error')
        self.backend.on_sleep=progress
        self.assertTrue(self.gate.activate(self.f.activation)['actual_numeric_exit_observed'])
    def test_stop_create_then_write_error_waits_actual_exit_and_refuses_receipt(self):
        original=t.write_exclusive
        def uncertain(path,value):
            if Path(path)==self.f.output/'STOP':
                Path(path).write_text('{synthetic partial publication')
                raise OSError('synthetic write failure after visible create')
            return original(path,value)
        def progress(backend):self.assert_both_fences_held();close_fixture(self.f,backend)
        self.backend.on_sleep=progress
        with patch.object(t,'write_exclusive',side_effect=uncertain),self.assertRaises(t.Refused):
            self.gate.activate(self.f.activation)
        self.assertEqual(self.backend.sleeps,1);self.assertTrue(self.f.exit_path.exists())
        self.assertEqual((self.f.output/'STOP').read_text(),'{synthetic partial publication')
        self.assertFalse((self.f.destination/'TRANSITION_FINISHED.json').exists())
    def test_stop_fsync_error_after_complete_publication_retains_fences(self):
        original=t.write_exclusive
        def uncertain(path,value):
            if Path(path)==self.f.output/'STOP':
                with patch.object(t.os,'fsync',side_effect=OSError('synthetic fsync failure')):
                    return original(path,value)
            return original(path,value)
        def progress(backend):self.assert_both_fences_held();close_fixture(self.f,backend)
        self.backend.on_sleep=progress
        with patch.object(t,'write_exclusive',side_effect=uncertain),self.assertRaises(t.Refused):
            self.gate.activate(self.f.activation)
        self.assertEqual(self.backend.sleeps,1);self.assertTrue(self.f.exit_path.exists())
        self.assertTrue((self.f.output/'STOP').exists())
        self.assertFalse((self.f.destination/'TRANSITION_FINISHED.json').exists())
    def test_failure_before_possible_stop_publication_can_release_fences(self):
        original=t.write_exclusive
        def refuse(path,value):
            if Path(path).name=='REQUEST.json':raise OSError('synthetic request failure before STOP')
            return original(path,value)
        with patch.object(t,'write_exclusive',side_effect=refuse),self.assertRaises(OSError):
            self.gate.activate(self.f.activation)
        self.assertFalse((self.f.output/'STOP').exists());self.assertEqual(self.backend.sleeps,0)
        for path in (self.f.initial/'controller.lock',self.f.base/'.scratch/resources/heavy.lock'):
            with t.lock(path):pass
    def test_success_receipt_verifier_binds_actual_closure_and_old600_new1800(self):
        receipt=self.activate();path=self.f.destination/'TRANSITION_FINISHED.json'
        self.assertEqual(t.read(path),receipt)
        with patch.object(t,'Native',return_value=self.backend):
            result=t.verify_receipt(self.f.binding,path,expected_new_profile_sha256=t.sha(self.f.newprofile_path),
                expected_contract_sha256=t.digest(self.f.contract),expected_implementation_sha256='1'*64)
        self.assertEqual(result['legacy_profile_sha256'],t.sha(self.f.profile_path))
        self.assertEqual(result['parent_study'],str(self.f.initial));self.assertNotEqual(result['legacy_profile_sha256'],result['new_profile_sha256'])
        put(self.f.exit_path,{**t.read(self.f.exit_path),'returncode':0})
        with patch.object(t,'Native',return_value=self.backend),self.assertRaises(t.Refused):
            t.verify_receipt(self.f.binding,path,expected_new_profile_sha256=t.sha(self.f.newprofile_path),
                expected_contract_sha256=t.digest(self.f.contract),expected_implementation_sha256='1'*64)
    def test_postclosure_source_failure_releases_fence_without_success(self):
        def progress(backend):
            close_fixture(self.f,backend);self.f.oldsource.write_text('changed after actual closure')
        self.backend.on_sleep=progress
        with self.assertRaises(t.Refused):self.gate.activate(self.f.activation)
        self.assertFalse((self.f.destination/'TRANSITION_FINISHED.json').exists())
        self.assertTrue((self.f.output/'STOP').exists())
        for path in (self.f.initial/'controller.lock',self.f.base/'.scratch/resources/heavy.lock'):
            with t.lock(path):pass
    def test_new_cleanup_hold_after_actual_exit_blocks_finished_receipt(self):
        def progress(backend):
            close_fixture(self.f,backend)
            put(self.f.base/'.scratch/resources/UNRESOLVED_CLEANUP.json',{'synthetic':'new unresolved cleanup'})
        self.backend.on_sleep=progress
        with self.assertRaises(t.Refused):self.gate.activate(self.f.activation)
        self.assertFalse((self.f.destination/'TRANSITION_FINISHED.json').exists())
        self.assertTrue((self.f.base/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists())
    def test_qualification_must_bind_the_exact_old_configuration(self):
        q=t.read(self.f.qualification);q['configuration_sha256']='f'*64;put(self.f.qualification,q)
        binding=t.read(self.f.binding);binding['qualification']=pinned(self.f.qualification);put(self.f.binding,binding)
        activation=t.read(self.f.activation);activation['binding_sha256']=t.sha(self.f.binding);put(self.f.activation,activation)
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_unpaid_setup_race_preserved_and_classified_by_actual_exit(self):
        def progress(backend):
            directory=self.f.output/'commands/000002';put(directory/'INTENT.json',{'kind':'curation'})
            (directory/'private.log').write_text('SYNTHETIC failed unpaid admission')
            put(directory/'EXIT.json',dict(returncode=1,actual_numeric_exit_observed=True,owned_handle=True,
                log_sha256=t.sha(directory/'private.log')))
            current=t.read(self.f.output/'CURRENT.json');current['phase']='needs_reconciliation'
            put(self.f.output/'CURRENT.json',current);put(self.f.output/'OWNER_CHECKPOINT.json',{**current,'pending_curation':'SYNTHETIC aborted setup'})
            put(self.f.exit_path,witness(self.f,returncode=2))
        self.backend.on_sleep=progress
        receipt=self.gate.activate(self.f.activation)
        self.assertEqual(receipt['returncode'],2)
        self.assertEqual(receipt['after']['commands'][str(self.f.output/'commands/000002')]['returncode'],1)
        self.assertIn(str(self.f.output/'commands/000002/INTENT.json'),receipt['after']['preserved_files'])


    def successor(self):
        initial=self.f.initial;put(initial/'seal.json',{'synthetic_original':True})
        child=self.f.base/'studies/method-learning-gaussian-20261103-epoch-0001'
        put(child/'protocol.json',{**self.f.oldprofile,'rounds':16})
        put(child/'seed/contract.json',self.f.contract);(child/'controller.lock').touch()
        state=t.read(initial/'arms/exploration/state.json')['state'];state['round']=16
        put(child/'arms/exploration/state.json',{'state':state,'sha256':t.digest(state)})
        provenance=dict(parent_study=str(initial),arm='exploration',parent_state_sha256=t.sha(initial/'arms/exploration/state.json'),
            parent_seal_sha256=t.sha(initial/'seal.json'),start_round=8,end_round=16,
            original_comparison='Immutable at original parent; successor is noncomparative own-history goal work.')
        put(child/'CONTINUATION_PROVENANCE.json',provenance)
        put(child/'seal.json',{'continuation_provenance_sha256':t.sha(child/'CONTINUATION_PROVENANCE.json')})
        put(child/'MIGRATION_FINISHED.json',dict(schema='math-gkm.closed-own-epoch.v1',source_sha256=t.sha(self.f.epoch),
            seal_sha256=t.sha(child/'seal.json'),provenance_sha256=t.sha(child/'CONTINUATION_PROVENANCE.json'),
            parent_state_sha256=t.sha(initial/'arms/exploration/state.json')))
        current=t.read(self.f.output/'CURRENT.json');current.update(current_study=str(child),epoch=1)
        put(self.f.output/'CURRENT.json',current);put(self.f.output/'OWNER_CHECKPOINT.json',current)
        return child
    def test_actual_owned_successor_can_transfer_after_original_comparison_closes(self):
        child=self.successor();receipt=self.activate()
        self.assertEqual(receipt['after']['parent_study'],str(child))
        self.assertEqual(receipt['after']['original_comparison_study'],str(self.f.initial))
        self.assertEqual(receipt['after']['epoch'],1)
    def test_genuine_successor_chain_parent_binding_is_required(self):
        child=self.successor();marker=t.read(child/'MIGRATION_FINISHED.json');marker['parent_state_sha256']='f'*64
        put(child/'MIGRATION_FINISHED.json',marker)
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_successor_never_excuses_unfinished_original_arm(self):
        self.successor();self.mutate_state('baseline',{'round':7})
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_empty_finalizer_summary_without_closed_own_command_refuses(self):
        put(self.f.output/'finalizations/000000/summary.json',dict(status='no_eligible_current_exact_root',
            source_sha256=t.sha(self.f.finalizer),implementation_sha256='1'*64,candidates=0,reviewed=0,rejected=0,
            new_attempts=0,resolved=False,more_eligible=False))
        with self.assertRaises(t.Refused):self.activate()
        self.check_no_activation()
    def test_ordinary_interruptions_are_deferred_only_while_fenced(self):
        import signal
        original={n:signal.getsignal(n) for n in (signal.SIGINT,signal.SIGTERM)}
        def progress(backend):
            for n in original:
                handler=signal.getsignal(n);self.assertTrue(callable(handler));handler(n,None)
            close_fixture(self.f,backend)
        self.backend.on_sleep=progress;self.gate.activate(self.f.activation)
        self.assertEqual({n:signal.getsignal(n) for n in original},original)

if __name__=='__main__':unittest.main()
