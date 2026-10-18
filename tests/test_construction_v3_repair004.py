"""Repair-004 acceptance sources. Prepared only; run after independent source audit."""
import copy
import os
import signal
import subprocess
import time
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch
from machinery import resources,residual_dag,study_policy,study_program,study_discoveries
from machinery.study_common import ROOT,PYTHON,Invalid,sha,read,write,digest,dependencies
from machinery.process import run
from tests import test_construction_v3 as v3

class Pure004(v3.Retained):
    def test_new_residual_controller_field_attack_and_stale_success(self):
        state=study_policy.initial('exploration'); dag=residual_dag.graph(state,v3.contract())
        dag['nodes']['a']=dict(constant='Exact.False',module='MathGKM.A',context='captured',status='open')
        for field in ('existing_constant','context','target','target_constant','context_binding'):
            proposal=dict(target_id='a',residuals=[dict(id='b',statement='True',**{field:'False'})],term='fun h => h')
            before=copy.deepcopy(dag)
            with self.assertRaisesRegex(Invalid,'exactly id and statement'): residual_dag.prepare(dag,proposal)
            self.assertEqual(dag,before)
        _,_,rs=residual_dag.prepare(dag,dict(target_id='root',premises=['a']))
        self.assertEqual(rs,[dict(id='a',statement='Exact.False',existing_constant='Exact.False')])
        state['remaining_obligations']['a']=dict(status='checked',target_constant='Exact.False')
        state['program']=dict(schema=study_program.REFERENCE['schema'],code=[
            dict(op='select_obligation',id='a'),dict(op='reassess',after_rounds=8)])
        req=study_policy.request(state,1,v3.DEFAULT,role='proposer')
        self.assertEqual(req['research_focus'],'root')
        self.assertEqual(req['reassess_after_rounds'],1)
        self.assertIn('closed after checked proof',req['strategy_reassessment']['reason'])
        self.assertEqual(state['remaining_obligations']['a']['target_constant'],'Exact.False')

