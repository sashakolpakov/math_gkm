"""Audit-files-only partial-history seal. No project reads or mathematical computation."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys

T = Path('/private/tmp/math_gkm_godel_20261013')
PRE = 'markov_worker_000156_'

def read(s):
    return json.loads((T / (PRE + s)).read_text())

def pin(p):
    p = Path(p)
    assert p.is_relative_to(T)
    b = p.read_bytes()
    return {'path': str(p), 'bytes': len(b), 'sha256': hashlib.sha256(b).hexdigest()}

v = read('validation_evidence.json')
m = read('replay_method_evidence.json')
h = read('mathematical_source_hashes.json')
s = read('source_structure_audit.json')
f = read('finite_domain_audit.json')
assert all(d['worker'] == 156 for d in [v, m, h, s, f])
assert h['compiled_counts'] == s['compiled_counts'] == m['coverage']['compiled_final_counts'] == {'theorem': 44, 'def': 16}
assert h['replayed_counts'] == s['replayed_counts'] == m['coverage']['successful_target_counts'] == {'theorem': 30, 'def': 9}
assert h['fully_accepted_counts'] == s['fully_accepted_counts'] == {}
assert h['printed_theorem_closures'] == s['printed_theorem_closures'] == 0
assert len(h['new_sources']) == len(s['new_modules']) == 12
assert len(h['named_older_comparisons']) == 222
assert len(h['compiled_only_modules']) == 5
assert h['unbuilt_modules'] == [] and h['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] is True
assert h['residual_binding']['both_main_residual_conjuncts_unproved'] is True
assert h['residual_binding']['all_shape_premises_unproved'] is True
assert all(x is True or x is None or x == [] for x in v['checks'].values())
c = v['counts']
for k, n in {
    'accepted_math': 0, 'accepted_theorems': 0, 'accepted_definitions': 0,
    'compiled_math': 12, 'compiled_theorems': 44, 'compiled_definitions': 16,
    'unbuilt_math': 0, 'build_attempts': 22, 'successful_build_attempts': 13,
    'rejected_builds': 9, 'build_timeouts': 2, 'replay_attempts': 2,
    'replay_timeouts': 1, 'successful_replays': 1, 'successful_selected_distinct': 7,
    'distinct_printed_closures': 0, 'print_rows': 0, 'indexed': 0,
    'archive_artifacts': 98, 'controller_artifacts': 98, 'initial_entries': 6531,
    'preserved_prior': 6531, 'validation_entries': 0
}.items():
    assert c[k] == n, (k, c[k])
assert c['build_returncodes'] == {'0': 13, '1': 7, 'None': 2}
assert c['replay_returncodes'] == {'0': 1, 'None': 1}
assert v['controller']['outcome'] == 'timeout'
assert v['controller']['returncode'] == 0 and v['controller']['report'] is None
assert v['controller']['mathematical_resolution'] is False
assert v['raw_validation_present'] is v['raw_index_present'] is False
assert v['finalizer_static_scope']['invocations'] == []
assert [r['line'] for r in v['finalizer_events']] == [174, 175]
assert m['retained_finalization']['actual_finalizer_invocations'] == []
assert m['retained_finalization']['turn_completed'] is False
assert m['worker121_inherited_boundary']['current_recovery_count'] == 0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count'] == 212
assert m['import_scope']['successful_replay_base_count'] == 2508
assert m['import_scope']['final_requested_replay_base_count'] == 2509
assert m['import_scope']['all_math_source_closure'] == 2521
assert m['printed_closure_summary']['unique'] == 0
assert m['printed_closure_summary']['requested'] == 44
assert m['printed_closure_summary']['axiom_json_count'] == 0
assert v['late_scope_observation']['late_preservation_needed'] is False
assert v['final_static_stability']['changed'] == []
assert m['final_static_input_stability']['all_unchanged'] is True
assert f['low_probe']['counts'] == {
    'source_comparisons': 5120, 'lower_comparisons': 20600, 'lower_triples': 9900,
    'all_column4_triples': 31200, 'outside_expression_positions': 800}
assert f['ad_hoc_boundary']['positions'] == 451
assert f['row_probe']['counts'] == {
    'solve_positions': 20550, 'factorization_rows': 460, 'division_steps': 12550,
    'residual_coefficient_positions': 3540, 'adjacent_triple_positions': 2660,
    'printed_sample_rows': 32}
assert f['naive_shape']['per_component'] == 19360 and f['naive_shape']['total'] == 58080
assert f['alternate_shape']['counts'] == {
    'unfiltered_base_points': 13750, 'nonnegative_test_positions': 6600,
    'column_lc': 6600, 'minor': 6050, 'row_lc': 5503}
assert f['first_tail']['coefficient_positions'] == 1200
assert f['first_tail']['crossing_triples'] == 400
assert f['domain_certificate']['count'] == 20
assert f['domain_certificate']['final_generated_block_matches_literal_template'] is True
assert len(m['superseded_successful_versions']) == 1
old = m['superseded_successful_versions'][0]
assert old['full_text_equal_ignoring_whitespace'] is True
assert old['old_object_hash_retained'] is False
assert old['old_source_selected_by_successful_replay'] is False

rechecks = {}
for label, inputs in [('validation', v['input_hashes']), ('method', m['static_input_sha256'])]:
    rows = []
    for p, expected in inputs.items():
        if p.startswith(str(T) + '/'):
            row = pin(p)
            assert row['sha256'] == expected, p
            rows.append(row)
    rechecks[label] = rows

suffixes = ['monitoring_audit.md', 'mathematical_source_hashes.json',
            'source_structure_audit.json', 'finite_domain_audit.json',
            'validation_audit.md', 'validation_evidence.json',
            'replay_method.md', 'replay_method_evidence.json']
files = [pin(T / (PRE + x)) for x in suffixes]
assert len(sys.argv) == 2 and files[0]['sha256'] == sys.argv[1]
main = (T / (PRE + 'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main
assert 'No Audit object or axiom JSON is produced or retained' not in main
assert 'TIMEOUT' in main and 'Both remaining predicates are unproved.' in main

def compact_endpoint(r):
    wanted = ['current_count', 'current_counts', 'inherited_count', 'local_nodes',
              'current_replayed_count', 'current_compiled_only_count']
    out = {k: r[k] for k in wanted if k in r}
    for k in ['old121_195', 'old121_212', 'old121_accepted']:
        if k in r:
            out[k + '_count'] = len(r[k])
    out['current_replayed_count'] = len(r['successfully_replayed_modules'])
    out['current_compiled_only_count'] = len(r['compiled_only_modules'])
    return out

endpoints = {name: compact_endpoint(r) for name, r in m['endpoint_import_boundaries'].items()}
assert len(endpoints) == 12
assert all(r['old121_212_count'] == 212 for r in endpoints.values())
controller_fields = ['request_id', 'outcome', 'returncode', 'report', 'mathematical_resolution',
                     'elapsed_seconds', 'started', 'finished']
finite = {k: {kk: vv for kk, vv in f[k].items() if kk not in ['domains', 'saved_record', 'literal_rows']}
          for k in ['low_probe', 'ad_hoc_boundary', 'row_probe', 'naive_shape',
                    'alternate_shape', 'first_tail', 'domain_certificate']}
out = {
    'worker': 156, 'request': 'e9cdd527ea604fdcb514caecc8cc9944',
    'sealed_at_utc': datetime.now(timezone.utc).isoformat(),
    'scope': 'Independent static archive-first audit of closed partial156. Final crossreview and seal read audit files only. No project/proof/checker/replay/experiment/generator/finalizer execution, mathematical-value recomputation, source edits or research assistance. Active157 excluded. Earlier seals and timeout histories unchanged.',
    'files': files, 'consistency': c,
    'historical_outcome': {k: v['controller'][k] for k in controller_fields},
    'controller_times': v['controller_times'], 'timing': v['timing'],
    'mathematical_scope': {k: x for k, x in s.items()
                           if k not in ['worker', 'request', 'created_at_utc', 'new_modules', 'scope']},
    'residual_binding': h['residual_binding'],
    'partial_validation_partition': v['partial_validation_partition'],
    'count_qualification': 'Twelve final mathematical modules locally compiled,44 theorems/16 definitions. Seven matching final modules replayed,30 theorems/9 definitions; five compiled-only,14 theorems/7 definitions. Zero retained theorem prints or fully validated modules.22 compiler attempts=13 successes(12 final math+1 superseded success)+7 return1+2 timeout. Two replay attempts=one early success+one final timeout. No finalization or delivered report.98 unindexed controller/archive artifacts.',
    'finite_domain_counts_and_qualifications': finite,
    'finite_runtime_limits': f['runtime_limits'], 'finite_event_bindings': f['event_bindings'],
    'mathematical_values_recomputed': False,
    'inherited_boundary': {
        'scope': m['import_scope'], 'pair_observation': v['dependency_hash_observation'],
        'endpoints': endpoints, 'pair_count': 2509,
        'old121': m['worker121_inherited_boundary'], 'worker153': m['prior153_pending_boundary'],
        'named_older_comparisons': 222, 'named_older_imported': 154, 'named_older_comparison_only': 68,
        'window_history': m['named_older_window_boundary'],
        'corrected_versions': m['inherited_corrected_versions_scope'], 'external_pairs': 9,
        'qualification': 'Compiled imports retain historical qualifications; no fresh source build or replay of inherited bodies. Zero old212 recovery.'},
    'method_limits': m['method_limits'], 'printed_closures': m['printed_closure_summary'],
    'replay_stages': m['versioned_replay_audit_bindings'],
    'failed_attempts': [{k: r[k] for k in ['path', 'sha256', 'snapshot_sha256', 'modules',
                                        'returncode', 'seconds', 'timeout', 'start_utc', 'end_estimate_utc']}
                        for r in v['rejections']],
    'superseded_success': old, 'uniform_version_boundary': m['uniform_version_boundary'],
    'retained_finalization': m['retained_finalization'],
    'finalizer_static_predicate': m['finalizer_static_predicate'],
    'preservation': {'initial_snapshot': v['initial_preservation_split'],
                     'archive_controller_artifacts': 98, 'indexed': 0,
                     'raw_validation_present': False, 'checks': v['checks'],
                     'prior_reconciliation': v['prior_reconciliation_binding'],
                     'prior134_late_failure': m['historical134_late_failed_audit']},
    'deadline_qualification': 'TIMEOUT/return0/nullreport/no turn.completed. Final Audit and12-module replay timed out approximately30 seconds before nominal deadline; host finished71.509570 seconds after it. Both inner failures are completed records, not still-running jobs. No finalizer invocation or report draft is retained. No cause of host delay or shutdown actor is inferred.',
    'final_observations': {'validation': v['final_static_stability'],
                           'method': m['final_static_input_stability'],
                           'late_scope': v['late_scope_observation'],
                           'initial_absences': v['absence_observations'],
                           'final_absences': v['final_absence_observation'],
                           'project_reads_closed': True, 'seal_extends_project_observation': False},
    'crossreview': {
        'validation_reviewer': '/root/monitoring_audit/sealed136_review',
        'method_reviewer': '/root/monitoring_audit/sealed136_review/method138',
        'both_final_audit_files_only_reviews_received': True,
        'necessary_corrections_remaining': [],
        'shared_fields': len(v['method_crosscheck']),
        'inherited_pairs': v['method_pair_crosscheck'],
        'shared_input_hashes': v['method_shared_input_crosscheck'],
        'temporary_input_rechecks': rechecks,
        'wording_refinements_applied_before_seal': [
            'Retained Audit-object/JSON absence distinguished from unobservable transient process state.',
            'Finalizer invocation is absent while the reviewed finalizer script is retained.',
            'Seven replayed final modules distinguished from five compiled-only and zero printed closures.',
            'Strict lower-column source theorem bounded by j+2<=q; crossing and all shape premises remain open.',
            'Unbounded gain relative to immediate residual does not imply exclusion from every older criterion.',
            'Naive minor uses four entries across three sources; finite a<0 filter is not strict positivity.',
            '6531 actual snapshot checks distinguished from6530 planned unexecuted finalizer count.',
            'Old212,WindowLC,old153 and all preceding seals retain historical limits.']},
    'inherited_pair_map': pin(T / (PRE + 'inherited_pair_expectations.json')),
    'auditor_helper': pin(T / 'static_audit_worker156.py'),
    'seal_helper': pin(T / 'seal_worker156_audit.py'),
    'additional_late_project_bundle_required': False
}
p = T / (PRE + 'integrity.json')
assert not p.exists(), 'Never overwrite a prior seal'
p.write_text(json.dumps(out, indent=2, sort_keys=True) + '\n')
print(json.dumps({'main': files[0], 'integrity': pin(p), 'sealed_at_utc': out['sealed_at_utc'],
                  'temporary_rechecks': {k: len(x) for k, x in rechecks.items()}}, indent=2))
