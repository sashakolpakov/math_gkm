"""Bounded conceptual episodes with prospective consequences and checked feedback.

This module schedules mathematical investigation; it neither admits mathematics
nor certifies a research strategy. Explanatory prose is always a conjectural
research report. Only controller-supplied matched checks can support transfer.
Description-length/complexity measurements have no input field here.
"""
import copy
import re

from .study_common import Invalid, canonical, digest

SCHEMA = 'math-gkm.concept-driver.v1'
COMMITMENT_SCHEMA = 'math-gkm.concept-commitment.v1'
DEFAULT = {
    'enabled': False,
    'min_horizon_rounds': 2,
    'max_horizon_rounds': 4,
    'max_ordinary_rounds': 2,
    'case_reassessment_after': 2,
    'max_concepts': 32,
    'max_history': 128,
    'max_text_chars': 2000,
    'projection_feedback_limit': 8,
}
SHA = re.compile(r'[0-9a-f]{64}')
IDENT = re.compile(r'[A-Za-z0-9][A-Za-z0-9_.-]{0,95}')
PLAN_KEYS = {'id', 'explanations', 'selected_explanation', 'mechanism', 'explains',
             'goal_bridge', 'consequences', 'horizon_rounds', 'checkpoints'}

SCHEMAS = {
    'concept_plan': {
        'id': 'fresh immutable identifier',
        'explanations': [{'id': 'identifier', 'claim': 'competing explanation',
                          'discriminator': 'observable distinction',
                          'changes_choice': 'how the distinction changes subsequent work'}],
        'selected_explanation': 'one explanation id',
        'mechanism': 'proposed common mathematical mechanism',
        'explains': ['previously separate fact or obstruction', 'another fact or obstruction'],
        'goal_bridge': {'claim': 'connection to the unchanged original goal',
                        'status': 'conjectural/conditional/proved',
                        'remaining_obligations': ['explicit unresolved correspondence or proof obligation']},
        'consequences': [{'id': 'identifier', 'target': 'prospective target',
                          'structural_difference': 'difference from motivating examples and other targets',
                          'observable_check': 'what would be checked',
                          'changes_choice': 'effect of success, failure or inconclusive evidence'}],
        'horizon_rounds': 'bounded positive integer',
        'checkpoints': [{'after_rounds': 'integer within horizon',
                         'consequence_ids': ['prospective consequence id'],
                         'question': 'observable development checkpoint'}],
    },
    'concept_plan_alternatives': [None, {'continue': 'immutable current episode reference'},
                                  {'ordinary': {'purpose': 'reason for exploitation',
                                                'discriminates': 'what another case would distinguish'}}],
    'concept_report': {
        'episode_reference': 'immutable reference, or null for ordinary work',
        'work_scope': 'mechanism/transfer/ordinary/parameter_case',
        'observations': [{'consequence_id': 'prospectively committed id',
                          'status': 'observed/contradicted/inconclusive',
                          'observation': 'reported observation, never proof certification',
                          'evidence': ['existing artifact reference from separately validated evidence']}],
        'component_ids': ['accepted component id or reported candidate; independently checked elsewhere'],
        'next_question': 'remaining uncertainty',
    },
}

PROMPT_RULES = '''Conceptual investigation: a concept is a proposed common mechanism with competing explanations, an explicit bridge to the unchanged original goal, and prospective consequences beyond its motivating examples. The mechanism and bridge may be conjectural, and must be labeled. Supplying a description or universal quantifiers does not establish conceptual progress. Use request.concept_driver.required_action. A protected episode survives rounds with no admitted theorem; it reserves existing rounds, never extra calls or changed proof gates. Ordinary exploitation may support an active episode. Continue it with concept_plan:{"continue":reference}, or null; a new plan cannot silently replace an unexpired horizon. At a required start, submit the full concept_plan schema. At a required case reassessment, another ordinary case needs concept_plan:{"ordinary":{"purpose":...,"discriminates":...}} or a new concept, explaining what that case distinguishes. No fixed tactic menu is imposed. Record prospective targets before execution. Researcher concept_report observations remain unverified reports; only separately checked mathematics establishes proof and valid matched comparisons can support transfer. A validation cap, malformed comparison, timeout, or missing evidence is inconclusive, never a mathematical refutation. Complexity, compression and description-length measurements are audit-only and have no concept-driver input. Use concept_report:null if no new observation is available; this retains the horizon and records missing evidence. Read the substantive concept_driver.review_feedback, including limitations and unknowns, when selecting the next action.'''


