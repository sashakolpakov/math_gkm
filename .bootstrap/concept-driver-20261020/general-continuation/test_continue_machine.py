"""Bounded operations fixtures only. No Lean, models or mathematical task execution."""
import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import sys
import unittest
from types import SimpleNamespace
from unittest.mock import patch

spec=importlib.util.spec_from_file_location('continuation_ops',Path(__file__).with_name('continue_machine.py'))
ops=importlib.util.module_from_spec(spec);spec.loader.exec_module(ops)
sys.path.insert(0,str(ops.ROOT))


class OperationsFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='math-gkm-ops-only-')
        self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)

    @staticmethod
    def protocol():
        from machinery.study import DEFAULT
        return dict(DEFAULT,transport='live',model='gpt-6.1-sol',rounds=12,episode_rounds=2,
            call_seconds=1800,adaptation_seconds=1800,validation_seconds=900,
            arm_seconds=180000,max_calls=64,meta_calls=32,knowledge_checks_per_round=3,
            proposal_repairs=1,policy_trials=1,policy_trial_rounds=2)

    def bundle(self):
        source=self.root/'closed'
        ops.write(source/'source/fixture.json',{'fixture':'operations bytes, no theorem'})
        result={'fixture_only':True,'finished':1}
        ops.write(source/'result.json',result)
        files={str(p.relative_to(source)):ops.sha(p) for p in source.rglob('*') if p.is_file()}
        ops.write(source/'FINISHED.json',dict(files=files,finished=True))
        record=dict(validation_bundle=dict(directory=str(source),finished_sha256=ops.sha(source/'FINISHED.json')),
                    task={'id':'OPERATIONAL_FIXTURE'},solution={'fixture':True},receipt_hash=ops.digest(result),
                    proposal={'identity':'unchanged'},source_files={'source/fixture.json':files['source/fixture.json']})
        def fixture_reuse(directory,task,solution,required):
            self.assertEqual(task,record['task']);self.assertEqual(solution,record['solution']);self.assertEqual(required,[])
            marker=ops.read(directory/'FINISHED.json')
            for name,expected in marker['files'].items():
                if ops.sha(directory/name)!=expected: raise RuntimeError('fixture bundle changed')
            return ops.read(directory/'result.json')
        return source,record,fixture_reuse

    def test_closed_bundle_relocation_changes_only_directory(self):
        source,record,reuse=self.bundle();before=copy.deepcopy(record)
        # Compiled cache deliberately unbound and never copied.
        (source/'build').mkdir();(source/'build/cache.olean').write_bytes(b'unbound cache')
        destination=self.root/'successor/validators/item'
        migrated=ops.copy_closed_bundle(source,destination,record,reuse)
        expected=copy.deepcopy(record);expected['validation_bundle']['directory']=str(destination.resolve())
        self.assertEqual(migrated,expected);self.assertEqual(record,before)
        self.assertFalse((destination/'build').exists())
        self.assertEqual(ops.sha(source/'FINISHED.json'),ops.sha(destination/'FINISHED.json'))

    def test_closed_bundle_rejects_marker_mutation(self):
        source,record,reuse=self.bundle()
        ops.write(source/'FINISHED.json',{'files':{},'finished':True})
        with self.assertRaisesRegex(RuntimeError,'marker changed'):
            ops.copy_closed_bundle(source,self.root/'bad',record,reuse)

    def test_closed_bundle_rejects_bound_file_mutation(self):
        source,record,reuse=self.bundle();(source/'source/fixture.json').write_text('changed')
        with self.assertRaisesRegex(RuntimeError,'bundle changed'):
            ops.copy_closed_bundle(source,self.root/'bad',record,reuse)

    def test_closed_bundle_rejects_wrong_result_digest(self):
        source,record,reuse=self.bundle();record['receipt_hash']='wrong'
        with self.assertRaisesRegex(RuntimeError,'result changed'):
            ops.copy_closed_bundle(source,self.root/'bad',record,reuse)

    def test_path_traversal_and_symlinks_rejected(self):
        for name in ('../escape','/absolute'):
            with self.assertRaises(RuntimeError):ops.safe_relative(name)
        source=self.root/'source';source.write_text('bytes')
        alias=self.root/'alias';alias.symlink_to(source)
        with self.assertRaises(RuntimeError):ops.copy_file(alias,self.root/'destination')

    def test_destination_collision_does_not_overwrite(self):
        source=self.root/'source';source.write_text('a')
        destination=self.root/'destination';destination.write_text('b')
        with self.assertRaisesRegex(RuntimeError,'collision'):ops.copy_file(source,destination)
        self.assertEqual(destination.read_text(),'b')

    def test_history_copies_only_own_allowed_containers(self):
        source=self.root/'history'
        for name in ('objects/hash','manifests/round-0000.json','own-checks/hash.json','round-0000.json'):
            p=source/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text('{}')
        destination=self.root/'new-history';ops.copy_history(source,destination)
        self.assertEqual(sorted(str(p.relative_to(source)) for p in source.rglob('*') if p.is_file()),
                         sorted(str(p.relative_to(destination)) for p in destination.rglob('*') if p.is_file()))
        (source/'adapter.json').write_text('{}')
        with self.assertRaisesRegex(RuntimeError,'unknown history'):ops.copy_history(source,self.root/'bad-history')

    def test_fresh_accounting_preserves_entire_research(self):
        fresh=dict(research={},round=0,phase='research',reviewed_rounds=[],seal_hash='fresh',
            status='ready',calls=0,meta_calls=0,seconds=0,receipts=[],active=None,
            policy_trials=0,failures=0)
        research={'policy':{'unchanged':True},'agenda':['own proposer choice'],
                  'proposition_dag':{'own':'state'},'knowledge':{},'episode':None}
        parent=dict(active=None,active_intent=None,resolution=None,phase='research',
                    round=4,reviewed_rounds=[2,4],research=research)
        state=ops.epoch_state(fresh,parent,copy.deepcopy(research),'new-seal')
        self.assertEqual(state['research'],research);self.assertEqual(state['round'],4)
        self.assertEqual(state['calls'],0);self.assertEqual(state['receipts'],[])
        self.assertEqual(state['reviewed_rounds'],[2,4]);self.assertEqual(fresh['round'],0)
        self.assertNotIn('protocol_state',state)

    def test_migration_rejects_active_resolved_or_unknown_phase(self):
        base=dict(active=None,active_intent=None,resolution=None,phase='research',round=4,
                  reviewed_rounds=[2,4],research={'episode':None})
        for change in ({'active':'live'},{'active_intent':{}},{'resolution':{'resolved':True}},
                       {'phase':'unknown'}):
            with self.assertRaises(RuntimeError):ops.epoch_state({},dict(base,**change),{},'seal')

    def test_reviewed_episode_is_preserved_unchanged(self):
        episode={'status':'reviewed; delayed use remains observable','review_round':3,'review':{'accepted':False}}
        research={'episode':episode,'portfolio':{'own':'retained'}}
        parent=dict(active=None,active_intent=None,resolution=None,phase='research',round=4,
                    reviewed_rounds=[2,4],research=research)
        state=ops.epoch_state({},parent,copy.deepcopy(research),'seal')
        self.assertEqual(state['research'],research)
        self.assertEqual(state['research']['episode'],episode)

    def test_pending_adapter_and_unfinished_origins_are_excluded(self):
        oldarm=self.root/'old';oldws=oldarm/'workspace';newarm=self.root/'new';newws=newarm/'workspace'
        job=oldarm/'jobs/origin'
        research={'pending_discoveries':{'key':{'core':{'origin':{'job_key':'origin'}}}}}
        verify=unittest.mock.Mock()
        a={'common':SimpleNamespace(read=ops.read),'discoveries':SimpleNamespace(verify=verify)}
        for role,outcome in (('adapter','completed'),('reviewer','completed'),('researcher','failure_within_time_budget')):
            ops.write(job/'spec.json',{'role':role})
            ops.write(job/'receipt.json',{'role':role,'outcome':outcome})
            with self.assertRaisesRegex(RuntimeError,'nonresearch or unfinished'):
                ops.copy_pending(a,oldarm,oldws,newarm,newws,research,'key')
        verify.assert_not_called();self.assertFalse((newarm/'jobs').exists())

    def test_pending_research_origin_is_copied_and_marked_historical(self):
        oldarm=self.root/'old';oldws=oldarm/'workspace';newarm=self.root/'new';newws=newarm/'workspace'
        job=oldarm/'jobs/origin';ops.write(job/'spec.json',{'role':'researcher'})
        receipt={'role':'researcher','outcome':'completed','elapsed_seconds':7}
        ops.write(job/'receipt.json',receipt)
        relative='inbox/discoveries/key/source/fixture.json';ops.write(oldws/relative,{'fixture':True})
        manifest='inbox/discoveries/key/manifest.json';ops.write(oldws/manifest,{'fixture':'provenance'})
        entry={'core':{'origin':{'job_key':'origin'},'kind':'completion',
            'source_files':{'fixture.json':ops.sha(oldws/relative)}},
            'source_paths':{'fixture.json':relative},'manifest':manifest}
        research={'pending_discoveries':{'key':entry}}
        verify=unittest.mock.Mock()
        a={'common':SimpleNamespace(read=ops.read),'discoveries':SimpleNamespace(verify=verify)}
        copied,dependency=ops.copy_pending(a,oldarm,oldws,newarm,newws,research,'key')
        self.assertIsNone(dependency);self.assertEqual(copied['inherited_elapsed_seconds'],7)
        self.assertEqual(copied['receipt_hash'],ops.digest(receipt));self.assertEqual(entry,research['pending_discoveries']['key'])
        self.assertEqual(ops.sha(oldws/manifest),ops.sha(newws/manifest));verify.assert_called_once()
        # These paths are consumed by migration's state construction; role events,
        # model request prompt, watchdog, and original workspace are never copied.
        self.assertEqual(sorted(p.name for p in (newarm/'jobs/origin').iterdir()),['receipt.json','spec.json'])

    def test_cumulative_copy_guard_and_live_headroom(self):
        resources=SimpleNamespace(headroom=unittest.mock.Mock(),limits=lambda:{'admit_free':8*1024**3})
        with self.assertRaisesRegex(RuntimeError,'retention cap'):
            ops.CopyGuard(ops.MIGRATION_CAP+1,resources)
        with patch('shutil.disk_usage',return_value=SimpleNamespace(free=100*1024**3)):
            guard=ops.CopyGuard(12*1024**2,resources)
            guard.check(9*1024**2)
            self.assertEqual(resources.headroom.call_count,2)
            with self.assertRaisesRegex(RuntimeError,'byte cap'):guard.check(ops.MIGRATION_CAP)
        with patch('shutil.disk_usage',return_value=SimpleNamespace(free=8*1024**3)):
            with self.assertRaisesRegex(RuntimeError,'reserved disk'):ops.CopyGuard(10,resources)

    def test_shared_pending_origin_is_consumed_once_without_new_charge(self):
        origin=dict(path='/fixture/new/jobs/origin',key='origin',receipt_hash='exact',inherited_elapsed_seconds=7)
        parent=dict(active=None,active_intent=None,resolution=None,phase='research',round=4,
            reviewed_rounds=[2,4],research={'episode':None})
        fresh=dict(calls=0,meta_calls=0,seconds=0,receipts=[],receipt_hashes={})
        state=ops.epoch_state(fresh,parent,{'episode':None},'seal')
        ops.mark_inherited_consumed(state,[origin,copy.deepcopy(origin)])
        self.assertEqual(state['receipts'],[origin['path']]);self.assertEqual(state['counted_jobs'],['origin'])
        self.assertEqual(state['receipt_hashes'],{origin['path']:'exact'})
        self.assertEqual(state['calls'],0);self.assertEqual(state['seconds'],0)
        self.assertEqual(sum(x['inherited_elapsed_seconds'] for x in ops.dedupe_inherited_jobs([origin,origin])),7)
        with self.assertRaisesRegex(RuntimeError,'conflicting'):
            ops.dedupe_inherited_jobs([origin,dict(origin,receipt_hash='other')])

    def test_pending_review_phase_and_entire_research_are_preserved(self):
        research={'episode':{'status':'usefulness_not_demonstrated','review_round':6},
            'pending_policy':{'policy':'own proposal'},'pending_program':{'program':'own proposal'},
            'portfolio':{'own':'hypothesis'},'agenda':['own agenda'],'knowledge':{},'components':{}}
        parent=dict(active=None,active_intent=None,resolution=None,status='stopped',phase='review',round=8,
            reviewed_rounds=[2,4,6],research=research)
        fresh=dict(round=0,phase='research',seconds=0,calls=0,meta_calls=0)
        actual=ops.epoch_state(fresh,parent,copy.deepcopy(research),'newseal')
        self.assertEqual(actual['phase'],'review');self.assertEqual(actual['round'],8)
        self.assertEqual(actual['reviewed_rounds'],[2,4,6]);self.assertEqual(actual['research'],research)
        self.assertNotIn(8,actual['reviewed_rounds']);self.assertEqual(fresh['phase'],'research')

    def test_existing_arm_bookkeeping_prepays_resume_and_keeps_trial_room(self):
        from machinery.study import Arm
        from machinery.study_common import save_state,load_state
        d=self.root/'fixture-study';p=self.protocol();ops.write(d/'protocol.json',p)
        own={'episode':{'still':'pending'},'knowledge':{},'components':{}}
        state=dict(research=copy.deepcopy(own),round=8,phase='review',calls=0,meta_calls=0,seconds=0,
            active=None,receipts=[],reviewed_rounds=[2,4,6],resolution=None)
        save_state(d/'arms/exploration/state.json',state)
        arm=Arm(d,'exploration',-1);arm.fund_many(ops.protected_horizon(p,8,'review'))
        self.assertEqual(arm.s['seconds'],108000);self.assertEqual(arm.s['research'],own)
        arm.fund('paired-evaluation-episode-8',9000);arm.fund('review-8',3600)
        self.assertEqual(arm.s['seconds'],108000)
        self.assertGreaterEqual(arm.available(),45000);self.assertGreaterEqual(arm.available_calls(),14)
        self.assertGreaterEqual(arm.available_calls(meta=True),8)
        with arm.budget('review-8'):
            self.assertEqual(arm.available_calls(),2);self.assertEqual(arm.available_calls(meta=True),2)
            self.assertEqual(arm.available(),3600)
        self.assertEqual(load_state(d/'arms/exploration/state.json')['phase'],'review')

    def test_immutable_initial_state_archive_survives_later_state_change(self):
        from machinery.study_common import save_state,load_state
        source=self.root/'initial-state.json';target=self.root/'MIGRATION_INITIAL_STATE.json'
        initial=dict(active=None,active_intent=None,phase='review',round=8,research={'own':'retained'})
        save_state(source,initial)
        common=SimpleNamespace(load_state=load_state)
        result=ops.preserve_initial_state(common,source,target)
        self.assertEqual(result['sha256'],ops.sha(target));self.assertEqual(load_state(target),initial)
        save_state(source,dict(initial,phase='research',round=9))
        self.assertEqual(load_state(target),initial)
        other=self.root/'bad-archive.json';save_state(source,dict(initial,active_intent={'live':'private'}))
        with self.assertRaisesRegex(RuntimeError,'active invocation intent'):
            ops.preserve_initial_state(common,source,other)
        self.assertFalse(other.exists())

    def test_full_four_round_capacity_and_optional_trial(self):
        p=self.protocol();c=ops.capacity_plan(p,4,'research')
        self.assertEqual(c['protected_seconds'],95400);self.assertEqual(c['required_seconds'],140400)
        self.assertEqual(c['required_calls'],46);self.assertEqual(c['required_meta_calls'],26)
        for field,value in (('arm_seconds',140399),('max_calls',45),('meta_calls',25)):
            with self.subTest(field=field),self.assertRaisesRegex(RuntimeError,'cannot fund'):
                ops.capacity_plan(dict(p,**{field:value}),4,'research')

    def test_wall_admission_reserves_complete_epoch_and_cleanup(self):
        p=self.protocol();reservation=ops.epoch_wall_reservation(p)
        self.assertEqual(reservation,191440)
        self.assertEqual(ops.admit_epoch(reservation,p,now=0),reservation)
        with self.assertRaisesRegex(RuntimeError,'complete finite epoch'):
            ops.admit_epoch(reservation-1,p,now=0)
        self.assertLess(2*reservation,ops.OPERATOR_SECONDS)
        self.assertGreater(3*reservation,ops.OPERATOR_SECONDS)
        self.assertEqual(ops.MAX_EPOCHS,8)

    def test_parent_requires_normal_finite_closure_and_no_active_intent(self):
        parent=self.root/'parent';ops.write(parent/'protocol.json',{'rounds':4})
        state=dict(status='finite_budget_finished; root_open',round=4,active=None,active_intent=None,resolution=None)
        common=SimpleNamespace(load_state=lambda p:state)
        with patch.object(ops,'api',return_value={'common':common}),patch.object(ops,'lock_available',return_value=True):
            self.assertTrue(ops.parent_ready(parent)[0])
            state['active_intent']={};self.assertFalse(ops.parent_ready(parent)[0]);state['active_intent']=None
            for status in ('bounded_or_blocked','stopped','operationally_blocked','running'):
                state['status']=status
                with self.assertRaisesRegex(RuntimeError,'normally'):ops.parent_ready(parent)
            state['status']='finite_budget_finished; root_open';ops.write(parent/'STOP.json',{})
            with self.assertRaisesRegex(RuntimeError,'explicitly stopped'):ops.parent_ready(parent)

    def test_initial_parent_waits_for_second_operator_closure(self):
        with patch.object(ops,'RESUME',self.root),patch.object(ops,'lock_available',return_value=False):
            self.assertFalse(ops.initial_operator_closed()[0])
        with patch.object(ops,'RESUME',self.root),patch.object(ops,'lock_available',return_value=True):
            ops.write(self.root/'STATUS.json',{'status':'research_running','operator_pid':1})
            self.assertFalse(ops.initial_operator_closed()[0])
            ops.write(self.root/'STATUS.json',{'status':'closed; inspect accepted evidence','controller_returncode':0,'research_launched':False})
            self.assertTrue(ops.initial_operator_closed()[0])
            ops.write(self.root/'STATUS.json',{'status':'needs_reconciliation','controller_returncode':1})
            with self.assertRaisesRegex(RuntimeError,'failed or uncertain'):ops.initial_operator_closed()

    def test_stop_and_cleanup_hold_are_never_cleared(self):
        with patch.object(ops,'OPS',self.root/'ops'),patch.object(ops,'ROOT',self.root),patch.object(ops,'DEADLINE',None):
            ops.write(self.root/'ops/STOP.json',{})
            with self.assertRaisesRegex(RuntimeError,'stop'):ops.controls()
            (self.root/'ops/STOP.json').unlink();ops.write(self.root/'.scratch/resources/UNRESOLVED_CLEANUP.json',{})
            with self.assertRaisesRegex(RuntimeError,'cleanup hold'):ops.controls()
            self.assertTrue((self.root/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists())

    def test_stop_while_waiting_does_not_stop_parent(self):
        with patch.object(ops,'OPS',self.root):
            parent=self.root/'parent';ops.write(self.root/'STATUS.json',{'research_launched':False,'current_study':str(parent)})
            ops.request_stop();self.assertTrue((self.root/'STOP.json').exists());self.assertFalse((parent/'STOP.json').exists())

    def test_active_own_stop_uses_official_marker(self):
        with patch.object(ops,'OPS',self.root):
            current=self.root/'successor';ops.write(self.root/'STATUS.json',{'research_launched':True,'current_study':str(current)})
            ops.request_stop();self.assertTrue((current/'STOP.json').exists())

    def test_no_partial_milestone_completion_path(self):
        source=Path(ops.__file__).read_text()
        self.assertNotIn('milestone_accepted',source);self.assertNotIn('MILESTONE_ACCEPTED.json',source)
        self.assertIn('verified_resolution(current)',source)
        self.assertIn('verified_resolution(parent)',source)
        self.assertIn("result.get('lean_exact_root_checked') is not True",source)

    def test_no_baseline_knowledge_or_adapter_history_migration(self):
        import ast
        tree=ast.parse(Path(ops.__file__).read_text())
        fn=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='migrate')
        source=ast.get_source_segment(Path(ops.__file__).read_text(),fn)
        self.assertIn("old_arm=parent/'arms/exploration'",source)
        self.assertNotIn("parent/'arms/baseline'",source)
        self.assertNotIn('adapter',source.replace('adapter jobs',''))
        self.assertIn("research=copy.deepcopy(old['research'])",source)

    def test_source_identity_includes_imported_machinery_and_new_recovery_chain(self):
        source=Path(ops.__file__).read_text()
        self.assertIn('common.implementation()',source)
        self.assertIn("RESUME=OPS.parent/'resume-general-0002'",source)
        self.assertIn("sha(FINALIZATION/'FINISHED.json')",source)
        self.assertIn("sha(ORIGINAL_RESUME/'LAUNCH_CONSUMED.json')",source)
        self.assertEqual(ops.ROOT,Path(ops.__file__).resolve().parents[3])

    def test_reviewed_horizon_change_and_second_epoch_protocol_match(self):
        original=self.protocol();original['rounds']=4
        original['concept_driver']={'enabled':True,'min_horizon_rounds':2,'max_horizon_rounds':2,'max_ordinary_rounds':1,'case_reassessment_after':2}
        first=self.root/'original';second=self.root/'successor'
        ops.write(first/'protocol.json',original)
        study=SimpleNamespace(validate_protocol=lambda p:None,validate_commitment=lambda p,n:None)
        with patch.object(ops,'INITIAL_PARENT',first),patch.object(ops,'api',return_value={'study':study}):
            planned=ops.planned_protocol(4)
            self.assertEqual(planned['rounds'],8)
            self.assertEqual(planned['concept_driver']['min_horizon_rounds'],2)
            self.assertEqual(planned['concept_driver']['max_horizon_rounds'],4)
            self.assertEqual({k:v for k,v in planned.items() if k not in ('rounds','concept_driver')},
                             {k:v for k,v in original.items() if k not in ('rounds','concept_driver')})
            ops.write(second/'protocol.json',planned)
            ops.write(second/'seed/contract.json',{'fixture':'exact'})
            common=SimpleNamespace(load_state=lambda p:{'round':8,'phase':'research'})
            with patch.object(ops,'api',return_value={'study':study,'common':common}),patch.object(ops,'immutable_bindings'),patch.object(ops,'EXPECTED_CONTRACT',ops.digest({'fixture':'exact'})):
                _,nextp,_,suite,_=ops.inspect_plan(second,2)
                self.assertEqual(nextp['rounds'],12);self.assertIsNone(suite)

    def test_immutable_plan_survives_actual_json_roundtrip(self):
        parent=self.root/'parent';ops.write(parent/'protocol.json',{'rounds':4})
        with patch.object(ops,'INITIAL_PARENT',parent),patch.object(ops,'immutable_bindings',return_value={}),patch.object(ops,'planned_protocol',return_value=self.protocol()):
            value=ops.plan_value();ops.write(self.root/'plan.json',value)
            self.assertEqual(ops.read(self.root/'plan.json'),ops.plan_value())
            self.assertTrue(all(isinstance(pool,list) for pool in value['capacity']['protected_pools'].values()))

    def test_single_consumption_survives_preflight_stop_race(self):
        resources=SimpleNamespace(headroom=lambda cap:ops.write(self.root/'STOP.json',{}),limits=lambda:{})
        with patch.object(ops,'OPS',self.root),patch.object(ops,'ROOT',self.root),patch.object(ops,'reviewed'),\
             patch.object(ops,'api',return_value={'resources':resources}),patch.object(ops,'DEADLINE',None),\
             patch.object(ops.subprocess,'Popen') as spawn:
            with self.assertRaisesRegex(RuntimeError,'stop'):ops.run_operator(self.root/'REVIEW.json')
            self.assertFalse((self.root/'LAUNCH_CONSUMED.json').exists());spawn.assert_not_called()

    def test_unresolved_job_is_never_replayed_by_operator(self):
        resources=SimpleNamespace(headroom=lambda cap:None,limits=lambda:{})
        with patch.object(ops,'OPS',self.root),patch.object(ops,'ROOT',self.root),patch.object(ops,'reviewed'),\
             patch.object(ops,'api',return_value={'resources':resources}),patch.object(ops,'DEADLINE',None),\
             patch.object(ops.subprocess,'Popen') as spawn:
            ops.write(self.root/'LAUNCH_CONSUMED.json',{'uncertain':True})
            with self.assertRaisesRegex(RuntimeError,'already consumed'):ops.run_operator(self.root/'REVIEW.json')
            spawn.assert_not_called()

    def test_resolution_flag_without_exact_receipt_rejected(self):
        state={'resolution':{'resolved':True},'resolution_receipt':'../fake'}
        with patch.object(ops,'api',return_value={'common':SimpleNamespace(load_state=lambda p:state)}):
            with self.assertRaisesRegex(RuntimeError,'unsafe'):ops.verified_resolution(self.root/'study')

