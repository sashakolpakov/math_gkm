"""Repair-003 acceptance sources. NOT RUN. No live model is launched.

Pure/Resource cases identify simulations; Checked cases use actual pinned Lean,
independent leanchecker and premise inspection, with no dependency mocks.
"""
import copy
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest
from types import SimpleNamespace
from unittest.mock import patch

from machinery import resources,residual_dag,study_policy,study_worker,study_curate,study
from machinery.study_common import (ROOT,PYTHON,Invalid,sha,digest,read,write,dependencies,
    snapshot,verify_snapshot,inventory,history_view)
from machinery.study_knowledge import ingest
from machinery.process import run
from tests import test_construction_v3 as v3
contract=v3.contract
ordinary=v3.ordinary

class PureRepair(v3.Retained):
    def test_next_request_has_exact_dag_schema_and_alternate_and_route(self):
        state=study_policy.initial('exploration'); g=residual_dag.graph(state,contract())
        for k in ('a','b','c'):
            g['nodes'][k]=dict(constant='Exact.'+k,module='MathGKM.Context'+k,context='version-'+k,status='open')
        g['nodes']['a'].update(proof='Checked.a',proof_id='seed',proof_module='MathGKM.Seed')
        g['edges']['root']=[dict(id='closed',premises=['a'],proof='Checked.closed',module='MathGKM.Closed'),
            dict(id='newer-open',premises=['b','c'],proof='Checked.open',module='MathGKM.Open')]
        chosen=residual_dag.composition(g,state)
        self.assertEqual(chosen['open_leaves'],[])
        self.assertEqual(chosen['selected_routes'][0]['edge'],'closed')
        del g['edges']['root'][0]
        conditional=residual_dag.composition(g,state)
        self.assertEqual(conditional['open_leaves'],['b','c'])
        self.assertIn('Exact.b ∧ Exact.c',conditional['statement'])
        before=copy.deepcopy(g['nodes']['b'])
        _,_,rs=residual_dag.prepare(g,dict(target_id='root',premises=['b']))
        self.assertEqual(rs[0]['existing_constant'],'Exact.b')
        self.assertEqual(before,g['nodes']['b'])
        req=study_policy.request(state,0,study.DEFAULT)
        self.assertEqual(req['proposition_dag'],g)
        self.assertIn('premises',req['checked_submission_schemas']['reductions'])
        self.assertIn('target_id',req['checked_submission_schemas']['reductions'])
        g['edges']['b']=[dict(id='cycle',premises=['root'],proof='bad',module='MathGKM.Bad')]
        with self.assertRaisesRegex(Invalid,'cycle'): residual_dag.composition(g,state)

    def test_snapshot_no_writable_alias_source_allowlist_and_history(self):
        ws=self.base/'workspace'; (ws/'MathGKM').mkdir(parents=True)
        source=ws/'MathGKM/Test.lean'; source.write_text('import Lean\ndef exactSource := 1\n')
        for name in ('Test.olean','Test.olean.private','Test.olean.server','Test.olean.tmp.lean','payload.zip','payload.tar.gz'):
            (ws/'MathGKM'/name).write_bytes(b'\x00binary')
        self.assertEqual(set(inventory(ws)),{'MathGKM/Test.lean'})
        snap=self.base/'snapshots/one'; snapshot(ws,snap,{'neutral':'fixture'})
        frozen=snap/'source/MathGKM/Test.lean'
        self.assertNotEqual(source.stat().st_ino,frozen.stat().st_ino)
        source.write_text('import Lean\ndef exactSource := 2\n')
        verify_snapshot(snap)
        history=ws/'history/objects'; history.mkdir(parents=True)
        obj=history/sha(source); shutil.copyfile(source,obj)
        history_view(ws/'history',self.base/'role/history')
        copied=self.base/'role/history/objects'/obj.name
        self.assertNotEqual(obj.stat().st_ino,copied.stat().st_ino)
        (ws/'MathGKM/pretend.json').write_bytes(b'\x00binary')
        with self.assertRaisesRegex(Invalid,'binary'): inventory(ws)

    def test_curator_model_argv_and_provenance_connected_fixture(self):
        # Actual bounded fixture watchdog/receipt; command() builds live argv only.
        result=study_curate.curate(self.base/'curation','fixture',10,contract(),model='gpt-6.1-sol')
        provenance=read(Path(result['provenance'])); job=self.base/'curation/job'
        for value in (provenance,read(job/'spec.json'),read(job/'receipt.json')):
            self.assertEqual(value['model'],'gpt-6.1-sol'); self.assertEqual(value['reasoning_effort'],'high')
        self.assertEqual(read(job/'receipt.json')['outcome'],'completed')
        argv=study_worker.command(self.base/'argv',read(job/'spec.json'))
        self.assertEqual(argv[argv.index('--model')+1],'gpt-6.1-sol')
        with self.assertRaises(Invalid):
            study_curate.curate(self.base/'invalid','fixture',10,contract(),model='gpt-6-sol')
        self.assertFalse(read(Path(result['suite']))['tasks'],'empty fixture suite has no transfer evidence')

