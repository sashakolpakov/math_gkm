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

class SnapshotRetentionFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='gkm-snapshot-retention-');self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name);self.old=self.root/'parent';self.new=self.root/'successor'
        self.ws=self.old/'workspace';self.source=self.ws/'research/fixture.txt'
        self.source.parent.mkdir(parents=True);self.source.write_text('original operations bytes')
        from machinery import study_common
        self.common=study_common
        study_common.snapshot(self.ws,self.old/'snapshots/initial',{'fixture':'old initial'},[])
        self.source.write_text('next operations bytes')
        study_common.snapshot(self.ws,self.old/'snapshots/round-0000',{'fixture':'round zero'},[])
        self.source.write_text('latest operations bytes')
        study_common.snapshot(self.ws,self.old/'snapshots/round-0001',{'fixture':'round one'},[])

    def test_every_historical_view_and_manifest_preserved_once(self):
        originals={str(p.relative_to(self.old)):ops.sha(p) for p in self.old.rglob('*') if p.is_file()}
        with patch.object(ops,'api',return_value={'common':self.common}):
            bindings=ops.copy_snapshots(self.old,self.new)
        self.assertEqual(set(bindings),{'initial','round-0000','round-0001'})
        for name in bindings:
            dest=self.new/('snapshots' if name.startswith('round-') else 'inherited/snapshots')/name
            self.assertEqual(self.common.verify_snapshot(dest),self.common.verify_snapshot(self.old/'snapshots'/name))
            self.assertEqual(ops.sha(dest/'manifest.json'),ops.sha(self.old/'snapshots'/name/'manifest.json'))
        self.assertFalse((self.new/'inherited/snapshots/round-0000').exists())
        self.assertFalse((self.new/'inherited/snapshots/round-0001').exists())
        self.assertEqual(originals,{str(p.relative_to(self.old)):ops.sha(p) for p in self.old.rglob('*') if p.is_file()})
        self.assertNotEqual((self.old/'snapshots/round-0000/source/research/fixture.txt').stat().st_ino,
                            (self.new/'snapshots/round-0000/source/research/fixture.txt').stat().st_ino)

    def test_corrupt_historical_snapshot_rejected_before_copy(self):
        source=self.old/'snapshots/round-0000/source/research/fixture.txt';source.chmod(0o644);source.write_text('changed')
        with patch.object(ops,'api',return_value={'common':self.common}),self.assertRaisesRegex(self.common.Invalid,'frozen solver'):
            ops.copy_snapshots(self.old,self.new)
        self.assertFalse((self.new/'snapshots/round-0000').exists())

    def test_forecast_counts_one_copy_and_remains_bounded(self):
        history=self.ws/'history/objects/object';history.parent.mkdir(parents=True);history.write_text('own history')
        ops.write(self.old/'state.json',{'fixture':'state bytes'})
        state={'research':{'knowledge':{},'components':{},'pending_discoveries':{}}}
        source_bytes=sum((self.ws/n).stat().st_size for n in self.common.inventory(self.ws))
        snapshot_bytes=sum(p.stat().st_size for p in (self.old/'snapshots').rglob('*') if p.is_file())
        expected=2*source_bytes+history.stat().st_size+snapshot_bytes+(self.old/'state.json').stat().st_size+16*1024**2
        with patch.object(ops,'api',return_value={'common':self.common}):
            self.assertEqual(ops.planned_copy_bytes(self.old,state),expected)
            with patch.object(ops,'MIGRATION_CAP',expected-1),self.assertRaisesRegex(RuntimeError,'retention cap'):
                ops.planned_copy_bytes(self.old,state)
        self.assertEqual(ops.MIGRATION_CAP,768*1024**2)

    def test_forecast_cap_fails_before_creating_destination(self):
        state={'research':{'knowledge':{},'components':{},'pending_discoveries':{}}}
        ops.write(self.old/'state.json',{'fixture':'state'})
        with patch.object(ops,'api',return_value={'common':self.common}),patch.object(ops,'MIGRATION_CAP',0):
            with self.assertRaisesRegex(RuntimeError,'retention cap'):ops.planned_copy_bytes(self.old,state)
        self.assertFalse(self.new.exists())