def validate_config(config=None):
    """Optional strict protocol extension; absence preserves historical behavior."""
    if config is None:
        return copy.deepcopy(DEFAULT)
    if not isinstance(config, dict) or set(config) - set(DEFAULT):
        raise Invalid('concept driver config keys/schema mismatch')
    value = {**DEFAULT, **config}
    if type(value['enabled']) is not bool:
        raise Invalid('concept driver enabled must be boolean')
    bounds = {'min_horizon_rounds': (1, 16), 'max_horizon_rounds': (1, 16),
              'max_ordinary_rounds': (0, 16), 'case_reassessment_after': (1, 16),
              'max_concepts': (1, 128), 'max_history': (8, 512),
              'max_text_chars': (128, 8000), 'projection_feedback_limit': (1, 32)}
    for key, (lo, hi) in bounds.items():
        if type(value[key]) is not int or not lo <= value[key] <= hi:
            raise Invalid('concept driver integer bound: '+key)
    if value['min_horizon_rounds'] > value['max_horizon_rounds']:
        raise Invalid('concept horizon bounds reversed')
    if value['projection_feedback_limit'] > value['max_history']:
        raise Invalid('concept feedback projection exceeds retained history')
    return value


def initial(config=None):
    cfg = validate_config(config)
    return {'schema': SCHEMA, 'enabled': cfg['enabled'], 'plans': {}, 'episodes': [],
            'active': None, 'ordinary_rounds': 0, 'consecutive_case_steps': 0,
            'decisions': [], 'review_feedback': [], 'last_report_round': None}


def _checked(state, config):
    cfg = validate_config(config)
    state = initial(cfg) if state is None else state
    if (not isinstance(state, dict) or set(state) != set(initial(cfg)) or
            state.get('schema') != SCHEMA or state.get('enabled') != cfg['enabled']):
        raise Invalid('concept driver state/config schema mismatch')
    for field in ('ordinary_rounds', 'consecutive_case_steps'):
        if type(state[field]) is not int or state[field] < 0:
            raise Invalid('invalid concept round counter')
    if (not isinstance(state['plans'], dict) or len(state['plans']) > cfg['max_concepts'] or
            any(not isinstance(state[k], list) or len(state[k]) > cfg['max_history']
                for k in ('decisions', 'review_feedback')) or
            not isinstance(state['episodes'], list) or len(state['episodes']) > cfg['max_concepts']):
        raise Invalid('concept driver retained state bound')
    if len(canonical(state)) > 8*1024*1024:
        raise Invalid('concept driver state size bound')
    return cfg, copy.deepcopy(state)


def _round(round_index):
    if type(round_index) is not int or not 0 <= round_index < 2**31:
        raise Invalid('invalid concept round')


def _text(value, cfg, field):
    if not isinstance(value, str) or not value.strip() or len(value) > cfg['max_text_chars']:
        raise Invalid('bounded nonempty concept text required: '+field)
    return value


def _id(value, field):
    if not isinstance(value, str) or not IDENT.fullmatch(value):
        raise Invalid('invalid concept identifier: '+field)
    return value


def _list_text(value, cfg, field, *, minimum=0, maximum=16):
    if not isinstance(value, list) or not minimum <= len(value) <= maximum:
        raise Invalid('concept list bound: '+field)
    for text in value:
        _text(text, cfg, field)
    return value


