"""Pure native funding design for a fresh eight-round learning successor.

No study, research state, model, compiler, snapshot or trial is created here.
Reserved seconds are accounting ceilings, not predictions of elapsed wall time.
"""
import copy
import hashlib
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
from machinery import study
from machinery.study_common import Invalid

RECOMMENDED_ARM_SECONDS = 1_400_000
RECOMMENDED_VALIDATION_SECONDS = 1800
ORIGINAL_PROFILE = ROOT/'studies/method-learning-sol.json'
ORIGINAL_PROFILE_SHA256 = '423a6efb4b568bd0b819781ef6f98d2670f5cb388ac738781e7a85fde87323b3'


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def candidate_profile_bytes():
    original = ORIGINAL_PROFILE.read_bytes()
    if sha(ORIGINAL_PROFILE) != ORIGINAL_PROFILE_SHA256:
        raise Invalid('original profile source changed')
    replacements = ((b'"validation_seconds": 600', b'"validation_seconds": 1800'),
                    (b'"arm_seconds": 600000', b'"arm_seconds": 1400000'))
    result = original
    for before, after in replacements:
        if result.count(before) != 1:
            raise Invalid('exact original profile spelling changed')
        result = result.replace(before, after, 1)
    return result


def candidate_profile():
    return json.loads(candidate_profile_bytes())


class MemoryLedger(study.Arm):
    """Actual native reservation/accounting methods, in a source-only fixture.

    save() has no filesystem effect. The object never calls native Arm.call.
    Protected call/meta quotas remain reserved rather than being executed.
    """
    def __init__(self, protocol, *, round_index=0):
        self.p = copy.deepcopy(protocol)
        self.s = {'seconds': 0, 'calls': 0, 'meta_calls': 0, 'budget_pools': {},
                  'reservations': {}, 'round': round_index, 'policy_trials': 0,
                  'research': {'policy': {}, 'program': {}}}
        self.active_budget = None
        self.study = Path('/__synthetic_gkm_funding_fixture__/study')
        self.mode = 'exploration'
        self.saves = 0

    def save(self):
        self.saves += 1

    def admitted(self, _research):
        return []


def _protocol(profile, additional_rounds, start_round):
    value = {**copy.deepcopy(study.DEFAULT), **copy.deepcopy(profile)}
    if (type(additional_rounds) is not int or additional_rounds < 1 or
            type(start_round) is not int or start_round < 0 or
            start_round % value['episode_rounds']):
        raise Invalid('fresh successor needs a positive horizon and aligned start')
    value['rounds'] = start_round + additional_rounds
    study.validate_protocol(value)
    return value


def reservation_groups(protocol, *, additional_rounds, assessment_count,
                       final_count, start_round, all_review_boundaries=False):
    """Native envelopes, exact native pool names, deduplicated by fund_many.

    The conservative mode reserves assessment/review/method pools at EVERY
    round boundary. This covers early program reassessment and concept reviews;
    it deliberately over-approximates which method due dates can coincide.
    """
    if any(type(n) is not int or n < 0 for n in (assessment_count, final_count)):
        raise Invalid('only public nonnegative panel SIZE counts are accepted')
    width = protocol['episode_rounds']
    end = start_round + additional_rounds
    groups = []
    regular_reviews = set()
    for first in range(start_round, end, width):
        count = min(width, end-first)
        boundary = first+count
        regular_reviews.add(boundary)
        pools = study.episode_envelope(protocol, count, assessment_count)
        entries = {'episode-research-'+str(first): pools['research'],
                   'paired-evaluation-episode-'+str(boundary): pools['evaluation'],
                   'review-'+str(boundary): pools['review']}
        if 'methods' in pools:
            entries['method-learning-review-'+str(boundary)] = pools['methods']
        if final_count:
            # Native research_round presents this same key in EVERY episode.
            entries['paired-evaluation-final-'+str(end)] = (
                study.paired_evaluation_seconds(protocol, final_count), 2, 0)
        groups.append(entries)
    if all_review_boundaries:
        extra = study.episode_envelope(protocol, 1, assessment_count)
        for boundary in range(start_round+1, end+1):
            if boundary in regular_reviews:
                continue
            entries = {'paired-evaluation-episode-'+str(boundary): extra['evaluation'],
                       'review-'+str(boundary): extra['review']}
            if 'methods' in extra:
                entries['method-learning-review-'+str(boundary)] = extra['methods']
            groups.append(entries)
    return groups


def reserve_groups(ledger, groups):
    for entries in groups:
        ledger.fund_many(entries)
    pools = ledger.s['budget_pools']
    return {'reserved_seconds': ledger.s['seconds'],
            'protected_calls': sum(p.get('calls', 0) for p in pools.values()),
            'protected_meta_calls': sum(p.get('meta_calls', 0) for p in pools.values()),
            'pool_count': len(pools), 'native_save_count': ledger.saves}