class MaintenanceFixtures(unittest.TestCase):
    def setUp(self):
        import os,contextlib,hashlib
        self.temp=tempfile.TemporaryDirectory(prefix='gkm-maintenance-fixture-');self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name).resolve();self.opsdir=self.root/'.bootstrap/operations';self.opsdir.mkdir(parents=True)
        self.parent=self.root/'.scratch/concept-driver-20261020-follow-000004'
        self.destination=self.root/'.scratch/concept-driver-20261020-follow-000005'
        self.original=self.root/'.scratch/original';self.archive=self.root/'evidence/source'
        self.worker=self.root/'machinery/study_worker.py';self.worker.parent.mkdir(parents=True)
        self.oldbytes=b"def fixture():\n    fs = profile['filesystem']\n    return fs\n"
        self.newbytes=self.oldbytes.replace(b"    fs = profile['filesystem']\n",b"    fs = profile['filesystem']\n    fs[':tmpdir'] = 'write'  # TMPDIR is this role's workspace/.scratch.\n")
        self.worker.write_bytes(self.oldbytes)
        for name,data in getattr(self,'extra_sources',{}).items():
            target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
        source=self.root/'MathGKM/Fixture.lean';source.parent.mkdir();source.write_text('operations fixture bytes')
        def implementation():
            paths=list((self.root/'machinery').glob('*.py'))+list((self.root/'MathGKM').glob('*.lean'))
            return {str(p.relative_to(self.root)):ops.sha(p) for p in sorted(paths)}
        self.implementation=implementation;self.oldmap=implementation();self.newmap=dict(self.oldmap)
        self.newmap['machinery/study_worker.py']=hashlib.sha256(self.newbytes).hexdigest()
        self.oldid=ops.digest(self.oldmap);self.newid=ops.digest(self.newmap)
        for name in self.oldmap:
            target=self.archive/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes((self.root/name).read_bytes())
        ops.write(self.original/'seal.json',{'implementation':self.oldmap})
        ops.write(self.parent/'CONTINUATION_PROVENANCE.json',{'fixture':'retained parent provenance'})
        self.seal={'implementation':self.oldmap,'continuation_provenance_sha256':ops.sha(self.parent/'CONTINUATION_PROVENANCE.json')}
        ops.write(self.parent/'seal.json',self.seal)
        from machinery.study_common import save_state,load_state
        save_state(self.parent/'arms/exploration/state.json',{'active':None,'active_intent':None,'status':'finite_budget_finished; root_open','round':24,'phase':'research'})
        ops.write(self.parent/'protocol.json',{'rounds':24});ops.write(self.parent/'seed/contract.json',{'fixture':True})
        for path in [self.opsdir/'FOLLOW.lock',self.opsdir/'operator.lock',self.parent/'controller.lock',self.root/'.scratch/resources/heavy.lock']:
            path.parent.mkdir(parents=True,exist_ok=True);path.write_text('')
        (self.opsdir/'follow.py').write_text('fixture follow');(self.opsdir/'test_continue_machine.py').write_text('fixture tests')
        self.authority=self.root/'.bootstrap/study-authorization.json'
        spec={'authorized':True,'reviewer':'independent fixture','parent_study':str(self.parent),'destination':str(self.destination),
            'parent_state_sha256':ops.sha(self.parent/'arms/exploration/state.json'),'parent_seal_sha256':ops.sha(self.parent/'seal.json'),
            'old_implementation_sha256':self.oldid,'new_implementation_sha256':self.newid,
            'old_worker_sha256':ops.sha(self.worker),'new_worker_sha256':self.newmap['machinery/study_worker.py'],'source_archive':str(self.archive)}
        self.grant={'implementation_sha256':self.oldid,'ongoing_goal_authorized':True,'ongoing_source_reviewer':'independent fixture',
            'ongoing_follow_sha256':ops.sha(self.opsdir/'follow.py'),'ongoing_migration_sha256':ops.sha(ops.__file__),
            'ongoing_tests_sha256':ops.sha(self.opsdir/'test_continue_machine.py'),'source_maintenance':spec}
        ops.write(self.authority,self.grant);self.authority.chmod(0o444)
        ops.write(self.opsdir/'FOLLOW.json',{'phase':'migration_intent','parent_study':str(self.parent),'destination':str(self.destination),
            'operator_pid':os.getpid(),'operator_birth':'fixture-native-birth'})
        self.common=SimpleNamespace(implementation=implementation,load_state=load_state,read=ops.read,verify_snapshot=lambda p:{'fixture':True})
        def authorize(contract):
            if ops.read(self.authority)['implementation_sha256']!=ops.digest(implementation()):raise RuntimeError('authority implementation mismatch')
        self.common.authorize_live=authorize
        self.resources=SimpleNamespace(current_process=lambda pid:{'identity':'fixture-native-birth'},headroom=lambda cap:None,limits=lambda:{})
        self.stack=contextlib.ExitStack();self.addCleanup(self.stack.close)
        self.stack.enter_context(patch.multiple(ops,ROOT=self.root,OPS=self.opsdir,INITIAL_PARENT=self.original,SOURCE_ARCHIVE=self.archive,
            MAINTENANCE_PARENT=self.parent,MAINTENANCE_DESTINATION=self.destination,EXPECTED_IMPL=self.oldid,NEW_IMPL=self.newid,
            OLD_WORKER=self.oldmap['machinery/study_worker.py'],NEW_WORKER=self.newmap['machinery/study_worker.py'],CAPACITY_CHANGES={},REQUEST_CONTEXT_FILES={}))
        self.stack.enter_context(patch.object(ops,'api',return_value={'common':self.common,'resources':self.resources}))
        self.stack.enter_context(patch.object(ops,'DEADLINE',None))
        self.stack.enter_context(patch.object(ops,'COPY_GUARD',None))
        import fcntl
        self.singleton_streams=[]
        for path in (self.opsdir/'FOLLOW.lock',self.opsdir/'operator.lock'):
            stream=self.stack.enter_context(path.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB);self.singleton_streams.append(stream)

    def test_exact_one_file_transition_preserves_old_parent_and_authority_mode(self):
        old_parent={str(p.relative_to(self.parent)):ops.sha(p) for p in self.parent.rglob('*') if p.is_file()}
        with ops.parent_ownership(self.parent):result=ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.assertEqual(result['status'],'applied');self.assertEqual(self.worker.read_bytes(),self.newbytes)
        self.assertEqual(ops.checked_implementation(self.common),self.newid)
        self.assertEqual(ops.read(self.authority)['implementation_sha256'],self.newid)
        self.assertEqual(self.authority.stat().st_mode & 0o777,0o444)
        self.assertEqual(ops.read(self.parent/'seal.json')['implementation'],self.oldmap)
        self.assertEqual(old_parent,{str(p.relative_to(self.parent)):ops.sha(p) for p in self.parent.rglob('*') if p.is_file()})
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['source_transition']['status'],'applied')
        self.assertTrue(ops.lock_available(self.root/'.scratch/resources/heavy.lock'))

    def test_wrong_parent_state_or_source_delta_is_never_accepted(self):
        grant=copy.deepcopy(self.grant);grant['source_maintenance']['parent_state_sha256']='wrong';ops.write(self.authority,grant)
        with self.assertRaisesRegex(RuntimeError,'parent checkpoint'):ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.assertEqual(self.worker.read_bytes(),self.oldbytes)
        ops.write(self.authority,self.grant)
        with self.assertRaisesRegex(RuntimeError,'one-time'):ops.apply_source_maintenance(self.root/'other',self.destination,self.seal)
        (self.root/'machinery/extra.py').write_text('extra unreviewed source')
        with self.assertRaisesRegex(RuntimeError,'unreviewed source delta'):ops.checked_implementation(self.common)

    def test_archived_original_bytes_required(self):
        (self.archive/'MathGKM/Fixture.lean').write_text('changed archive')
        with self.assertRaisesRegex(RuntimeError,'source archive'):ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.assertEqual(self.worker.read_bytes(),self.oldbytes)

    def test_missing_singleton_or_native_owner_refuses_patch(self):
        with patch.object(ops,'lock_available',return_value=True),self.assertRaisesRegex(RuntimeError,'singleton'):
            ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        with patch.object(self.resources,'current_process',return_value={'identity':'different'}),self.assertRaisesRegex(RuntimeError,'native ownership'):
            ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.assertEqual(self.worker.read_bytes(),self.oldbytes)

    def test_partial_patch_is_durable_failure_without_rollback_or_replay(self):
        atomic=ops.atomic_protected
        def fail_authority(path,data,mode):
            if path==self.authority:raise OSError('fixture interruption after worker replacement')
            return atomic(path,data,mode)
        with patch.object(ops,'atomic_protected',side_effect=fail_authority),self.assertRaisesRegex(OSError,'interruption'):
            ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.assertEqual(self.worker.read_bytes(),self.newbytes)
        self.assertEqual(ops.read(self.authority)['implementation_sha256'],self.oldid)
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['source_transition']['status'],'intent')
        with self.assertRaisesRegex(RuntimeError,'historical old parent'):
            ops.apply_source_maintenance(self.parent,self.destination,self.seal)

    def test_existing_intent_or_destination_is_not_replayed(self):
        cp=ops.read(self.opsdir/'FOLLOW.json');cp['source_transition']={'status':'intent'};ops.write(self.opsdir/'FOLLOW.json',cp)
        with self.assertRaisesRegex(RuntimeError,'already consumed'):ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        cp.pop('source_transition');ops.write(self.opsdir/'FOLLOW.json',cp);self.destination.mkdir()
        with self.assertRaisesRegex(RuntimeError,'already exists'):ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.assertEqual(self.worker.read_bytes(),self.oldbytes)

    def test_atomic_target_alias_or_escape_rejected(self):
        alias=self.root/'.bootstrap/alias.json';alias.symlink_to(self.authority)
        with self.assertRaisesRegex(RuntimeError,'escaped'):ops.atomic_protected(alias,b'wrong',0o444)
        with self.assertRaisesRegex(RuntimeError,'escaped'):ops.atomic_protected(self.root/'elsewhere.json',b'wrong',0o444)
        self.assertEqual(self.worker.read_bytes(),self.oldbytes)

    def test_actual_migration_orders_old_verify_patch_authority_then_new_freeze(self):
        events=[]
        def verify(parent):
            self.assertEqual(ops.checked_implementation(self.common),self.oldid);events.append('actual-old-parent-verify')
        def freeze(*args):
            self.assertEqual(ops.checked_implementation(self.common),self.newid)
            self.common.authorize_live({'fixture':True})
            self.assertTrue(ops.lock_available(self.root/'.scratch/resources/heavy.lock'))
            self.assertFalse(ops.lock_available(self.parent/'controller.lock'))
            events.append('new-source-freeze');raise RuntimeError('fixture stopped at actual freeze boundary')
        api={'common':self.common,'resources':self.resources,'study':SimpleNamespace(verify=verify,freeze=freeze)}
        binding={'follow_sha256':ops.sha(self.opsdir/'follow.py'),'checkpoint_sha256':ops.sha(self.opsdir/'FOLLOW.json')}
        with patch.object(ops,'api',return_value=api),patch.object(ops,'inspect_plan',return_value=({'round':24},{},{},{},None)),             patch.object(ops,'parent_ready',return_value=(True,None)),patch.object(ops,'planned_copy_bytes',return_value=1),patch.object(ops,'CopyGuard'):
            with self.assertRaisesRegex(RuntimeError,'actual freeze boundary'):
                ops.migrate(self.parent,5,destination=self.destination,caller_binding=binding,ongoing=True)
        self.assertEqual(events,['actual-old-parent-verify','new-source-freeze'])
        self.assertEqual(ops.read(self.parent/'seal.json')['implementation'],self.oldmap)
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['source_transition']['status'],'applied')


