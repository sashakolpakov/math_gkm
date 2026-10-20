"""Bounded mathematical review feedback, separate from private assessments.

A reviewer who has seen private obligations cannot return free text to research.
The caller must create a fresh own-source-only review with the packet constructor
below. Only that review's artifact-bound diagnosis can be returned verbatim.
Private comparison records have a separate, strictly aggregate projection.
This module does not inspect files, certify mathematics, set hypothesis statuses,
rank concepts, or consume audit-only complexity observations.
"""
import copy
import math
import re

from .study_common import Invalid, digest

SCHEMA = 'math-gkm.research-feedback.v1'
OWN_REVIEW_SCOPE = 'own_sources_only'
HISTORY_LIMIT = 8
CONSUMPTION_LIMIT = 32
FINDINGS_LIMIT = 16
TEXT_LIMIT = 2400
_SHA = re.compile(r'[0-9a-f]{64}\Z')

INTERPRETATION = (
    'Source diagnosis is a fallible interpretation of own artifacts, not mathematical '
    'admission or a proof of hypothesis truth. Only existing checked receipts authorize '
    'theorem claims. Aggregate transfer is finite-budget evidence, not generality or '
    'causal indispensability. Operational or receipt failures are inconclusive. '
    'No complexity or theorem-count reward is computed. Retain competing explanations '
    'and distinguish unsupported from refuted by explicit checked evidence.')


def _text(value, limit=TEXT_LIMIT):
    if not isinstance(value, str):
        return None
    return value if len(value) <= limit else value[:limit] + ' [bounded]'


def _number(value):
    if type(value) not in (int, float) or value < 0:
        return None
    try:
        return value if math.isfinite(value) else None
    except OverflowError:
        return None


def _boolean(value):
    return value if type(value) is bool else None


def own_source_review_records(records):
    """New review input; never use a legacy reviewer exposed to comparisons.

    The included registries and receipts must be research-owned state. A caller
    must also provide only the own-source workspace, not evaluator workspaces.
    Registry source paths identify own mathematical artifacts, not heldout tasks.
    No comparisons/evaluations, adapter messages, earlier reviewer outputs, suite
    bindings, private branches or arbitrary extra keys are copied.
    """
    if not isinstance(records, dict):
        raise Invalid('own-source review input must be an object')
    result = {'schema': SCHEMA, 'review_scope': OWN_REVIEW_SCOPE,
              'interpretation': INTERPRETATION}
    for key in ('round', 'decisions', 'knowledge', 'components',
                'remaining_obligations', 'formal_obligations',
                'portfolio', 'episode', 'findings', 'agenda', 'concepts'):
        if key in records:
            result[key] = copy.deepcopy(records[key])
    result['receipts'] = [copy.deepcopy(item) for item in records.get('receipts', [])
                          if isinstance(item, dict) and
                          item.get('role') in ('proposer', 'researcher')]
    return result


def _measured_costs(value):
    """Only controller-produced elapsed aggregates; never private cost prose."""
    value = value if isinstance(value, dict) else {}
    fields = ('adapter_seconds', 'validation_seconds', 'context_validation_seconds')
    return {side: {key: _number(value.get(side, {}).get(key))
                   if isinstance(value.get(side), dict) else None for key in fields}
            for side in ('before', 'after')}


def comparison_feedback(result):
    """Return numeric/boolean aggregate evidence, never task IDs or free text.

    A valid pair can report zero gains; a failed/missing pair cannot. Counts are
    sizes of controller-produced sets, not a reward and not theorem counts.
    The function deliberately does not traverse sides, catalogs, check results,
    private solutions or task statements. Unknown schema is inconclusive.
    """
    unavailable = {'assessment': 'inconclusive', 'reason': 'missing_comparison',
                   'gains': None, 'checked_component_transfer': None,
                   'regressions': None, 'eligible': False, 'measured_costs': _measured_costs(None)}
    if not isinstance(result, dict):
        return unavailable
    unavailable['measured_costs'] = _measured_costs(result.get('measured_costs'))
    # A policy-continuation comparison wraps the frozen pair. Outer failures
    # must not be erased by a successfully nested mathematical comparison.
    if 'comparison' in result:
        nested = comparison_feedback(result.get('comparison'))
        if result.get('eligible') is not True:
            nested.update(assessment='inconclusive', reason='invalid_policy_comparison',
                          eligible=False, gains=None,
                          checked_component_transfer=None, regressions=None)
        return nested
    status = result.get('status')
    reasons = {
        'invalid_frozen_context': 'invalid_frozen_context',
        'invalid_comparison_or_capability_regression': 'invalid_or_capability_regression',
        'no_independent_holdout; transfer_not_demonstrated': 'no_independent_holdout',
    }
    if status != 'valid_finite_budget_comparison':
        return {**unavailable, 'reason': reasons.get(status, 'invalid_or_unknown_comparison')}
    count_fields = ('task_gains', 'transfer', 'regressions')
    if any(not isinstance(result.get(k), list) for k in count_fields):
        return {**unavailable, 'reason': 'incomplete_comparison'}
    if (type(result.get('eligible')) is not bool or
            result.get('all_frozen_declarations_retained') is not True):
        return {**unavailable, 'reason': 'incomplete_or_unretained_comparison'}
    binding = result.get('binding')
    budgets = {}
    if isinstance(binding, dict):
        for field in ('adaptation_seconds_each', 'validation_seconds_each_task'):
            value = _number(binding.get(field))
            if value is not None:
                budgets[field] = value
    return {'assessment': 'valid_finite_budget_evidence', 'reason': 'checked_matched_comparison',
            'gains': len(result['task_gains']),
            'checked_component_transfer': len(result['transfer']),
            'regressions': len(result['regressions']),
            'eligible': result['eligible'], 'all_frozen_declarations_retained': True,
            'budget_caps_seconds': budgets,
            'measured_costs': _measured_costs(result.get('measured_costs')),
            'cost_interpretation': 'Caps are not elapsed costs; development costs are separate.',
            'causal_interpretation': 'Checked dependency use does not establish indispensability.'}


