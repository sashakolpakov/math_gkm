"""Pure transport/receipt fixtures; no model, compiler or native process."""
import copy
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
from machinery import study,study_policy as policy,study_context as ctx,study_worker
from machinery.study_common import Invalid,canonical,digest,read,write,sha,REASONING_EFFORT


def plan():
    return dict(agenda=['inspect own exact obligation'],summary='bounded proposal',
        hypotheses=[],evidence=[],trial=None,use_links=[],completion=None)


def request(role='proposer',large=False):
    record=dict(id='neutral',kind='mathematical_claims',claim=dict(statement='∀ n : Nat, n = n',hypotheses=[]),
        task=dict(statement='∀ n : Nat, n = n',hypotheses=[],interface_type='True',transport_type='True'),
        exports=['Accepted.obligation'],export_module='MathGKM.Accepted',dependencies=[],
        source_files={'MathGKM/Accepted.lean':'a'*64},receipt_hash='b'*64,
        used_declarations={'retained_provenance':'x'*(1_050_000 if large else 5)},
        proposal={'term':'by rfl'},solution={'term':'by rfl'},validation_bundle={'directory':'own original receipt'})
    return dict(role=role,round=30,knowledge={'neutral':record},components={},reuse_interfaces={'neutral':copy.deepcopy(record)},
        proposition_dag={'root':'root','nodes':{'root':{'constant':'Neutral.Root','status':'open'},'leaf':{'constant':'Neutral.Leaf','status':'open'}},'edges':{'root':[{'premises':['leaf']}]}},
        remaining_obligations={'leaf':{'statement':'∀ n : Nat, n = n','status':'open'}},
        concept_driver={'active':{'end_round':32,'predictions':['neutral prediction']}},
        commitment={'selected_reference':'c'*64},prospective_binding='d'*64,
        research_feedback={'latest':{'source_review':{'findings':['latest diagnosis']},'episode_transfer':{'assessment':'inconclusive'}}},
        program_execution={'input_hash':'e'*64,'program_hash':'f'*64})


def body(rendered):
    return json.loads(rendered.split('\nREQUEST:\n',1)[1])


class TransportFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='gkm-context-pure-')
        self.addCleanup(self.temp.cleanup);self.base=Path(self.temp.name).resolve()

    def test_nonobject_reports_fail_before_any_concept_or_state_effect(self):
        state=policy.initial('exploration');before=copy.deepcopy(state)
        protocol={**study.DEFAULT,'concept_driver':{'enabled':True}}
        for report in [None,[],False,'text',17]:
            with self.subTest(report=report),self.assertRaises(Invalid):policy.commit(state,report,self.base,30,protocol)
            self.assertEqual(state,before)
            with self.assertRaises(Invalid):policy.validate_execution({},report)

    def test_canonical_small_prompt_roundtrips_without_history_materialization(self):
        req=request();before=copy.deepcopy(req)
        rendered=ctx.prepare_prompt(req,self.base,'proposer',policy.prompt)
        self.assertEqual(body(rendered),req);self.assertEqual(req,before)
        self.assertLessEqual(len(rendered),ctx.PROMPT_CHAR_LIMIT)
        self.assertFalse((self.base/'history').exists())
        self.assertTrue(rendered.endswith(canonical(req)))

    def test_large_view_preserves_all_exact_claims_permissions_and_current_feedback(self):
        req=request(large=True);before=copy.deepcopy(req)
        rendered=ctx.prepare_prompt(req,self.base,'proposer',policy.prompt);view=body(rendered)
        self.assertLessEqual(len(rendered),900000);self.assertEqual(req,before)
        for key in ['proposition_dag','remaining_obligations','commitment','prospective_binding','concept_driver','research_feedback','program_execution']:
            self.assertEqual(view[key],req[key])
        for field in ['knowledge','components','reuse_interfaces']:
            self.assertEqual(set(view[field]),set(req[field]))
            for name,record in req[field].items():
                for key in ['claim','task','exports','export_module','dependencies','source_files','receipt_hash']:
                    self.assertEqual(view[field][name][key],record[key])
                self.assertEqual(view[field][name]['full_record']['record_binding'],digest(record))
        full=self.base/view['own_context']['path']
        self.assertEqual(sha(full),view['own_context']['sha256']);self.assertEqual(read(full),req)
        self.assertEqual(full.stat().st_mode&0o222,0)
        self.assertEqual(ctx.prepare_prompt(req,self.base,'proposer',policy.prompt),rendered)
        self.assertEqual(len(list((self.base/'history/context').iterdir())),1)

    def test_private_roles_never_materialize_full_requests_in_own_history(self):
        for role in ['reviewer','selector','adapter']:
            req=request(role,large=True)
            with self.subTest(role=role),self.assertRaises(ctx.PromptContextLimit):
                ctx.prepare_prompt(req,self.base,role,policy.prompt)
        self.assertFalse((self.base/'history').exists())

    def test_mandatory_context_overflow_fails_without_truncation_or_file(self):
        req=request(large=True);req['remaining_obligations']['leaf']['statement']='y'*900000
        with self.assertRaises(ctx.PromptContextLimit):ctx.prepare_prompt(req,self.base,'proposer',policy.prompt)
        self.assertFalse((self.base/'history').exists())

    def test_mutated_context_or_symlink_is_rejected(self):
        req=request(large=True);view=body(ctx.prepare_prompt(req,self.base,'proposer',policy.prompt))
        full=self.base/view['own_context']['path'];full.chmod(0o644);full.write_text('{}')
        with self.assertRaises(Invalid):ctx.prepare_prompt(req,self.base,'proposer',policy.prompt)
        another=self.base/'another';another.mkdir();(another/'history').symlink_to(self.base/'history',target_is_directory=True)
        with self.assertRaises(Invalid):ctx.prepare_prompt(req,another,'proposer',policy.prompt)

    def test_complete_prompt_character_limit_and_file_guard(self):
        self.assertEqual(ctx.check_prompt('a'*900000),'a'*900000)
        with self.assertRaises(ctx.PromptContextLimit):ctx.check_prompt('a'*900001)
        p=self.base/'prompt.txt';p.write_text('a'*900001)
        with self.assertRaises(ctx.PromptContextLimit):ctx.check_prompt_file(p)

    def test_cli_missing_final_and_nonzero_are_operational(self):
        for code,final,error,expected in [(1,False,'invalid_report: missing','nonzero_exit'),
                (0,False,'invalid_report: missing','missing_final_report'),
                (0,True,'invalid_report: malformed','invalid_report: malformed'),
                (0,True,None,'completed'),(-15,False,'stopped','stopped'),
                (0,True,'retained_source_capability_changed','retained_source_capability_changed')]:
            self.assertEqual(study_worker.classify_outcome(error,code,final),expected)

    def test_real_call_keeps_full_request_and_source_map_before_mocked_worker(self):
        arm=study.Arm.__new__(study.Arm);arm.root=self.base/'arm';arm.root.mkdir();arm.workspace=self.base/'workspace';arm.workspace.mkdir();arm.study=self.base
        arm.p=copy.deepcopy(study.DEFAULT);arm.p['output_bytes']=2*1024**2
        arm.s={'calls':0,'meta_calls':0,'counted_jobs':[],'reservations':{}}
        arm.active_budget=None;arm.fd=0;arm.ensure_deployment=lambda:None;arm.permitted=lambda *args:True
        reserved=[];arm.reserve=lambda key,seconds:reserved.append((key,seconds));arm.save=lambda:None
        arm.consume=lambda job,receipt:receipt
        req=request(large=True);before=copy.deepcopy(req)
        def fake_worker(*args,**kwargs):
            job=arm.root/'jobs/plan-test';write(job/'receipt.json',{'outcome':'completed','payload':{}})
            return SimpleNamespace(pid=12345,poll=lambda:0)
        arm.recover=lambda:read(arm.root/'jobs/plan-test/receipt.json')
        with patch('machinery.study_bridge.event'),patch('machinery.study.subprocess.Popen',side_effect=fake_worker) as popen:
            study.Arm.call(arm,'plan-test','proposer',req,readonly=True)
            self.assertEqual(popen.call_count,1)
        job=arm.root/'jobs/plan-test';full=read(job/'request.json')
        self.assertEqual(full,{**before,'model':arm.p['model'],'reasoning_effort':REASONING_EFFORT,'request_id':'plan-test'})
        self.assertEqual(read(job/'spec.json')['retained_sources'],before['knowledge']['neutral']['source_files'])
        view=body((job/'prompt.txt').read_text());self.assertEqual(view['program_execution'],before['program_execution'])
        self.assertEqual(req,before);self.assertEqual(len(reserved),1)
        with patch('machinery.study.subprocess.Popen',side_effect=AssertionError('cached ID must not launch')):
            self.assertEqual(study.Arm.call(arm,'plan-test','proposer',req),{'outcome':'completed','payload':{}})
            changed=copy.deepcopy(req);changed['knowledge']['neutral']['used_declarations']['retained_provenance']='different'
            with self.assertRaises(Invalid):study.Arm.call(arm,'plan-test','proposer',changed)
        self.assertEqual(len(reserved),1)

    def test_oversize_real_call_fails_before_reservation_or_worker(self):
        arm=SimpleNamespace(root=self.base/'arm',workspace=self.base,study=self.base,p=copy.deepcopy(study.DEFAULT),
            ensure_deployment=lambda:None,permitted=lambda *args:True)
        arm.root.mkdir();arm.reserve=lambda *args: self.fail('preflight must precede charging')
        req=request(large=True);req['remaining_obligations']['leaf']['statement']='y'*900000
        with patch('machinery.study.subprocess.Popen',side_effect=AssertionError('no worker')):
            with self.assertRaises(ctx.PromptContextLimit):study.Arm.call(arm,'too-large','proposer',req)
        self.assertFalse((arm.root/'jobs/too-large').exists())