class ResourceRepair(v3.Retained):
    def setUp(self):
        super().setUp()
        self.env={**os.environ,'TMPDIR':str(self.base),'PATH':'/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin'}
    @patch.object(resources, 'darwin_profile', return_value=False)
    def test_birth_root_reuse_stale_child_parent_and_wrapper_count(self, _linux_metric):
        table={123:dict(ppid=1,rss=1,identity='ps old root',command='lake'),
               124:dict(ppid=123,rss=1,identity='ps old child',command='lean')}
        current={123:dict(identity='birth-root',ppid=1),124:dict(identity='birth-child',ppid=123)}
        with patch.object(resources,'disk_bytes',return_value=0),patch.object(resources,'process_table',return_value=table), \
             patch.object(resources,'current_process',side_effect=lambda p:current.get(p)), \
             patch.object(resources,'available_memory',return_value=16*resources.GiB), \
             patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=16*resources.GiB)):
            guard=resources.Guard(123,self.base)
            guard.check(force=True)
            self.assertEqual(guard.samples[-1]['compilers'],1)
            self.assertEqual(guard.owned,{123:'birth-root',124:'birth-child'})
            current[123]=dict(identity='recycled-root',ppid=1)
            current[124]=dict(identity='recycled-child',ppid=999)
            table[125]=dict(ppid=124,rss=1,identity='new unrelated',command='lean')
            current[125]=dict(identity='unrelated-new',ppid=124)
            guard.check(force=True)
            self.assertNotIn(125,guard.owned)
            self.assertEqual(guard.owned[123],'birth-root')
            # A stale ps child row with a CURRENT different parent cannot be adopted.
            current[123]=dict(identity='birth-root',ppid=1)
            table[126]=dict(ppid=123,rss=1,identity='stale',command='python')
            current[126]=dict(identity='fresh-unrelated',ppid=999)
            guard.check(force=True); self.assertNotIn(126,guard.owned)
            with patch.object(resources.os,'kill') as kill:
                current[123]=dict(identity='recycled-root',ppid=1)
                guard.cleanup(); kill.assert_not_called()

    def test_actual_sibling_build_growth_and_post_spawn_bind_failure(self):
        (self.base/'source').mkdir(); (self.base/'build').mkdir()
        argv=[PYTHON,'-c','from pathlib import Path; import time; Path("../build/object").write_bytes(b"x"*8192); time.sleep(10)']
        result=run(argv,cwd=self.base/'source',env=self.env,scope=self.base,
            timeout=5,resource_limits={'growth':1024,'poll_seconds':.02})
        write(self.base/'sibling-growth.json',result)
        self.assertIn('disk_growth',result['termination'])
        children=[]; real=subprocess.Popen
        def remember(*a,**kw):
            child=real(*a,**kw); children.append(child); return child
        # No persistent global hold escapes this intentional fault fixture.
        with patch('machinery.process.subprocess.Popen',side_effect=remember), \
             patch.object(resources.Guard,'bind',side_effect=resources.ResourceFailure('birth unavailable')), \
             patch('machinery.process.cleanup_hold') as held:
            failed=run([PYTHON,'-c','import time; time.sleep(10)'],cwd=self.base,env=self.env,timeout=2)
        self.assertTrue(held.called); self.assertTrue(failed['termination'])
        self.assertTrue(children); self.assertTrue(all(p.poll() is not None for p in children))

    def test_monitor_parse_failure_cleanup_fallback_and_durable_launch_hold(self):
        isolated=self.base/'isolated-root'; isolated.mkdir()
        with patch.object(resources,'ROOT',isolated):
            with patch.object(resources,'observation',return_value='oops 1 2 a b c d e f'):
                with self.assertRaisesRegex(resources.ResourceFailure,'malformed'): resources.process_table()
            guard=object.__new__(resources.Guard); guard.owned={123:'owned'}
            with patch.object(resources,'current_process',side_effect=resources.ResourceFailure('birth monitor unavailable')):
                with self.assertRaises(resources.ResourceFailure): guard.cleanup()
            self.assertTrue((isolated/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists())
            with self.assertRaisesRegex(resources.ResourceFailure,'unresolved_owned_cleanup_hold'):
                with resources.admission(): self.fail('launch after unresolved cleanup')

    def test_tree_observer_does_not_deadlock_leaf_heavy_lease(self):
        code='from machinery.process import run; from machinery.study_common import PYTHON; import os; r=run([PYTHON,"-c","print(42)"],cwd=os.getcwd(),env=os.environ.copy(),timeout=5); print(r); raise SystemExit(bool(r["termination"]) or r["returncode"])'
        outer=run([PYTHON,'-c',code],cwd=ROOT,env=self.env,tree_only=True,timeout=10,scope=self.base)
        write(self.base/'nested-runner.json',outer)
        self.assertEqual(outer['returncode'],0,outer); self.assertIsNone(outer['termination'])

class CheckedRepair(v3.Retained):
    submit=v3.CheckedMath.submit
    record=v3.CheckedMath.record
    check=v3.CheckedMath.check
    def setUp(self):
        super().setUp()
        self.ws=self.base/'workspace'; (self.ws/'MathGKM').mkdir(parents=True)
        (self.ws/'.scratch').mkdir(); (self.ws/'research').mkdir()
        for name in ('NeutralV3Root','ResearchSemantics','Gluing','Construction','Foundations',
                     'Machine','Continuation','ContinuationObligations'):
            shutil.copyfile(ROOT/f'MathGKM/{name}.lean',self.ws/f'MathGKM/{name}.lean')
        dependencies(self.ws); write(self.ws/'contract.json',contract())
        self.charges={}; self.index=0
        def reserve(k,v):
            if k in self.charges: raise AssertionError('unexpected duplicate reservation')
            self.charges[k]=v
        self.arm=SimpleNamespace(p={**study.DEFAULT,'transport':'fixture','validation_seconds':1200},reserve=reserve,stopped=lambda:False)
        self.state=study_policy.initial('exploration')

    def test_existing_nodes_multilevel_composition_and_required_inspector_closure(self):
        self.submit(reductions=[dict(id='edge',module='MathGKM.NeutralV3Root',
            residuals=[dict(id='a',statement='∀ n m : Nat, n + m = m + n')],term='fun h => h')])
        a=copy.deepcopy(self.state['remaining_obligations']['a']); node=copy.deepcopy(self.state['proposition_dag']['nodes']['a'])
        self.submit(reductions=[dict(id='existing',module='MathGKM.NeutralV3Root',premises=['a'],residuals=[],term='fun h => h')])
        self.assertIn('existing',self.state['knowledge'],self.state)
        self.assertEqual(a,self.state['remaining_obligations']['a'])
        self.assertEqual(node,self.state['proposition_dag']['nodes']['a'])
        checked=read(next((self.base/'checks-2').rglob('result.json')))
        self.assertNotIn('def '+self.record('existing')['task']['target_module']+'.Residual0',checked['target_source'])
        self.submit(reductions=[dict(id='deeper',module='MathGKM.NeutralV3Root',target_id='a',
            residuals=[dict(id='b',statement='∀ n m : Nat, n + m = m + n')],term='fun h => h')])
        self.submit(compositions=[dict(id='conditional',target_id='root')])
        comp=self.record('conditional')
        self.assertEqual(comp['composition']['open_leaves'],['b'])
        required=comp['task']['required_constants']
        self.assertTrue(required)
        receipt=read(next((self.base/'checks-4').rglob('result.json')))
        closure={c['name'] for c in receipt['declarations'][0]['constants']}
        self.assertLessEqual(set(required),closure)
        self.assertEqual(self.state['proposition_dag']['nodes']['root']['status'],'open')
        request=study_policy.request(self.state,0,study.DEFAULT)
        self.assertEqual(request['proposition_dag']['nodes']['a']['constant'],node['constant'])

    def test_representation_residual_actual_composition(self):
        predicate='fun b : Nat × Nat => b.1 + b.2 = b.2 + b.1'
        self.submit(representations=[dict(id='rep',module='MathGKM.NeutralV3Root',base='Nat × Nat',extended='Nat × Nat',
            predicate=predicate,target_predicate=predicate,forward='fun b => b',law='fun _ => Iff.rfl')])
        rep=self.record('rep'); original=copy.deepcopy(self.state['proposition_dag']['nodes']['rep'])
        self.submit(reductions=[dict(id='connect',module=rep['export_module'],premises=['rep'],residuals=[],
            term='fun h n m => '+rep['exports'][0]+' h (n,m)',dependencies=['rep'],required_constants=[rep['exports'][0]])])
        self.assertEqual(original,self.state['proposition_dag']['nodes']['rep'])
        self.submit(compositions=[dict(id='rep-conditional')])
        self.assertEqual(self.record('rep-conditional')['composition']['open_leaves'],['rep'])
        self.submit(mathematical_claims=[dict(id='rep-proof',module='MathGKM.NeutralV3Root',
            statement='∀ b : Nat × Nat, b.1 + b.2 = b.2 + b.1',term='fun b => Nat.add_comm b.1 b.2',discharges=['rep'])])
        self.submit(compositions=[dict(id='rep-closed')])
        self.assertEqual(self.record('rep-closed')['composition']['open_leaves'],[])

    def test_crash_receipt_export_state_snapshot_idempotent_recovery(self):
        from machinery import study_knowledge
        before=dict(id='recover-before-export',module='MathGKM.NeutralV3Root',statement='∀ n : Nat, n = n',term='fun _ => rfl')
        before_dest=self.base/'before-export'
        with patch.object(study_knowledge,'atomic_text',side_effect=KeyboardInterrupt('after check, before export')):
            with self.assertRaises(KeyboardInterrupt): ingest(self.arm,self.state,{'mathematical_claims':[before]},self.ws,before_dest)
        with patch.object(study_knowledge,'check_task',side_effect=AssertionError('finished check cannot replay')):
            ingest(self.arm,self.state,{'mathematical_claims':[before]},self.ws,before_dest)
        self.assertIn('recover-before-export',self.state['knowledge'])
        initial=copy.deepcopy(self.state)
        item=dict(id='recover',module='MathGKM.NeutralV3Root',statement='∀ n : Nat, n = n',term='fun _ => rfl')
        dest=self.base/'recover'; real=study_knowledge.atomic_text
        def interrupt_after_export(path,text):
            real(path,text)
            if Path(path).name.startswith('Accepted'): raise KeyboardInterrupt('after atomic export, before state')
        with patch.object(study_knowledge,'atomic_text',side_effect=interrupt_after_export):
            with self.assertRaises(KeyboardInterrupt): ingest(self.arm,self.state,{'mathematical_claims':[item]},self.ws,dest)
        self.assertNotIn('recover',self.state['knowledge']); charges=dict(self.charges)
        self.assertTrue(list(dest.rglob('FINISHED.json')))
        with patch.object(study_knowledge,'check_task',side_effect=AssertionError('must not replay validator')):
            ingest(self.arm,self.state,{'mathematical_claims':[item]},self.ws,dest)
        self.assertIn('recover',self.state['knowledge']); self.assertEqual(charges,self.charges)
        # Lose controller state before snapshot: durable per-item transaction restores it.
        self.state=initial
        with patch.object(study_knowledge,'check_task',side_effect=AssertionError('must not replay admission')):
            ingest(self.arm,self.state,{'mathematical_claims':[item]},self.ws,dest)
        self.assertIn('recover',self.state['knowledge'])
        snapshot(self.ws,self.base/'after-recovery',self.state['policy'])
        verify_snapshot(self.base/'after-recovery')

    def test_incomplete_receipt_and_changed_dependency_rejected_without_free_replay(self):
        from machinery import study_knowledge
        item=dict(id='partial',module='MathGKM.NeutralV3Root',statement='∀ n : Nat, n = n',term='fun _ => rfl')
        initial=copy.deepcopy(self.state); dest=self.base/'partial'
        with patch.object(study_knowledge,'atomic_text',side_effect=KeyboardInterrupt('before export')):
            with self.assertRaises(KeyboardInterrupt): ingest(self.arm,self.state,{'mathematical_claims':[item]},self.ws,dest)
        marker=next(dest.rglob('FINISHED.json')); marker.rename(marker.with_name('INTERRUPTED-FINISHED.json'))
        charges=dict(self.charges)
        with patch.object(study_knowledge,'check_task',side_effect=AssertionError('uncertain replay forbidden')):
            ingest(self.arm,self.state,{'mathematical_claims':[item]},self.ws,dest)
        self.assertNotIn('partial',self.state['knowledge']); self.assertEqual(charges,self.charges)
        # Explicit fresh identity is separately charged; old raw failure remains.
        self.submit(mathematical_claims=[{**item,'id':'fresh'}])
        first=self.record('fresh'); self.assertGreater(len(self.charges),len(charges))
        self.submit(mathematical_claims=[dict(id='unused',module=first['export_module'],statement='True',term='True.intro',dependencies=['fresh'])])
        self.assertNotIn('unused',self.state['knowledge'])
        source=self.ws/(first['export_module'].replace('.','/')+'.lean')
        source.write_text(source.read_text()+'\n-- changed accepted source version\n')
        self.submit(mathematical_claims=[{**item,'id':'fresh'}])
        self.assertTrue(any('version changed' in f.get('reason','') for f in self.state['submission_failures']))

    def test_checked_and_or_routes_cycles_false_open_and_unconnected_true(self):
        self.submit(reductions=[dict(id='false-route',module='MathGKM.NeutralV3Root',
            residuals=[dict(id='impossible',statement='False'),dict(id='other',statement='True')],
            term='fun h => False.elim h.1')])
        self.submit(compositions=[dict(id='false-conditional')])
        self.assertEqual(self.record('false-conditional')['composition']['open_leaves'],['impossible','other'])
        self.assertEqual(self.state['proposition_dag']['nodes']['root']['status'],'open')
        charges=dict(self.charges)
        self.submit(reductions=[dict(id='cycle',module='MathGKM.NeutralV3Root',target_id='impossible',
            premises=['root'],residuals=[],term='fun h => h')])
        self.assertNotIn('cycle',self.state['knowledge']); self.assertEqual(charges,self.charges)
        self.submit(reductions=[dict(id='real-route',module='MathGKM.NeutralV3Root',
            residuals=[dict(id='actual',statement='∀ n m : Nat, n + m = m + n')],term='fun h => h')])
        self.submit(mathematical_claims=[dict(id='close-actual',module='MathGKM.NeutralV3Root',
            statement='∀ n m : Nat, n + m = m + n',term='Nat.add_comm',discharges=['actual']),
            dict(id='disconnected',module='MathGKM.NeutralV3Root',statement='True',term='True.intro')])
        # Add a newer open alternative: the older checked seed route must survive.
        self.submit(reductions=[dict(id='new-open',module='MathGKM.NeutralV3Root',premises=['impossible','other'],
            residuals=[],term='fun h => False.elim h.1')])
        self.submit(compositions=[dict(id='choose-closed')])
        composed=self.record('choose-closed')['composition']
        self.assertEqual(composed['open_leaves'],[])
        self.assertNotIn('disconnected',composed['dependencies'])
        self.assertEqual(self.state['remaining_obligations']['impossible']['status'],'open')

    def test_clean_construction_closure_actual_verified_change_consumer(self):
        # Exact fully quantified historical model theorem, copied without changing
        # its hypotheses. This exercises Construction, not a True-only import.
        statement='''∀ (n : Nat) (s : MathGKM.Continuation.State) (r : MathGKM.Continuation.Result)
          (env : MathGKM.Continuation.Environment) (reward : List MathGKM.Continuation.View → Int),
          MathGKM.Continuation.tryChange s = some r →
          MathGKM.Continuation.Execution env (n + 1) s (MathGKM.Continuation.run (n + 1) s env).state (MathGKM.Continuation.run (n + 1) s env).cost ∧
          (∃ continuationCost, MathGKM.Continuation.Execution env (n + 1) r.state (MathGKM.Continuation.afterChange (n + 1) r env).state continuationCost ∧
            (MathGKM.Continuation.afterChange (n + 1) r env).cost = r.cost + continuationCost) ∧
          (MathGKM.Continuation.afterChange (n + 1) r env).observations = (MathGKM.Continuation.run (n + 1) s env).observations ∧
          MathGKM.Continuation.utility reward (MathGKM.Continuation.run (n + 1) s env) <
            MathGKM.Continuation.utility reward (MathGKM.Continuation.afterChange (n + 1) r env)'''
        required=['MathGKM.Continuation.verified_change','MathGKM.Continuation.installed_main',
                  'MathGKM.Continuation.main','MathGKM.Gluing.descend']
        result=self.check(statement,'MathGKM.Continuation.verified_change','MathGKM.Construction',required,
            context_modules=['MathGKM.Construction'])
        self.assertTrue(result['checked'],result)
        self.assertTrue(result['component_use_checked'],result)
        for name in ('Gluing','Continuation','ResearchSemantics'):
            self.assertEqual(sha(self.ws/f'MathGKM/{name}.lean'),sha(ROOT/f'MathGKM/{name}.lean'))
        self.assertEqual({c['operation'] for c in result['checks']},{'compile','kernel_replay','trusted_premise_inspection'})
        for row in result['declarations']:
            self.assertLessEqual(set(row['axioms']),{'propext','Classical.choice','Quot.sound'})
        self.assertTrue(any(c.get('module')=='MathGKM.ContinuationObligations' for c in result['checks']))
        # Model scope is retained; no Python/OS refinement or root claim follows.
        self.assertNotIn('root',self.state.get('knowledge',{}))
