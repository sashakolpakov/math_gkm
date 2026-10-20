"""V3 source-audit acceptance sources. NOT EXECUTED during construction.

Run classes sequentially after independent audit. Mathematical tests use actual
compile, leanchecker and premise inspection with pinned package links; no mock
dependency identity. Pure/simulation tests explicitly identify their scope.
"""
import copy
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from types import SimpleNamespace
from unittest.mock import patch

from machinery import study_policy as policy, study_program, residual_dag, resources
from machinery.study import Arm, DEFAULT
from machinery.study_common import ROOT, Invalid, sha, digest, read, write, dependencies
from machinery.study_knowledge import ingest
from machinery.study_reports import accept_report
from machinery.study_transfer import check_task, bind_task

def contract():
    return dict(id='neutral-v3',phase='construction',root_file='MathGKM/NeutralV3Root.lean',
        root_sha256=sha(ROOT/'MathGKM/NeutralV3Root.lean'),root_declaration='MathGKM.NeutralV3.Root',
        root_meaning='Addition of any two natural numbers commutes; unbounded indices.',
        assumptions=['propext','Classical.choice','Quot.sound'],
        correspondence_obligations=['neutral_unbounded_addition'],inherited=[],
        preference='Exact root; checked use and costs reported separately; no universal score.')

def ordinary():
    return dict(agenda=['work on the fixed root'],hypotheses=[],trial=None,evidence=[],
                use_links=[],summary='routine theorem work',completion=None)

class Retained(unittest.TestCase):
    def setUp(self):
        self.base=Path(tempfile.mkdtemp(prefix='v3-',dir=ROOT/'.scratch'))
        print('RETAINED',self.base,flush=True)

