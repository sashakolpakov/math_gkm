"""Prospective owner lifecycle controls; synthetic outcomes, no paid work."""
import copy
import importlib.util
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch,Mock

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('prospective_owner_under_test',HERE/'owner.py')
o=importlib.util.module_from_spec(spec);spec.loader.exec_module(o)
sys.path.insert(0,str(o.ROOT))

def row(round,status='finite_budget_finished; root_open',closed=True):
    return dict(round=round,phase='research',status=status,calls=2,meta_calls=1,failures=0,
        active_is_null=True,active_intent_is_null=True,resolution_is_null=True,
        state_file_sha256='a'*64,all_job_receipts_numeric=closed,knowledge_count=0,components_count=0)

class Fake:
    def __init__(self,parent,prove_after=1):
        self.parent=str(parent);self.ends={self.parent:8};self.rows={self.parent:{m:row(8) for m in ('baseline','exploration')}}
        self.runs=[];self.curations=[];self.migrations=[];self.recoveries=[];self.finalizations=[]
        self.prove_after=prove_after;self.resource_ready=True;self.finalize_code=0
        self.on_run=None;self.on_curate=None;self.on_migrate=None
        self.transition_result=dict(parent_study=self.parent,original_comparison_study=self.parent,actual_numeric_exit_observed=True)
        self.inherited_execution_budget={'validation_seconds':600}
    def transition(self):return copy.deepcopy(self.transition_result)
    def public(self,study):return copy.deepcopy(self.rows[str(study)])
    def verify(self,study):pass
    def proof(self,study,modes):
        return (dict(proved=True,refuted=False,bundle_hash='f'*64,receipt_sha256='e'*64)
                if len(self.runs)>=self.prove_after else None)
    def protocol(self,study):return {'rounds':self.ends[str(study)]}
    def headroom(self):return self.resource_ready
    def recover(self,study):
        self.recoveries.append(str(study));raise AssertionError('bootstrap never recovers/replays parent')
    def curate(self,path):
        self.curations.append(Path(path));o.write(Path(path)/'provenance.json',{'synthetic':'completed paid-setup stand-in'})
        if self.on_curate:self.on_curate()
        return path
    def migrate(self,parent,destination,curation):
        self.migrations.append((str(parent),str(destination),str(curation)))
        self.ends[str(destination)]=self.ends[str(parent)]+8
        self.rows[str(destination)]={'baseline':row(0,'ready'),'exploration':row(self.ends[str(parent)],'ready')}
        if self.on_migrate:self.on_migrate()
        return dict(study=str(destination),provenance_path='synthetic-preserved-own-history.json')
    def run(self,study,both):
        if str(study)==self.parent:raise AssertionError('finished historical paid calls must never rerun')
        self.runs.append((str(study),both));self.rows[str(study)]['exploration']=row(self.ends[str(study)])
        if self.on_run:self.on_run()
        return 0
    def finalize(self,study,both):self.finalizations.append((str(study),both));return self.finalize_code
    def finalization_pending(self,study):return False

class LifecycleTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.base=Path(self.temp.name).resolve()
        self.parent=self.base/'parent';self.parent.mkdir();self.output=self.base/'owner'
        self.config=dict(parent_study=str(self.parent),successor_root=str(self.base/'studies'),
            owner_source_sha256='d'*64,contract_sha256='c'*64,profile_sha256='f'*64,
            transition_receipt={'path':str(self.base/'receipt.json'),'sha256':'b'*64})
        o.STOPPING=False
    def build(self,n=1):
        backend=Fake(self.parent,n);return o.Owner(self.config,self.output,backend),backend
    def request(self):
        o.write(self.output/'STOP_AFTER_BOUNDARY.json',dict(schema=o.BOUNDARY_STOP_SCHEMA,
            owner_source_sha256=self.config['owner_source_sha256'],reason='prospective operator transition'))
    def test_migration_first_never_replays_finished_parent(self):
        instance,backend=self.build();self.assertEqual(instance.run(),0)
        self.assertEqual(len(backend.migrations),1);self.assertEqual(len(backend.curations),1)
        self.assertEqual(backend.migrations[0][0],str(self.parent));self.assertFalse(backend.recoveries)
        self.assertTrue(all(study!=str(self.parent) and both is False for study,both in backend.runs))
        self.assertEqual(backend.inherited_execution_budget,{'validation_seconds':600})
        self.assertIn(o.DESTINATION_PREFIX,backend.migrations[0][1])
    def test_unbounded_epoch_count_still_uses_only_verified_goal_verdict(self):
        instance,backend=self.build(3);self.assertEqual(instance.run(),0)
        self.assertEqual(len(backend.runs),3);self.assertTrue(instance.state['root_proved'])
        pointer=o.public_json(self.output/'CURRENT.json')
        self.assertEqual(pointer['schema'],o.CURRENT_SCHEMA);self.assertEqual(pointer['epoch'],3)
        self.assertEqual(pointer['profile_sha256'],self.config['profile_sha256'])
        self.assertEqual(pointer['transition_receipt_sha256'],self.config['transition_receipt']['sha256'])
    def test_missing_actual_closure_or_wrong_parent_stops_before_paid_setup(self):
        for change in ({'actual_numeric_exit_observed':False},{'actual_numeric_exit_observed':1},{'parent_study':str(self.base/'wrong')}):
            with self.subTest(change=change):
                output=self.base/str(len(list(self.base.iterdir())));self.output=output
                instance,backend=self.build();backend.transition_result.update(change)
                with self.assertRaises(o.Hold):instance.run()
                self.assertFalse(backend.curations);self.assertFalse(backend.runs)
    def test_boundary_request_before_curation_has_distinct_nonpause_exit(self):
        instance,backend=self.build();self.request();self.assertEqual(instance.run(),4)
        self.assertEqual(instance.state['phase'],'operator_transition_boundary')
        self.assertFalse(backend.curations);self.assertFalse(backend.runs)
        self.assertFalse((self.parent/'STOP.json').exists())
    def test_request_during_research_finishes_finite_epoch_before_stopping(self):
        instance,backend=self.build(100);backend.on_run=self.request
        self.assertEqual(instance.run(),4);self.assertEqual(len(backend.runs),1)
        self.assertEqual(len(backend.curations),1);self.assertEqual(instance.state['phase'],'operator_transition_boundary')
        self.assertFalse((Path(backend.runs[0][0])/'STOP.json').exists())
        self.assertEqual(backend.finalizations,[(str(self.parent),True),(backend.runs[0][0],False)])
    def test_request_during_paid_curation_keeps_artifact_without_new_migration(self):
        instance,backend=self.build(100);backend.on_curate=self.request
        self.assertEqual(instance.run(),4);self.assertFalse(backend.migrations)
        self.assertTrue((backend.curations[0]/'provenance.json').is_file())
        self.assertEqual(instance.state['pending_curation'],str(backend.curations[0]))
    def test_request_during_migration_keeps_prepared_successor_no_research(self):
        instance,backend=self.build(100);backend.on_migrate=self.request
        self.assertEqual(instance.run(),4);self.assertEqual(len(backend.migrations),1);self.assertFalse(backend.runs)
        self.assertEqual(instance.state['current_study'],str(self.parent))
        self.assertEqual(instance.state['prepared_successor'],backend.migrations[0][1])
    def test_unhandled_historical_native_stop_is_preserved_without_silent_migration(self):
        (self.parent/'STOP.json').write_text('historical operator transition')
        instance,backend=self.build();self.assertFalse(instance.stopping())
        with self.assertRaisesRegex(o.Hold,'retained parent native STOP'):instance.run()
        self.assertFalse(backend.curations);self.assertFalse(backend.runs)
        self.assertTrue((self.parent/'STOP.json').exists())
        self.assertNotEqual(instance.state['phase'],'user_stopped')
    def test_explicit_new_owner_stop_keeps_legacy_immediate_semantics(self):
        instance,backend=self.build();self.output.mkdir();(self.output/'STOP').write_text('user request')
        self.assertEqual(instance.run(),1);self.assertEqual(instance.state['phase'],'user_stopped');self.assertFalse(backend.curations)
    def test_existing_exact_parent_proof_finishes_without_setup_or_migration(self):
        instance,backend=self.build(100)
        backend.proof=lambda *_:dict(proved=True,refuted=False,bundle_hash='a'*64,receipt_sha256='b'*64)
        self.assertEqual(instance.run(),0);self.assertTrue(instance.state['root_proved'])
        self.assertFalse(backend.finalizations);self.assertFalse(backend.curations);self.assertFalse(backend.migrations)
        self.assertFalse(backend.runs);self.assertFalse(backend.recoveries)
    def test_parent_candidate_finalized_to_exact_proof_before_new_curation(self):
        instance,backend=self.build(100)
        backend.proof=lambda *_:(dict(proved=True,refuted=False,bundle_hash='a'*64,receipt_sha256='b'*64) if backend.finalizations else None)
        self.assertEqual(instance.run(),0);self.assertEqual(backend.finalizations,[(str(self.parent),True)])
        self.assertFalse(backend.curations);self.assertFalse(backend.migrations);self.assertFalse(backend.runs)
    def test_original_parent_drains_both_modes(self):
        instance,backend=self.build();self.assertEqual(instance.run(),0)
        self.assertEqual(backend.finalizations[0],(str(self.parent),True))
    def test_legacy_successor_parent_drains_only_exploration(self):
        instance,backend=self.build();backend.transition_result['original_comparison_study']=str(self.base/'original')
        backend.rows[str(self.parent)]['baseline']=row(0,'ready')
        self.assertEqual(instance.run(),0);self.assertEqual(backend.finalizations[0],(str(self.parent),False))
        self.assertFalse(backend.recoveries)
    def test_parent_must_remain_finite_without_research_recovery(self):
        instance,backend=self.build();backend.rows[str(self.parent)]['exploration']=row(7,'running')
        with self.assertRaisesRegex(o.Hold,'not closed and finite'):instance.run()
        self.assertFalse(backend.curations);self.assertFalse(backend.runs);self.assertFalse(backend.recoveries)
    def test_parent_refutation_uses_existing_strict_stop_semantics(self):
        instance,backend=self.build()
        def refuted(*_):raise o.Refuted(dict(refuted=True,proved=False,bundle_hash='a'*64,receipt_sha256='b'*64))
        backend.proof=refuted
        with self.assertRaises(o.Refuted):instance.run()
        self.assertFalse(backend.curations);self.assertFalse(instance.state['root_proved'])
    def test_stopped_or_pending_finalizer_summary_is_not_no_eligible_evidence(self):
        native=o.Native({'finalization_source':{'sha256':'a'*64},'implementation_sha256':'b'*64},self.output)
        output=self.base/'finalizer';native.finalizations=[(str(self.parent),output)]
        for status in ('stopped','pending_primary_sources_unavailable','native_unresolved','cached_native_unresolved','unknown',None,'native_resolved'):
            o.write(output/'summary.json',dict(status=status,source_sha256='a'*64,implementation_sha256='b'*64,more_eligible=False))
            with self.subTest(status=status),self.assertRaises(o.Hold):native.finalization_pending(self.parent)
    def test_only_closed_rejection_or_no_eligible_summaries_allow_further_drain(self):
        native=o.Native({'finalization_source':{'sha256':'a'*64},'implementation_sha256':'b'*64},self.output)
        output=self.base/'closed-finalizer';native.finalizations=[(str(self.parent),output)]
        for status in ('no_eligible_current_exact_root','independent_rejection','cached_independent_rejection'):
            o.write(output/'summary.json',dict(status=status,source_sha256='a'*64,implementation_sha256='b'*64,more_eligible=False))
            with self.subTest(status=status):self.assertIs(native.finalization_pending(self.parent),False)
    def test_malformed_boundary_request_fails_closed(self):
        instance,backend=self.build();o.write(self.output/'STOP_AFTER_BOUNDARY.json',{'schema':o.BOUNDARY_STOP_SCHEMA,'owner_source_sha256':'0'*64,'reason':'x'})
        with self.assertRaises(o.Hold):instance.run()
        self.assertFalse(backend.curations)
    def test_incomplete_finalizer_not_replayed(self):
        instance,backend=self.build(100);backend.finalize_code=2
        with self.assertRaises(o.Hold):instance.run()
        self.assertEqual(len(backend.finalizations),1);self.assertEqual(len(backend.curations),0)
    def test_job_without_numeric_closure_is_not_replayed(self):
        instance,backend=self.build(100)
        backend.on_run=lambda:backend.rows[backend.runs[-1][0]]['exploration'].update(all_job_receipts_numeric=False)
        with self.assertRaises(o.Hold):instance.run()
        self.assertEqual(len(backend.runs),1);self.assertFalse(backend.recoveries)
    def test_counts_and_exit_codes_are_never_theorem_evidence(self):
        instance,backend=self.build(100);backend.on_run=self.request
        for row_ in backend.rows[str(self.parent)].values():row_['knowledge_count']=100000
        self.assertEqual(instance.run(),4);self.assertFalse(instance.state['root_proved'])
    def test_truthy_unverified_root_verdict_is_rejected(self):
        instance,backend=self.build();backend.proof=lambda *_:{'proved':1,'bundle_hash':'f'*64,'receipt_sha256':'e'*64}
        with self.assertRaises(o.Hold):instance.run()
        self.assertFalse(instance.state['root_proved'])
    def test_existing_checkpoint_is_not_automatically_replayed(self):
        instance,backend=self.build();instance.checkpoint('synthetic prior intent')
        with self.assertRaises(o.Hold):instance.run()
        self.assertFalse(backend.curations)
    def test_boundary_request_does_not_signal_an_active_owned_child(self):
        instance,backend=self.build();self.request()
        native=o.Native({},self.base/'native-command');native.owner_stopping=instance.stopping
        child=Mock();child.poll.side_effect=[None,0,0];child.wait.return_value=0
        with patch.object(native,'check_inputs'),patch.object(o.subprocess,'Popen',return_value=child),patch.object(o.time,'sleep'):
            self.assertEqual(native.command('neutral',['SYNTHETIC no external process'],self.parent),0)
        child.send_signal.assert_not_called();child.terminate.assert_not_called();child.kill.assert_not_called()
        self.assertFalse((self.parent/'STOP.json').exists())
    def test_new_funder_must_explicitly_accept_whole_horizon(self):
        path=self.base/'profile.json';o.write(path,{'validation_seconds':1800,'rounds':8})
        config={'profile_path':str(path),'funding_source':{}}
        for result in ({'accepted':False},{'accepted':1},None):
            with patch.object(o,'load_pinned',return_value=SimpleNamespace(qualify_profile=lambda *args,**kwargs:result)):
                with self.assertRaises(o.Hold):o.qualify_funding(config)
    def test_genuine_pure_funding_gate_accepts_qualified_profile_and_refuses_600000(self):
        source=HERE/'funding_profile.py'
        config={'profile_path':str(HERE/'successor-profile.json'),
            'funding_source':{'path':str(source),'sha256':o.sha(source)}}
        result=o.qualify_funding(config);self.assertIs(result['accepted'],True)
        profile=o.public_json(config['profile_path']);profile['arm_seconds']=600000
        changed=self.base/'underfunded.json';o.write(changed,profile);config['profile_path']=str(changed)
        with self.assertRaises(ValueError):o.qualify_funding(config)

    def test_historical_comparison_pointer_is_preserved_separately_from_parent(self):
        instance,backend=self.build();original=str(self.base/'historical-original')
        backend.transition_result['original_comparison_study']=original
        self.assertEqual(instance.run(),0)
        self.assertEqual(o.public_json(self.output/'CURRENT.json')['original_comparison_study'],original)

    def test_finalizer_changes_only_explicit_budgets_and_native_admission_margin(self):
        original=(HERE.parent/'continuation/finalize.py').read_bytes();new=(HERE/'finalize.py').read_bytes()
        expected=original.replace(b'VALIDATION_SECONDS = 600',b'VALIDATION_SECONDS = 1800')
        expected=expected.replace(b'REVIEW_SECONDS = 1800',b'REVIEW_SECONDS = 1740')
        expected=expected.replace(b'timeout=REVIEW_SECONDS+5',b'timeout=min(1800,REVIEW_SECONDS+60)')
        self.assertEqual(new,expected)