class RecoveryFixtures(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='gkm-recovery-pure-');self.addCleanup(self.temp.cleanup);self.base=Path(self.temp.name).resolve()
        self.root_patch=patch.object(ctx,'ROOT',self.base);self.root_patch.start();self.addCleanup(self.root_patch.stop)
        self.impl_patch=patch.object(ctx,'implementation',return_value={'neutral':'implementation'});self.impl_patch.start();self.addCleanup(self.impl_patch.stop)
        self.study=self.base/'study';self.root=self.study/'arms/exploration';self.workspace=self.root/'workspace';self.workspace.mkdir(parents=True)
        self.key='plan-0030';self.job=self.root/'jobs'/self.key;self.job.mkdir(parents=True)
        self.req={'role':'proposer','round':30}
        self.p={**study.DEFAULT,'transport':'live'}
        self.full={**self.req,'model':self.p['model'],'reasoning_effort':REASONING_EFFORT,'request_id':self.key}
        write(self.job/'request.json',self.full)
        self.receipt=dict(request_id=self.key,role='proposer',outcome='invalid_report: no final',returncode=1,payload=None,before={'neutral':'same'},after={'neutral':'same'},resources={'termination_cause':None})
        write(self.job/'receipt.json',self.receipt)
        write(self.job/'spec.json',dict(request_id=self.key,role='proposer',readonly=True,workspace=str(self.workspace),seconds=self.p['call_seconds']))
        (self.job/'events.jsonl').write_text('{"error":"input_too_large"}\n');(self.job/'stderr.log').write_text('');(self.job/'prompt.txt').write_text('x'*1048577)
        self.s=dict(round=30,phase='research',status='active',failures=1,policy_trials=0,research=policy.initial('exploration'),calls=1,meta_calls=1,seconds=self.p['call_seconds'],reservations={'call-'+self.key:self.p['call_seconds']},budget_pools={},counted_jobs=[self.key],receipts=[str(self.job)],receipt_hashes={str(self.job):digest(self.receipt)},active=None,active_intent=None,resolution=None)
        self.arm=SimpleNamespace(study=self.study,root=self.root,mode='exploration',p=self.p,s=self.s)
        self.grant=dict(schema='math-gkm.closed-proposer-recovery.v1',study=str(self.study.resolve()),arm='exploration',failed_request_id=self.key,next_request_id=self.key+'-repair-1',request_binding=digest(self.full),receipt_binding=digest(self.receipt),receipt_file_sha256=sha(self.job/'receipt.json'),spec_sha256=sha(self.job/'spec.json'),events_sha256=sha(self.job/'events.jsonl'),stderr_sha256=sha(self.job/'stderr.log'),old_implementation_sha256='bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa',implementation_sha256=digest({'neutral':'implementation'}),old_seal_sha256='a'*64,stopped_state_sha256='b'*64,recovery_projection_sha256=digest(ctx.recovery_projection(self.s)),no_model_started=True,native_cleanup_verified=True,classification='closed_input_too_large_no_model')
        self.grant_path=self.base/'.bootstrap/recovery.json'
        self.grant['revision_core']={'previous_source':self.grant['old_implementation_sha256'],'next_source':self.grant['implementation_sha256']}
        self.grant['revision_binding']=digest(self.grant['revision_core'])
        seal={'source_revision':{'record':str(self.grant_path),'binding':self.grant['revision_binding'],'old_seal_sha256':self.grant['old_seal_sha256']}}
        write(self.study/'seal.json',seal);self.s['seal_hash']=digest(seal)
        self.authorize()

    def authorize(self):
        write(self.grant_path,self.grant)
        write(self.base/'.bootstrap/study-authorization.json',dict(user_explicit_ok=True,implementation_sha256=self.grant['implementation_sha256'],operational_recovery=dict(path=str(self.grant_path),sha256=sha(self.grant_path))))

    def recover(self):return ctx.operational_recovery(self.arm,self.key,self.receipt,self.req,self.workspace,30)

    def test_explicit_grant_binds_one_new_paid_identity_without_state_change(self):
        before=copy.deepcopy(self.s);original={p.name:sha(p) for p in self.job.iterdir()}
        result=self.recover();self.assertEqual(result['previous_request'],self.key);self.assertEqual(self.s,before)
        self.assertEqual(read(self.job/'operational-recovery.json')['next_request_id'],self.key+'-repair-1')
        self.assertEqual(self.recover(),result)
        for name,h in original.items():self.assertEqual(sha(self.job/name),h)

    def test_missing_or_workspace_grant_cannot_authorize(self):
        (self.base/'.bootstrap/study-authorization.json').unlink();self.assertIsNone(self.recover())
        write(self.base/'.bootstrap/study-authorization.json',dict(operational_recovery={'path':str(self.workspace/'grant.json'),'sha256':'0'*64}))
        with self.assertRaises(Invalid):self.recover()

    def test_changed_artifacts_projection_and_uncertain_or_unaccounted_jobs_reject(self):
        for mutate in [lambda:self.s.update(calls=2),lambda:self.s.update(active='unknown'),
                lambda:self.s['receipts'].clear(),lambda:self.s['reservations'].update({'call-'+self.key:1}),
                lambda:(self.job/'final.json').write_text('{}'),lambda:(self.job/'events.jsonl').write_text('changed')]:
            before=copy.deepcopy(self.s);events=(self.job/'events.jsonl').read_bytes();mutate()
            with self.assertRaises(Invalid):self.recover()
            self.s.clear();self.s.update(before);(self.job/'events.jsonl').write_bytes(events)
            if (self.job/'final.json').exists():(self.job/'final.json').unlink()
            self.assertFalse((self.job/'operational-recovery.json').exists())

    def test_existing_new_job_or_wrong_attestations_reject(self):
        path=self.root/'jobs'/self.grant['next_request_id'];path.mkdir()
        with self.assertRaises(Invalid):self.recover()
        path.rmdir()
        for field in ['no_model_started','native_cleanup_verified']:
            self.grant[field]=False;self.authorize()
            with self.assertRaises(Invalid):self.recover()
            self.grant[field]=True
        self.authorize()

    def test_revision_seal_must_match_and_projection_excludes_only_declared_timing(self):
        before=ctx.recovery_projection(self.s)
        self.s['controller_active_seconds']=123;self.s['seal_hash']='d'*64
        self.assertEqual(ctx.recovery_projection(self.s),before)
        with self.assertRaises(Invalid):self.recover()
        self.s['seal_hash']=digest(read(self.study/'seal.json'))
        seal=read(self.study/'seal.json');seal['source_revision']['binding']='e'*64
        write(self.study/'seal.json',seal);self.s['seal_hash']=digest(seal)
        with self.assertRaises(Invalid):self.recover()

    def test_normal_schema_repair_rejects_nonzero_without_grant(self):
        calls=[];arm=SimpleNamespace(root=self.base/'other',p=self.p)
        arm.call=lambda key,*args: calls.append(key) or self.receipt
        with self.assertRaises(Invalid):study.Arm.plan_with_repair(arm,'other-plan',{},policy.initial('exploration'),self.workspace,30,self.p)
        self.assertEqual(calls,['other-plan'])

    def test_protected_recovery_uses_new_ordinary_charged_repair_and_never_replays_original(self):
        calls=[];new_charges=[];original=sha(self.job/'receipt.json')
        def call(key,role,req,workspace,readonly):
            calls.append(key)
            if key==self.key:return self.receipt
            self.assertEqual(key,self.key+'-repair-1');new_charges.append(self.p['call_seconds'])
            result=dict(outcome='completed',returncode=0,payload=plan(),request_id=key)
            write(self.root/'jobs'/key/'final.json',{'request_id':key,'payload_json':json.dumps(plan())})
            return result
        self.arm.call=call
        staged,commitment=study.Arm.plan_with_repair(self.arm,self.key,self.req,self.s['research'],self.workspace,30,self.p)
        self.assertEqual(calls,[self.key,self.key+'-repair-1']);self.assertEqual(new_charges,[self.p['call_seconds']])
        self.assertEqual(self.s['reservations']['call-'+self.key],self.p['call_seconds']);self.assertEqual(sha(self.job/'receipt.json'),original)
        self.assertEqual(staged['knowledge'],{});self.assertIsNone(commitment['trial'])


if __name__=='__main__':unittest.main()
