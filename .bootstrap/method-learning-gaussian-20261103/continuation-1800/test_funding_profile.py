"""Light native full-horizon reservation controls; no workspaces or role calls."""
import argparse
import copy
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import sys
import time
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('source_funding_profile',HERE/'funding_profile.py')
f=importlib.util.module_from_spec(spec);spec.loader.exec_module(f)
from machinery import study,resources
from machinery.study_common import Invalid

class PrefixStopped(Exception):
    pass


def native_policy_prefix(ledger, assessment=2):
    """Execute ONLY the genuine reservation prefix, stopping before snapshot.

    All writes are intercepted in memory and no call, compiler or trial runs.
    """
    ledger.root=Path('/__synthetic_gkm_funding_fixture__/arm')
    ledger.workspace=Path('/__synthetic_gkm_funding_fixture__/workspace')
    ledger.study=Path('/__synthetic_gkm_funding_fixture__/study')
    writes=[]
    def collect(path,value):writes.append(copy.deepcopy(value))
    with patch.object(study,'assessment_tasks',return_value=assessment), \
         patch.object(study,'write',side_effect=collect), \
         patch.object(study,'snapshot',side_effect=PrefixStopped('stop before snapshot or role')):
        try:outcome=study.Arm.policy_trial(ledger,{'hash':'a'*64,'policy':{},'program':{}})
        except PrefixStopped:return {'reached_snapshot_boundary':True,'commitment':writes[0]}
    return {'reached_snapshot_boundary':False,'outcome':outcome}


def fully_reserved(profile, start=0):
    protocol=f._protocol(profile,8,start)
    ledger=f.MemoryLedger(protocol,round_index=start+8)
    groups=f.reservation_groups(protocol,additional_rounds=8,assessment_count=2,
        final_count=2,start_round=start,all_review_boundaries=True)
    f.reserve_groups(ledger,groups)
    return ledger