class CapacityMaintenanceFixtures(unittest.TestCase):
    extra_sources={f'machinery/{name}.py': b'CAPACITY = 200000\n' for name in
        ('inspection_stream','proof_audit','own_feedback')}

    def setUp(self):
        MaintenanceFixtures.setUp(self)
        with ops.parent_ownership(self.parent):ops.apply_source_maintenance(self.parent,self.destination,self.seal)
        self.prior_transition=copy.deepcopy(ops.read(self.opsdir/'FOLLOW.json')['source_transition'])
        self.parent=self.destination;self.destination=self.root/'.scratch/concept-driver-20261020-follow-000006'
        self.capacity_map=dict(self.newmap);self.changes={}
        import hashlib
        for name,before in self.extra_sources.items():
            after=before.replace(b'200000',b'2000000')
            self.changes[name]=(hashlib.sha256(before).hexdigest(),hashlib.sha256(after).hexdigest(),((before,after),))
            self.capacity_map[name]=hashlib.sha256(after).hexdigest()
        self.capacity_id=ops.digest(self.capacity_map)
        ops.write(self.parent/'CONTINUATION_PROVENANCE.json',{'fixture':'immutable old7772 provenance'})
        self.seal={'implementation':self.newmap,'continuation_provenance_sha256':ops.sha(self.parent/'CONTINUATION_PROVENANCE.json')}
        ops.write(self.parent/'seal.json',self.seal)
        from machinery.study_common import save_state
        self.save_state=save_state
        save_state(self.parent/'arms/exploration/state.json',{'active':None,'active_intent':None,
            'status':'finite_budget_finished; root_open','round':28,'phase':'research','resolution':None})
        ops.write(self.parent/'protocol.json',{'rounds':28});ops.write(self.parent/'seed/contract.json',{'fixture':True})
        (self.parent/'controller.lock').write_text('')
        self.grant=ops.read(self.authority)
        self.grant['inspection_capacity_maintenance']={'authorized':True,'reviewer':'independent capacity fixture',
            'parent_study':str(self.parent),'destination':str(self.destination),
            'parent_state_sha256':ops.sha(self.parent/'arms/exploration/state.json'),'parent_seal_sha256':ops.sha(self.parent/'seal.json'),
            'old_implementation_sha256':self.newid,'new_implementation_sha256':self.capacity_id,
            'source_files':{name:{'before':row[0],'after':row[1]} for name,row in self.changes.items()}}
        ops.write(self.authority,self.grant);self.authority.chmod(0o444)
        cp=ops.read(self.opsdir/'FOLLOW.json');cp.update(parent_study=str(self.parent),destination=str(self.destination))
        ops.write(self.opsdir/'FOLLOW.json',cp)
        self.stack.enter_context(patch.multiple(ops,CAPACITY_PARENT=self.parent,CAPACITY_DESTINATION=self.destination,
            CAPACITY_IMPL=self.capacity_id,CAPACITY_CHANGES=self.changes))
        self.reloaded=[]
        self.real_reload_capacity_modules=ops.reload_capacity_modules
        def reload_modules():
            self.assertEqual(ops.checked_implementation(self.common),self.capacity_id)
            self.reloaded.append('all-three-new-modules')
            return ['machinery.proof_audit','machinery.inspection_stream','machinery.own_feedback']
        self.stack.enter_context(patch.object(ops,'reload_capacity_modules',side_effect=reload_modules))

    def apply(self):
        with ops.parent_ownership(self.parent):return ops.apply_source_maintenance(self.parent,self.destination,self.seal)

    def assert_unmodified(self):
        self.assertEqual(ops.checked_implementation(self.common),self.newid)
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['source_transition'],self.prior_transition)

    def test_three_file_capacity_transition_preserves_all_historical_bytes(self):
        before={str(p.relative_to(self.parent)):ops.sha(p) for p in self.parent.rglob('*') if p.is_file()}
        result=self.apply()
        self.assertEqual(result['old_implementation_sha256'],self.newid)
        self.assertEqual(result['new_implementation_sha256'],self.capacity_id)
        self.assertEqual(result['status'],'applied');self.assertEqual(self.reloaded,['all-three-new-modules'])
        self.assertEqual(result['reloaded_modules'],['machinery.proof_audit','machinery.inspection_stream','machinery.own_feedback'])
        cp=ops.read(self.opsdir/'FOLLOW.json')
        self.assertEqual(cp['source_transition'],self.prior_transition)
        self.assertEqual(cp['inspection_capacity_transition'],result)
        self.assertEqual(before,{str(p.relative_to(self.parent)):ops.sha(p) for p in self.parent.rglob('*') if p.is_file()})
        self.assertEqual(ops.read(self.authority)['implementation_sha256'],self.capacity_id)
        self.assertEqual(self.authority.stat().st_mode & 0o777,0o444)
        self.assertEqual(ops.sha(self.worker),self.newmap['machinery/study_worker.py'])
        self.assertTrue(ops.lock_available(self.root/'.scratch/resources/heavy.lock'))

    def test_wrong_parent_checkpoint_or_destination_refuses_before_patch(self):
        grant=copy.deepcopy(self.grant);grant['inspection_capacity_maintenance']['parent_state_sha256']='wrong';ops.write(self.authority,grant)
        with self.assertRaisesRegex(RuntimeError,'parent checkpoint'):self.apply()
        ops.write(self.authority,self.grant)
        with self.assertRaisesRegex(RuntimeError,'one-time'):ops.apply_source_maintenance(self.parent,self.root/'other',self.seal)
        self.assert_unmodified()

    def test_explicit_invalid_capacity_grant_cannot_fall_through_to_old_source_migration(self):
        for value in [None,{**self.grant['inspection_capacity_maintenance'],'authorized':False},
            {**self.grant['inspection_capacity_maintenance'],'status':'applied'}]:
            with self.subTest(value=value):
                grant=copy.deepcopy(self.grant);grant['inspection_capacity_maintenance']=value;ops.write(self.authority,grant)
                with self.assertRaisesRegex(RuntimeError,'maintenance (grant|authority)'):self.apply()
                self.assert_unmodified()

    def test_extra_source_delta_and_changed_pinned_hunk_are_rejected(self):
        extra=self.root/'machinery/extra.py';extra.write_text('unreviewed')
        with self.assertRaisesRegex(RuntimeError,'unreviewed source delta'):self.apply()
        extra.unlink();name=next(iter(self.changes));target=self.root/name;target.write_bytes(target.read_bytes()+b'# changed\n')
        with self.assertRaisesRegex(RuntimeError,'unreviewed source delta'):self.apply()
        self.assertEqual(self.reloaded,[])

    def test_existing_capacity_intent_or_destination_never_replayed(self):
        cp=ops.read(self.opsdir/'FOLLOW.json');cp['inspection_capacity_transition']={'status':'intent'};ops.write(self.opsdir/'FOLLOW.json',cp)
        with self.assertRaisesRegex(RuntimeError,'already consumed'):self.apply()
        cp.pop('inspection_capacity_transition');ops.write(self.opsdir/'FOLLOW.json',cp);self.destination.mkdir()
        with self.assertRaisesRegex(RuntimeError,'already exists'):self.apply()
        self.assert_unmodified()

    def test_partial_multi_file_replacement_preserves_uncertain_intent(self):
        atomic=ops.atomic_protected;count=0
        def interrupted(path,data,mode):
            nonlocal count
            if path!=self.authority:
                count+=1
                if count==2:raise OSError('fixture interruption between exact replacements')
            return atomic(path,data,mode)
        with patch.object(ops,'atomic_protected',side_effect=interrupted),self.assertRaisesRegex(OSError,'between exact'):
            self.apply()
        cp=ops.read(self.opsdir/'FOLLOW.json')
        self.assertEqual(cp['inspection_capacity_transition']['status'],'intent')
        self.assertEqual(cp['source_transition'],self.prior_transition)
        self.assertEqual(ops.read(self.authority)['implementation_sha256'],self.newid)
        with self.assertRaisesRegex(RuntimeError,'unreviewed source delta'):self.apply()
        self.assertEqual(self.reloaded,[])

    def test_reload_failure_is_uncertain_not_rolled_back_or_replayed(self):
        with patch.object(ops,'reload_capacity_modules',side_effect=RuntimeError('fixture reload failure')),self.assertRaisesRegex(RuntimeError,'reload failure'):
            self.apply()
        self.assertEqual(ops.checked_implementation(self.common),self.capacity_id)
        self.assertEqual(ops.read(self.authority)['implementation_sha256'],self.newid)
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['inspection_capacity_transition']['status'],'intent')
        with self.assertRaisesRegex(RuntimeError,'historical old parent'):self.apply()

    def test_authority_interruption_keeps_new_sources_and_old_immutable_parent(self):
        atomic=ops.atomic_protected
        def interrupted(path,data,mode):
            if path==self.authority:raise OSError('fixture authority replacement interruption')
            return atomic(path,data,mode)
        with patch.object(ops,'atomic_protected',side_effect=interrupted),self.assertRaisesRegex(OSError,'authority replacement'):
            self.apply()
        self.assertEqual(ops.checked_implementation(self.common),self.capacity_id)
        self.assertEqual(ops.read(self.parent/'seal.json')['implementation'],self.newmap)
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['inspection_capacity_transition']['status'],'intent')
        with self.assertRaisesRegex(RuntimeError,'historical old parent'):self.apply()

    def test_same_new_source_future_parent_needs_no_transition_or_reload(self):
        self.apply();cp=ops.read(self.opsdir/'FOLLOW.json');grant=ops.read(self.authority)
        result=ops.apply_source_maintenance(self.root/'.scratch/future',self.root/'.scratch/later',{'implementation':self.capacity_map})
        self.assertIsNone(result);self.assertEqual(ops.read(self.opsdir/'FOLLOW.json'),cp)
        self.assertEqual(ops.read(self.authority),grant);self.assertEqual(len(self.reloaded),1)
        with self.assertRaisesRegex(RuntimeError,'historical old parent'):self.apply()

    def test_prior_worker_transition_cannot_be_removed_or_relabelled(self):
        cp=ops.read(self.opsdir/'FOLLOW.json');cp['source_transition']['actual_implementation_sha256']='wrong';ops.write(self.opsdir/'FOLLOW.json',cp)
        with self.assertRaisesRegex(RuntimeError,'prior worker'):self.apply()
        self.assertEqual(ops.checked_implementation(self.common),self.newid)

    def test_native_owner_and_singleton_locks_still_required(self):
        with patch.object(ops,'lock_available',return_value=True),self.assertRaisesRegex(RuntimeError,'singleton'):self.apply()
        with patch.object(self.resources,'current_process',return_value={'identity':'other'}),self.assertRaisesRegex(RuntimeError,'native ownership'):self.apply()
        self.assert_unmodified()

    def test_round28_normal_root_open_boundary_is_required(self):
        original=self.common.load_state(self.parent/'arms/exploration/state.json')
        for change in [{'round':27},{'active':'uncertain'},{'active_intent':{'uncertain':True}},{'status':'stopped'},{'resolution':{'kind':'proof'}}]:
            with self.subTest(change=change):
                self.save_state(self.parent/'arms/exploration/state.json',{**original,**change})
                grant=copy.deepcopy(self.grant);grant['inspection_capacity_maintenance']['parent_state_sha256']=ops.sha(self.parent/'arms/exploration/state.json');ops.write(self.authority,grant)
                with self.assertRaisesRegex(RuntimeError,'not quiescent'):self.apply()
                self.assert_unmodified()

    def test_migrate_orders_old_verify_then_reload_then_new_freeze(self):
        events=[]
        def verify(parent):
            self.assertEqual(ops.checked_implementation(self.common),self.newid);events.append('verify-parent7772')
        def freeze(*args):
            self.assertEqual(ops.checked_implementation(self.common),self.capacity_id)
            self.assertEqual(self.reloaded,['all-three-new-modules'])
            self.common.authorize_live({'fixture':True})
            self.assertFalse(ops.lock_available(self.parent/'controller.lock'))
            self.assertTrue(ops.lock_available(self.root/'.scratch/resources/heavy.lock'))
            events.append('freeze-successor-capacity');raise RuntimeError('fixture actual new freeze boundary')
        api={'common':self.common,'resources':self.resources,'study':SimpleNamespace(verify=verify,freeze=freeze)}
        binding={'follow_sha256':ops.sha(self.opsdir/'follow.py'),'checkpoint_sha256':ops.sha(self.opsdir/'FOLLOW.json')}
        with patch.object(ops,'api',return_value=api),patch.object(ops,'inspect_plan',return_value=({'round':28},{},{},{},None)),patch.object(ops,'parent_ready',return_value=(True,None)),patch.object(ops,'planned_copy_bytes',return_value=1),patch.object(ops,'CopyGuard'):
            with self.assertRaisesRegex(RuntimeError,'actual new freeze'):ops.migrate(self.parent,6,destination=self.destination,caller_binding=binding,ongoing=True)
        self.assertEqual(events,['verify-parent7772','freeze-successor-capacity'])
        self.assertEqual(ops.read(self.parent/'seal.json')['implementation'],self.newmap)
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['source_transition'],self.prior_transition)

    def test_actual_reload_refreshes_the_same_module_objects_before_freeze(self):
        # Exercise the real reload helper with mocked importlib, never live modules.
        module_names=['machinery.proof_audit','machinery.inspection_stream','machinery.own_feedback']
        modules={name:SimpleNamespace(__file__=str(self.root/(name.replace('.','/')+'.py')),EDGE_LIMIT=2000000,WORK_LIMIT=200000) for name in module_names}
        seen=[];old_alias=modules[module_names[0]]
        def reload(module):
            seen.append(module)
            if module is old_alias:module.EDGE_LIMIT=2000000
            return module
        fake=SimpleNamespace(invalidate_caches=lambda:None,import_module=lambda name:modules[name],reload=reload)
        old_alias.EDGE_LIMIT=200000
        with patch.object(ops,'importlib',fake):
            self.assertEqual(self.real_reload_capacity_modules(),module_names)
            self.assertIs(old_alias,modules[module_names[0]])
            self.assertEqual(old_alias.EDGE_LIMIT,2000000)
            self.assertEqual(seen,[modules[name] for name in module_names])
            old_alias.WORK_LIMIT=200001
            with self.assertRaisesRegex(RuntimeError,'loaded capacity bounds'):self.real_reload_capacity_modules()