def _comparison_context(value):
    """Own controller provenance for the compared research interval [start,end).

    This describes a whole library change, not causal attribution to one concept
    or success on a particular prospective consequence. It contains no suite or
    task identifiers, target statements, answer paths or private annotations.
    """
    if value is None:
        return None
    fields = {'kind', 'concept_reference', 'start_round', 'end_round', 'complete'}
    if (not isinstance(value, dict) or set(value) != fields or
            value.get('kind') not in ('ordinary_episode', 'concept_episode_package') or
            type(value.get('start_round')) is not int or value['start_round'] < 0 or
            type(value.get('end_round')) is not int or value['end_round'] < value['start_round'] or
            type(value.get('complete')) is not bool):
        raise Invalid('invalid own comparison interval context')
    reference = value['concept_reference']
    if value['kind'] == 'ordinary_episode':
        if reference is not None:
            raise Invalid('ordinary comparison cannot identify a selected concept')
    elif not isinstance(reference, str) or not _SHA.fullmatch(reference):
        raise Invalid('concept comparison needs immutable own concept reference')
    return copy.deepcopy(value)


def build_review_feedback(round_index, review_receipt, artifact_refs_valid, *,
                          reviewer_scope='untrusted_or_legacy',
                          episode_transfer=None, policy_comparison=None, comparison_context=None,
                          development_role_seconds=None):
    """Project an own-source review plus separately sanitized transfer evidence.

    ``reviewer_scope`` is controller provenance, not a field trusted from model
    output. A legacy private-assessment reviewer is never forwarded, even with
    valid citations. ``artifact_refs_valid`` is produced by checked_findings.
    """
    if type(round_index) is not int or round_index < 0:
        raise Invalid('feedback round must be a nonnegative integer')
    receipt = review_receipt if isinstance(review_receipt, dict) else {}
    payload = receipt.get('payload')
    trusted_scope = reviewer_scope == OWN_REVIEW_SCOPE
    completed = receipt.get('outcome') == 'completed'
    valid = (trusted_scope and completed and artifact_refs_valid is True and
             isinstance(payload, dict))
    status = ('artifact_bound_source_assessment' if valid else
              'unavailable_private_or_legacy_scope' if not trusted_scope else
              'unavailable_incomplete_review' if not completed else
              'unavailable_invalid_artifact_references')
    diagnosis = {'status': status, 'authority': 'interpretation_only',
                 'findings': [], 'truncated': False}
    if valid:
        for name in ('correctness', 'scope', 'transfer', 'costs', 'recommendation'):
            text = _text(payload.get(name))
            if text is not None:
                diagnosis[name] = text
        findings = payload.get('findings', [])
        if not isinstance(findings, list):
            findings = []
        for finding in findings[:FINDINGS_LIMIT]:
            if not isinstance(finding, dict):
                continue
            path = finding.get('path')
            hashed = finding.get('sha256')
            text = _text(finding.get('finding'))
            # Paths below are source-only own-artifact references. Refuse unsafe
            # spellings even though the caller has already bound their hashes.
            if (not isinstance(path, str) or len(path) > 512 or path.startswith('/') or
                    any(part in ('', '.', '..') for part in path.split('/')) or
                    not isinstance(hashed, str) or not _SHA.fullmatch(hashed) or
                    text is None):
                continue
            diagnosis['findings'].append({'path': path, 'sha256': hashed, 'finding': text})
        diagnosis['truncated'] = len(findings) > FINDINGS_LIMIT or any(
            isinstance(payload.get(name), str) and len(payload[name]) > TEXT_LIMIT
            for name in ('correctness', 'scope', 'transfer', 'costs', 'recommendation'))
    elapsed = _number(receipt.get('elapsed_seconds'))
    packet = {'schema': SCHEMA, 'round': round_index,
              'source_review': diagnosis,
              'episode_transfer': comparison_feedback(episode_transfer),
              'policy_comparison': comparison_feedback(policy_comparison),
              'comparison_context': _comparison_context(comparison_context),
              'development_costs': {'role_seconds': _number(development_role_seconds),
                  'interpretation': 'Sum of own-main proposer/researcher elapsed seconds over the compared interval; excludes overlapping controller wall.'},
              'review_elapsed_seconds': elapsed,
              'mathematical_admission_changed': False,
              'hypothesis_statuses_changed': False,
              'interpretation': INTERPRETATION}
    packet['reference'] = digest(packet)
    _validate_packet(packet)
    return packet