class Resources004(v3.Retained):
    def test_normal_exit_and_timeout_orphan_birth_gone_unrelated_survives(self):
        env={**os.environ,'TMPDIR':str(self.base),'PATH':'/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin'}
        unrelated=subprocess.Popen([PYTHON,'-c','import time; time.sleep(6)'],start_new_session=True)
        children=[]
        try:
            for mode in ('normal','timeout'):
                marker=self.base/(mode+'.json')
                code=('import sys,json,subprocess,time; sys.path.insert(0,'+repr(str(ROOT))+'); '
                    'from machinery.resources import process_status; '
                    'from pathlib import Path; p=subprocess.Popen(["/bin/sleep","3"]); '
                    'Path('+repr(str(marker))+').write_text(json.dumps(dict(pid=p.pid,info=process_status(p.pid)))); '
                    +('time.sleep(3)' if mode=='timeout' else 'raise SystemExit(0)'))
                first=[True]; original=resources.Guard.check
                def delayed(guard,*args,**kwargs):
                    if first[0]: first[0]=False; time.sleep(.15)
                    return original(guard,*args,**kwargs)
                with patch.object(resources.Guard,'check',delayed):
                    result=run([PYTHON,'-c',code],cwd=self.base,env=env,timeout=.5 if mode=='timeout' else 2,
                        resource_limits={'poll_seconds':.02})
                write(self.base/(mode+'-result.json'),result)
                self.assertTrue(marker.exists(),result)
                child=read(marker); children.append(child)
                info=resources.current_process(child['pid'])
                self.assertTrue(info is None or info['identity']!=child['info']['identity'],(child,result))
                self.assertIsNone(unrelated.poll(),'unrelated process was signalled')
                self.assertEqual(result['termination'],'timeout' if mode=='timeout' else None,result)
                self.assertFalse(result['resources'].get('cleanup_live_holds',False))
        finally:
            # Independent cleanup runs even when any assertion fails.
            for marker in self.base.glob('*.json'):
                if marker.name not in ('normal.json','timeout.json'): continue
                child=read(marker); info=resources.current_process(child['pid'])
                if info and info['identity']==child['info']['identity']:
                    try: os.kill(child['pid'],signal.SIGKILL)
                    except ProcessLookupError: pass
            if unrelated.poll() is None: unrelated.kill()
            unrelated.wait()

    @patch.object(resources, 'darwin_profile', return_value=True)
    @patch.object(resources, 'native_footprint', return_value=dict(phys_footprint_bytes=10))
    def test_narrow_helper_count_and_arbitrary_eperm_fail_closed(self, _native_metric, _darwin_metric):
        table={123:dict(ppid=1,rss=10,identity='unused',command='python'),
               124:dict(ppid=123,rss=20,identity='unused',command='/bin/ps')}
        def current(p):
            if p==123:return dict(identity='root-birth',ppid=1)
            raise PermissionError('full BSDINFO EPERM')
        with patch.object(resources,'disk_bytes',return_value=0),patch.object(resources,'process_table',return_value=table), \
             patch.object(resources,'current_process',side_effect=current),patch.object(resources,'cleanup_hold') as held, \
             patch.object(resources,'required_os_free_percent',return_value=61), \
             patch.object(resources,'available_memory',return_value=16*resources.GiB), \
             patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=16*resources.GiB)), \
             patch.object(resources,'privileged_observer',return_value=dict(pid=124,ppid=123,executable='/bin/ps')) as helper:
            guard=resources.Guard(123,self.base); guard.check(force=True)
            helper.assert_called_with(124,123,'root-birth')
            self.assertEqual(guard.samples[-1]['rss_sum'],30)
            self.assertEqual(guard.samples[-1]['charged_phys_footprint'],30)
            self.assertEqual(guard.samples[-1]['helper_rss_charge'],20)
            self.assertEqual(guard.samples[-1]['owned_processes'],2)
            self.assertNotIn(124,guard.owned,'public API has no birth; never adopt as birth-owned')
            helper.side_effect=resources.ResourceFailure('monitor_unavailable: unapproved privileged child')
            with self.assertRaisesRegex(resources.ResourceFailure,'unapproved'): guard.check(force=True)
            self.assertTrue(held.called)

    def test_tree_only_admission_floor_without_heavy_lease(self):
        with patch.object(resources,'required_os_free_percent',return_value=29), patch.object(resources,'available_memory',return_value=resources.limits()['memory_admit_free']-1):
            result=run([PYTHON,'-c','print(1)'],cwd=ROOT,env=os.environ.copy(),tree_only=True)
        self.assertIn('admission_memory_headroom',result['termination'])

    def test_limit_numeric_validation_and_valid_controls006(self):
        for key in resources.LIMITS:
            for value in (True,False,float('nan'),float('inf'),float('-inf'),0,-1):
                with self.subTest(key=key,value=value),self.assertRaises(resources.ResourceFailure):
                    resources.limits({key:value})
        for value in (1,.25):
            self.assertEqual(resources.limits({'timeout':value})['timeout'],value)
        huge=10**1000
        self.assertEqual(resources.limits({'admit_free':huge})['admit_free'],huge)
        with self.assertRaises(resources.ResourceFailure): resources.limits({'timeout':huge})
        for darwin in (True,False):
            with patch.object(resources,'darwin_profile',return_value=darwin):
                cap=resources.limits()
                for key,bound in cap.items():
                    floor=key in resources.FLOORS
                    with self.subTest(darwin=darwin,key=key),self.assertRaises(resources.ResourceFailure):
                        resources.limits({key:bound-1 if floor else bound+1})
                    value=bound+1 if floor else bound/2
                    self.assertEqual(resources.limits({key:value})[key],value)

    def test_distinct_memory_disk_admission_floors006(self):
        GiB=resources.GiB
        from contextlib import ExitStack
        with ExitStack() as stack:
            stack.enter_context(patch.object(Path,'exists',return_value=False))
            disk=stack.enter_context(patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=8*GiB)))
            memory=stack.enter_context(patch.object(resources,'available_memory',return_value=8*GiB))
            pressure=stack.enter_context(patch.object(resources,'required_os_free_percent',return_value=30))
            for darwin in (True,False):
                with patch.object(resources,'darwin_profile',return_value=darwin):
                    cap=resources.limits()
                    self.assertEqual(cap['memory_admit_free'],8*GiB)  # Linux-only
                    self.assertEqual(cap['admit_free'],8*GiB)
                    memory.return_value=8*GiB; pressure.return_value=30
                    disk.return_value=SimpleNamespace(free=8*GiB)
                    resources.headroom(cap)
                    if darwin: pressure.return_value=29
                    else: memory.return_value=8*GiB-1
                    with self.assertRaisesRegex(resources.ResourceFailure,'admission_memory_headroom'):
                        resources.headroom(cap)
                    memory.return_value=8*GiB; pressure.return_value=30
                    disk.return_value=SimpleNamespace(free=8*GiB-1)
                    with self.assertRaisesRegex(resources.ResourceFailure,'admission_disk_headroom'):
                        resources.headroom(cap)