def validate(plan, config=None):
    """Validate prospective form only; narrative content never proves its claims."""
    cfg = validate_config(config)
    if not isinstance(plan, dict) or set(plan) != PLAN_KEYS:
        raise Invalid('concept plan keys/schema mismatch')
    _id(plan['id'], 'plan')
    for field in ('mechanism', 'selected_explanation'):
        _text(plan[field], cfg, field)
    _list_text(plan['explains'], cfg, 'explains', minimum=2, maximum=8)
    explanations = plan['explanations']
    if not isinstance(explanations, list) or not 2 <= len(explanations) <= 8:
        raise Invalid('two to eight competing concept explanations required')
    ids = []
    for explanation in explanations:
        if not isinstance(explanation, dict) or set(explanation) != {'id','claim','discriminator','changes_choice'}:
            raise Invalid('concept explanation schema mismatch')
        ids.append(_id(explanation['id'], 'explanation'))
        for field in ('claim','discriminator','changes_choice'):
            _text(explanation[field], cfg, field)
    if len(set(ids)) != len(ids) or plan['selected_explanation'] not in ids:
        raise Invalid('concept explanation identity mismatch')
    bridge = plan['goal_bridge']
    if not isinstance(bridge, dict) or set(bridge) != {'claim','status','remaining_obligations'}:
        raise Invalid('concept goal bridge schema mismatch')
    _text(bridge['claim'], cfg, 'goal bridge')
    if bridge['status'] not in ('conjectural','conditional','proved'):
        raise Invalid('concept goal bridge status invalid')
    _list_text(bridge['remaining_obligations'], cfg, 'remaining obligations')
    consequences = plan['consequences']
    if not isinstance(consequences, list) or not 2 <= len(consequences) <= 8:
        raise Invalid('two to eight prospective concept consequences required')
    ids = []
    targets = []
    for consequence in consequences:
        if not isinstance(consequence, dict) or set(consequence) != {'id','target','structural_difference','observable_check','changes_choice'}:
            raise Invalid('concept consequence schema mismatch')
        ids.append(_id(consequence['id'], 'consequence'))
        for field in ('target','structural_difference','observable_check','changes_choice'):
            _text(consequence[field], cfg, field)
        targets.append(consequence['target'])
    if len(set(ids)) != len(ids) or len(set(targets)) != len(targets):
        raise Invalid('prospective consequences need distinct ids and targets')
    horizon = plan['horizon_rounds']
    if type(horizon) is not int or not cfg['min_horizon_rounds'] <= horizon <= cfg['max_horizon_rounds']:
        raise Invalid('concept horizon outside committed bounds')
    checkpoints = plan['checkpoints']
    if not isinstance(checkpoints, list) or not 1 <= len(checkpoints) <= 16:
        raise Invalid('concept checkpoint list bound')
    covered = set()
    for checkpoint in checkpoints:
        if not isinstance(checkpoint, dict) or set(checkpoint) != {'after_rounds','consequence_ids','question'}:
            raise Invalid('concept checkpoint schema mismatch')
        at = checkpoint['after_rounds']
        if type(at) is not int or not 1 <= at <= horizon:
            raise Invalid('concept checkpoint beyond horizon')
        _text(checkpoint['question'], cfg, 'checkpoint question')
        selected = checkpoint['consequence_ids']
        if (not isinstance(selected, list) or not 1 <= len(selected) <= len(ids) or
                len(set(selected)) != len(selected) or any(i not in ids for i in selected)):
            raise Invalid('concept checkpoint consequence reference invalid')
        covered.update(selected)
    if covered != set(ids):
        raise Invalid('every prospective consequence needs a checkpoint')
    return copy.deepcopy(plan)


def _active(state, round_index):
    episode = state['active']
    return episode if episode and round_index <= episode['end_round'] else None