class Pure(Retained):
    def test_versions_findings_and_ordinary_default(self):
        state,commit=policy.commit(policy.initial('exploration'),ordinary(),self.base,0,DEFAULT)
        self.assertIsNone(commit['selected'])
        h=dict(id='route-v0',kind='strategy',claim='Try exact transport',uncertainty='Will a fresh consumer use the interface?',
               outcomes=[dict(check='consumer closure uses export',changes_next_choice='continue reuse'),
                         dict(check='closure omits export',changes_next_choice='reassess route')],parent=None,revision=0)
        report={**ordinary(), 'hypotheses':[h], 'work_kind':'exploration','trial':dict(hypothesis='route-v0',invention=False)}
        staged,c=policy.commit(state,report,self.base,1,DEFAULT)
        ref=staged['portfolio']['route-v0']['reference']
        execution={**ordinary(),'trial':report['trial'],'commitment_ref':ref,'prospective_binding':digest(c),
                   'findings':[dict(reference=ref,observation='not yet checked',uncertainty='still unknown')]}
        policy.record(staged,execution,self.base,1,DEFAULT,prospective=c)
        changed={**h,'uncertainty':'retroactively certain'}
        with self.assertRaises(Invalid): policy.record(staged,{**ordinary(),'hypotheses':[changed]},self.base,2,DEFAULT)
        descendant={**changed,'id':'route-v1','parent':ref,'revision':1}
        policy.record(staged,{**ordinary(),'hypotheses':[descendant]},self.base,2,DEFAULT)
        self.assertEqual(staged['portfolio']['route-v0']['uncertainty'],h['uncertainty'])
        self.assertNotEqual(staged['portfolio']['route-v1']['reference'],ref)

    def test_meaningful_request_and_audit_isolation(self):
        state=policy.initial('exploration')
        state['remaining_obligations']={'leaf':dict(status='open',target_constant='Exact.Leaf')}
        state['components']={'adapter':dict(exports=['Checked.adapter'])}
        state['program']=dict(schema=study_program.REFERENCE['schema'],code=[
            dict(op='select_obligation',id='leaf'),dict(op='reuse_library',ids=['adapter']),
            dict(op='allocate',exploration_percent=40),dict(op='budgets',tool_seconds=5,validation_seconds=300),
            dict(op='reassess',after_rounds=1)])
        req=policy.request(state,0,DEFAULT)
        self.assertEqual(req['research_focus'],'leaf'); self.assertEqual(req['execution_budget']['tool_seconds'],5)
        self.assertIn('adapter',req['reuse_interfaces']); self.assertEqual(req['work_mode'],'exploration')
        for value in (0,999999,{'forged':'winner'}):
            state['audit']=value
            self.assertEqual(req,policy.request(state,0,DEFAULT))
        with self.assertRaises(resources.ResourceFailure): resources.limits({'rss_hard':6*resources.GiB})

    def test_charged_repair_new_request_and_next_researcher(self):
        # Deterministic transport at Arm.call boundary; no model is called.
        state=policy.initial('exploration'); calls=[]; charged=[]
        arm=SimpleNamespace(root=self.base,p=DEFAULT)
        def call(key,role,req,workspace=None,readonly=False):
            calls.append((key,role,copy.deepcopy(req))); charged.append(DEFAULT['call_seconds'])
            payload={'agenda':'malformed'} if len(calls)==1 else ordinary()
            receipt=dict(outcome='completed',payload=payload,elapsed_seconds=0,request_id=key)
            write(self.base/'jobs'/key/'final.json',dict(payload_json=payload))
            write(self.base/'jobs'/key/'receipt.json',receipt)
            return receipt
        arm.call=call
        staged,c=Arm.plan_with_repair(arm,'plan-0',{},state,self.base,0,DEFAULT)
        original=sha(self.base/'jobs/plan-0/final.json')
        self.assertEqual([c[0] for c in calls],['plan-0','plan-0-repair-1'])
        self.assertEqual(sum(charged),2*DEFAULT['call_seconds'])
        next_req=policy.request(staged,0,DEFAULT)
        next_req.update(committed_trial=c['trial'],prospective_binding=digest(c))
        call('round-0','researcher',next_req)
        self.assertEqual(calls[-1][1],'researcher')
        self.assertEqual(original,sha(self.base/'jobs/plan-0/final.json'))
        # Exhaustion is operational, with a durable failure record.
        arm.call=lambda key,*args,**kw: dict(outcome='completed',payload={'agenda':False})
        with self.assertRaises(Invalid): Arm.plan_with_repair(arm,'exhaust',{},state,self.base,0,DEFAULT)
        self.assertTrue((self.base/'repair-failures/exhaust.json').exists())

    def test_graph_unknown_cycle_and_open_conditional(self):
        state={}; g=residual_dag.graph(state,contract())
        g['nodes']['a']=dict(constant='Exact.A',module='MathGKM.A',context='fixed')
        g['nodes']['b']=dict(constant='Exact.B',module='MathGKM.B',context='fixed')
        g['edges']['root']=[dict(id='a-to-root',premises=['a'],proof='Accepted.ar',module='MathGKM.AR')]
        g['edges']['a']=[dict(id='b-to-a',premises=['b'],proof='Accepted.ba',module='MathGKM.BA')]
        c=residual_dag.composition(g,state)
        self.assertEqual(c['open_leaves'],['b']); self.assertIn('Exact.B',c['statement'])
        with self.assertRaises(Invalid): residual_dag.prepare(g,dict(target_id='b',premises=['root']))
        with self.assertRaises(Invalid): residual_dag.prepare(g,dict(premises=['unknown']))
        g['nodes']['unconnected']=dict(constant='True',module='MathGKM.U',context='fixed')
        with self.assertRaises(Invalid): residual_dag.composition(g,state,'unconnected')