class RequestContextRevisionFixtures(unittest.TestCase):
    extra_sources={**CapacityMaintenanceFixtures.extra_sources,
        'machinery/study.py':b'old study fixture\n','machinery/study_policy.py':b'old policy fixture\n'}

    def setUp(self):
        import fcntl,hashlib
        CapacityMaintenanceFixtures.setUp(self)
        CapacityMaintenanceFixtures.apply(self)
        for stream in self.singleton_streams:fcntl.flock(stream,fcntl.LOCK_UN)
        self.study=self.destination;self.study.mkdir(parents=True)
        self.context_map=dict(self.capacity_map);changes={}
        for name in ['machinery/study.py','machinery/study_policy.py','machinery/study_worker.py','machinery/study_context.py']:
            target=self.root/name;raw=('new context fixture '+name+'\n').encode();before=self.context_map.get(name)
            target.write_bytes(raw);self.context_map[name]=hashlib.sha256(raw).hexdigest();changes[name]=(before,self.context_map[name])
        self.context_id=ops.digest(self.context_map)
        self.stack.enter_context(patch.multiple(ops,REQUEST_CONTEXT_STUDY=self.study,REQUEST_CONTEXT_IMPL=self.context_id,REQUEST_CONTEXT_FILES=changes))
        old_receipt=self.study/'old-deployment/receipt.json';ops.write(old_receipt,{'ready':True,'implementation':self.capacity_id})
        self.old_deployment={'ready':True,'implementation':self.capacity_id,'receipt':str(old_receipt),'receipt_sha256':ops.sha(old_receipt)}
        self.seal={'implementation':self.capacity_map,'deployment_preflight':self.old_deployment,'protocol':'same'}
        ops.write(self.study/'seal.json',self.seal);ops.write(self.study/'protocol.json',{'rounds':32,'proposal_repairs':1})
        ops.write(self.study/'seed/contract.json',{'fixture':True})
        for name in ['CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json']:ops.write(self.study/name,{'historical':name})
        self.job=self.study/'arms/exploration/jobs/plan-0030';self.job.mkdir(parents=True)
        self.receipt={'role':'proposer','outcome':'invalid_report: missing final','returncode':1,'payload':None,
            'before':{'retained':'same'},'after':{'retained':'same'},'resources':{'owned_identities':{'222':'fixture-child'}}}
        ops.write(self.job/'receipt.json',self.receipt);ops.write(self.job/'request.json',{'role':'proposer','request_id':'plan-0030'})
        ops.write(self.job/'spec.json',{'seconds':1800,'role':'proposer','readonly':True})
        self.prompt_chars=1048577;(self.job/'prompt.txt').write_text('x'*self.prompt_chars)
        (self.job/'events.jsonl').write_text('{"type":"thread.started"}\n')
        (self.job/'stderr.log').write_text('Error: rejected, data: '+ops.canonical({'input_error_code':'input_too_large','max_chars':1048576,'actual_chars':self.prompt_chars})+'\n')
        self.exploration={'round':30,'phase':'research','status':'running','active':None,'active_intent':None,'resolution':None,
            'calls':7,'meta_calls':5,'seconds':95400.,'failures':1,'policy_trials':0,'research':{'knowledge':{'retained':'same'}},
            'receipts':[str(self.job)],'receipt_hashes':{str(self.job):ops.digest(self.receipt)},'counted_jobs':['plan-0030'],
            'reservations':{'call-plan-0030':1800},'budget_pools':{'episode-research-30':{'spent':1800,'cap':18000}},'seal_hash':ops.digest(self.seal)}
        self.baseline={'round':0,'phase':'research','status':'ready','active':None,'active_intent':None,'research':{'baseline':'unchanged'},
            'calls':0,'meta_calls':0,'seconds':0.,'resolution':None,'seal_hash':ops.digest(self.seal)}
        for mode,state in [('baseline',self.baseline),('exploration',self.exploration)]:self.save_state(self.study/'arms'/mode/'state.json',state)
        (self.study/'controller.lock').write_text('')
        self.witness=self.root/'old-verification.json';self.supplement=self.root/'baseline-supplement.json'
        ops.write(self.witness,{'schema':'math-gkm.request-context-reconciliation-start.v1','genuine_old_study_verify_passed':True,
            'verified_old_implementation':self.capacity_id,'study':str(self.study),'old_seal_sha256':ops.sha(self.study/'seal.json'),
            'old_state_sha256':ops.sha(self.study/'arms/exploration/state.json'),'old_protocol_sha256':ops.sha(self.study/'protocol.json')})
        ops.write(self.supplement,{'baseline_seal_binding_matches':True,'old_seal_sha256':ops.sha(self.study/'seal.json'),
            'baseline_state_sha256':ops.sha(self.study/'arms/baseline/state.json'),'old_verification_witness_sha256':ops.sha(self.witness)})
        self.original_authority=self.root/'original-authorization.json';self.original_authority.write_bytes(self.authority.read_bytes())
        grant=ops.read(self.authority);grant.update(implementation_sha256=self.context_id,request_context_maintenance={
            'authorized':True,'reviewer':'independent fixture','study':str(self.study),'old_implementation_sha256':self.capacity_id,
            'implementation_sha256':self.context_id,'old_verification_path':str(self.witness),'old_verification_sha256':ops.sha(self.witness),
            'old_authorization_path':str(self.original_authority),'old_authorization_sha256':ops.sha(self.original_authority),
            'baseline_observation_path':str(self.supplement),'baseline_observation_sha256':ops.sha(self.supplement),'native_cleanup_verified':True,
            'native_owners':{'111':'fixture-old-owner'}})
        ops.write(self.authority,grant);self.authority.chmod(0o444)
        self.deployment={'ready':True,'implementation':self.context_id,'receipt':'new official fixture preflight'};self.deployment_checks=[]
        from machinery.study_context import recovery_projection
        def deployment(value):
            self.deployment_checks.append(value)
            if value.get('implementation')!=self.context_id:raise RuntimeError('historical deployment source mismatch')
        self.stack.enter_context(patch.object(ops,'request_context_api',return_value={'projection':recovery_projection,'verify_deployment':deployment}))
        self.resources.process_status=lambda pid:None
        def verify(study):
            seal=ops.read(study/'seal.json');self.assertEqual(seal['implementation'],self.context_map)
            for mode in ('baseline','exploration'):self.assertEqual(self.common.load_state(study/'arms'/mode/'state.json')['seal_hash'],ops.digest(seal))
        self.stack.enter_context(patch.object(ops,'api',return_value={'common':self.common,'resources':self.resources,'study':SimpleNamespace(verify=verify)}))
        self.original={str(p.relative_to(self.study)):p.read_bytes() for p in self.study.rglob('*') if p.is_file()}

    def apply(self):return ops.rebind_request_context(self.deployment)

    def assert_state_preserved(self):
        for mode,before in [('baseline',self.baseline),('exploration',self.exploration)]:
            after=self.common.load_state(self.study/'arms'/mode/'state.json')
            self.assertEqual({k:v for k,v in after.items() if k!='seal_hash'},{k:v for k,v in before.items() if k!='seal_hash'})
        self.assertEqual(ops.read(self.job/'receipt.json'),self.receipt)
        for name in ['CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json']:
            self.assertEqual((self.study/name).read_bytes(),self.original[name])

    def test_versioned_rebind_preserves_both_arms_and_original_receipt_accounting(self):
        result=self.apply();self.assertEqual(result['status'],'applied');self.assert_state_preserved()
        record=ops.read(self.opsdir/'REQUEST_CONTEXT_REVISION.json');self.assertEqual(record['classification'],'closed_input_too_large_no_model')
        self.assertEqual(record['next_request_id'],'plan-0030-repair-1');self.assertEqual(record['revision_core']['old_deployment'],self.old_deployment)
        self.assertEqual(ops.read(self.authority)['operational_recovery']['sha256'],ops.sha(self.opsdir/'REQUEST_CONTEXT_REVISION.json'))
        self.assertEqual((self.opsdir/'REQUEST_CONTEXT_REVISION.json').stat().st_mode & 0o777,0o444)
        import base64
        self.assertEqual(base64.b64decode(record['archived_original_authorization']),self.original_authority.read_bytes())
        for name,row in record['archived_files'].items():self.assertEqual(base64.b64decode(row['old_bytes_base64']),self.original[name])
        with self.assertRaisesRegex(RuntimeError,'already started'):self.apply()
        with self.assertRaisesRegex(RuntimeError,'no exact incomplete'):ops.finish_request_context_rebind()

    def test_valid_historical_deployment_cannot_replace_fresh_identity_check(self):
        with self.assertRaisesRegex(RuntimeError,'historical deployment'):ops.rebind_request_context(self.old_deployment)
        self.assertFalse((self.opsdir/'REQUEST_CONTEXT_REVISION.json').exists());self.assert_state_preserved()

    def test_wrong_old_witness_or_baseline_rejects_before_any_install(self):
        self.witness.write_text('{}')
        with self.assertRaisesRegex(RuntimeError,'old verification'):self.apply()
        self.assertEqual((self.study/'seal.json').read_bytes(),self.original['seal.json'])

    def test_live_owned_process_or_user_stop_blocks_revision(self):
        with patch.object(self.resources,'process_status',return_value={'identity':'fixture-old-owner'}),self.assertRaisesRegex(RuntimeError,'owner remains'):self.apply()
        ops.write(self.study/'STOP.json',{'user':True})
        with self.assertRaisesRegex(RuntimeError,'provider rejection'):self.apply()
        self.assertFalse((self.opsdir/'REQUEST_CONTEXT_REVISION.json').exists())

    def test_provider_stream_must_prove_no_model_started(self):
        (self.job/'events.jsonl').write_text('{"type":"turn.started"}\n')
        with self.assertRaisesRegex(RuntimeError,'provider rejection'):self.apply()
        self.assertFalse((self.opsdir/'REQUEST_CONTEXT_REVISION.json').exists())

    def partial_install(self):
        atomic=ops.atomic_protected
        def interrupted(path,data,mode):
            if path==self.study/'arms/exploration/state.json':raise OSError('fixture three-file interruption')
            return atomic(path,data,mode)
        with patch.object(ops,'atomic_protected',side_effect=interrupted),self.assertRaisesRegex(OSError,'three-file'):self.apply()
        self.assertEqual(ops.read(self.opsdir/'FOLLOW.json')['request_context_revision']['status'],'install_intent')

    def test_explicit_finish_completes_known_partial_three_file_transaction_only(self):
        self.partial_install();checks=len(self.deployment_checks)
        with self.assertRaisesRegex(RuntimeError,'already started'):self.apply()
        result=ops.finish_request_context_rebind();self.assertEqual(result['status'],'applied');self.assert_state_preserved()
        self.assertEqual(len(self.deployment_checks),checks+1) # metadata admission only; no new preflight/compiler

    def test_explicit_finish_survives_ephemeral_witness_cleanup(self):
        self.partial_install();self.witness.unlink();self.supplement.unlink();self.original_authority.unlink()
        self.assertEqual(ops.finish_request_context_rebind()['status'],'applied');self.assert_state_preserved()

    def test_unknown_partial_state_bytes_refuse_without_rollback(self):
        self.partial_install();(self.study/'arms/exploration/state.json').write_text('unknown bytes')
        with self.assertRaisesRegex(RuntimeError,'uncertain seal/state'):ops.finish_request_context_rebind()
        self.assertEqual((self.study/'arms/exploration/state.json').read_text(),'unknown bytes')

    def test_authority_change_during_partial_install_requires_explicit_reconciliation(self):
        self.partial_install();grant=ops.read(self.authority);grant['unexpected']='change';ops.write(self.authority,grant)
        with self.assertRaisesRegex(RuntimeError,'authority changed'):ops.finish_request_context_rebind()

    def test_archive_mutation_during_partial_install_is_not_accepted(self):
        self.partial_install();p=self.opsdir/'REQUEST_CONTEXT_REVISION.json';p.chmod(0o644);p.write_bytes(p.read_bytes()+b' ')
        with self.assertRaisesRegex(RuntimeError,'no exact incomplete'):ops.finish_request_context_rebind()

    def test_future_same_source_migration_recognizes_applied_revision(self):
        self.apply();seal=ops.read(self.study/'seal.json')
        self.assertIsNone(ops.apply_source_maintenance(self.root/'future',self.root/'later',seal))
        (self.root/'machinery/unreviewed.py').write_text('extra')
        with self.assertRaisesRegex(RuntimeError,'unreviewed source delta'):ops.checked_implementation(self.common)


class OwnContextHistoryFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='gkm-own-context-copy-');self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name);self.source=self.root/'history';self.destination=self.root/'copied';self.source.mkdir()
    def context(self,role='proposer'):
        import hashlib
        raw=ops.revision_bytes({'role':role,'knowledge':{'unchanged':'full context'}});name=hashlib.sha256(raw).hexdigest()+'.json'
        target=self.source/'context'/name;target.parent.mkdir(exist_ok=True);target.write_bytes(raw);return target
    def test_exact_own_context_is_copied_read_only_without_changing_bytes(self):
        p=self.context();ops.copy_history(self.source,self.destination);q=self.destination/'context'/p.name
        self.assertEqual(q.read_bytes(),p.read_bytes());self.assertEqual(q.stat().st_mode & 0o777,0o444)
    def test_private_role_or_filename_hash_mutation_is_rejected(self):
        p=self.context('adapter')
        with self.assertRaisesRegex(RuntimeError,'own context'):ops.copy_history(self.source,self.destination)
        p.unlink();p=self.context();p.write_bytes(p.read_bytes()+b' ')
        with self.assertRaisesRegex(RuntimeError,'own context'):ops.copy_history(self.source,self.destination)
    def test_nonhash_filename_or_nested_alias_is_rejected(self):
        p=self.context();p.rename(p.with_name('wrong.json'))
        with self.assertRaisesRegex(RuntimeError,'own context'):ops.copy_history(self.source,self.destination)
    def test_context_individual_eight_megabyte_limit_is_unchanged(self):
        p=self.context()
        with p.open('wb') as stream:stream.truncate(8*1024**2+1)
        with self.assertRaisesRegex(RuntimeError,'own context'):ops.copy_history(self.source,self.destination)


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