def project(state, round_index, config=None, *, round_limit=None):
    """Explicit allowlisted projection; no audit tree or hidden task material."""
    _round(round_index)
    cfg, value = _checked(state, config)
    if not cfg['enabled']:
        return None
    remaining = _remaining(round_index, round_limit)
    episode = _active(value, round_index)
    checkpoints = []
    if episode:
        reported = {item['consequence_id'] for record in episode['observations']
                    for item in record['observations']}
        for index, checkpoint in enumerate(value['plans'][episode['reference']]['checkpoints']):
            checkpoints.append({'index': index, 'due_after_round': episode['start_round']+checkpoint['after_rounds']-1,
                                'question': checkpoint['question'],
                                'missing_reported_consequences': [i for i in checkpoint['consequence_ids'] if i not in reported],
                                'interpretation': 'Reported observations are not independently checked prediction outcomes.'})
    required = ('continue_protected_episode' if episode else
                'final_exploitation_or_review' if remaining is not None and remaining < cfg['min_horizon_rounds'] else
                'start_concept_episode' if value['ordinary_rounds'] >= cfg['max_ordinary_rounds'] else
                'choose_concept_or_exploitation')
    return {'schema': SCHEMA, 'required_action': required,
            'active_episode': copy.deepcopy(episode),
            'committed_plan': copy.deepcopy(value['plans'][episode['reference']]) if episode else None,
            'checkpoints': checkpoints,
            'ordinary_rounds': value['ordinary_rounds'],
            'case_reassessment_required': value['consecutive_case_steps'] >= cfg['case_reassessment_after'],
            'review_feedback': copy.deepcopy(value['review_feedback'][-cfg['projection_feedback_limit']:]),
            'recent_decisions': copy.deepcopy(value['decisions'][-8:]),
            'rounds_remaining': remaining,
            'bounds': {k: cfg[k] for k in ('min_horizon_rounds','max_horizon_rounds','max_ordinary_rounds','case_reassessment_after')},
            'interpretation': 'Reports and bridge labels are unverified; checked transfer is finite-budget evidence, never root completion or causal necessity.'}


def _append(state, key, item, cfg):
    state[key].append(copy.deepcopy(item))
    state[key] = state[key][-cfg['max_history']:]


def commit(state, plan, round_index, config=None, *, round_limit=None):
    """Precommit before execution; returns fresh state and immutable commitment."""
    _round(round_index)
    cfg, value = _checked(state, config)
    if not cfg['enabled']:
        if plan is not None:
            raise Invalid('concept plan submitted while driver disabled')
        return value, None
    remaining = _remaining(round_index, round_limit)
    if remaining == 0:
        raise Invalid('concept commitment beyond campaign round limit')
    before = digest(value)
    episode = _active(value, round_index)
    rationale = None
    if isinstance(plan, dict) and set(plan) == {'ordinary'}:
        rationale = plan['ordinary']
        if not isinstance(rationale, dict) or set(rationale) != {'purpose','discriminates'}:
            raise Invalid('ordinary case reassessment schema mismatch')
        for key in rationale:
            _text(rationale[key], cfg, key)
        plan = None
    if isinstance(plan, dict) and set(plan) == {'continue'}:
        if not episode or plan['continue'] != episode['reference']:
            raise Invalid('unknown or expired concept continuation')
        plan = None
    if plan is not None:
        core = validate(plan, cfg)
        reference = digest(core)
        if episode:
            if reference != episode['reference']:
                raise Invalid('protected concept horizon cannot be replaced')
        else:
            if reference in value['plans'] or any(p['id'] == core['id'] for p in value['plans'].values()):
                raise Invalid('concept identity already committed; use fresh version identity')
            if len(value['plans']) >= cfg['max_concepts']:
                raise Invalid('concept retention bound; preserve records and stop')
            if value['active']:
                old = copy.deepcopy(value['active'])
                old['status'] = 'horizon_elapsed_without_review; evidence_inconclusive'
                value['episodes'].append(old)
            horizon = core['horizon_rounds']
            if remaining is not None and horizon > remaining:
                raise Invalid('concept horizon exceeds remaining campaign rounds')
            episode = {'reference': reference, 'start_round': round_index,
                       'end_round': round_index+horizon-1, 'horizon_rounds': horizon,
                       'status': 'protected; usefulness_unresolved', 'observations': [],
                       'missing_report_rounds': [], 'interim_reviews': []}
            value['plans'][reference] = core
            value['active'] = episode
            value['ordinary_rounds'] = 0
    elif not episode:
        if (value['ordinary_rounds'] >= cfg['max_ordinary_rounds'] and
                (remaining is None or remaining >= cfg['min_horizon_rounds'])):
            raise Invalid('bounded ordinary allowance reached; prospective concept episode required')
        if value['consecutive_case_steps'] >= cfg['case_reassessment_after'] and rationale is None:
            raise Invalid('repeated parameter cases require discriminating reassessment')
        value['ordinary_rounds'] += 1
    mode = 'protected_concept' if episode else 'ordinary_exploitation'
    commitment = {'schema': COMMITMENT_SCHEMA, 'round': round_index, 'mode': mode,
                  'state_binding': before, 'episode_reference': episode['reference'] if episode else None,
                  'start_round': episode['start_round'] if episode else None,
                  'end_round': episode['end_round'] if episode else None,
                  'horizon_rounds': episode['horizon_rounds'] if episode else None,
                  'case_reassessment_required': value['consecutive_case_steps'] >= cfg['case_reassessment_after'],
                  'plan_binding': digest(value['plans'][episode['reference']]) if episode else None,
                  'ordinary_rationale': copy.deepcopy(rationale)}
    _append(value, 'decisions', {'round': round_index, 'mode': mode,
                               'reference': commitment['episode_reference'],
                               'rationale': copy.deepcopy(rationale)}, cfg)
    return value, commitment