def _validate_packet(packet):
    required = {'schema', 'round', 'source_review', 'episode_transfer',
                'policy_comparison', 'comparison_context', 'development_costs', 'review_elapsed_seconds',
                'mathematical_admission_changed', 'hypothesis_statuses_changed',
                'interpretation', 'reference'}
    if (not isinstance(packet, dict) or set(packet) != required or
            packet.get('schema') != SCHEMA or
            type(packet.get('round')) is not int or packet['round'] < 0 or
            packet.get('reference') != digest({k: v for k, v in packet.items() if k != 'reference'}) or
            packet['mathematical_admission_changed'] is not False or
            packet['hypothesis_statuses_changed'] is not False or
            packet['interpretation'] != INTERPRETATION or
            (packet['review_elapsed_seconds'] is not None and
             _number(packet['review_elapsed_seconds']) is None)):
        raise Invalid('invalid research feedback packet')
    development = packet['development_costs']
    if (not isinstance(development, dict) or set(development) != {'role_seconds', 'interpretation'} or
            (development['role_seconds'] is not None and _number(development['role_seconds']) is None) or
            development['interpretation'] != 'Sum of own-main proposer/researcher elapsed seconds over the compared interval; excludes overlapping controller wall.'):
        raise Invalid('invalid measured development costs')
    context = _comparison_context(packet['comparison_context'])
    if context is not None and context['end_round'] > packet['round']:
        raise Invalid('comparison context extends beyond reviewed research')
    diagnosis = packet['source_review']
    base = {'status', 'authority', 'findings', 'truncated'}
    prose = {'correctness', 'scope', 'transfer', 'costs', 'recommendation'}
    statuses = {'artifact_bound_source_assessment', 'unavailable_private_or_legacy_scope',
                'unavailable_incomplete_review', 'unavailable_invalid_artifact_references'}
    if (not isinstance(diagnosis, dict) or not base <= set(diagnosis) or
            not set(diagnosis) <= base | prose or diagnosis.get('status') not in statuses or
            diagnosis.get('authority') != 'interpretation_only' or
            type(diagnosis.get('truncated')) is not bool or
            not isinstance(diagnosis.get('findings'), list) or
            len(diagnosis['findings']) > FINDINGS_LIMIT or
            any(not isinstance(diagnosis[k], str) or len(diagnosis[k]) > TEXT_LIMIT + 10
                for k in prose & set(diagnosis))):
        raise Invalid('invalid source feedback diagnosis')
    if diagnosis['status'] != 'artifact_bound_source_assessment' and (
            diagnosis['findings'] or set(diagnosis) != base):
        raise Invalid('unavailable source review cannot carry diagnosis')
    for finding in diagnosis['findings']:
        if (not isinstance(finding, dict) or set(finding) != {'path', 'sha256', 'finding'} or
                not isinstance(finding['path'], str) or len(finding['path']) > 512 or
                finding['path'].startswith('/') or
                any(p in ('', '.', '..') for p in finding['path'].split('/')) or
                not isinstance(finding['sha256'], str) or not _SHA.fullmatch(finding['sha256']) or
                not isinstance(finding['finding'], str) or len(finding['finding']) > TEXT_LIMIT + 10):
            raise Invalid('invalid source feedback finding')
    for key in ('episode_transfer', 'policy_comparison'):
        value = packet[key]
        base = {'assessment', 'reason', 'gains', 'checked_component_transfer', 'regressions', 'eligible', 'measured_costs'}
        valid = base | {'all_frozen_declarations_retained', 'budget_caps_seconds',
                        'cost_interpretation', 'causal_interpretation'}
        if not isinstance(value, dict) or type(value.get('eligible')) is not bool:
            raise Invalid('invalid aggregate comparison feedback')
        measured = value.get('measured_costs')
        cost_fields = {'adapter_seconds', 'validation_seconds', 'context_validation_seconds'}
        if (not isinstance(measured, dict) or set(measured) != {'before', 'after'} or
                any(not isinstance(measured[side], dict) or set(measured[side]) != cost_fields or
                    any(v is not None and _number(v) is None for v in measured[side].values())
                    for side in ('before', 'after'))):
            raise Invalid('invalid measured comparison costs')
        if value.get('assessment') == 'inconclusive':
            reasons = {'missing_comparison', 'invalid_policy_comparison', 'invalid_frozen_context',
                       'invalid_or_capability_regression', 'no_independent_holdout',
                       'invalid_or_unknown_comparison', 'incomplete_comparison',
                       'incomplete_or_unretained_comparison'}
            if (set(value) != base or value['reason'] not in reasons or value['eligible'] or
                    any(value[k] is not None for k in ('gains', 'checked_component_transfer', 'regressions'))):
                raise Invalid('inconclusive comparison cannot report gains or private details')
        elif value.get('assessment') == 'valid_finite_budget_evidence':
            if (set(value) != valid or value['reason'] != 'checked_matched_comparison' or
                    value['all_frozen_declarations_retained'] is not True or
                    any(type(value[k]) is not int or value[k] < 0
                        for k in ('gains', 'checked_component_transfer', 'regressions')) or
                    not isinstance(value['budget_caps_seconds'], dict) or
                    not set(value['budget_caps_seconds']) <=
                        {'adaptation_seconds_each', 'validation_seconds_each_task'} or
                    any(_number(v) is None for v in value['budget_caps_seconds'].values()) or
                    value['cost_interpretation'] != 'Caps are not elapsed costs; development costs are separate.' or
                    value['causal_interpretation'] != 'Checked dependency use does not establish indispensability.'):
                raise Invalid('invalid finite-budget comparison evidence')
        else:
            raise Invalid('unknown comparison feedback assessment')


