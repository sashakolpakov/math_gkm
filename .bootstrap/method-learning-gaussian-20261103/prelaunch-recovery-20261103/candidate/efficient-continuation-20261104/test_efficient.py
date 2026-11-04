"""Synthetic admission and goal-loop fixtures; external effects forbidden."""
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

o=load(HERE/'coordinator.py','efficient_coordinator_neutral_tests');a=o.A
s=load(HERE/'status_public.py','efficient_status_neutral_tests')

def put(path,value):
    path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'))+'\n');return path

def ref(path):return {'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}

class Gates(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.h=put(self.root/'prepared-handoff.json',{'prepared_seal':{'archive':{'path':'neutral','sha256':'a'*64}}})
        self.old={'component':{'prepared_handoff':ref(self.h)},'binding':{'reconciliation_source':{'path':'neutral-helper','sha256':'b'*64},'reconciliation_output':'neutral-output'},'reconciliation':{'neutral':'verified'}}
        self.events=[]
        def event(name,value=None):
            def f(*args,**kwargs):self.events.append((name,args,kwargs));return value
            return f
        import machinery.study_deployment as deployment
        self.deployment=deployment
        for target,name,kwargs in ((a.O.C.P.S.O,'verify_revision',{'side_effect':event('revision')}),
            (deployment,'reuse_deployment',{'side_effect':event('prepared')}),
            (a.O.C,'deployment_from_archive',{'return_value':{'neutral':'prepared-binding'}}),
            (a,'reference',{'side_effect':lambda row:Path(row['path'])}),
            (a,'load',{'return_value':SimpleNamespace(verify_finished=event('reconciliation',self.old['reconciliation']))})):
            q=patch.object(target,name,**kwargs);q.start();self.addCleanup(q.stop)
    def test_each_distinct_native_only_obligation_exactly_once(self):
        a.native_obligations(self.old)
        self.assertEqual([x[0] for x in self.events],['revision','prepared','reconciliation'])
        self.assertEqual(self.events[0][2],{'initial':False,'native_checks':True})
        self.assertEqual(self.events[2][2]['require_current_state'],False);self.assertTrue(self.events[2][2]['native_checks'])
    def test_every_existing_gate_failure_blocks_the_rest(self):
        for stage in ('revision','prepared','reconciliation'):
            self.events.clear()
            target,name=(a.O.C.P.S.O,'verify_revision') if stage=='revision' else (self.deployment,'reuse_deployment') if stage=='prepared' else (a,'load')
            with self.subTest(stage=stage),patch.object(target,name,side_effect=RuntimeError('neutral rejection')):
                with self.assertRaises(RuntimeError):a.native_obligations(self.old)
                self.assertLessEqual(len(self.events),('revision','prepared','reconciliation').index(stage))
    def test_native_reconciliation_must_match_the_pure_exact_receipt(self):
        with patch.object(a,'load',return_value=SimpleNamespace(verify_finished=lambda *args,**kwargs:{'neutral':'changed'})):
            with self.assertRaises(RuntimeError):a.native_obligations(self.old)

class Qualification(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.here=self.root/'.bootstrap/efficient';self.here.mkdir(parents=True)
        self.predecessor=put(self.root/'.bootstrap/old.py',{'neutral':'oldsource'});self.pc=put(self.root/'.bootstrap/old-config.json',{'neutral':'config'})
        self.owner=put(self.here/'coordinator.py',{'neutral':'newsource'});self.runtime=put(self.here/'runtime.py',{'neutral':'runtime'})
        self.study=self.root/'.scratch/studies'/f'{a.O.DESTINATION_PREFIX}0003'
        self.states={}
        for mode in ('baseline','exploration'):
            current=put(self.study/'arms'/mode/'state.json',{'opaque_fixture':'do not interpret','counter':87})
            archive=put(self.root/'.bootstrap'/f'{mode}.raw',{'opaque_fixture':'do not interpret','counter':87})
            self.states[mode]={'current':ref(current),'archive':ref(archive)}
        self.old_binding={'component_source':{'path':'neutral','sha256':a.O.COMPONENT_SHA},'reconciliation_finished':{'path':'neutral','sha256':'b'*64}}
        self.old={'component':{'contract_sha256':a.O.CONTRACT_SHA,'implementation_sha256':a.O.NATIVE_SHA,'profile_sha256':a.O.PROFILE_SHA},
            'binding':self.old_binding,'transition':{'neutral':'ancestry'}}
        output=self.root/'.bootstrap/old-output'
        checkpoint=put(output/'OWNER_CHECKPOINT.json',{'schema':a.O.SCHEMA,'coordinator_source_sha256':ref(self.predecessor)['sha256'],
            'current_study':str(self.study),'epoch':3,'root_proved':False,'component_source':self.old_binding['component_source'],
            'reconciliation_finished':self.old_binding['reconciliation_finished'],'updated_at':100})
        witness=put(self.root/'.bootstrap/EXIT.json',{'schema':'math-gkm.owned-controller-exit.v1','source':ref(self.predecessor),'config':ref(self.pc),
            'output':str(output),'actual_numeric_exit_observed':True,'returncode':4,'owned_tool_handle':'synthetic-closed-handle',
            'completion_reference':'synthetic-closed-receipt','observed_at':101})
        self.handoff={'schema':a.HANDOFF_SCHEMA,'study':str(self.study),'epoch':3,'arm':'exploration','predecessor_source':ref(self.predecessor),
            'predecessor_config':ref(self.pc),'predecessor_output':str(output),'checkpoint':ref(checkpoint),'exit':ref(witness),
            'contract_sha256':a.O.CONTRACT_SHA,'implementation_sha256':a.O.NATIVE_SHA,'profile_sha256':a.O.PROFILE_SHA,
            'seal':ref(put(self.study/'seal.json',{'neutral':'seal'})),'protocol':ref(put(self.study/'protocol.json',{'neutral':'protocol'})),'states':self.states,'commands':[]}
        self.hp=put(self.root/'.bootstrap/HANDOFF.json',self.handoff)
        self.binding={'schema':a.SCHEMA,'owner_source':ref(self.owner),'admission_source':ref(Path(a.__file__)),
            'runtime_source':ref(self.runtime),'predecessor_source':ref(self.predecessor),'predecessor_config':ref(self.pc),'handoff':ref(self.hp)}
        self.events=[]
        def checkref(row):
            p=Path(row['path']);a.need(p.is_absolute() and p.resolve()==p and ref(p)==row,'changed reference');return p
        for target,name,value in ((a,'ROOT',self.root),(a,'HERE',self.here),(a,'PREDECESSOR',self.predecessor),
            (a,'PREDECESSOR_SHA',ref(self.predecessor)['sha256']),(a,'PREDECESSOR_CONFIG',self.pc),(a,'PREDECESSOR_CONFIG_SHA',ref(self.pc)['sha256'])):
            q=patch.object(target,name,value);q.start();self.addCleanup(q.stop)
        def oldconfig(*args,**kwargs):self.events.append(('pure',kwargs));return self.old
        for target,name,kwargs in ((a,'reference',{'side_effect':checkref}),(a.O,'configuration',{'side_effect':oldconfig}),
            (a.O.C,'public_study',{'return_value':{m:{'all_jobs_settled':True} for m in ('baseline','exploration')}}),
            (a,'headroom',{'side_effect':lambda:self.events.append(('headroom',))}),
            (a,'native_obligations',{'side_effect':lambda old:self.events.append(('native-once',))})):
            q=patch.object(target,name,**kwargs);q.start();self.addCleanup(q.stop)
    def qualify(self,**kwargs):return a.qualify(self.binding,**kwargs)
    def save_handoff(self):put(self.hp,self.handoff);self.binding['handoff']=ref(self.hp)
    def test_generic_current_epoch_and_counter_adoption_without_reset(self):
        result=self.qualify(initial=True);self.assertEqual(result['handoff']['epoch'],3)
        self.assertEqual(json.loads(Path(self.states['exploration']['current']['path']).read_text())['counter'],87)
        self.assertEqual(self.events,[('headroom',),('pure',{'initial':False,'native_checks':False}),('native-once',),('headroom',)])
    def test_pure_reader_performs_no_native_gate_or_headroom(self):
        self.qualify(native_checks=False);self.assertEqual(self.events,[('pure',{'initial':False,'native_checks':False})])
    def test_low_headroom_blocks_expensive_qualification(self):
        with patch.object(a,'headroom',side_effect=RuntimeError('neutral pressure')):
            with self.assertRaises(RuntimeError):self.qualify()
        self.assertEqual(self.events,[])
    def test_initial_cas_refuses_changed_current_state_but_later_progress_is_allowed(self):
        Path(self.states['exploration']['current']['path']).write_text('legitimate later state')
        with self.assertRaises(RuntimeError):self.qualify(initial=True,native_checks=False)
        self.qualify(initial=False,native_checks=False)
    def test_initial_cas_rechecked_after_expensive_gates(self):
        def change(old):Path(self.states['exploration']['current']['path']).write_text('changed during qualification')
        with patch.object(a,'native_obligations',side_effect=change):
            with self.assertRaises(RuntimeError):self.qualify(initial=True)
    def test_unsettled_receipt_refused_before_native_gates(self):
        with patch.object(a.O.C,'public_study',return_value={'baseline':{'all_jobs_settled':True},'exploration':{'all_jobs_settled':False}}):
            with self.assertRaises(RuntimeError):self.qualify(initial=True)
        self.assertFalse(any(x[0]=='native-once' for x in self.events))
    def test_exit_witness_source_config_timing_and_numeric_closure_required(self):
        path=Path(self.handoff['exit']['path']);original=json.loads(path.read_text())
        for key,value in (('actual_numeric_exit_observed',False),('owned_tool_handle',''),('returncode',None),('returncode',0),('observed_at',99),('schema','wrong'),('source',{})):
            with self.subTest(key=key):
                put(path,{**original,key:value});self.handoff['exit']=ref(path);self.save_handoff()
                with self.assertRaises(RuntimeError):self.qualify(native_checks=False)
        put(path,original)
    def test_all_predecessor_commands_need_numeric_owned_exits_and_exact_logs(self):
        output=Path(self.handoff['predecessor_output']);directory=output/'commands/000000'
        intent=put(directory/'INTENT.json',{'kind':'recover','created':100})
        log=put(directory/'private.log',{'neutral':'closed command log'})
        exit=put(directory/'EXIT.json',{'actual_numeric_exit_observed':True,'owned_handle':True,'returncode':0,'log_sha256':ref(log)['sha256']})
        with self.assertRaises(RuntimeError):self.qualify(native_checks=False)
        self.handoff['commands']=[{'intent':ref(intent),'exit':ref(exit),'log':ref(log)}];self.save_handoff();self.qualify(native_checks=False)
        for key,value in (('returncode',None),('owned_handle',False),('log_sha256','0'*64)):
            original=json.loads(exit.read_text());put(exit,{**original,key:value});self.handoff['commands'][0]['exit']=ref(exit);self.save_handoff()
            with self.subTest(key=key),self.assertRaises(RuntimeError):self.qualify(native_checks=False)
            put(exit,original)
        (output/'commands/000001').mkdir()
        self.handoff['commands'][0]['exit']=ref(exit);self.save_handoff()
        with self.assertRaises(RuntimeError):self.qualify(native_checks=False)
    def test_retained_study_stop_is_never_cleared_or_adopted_initially(self):
        path=put(self.study/'STOP.json',{'neutral':'explicit stop'})
        with self.assertRaises(RuntimeError):self.qualify(initial=True,native_checks=False)
        self.assertTrue(path.exists())
    def test_alias_or_changed_runtime_source_refused(self):
        self.runtime.write_text('changed')
        with self.assertRaises(RuntimeError):self.qualify(native_checks=False)

class Coordinator(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.profile=put(self.root/'profile.json',{'arm_seconds':1400000,'max_calls':160})
        self.old={'component':{'parent_study':str(self.root/'original'),'successor_root':str(self.root/'studies'),
            'contract_sha256':o.O.CONTRACT_SHA,'profile_sha256':o.O.PROFILE_SHA,'profile_path':str(self.profile),
            'revision_finished':{'sha256':'a'*64},'prepared_handoff':{'sha256':'b'*64}},
            'binding':{'owner_source_sha256':a.PREDECESSOR_SHA,'component_source':{'path':'neutral','sha256':o.O.COMPONENT_SHA},
                'component_config':{'path':'neutral','sha256':'9'*64},'migration_provenance':{'path':'neutral'},
                'reconciliation_finished':{'path':'neutral','sha256':'c'*64}},
            'transition':{'grant':{'path':'neutral','sha256':'d'*64}},'reconciliation':{}}
        self.binding={'owner_source':{'path':str(Path(o.__file__)),'sha256':o.sha(o.__file__)},'admission_source':{'path':'neutral','sha256':'e'*64},
            'runtime_source':{'path':'runtime.py','sha256':'f'*64},'predecessor_source':{'path':'old','sha256':a.PREDECESSOR_SHA},'predecessor_config':{},'handoff':{'path':'handoff','sha256':'1'*64}}
        self.q={'binding':self.binding,'predecessor':self.old,'handoff':{'study':str(self.root/'studies'/f'{o.DESTINATION_PREFIX}0003'),'epoch':3}}
    def test_actual_funded_command_checks_once_then_owns_real_receipt_sequence(self):
        native=o.Native(self.q,self.root/'output');calls=[]
        class Child:
            returncode=0
            def __init__(self,*args,**kwargs):calls.append('popen')
            def poll(self):return 0
            def wait(self,**kwargs):return 0
        funded=o.O.C.P.S.O.B
        with patch.object(native,'check_inputs',side_effect=lambda:calls.append('qualification')),patch.object(funded.subprocess,'Popen',Child):
            self.assertEqual(native.command('research',['neutral'],self.root/'study'),0)
        self.assertEqual(calls,['qualification','popen'])
        record=json.loads((native.output/'commands/000000/EXIT.json').read_text());self.assertEqual(record['returncode'],0)
        binding=json.loads((native.output/'coordinator-command-bindings/000000.json').read_text())
        self.assertEqual(binding['coordinator_source'],self.binding['owner_source'])
        self.assertEqual(binding['research_runtime_source'],self.binding['runtime_source'])
    def test_stop_during_hashing_prevents_funded_intent_and_child(self):
        native=o.Native(self.q,self.root/'output');stop={'value':False};native.owner_stopping=lambda:stop['value']
        def qualify(*args,**kwargs):stop['value']=True;return self.q
        with patch.object(o,'configuration',side_effect=qualify):
            with self.assertRaises(o.WaitingStopped):native.command('research',['neutral'],self.root/'study')
        self.assertFalse((native.output/'commands').exists())
        self.assertTrue((native.output/'coordinator-command-bindings/000000.json').exists())
    def test_stop_during_initial_admission_is_not_ignored(self):
        native=o.Native(self.q,self.root/'output');stop={'value':False};native.owner_stopping=lambda:stop['value']
        def qualify(*args,**kwargs):stop['value']=True;return self.q
        with patch.object(o,'configuration',side_effect=qualify):
            with self.assertRaises(o.WaitingStopped):native.admit()
    def test_transition_is_pure_and_keeps_finished_ancestry_flags(self):
        native=o.Native(self.q,self.root/'output')
        with patch.object(o,'configuration',return_value=self.q) as config:
            native.transition()
        self.assertEqual(config.call_args.kwargs,{'initial':False,'native_checks':False})
        self.assertTrue(native.prepared_completed and native.prepared_admitted);self.assertFalse(native.bootstrap_parent_pending)
    def test_runtime_argv_and_exploration_only(self):
        native=o.Native(self.q,self.root/'output')
        with patch.object(native,'command',return_value=0) as command:
            native.run(self.root/'study',False);args=command.call_args.args[1]
            self.assertIn('--operation',args);self.assertEqual(args[args.index('--operation')+1],'run')
            self.assertIn(self.binding['runtime_source']['sha256'],args)
        with self.assertRaises(RuntimeError):native.run(self.root/'study',True)
    def test_goal_loop_starts_actual_handoff_not_old_r9_or_original(self):
        events=[]
        backend=SimpleNamespace(admit=lambda:self.q['handoff'],verify=lambda p:events.append(('verify',str(p))),protocol=lambda p:{'validation_seconds':1800})
        owner=o.Owner(self.q,self.root/'output',backend)
        def continue_once(study,*args):events.append(('continue',str(study)));return False
        with patch.object(owner,'continue_until_boundary',side_effect=continue_once):self.assertEqual(owner.run(),1)
        self.assertEqual(owner.state['epoch'],3);self.assertEqual(events[1],('continue',self.q['handoff']['study']))
        self.assertFalse(owner.state['root_proved']);self.assertEqual(owner.state['coordinator_source_sha256'],self.binding['owner_source']['sha256'])
        self.assertIs(o.Owner.continue_until_boundary,o.O.Owner.continue_until_boundary)
    def test_full_existing_loop_continues_current_epoch_then_new_epoch_until_exact_proof(self):
        events=[];state={'round':9}
        class Backend:
            def admit(inner):return self.q['handoff']
            def verify(inner,study):pass
            def headroom(inner):return True
            def protocol(inner,study):return {'validation_seconds':1800,'rounds':16}
            def public(inner,study):return {'exploration':{'all_jobs_settled':True,'active_is_null':True,'active_intent_is_null':True,
                'round':state['round'],'phase':'research','calls':1,'status':'finite_budget_finished; root_open' if state['round']==16 else 'running'}}
            def proof(inner,study,modes):return {'proved':True,'bundle_hash':'b'*64,'receipt_sha256':'c'*64} if str(study).endswith('0004') else None
            def run(inner,study,both):events.append(('run',str(study),both));state['round']=16;return 0
            def finalize(inner,study,both):events.append(('finalize',str(study)));return 0
            def finalization_pending(inner,study):return False
            def curate(inner,path):events.append(('curate',str(path)))
            def migrate(inner,parent,destination,curation):events.append(('migrate',str(parent),str(destination)));return {'study':str(destination),'provenance_path':str(destination/'CONTINUATION_PROVENANCE.json')}
        owner=o.Owner(self.q,self.root/'output',Backend());self.assertEqual(owner.run(),0)
        self.assertEqual([x for x in events if x[0]=='run'],[('run',self.q['handoff']['study'],False)])
        self.assertTrue([x for x in events if x[0]=='curate'][0][1].endswith('000004'))
        self.assertEqual([x for x in events if x[0]=='migrate'][0][1],self.q['handoff']['study'])
        self.assertEqual(owner.state['epoch'],4);self.assertTrue(owner.state['root_proved'])
        self.assertIsNone(owner.state['runtime_status_path'])
    def test_boundary_stop_binds_new_actual_coordinator(self):
        backend=SimpleNamespace();owner=o.Owner(self.q,self.root/'output',backend);owner.output.mkdir()
        path=put(owner.output/'STOP_AFTER_BOUNDARY.json',{'schema':o.O.C.BOUNDARY_STOP_SCHEMA,'owner_source_sha256':a.PREDECESSOR_SHA,'reason':'handoff'})
        with self.assertRaises(RuntimeError):owner.boundary_requested()
        put(path,{'schema':o.O.C.BOUNDARY_STOP_SCHEMA,'owner_source_sha256':self.binding['owner_source']['sha256'],'reason':'handoff'})
        self.assertTrue(owner.boundary_requested())
    def test_registered_reader_exposes_source_bound_runtime_wait_without_liveness_claim(self):
        from unittest.mock import Mock
        base=self.root/'reader';source=put(base/'coordinator.py',{'neutral':'source'});output=self.root/'output'
        q=copy.deepcopy(self.q);q['binding']['owner_source']=ref(source);study=self.root/'.scratch/studies'/f'{o.DESTINATION_PREFIX}0003';q['handoff']['study']=str(study);put(study/'protocol.json',{'validation_seconds':1800,'rounds':24})
        owner=o.Owner(q,output,SimpleNamespace());owner.checkpoint('research_running')
        runtime=put(output/'commands/000000/RUNTIME_STATUS.json',{'schema':'math-gkm.efficient-runtime-status.v1',
            'source_sha256':q['binding']['runtime_source']['sha256'],'study':str(study),'operation':'run',
            'phase':'waiting_host_headroom','updated_at':101,'resource_reason':'admission_disk_headroom'})
        owner.checkpoint('research_running',runtime_status_path=str(runtime))
        config=put(base/'config.json',{'neutral':'binding'})
        put(base/'REGISTRATION.json',{'schema':s.SCHEMA,'approved':True,'status_source_sha256':hashlib.sha256(Path(s.__file__).read_bytes()).hexdigest(),
            'owner_source':ref(source),'config':ref(config),'output':str(output)})
        parser=SimpleNamespace(fields=lambda value:json.loads(value),select=lambda value,names:{k:value[k] for k in names})
        old=SimpleNamespace(COMPONENT_SHA=o.O.COMPONENT_SHA,projection=lambda:parser,raw=lambda p:Path(p).read_bytes(),
            C=SimpleNamespace(public_study=lambda *args:{'exploration':{'calls':1}}))
        fake=SimpleNamespace(configuration=Mock(return_value=q),public_json=lambda p:json.loads(Path(p).read_text()),reference=lambda row:Path(row['path']),
            CURRENT_SCHEMA=o.CURRENT_SCHEMA,DESTINATION_PREFIX=o.DESTINATION_PREFIX,O=old)
        spec=SimpleNamespace(loader=SimpleNamespace(exec_module=lambda module:None))
        with patch.object(s,'ROOT',self.root),patch.object(s.importlib.util,'spec_from_file_location',return_value=spec),patch.object(s.importlib.util,'module_from_spec',return_value=fake):
            result=s.status(base)
            self.assertEqual(fake.configuration.call_args.kwargs,{'initial':False,'native_checks':False})
            self.assertEqual(result['runtime_file_observation']['phase'],'waiting_host_headroom');self.assertTrue(result['file_observation_only'])
            self.assertEqual(result['goal_owner']['phase'],'research_running')
            bad=json.loads(runtime.read_text());bad['source_sha256']='0'*64;put(runtime,bad)
            with self.assertRaises(RuntimeError):s.status(base)
    def test_reader_not_registered_has_no_side_effect(self):
        self.assertEqual(s.status(self.root)['activation'],'not_registered')

if __name__=='__main__':unittest.main()