class ActualTransitionIntegrationTests(unittest.TestCase):
    def test_real_closed_transition_receipt_passes_new_typed_owner_gate(self):
        spec=importlib.util.spec_from_file_location('owner_transition_fixture',HERE/'test_transition.py')
        fixtures=importlib.util.module_from_spec(spec);spec.loader.exec_module(fixtures)
        with tempfile.TemporaryDirectory() as temporary:
            f=fixtures.make_fixture(Path(temporary).resolve());backend=fixtures.FakeNative(f)
            with patch.object(fixtures.t,'ROOT',f.base):
                backend.on_sleep=lambda _:fixtures.close_fixture(f,backend)
                fixtures.t.Gate(f.binding,f.destination,backend).activate(f.activation)
                receipt=f.destination/'TRANSITION_FINISHED.json'
                self.assertTrue(receipt.is_file())
                config=dict(parent_study=str(f.initial),profile_path=str(f.newprofile_path),profile_sha256=fixtures.t.sha(f.newprofile_path),
                    contract_sha256=fixtures.t.digest(f.contract),implementation_sha256='1'*64,
                    transition_source={'path':fixtures.t.__file__,'sha256':fixtures.t.sha(fixtures.t.__file__)},
                    transition_binding=fixtures.pinned(f.binding),transition_receipt=fixtures.pinned(receipt),
                    legacy_owner={'source':fixtures.pinned(f.oldsource),'config':fixtures.pinned(f.config),
                        'profile':fixtures.pinned(f.profile_path),'output':str(f.output)})
                with patch.object(o,'load_pinned',return_value=fixtures.t),patch.object(fixtures.t,'Native',return_value=fixtures.FakeNative(f)):
                    value=o.verify_transition(config)
                    self.assertTrue(value['actual_numeric_exit_observed'])
                    config['legacy_owner']['config']={**config['legacy_owner']['config'],'sha256':'0'*64}
                    with self.assertRaises(o.Hold):o.verify_transition(config)

class BootstrapRevalidationTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup)
        self.base=Path(self.temp.name).resolve()
        spec=importlib.util.spec_from_file_location('fresh_transition_for_bootstrap',HERE/'test_transition.py')
        self.fx=importlib.util.module_from_spec(spec);spec.loader.exec_module(self.fx)
    def fixture(self,name):
        directory=self.base/name;directory.mkdir()
        f=self.fx.make_fixture(directory);backend=self.fx.FakeNative(f)
        backend.on_sleep=lambda _:self.fx.close_fixture(f,backend)
        with patch.object(self.fx.t,'ROOT',f.base):
            self.fx.t.Gate(f.binding,f.destination,backend).activate(f.activation)
        receipt=f.destination/'TRANSITION_FINISHED.json'
        config=dict(parent_study=str(f.initial),profile_path=str(f.newprofile_path),profile_sha256=self.fx.t.sha(f.newprofile_path),
            contract_path=str(f.base/'contract.json'),owner_source_sha256=o.sha(HERE/'owner.py'),
            contract_sha256=self.fx.t.digest(f.contract),implementation_sha256='1'*64,
            epoch_source=self.fx.pinned(f.epoch),
            transition_source={'path':self.fx.t.__file__,'sha256':self.fx.t.sha(self.fx.t.__file__)},
            transition_binding=self.fx.pinned(f.binding),transition_receipt=self.fx.pinned(receipt),
            legacy_owner={'source':self.fx.pinned(f.oldsource),'config':self.fx.pinned(f.config),
                'profile':self.fx.pinned(f.profile_path),'output':str(f.output)})
        return f,config
    def alter(self,f,kind):
        if kind=='parent':
            path=f.initial/'arms/exploration/state.json';state=self.fx.t.read(path)['state'];state['round']=7
            self.fx.put(path,{'state':state,'sha256':self.fx.t.digest(state)})
        elif kind=='stop':(f.output/'STOP').write_text('altered controlled stop evidence')
        else:
            value=self.fx.t.read(f.exit_path);value['tampered']=True;self.fx.put(f.exit_path,value)
    def test_parent_stop_or_exit_mutation_refused_before_bootstrap_paid_curation(self):
        for kind in ('parent','stop','exit'):
            with self.subTest(kind=kind):
                f,config=self.fixture('before-'+kind);native=o.Native(config,f.base/'newowner')
                with patch.object(self.fx.t,'ROOT',f.base),patch.object(self.fx.t,'Native',return_value=self.fx.FakeNative(f)),                      patch.object(o,'load_pinned',return_value=self.fx.t),patch.object(native,'check_inputs'),                      patch.object(native,'command',return_value=0) as command:
                    native.transition();self.assertTrue(native.transition_admitted)
                    self.alter(f,kind)
                    with self.assertRaises(o.Hold):native.curate(f.base/'fresh-curation')
                    command.assert_not_called();self.assertFalse((f.base/'fresh-curation').exists())
    def test_mutation_during_paid_curation_keeps_artifact_but_prevents_migration(self):
        for kind in ('parent','stop','exit'):
            with self.subTest(kind=kind):
                f,config=self.fixture('during-'+kind);native=o.Native(config,f.base/'newowner');curation=f.base/'curation'
                def paid_stand_in(*args):
                    self.fx.put(curation/'provenance.json',{'synthetic':'already completed; never redo'})
                    self.alter(f,kind);return 0
                with patch.object(self.fx.t,'ROOT',f.base),patch.object(self.fx.t,'Native',return_value=self.fx.FakeNative(f)),                      patch.object(o,'load_pinned',return_value=self.fx.t),patch.object(native,'check_inputs'),                      patch.object(native,'command',side_effect=paid_stand_in) as command:
                    native.transition();native.curate(curation);before=o.sha(curation/'provenance.json')
                    with self.assertRaises(o.Hold):native.migrate(f.initial,f.base/'forbidden-successor',curation)
                    self.assertEqual(command.call_count,1);self.assertFalse((f.base/'forbidden-successor').exists())
                    self.assertEqual(o.sha(curation/'provenance.json'),before);self.assertTrue(native.bootstrap_parent_pending)
    def test_verified_first_migration_releases_only_the_bootstrap_parent_gate(self):
        f,config=self.fixture('later');native=o.Native(config,f.base/'newowner')
        def neutral_migrate(parent,destination,**kwargs):
            o.write(destination/'seal.json',{'synthetic':'seal'})
            o.write(destination/'arms/exploration/state.json',{'synthetic':'closed source state'})
            o.write(destination/'provenance.json',{'synthetic':'original migration stand-in'})
            result=dict(study=str(destination),provenance_path=str(destination/'provenance.json'),
                parent_state_sha256=o.sha(parent/'arms/exploration/state.json'),epoch_start_binding='e'*64)
            o.write(destination/'MIGRATION_FINISHED.json',dict(schema='math-gkm.closed-own-epoch.v1',
                source_sha256=config['epoch_source']['sha256'],seal_sha256=o.sha(destination/'seal.json'),
                state_sha256=o.sha(destination/'arms/exploration/state.json'),provenance_sha256=o.sha(destination/'provenance.json'),
                parent_state_sha256=result['parent_state_sha256'],epoch_start_binding=result['epoch_start_binding']))
            return result
        specification=SimpleNamespace(loader=SimpleNamespace(exec_module=lambda module:None))
        with patch.object(native,'check_inputs'),patch.object(native,'transition') as transition,              patch.object(o.importlib.util,'spec_from_file_location',return_value=specification),              patch.object(o.importlib.util,'module_from_spec',return_value=SimpleNamespace(migrate=neutral_migrate)):
            first=f.base/'successor-one';native.migrate(f.initial,first,f.base/'curation-one')
            self.assertFalse(native.bootstrap_parent_pending);self.assertEqual(transition.call_count,1)
            self.alter(f,'parent');transition.side_effect=AssertionError('historical parent must not be retargeted')
            curation=f.base/'curation-two'
            def paid_stand_in(*args):o.write(curation/'provenance.json',{'synthetic':True});return 0
            with patch.object(native,'command',side_effect=paid_stand_in):native.curate(curation)
            native.migrate(first,f.base/'successor-two',curation)
            self.assertEqual(transition.call_count,1)

if __name__=='__main__':unittest.main()