class CheckedMath(Retained):
    def setUp(self):
        super().setUp()
        self.ws=self.base/'workspace'; (self.ws/'MathGKM').mkdir(parents=True)
        (self.ws/'.scratch').mkdir(); (self.ws/'research').mkdir()
        for name in ('NeutralV3Root','ResearchSemantics','Gluing'):
            shutil.copyfile(ROOT/f'MathGKM/{name}.lean',self.ws/f'MathGKM/{name}.lean')
        dependencies(self.ws); write(self.ws/'contract.json',contract())
        self.reservations={}
        def reserve(k,v):
            if k in self.reservations: self.assertEqual(v,self.reservations[k])
            self.reservations[k]=v
        self.arm=SimpleNamespace(p={**DEFAULT,'transport':'fixture','validation_seconds':1200},reserve=reserve,stopped=lambda:False)
        self.state=policy.initial('exploration'); self.index=0
    def submit(self,**items):
        self.index+=1
        ingest(self.arm,self.state,items,self.ws,self.base/f'checks-{self.index}')
    def record(self,k):
        return {**self.state['knowledge'],**self.state['components']}[k]
    def check(self,statement,term,module,required=(),*,context_modules=None):
        self.index+=1
        task=dict(id='exact',statement=statement,hypotheses=[],scope='neutral unbounded acceptance',
                  source_sha256=contract()['root_sha256'],interface_type='True',transport_type='True',required_constants=list(required))
        # Context is supplied BEFORE the solver; never inferred from its module.
        if context_modules is not None:
            task=bind_task(self.ws,task,context_modules)
        return check_task(self.ws,task,dict(module=module,term=term,interface_term='True.intro',transport_term='True.intro'),
                          self.base/f'exact-{self.index}',1200,required=required)

    def test_successive_admission_fresh_consumer_exact_root(self):
        self.submit(mathematical_claims=[dict(id='commute',module='MathGKM.NeutralV3Root',statement='∀ n m : Nat, n + m = m + n',term='Nat.add_comm')])
        first=self.record('commute')
        self.submit(attachments=[dict(id='section',module=first['export_module'],base='Nat × Nat',extended='(Nat × Nat) × Unit',
            forget='fun e => by\n  exact e.1',extend='fun b => by\n  exact (b, ())',section_law='fun _ => by\n  rfl',
            predicate='fun b : Nat × Nat => b.1 + b.2 = b.2 + b.1',base_proof='fun b => '+first['exports'][0]+' b.1 b.2',
            dependencies=['commute'],required_constants=[first['exports'][0]])])
        a=self.record('section'); ai=a['exports'][1]; at=a['exports'][2]
        self.submit(representations=[dict(id='exact-representation',module=a['export_module'],base='Nat × Nat',extended='(Nat × Nat) × Unit',
            predicate='fun b : Nat × Nat => b.1 + b.2 = b.2 + b.1',
            target_predicate='fun e : (Nat × Nat) × Unit => e.1.1 + e.1.2 = e.1.2 + e.1.1',
            forward=ai+'.extend',law='fun b => by\n  change ((fun x : Nat × Nat => x.1 + x.2 = x.2 + x.1) ('+ai+'.forget ('+ai+'.extend b))) ↔ _\n  exact Iff.of_eq (congrArg (fun x : Nat × Nat => x.1 + x.2 = x.2 + x.1) ('+at+' b))',
            dependencies=['section'],required_constants=[at])])
        self.submit(fiber_gluings=[dict(id='dependent',module='MathGKM.ResearchSemantics',base='Nat',extended='Nat',map='fun n : Nat => n',
            family='fun _ : Nat => Nat',target_family='fun _ : Nat => Nat',family_map='fun n m : Nat => n + m',dependencies=[],required_constants=[])])
        r=self.record('exact-representation'); f=self.record('dependent')
        fi,ft,fu=f['exports'][1],f['exports'][2],f['exports'][0]
        text='\n'.join('import '+x for x in (r['export_module'],a['export_module'],f['export_module']))+'\n'
        text+='theorem MathGKM.NeutralConsumer.finish : MathGKM.NeutralV3.Root := by\n'
        text+='  intro n m\n  let k := MathGKM.ResearchSemantics.pushLift (f := fun n : Nat => n) (F := fun _ : Nat => Nat) (G := fun _ : Nat => Nat) (fun n m : Nat => n + m)\n'
        text+='  have hk : k = '+fi+' := '+fu+' k (fun _ _ => rfl)\n'
        text+='  let p := MathGKM.ResearchSemantics.pushUnit (fun n : Nat => n) (fun _ : Nat => Nat) n m\n'
        text+='  have use : '+fi+' n p = n + m := (congrArg (fun z => z n p) hk).symm.trans rfl\n'
        text+='  exact use.symm.trans (('+ft+' n m).trans ('+r['exports'][0]+' '+a['exports'][0]+' (n,m)))\n'
        (self.ws/'MathGKM/NeutralConsumer.lean').write_text(text)
        required=[r['exports'][0],a['exports'][0],at,fu,ft]
        self.submit(mathematical_claims=[dict(id='fresh-consumer',module='MathGKM.NeutralConsumer',statement=contract()['root_declaration'],
            term='MathGKM.NeutralConsumer.finish',dependencies=['exact-representation','section','dependent'],required_constants=required)])
        consumer=self.record('fresh-consumer')
        result=self.check(contract()['root_declaration'],consumer['exports'][0],consumer['export_module'],required)
        self.assertTrue(result['checked'],result)
        self.assertEqual({x['operation'] for x in result['checks']},{'compile','kernel_replay','trusted_premise_inspection'})
        self.assertEqual(sha(self.ws/contract()['root_file']),contract()['root_sha256'])
        # Exact Lean root is checked; independent correspondence is still required.

    def test_valid_math_invalid_optional_metadata_later_bad_item_recovery(self):
        state,c=policy.commit(self.state,ordinary(),self.ws,0,DEFAULT)
        report=dict(agenda=False,prospective_binding=digest(c),mathematical_claims=[
            dict(id='good',module='MathGKM.NeutralV3Root',statement='∀ n : Nat, n = n',term='fun _ => rfl'),
            dict(id='bad',module='MathGKM.NeutralV3Root',statement='False',term='True.intro'),
            {'id':'malformed'},
            dict(id='later-good',module='MathGKM.NeutralV3Root',statement='∀ n : Nat, n = n',term='fun _ => rfl')])
        dest=self.base/'independent-report'
        self.assertFalse(accept_report(self.arm,state,report,self.ws,dest,0,DEFAULT,c))
        self.assertIn('good',state['knowledge']); self.assertNotIn('bad',state['knowledge'])
        self.assertIn('later-good',state['knowledge']); self.assertNotIn('malformed',state['knowledge'])
        self.assertTrue(state['metadata_failures']); self.assertTrue(state['submission_failures'] or state['observations'])
        charged=dict(self.reservations)
        accept_report(self.arm,state,report,self.ws,dest,0,DEFAULT,c)
        self.assertEqual(charged,self.reservations)

    def test_checked_dag_actual_composition_and_unconnected_true(self):
        self.submit(reductions=[dict(id='root-edge',module='MathGKM.NeutralV3Root',
            residuals=[dict(id='a',statement='∀ n m : Nat, n + m = m + n')],term='fun h => h')])
        self.submit(reductions=[dict(id='second-edge',module='MathGKM.NeutralV3Root',target_id='a',
            residuals=[dict(id='b',statement='∀ n m : Nat, n + m = m + n')],term='fun h => h')])
        self.submit(compositions=[dict(id='conditional',target_id='root')])
        self.assertEqual(self.record('conditional')['composition']['open_leaves'],['b'])
        self.assertEqual(self.state['proposition_dag']['nodes']['root']['status'],'open')
        self.submit(mathematical_claims=[dict(id='unconnected',module='MathGKM.NeutralV3Root',statement='True',term='True.intro'),
            dict(id='close-b',module='MathGKM.NeutralV3Root',statement='∀ n m : Nat, n + m = m + n',term='Nat.add_comm',discharges=['b'])])
        self.submit(compositions=[dict(id='closed-path',target_id='root')])
        closed=self.record('closed-path')
        self.assertEqual(closed['composition']['open_leaves'],[])
        self.assertNotIn('unconnected',closed['dependencies'])
        self.assertTrue(self.check(contract()['root_declaration'],closed['exports'][0],closed['export_module'])['checked'])

    def test_negative_math_boundaries_representation_section_premises_and_axiom(self):
        for statement,term,module in [
            ('False','True.intro','MathGKM.NeutralV3Root'),
            (contract()['root_declaration'],'fun (_ : False) => False.elim ‹False›','MathGKM.NeutralV3Root'),
            ('MathGKM.ResearchSemantics.ConservativeExtension Nat Empty','{ forget := Empty.elim, extend := fun _ => (), forget_extend := fun _ => rfl }','MathGKM.ResearchSemantics'),
            ('MathGKM.ResearchSemantics.Representation Bool Unit (fun b => b = true) (fun _ => True)','{ forward := fun _ => (), law := fun _ => Iff.rfl }','MathGKM.ResearchSemantics'),
            ('∀ a : Unit, false = true','fun _ => rfl','MathGKM.Gluing')]:
            result=self.check(statement,term,module)
            self.assertFalse(result['checked'],result)
        (self.ws/'MathGKM/Forbidden.lean').write_text('import MathGKM.NeutralV3Root\naxiom forbidden : MathGKM.NeutralV3.Root\n')
        self.assertFalse(self.check(contract()['root_declaration'],'forbidden','MathGKM.Forbidden')['checked'])

