"""New native-allocation connections; no campaign, model or proof execution.

The retained fixture supplies real native planner/trial/accounting methods with
explicit invented transport/policy/validation/evaluation doubles. Its PUBLIC
source path alone is redirected to the byte-pinned original snapshot; NATIVE
then selects the exact proposed module for this changed-source test.
"""
import copy
import hashlib
import json
from pathlib import Path
import tempfile
import types
import unittest

HERE=Path(__file__).parent
ROOT=Path('/Users/sasha/math_gkm')
FIXTURE=ROOT/'.bootstrap/current35-resource-resume-20261030/test_planner_budget.py'
FIXTURE_SHA='7a4343c3c750091d4347e58e28093e6b0f4c8a94049eb1efc35e50c8b3b0b85d'
ORIGINAL_SHA='98b7569ddaeab32af6e3628dacba3815f035b62eaaed792fcfd5f0e3df613b0a'
CANDIDATE_SHA='eb19c2086dd318b603d710e7eef0bf57cceedb3b940aeda3fcc0df713bce04f2'
assert hashlib.sha256((HERE/'study.original.py').read_bytes()).hexdigest()==ORIGINAL_SHA
CANDIDATE=(HERE/'study.proposed.py').read_bytes()
assert hashlib.sha256(CANDIDATE).hexdigest()==CANDIDATE_SHA
fixture_source=FIXTURE.read_bytes()
assert hashlib.sha256(fixture_source).hexdigest()==FIXTURE_SHA
literal="PUBLIC = Path('/Users/sasha/math_gkm/machinery/study.py')"
replacement="PUBLIC = Path("+repr(str(HERE/'study.original.py'))+")"
assert fixture_source.decode().count(literal)==1
redirected=fixture_source.decode().replace(literal,replacement)
assert redirected.replace(replacement,literal).encode()==fixture_source
F=types.ModuleType('accepted_neutral_fixture_with_pinned_source_snapshot')
F.__file__=str(FIXTURE)
exec(compile(redirected,str(FIXTURE),'exec'),F.__dict__)
F.NATIVE=CANDIDATE;F.PUBLIC=HERE/'study.proposed.py'
TRACE_RESULTS=[]

def code_at(code,name):
    return next(value for value in code.co_consts
                if isinstance(value,types.CodeType) and value.co_name==name)

