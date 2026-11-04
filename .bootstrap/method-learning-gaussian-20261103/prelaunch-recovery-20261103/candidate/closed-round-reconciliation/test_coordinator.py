"""Synthetic operation fixtures only; no private state, models or compilers."""
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent

def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

o=load(HERE/'coordinator.py','closed_round_coordinator_neutral_tests')
s=load(HERE/'status_public.py','closed_round_status_neutral_tests')

def put(path,value):
    path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'))+'\n');return path

def ref(path):return {'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}


class Configuration(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.here=self.root/'.bootstrap/candidate';self.here.mkdir(parents=True)
        self.study=self.root/'.scratch/studies/method-learning-gaussian-20261103-revision-epoch-0001'
        self.component=put(self.here/'component.py',{'neutral':'component'})
        self.component_config=put(self.here/'component-config.json',{'neutral':'ancestry'})
        self.helper=put(self.here/'reconcile.py',{'neutral':'helper'})
        self.finished=put(self.root/'.bootstrap/reconciled/FINISHED.json',{'neutral':'finished'})
        self.provenance=put(self.study/'CONTINUATION_PROVENANCE.json',{'neutral':'provenance'})
        seal=put(self.study/'seal.json',{'neutral':'seal'})
        self.marker=put(self.study/'MIGRATION_FINISHED.json',{'schema':'math-gkm.closed-own-epoch.v1',
            'source_sha256':'b'*64,'seal_sha256':ref(seal)['sha256'],'provenance_sha256':ref(self.provenance)['sha256']})
        self.c={'owner_source_sha256':ref(self.component)['sha256'],'implementation_sha256':o.NATIVE_SHA,
            'contract_sha256':o.CONTRACT_SHA,'profile_sha256':o.PROFILE_SHA,'prepared_source':{'path':'unused','sha256':'b'*64},
            'parent_study':str(self.root/'.scratch/studies/original'),'successor_root':str(self.study.parent),
            'revision_finished':{'path':'unused','sha256':'c'*64},'prepared_handoff':{'path':'unused','sha256':'d'*64},
            'prepared_predecessor_config':{'path':'unused','sha256':'e'*64},'bridge_source':{'path':'unused','sha256':'f'*64}}
        self.transition={'next_destination':str(self.study),'grant':{'path':'neutral','sha256':'a'*64}}
        self.binding={'schema':o.SCHEMA,'owner_source_sha256':o.sha(o.__file__),
            'component_source':ref(self.component),'component_config':ref(self.component_config),
            'reconciliation_source':ref(self.helper),'reconciliation_output':str(self.finished.parent),
            'reconciliation_finished':ref(self.finished),'study':str(self.study),
            'migration_finished':ref(self.marker),'migration_provenance':ref(self.provenance)}
        self.result={'schema':'math-gkm.closed-round-reconciliation.v1','finished':ref(self.finished),
            'native_implementation_sha256':o.NATIVE_SHA,'round_before':8,'round_after':9,'phase_after':'research',
            'root_proved':False,'new_role_launches':0,'new_mathematical_admissions':0}
        self.calls=[]
        def verify(*args,**kwargs):self.calls.append((args,kwargs));return copy.deepcopy(self.result)
        for target,name,value in ((o,'ROOT',self.root),(o.C,'ROOT',self.root),(o,'HERE',self.here),(o,'STUDY',self.study),
             (o,'COMPONENT',self.component),(o,'COMPONENT_SHA',ref(self.component)['sha256']),
             (o,'COMPONENT_CONFIG',self.component_config),(o,'COMPONENT_CONFIG_SHA',ref(self.component_config)['sha256'])):
            q=patch.object(target,name,value);q.start();self.addCleanup(q.stop)
        for target,name,kwargs in ((o.C,'configuration',{'return_value':self.c}),
            (o.C,'verify_handoff',{'return_value':self.transition}),(o,'load',{'return_value':SimpleNamespace(verify_finished=verify)})):
            q=patch.object(target,name,**kwargs);q.start();self.addCleanup(q.stop)
    def qualify(self,**kwargs):return o.configuration(copy.deepcopy(self.binding),**kwargs)
    def test_pure_reader_forwards_false_and_ignores_evolving_current_state(self):
        self.qualify(initial=False,native_checks=False)
        self.assertEqual(self.calls[-1][1]['require_current_state'],False)
        self.assertEqual(self.calls[-1][1]['native_checks'],False)
        self.assertEqual(o.C.configuration.call_args.kwargs,{'initial':False,'native_checks':False})
    def test_initial_admission_is_exact_current_cas_and_native_qualification(self):
        self.qualify(initial=True)
        self.assertTrue(self.calls[-1][1]['require_current_state']);self.assertTrue(self.calls[-1][1]['native_checks'])
    def test_native_computed_review_phase_is_preserved(self):
        self.result['phase_after']='review';self.assertEqual(self.qualify()['reconciliation']['phase_after'],'review')
    def test_wrong_source_or_component_or_epoch_refused(self):
        for key,value in (('owner_source_sha256','0'*64),('study',str(self.study.parent/'other')),
                          ('component_config',{'path':str(self.component_config),'sha256':'0'*64})):
            with self.subTest(key=key):
                bad=copy.deepcopy(self.binding);bad[key]=value
                with self.assertRaises(RuntimeError):o.configuration(bad,native_checks=False)
    def test_unverified_completion_or_new_role_or_admission_refused(self):
        for key,value in (('root_proved',True),('new_role_launches',1),('new_mathematical_admissions',1),
                          ('round_before',7),('phase_after','unknown')):
            with self.subTest(key=key),patch.dict(self.result,{key:value}):
                with self.assertRaises(RuntimeError):self.qualify(native_checks=False)
    def test_migration_provenance_mutation_refused(self):
        self.provenance.write_text('changed')
        with self.assertRaises(RuntimeError):self.qualify(native_checks=False)
    def test_real_inherited_public_inputs_and_future_migration_dispatch(self):
        qualified=self.qualify();native=o.Native(qualified,self.root/'output')
        self.assertTrue(native.prepared_admitted and native.prepared_completed and native.adoption_admitted and
            native.resume_admitted and native.initial_revision_checked and native.transition_admitted)
        self.assertFalse(native.bootstrap_parent_pending)
        with patch.object(o,'configuration',return_value=qualified),patch.object(o.C,'public_study',return_value={'neutral':'public'}) as public:
            native.check_inputs();self.assertEqual(native.public(self.study),{'neutral':'public'})
            self.assertEqual(public.call_args.args[2],self.transition)
        with (patch.object(o.C.P.S.O.B.Native,'migrate',return_value={'neutral':'future'}) as future,
              patch.object(o.C,'load',side_effect=AssertionError('prepared replay forbidden'))):
            self.assertEqual(native.migrate(self.study,self.study.parent/'epoch2',self.root/'curation'),{'neutral':'future'})
            future.assert_called_once()
    def test_prechild_wait_restores_research_phase_before_owned_command(self):
        from machinery.resources import ResourceFailure
        qualified=self.qualify();native=o.Native(qualified,self.root/'output');owner=o.Owner(qualified,native.output,native)
        owner.output.mkdir();owner.checkpoint('research_running');observed=[]
        def command(*args):observed.append(owner.state['phase']);return 0
        with patch.object(o,'configuration',side_effect=[ResourceFailure('admission_disk_headroom'),qualified]),patch.object(o.C.Native,'check_inputs'),patch.object(o.C.Native,'command',side_effect=command),patch.object(o.time,'sleep'),patch.object(owner,'checkpoint',wraps=owner.checkpoint) as checkpoints:
            self.assertEqual(native.command('research',['neutral'],self.study),0)
        self.assertEqual([call.args[0] for call in checkpoints.call_args_list],['waiting_host_headroom','research_running'])
        self.assertEqual(observed,['research_running']);self.assertIsNone(owner.state['wait_stage'])
    def test_owned_command_records_actual_and_component_sources_separately(self):
        qualified=self.qualify();native=o.Native(qualified,self.root/'output')
        with patch.object(native,'check_inputs'),patch.object(o.C.Native,'command',return_value=0):
            self.assertEqual(native.command('research',['neutral'],self.study),0)
        record=json.loads((native.output/'coordinator-command-bindings/000000.json').read_text())
        self.assertEqual(record['coordinator_source_sha256'],self.binding['owner_source_sha256'])
        self.assertEqual(record['component_source'],self.binding['component_source'])
        self.assertNotEqual(record['coordinator_source_sha256'],record['component_source']['sha256'])


class Fake:
    def __init__(self,c):self.c=c;self.events=[];self.current=o.STUDY;self.round=9
    def admit(self):self.events.append(('admit',));return {'finished':{'path':'neutral','sha256':'a'*64}}
    def verify(self,study):self.events.append(('verify',str(study)))
    def protocol(self,study):return {'validation_seconds':1800,'rounds':16}
    def headroom(self):return True
    def public(self,study):return {'exploration':{'all_jobs_settled':True,'active_is_null':True,'active_intent_is_null':True,
        'state_file_sha256':'a'*64,'round':self.round,'phase':'research','calls':1,
        'status':'finite_budget_finished; root_open' if self.round==16 else 'running'}}
    def proof(self,study,modes):
        self.events.append(('proof',str(study),modes))
        return {'proved':True,'bundle_hash':'b'*64,'receipt_sha256':'c'*64} if str(study).endswith('0002') else None
    def run(self,study,both):self.events.append(('run',str(study),both));self.round=16;return 0
    def finalize(self,study,both):self.events.append(('finalize',str(study),both));return 0
    def finalization_pending(self,study):return False
    def curate(self,path):self.events.append(('curate',str(path)))
    def migrate(self,parent,destination,curation):
        self.events.append(('migrate',str(parent),str(destination),str(curation)))
        return {'study':str(destination),'provenance_path':str(destination/'CONTINUATION_PROVENANCE.json')}


class GoalLoop(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.study=self.root/'.scratch/studies'/('method-learning-gaussian-20261103-revision-epoch-0001')
        q=patch.object(o,'STUDY',self.study);q.start();self.addCleanup(q.stop)
        self.c={'parent_study':str(self.root/'original'),'successor_root':str(self.study.parent),
            'contract_sha256':o.CONTRACT_SHA,'profile_sha256':o.PROFILE_SHA,
            'revision_finished':{'sha256':'e'*64},'prepared_handoff':{'sha256':'f'*64}}
        self.binding={'owner_source_sha256':o.sha(o.__file__),'component_source':{'path':str(o.COMPONENT),'sha256':o.COMPONENT_SHA},
            'component_config':{'path':'neutral','sha256':'b'*64},'reconciliation_finished':{'path':'neutral','sha256':'a'*64},
            'migration_finished':{'path':'neutral','sha256':'c'*64},'migration_provenance':{'path':str(self.study/'CONTINUATION_PROVENANCE.json'),'sha256':'d'*64}}
        self.q={'component':self.c,'binding':self.binding,'transition':{},'reconciliation':{}}
    def test_real_existing_loop_starts_epoch1_then_future_epoch2_until_exact_proof(self):
        backend=Fake(self.c);owner=o.Owner(self.q,self.root/'owner',backend)
        self.assertEqual(owner.run(),0)
        run=[x for x in backend.events if x[0]=='run'];self.assertEqual(run,[('run',str(self.study),False)])
        migrations=[x for x in backend.events if x[0]=='migrate'];self.assertEqual(len(migrations),1)
        self.assertEqual(migrations[0][1],str(self.study));self.assertTrue(migrations[0][2].endswith('0002'))
        self.assertTrue([x for x in backend.events if x[0]=='curate'][0][1].endswith('000002'))
        self.assertFalse(any(str(self.root/'original') in x[1:] for x in backend.events))
        pointer=json.loads((owner.output/'CURRENT.json').read_text());self.assertTrue(pointer['root_proved'])
        self.assertEqual(pointer['epoch'],2);self.assertEqual(pointer['owner_source_sha256'],self.binding['owner_source_sha256'])
        self.assertEqual(pointer['component_source_sha256'],o.COMPONENT_SHA)
        self.assertEqual(o.Owner.continue_until_boundary,o.C.Owner.continue_until_boundary)
    def test_helper_completion_alone_never_sets_root_proved(self):
        backend=Fake(self.c);owner=o.Owner(self.q,self.root/'owner',backend)
        with patch.object(owner,'continue_until_boundary',return_value=False):self.assertEqual(owner.run(),1)
        self.assertFalse(owner.state['root_proved'])
    def test_boundary_stop_requires_actual_coordinator_identity(self):
        owner=o.Owner(self.q,self.root/'owner',Fake(self.c));owner.output.mkdir()
        path=put(owner.output/'STOP_AFTER_BOUNDARY.json',{'schema':o.C.BOUNDARY_STOP_SCHEMA,'owner_source_sha256':o.COMPONENT_SHA,'reason':'handoff'})
        with self.assertRaises(RuntimeError):owner.boundary_requested()
        put(path,{'schema':o.C.BOUNDARY_STOP_SCHEMA,'owner_source_sha256':self.binding['owner_source_sha256'],'reason':'handoff'})
        self.assertTrue(owner.boundary_requested())
    def test_reusing_owner_output_refuses_without_any_admission_or_paid_work(self):
        backend=Fake(self.c);owner=o.Owner(self.q,self.root/'owner',backend)
        put(owner.output/'OWNER_CHECKPOINT.json',{'neutral':'previous intent'})
        with self.assertRaises(RuntimeError):owner.run()
        self.assertEqual(backend.events,[])


class ResourceWaiting(unittest.TestCase):
    def test_only_known_prechild_pressure_waits_and_then_resumes(self):
        from machinery.resources import ResourceFailure
        events=[];values=iter([ResourceFailure('admission_disk_headroom'),ResourceFailure('admission_memory_headroom'),42])
        def operation():
            x=next(values)
            if isinstance(x,Exception):raise x
            return x
        with patch.object(o.time,'sleep') as sleep:
            self.assertEqual(o.resource_wait(operation,stopping=lambda:False,checkpoint=events.append),42)
        self.assertEqual(events,['admission_disk_headroom','admission_memory_headroom']);self.assertEqual(sleep.call_count,2)
        self.assertTrue(all(x.args==(15,) for x in sleep.call_args_list))
    def test_cleanup_observer_and_unknown_errors_fail_without_retry(self):
        from machinery.resources import ResourceFailure
        for reason in ('unresolved_owned_cleanup_hold','monitor_unavailable: observer','shared_heavy_reservation_busy'):
            with self.subTest(reason=reason),patch.object(o.time,'sleep') as sleep:
                with self.assertRaises(ResourceFailure):o.resource_wait(lambda:(_ for _ in ()).throw(ResourceFailure(reason)),stopping=lambda:False,checkpoint=lambda x:None)
                sleep.assert_not_called()
    def test_stop_during_wait_never_retries_paid_or_pure_operation(self):
        from machinery.resources import ResourceFailure
        stop=iter([False,True]);calls=[]
        def operation():calls.append(1);raise ResourceFailure('admission_disk_headroom')
        with patch.object(o.time,'sleep'):
            with self.assertRaises(o.WaitingStopped):o.resource_wait(operation,stopping=lambda:next(stop),checkpoint=lambda x:None)
        self.assertEqual(calls,[1])


class PublicReader(unittest.TestCase):
    def test_unregistered_is_observation_only_and_never_imports_owner(self):
        with tempfile.TemporaryDirectory() as root,patch.object(s,'load',side_effect=AssertionError('must not load')):
            result=s.status(Path(root));self.assertEqual(result['activation'],'not_registered');self.assertTrue(result['file_observation_only'])
    def test_registered_reader_uses_only_pure_verifiers_and_reports_composite_identity(self):
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp).resolve();base=root/'.bootstrap/reader';source=put(base/'coordinator.py',{'neutral':'source'})
            config=put(base/'config.json',{'neutral':'config'});output=base/'output'
            study=root/'.scratch/studies/method-learning-gaussian-20261103-revision-epoch-0002'
            put(study/'protocol.json',{'validation_seconds':1800,'rounds':24})
            binding={'owner_source_sha256':ref(source)['sha256'],'reconciliation_finished':{'sha256':'a'*64}}
            component={'contract_sha256':'b'*64,'profile_sha256':'c'*64,'parent_study':str(root/'original'),
                'revision_finished':{'sha256':'d'*64},'prepared_handoff':{'sha256':'e'*64}}
            pointer={'schema':o.CURRENT_SCHEMA,'owner_source_sha256':binding['owner_source_sha256'],
                'component_source_sha256':o.COMPONENT_SHA,'contract_sha256':'b'*64,'profile_sha256':'c'*64,
                'revision_finished_sha256':'d'*64,'prepared_handoff_sha256':'e'*64,
                'reconciliation_finished_sha256':'a'*64,'parent_study':str(root/'original'),
                'current_study':str(study),'epoch':2,'phase':'research_running','root_proved':False,'updated_at':1}
            put(output/'CURRENT.json',pointer)
            put(base/'REGISTRATION.json',{'schema':s.REGISTRATION_SCHEMA,'approved':True,
                'status_source_sha256':hashlib.sha256(Path(s.__file__).read_bytes()).hexdigest(),
                'owner_source':ref(source),'config':ref(config),'output':str(output)})
            calls=[]
            def qualify(value,**kwargs):
                calls.append(kwargs);return {'binding':binding,'component':component,'transition':{'neutral':'history'}}
            fake=SimpleNamespace(configuration=qualify,public_json=lambda p:json.loads(Path(p).read_text()),
                reference=lambda row:Path(row['path']),CURRENT_SCHEMA=o.CURRENT_SCHEMA,COMPONENT_SHA=o.COMPONENT_SHA,
                DESTINATION_PREFIX=o.DESTINATION_PREFIX,STUDY=study,projection=o.projection,raw=o.raw,
                C=SimpleNamespace(public_study=lambda *args:{'exploration':{'calls':1}}))
            with patch.object(s,'ROOT',root),patch.object(s,'load',return_value=fake):result=s.status(base)
            self.assertEqual(calls,[{'initial':False,'native_checks':False}]);self.assertTrue(result['file_observation_only'])
            self.assertEqual(result['coordinator_source_sha256'],binding['owner_source_sha256'])
            self.assertEqual(result['component_source_sha256'],o.COMPONENT_SHA)
            self.assertFalse(result['goal_owner']['root_proved']);self.assertEqual(result['goal_owner']['epoch'],2)
    def test_unapproved_source_registration_refused_before_owner_import(self):
        with tempfile.TemporaryDirectory() as root,patch.object(s,'load',side_effect=AssertionError('must not load')):
            base=Path(root);(base/'coordinator.py').write_text('neutral')
            put(base/'REGISTRATION.json',{'schema':s.REGISTRATION_SCHEMA,'approved':False,'status_source_sha256':'0'*64,
                'owner_source':ref(base/'coordinator.py'),'config':{},'output':str(base/'output')})
            with self.assertRaises(RuntimeError):s.status(base)

if __name__=='__main__':unittest.main()
