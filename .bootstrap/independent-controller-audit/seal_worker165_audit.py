"""Closed165 final audit-files-only consistency seal; no project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys

T = Path('/private/tmp/math_gkm_godel_20261013')
PRE = 'markov_worker_000165_'
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
pairs = read('inherited_pair_expectations.json')
late_metadata = read('late_cache_bundle.json')
late_observation = read('unarchived_cache_observation.json')
assert all(d['worker'] == 165 for d in [v, m, h, s, f])
accepted = {'theorem': 180, 'def': 116, 'instance': 1}
assert h['accepted_counts'] == s['accepted_counts'] == m['coverage']['successful_target_counts'] == accepted
assert len(h['new_sources']) == len(s['new_modules']) == 31
assert h['excluded_counts'] == s['excluded_counts'] == {'theorem': 281, 'def': 135}
assert len(h['excluded_modules']) == len(s['excluded_modules']) == 91
assert len(h['named_older_comparisons']) == 332 and h['all_named_new_match_current'] is True
assert len(h['historical_pending_comparisons']) == 35
assert h['excluded_group_counts'] == {
    'compiled_only_excluded': {'theorem': 3, 'def': 2},
    'timed_out_excluded': {'theorem': 56, 'def': 28},
    'rejected_only_excluded': {'theorem': 1, 'def': 1},
    'unattempted_excluded': {'theorem': 221, 'def': 104}}
expected_partition = {'selected': (31, 180, 116, 1), 'compiled_only': (2, 3, 2, 0),
    'timeout_only': (8, 56, 28, 0), 'rejected_only': (1, 1, 1, 0), 'unbuilt': (80, 221, 104, 0)}
for name, (n, th, de, inst) in expected_partition.items():
    part = m['coverage_partition'][name]
    assert part['module_count'] == len(part['modules']) == n
    expected = {'theorem': th, 'def': de}
    if inst:
        expected['instance'] = inst
    assert part['counts'] == expected
    assert all(part[k] == (name == 'selected') for k in ['full_validation', 'printed', 'replayed'])
assert m['coverage']['pending_counts'] == {'theorem': 278, 'def': 133}
assert len(m['coverage']['pending_math_drafts']) == 89
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
r = h['residual_binding']
for k in ['root_open', 'all_three_residual_conjuncts_unproved', 'ReducedPairPositive_unproved',
          'ParametricPairPositive_unproved', 'RationalPairStep_unproved',
          'new_general_dense_evaluator_and_Boolean_soundness', 'full_products_unvalidated',
          'signed_aggregate_and_sign_test_unvalidated', 'LowerClosed_source_and_root_candidates_unvalidated',
          'actual_source_auxiliary_mixed_gap_obstruction_proved']:
    assert r[k] is True, k
assert r['new_raw_LC_region'] is r['actual_raw_source_counterexample'] is False
for k, x in v['checks'].items():
    if k in ['method_independent_validation_agrees', 'selected_receipts_match']:
        assert x is True, (k, x)
    elif isinstance(x, bool):
        assert x is False, (k, x)
    else:
        assert x is None or x == [] or x == {}, (k, x)
c = v['counts']
expected_counts = {'new_math': 31, 'new_theorems': 180, 'new_definitions': 116, 'new_instances': 1,
    'new_abbreviations': 0, 'total_math': 122, 'unselected_math': 91, 'compiled_only_math': 2,
    'timed_out_math': 8, 'rejected_only_math': 1, 'unbuilt_math': 80,
    'pending_theorems': 281, 'pending_definitions': 135, 'build_attempts': 50,
    'successful_build_attempts': 34, 'rejected_builds': 16, 'build_timeouts': 12,
    'replay_attempts': 1, 'successful_replays': 1, 'replay_timeouts': 0, 'selected_distinct': 31,
    'audits': 1, 'distinct_printed_closures': 180, 'print_rows': 180, 'indexed': 298,
    'archive_artifacts': 300, 'controller_artifacts': 300, 'initial_entries': 6867,
    'inherited_checked': 6867, 'prior164_artifacts': 155, 'prior164_manifest': 153, 'unused_theorems': 0}
for k, n in expected_counts.items():
    assert c[k] == n, (k, c[k])
assert c['build_returncodes'] == {'0': 34, '1': 4, 'None': 12}
assert v['controller']['request_id'] == 'c9f23b44907d4f9aa7cfc15e4a2c4b47'
assert v['controller']['outcome'] == 'completed' and v['controller']['returncode'] == 0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds'] == 1858.195433139801
assert v['controller_times']['finish_minus_deadline'] == 58.195433139801025
assert v['deadline_qualification']['report_precedes_deadline'] is True
assert m['worker121_inherited_boundary']['current_recovery_count'] == 0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count'] == 212
assert m['worker156_recovery_boundary']['new165_recovery_count'] == 0
assert m['import_scope']['new_replay_base_count'] == 2602
assert m['import_scope']['new_math_source_closure'] == 2633 and m['import_scope']['full_graph_nodes'] == 2725
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed'] == v['final_static_stability']['missing'] == []
assert v['final_static_stability']['input_count'] == len(v['input_hashes']) == 10374
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count'] == len(m['static_input_sha256']) == 421
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count'] == 300
assert v['late_scope_observation']['current_request_file_count'] == 302
late_relative_paths = ['research/__pycache__/source_experiment_c9f23b44.cpython-314.pyc',
    'research/__pycache__/validate_c9f23b44.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths']) == late_relative_paths
assert all(v['late_scope_observation'][k] == [] for k in [
    'missing_current_request_paths', 'extra_archive_paths', 'missing_archive_paths'])
assert v['opaque_cache_retention_supplement'] == late_metadata
assert v['preliminary_closing_gap_observation'] == late_observation
assert all(m['pending_dense_boundary']['object_absences'].values())
assert len(m['pending_dense_boundary']['object_absences']) == 178
assert all(v['final_absence_observation']['paths'].values()) and len(v['final_absence_observation']['paths']) == 178
assert m['pending_dense_boundary']['selected'] is m['pending_dense_boundary']['replayed'] is m['pending_dense_boundary']['axiom_printed'] is False
assert f['source_experiments']['counts'] == {'sources': 90, 'coefficients': 210780,
    'horizontal_triples': 210780, 'polygon_triples': 161070, 'known_zero_region_positions': 45390,
    'mixed_triples': 31581}
assert f['correction_probe']['domain_count'] == 31581
assert f['generation']['gap_literal_leaf_count'] == 23043
assert m['printed_closure_summary'] == {'axiom_sets': {'propext,Classical.choice,Quot.sound': 114,
    'propext': 65, 'propext,Quot.sound': 1}, 'distinct': 180, 'rows': 180}
assert m['isolated_checker']['all_explicit_selected_names_guarded'] is True
assert m['isolated_checker']['exact_prior164_retag'] is True
assert m['isolated_checker']['wrapper_declared_total'] == 291
assert m['isolated_checker']['source_declared_total'] == 297
assert m['isolated_checker']['guard_count_matches_complete_source_inventory'] is True
assert v['method_pair_crosscheck']['count'] == 2602 and v['method_pair_crosscheck']['mismatches'] == []
assert v['method_shared_input_crosscheck']['mismatches'] == {}
assert v['method_shared_input_crosscheck']['shared_count'] == 409
assert len(v['method_crosscheck']) == 94
assert v['finalizer_static_scope']['successful_replay_required'] is False
assert v['finalizer_static_scope']['actual_joint_replay_succeeded'] is True

rechecks = {}
for label, inputs in [('validation', v['input_hashes']), ('method', m['static_input_sha256'])]:
    rows = []
    for p, eh in inputs.items():
        if p.startswith(str(T) + '/'):
            row = pin(p)
            assert row['sha256'] == eh, p
            rows.append(row)
    rechecks[label] = rows
suffixes = ['monitoring_audit.md', 'mathematical_source_hashes.json', 'source_structure_audit.json',
    'finite_domain_audit.json', 'validation_audit.md', 'validation_evidence.json', 'replay_method.md', 'replay_method_evidence.json']
files = [pin(T / (PRE + x)) for x in suffixes]
late_files = [pin(T / (PRE + 'late_cache_bundle.json')),
    pin(T / (PRE + 'unarchived_cache_observation.json'))] + [
    pin(T / (PRE + 'late_cache_bundle') / rel) for rel in late_relative_paths]
assert late_metadata['worker'] == late_observation['worker'] == 165
assert late_metadata['file_count'] == 2 and late_metadata['total_bytes'] == 12154
assert late_files[1]['path'] == late_metadata['observation_path']
assert late_files[1]['sha256'] == late_metadata['observation_sha256']
assert [x['relative_path'] for x in late_metadata['files']] == late_relative_paths
for actual, row in zip(late_files[2:], late_metadata['files']):
    assert actual['path'] == row['bundle_path']
    assert row['bytes_and_selected_metadata_match'] is True
    assert row['source_observed'] == row['copy_observed']
    assert actual['bytes'] == row['copy_observed']['bytes']
    assert actual['sha256'] == row['copy_observed']['sha256']
assert len(sys.argv) == 2 and files[0]['sha256'] == sys.argv[1]
main = (T / (PRE + 'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'review in progress' not in main
assert 'Thirteen absent checks' in main
endpoints = {}
for n, x in m['endpoint_import_boundaries'].items():
    endpoints[n] = {k: x[k] for k in ['current_count', 'current_counts', 'inherited_count', 'local_nodes'] if k in x}
    for k in ['old121_195', 'old121_212', 'old121_accepted']:
        if k in x:
            endpoints[n][k + '_count'] = len(x[k])
assert len(endpoints) == 122
selected = set(m['coverage']['successful_targets'])
small = {'MarkovDenseCertificateMC9F', 'MarkovDenseBooleanMC9F', 'MarkovDenseDataMC9F'}
assert all(endpoints[n]['old121_212_count'] == (0 if n in small else 212) for n in selected)
cf = ['request_id', 'outcome', 'returncode', 'report', 'mathematical_resolution', 'elapsed_seconds', 'started', 'finished']
out = {
    'worker': 165, 'request': 'c9f23b44907d4f9aa7cfc15e4a2c4b47', 'sealed_at_utc': datetime.now(timezone.utc).isoformat(),
    'scope': 'Independent archive-first static audit of closed completed165. Final seal reads audit files only. No project/compiler/proof/checker/replay/experiment/generator/finalizer execution, mathematical-value computation, project edits or research assistance. Active166 and later workers excluded. Earlier seals/windows unchanged.',
    'files': files, 'consistency': c, 'historical_outcome': {k: v['controller'][k] for k in cf},
    'controller_times': v['controller_times'], 'timing': m['retained_timing'],
    'mathematical_scope': {k: x for k, x in s.items() if k not in ['worker', 'request', 'created_at_utc', 'new_modules', 'excluded_modules', 'scope']},
    'residual_binding': r, 'mathematical_values_recomputed': False,
    'finite_domains_and_qualifications': {k: f[k] for k in ['source_experiments', 'correction_probe', 'generation']},
    'finite_runtime_limits': f['runtime_limits'], 'finite_event_bindings': f['event_bindings'],
    'inherited_boundary': {
        'scope': m['import_scope'], 'pair_observation': v['dependency_hash_observation'], 'endpoints': endpoints,
        'old121': m['worker121_inherited_boundary'], 'worker156': m['worker156_recovery_boundary'],
        'later_inherited_workers': {str(n): m[f'worker{n}_boundary'] for n in range(157, 165)},
        'named_older_comparisons': 332, 'named_older_in_joint_base': 250, 'named_older_comparison_only': 82,
        'external_pairs': 12, 'historical_helper_identity_pins': 10,
        'window_history': m['named_older_window_boundary'], 'abel_history': m['named_older_abel_boundary'],
        'worker153': m['prior153_pending_boundary'], 'corrected_versions': m['inherited_corrected_versions_scope'],
        'qualification': 'Twenty-eight selected endpoints inherit old212/195/19 and Window/Abel; three generic endpoints avoid local project imports. Joint selected replay does not recover inherited bodies. Original Window/Abel production and print limits persist. No fresh whole-source rebuild.'},
    'method_limits': m['method_limits'], 'isolation': m['isolated_checker'], 'printed_closures': m['printed_closure_summary'],
    'compiler_summary': m['compiler_attempt_summary'], 'failed_versions': m['failed_version_qualifications'],
    'coverage_partition': m['coverage_partition'], 'excluded_candidates': m['pending_dense_boundary'],
    'historical161_unbuilt_column0': m['prior161_unbuilt_column0_boundary'],
    'historical160_pending_kernel': m['prior160_pending_kernel_boundary'],
    'historical163_pending_pair': m['prior163_pending_pair_boundary'],
    'excluded_source_declarations': h['excluded_modules'], 'validation_stages': m['validation_stages'],
    'finalization': m['retained_finalization'], 'finalizer_static_predicate': m['finalizer_static_predicate'],
    'preservation': {'initial_snapshot': m['initial_preservation_split'], 'checks': v['checks'],
        'initial_owned_exclusions': v['initial_owned_exclusions'], 'current_owned_setup_included': v['initial_run_owned_included'],
        'initial_input_count': 6867, 'entries_other_than_current_setup': 6866,
        'inventory_not_creation_time_ordering': True, 'archive_artifacts': 300, 'manifest_entries': 298,
        'manifest_only': v['manifest_only'], 'prior157_cache_boundary': m['prior157_manifest_cache_boundary'],
        'prior_reconciliation': m['prior_reconciliation'], 'additional_bundle_requires_preservation': True,
        'supplemental_opaque_cache_bundle': {'metadata': late_metadata, 'observation': late_observation, 'files': late_files,
            'scope': 'Two exact-request caches outside the archived manifest/controller set. Initial narrower inventory did not establish their absence. Later discovery is not later creation. Bytes retained without interpretation, execution, proof credit or attribution to active work. Original archive and earlier method window unchanged.'},
        'separate_publication_documents': v['preservation_scope']['separate_documentation_identity_only']},
    'deadline_qualification': v['deadline_qualification'],
    'final_observations': {'validation': v['final_static_stability'], 'method': m['final_static_input_stability'],
        'late_scope': v['late_scope_observation'], 'absences': v['final_absence_observation'],
        'project_reads_closed': True, 'seal_extends_project_observation': False},
    'crossreview': {'validation_reviewer': '/root/monitoring_audit/sealed136_review',
        'method_reviewer': '/root/monitoring_audit/sealed136_review/method138',
        'both_final_audit_files_only_reviews_received': True, 'necessary_corrections_remaining': [],
        'temporary_input_rechecks': rechecks, 'mathematical_support_crosscheck': v['mathematical_support_crosscheck'],
        'shared_field_count': len(v['method_crosscheck']), 'inherited_pairs': v['method_pair_crosscheck'],
        'shared_input_hashes': v['method_shared_input_crosscheck'],
        'scope_refinements': [
            'Selected dense identities cover product prefixes of 19, 19, 15, 15 factors, against 22 factors each.',
            'Full products, signed aggregate positivity and the source/root candidates remain unvalidated.',
            'The actual 3/8 correction mixed gap is negative while its polygon-valid raw horizontal triple is strictly LC.',
            'All three inherited root residual conjuncts remain open; no new raw LC region or source counterexample.',
            'Complete source declarations total 297, while the wrapper regex lists 291; the checker reports 297 guarded.',
            'Generated data elaborator constants retain ordinary object-loading/replay limits beyond the explicit suffix guard.',
            'Two compiled-only, eight timeout-history, one rejected-only and 80 unbuilt modules remain excluded.',
            'Finalizer permits failed/null replay in general; the actual retained selected replay independently succeeds.',
            'Host completion is 58.195433139801025 seconds late, but the delivered report and selected checks predate deadline.',
            'Known-zero region positions use index bounds only; random endpoint counts and mathematical values were not recomputed.',
            'The unused empty binomial_ratio_failures field is not evidence of a ratio test.',
            'Old 212/195 remains unrecovered; historical Window/Abel and earlier partial outcomes remain distinct.',
            'All 6867 initial entries include unchanged current setup; inventory ordering is not creation-time evidence.',
            'Final exact-request enumeration has 302 current paths against 300 archived; two opaque caches are separately retained, with creation and author attribution unproved.',
            'Thirteen absent receipt observations precede closure; all read intervals exceed 60 seconds. One requested 60-second wait returned 60.0082 seconds, disclosed.',
            'All final consistency calculations read audit files only; no project or mathematical execution.']},
    'inherited_pair_map': pin(T / (PRE + 'inherited_pair_expectations.json')),
    'audit_helpers': [pin(T / 'static_audit_worker165.py'), pin(Path(__file__))],
    'preservation_paths': [str(T / (PRE + x)) for x in suffixes] + [str(T / (PRE + 'inherited_pair_expectations.json')), str(T / 'static_audit_worker165.py'), str(Path(__file__))] + [x['path'] for x in late_files],
    'pending_required_research_execution': False, 'completion_claim': False}
p = T / (PRE + 'audit_integrity.json')
assert not p.exists()
p.write_text(json.dumps(out, indent=2, ensure_ascii=False) + '\n')
print(json.dumps({'main': files[0], 'integrity': pin(p), 'pairmap': out['inherited_pair_map'],
    'additional_bundle_requires_preservation': True, 'supplemental_files': late_files}, indent=2))