class NativeAllocation(unittest.TestCase):
    def fixture(self,root,seconds=270000,meta=40):
        f=F.Fixture(root,install=False)
        f.study=root/'.scratch/fresh-gaussian-neutral'
        f.armroot=f.study/'arms/exploration';f.workspace=f.armroot/'workspace'
        f.workspace.mkdir(parents=True)
        a=f.arm;a.study=f.study;a.root=f.armroot;a.workspace=f.workspace
        a.p.update(rounds=4,knowledge_checks_per_round=3,arm_seconds=seconds,meta_calls=meta)
        f.m.write(f.study/'evaluation/suite.json',{'tasks':[{'neutral':0},{'neutral':1}]})
        compiled=compile(CANDIDATE,str(HERE/'study.proposed.py'),'exec')
        for name in ('episode_envelope','validate_commitment'):
            setattr(f.m,name,types.FunctionType(code_at(compiled,name),f.m.__dict__,name))
        f.m.validate_commitment(a.p,2)
        self.assertEqual(f.m.episode_envelope(a.p,2,2),
            {'research':(32400,10,8),'evaluation':(21600,2,0),'review':(3600,2,2)})
        a.s.update(round=0,phase='research',status='running',seconds=0,calls=0,meta_calls=0,
            budget_pools={},reservations={},receipts=[],receipt_hashes={},counted_jobs=[],
            policy_trials=0,completed_policy_trials=[],active=None,active_intent=None)
        entries={}
        for first in (0,2):
            entries['episode-research-'+str(first)]=f.m.episode_envelope(a.p,2,2)['research']
        for end in range(1,5):
            entries['paired-evaluation-episode-'+str(end)]=(21600,2,0)
            entries['review-'+str(end)]=(3600,2,2)
        entries['paired-evaluation-final-4']=(21600,2,0)
        a.fund_many(entries)
        self.assertEqual(a.s['seconds'],187200)
        f.oldcaps={key:(pool['cap'],pool['calls'],pool['meta_calls'])
                   for key,pool in a.s['budget_pools'].items()}
        self.assertNotIn(f.component.MAIN_POOL,a.s['budget_pools'])
        return f

    def main_round(self,f,index):
        f.planner(index)
        with f.arm.budget('episode-research-'+str(index-index%2)):
            f.arm.call('round-'+f'{index:04d}','researcher',{},f.workspace,False)
            for item in range(4):
                f.arm.reserve('neutral-main-validation-'+str(index)+'-'+str(item),1800)

    def trial(self,f,index):
        a=f.arm;a.s.update(round=index,phase='review')
        return a.policy_trial({'hash':'a'*64,'policy':{},'program':{}})

    def test_full_liability_earliest_and_latest_native_trial(self):
        for boundary in (1,4):
            with self.subTest(boundary=boundary),tempfile.TemporaryDirectory(prefix='native-generation-positive-',dir=HERE) as tmp:
                f=self.fixture(Path(tmp))
                try:
                    a=f.arm
                    self.assertEqual((a.available(),a.available_calls(),a.available_calls(meta=True)),(82800,26,16))
                    for index in range(4):
                        self.main_round(f,index)
                        if index+1==boundary:
                            result=self.trial(f,boundary)
                            self.assertIn('eligible',result)
                            self.assertEqual(a.available(),3600)
                    f.spend_old_protected_remainder()
                    for name,pool in list(a.s['budget_pools'].items()):
                        if pool['spent']<pool['cap']:
                            with a.budget(name):
                                a.reserve('neutral-complete-liability-'+name,pool['cap']-pool['spent'])
                    self.assertEqual((a.s['seconds'],a.s['calls'],a.s['meta_calls']),(266400,60,40))
                    self.assertEqual((a.available(),a.available_calls(),a.available_calls(meta=True)),(3600,4,0))
                    self.assertEqual(a.p['meta_calls'],40)
                    self.assertNotIn(f.component.MAIN_POOL,a.s['budget_pools'])
                    self.assertNotIn(f.component.TRIAL_POOL,a.s['budget_pools'])
                    for key,limits in f.oldcaps.items():
                        pool=a.s['budget_pools'][key]
                        self.assertEqual((pool['cap'],pool['calls'],pool['meta_calls']),limits)
                    proposers=[(key,pool,req) for key,role,pool,req in f.receipts if role=='proposer']
                    self.assertEqual(len(proposers),32)
                    self.assertEqual(sum(req['planning_generation']['index']==1 for key,pool,req in proposers),16)
                    self.assertTrue(all(pool.startswith(('episode-research-','policy-')) for key,pool,req in proposers))
                    TRACE_RESULTS.append({'review':boundary,'cap_seconds':a.p['arm_seconds'],
                        'reserved_liability_seconds':a.s['seconds'],'admission_headroom_unspent':a.available(),
                        'calls':a.s['calls'],'META':a.s['meta_calls'],'generation1_calls':16})
                finally:f.close()

    def test_32META_refuses_trial_before_branch_effects(self):
        with tempfile.TemporaryDirectory(prefix='native-generation-meta-refusal-',dir=HERE) as tmp:
            f=self.fixture(Path(tmp),meta=32)
            try:
                self.main_round(f,0);before=copy.deepcopy(f.arm.s)
                result=self.trial(f,1)
                self.assertEqual(result['status'],'insufficient_predetermined_call_or_meta_budget')
                for key in ('seconds','calls','meta_calls','budget_pools','reservations'):
                    self.assertEqual(f.arm.s[key],before[key])
                self.assertFalse(any(name.startswith('policy-') for name in f.arm.s['budget_pools']))
            finally:f.close()

    def test_266400_cap_refuses_existing_conservative_trial_gate(self):
        with tempfile.TemporaryDirectory(prefix='native-generation-time-refusal-',dir=HERE) as tmp:
            f=self.fixture(Path(tmp),seconds=266400)
            try:
                self.main_round(f,0);before=copy.deepcopy(f.arm.s)
                result=self.trial(f,1)
                self.assertEqual(result['status'],'insufficient_predetermined_continuation_budget')
                for key in ('seconds','calls','meta_calls','budget_pools','reservations'):
                    self.assertEqual(f.arm.s[key],before[key])
                self.assertFalse(any(name.startswith('policy-') for name in f.arm.s['budget_pools']))
            finally:f.close()

if __name__=='__main__':
    suite=unittest.defaultTestLoader.loadTestsFromTestCase(NativeAllocation)
    result=unittest.TextTestRunner(verbosity=2).run(suite)
    if result.wasSuccessful():
        (HERE/'NEUTRAL_RESULT.json').write_text(json.dumps({'schema':'math-gkm.fresh-native-generation-envelope-neutral.v1',
            'candidate_sha256':CANDIDATE_SHA,'baseline_sha256':ORIGINAL_SHA,'test_source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
            'groups_passed':result.testsRun,'positive_full_traces':TRACE_RESULTS,'negative_refusals':['32META','266400seconds'],
            'actual_campaign_or_model_or_proof_or_constructor_actions':False,'unchanged_suites_rerun':False,
            'limits':'Native proposed Arm accounting/planner/policy_trial; existing fixture transport/policy/receipt/validation/evaluation doubles, plus conservative full-liability stress of every original protected pool.'},indent=2,sort_keys=True)+'\n')
    raise SystemExit(0 if result.wasSuccessful() else 1)