class FullFunding(unittest.TestCase):
    def test_exactly_two_profile_settings_change(self):
        old=json.loads(f.ORIGINAL_PROFILE.read_bytes());new=f.candidate_profile()
        self.assertEqual({k for k in old if old[k]!=new[k]}, {'validation_seconds','arm_seconds'})
        self.assertEqual(new['validation_seconds'],1800);self.assertEqual(new['arm_seconds'],1400000)
        self.assertEqual(new['max_calls'],160);self.assertEqual(new['meta_calls'],96)
        self.assertEqual(json.loads(f.candidate_profile_bytes()),new)
    def test_actual_candidate_file_is_exact_recommendation_and_fully_funded(self):
        actual=HERE/'successor-profile.json'
        self.assertEqual(f.sha(actual),'99be851317ba80e441590cdc766a4a67be7c3d309282b21ad5d2fb096091c43a')
        self.assertEqual(actual.read_bytes(),f.candidate_profile_bytes())
        result=f.qualify_profile(json.loads(actual.read_bytes()))
        self.assertTrue(result['accepted']);self.assertEqual(result['supplied_caps']['arm_seconds'],1400000)

    def test_native_schema_permits_larger_finite_arm_cap_without_upper_bound(self):
        for cap in (1400000,10**9):
            p=f.candidate_profile();p['arm_seconds']=cap
            self.assertIsNone(study.validate_protocol(f._protocol(p,8,0)))
        for cap in (0,-1,True,1400000.0):
            p=f.candidate_profile();p['arm_seconds']=cap
            with self.assertRaises(Invalid):f._protocol(p,8,0)
    def test_exact_ordinary_eight_round_reservations(self):
        p=f._protocol(f.candidate_profile(),8,0);ledger=f.MemoryLedger(p)
        groups=f.reservation_groups(p,additional_rounds=8,assessment_count=2,final_count=2,start_round=0)
        result=f.reserve_groups(ledger,groups)
        self.assertEqual(result['reserved_seconds'],705600)
        self.assertEqual(result['protected_calls'],74);self.assertEqual(result['protected_meta_calls'],40)
        self.assertEqual(len([k for k in ledger.s['budget_pools'] if k.startswith('paired-evaluation-final-')]),1)
    def test_native_six_hundred_thousand_cap_refuses_full_ordinary_horizon(self):
        profile=f.candidate_profile();profile['arm_seconds']=600000;p=f._protocol(profile,8,0)
        groups=f.reservation_groups(p,additional_rounds=8,assessment_count=2,final_count=2,start_round=0)
        with self.assertRaises(Invalid):f.reserve_groups(f.MemoryLedger(p),groups)
    def test_conservative_every_round_reviews_and_optional_policy_fit(self):
        result=f.qualify_profile(f.candidate_profile())
        self.assertEqual(result['conservative_all_review_reservations']['reserved_seconds'],1216800)
        self.assertEqual(result['total_reserved_seconds_with_optional_trials'],1317600)
        self.assertEqual(result['required_cap_including_late_precheck'],1321200)
        self.assertEqual(result['required_calls'],128);self.assertEqual(result['required_meta_calls'],64)
        self.assertEqual(result['remaining_reserved_time_margin'],78800)
    def test_global_successor_round_offset_preserves_bound(self):
        a=f.qualify_profile(f.candidate_profile(),start_round=0)
        b=f.qualify_profile(f.candidate_profile(),start_round=8)
        self.assertEqual(b['end_round'],16)
        for key in ('total_reserved_seconds_with_optional_trials','required_cap_including_late_precheck','required_calls','required_meta_calls'):
            self.assertEqual(a[key],b[key])
    def test_native_duplicate_protected_horizon_reservations_charge_once(self):
        ledger=fully_reserved(f.candidate_profile());before=copy.deepcopy(ledger.s)
        ledger.s['round']=0
        with patch.object(study,'assessment_tasks',return_value=2):
            ledger.protect_concept_horizon({'concept_commitment':{'mode':'protected_concept','end_round':2}})
        self.assertEqual(ledger.s['seconds'],before['seconds'])
        self.assertEqual(ledger.s['budget_pools'],before['budget_pools'])
    def test_real_policy_reservation_prefix_matches_source_bound_formula(self):
        ledger=fully_reserved(f.candidate_profile());before=ledger.s['seconds']
        result=native_policy_prefix(ledger)
        self.assertTrue(result['reached_snapshot_boundary'])
        self.assertEqual(result['commitment']['seconds'],104400)
        self.assertEqual(result['commitment']['calls'],20)
        self.assertEqual(ledger.s['seconds']-before,100800)
        self.assertEqual(ledger.s['seconds'],1317600)
    def test_policy_precheck_needs_already_reserved_review_headroom(self):
        profile=f.candidate_profile();profile['arm_seconds']=1317600
        ledger=fully_reserved(profile);result=native_policy_prefix(ledger)
        self.assertFalse(result['reached_snapshot_boundary'])
        self.assertEqual(result['outcome']['status'],'insufficient_predetermined_continuation_budget')
        profile['arm_seconds']=1321200
        self.assertTrue(native_policy_prefix(fully_reserved(profile))['reached_snapshot_boundary'])
    def test_existing_call_meta_caps_admit_policy_prefix_and_smaller_ones_refuse(self):
        for field,cap in (('max_calls',127),('meta_calls',63)):
            profile=f.candidate_profile();profile[field]=cap
            result=native_policy_prefix(fully_reserved(profile))
            self.assertFalse(result['reached_snapshot_boundary'])
            self.assertEqual(result['outcome']['status'],'insufficient_predetermined_call_or_meta_budget')
        self.assertTrue(native_policy_prefix(fully_reserved(f.candidate_profile()))['reached_snapshot_boundary'])
    def test_qualifier_rejects_underfunding_instead_of_approving_schema_only(self):
        for field,value in (('arm_seconds',1317600),('max_calls',127),('meta_calls',63)):
            profile=f.candidate_profile();profile[field]=value
            with self.assertRaises(Invalid):f.qualify_profile(profile)
    def test_ordinary_only_case_can_disable_optional_policy_trial_without_fake_refund(self):
        profile=f.candidate_profile();profile['policy_trials']=0;profile['arm_seconds']=1216800
        result=f.qualify_profile(profile)
        self.assertEqual(result['required_cap_including_late_precheck'],1216800)
        self.assertEqual(result['required_calls'],106);self.assertEqual(result['required_meta_calls'],48)
    def test_shared_resource_guards_are_unchanged(self):
        before=resources.limits();f.qualify_profile(f.candidate_profile())
        self.assertEqual(resources.limits(),before)
        self.assertEqual(before['timeout'],1800)
        self.assertEqual(before['footprint_hard'],5*1024**3)
    def test_arbitrary_unaligned_parent_is_not_assumed_supported(self):
        with self.assertRaises(Invalid):f.qualify_profile(f.candidate_profile(),start_round=1)