def policy_trial_envelope(protocol, assessment_count):
    """Exact source formulas from native Arm.policy_trial, tested at its guard.

    Existing source review funds the same review-<round> key; its seconds are
    included in the nominal trial PRECHECK but are not a second fresh pool.
    """
    trials = protocol['policy_trials']
    rounds_each = protocol['policy_trial_rounds']
    calls = 2*(1+2*(1+protocol['proposal_repairs']))*rounds_each
    meta = 4*(1+protocol['proposal_repairs'])*rounds_each
    side = rounds_each*((1+2*(1+protocol['proposal_repairs']))*
                        protocol['call_seconds'] +
                        protocol['knowledge_checks_per_round']*protocol['validation_seconds'])
    evaluation = study.paired_evaluation_seconds(protocol, assessment_count)
    review = 2*protocol['call_seconds']
    nominal = 2*side+evaluation+review
    incremental = 2*side+evaluation
    return {'maximum_trials': trials, 'rounds_each': rounds_each,
            'side_reserved_seconds': side, 'evaluation_reserved_seconds': evaluation,
            'existing_review_seconds': review, 'nominal_precheck_seconds_each': nominal,
            'incremental_reserved_seconds_each': incremental,
            'calls_each': calls+2, 'meta_calls_each': meta}


def qualify_profile(profile, *, additional_rounds=None, assessment_count=2,
                    final_count=2, start_round=0):
    """Pure source/accounting qualification; raise on any insufficient cap.

    This checks the complete declared finite horizon, conservative early-review
    opportunities, and all configured optional policy-trial envelopes. It cannot
    guarantee role success, guard availability, correspondence or mathematics.
    """
    additional_rounds = profile['rounds'] if additional_rounds is None else additional_rounds
    protocol = _protocol(profile, additional_rounds, start_round)
    ordinary_groups = reservation_groups(protocol, additional_rounds=additional_rounds,
        assessment_count=assessment_count, final_count=final_count, start_round=start_round)
    conservative_groups = reservation_groups(protocol, additional_rounds=additional_rounds,
        assessment_count=assessment_count, final_count=final_count, start_round=start_round,
        all_review_boundaries=True)
    ordinary = reserve_groups(MemoryLedger(protocol), ordinary_groups)
    ledger = MemoryLedger(protocol, round_index=start_round+additional_rounds)
    conservative = reserve_groups(ledger, conservative_groups)
    optional = policy_trial_envelope(protocol, assessment_count)
    trials = optional['maximum_trials']
    total_seconds = conservative['reserved_seconds'] + trials*optional['incremental_reserved_seconds_each']
    # Any late native precheck still includes its already-protected review cap.
    required_seconds = total_seconds + (optional['existing_review_seconds'] if trials else 0)
    required_calls = conservative['protected_calls'] + trials*optional['calls_each']
    required_meta = conservative['protected_meta_calls'] + trials*optional['meta_calls_each']
    if (protocol['arm_seconds'] < required_seconds or protocol['max_calls'] < required_calls or
            protocol['meta_calls'] < required_meta):
        raise Invalid('complete successor funding or late policy-trial guard is insufficient')
    for index in range(trials):
        if (optional['nominal_precheck_seconds_each'] > ledger.available() or
                optional['calls_each'] > ledger.available_calls() or
                optional['meta_calls_each'] > ledger.available_calls(meta=True)):
            raise Invalid('native policy-trial precheck cannot be fully funded')
        key = 'synthetic-policy-'+str(index)
        ledger.fund(key+'-incumbent', optional['side_reserved_seconds'])
        ledger.fund(key+'-candidate', optional['side_reserved_seconds'])
        ledger.fund(key+'-evaluation', optional['evaluation_reserved_seconds'])
        ledger.fund('review-'+str(start_round+additional_rounds), optional['existing_review_seconds'])
        # Counter-only fixture, NOT role execution: protect later trial guards.
        ledger.s['calls'] += optional['calls_each']
        ledger.s['meta_calls'] += optional['meta_calls_each']
    if ledger.s['seconds'] != total_seconds:
        raise Invalid('native optional reservations disagree with declared bound')
    return {'accepted': True, 'additional_rounds': additional_rounds,
        'start_round': start_round, 'end_round': start_round+additional_rounds,
        'assessment_size': assessment_count, 'final_size': final_count,
        'ordinary_native_reservations': ordinary,
        'conservative_all_review_reservations': conservative,
        'optional_policy_trial': optional,
        'total_reserved_seconds_with_optional_trials': total_seconds,
        'required_cap_including_late_precheck': required_seconds,
        'required_calls': required_calls, 'required_meta_calls': required_meta,
        'supplied_caps': {name: protocol[name] for name in ('arm_seconds','max_calls','meta_calls')},
        'remaining_reserved_time_margin': protocol['arm_seconds']-required_seconds,
        'remaining_call_margin': protocol['max_calls']-required_calls,
        'remaining_meta_margin': protocol['meta_calls']-required_meta,
        'scope': 'Native source/accounting envelopes and synthetic counter debits only; no actual trial, runtime, private panel or mathematical success.'}
