"""Bounded operations fixtures only. No Lean, models or mathematical task execution."""
import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from types import SimpleNamespace
from unittest.mock import patch

spec=importlib.util.spec_from_file_location('continuation_ops',Path(__file__).with_name('continue_machine.py'))
ops=importlib.util.module_from_spec(spec);spec.loader.exec_module(ops)


class OperationsFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='math-gkm-ops-only-')
        self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)

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

    def test_migration_rejects_active_resolved_or_open_episode(self):
        base=dict(active=None,active_intent=None,resolution=None,phase='research',round=4,
                  reviewed_rounds=[2,4],research={'episode':None})
        for change in ({'active':'live'},{'active_intent':{}},{'resolution':{'resolved':True}},
                       {'phase':'review'},{'research':{'episode':{'open':True}}}):
            with self.assertRaises(RuntimeError):ops.epoch_state({},dict(base,**change),{},'seal')

    def test_parent_terminal_gate_rejects_operational_failures(self):
        parent=self.root/'parent';parent.mkdir()
        terminal={'status':'finite_budget_finished; root_open','active':None,'resolution':None}
        for status in ('operationally_blocked','bounded_or_blocked','stopped','running'):
            with patch.object(ops,'api',return_value={'common':type('Common',(),{'load_state':staticmethod(lambda p:dict(terminal,status=status))})}),\
                 patch.object(ops,'lock_available',return_value=True):
                ready,_=ops.parent_ready(parent)
                self.assertFalse(ready)
        with patch.object(ops,'api',return_value={'common':type('Common',(),{'load_state':staticmethod(lambda p:terminal)})}),\
             patch.object(ops,'lock_available',return_value=False):
            self.assertFalse(ops.parent_ready(parent)[0])

    def test_milestone_requires_independent_exact_binding(self):
        with patch.object(ops,'OPS',self.root):
            self.assertFalse(ops.milestone_accepted())
            audit=self.root/'audit.json';ops.write(audit,{'operator_only':'fixture'})
            marker=dict(accepted=True,user_goal_sha256=ops.digest(ops.GOAL),reviewer='fixture',
                        audit_report=str(audit),audit_report_sha256=ops.sha(audit))
            ops.write(self.root/'MILESTONE_ACCEPTED.json',marker)
            self.assertTrue(ops.milestone_accepted())
            audit.write_text('{}')
            with self.assertRaisesRegex(RuntimeError,'audit binding'):ops.milestone_accepted()

    def test_review_requires_source_tests_and_result(self):
        with patch.object(ops,'OPS',self.root):
            ops.write(self.root/'OPERATIONAL_TEST_RESULT.json',{'passed':True})
            (self.root/'test_continue_machine.py').write_text('fixture')
            review=dict(accepted=True,reviewer='independent fixture',source_sha256=ops.sha(ops.__file__),
                tests_sha256=ops.sha(self.root/'test_continue_machine.py'),
                test_result_sha256=ops.sha(self.root/'OPERATIONAL_TEST_RESULT.json'))
            ops.write(self.root/'REVIEW.json',review);ops.review_ok()
            (self.root/'test_continue_machine.py').write_text('changed')
            with self.assertRaisesRegex(RuntimeError,'independent'):ops.review_ok()

    def test_operator_wait_is_bounded_without_launch(self):
        with patch.object(ops,'OPS',self.root),patch.object(ops,'review_ok'),\
             patch.object(ops,'api',return_value={}),patch.object(ops,'controls'),\
             patch.object(ops,'parent_ready',return_value=(False,'live parent')),\
             patch.object(ops.subprocess,'Popen') as launch:
            ops.write(self.root/'STATUS.json',{'status':'preparing_not_launched','completed_epochs':[]})
            ops.run_operator(0)
            launch.assert_not_called()
            self.assertIn('waiting_for_parent',ops.read(self.root/'STATUS.json')['status'])
            self.assertFalse(ops.read(self.root/'STATUS.json')['research_launched'])

    def test_operator_records_migration_failure_without_retry(self):
        resources=type('R',(),{'headroom':staticmethod(lambda cap:None),'limits':staticmethod(lambda:{})})
        with patch.object(ops,'OPS',self.root),patch.object(ops,'review_ok'),\
             patch.object(ops,'api',return_value={'resources':resources}),patch.object(ops,'controls'),\
             patch.object(ops,'parent_ready',return_value=(True,None)),\
             patch.object(ops,'milestone_accepted',return_value=False),\
             patch.object(ops,'migrate',side_effect=RuntimeError('fixture stopped')) as migration,\
             patch.object(ops.subprocess,'Popen') as launch:
            ops.write(self.root/'STATUS.json',{'status':'preparing_not_launched','completed_epochs':[]})
            with self.assertRaisesRegex(RuntimeError,'fixture stopped'):ops.run_operator(0)
            self.assertEqual(migration.call_count,1);launch.assert_not_called()
            self.assertEqual(ops.read(self.root/'STATUS.json')['status'],'needs_reconciliation')

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

    def test_milestone_during_live_parent_wait_prevents_launch(self):
        with patch.object(ops,'OPS',self.root),patch.object(ops,'review_ok'),             patch.object(ops,'api',return_value={}),patch.object(ops,'controls'),             patch.object(ops,'milestone_accepted',side_effect=[False,True]),             patch.object(ops,'parent_ready',return_value=(False,'live parent')) as ready,             patch.object(ops.time,'sleep'),patch.object(ops,'migrate') as migration,             patch.object(ops.subprocess,'Popen') as launch:
            ops.write(self.root/'STATUS.json',{'status':'preparing_not_launched','completed_epochs':[]})
            ops.run_operator(100)
            ready.assert_called_once();migration.assert_not_called();launch.assert_not_called()
            self.assertEqual(ops.read(self.root/'STATUS.json')['status'],'operator_milestone_review_accepted')

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

    def test_dry_plan_never_reads_private_panel(self):
        parent=self.root/'parent';seen=[]
        protocol={'model':'gpt-6.1-sol','transport':'live','arm_seconds':86400,'rounds':4}
        contract={'fixture':'exact root identifier only'};implementation={'fixture':'implementation identity only'}
        state={'round':4,'research':{'knowledge':{}}}
        def metadata_read(path):
            path=Path(path);seen.append(path)
            if path==parent/'protocol.json':return protocol
            if path==parent/'seed/contract.json':return contract
            if path==ops.ORIGINAL/'seal.json':return {'suite':ops.EXPECTED_SUITE}
            raise AssertionError('dry plan attempted nonmetadata input '+str(path))
        common=SimpleNamespace(load_state=lambda p:state,read=metadata_read,
            implementation=lambda:implementation,authorize_live=lambda c:None)
        study=SimpleNamespace(validate_protocol=lambda p:None,validate_commitment=lambda p,n:None)
        with patch.object(ops,'api',return_value={'common':common,'study':study}),             patch.object(ops,'EXPECTED_IMPL',ops.digest(implementation)),             patch.object(ops,'EXPECTED_CONTRACT',ops.digest(contract)):
            result=ops.inspect_plan(parent,1)
            self.assertIsNone(result[3]);self.assertIsNone(result[4])
            self.assertTrue(all(p.name!='suite.json' for p in seen))


if __name__=='__main__':unittest.main(verbosity=2)