def validate_feedback(packet):
    """Validate the complete bounded research-facing schema without modifying it."""
    _validate_packet(packet)
    return copy.deepcopy(packet)


def append_review_feedback(state, packet):
    """Idempotent durable append; caller persists owning research state normally."""
    _validate_packet(packet)
    history = state.setdefault('review_feedback', [])
    for previous in history:
        _validate_packet(previous)
        if previous['round'] == packet['round']:
            if previous != packet:
                raise Invalid('feedback for completed review changed')
            return copy.deepcopy(previous)
    if history and packet['round'] < history[-1]['round']:
        raise Invalid('research feedback rounds must be monotone')
    history.append(copy.deepcopy(packet))
    state['review_feedback'] = history[-HISTORY_LIMIT:]
    return copy.deepcopy(packet)


def request_feedback(state):
    """Read-only projection for every subsequent proposer/researcher request."""
    history = state.get('review_feedback', [])[-HISTORY_LIMIT:]
    for packet in history:
        _validate_packet(packet)
    return {'schema': SCHEMA, 'history': copy.deepcopy(history),
            'latest': copy.deepcopy(history[-1]) if history else None,
            'interpretation': INTERPRETATION}


def record_feedback_consumption(state, request_id, round_index, role, packet_hashes):
    """Record which persisted reviews entered an actual logical role request.

    This records delivery, not evidence the model understood or used a review.
    Call after request construction and before/with durable invocation intent.
    """
    if (not isinstance(request_id, str) or not request_id or len(request_id) > 256 or
            type(round_index) is not int or round_index < 0 or
            role not in ('proposer', 'researcher') or not isinstance(packet_hashes, list)):
        raise Invalid('invalid research feedback delivery')
    known = {p['reference'] for p in state.get('review_feedback', [])}
    if any(not isinstance(h, str) or h not in known for h in packet_hashes):
        raise Invalid('feedback delivery references unpersisted review')
    item = {'request_id': request_id, 'round': round_index, 'role': role,
            'references': list(dict.fromkeys(packet_hashes)), 'meaning': 'delivered_not_proven_used'}
    deliveries = state.setdefault('review_feedback_deliveries', [])
    for previous in deliveries:
        if previous['request_id'] == request_id:
            if previous != item:
                raise Invalid('logical request feedback changed')
            return copy.deepcopy(previous)
    deliveries.append(item)
    state['review_feedback_deliveries'] = deliveries[-CONSUMPTION_LIMIT:]
    return copy.deepcopy(item)