def report(state, observation, round_index, config=None, *, commitment=None):
    """Retain reported outcomes; absence or a failed check is not refutation."""
    _round(round_index)
    cfg, value = _checked(state, config)
    if not cfg['enabled']:
        if observation is not None:
            raise Invalid('concept report submitted while driver disabled')
        return value
    if not isinstance(commitment, dict) or set(commitment) != {'schema','round','mode','state_binding','episode_reference','start_round','end_round','horizon_rounds','case_reassessment_required','plan_binding','ordinary_rationale'}:
        raise Invalid('concept report needs exact prospective commitment')
    if commitment['schema'] != COMMITMENT_SCHEMA or commitment['round'] != round_index:
        raise Invalid('concept report round commitment mismatch')
    if value['last_report_round'] is not None and round_index <= value['last_report_round']:
        raise Invalid('concept round report already recorded or out of order')
    episode = _active(value, round_index)
    reference = episode['reference'] if episode else None
    if commitment['episode_reference'] != reference or (episode and
            commitment['plan_binding'] != digest(value['plans'][reference])):
        raise Invalid('concept report altered prospective plan binding')
    if observation is None:
        if episode:
            episode['missing_report_rounds'].append(round_index)
        value['last_report_round'] = round_index
        return value
    if not isinstance(observation, dict) or set(observation) != {'episode_reference','work_scope','observations','component_ids','next_question'}:
        raise Invalid('concept observation keys/schema mismatch')
    if observation['episode_reference'] != reference:
        raise Invalid('concept report unknown episode reference')
    if observation['work_scope'] not in ('mechanism','transfer','ordinary','parameter_case'):
        raise Invalid('invalid concept work scope')
    _text(observation['next_question'], cfg, 'next question')
    _list_text(observation['component_ids'], cfg, 'component ids', maximum=16)
    items = observation['observations']
    if not isinstance(items, list) or len(items) > 16:
        raise Invalid('concept observation list bound')
    ids = {c['id'] for c in value['plans'][reference]['consequences']} if episode else set()
    for item in items:
        if not isinstance(item, dict) or set(item) != {'consequence_id','status','observation','evidence'}:
            raise Invalid('concept observation schema mismatch')
        if item['consequence_id'] not in ids:
            raise Invalid('concept observation not prospectively committed')
        if item['status'] not in ('observed','contradicted','inconclusive'):
            raise Invalid('concept observations cannot certify usefulness or proof')
        _text(item['observation'], cfg, 'reported observation')
        _list_text(item['evidence'], cfg, 'evidence references')
    recorded = {**copy.deepcopy(observation), 'round': round_index,
                'status': 'research_report; not independently verified'}
    if episode:
        episode['observations'].append(recorded)
    if observation['work_scope'] == 'parameter_case':
        if commitment['case_reassessment_required'] and commitment['ordinary_rationale'] is None:
            raise Invalid('further parameter case needs prospective discriminating reassessment')
        value['consecutive_case_steps'] += 1
    elif observation['work_scope'] in ('mechanism','transfer'):
        value['consecutive_case_steps'] = 0
    value['last_report_round'] = round_index
    return value