class Checked004(v3.CheckedMath):
    # Select named methods only; inherited cases are scheduled separately.
    def test_residual_attack_rejected_without_paid_check(self):
        self.submit(reductions=[dict(id='false-leaf',module='MathGKM.NeutralV3Root',
            residuals=[dict(id='a',statement='False')],term='fun h => False.elim h')])
        self.assertIn('false-leaf',self.state['knowledge'])
        charged=dict(self.reservations)
        self.submit(reductions=[dict(id='spoof',module='MathGKM.NeutralV3Root',target_id='a',
            residuals=[dict(id='b',statement='True',existing_constant='False')],term='fun h => h')])
        self.assertNotIn('spoof',self.state['knowledge'])
        self.assertNotIn('b',self.state['proposition_dag']['nodes'])
        self.assertEqual(charged,self.reservations)

    def test_pending_checked_reuse_provenance_recovery_collision_mutation_and_hidden_exclusion(self):
        self.submit(mathematical_claims=[dict(id='unbounded',module='MathGKM.NeutralV3Root',
            statement='∀ n m : Nat, n + m = m + n',term='Nat.add_comm')])
        branch_record=self.record('unbounded')
        main=self.base/'main'; (main/'MathGKM').mkdir(parents=True)
        for p in self.ws.glob('MathGKM/*.lean'):
            if p.name in ('NeutralV3Root.lean','ResearchSemantics.lean','Gluing.lean'):
                (main/'MathGKM'/p.name).write_bytes(p.read_bytes())
        write(main/'contract.json',v3.contract()); dependencies(main)
        state=study_policy.initial('exploration'); charges={}
        arm=SimpleNamespace(root=self.base/'arm',workspace=main,mode='exploration',
            s=dict(research=state),p=self.arm.p,save=lambda:None,available=lambda:100000,
            stopped=lambda:False,reserve=lambda k,v:charges.setdefault(k,v))
        report=dict(mathematical_claims=[branch_record['proposal']])
        job=arm.root/'jobs/branch-research'
        receipt=dict(role='researcher',outcome='completed',payload=report,
            classification='SYNTHETIC origin receipt; actual Lean branch and main checks')
        write(job/'spec.json',dict(role='researcher',workspace=str(self.ws)))
        write(job/'receipt.json',receipt)
        study_discoveries.retain(arm,self.ws,self.state,report,receipt,'branch-research','trial','candidate',0)
        key=next(iter(state['pending_discoveries']))
        self.assertNotIn('unbounded',state['knowledge'])
        req=study_policy.request(state,1,v3.DEFAULT,role='proposer')
        self.assertIn(key,req['pending_discoveries'])
        arm.available=lambda:0
        study_discoveries.recheck(arm,state,dict(discovery_rechecks=[key]),main,self.base/'main-checks')
        self.assertFalse(charges); self.assertNotIn('unbounded',state['knowledge'])
        arm.available=lambda:100000
        study_discoveries.recheck(arm,state,dict(discovery_rechecks=[key]),main,self.base/'main-checks')
        accepted=state['knowledge']['unbounded']
        self.assertTrue(charges,'main source/premise recheck must be paid')
        self.assertEqual(accepted['discovery_provenance']['branch_receipt_hash'],branch_record['receipt_hash'])
        self.assertNotEqual(accepted['validation_bundle']['directory'],branch_record['validation_bundle']['directory'])
        self.assertEqual(read(Path(accepted['validation_bundle']['directory'])/'result.json')['checked'],True)
        self.assertEqual(state['proposition_dag']['nodes']['root']['status'],'open')
        self.assertNotIn('resolution',arm.s)
        from machinery.study_completion import check
        self.assertFalse(check(arm,dict(kind='proof',module=accepted['export_module'],declaration=accepted['exports'][0]))['resolved'])
        old=dict(charges)
        study_discoveries.recheck(arm,state,dict(discovery_rechecks=[key]),main,self.base/'main-checks')
        self.assertEqual(charges,old)
        study_discoveries.retain(arm,self.ws,self.state,report,receipt,'branch-research','trial','candidate',0)
        self.assertEqual(len(state['pending_discoveries']),1)
        entry=state['pending_discoveries'][key]
        source=main/next(iter(entry['source_paths'].values()))
        original=source.read_text(); source.chmod(0o644); source.write_text(original+'\n-- mutation\n')
        with self.assertRaisesRegex(Invalid,'source changed'): study_discoveries.verify(arm,state,main,key)
        source.write_text(original); source.chmod(0o444)
        installed=main/next(iter(entry['source_paths']))
        before=installed.read_text(); installed.write_text(before+'\n-- main collision\n')
        with self.assertRaisesRegex(Invalid,'collision'): study_discoveries.materialize(arm,state,main,key)
        self.assertEqual(installed.read_text(),before+'\n-- main collision\n')
        installed.write_text(before)
        write(job/'spec.json',dict(role='adapter',workspace=str(self.ws)))
        with self.assertRaisesRegex(Invalid,'researcher-origin'):
            study_discoveries.retain(arm,self.ws,self.state,report,receipt,'branch-research','trial','candidate',0)
        write(job/'spec.json',dict(role='researcher',workspace=str(self.ws)))
        arm.mode='baseline'
        with self.assertRaisesRegex(Invalid,'cross-arm'): study_discoveries.verify(arm,state,main,key)