class CurrentResumeFixtures(unittest.TestCase):
    def setUp(self):
        from contextlib import ExitStack
        import time
        self.temp=tempfile.TemporaryDirectory(prefix='math-gkm-current-resume-only-');self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name).resolve();self.opsdir=self.root/'ops';self.opsdir.mkdir()
        self.study=self.root/'.scratch/concept-driver-20261020-follow-000006'
        self.current={'round':30,'phase':'research','status':'running','resolution':None,'active':None,'active_intent':None,
            'seconds':95400,'calls':7,'meta_calls':5,'budget_pools':{'fixture':{'cap':75600,'spent':0}},'receipts':[]}
        self.protocol={'rounds':32,'arm_seconds':180000,'max_calls':64,'meta_calls':32}
        ops.write(self.study/'arms/exploration/state.json',{'state':self.current})
        (self.study/'arms/exploration/jobs').mkdir();(self.study/'controller.lock').touch()
        ops.write(self.study/'protocol.json',self.protocol);ops.write(self.study/'seal.json',{'source':'fixture'})
        ops.write(self.opsdir/'REQUEST_CONTEXT_REVISION.json',{'fixture':'version record'})
        self.owner={'study':str(self.root/'.scratch/original-parent'),'controller_pid':100,'controller_birth':'old'}
        now=time.time();self.grant={'authorized':True,'reviewer':'independent operations fixture','study':str(self.study),
            'current_sequence':6,'next_sequence':7,'revision_sha256':ops.sha(self.opsdir/'REQUEST_CONTEXT_REVISION.json'),
            'seal_sha256':ops.sha(self.study/'seal.json'),'protocol_sha256':ops.sha(self.study/'protocol.json'),
            'state_sha256':ops.sha(self.study/'arms/exploration/state.json'),'native_cleanup_verified':True,
            'native_owners':{'123':'old-birth'},'authorized_at':now,'deadline_wall':now+170800}
        self.authorization={'ongoing_initial':self.owner,'ongoing_current_resume':self.grant,
            'operational_recovery':{'path':str(self.opsdir/'REQUEST_CONTEXT_REVISION.json'),'sha256':self.grant['revision_sha256']}}
        self.state={'phase':'ready_to_resume_current','current_study':str(self.study),'next_sequence':6,
            'initial_owner':self.owner,'operator_pid':None,'caffeinate_pid':None,'current_resume':self.grant,
            'request_context_revision':{'status':'applied','record_sha256':self.grant['revision_sha256']},
            'helper_sha256':ops.sha(follow.ops.__file__),'follow_sha256':ops.sha(follow.__file__)}
        self.stack=ExitStack();self.addCleanup(self.stack.close)
        api={'common':SimpleNamespace(load_state=lambda path:ops.read(path)['state']),
            'study':SimpleNamespace(verify=lambda path:None),
            'resources':SimpleNamespace(current_process=lambda pid:{'identity':'fixture-operator'})}
        for obj,key,value in [(follow,'ROOT',self.root),(follow,'OPS',self.opsdir),(follow,'CHECKPOINT',self.opsdir/'FOLLOW.json'),
            (follow.ops,'OPS',self.opsdir),(follow.ops,'ROOT',self.root),(follow.ops,'REQUEST_CONTEXT_STUDY',self.study)]:
            self.stack.enter_context(patch.object(obj,key,value))
        for obj,key,value in [(follow,'controls',None),(follow.ops,'immutable_bindings',None),
            (follow.ops,'authorize_ongoing',self.authorization),(follow.ops,'api',api),(follow.ops,'lock_available',True),
            (follow,'live_identity',False),(follow.ops,'start_keep_awake',None),(follow.ops,'close_keep_awake',None)]:
            self.stack.enter_context(patch.object(obj,key,return_value=value))
        ops.write(follow.CHECKPOINT,self.state)

    def test_remaining_wall_includes_funded_unspent_not_only_unfunded(self):
        self.assertEqual(follow.remaining_wall(self.protocol,self.current),170800)
        self.assertEqual(self.current['seconds'],95400)

    def test_exact_ready_revision_authorizes_only_remaining_wall(self):
        import time
        deadline=follow.resume_current(self.study,self.state)
        self.assertLessEqual(deadline-time.monotonic(),170800)
        self.assertGreater(deadline-time.monotonic(),170790)

    def test_wrong_revision_source_state_or_sequence_refuses_before_spawn(self):
        for target,key,value in [(self.grant,'state_sha256','wrong'),(self.grant,'revision_sha256','wrong'),
            (self.state,'next_sequence',7),(self.state['request_context_revision'],'status','install_intent')]:
            old=target[key];target[key]=value
            try:
                with self.subTest(key=key),self.assertRaises(RuntimeError),patch.object(follow.subprocess,'Popen') as spawn:
                    follow.resume_current(self.study,self.state)
                spawn.assert_not_called()
            finally:target[key]=old

    def test_fixed_deadline_cannot_be_refreshed_or_exceed_accounted_allowance(self):
        import time
        for end in (time.time()-1,self.grant['authorized_at']+170801):
            self.grant['deadline_wall']=end
            with self.subTest(end=end),self.assertRaisesRegex(RuntimeError,'remaining wall'):
                follow.resume_current(self.study,self.state)

    def test_user_stop_and_live_historical_owner_block_resume(self):
        ops.write(self.study/'STOP.json',{'source':'user'})
        with self.assertRaisesRegex(RuntimeError,'stopped'):follow.resume_current(self.study,self.state)
        (self.study/'STOP.json').unlink()
        with patch.object(follow,'live_identity',return_value=True),self.assertRaisesRegex(RuntimeError,'owner remains'):
            follow.resume_current(self.study,self.state)

    def test_unaccounted_job_or_active_intent_blocks_resume(self):
        (self.study/'arms/exploration/jobs/unaccounted').mkdir()
        with self.assertRaisesRegex(RuntimeError,'uncertain'):follow.resume_current(self.study,self.state)
        (self.study/'arms/exploration/jobs/unaccounted').rmdir()
        self.current['active_intent']={'uncertain':True}
        ops.write(self.study/'arms/exploration/state.json',{'state':self.current})
        self.grant['state_sha256']=ops.sha(self.study/'arms/exploration/state.json')
        with self.assertRaisesRegex(RuntimeError,'uncertain'):follow.resume_current(self.study,self.state)

    def test_current_six_runs_before_migration_then_schedules_seven_once(self):
        with patch.object(follow,'execute') as execute,patch.object(follow,'wait_closed',side_effect=[True,False]), \
            patch.object(follow.ops,'migrate') as migrate:
            follow.follow(self.study)
        execute.assert_called_once();self.assertEqual(execute.call_args.args[0],self.study);migrate.assert_not_called()
        final=ops.read(follow.CHECKPOINT);self.assertEqual(final['next_sequence'],7)
        self.assertEqual(final['initial_owner'],self.owner);self.assertEqual(final['phase'],'waiting')
        self.assertEqual(self.current['calls'],7);self.assertIsNone(follow.ops.DEADLINE)

    def test_uncertain_owned_resume_launch_is_not_replayed(self):
        def fail_launch(study,deadline):
            follow.checkpoint(phase='launch_intent');raise RuntimeError('fixture uncertain launch')
        with patch.object(follow,'execute',side_effect=fail_launch),self.assertRaisesRegex(RuntimeError,'uncertain launch'):
            follow.follow(self.study)
        self.assertEqual(ops.read(follow.CHECKPOINT)['phase'],'needs_reconciliation')
        with patch.object(follow,'execute') as execute,self.assertRaisesRegex(RuntimeError,'unfinished'):
            follow.follow(self.study)
        execute.assert_not_called();self.assertEqual(ops.read(follow.CHECKPOINT)['next_sequence'],6)

    def test_owned_execute_uses_saved_state_and_never_clears_stop(self):
        class Child:
            pid=1234;returncode=0
            def poll(self):return 0
        with patch.object(follow.subprocess,'Popen',return_value=Child()) as spawn,patch.object(follow.ops,'own_birth',return_value='fixture'):
            follow.execute(self.study,1e30)
        argv=spawn.call_args.args[0]
        self.assertIn('run',argv);self.assertNotIn('--resume',argv)

if __name__=='__main__':unittest.main(verbosity=2)
