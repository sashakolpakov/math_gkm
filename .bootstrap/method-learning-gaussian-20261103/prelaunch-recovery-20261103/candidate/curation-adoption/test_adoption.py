"""Neutral operational tests only; no live study, mathematical task or model."""
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent

def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

o=load(HERE/'owner.py','paid_adoption_tested')
previous=load(HERE.parent/'continuation/test_continuation.py','paid_adoption_prior_fixtures')

def put(path,value):
    path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'))+'\n');return path

def ref(path):return {'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
def envelope(path,state):return put(path,{'state':state,'sha256':o.digest(state)})

class Fixture(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        p=patch.object(o,'ROOT',self.root);p.start();self.addCleanup(p.stop)
        self.parent=self.root/'.scratch/studies/original';self.oldoutput=self.root/'.bootstrap/old-output';self.curation=self.oldoutput/'curation/000001'
        self.contract={'neutral':'unchanged goal metadata'}
        self.suite={'private_canary':'never decode the selected mathematical tasks'}
        self.receipt={'role':'curator','request_id':'independent-curation','outcome':'completed','returncode':0,
            'model':'gpt-6.1-sol','reasoning_effort':'high','elapsed_seconds':603,'mathematical_resolution':False,'payload':{'suite':self.suite}}
        paths={
            'suite':put(self.curation/'suite.json',self.suite),'receipt':put(self.curation/'job/receipt.json',self.receipt),
            'spec':put(self.curation/'job/spec.json',{'role':'curator','request_id':'independent-curation','model':'gpt-6.1-sol','reasoning_effort':'high','transport':'live','readonly':True,'seconds':1800,'workspace':str(self.curation/'workspace')}),
            'request':put(self.curation/'job/request.json',{'role':'curator','request_id':'independent-curation','task_limits':{'holdout':12,'regression':1},'layout':{'method':8,'assessment':2,'final':2}}),
            'watchdog_launch':put(self.curation/'watchdog-launch.json',{'returncode':0,'termination':None,'operationally_incomplete':False}),
            'context':put(self.curation.with_name('000001.context.json'),{'schema':'math-gkm.successor-curation-context.v1','owner_source_sha256':o.PREDECESSOR_SHA,'acquired_method_inputs_supplied':False,'input_separation_only':True,'statistical_independence_claimed':False})}
        paths['prompt']=self.curation/'job/prompt.txt';paths['prompt'].write_text('opaque original curator prompt')
        provenance={'role':'independent_pretrial_selector','receipt':str(paths['receipt']),'receipt_sha256':ref(paths['receipt'])['sha256'],
            'suite_sha256':o.digest(self.suite),'model':'gpt-6.1-sol','reasoning_effort':'high','transport':'live',
            'task_limits':{'holdout':12,'regression':1},'layout':{'method':8,'assessment':2,'final':2}}
        paths['provenance']=put(self.curation/'provenance.json',provenance)
        for name in ('seed/contract.json','workspace/contract.json'):put(self.curation/name,self.contract)
        self.currow={'directory':str(self.curation),**{k:ref(p) for k,p in paths.items()}}
        self.preconfig=put(self.root/'.bootstrap/predecessor-config.json',{'neutral':'pinned prior config'})
        states={}
        for mode in ('baseline','exploration'):
            state={'round':8,'phase':'research','status':'finite_budget_finished; root_open','calls':37,'meta_calls':17,
                'active':None,'active_intent':None,'resolution':None,'research':{'private_canary':'opaque theory'}}
            live=envelope(self.parent/'arms'/mode/'state.json',state);archive=envelope(self.root/'.bootstrap/stopped'/f'{mode}.json',state)
            states[mode]={'current':ref(live),'archive':ref(archive)}
        protocol=put(self.parent/'protocol.json',{'rounds':8,'validation_seconds':600});seal=put(self.parent/'seal.json',{'neutral':'same sealed inputs'})
        destination=self.root/'.scratch/studies'/(o.DESTINATION_PREFIX+'0001');self.destination=destination
        self.archive=self.root/'.scratch/studies/failed-preserved';neutral=self.archive/'deployment-preflight'
        result=put(neutral/'result.json',{'schema':'math-gkm.deployment-preflight.v1','ready':False,'neutral':True,'hosted_model_calls':0,'failure':'neutral disk admission failure'})
        receipt=put(neutral/'receipt.json',{'ready':False,'result_sha256':ref(result)['sha256']})
        files={str(p.relative_to(self.archive)):ref(p)['sha256'] for p in self.archive.rglob('*') if p.is_file()}
        retirement=put(self.root/'.bootstrap/RETIREMENT.json',{'schema':o.RETIREMENT_SCHEMA,'original_destination':str(destination),'archived_destination':str(self.archive),
            'files':files,'neutral_only':True,'model_calls':0,'result':ref(result),'receipt':ref(receipt)})
        self.commands=[]
        contract_path=str(self.parent/'seed/contract.json')
        for index,kind in enumerate(('research','finalization','curation')):
            directory=self.oldoutput/'commands'/f'{index:06d}';directory.mkdir(parents=True)
            log=directory/'private.log';log.write_text('opaque original completed command')
            argv=['python','neutral'] if index<2 else ['python','-c','neutral-source',str(self.curation),contract_path,str(o.PREDECESSOR),o.PREDECESSOR_SHA]
            intent=put(directory/'INTENT.json',{'kind':kind,'study':str(self.curation) if kind=='curation' else str(self.parent),'argv':argv})
            exit_record=put(directory/'EXIT.json',{'actual_numeric_exit_observed':True,'owned_handle':True,'returncode':0,'log_sha256':ref(log)['sha256']})
            self.commands.append({'intent':ref(intent),'exit':ref(exit_record),'log':ref(log)})
        checkpoint=put(self.oldoutput/'OWNER_CHECKPOINT.json',{'phase':'needs_reconciliation','current_study':str(self.parent),
            'pending_curation':str(self.curation),'pending_successor':str(destination),'epoch':0,'root_proved':False})
        self.h={'schema':o.HANDOFF_SCHEMA,'study':str(self.parent),'arm':'exploration','contract_sha256':o.S.CONTRACT_SHA,
            'implementation_sha256':'a'*64,'predecessor_owner':{'path':str(o.PREDECESSOR),'sha256':o.PREDECESSOR_SHA},
            'predecessor_config':ref(self.preconfig),'predecessor_output':str(self.oldoutput),
            'owner_exit':{'actual_numeric_exit_observed':True,'returncode':2,'owned_tool_handle':'neutral-closed-handle','completion_reference':'neutral actual observation'},
            'checkpoint':ref(checkpoint),'commands':self.commands,'curation':self.currow,'seal':ref(seal),'protocol':ref(protocol),
            'parent_states':states,'retirement':ref(retirement),'next_destination':str(destination),
            'paid_curation_replay_authorized':False,'original_research_replay_authorized':False}
        self.hp=put(self.root/'.bootstrap/HANDOFF.json',self.h)
        self.c={'parent_study':str(self.parent),'successor_root':str(self.root/'.scratch/studies'),'contract_path':contract_path,
            'contract_sha256':o.S.CONTRACT_SHA,'implementation_sha256':'a'*64,'adoption_predecessor_config':ref(self.preconfig),'adoption_handoff':ref(self.hp)}
    def save(self):put(self.hp,self.h);self.c['adoption_handoff']=ref(self.hp)
    def verify(self,initial=True):
        rows={m:{'all_jobs_settled':True,'active_is_null':True,'active_intent_is_null':True,'round':8,'phase':'research','status':'finite_budget_finished; root_open'} for m in ('baseline','exploration')}
        with patch.object(o.S,'configuration',return_value={}),patch.object(o.S,'verify_handoff',return_value={'grant':{}}),patch.object(o.S,'public_study',return_value=rows),patch.object(o,'retained_curation',return_value=self.curation):
            return o.verify_adoption(self.c,initial=initial,native_checks=False)

class CurationIntegrity(Fixture):
    def retained(self):return o.retained_curation({**self.c,'contract_sha256':o.digest(self.contract)},self.h)
    def test_completed_paid_curation_is_reusable_without_model(self):self.assertEqual(self.retained(),self.curation)
    def test_opaque_suite_and_receipt_payload_are_not_decoded(self):
        original=json.loads
        def guarded(data,*args,**kw):
            text=data.decode() if isinstance(data,bytes) else str(data)
            if 'private_canary' in text and text.lstrip().startswith(('{','[')):raise AssertionError('private suite decoded')
            return original(data,*args,**kw)
        with patch.object(json,'loads',guarded):self.retained()
    def test_receipt_or_suite_tampering_refuses_adoption(self):
        put(self.curation/'suite.json',{'different':'panel'})
        with self.assertRaises(o.Hold):self.retained()
    def test_wrong_curator_source_context_refuses(self):
        p=Path(self.currow['context']['path']);value=json.loads(p.read_bytes());value['owner_source_sha256']='b'*64;put(p,value);self.currow['context']=ref(p)
        with self.assertRaises(o.Hold):self.retained()
    def test_wrong_goal_refuses(self):
        with self.assertRaises(o.Hold):o.retained_curation({**self.c,'contract_sha256':'f'*64},self.h)

class HandoffIntegrity(Fixture):
    def test_initial_state_cas_then_later_progress_need_not_equal_old_hash(self):
        self.verify();p=Path(self.h['parent_states']['exploration']['current']['path']);value=json.loads(p.read_bytes());value['state']['calls']=38;envelope(p,value['state'])
        self.verify(False)
        with self.assertRaises(o.Hold):self.verify(True)
    def test_failed_destination_must_be_preserved_and_fresh(self):
        self.destination.mkdir()
        with self.assertRaises(o.Hold):self.verify()
    def test_new_actual_destination_does_not_break_immutable_handoff_later(self):
        self.destination.mkdir();self.verify(False)
    def test_completed_original_commands_required_no_replay_substitute(self):
        p=Path(self.commands[2]['exit']['path']);value=json.loads(p.read_bytes());value['returncode']=1;put(p,value);self.commands[2]['exit']=ref(p);self.save()
        with self.assertRaises(o.Hold):self.verify()
    def test_failed_neutral_archive_change_refuses(self):
        (self.archive/'unexpected').write_text('changed')
        with self.assertRaises(o.Hold):self.verify()
    def test_foreign_handoff_goal_refuses(self):
        self.h['contract_sha256']='c'*64;self.save()
        with self.assertRaises(o.Hold):self.verify()
    def test_unsettled_original_role_refuses_adoption(self):
        rows={m:{'all_jobs_settled':m=='baseline','active_is_null':True,'active_intent_is_null':True,'round':8,'phase':'research','status':'finite_budget_finished; root_open'} for m in ('baseline','exploration')}
        with patch.object(o.S,'configuration',return_value={}),patch.object(o.S,'verify_handoff',return_value={'grant':{}}),patch.object(o.S,'public_study',return_value=rows),patch.object(o,'retained_curation',return_value=self.curation):
            with self.assertRaises(o.Hold):o.verify_adoption(self.c,initial=True,native_checks=False)
    def test_original_state_validation_uses_initial_false(self):
        rows={m:{'all_jobs_settled':True,'active_is_null':True,'active_intent_is_null':True,'round':8,'phase':'research','status':'finite_budget_finished; root_open'} for m in ('baseline','exploration')}
        with patch.object(o.S,'configuration',return_value={}) as configuration,patch.object(o.S,'verify_handoff',return_value={'grant':{}}) as verify,patch.object(o.S,'public_study',return_value=rows),patch.object(o,'retained_curation',return_value=self.curation):o.verify_adoption(self.c,initial=True,native_checks=False)
        self.assertFalse(configuration.call_args.kwargs['initial']);self.assertFalse(verify.call_args.kwargs['initial'])

class Lifecycle(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve();self.parent=self.root/'parent';self.parent.mkdir();self.curation=self.root/'already-paid';self.curation.mkdir()
        self.c={'parent_study':str(self.parent),'successor_root':str(self.root/'studies'),'owner_source_sha256':'d'*64,'contract_sha256':'c'*64,'profile_sha256':'e'*64,
            'revision_finished':{'path':str(self.root/'finished'),'sha256':'f'*64},'adoption_handoff':{'path':str(self.root/'handoff'),'sha256':'a'*64}}
        o.S.O.B.STOPPING=False
    def instance(self,n=1):
        b=previous.Fake(self.parent,n);b.rows[str(self.parent)]['exploration']=previous.row(8,numeric=False)
        b.transition_result.update(curation=str(self.curation),next_destination=str(Path(self.c['successor_root'])/(o.DESTINATION_PREFIX+'0001')))
        return o.Owner(self.c,self.root/'runtime',b),b
    def test_starts_directly_with_paid_curation_and_no_original_work(self):
        owner,b=self.instance();self.assertEqual(owner.run(),0);self.assertEqual(b.migrations[0],(str(self.parent),str(Path(self.c['successor_root'])/(o.DESTINATION_PREFIX+'0001'))))
        self.assertEqual(len(b.runs),1);self.assertNotEqual(b.runs[0][0],str(self.parent));self.assertFalse(b.curations)
        self.assertTrue(all(study!=str(self.parent) for study,_ in b.finalizations))
    def test_later_epochs_continue_existing1800_loop(self):
        owner,b=self.instance(2);self.assertEqual(owner.run(),0);self.assertEqual(len(b.migrations),2);self.assertEqual(len(b.curations),1)
        self.assertEqual(owner.state['epoch'],2);self.assertTrue(owner.state['root_proved']);self.assertTrue(all(not both for _,both in b.runs))
    def test_native_stop_preserved_without_migration(self):
        owner,b=self.instance();put(self.parent/'STOP.json',{'requested':1});self.assertEqual(owner.run(),1);self.assertFalse(b.migrations);self.assertTrue((self.parent/'STOP.json').exists())
    def test_new_current_pointer_bound_to_adoption(self):
        owner,b=self.instance();owner.run();pointer=o.public_json(self.root/'runtime/CURRENT.json');self.assertEqual(pointer['schema'],o.CURRENT_SCHEMA);self.assertEqual(pointer['adoption_handoff_sha256'],'a'*64)
    def test_future_curator_has_actual_new_source_and_owned_backend(self):
        b=o.Native({'owner_source_sha256':'c'*64},self.root/'runtime');argv=['python','-c','neutral',str(self.root/'curation'),'goal',str(o.S.PREDECESSOR),'c'*64]
        with patch.object(o.S.O.B.Native,'command',return_value=0) as command:b.command('curation',argv,self.parent)
        self.assertEqual(command.call_args.args[2][-2:],[str(HERE/'owner.py'),'c'*64])
    def test_unknown_migration_result_cannot_switch_epoch(self):
        owner,b=self.instance();b.migrate=lambda *_:{'study':str(self.root/'foreign'),'provenance_path':'neutral'}
        with self.assertRaises(o.Hold):owner.run()
        self.assertEqual(owner.state['epoch'],0);self.assertFalse(b.runs)



class Status(unittest.TestCase):
    def test_source_qualified_adoption_status_is_honest(self):
        m=load(HERE/'status_public.py','paid_adoption_status_tested')
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory).resolve();base=root/'.bootstrap/status';base.mkdir(parents=True)
            source=base/'owner.py';source.write_bytes((HERE/'owner.py').read_bytes())
            parent=root/'.scratch/studies/original';put(parent/'protocol.json',{'rounds':8,'validation_seconds':600})
            config=put(base/'CONFIG.json',{'schema':o.SCHEMA})
            c={'owner_source_sha256':ref(source)['sha256'],'contract_sha256':'c'*64,'revision_finished':{'sha256':'f'*64},'adoption_handoff':{'sha256':'a'*64}}
            output=base/'runtime';put(output/'CURRENT.json',{'schema':o.CURRENT_SCHEMA,'owner_source_sha256':ref(source)['sha256'],
                'contract_sha256':'c'*64,'revision_finished_sha256':'f'*64,'adoption_handoff_sha256':'a'*64,
                'parent_study':str(parent),'current_study':str(parent),'epoch':0,'phase':'migrating_closed_epoch','root_proved':False,'updated_at':1})
            put(base/'REGISTRATION.json',{'schema':'math-gkm.gaussian-paid-curation-status-registration.v1','approved':True,
                'status_source_sha256':ref(HERE/'status_public.py')['sha256'],'owner_source':ref(source),'config':ref(config),'output':str(output)})
            with patch.object(m,'ROOT',root),patch.object(m,'ORIGINAL',parent),patch.object(m,'load',return_value=o),patch.object(o,'ROOT',root),patch.object(o,'configuration',return_value=c),patch.object(o,'verify_adoption',return_value={}),patch.object(o.S,'public_study',return_value={'exploration':{'all_job_receipts_numeric':False,'all_jobs_settled':True}}):
                result=m.status(base)
            self.assertTrue(result['file_observation_only']);self.assertEqual(result['validation_seconds'],600);self.assertEqual(result['future_epoch_validation_seconds'],1800)
            self.assertFalse(result['goal_owner']['root_proved']);self.assertTrue(result['paid_curation_reused'])
            self.assertFalse(result['arms']['exploration']['all_job_receipts_numeric']);self.assertTrue(result['arms']['exploration']['all_jobs_settled'])

if __name__=='__main__':unittest.main()