def source_hashes():
    names=['studies/method-learning-sol.json','machinery/study.py','machinery/study_common.py',
        'machinery/study_methods.py','machinery/study_transfer.py','machinery/study_concepts.py',
        'machinery/study_program.py','machinery/study_knowledge.py','machinery/resources.py',
        'machinery/process.py','config/darwin-memory-profile-007.json',
        '.bootstrap/method-learning-gaussian-20261103/continuation/owner.py',
        '.bootstrap/method-learning-gaussian-20261103/continuation/epoch.py',
        '.bootstrap/method-learning-gaussian-20261103/continuation-1800/funding_profile.py',
        '.bootstrap/method-learning-gaussian-20261103/continuation-1800/test_funding_profile.py',
        '.bootstrap/method-learning-gaussian-20261103/continuation-1800/successor-profile.json']
    return {name:f.sha(f.ROOT/name) for name in names}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write-design',action='store_true');args=parser.parse_args()
    before=source_hashes();stream=io.StringIO();started=time.monotonic()
    with patch('subprocess.Popen',side_effect=AssertionError('no external child permitted')), \
         patch('subprocess.run',side_effect=AssertionError('no external command permitted')), \
         patch('os.system',side_effect=AssertionError('no external command permitted')):
        result=unittest.TextTestRunner(stream=stream,verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(FullFunding))
    print(stream.getvalue(),end='')
    after=source_hashes();okay=result.wasSuccessful() and before==after
    if args.write_design:
        if not okay:raise SystemExit('tests or source identity failed; no qualification written')
        profile=json.loads((HERE/'successor-profile.json').read_bytes());design={'schema':'math-gkm.full-successor-funding-design.v1',
            'status':'passed_source_accounting_qualification_NOT_ACTIVE','activation_approved':False,
            'handoff_approved':False,'profile_recommendation':profile,
            'recommended_profile_file_sha256':hashlib.sha256(f.candidate_profile_bytes()).hexdigest(),
            'profile_file_encoding':'candidate_profile_bytes(): original format, exact validation and arm cap replacements only',
            'qualification':f.qualify_profile(profile),'source_hashes_before':before,'source_hashes_after':after,
            'sources_unchanged':before==after,'tests_run':result.testsRun,'failures':len(result.failures),'errors':len(result.errors),
            'test_elapsed_seconds':time.monotonic()-started,'test_log':stream.getvalue(),
            'native_entrypoints':['study.validate_protocol','study.episode_envelope','study.paired_evaluation_seconds',
                'Arm.fund_many','Arm.fund','Arm.available_calls','Arm.protect_concept_horizon',
                'Arm.policy_trial reservation-prefix only, intercepted before first snapshot or role'],
            'reserved_time_is_actual_walltime':False,
            'limitations':['Conservative every-round review/method envelope over-approximates allowed due-date combinations.',
                'Public role/count sizes only; no private panel content or source mathematics was inspected.',
                'Policy-trial prefix executes no snapshot, compiler, role or actual trial; all writes are intercepted in memory.',
                'No live deployment, handoff, successful proof, model behavior or resource-pressure availability is established.',
                'Fresh successor only; original A/B allowances, outcomes and costs are unchanged.',
                'Retained execution_budget can still narrow individual validation below the1800 profile ceiling.',
                'Per-child1800 timeout, memory/disk/admission guards and max_calls160/meta96 are unchanged.']}
        path=HERE/'FUNDING_DESIGN.json'
        with path.open('x') as out:out.write(json.dumps(design,sort_keys=True,indent=2,allow_nan=False)+'\n')
        print(json.dumps({'design':str(path),'sha256':f.sha(path),'tests_run':result.testsRun,'status':design['status']},sort_keys=True))
    return 0 if okay else 1

if __name__=='__main__':raise SystemExit(main())