class MatchedContinuation(Retained):
    def test_actual_multiround_selection_changes_next_real_request(self):
        from machinery import study
        from machinery.study_common import lock,load_state
        suite=dict(schema='math-gkm.suite.v2',selector='neutral deterministic independent fixture',
            selection_basis='Exact fixed unbounded identity holdout; known synthetic role behavior, not live discovery',independent=True,
            tasks=[dict(id='transfer',statement='∀ n : Nat, n = n',hypotheses=[],scope='neutral exact transfer',
                source_sha256=contract()['root_sha256'],kind='holdout',interface_type='True',transport_type='True',required_constants=[],
                fixture_strategy='component_or_bounded',reference_answer='HIDDEN-004-ANSWER-DO-NOT-HANDOFF')])
        directory=self.base/'matched'
        config=dict(model='gpt-6.1-sol',rounds=3,fixture_policy_trial=True,max_calls=100,meta_calls=60,
                    arm_seconds=50000,knowledge_checks_per_round=1,call_seconds=2,adaptation_seconds=2)
        # Unmocked deployment identity; actual fixture subprocesses and Lean.
        study.freeze(directory,config,suite,contract())
        with lock(directory/'controller.lock') as fd:
            arm=study.Arm(directory,'exploration',fd)
            arm.research_round(); arm.research_round(); arm.review(); arm.research_round()
        decision=read(directory/'arms/exploration/decisions/review-2.json')
        self.assertTrue(decision['accepted_experimental_change'],decision)
        self.assertEqual(decision['comparison']['rounds_each'],2)
        self.assertFalse(decision['certified_switch'])
        req=read(directory/'arms/exploration/jobs/round-0002/request.json')
        self.assertEqual(req['research_focus'],'root'); self.assertEqual(req['work_mode'],'exploration')
        self.assertIn('budgets',req['program_execution']['executed'])
        state=load_state(directory/'arms/exploration/state.json')
        self.assertEqual(state['round'],3)
        self.assertTrue(req['pending_discoveries'],'checked branch mathematics must reach next own researcher')
        plan=read(directory/'arms/exploration/jobs/plan-0002/request.json')
        self.assertTrue(plan['pending_discoveries'],'next own proposer sees legitimate pending sources')
        accepted=state['research']['knowledge']['fixture-strategy-component']
        provenance=accepted['discovery_provenance']
        entry=state['research']['pending_discoveries'][provenance['binding']]
        self.assertEqual(provenance['origin']['side'],'candidate')
        self.assertNotEqual(accepted['validation_bundle']['directory'],entry['core']['record']['validation_bundle']['directory'])
        self.assertIn('main_admitted',entry['status'])
        self.assertIsNone(state['resolution'],'a checked neutral theorem is not independent root completion')
        for request in (plan,req):
            self.assertNotIn('HIDDEN-004-ANSWER-DO-NOT-HANDOFF',str(request))
        for entry in state['research']['pending_discoveries'].values():
            spec=read(directory/'arms/exploration/jobs'/entry['core']['origin']['job_key']/'spec.json')
            self.assertEqual(spec['role'],'researcher')

        self.assertEqual({o['status'] for o in state['research']['formal_obligations']},{'open'})