spec_follow=importlib.util.spec_from_file_location('ongoing_follow',Path(__file__).with_name('follow.py'))
follow=importlib.util.module_from_spec(spec_follow);spec_follow.loader.exec_module(follow)


class FollowFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='math-gkm-follow-only-');self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name).resolve();self.initial=self.root/'.scratch/current'
        ops.write(self.initial/'protocol.json',{'rounds':8})
        self.owner={'study':str(self.initial),'controller_pid':1234,'controller_birth':'fixture-birth'}

    def test_ongoing_namespace_exceeds_old_eight_epoch_limit(self):
        with patch.object(ops,'ROOT',self.root):
            path=self.root/'.scratch/concept-driver-20261020-follow-000009'
            self.assertEqual(ops.ongoing_destination(path,9),path)
            self.assertEqual(ops.ongoing_destination(self.root/'.scratch/concept-driver-20261020-follow-1000000',1000000).name,'concept-driver-20261020-follow-1000000')
            for bad in (self.root/'concept-driver-20261020-follow-000009',self.root/'.scratch/concept-driver-20261020-follow-000010'):
                with self.assertRaises(RuntimeError):ops.ongoing_destination(bad,9)

    def test_exact_source_audit_authority_required(self):
        (self.root/'follow.py').write_text('fixture');(self.root/'test_continue_machine.py').write_text('fixture')
        with patch.object(ops,'OPS',self.root):
            record={'ongoing_goal_authorized':True,'ongoing_source_reviewer':'independent fixture',
                'ongoing_follow_sha256':ops.sha(self.root/'follow.py'),'ongoing_migration_sha256':ops.sha(ops.__file__),
                'ongoing_tests_sha256':ops.sha(self.root/'test_continue_machine.py')}
            self.assertEqual(ops.authorize_ongoing(record),record)
            for delta in ({'ongoing_goal_authorized':False},{'ongoing_source_reviewer':''},{'ongoing_migration_sha256':'wrong'}):
                with self.subTest(delta=delta),self.assertRaisesRegex(RuntimeError,'authority'):ops.authorize_ongoing({**record,**delta})

    def test_initial_controller_binding_is_explicit(self):
        self.assertEqual(follow.initial_binding(self.initial,{'ongoing_initial':self.owner}),self.owner)
        with self.assertRaisesRegex(RuntimeError,'ownership'):follow.initial_binding(self.initial,{})
        with self.assertRaisesRegex(RuntimeError,'ownership'):follow.initial_binding(self.root/'other',{'ongoing_initial':self.owner})

    def test_native_birth_reuse_refuses_replacement(self):
        resources=SimpleNamespace(current_process=lambda pid:{'identity':'different'})
        with patch.object(follow.ops,'api',return_value={'resources':resources}):
            with self.assertRaisesRegex(RuntimeError,'another birth'):follow.live_identity(1234,'original')
        with patch.object(follow.ops,'api',return_value={'resources':SimpleNamespace(current_process=lambda pid:None)}):
            self.assertFalse(follow.live_identity(1234,'original'))

    def test_wait_observes_external_controller_without_signalling(self):
        common=SimpleNamespace(load_state=lambda p:{'active':None,'active_intent':None,'resolution':None})
        with patch.object(follow.ops,'lock_available',side_effect=[False,True]),patch.object(follow,'controls'),             patch.object(follow,'live_identity',side_effect=[True,False,False]) as identity,patch.object(follow.time,'sleep') as sleep,             patch.object(follow.ops,'api',return_value={'common':common}),patch.object(follow,'terminal',return_value=False),             patch.object(follow.ops,'parent_ready',return_value=(True,None)),patch.object(follow.subprocess,'Popen') as spawn:
            self.assertTrue(follow.wait_closed(self.initial,self.owner));spawn.assert_not_called();sleep.assert_called_once()
            self.assertEqual(identity.call_count,3)

    def test_initial_birth_exit_after_lock_release_is_waited_for(self):
        common=SimpleNamespace(load_state=lambda p:{'active':None,'active_intent':None,'resolution':None})
        with patch.object(follow.ops,'lock_available',return_value=True),patch.object(follow,'controls'),             patch.object(follow,'live_identity',side_effect=[True,False,False]),patch.object(follow.time,'sleep') as sleep,             patch.object(follow.ops,'api',return_value={'common':common}),patch.object(follow,'terminal',return_value=False),             patch.object(follow.ops,'parent_ready',return_value=(True,None)):
            self.assertTrue(follow.wait_closed(self.initial,self.owner));sleep.assert_called_once()

    def test_uncertain_parent_intent_never_replayed(self):
        common=SimpleNamespace(load_state=lambda p:{'active':None,'active_intent':{'uncertain':True}})
        with patch.object(follow.ops,'lock_available',return_value=True),patch.object(follow,'controls'),             patch.object(follow.ops,'api',return_value={'common':common}),patch.object(follow.subprocess,'Popen') as spawn:
            with self.assertRaisesRegex(RuntimeError,'uncertain'):follow.wait_closed(self.initial)
            spawn.assert_not_called()

    def test_completed_proof_and_refutation_are_distinct(self):
        for kind in ('proof','refutation'):
            common=SimpleNamespace(load_state=lambda p:{'resolution':{'kind':kind,'binding':{'claim':{'kind':kind}}}})
            with patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),patch.object(follow.ops,'verified_resolution',return_value=True),patch.object(follow.ops,'api',return_value={'common':common}):
                self.assertTrue(follow.terminal(self.initial));state=ops.read(self.root/'FOLLOW.json')
                self.assertEqual(state['goal_achieved'],kind=='proof');self.assertEqual(state['theorem_proved'],kind=='proof')
                self.assertEqual(state['phase'],'theorem_proved' if kind=='proof' else 'theorem_refuted')
        with patch.object(follow.ops,'verified_resolution',return_value=False):self.assertIsNone(follow.outcome(self.initial))

    def fixture_api(self):
        return {'resources':SimpleNamespace(headroom=lambda cap:None,limits=lambda:{},current_process=lambda pid:{'identity':'self-fixture'})}

    def fixture_state(self,phase='waiting'):
        return dict(phase=phase,current_study=str(self.initial),next_sequence=1,
            helper_sha256=ops.sha(follow.ops.__file__),follow_sha256=ops.sha(follow.__file__),initial_owner=self.owner,
            operator_pid=None,caffeinate_pid=None)

    def test_uncertain_owned_launch_checkpoint_not_replayed(self):
        with patch.object(follow,'OPS',self.root),patch.object(follow,'ROOT',self.root),patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),             patch.object(follow,'controls'),patch.object(follow.subprocess,'Popen') as spawn:
            ops.write(self.root/'FOLLOW.json',self.fixture_state('launch_intent'))
            with self.assertRaisesRegex(RuntimeError,'unfinished'):follow.follow(self.initial)
            spawn.assert_not_called()

    def test_terminal_checkpoint_is_reverified(self):
        with patch.object(follow,'OPS',self.root),patch.object(follow,'ROOT',self.root),patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),             patch.object(follow,'controls'),patch.object(follow,'outcome',return_value=None),patch.object(follow.subprocess,'Popen') as spawn:
            ops.write(self.root/'FOLLOW.json',self.fixture_state('theorem_proved'))
            with self.assertRaisesRegex(RuntimeError,'current exact evidence'):follow.follow(self.initial)
            spawn.assert_not_called()

    def test_previous_live_same_birth_owner_is_not_replaced(self):
        state=self.fixture_state();state.update(operator_pid=1234,operator_birth='same')
        with patch.object(follow,'OPS',self.root),patch.object(follow,'ROOT',self.root),patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),             patch.object(follow,'controls'),patch.object(follow,'live_identity',return_value=True),patch.object(follow.subprocess,'Popen') as spawn:
            ops.write(self.root/'FOLLOW.json',state)
            with self.assertRaisesRegex(RuntimeError,'still lives'):follow.follow(self.initial)
            spawn.assert_not_called()

    def test_finite_deadline_prevents_spawn_after_migration(self):
        with patch.object(follow,'OPS',self.root),patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),patch.object(follow.ops,'OPS',self.root),             patch.object(follow.ops,'ROOT',self.root),patch.object(follow.ops,'DEADLINE',0),patch.object(follow.ops,'authorize_ongoing'),             patch.object(follow.subprocess,'Popen') as spawn:
            with self.assertRaisesRegex(RuntimeError,'wall ceiling'):follow.execute(self.initial,0)
            spawn.assert_not_called();self.assertEqual(ops.read(self.root/'FOLLOW.json')['phase'],'needs_reconciliation')

    def test_more_than_eight_epochs_keep_finite_envelopes(self):
        api=self.fixture_api();calls=[]
        def migrate(parent,number,**kwargs):
            self.assertTrue(kwargs['ongoing']);self.assertGreater(follow.ops.DEADLINE,time.monotonic())
            new=Path(kwargs['destination']);ops.write(new/'protocol.json',{'rounds':8+4*number});calls.append(number);return new
        import time
        with patch.object(follow,'OPS',self.root),patch.object(follow,'ROOT',self.root),patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),             patch.object(follow,'controls'),patch.object(follow.ops,'authorize_ongoing',return_value={'ongoing_initial':self.owner}),             patch.object(follow.ops,'api',return_value=api),patch.object(follow.ops,'immutable_bindings'),             patch.object(follow.ops,'planned_protocol',return_value={'arm_seconds':180000,'max_calls':64}),             patch.object(follow.ops,'start_keep_awake',return_value=None),patch.object(follow.ops,'migrate',side_effect=migrate),             patch.object(follow,'wait_closed',side_effect=[True]*18+[False]),patch.object(follow,'execute') as execute:
            follow.follow(self.initial)
            self.assertEqual(calls,list(range(1,10)));self.assertEqual(execute.call_count,9)
            self.assertEqual(ops.read(self.root/'FOLLOW.json')['next_sequence'],10)
            self.assertIsNone(follow.ops.DEADLINE)

    def test_stop_before_migration_preserves_open_goal(self):
        with patch.object(follow,'OPS',self.root),patch.object(follow,'CHECKPOINT',self.root/'FOLLOW.json'),             patch.object(follow,'STOPPED',True),patch.object(follow.ops,'migrate') as migrate:
            with self.assertRaisesRegex(RuntimeError,'signal'):follow.controls()
            migrate.assert_not_called()

if __name__=='__main__':unittest.main(verbosity=2)