def _remaining(round_index, round_limit):
    if round_limit is None:
        return None
    if type(round_limit) is not int or not 0 <= round_limit < 2**31 or round_limit < round_index:
        raise Invalid('invalid concept campaign round limit')
    return round_limit-round_index


def _feedback(feedback, cfg):
    from .study_research_feedback import validate_feedback
    # One production builder owns the strict public projection. Never accept a
    # researcher packet as a substitute for its source-bound review evidence.
    validate_feedback(feedback)
    if len(canonical(feedback)) > 256*1024:
        raise Invalid('concept review feedback size bound')
    return copy.deepcopy(feedback)


def finish(state, round_index, feedback, config=None):
    """Ingest the public review diagnosis without shortening protected horizons.

    The caller supplies build_review_feedback's packet, never raw proposer or
    researcher prose. Matched transfer evidence remains a finite-budget result,
    and does not establish causal indispensability or root completion.
    """
    _round(round_index)
    cfg, value = _checked(state, config)
    if not cfg['enabled']:
        return value
    checked = _feedback(feedback, cfg)
    if checked['round'] != round_index:
        raise Invalid('concept review feedback round mismatch')
    for existing in value['review_feedback']:
        if existing['round'] == round_index:
            if existing['reference'] != checked['reference']:
                raise Invalid('concept review identity cannot change')
            return value
    comparison = checked['episode_transfer']
    valid = comparison['assessment'] == 'valid_finite_budget_evidence'
    supported = bool(valid and comparison['eligible'] and
                     comparison['checked_component_transfer'] is not None and
                     comparison['checked_component_transfer'] > 0 and
                     comparison['regressions'] == 0)
    episode = value['active']
    context = checked['comparison_context']
    aligned = bool(episode and context and context['kind'] == 'concept_episode_package'
                   and context['concept_reference'] == episode['reference']
                   and context['start_round'] == episode['start_round']
                   and context['end_round'] == episode['end_round']+1
                   and context['complete'] and round_index > episode['end_round'])
    evidence_status = ('checked_concept_package_transfer; finite_budget_only; causality_unproved' if aligned and supported else
                       'valid_concept_package_comparison; transfer_not_demonstrated' if aligned and valid else
                       'general_library_transfer_only; inconclusive_for_concept' if supported else
                       'general_library_comparison_only; inconclusive_for_concept' if valid else
                       'inconclusive; invalid_missing_or_limited_comparison')
    packet = {**checked, 'evidence_status': evidence_status,
              'certification': 'review diagnosis is reported; no mathematical refutation, root proof or certified strategy switch'}
    _append(value, 'review_feedback', packet, cfg)
    if episode:
        if round_index <= episode['end_round']:
            episode['interim_reviews'].append({'round': round_index, 'feedback_binding': checked['reference']})
        else:
            closed = copy.deepcopy(episode)
            closed['status'] = 'reviewed; '+evidence_status
            closed['review_binding'] = checked['reference']
            value['episodes'].append(closed)
            value['active'] = None
    return value
