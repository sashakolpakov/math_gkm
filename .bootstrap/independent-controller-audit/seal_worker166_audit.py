"""Closed166 final audit-files-only seal. No project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import sys

T = Path('/private/tmp/math_gkm_godel_20261013')
PRE = 'markov_worker_000166_'
REQUEST = 'db238071732b4d94a95826082e34e37e'

def read(suffix):
    return json.loads((T / (PRE + suffix)).read_text())

def pin(path):
    path = Path(path)
    assert path.is_relative_to(T)
    data = path.read_bytes()
    return {'path': str(path), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}

v = read('validation_evidence.json')
m = read('replay_method_evidence.json')
h = read('mathematical_source_hashes.json')
s = read('source_structure_audit.json')
f = read('finite_domain_audit.json')
pairs = read('inherited_pair_expectations.json')
late_metadata = read('late_cache_bundle.json')
late_observation = read('unarchived_cache_observation.json')
assert all(d['worker'] == 166 for d in [v, m, h, s, f, late_metadata, late_observation])
assert v['request'] == m['request_id'] == h['request'] == s['request'] == f['request'] == REQUEST
assert h['accepted_counts'] == s['accepted_counts'] == m['coverage']['selected_counts'] == {'theorem': 33, 'def': 13}
assert len(h['new_sources']) == len(s['new_modules']) == 12
assert h['excluded_counts'] == s['excluded_counts'] == {'theorem': 84, 'def': 46}
assert len(h['excluded_modules']) == len(s['excluded_modules']) == 52
assert len(h['operational_sources']) == 2
assert len(h['named_older_comparisons']) == 363
assert len(h['historical_pending_comparisons']) == 126
assert h['all_named_new_match_current'] is True
assert h['coverage_counts'] == s['coverage_counts'] == {
    'selected_replayed': {'theorem': 26, 'def': 6},
    'selected_unreplayed': {'theorem': 7, 'def': 7},
    'timed_out_excluded': {'theorem': 7, 'def': 7},
    'unattempted_excluded': {'theorem': 77, 'def': 39}}
expected_partition = {
    'selected_replayed': (5, {'theorem': 26, 'def': 6}, True, True),
    'selected_not_replayed': (7, {'theorem': 7, 'def': 7}, True, False),
    'timeout_only': (7, {'theorem': 7, 'def': 7}, False, False),
    'unbuilt': (45, {'theorem': 77, 'def': 39}, False, False),
    'compiled_only': (0, {}, False, False),
    'rejected_only': (0, {}, False, False)}
for name, (count, declarations, printed, replayed) in expected_partition.items():
    part = m['coverage_partition'][name]
    assert part['module_count'] == len(part['modules']) == count
    assert part['counts'] == declarations
    assert part['printed'] is printed and part['replayed'] is replayed
    assert part['full_validation'] is replayed
assert m['coverage']['successful_target_counts'] == {'theorem': 26, 'def': 6}
assert m['coverage']['compiled_and_printed_not_replayed_counts'] == {'theorem': 7, 'def': 7}
assert len(m['coverage']['successful_targets']) == 5
assert len(m['coverage']['selected_targets']) == 12
assert len(m['coverage']['pending_math_drafts']) == 52
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
r = h['residual_binding']
for key in ['root_open', 'all_three_residual_conjuncts_unproved', 'ReducedPairPositive_unproved',
            'ParametricPairPositive_unproved', 'RationalPairStep_unproved',
            'new_first_correction_factorization', 'correction_residual_uniform_adjacent_or_CrossLC_unproved',
            'new_packed_soundness_with_explicit_hypotheses', 'actual_multivariate_packed_application_unproved',
            'full_products_unvalidated', 'signed_aggregate_and_sign_test_unvalidated',
            'LowerClosed_source_and_root_candidates_unvalidated']:
    assert r[key] is True, key
assert r['new_raw_LC_region'] is r['actual_raw_source_counterexample'] is False
for key, value in v['checks'].items():
    if key in ['method_independent_validation_agrees', 'selected_receipts_match']:
        assert value is True, (key, value)
    elif isinstance(value, bool):
        assert value is False, (key, value)
    else:
        assert value is None or value == [] or value == {}, (key, value)
c = v['counts']
expected_counts = {
    'new_math': 12, 'new_theorems': 33, 'new_definitions': 13, 'new_instances': 0,
    'new_abbreviations': 0, 'total_math': 64, 'unselected_math': 52,
    'core_replayed_math': 5, 'core_replayed_theorems': 26, 'core_replayed_definitions': 6,
    'selected_unreplayed_math': 7, 'selected_unreplayed_theorems': 7, 'selected_unreplayed_definitions': 7,
    'timeout_only_math': 7, 'unbuilt_math': 45, 'pending_theorems': 84, 'pending_definitions': 46,
    'operational_success': 1, 'operational_rejected': 1, 'build_attempts': 27,
    'successful_build_attempts': 14, 'rejected_builds': 13, 'build_timeouts': 9,
    'replay_attempts': 2, 'successful_replays': 1, 'replay_timeouts': 1, 'selected_distinct': 12,
    'audits': 1, 'distinct_printed_closures': 33, 'print_rows': 33, 'indexed': 172,
    'archive_artifacts': 174, 'controller_artifacts': 174, 'initial_entries': 7015,
    'inherited_checked': 7015, 'prior165_artifacts': 300, 'prior165_manifest': 298, 'unused_theorems': 0}
for key, expected in expected_counts.items():
    assert c[key] == expected, (key, c[key])
assert c['build_returncodes'] == {'0': 14, '1': 4, 'None': 9}
assert v['controller']['request_id'] == REQUEST
assert v['controller']['outcome'] == 'completed' and v['controller']['returncode'] == 0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds'] == 1819.4393000602722
assert v['controller_times']['finish_minus_deadline'] == 19.439300060272217
assert v['deadline_qualification']['report_precedes_deadline'] is True
assert v['deadline_qualification']['report_mtime_precedes_deadline_seconds'] == 30.458467483520508
assert m['worker121_inherited_boundary']['current_recovery_count'] == 0
assert m['worker121_inherited_boundary']['global_unrecovered_backlog'] == 212
assert m['worker156_recovery_boundary']['new166_recovery_count'] == 0
assert m['import_scope']['all_inherited_pair_count'] == pairs['count'] == 2632
assert m['import_scope']['successful_replay_base_count'] == 2532
assert m['import_scope']['selected_import_base_count'] == 2633
assert m['import_scope']['selected_math_source_closure'] == 2645
assert m['import_scope']['full_graph_nodes'] == 2699
assert m['import_scope']['direct_imports_including_implicit_Init'] == 7
assert m['isolated_checker']['successful_core_guarded'] == 32
assert m['isolated_checker']['exact_prior165_retag'] is True
assert m['isolated_checker']['full_nine_timeout_no_guard_output'] is True
assert m['isolated_checker']['sha256'] == '7677dfca91bea4eaa17e04eac9934cc22f27ea4934984bc7be8d42d78a49a2b5'
assert m['printed_closure_summary']['axiom_sets'] == {
    'propext,Classical.choice,Quot.sound': 24, 'propext,Quot.sound': 5, 'propext': 4}
assert m['printed_closure_summary']['distinct'] == m['printed_closure_summary']['rows'] == 33
assert f['correction_experiment']['counts'] == {
    'source_cases': 98, 'source_comparisons': 8379, 'known_zero_region_positions': 3136,
    'raw_triples': 8183, 'residual_cross_pairs': 64778}
assert len(f['generation']['literal_data']) == 53
assert m['finalizer_static_predicate']['requires_full_selected_replay'] is False
assert m['finalizer_static_predicate']['compiled_sha256_present'] is False
assert m['finalizer_static_predicate']['final_manifest_mismatch_assertion_present'] is False
assert m['finalizer_static_predicate']['actual_artifact_mismatches_empty'] is True
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed'] == v['final_static_stability']['missing'] == []
assert v['final_static_stability']['input_count'] == len(v['input_hashes']) == 10491
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count'] == len(m['static_input_sha256']) == 292
assert v['method_pair_crosscheck']['count'] == 2632 and v['method_pair_crosscheck']['mismatches'] == []
assert v['method_shared_input_crosscheck']['mismatches'] == {}
assert len(v['method_crosscheck']) == 63
assert v['method_shared_input_crosscheck']['shared_count'] == 278
assert m['all_resolved_source_cycles'] == []
assert m['selected_duplicate_names'] == m['selected_excluded_collisions'] == {}
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count'] == 174
assert v['late_scope_observation']['current_request_file_count'] == 176
late_relative_paths = [
    'research/__pycache__/finish_products_db238071.cpython-314.pyc',
    'research/__pycache__/validate_db238071.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths']) == late_relative_paths
assert all(v['late_scope_observation'][key] == [] for key in [
    'missing_current_request_paths', 'extra_archive_paths', 'missing_archive_paths'])
assert v['opaque_cache_retention_supplement'] == late_metadata
assert v['initial_unarchived_cache_observation'] == late_observation
assert all(m['pending_boundary']['object_absences'].values())
assert len(m['pending_boundary']['object_absences']) == 106
assert all(v['final_absence_observation']['paths'].values())
assert len(v['final_absence_observation']['paths']) == 106

# Recheck only temporary audit-file inputs. All project observations remain the delegates' closed windows.
rechecks = {}
for label, inputs in [('validation', v['input_hashes']), ('method', m['static_input_sha256'])]:
    rows = []
    for path, expected in inputs.items():
        if path.startswith(str(T) + '/'):
            row = pin(path)
            assert row['sha256'] == expected, path
            rows.append(row)
    rechecks[label] = rows
suffixes = ['monitoring_audit.md', 'mathematical_source_hashes.json', 'source_structure_audit.json',
    'finite_domain_audit.json', 'validation_audit.md', 'validation_evidence.json',
    'replay_method.md', 'replay_method_evidence.json']
files = [pin(T / (PRE + suffix)) for suffix in suffixes]
late_files = [pin(T / (PRE + 'late_cache_bundle.json')),
    pin(T / (PRE + 'unarchived_cache_observation.json'))] + [
    pin(T / (PRE + 'late_cache_bundle') / relative) for relative in late_relative_paths]
assert late_metadata['file_count'] == 2 and late_metadata['total_bytes'] == 11438
assert late_files[1]['path'] == late_metadata['observation_path']
assert late_files[1]['sha256'] == late_metadata['observation_sha256']
assert [row['relative_path'] for row in late_metadata['files']] == late_relative_paths
for actual, row in zip(late_files[2:], late_metadata['files']):
    assert actual['path'] == row['bundle_path']
    assert row['bytes_and_selected_metadata_match'] is True
    assert row['source_observed'] == row['copy_observed']
    assert actual['bytes'] == row['copy_observed']['bytes']
    assert actual['sha256'] == row['copy_observed']['sha256']
assert len(sys.argv) == 2 and files[0]['sha256'] == sys.argv[1]
main = (T / (PRE + 'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'Final bounded observation pending' not in main
assert 'Both intervals exceed 60 seconds' in main
endpoints = {}
for name, row in m['endpoint_import_boundaries'].items():
    endpoints[name] = {key: row[key] for key in ['current_count', 'current_counts', 'inherited_count', 'local_nodes'] if key in row}
    for key in ['old121_195', 'old121_212', 'old121_accepted']:
        if key in row:
            endpoints[name][key + '_count'] = len(row[key])
assert len(endpoints) == 64
small = {'MarkovDenseTransportMDB2', 'MarkovPackedConvolutionMDB2', 'MarkovPackedExamplesMDB2'}
assert all(endpoints[name]['old121_212_count'] == (0 if name in small else 212)
    for name in m['coverage']['selected_targets'])
controller_fields = ['request_id', 'outcome', 'returncode', 'report', 'mathematical_resolution',
    'elapsed_seconds', 'started', 'finished']
preservation_paths = [row['path'] for row in files] + [
    str(T / (PRE + 'inherited_pair_expectations.json')),
    str(T / 'static_audit_worker166.py'), str(Path(__file__))] + [row['path'] for row in late_files]
assert len(preservation_paths) == 15 and len(set(preservation_paths)) == 15
out = {
    'worker': 166, 'request': REQUEST, 'sealed_at_utc': datetime.now(timezone.utc).isoformat(),
    'scope': 'Independent archive-first static audit of closed completed166. This seal reads audit files only. No project, compiler, proof, checker, replay, experiment, generator or finalizer execution, mathematical-value computation, project edits or research help. Active167 and later excluded; earlier seals/windows unchanged.',
    'files': files, 'consistency': c,
    'historical_outcome': {key: v['controller'][key] for key in controller_fields},
    'controller_times': v['controller_times'], 'timing': m['retained_timing'],
    'mathematical_scope': {key: value for key, value in s.items() if key not in [
        'worker', 'request', 'created_at_utc', 'new_modules', 'excluded_modules', 'scope']},
    'residual_binding': r, 'mathematical_values_recomputed': False,
    'finite_domains_and_qualifications': {key: f[key] for key in [
        'correction_experiment', 'representation_experiment', 'packed_experiment', 'generation']},
    'finite_runtime_limits': f['runtime_limits'], 'finite_event_bindings': f['event_bindings'],
    'inherited_boundary': {
        'scope': m['import_scope'], 'pair_observation': v['dependency_hash_observation'], 'endpoints': endpoints,
        'old121': m['worker121_inherited_boundary'], 'worker156': m['worker156_recovery_boundary'],
        'worker134': m['worker134_boundary'], 'worker135': m['worker135_boundary'], 'worker136': m['worker136_boundary'],
        'worker165': m['worker165_boundary'], 'imported_worker_memberships': m['imported_worker_memberships'],
        'named_older_comparisons': 363, 'named_older_in_full_selected_base': 280,
        'named_older_comparison_only_full_base': 83, 'named_older_in_successful_core_base': 180,
        'named_older_comparison_only_core_base': 183, 'external_pairs': 14, 'historical_helper_identity_pins': 10,
        'window_history': m['named_older_window_boundary'], 'abel_history': m['named_older_abel_boundary'],
        'worker153': m['prior153_pending_boundary'], 'corrected_versions': m['inherited_corrected_versions_scope'],
        'qualification': 'Both correction endpoints and seven prefixes import old212/195/19 and Window/Abel; three generic endpoints avoid them. Five selected core replayed, seven prefixes not replayed. Imported bodies remain inherited compiled trust. Original Window/Abel production and print limits persist; no fresh whole-source rebuild.'},
    'method_limits': m['method_limits'], 'isolation': m['isolated_checker'],
    'printed_closures': m['printed_closure_summary'], 'compiler_summary': m['compiler_attempt_summary'],
    'failed_versions': m['failed_version_qualifications'], 'coverage_partition': m['coverage_partition'],
    'excluded_candidates': m['pending_boundary'], 'operational_kernel_rfl': m['operational_kernel_rfl_boundary'],
    'historical161_unbuilt_column0': m['prior161_unbuilt_column0_boundary'],
    'historical160_pending_kernel': m['prior160_pending_kernel_boundary'],
    'historical163_pending_pair': m['prior163_pending_pair_boundary'],
    'excluded_source_declarations': h['excluded_modules'], 'validation_stages': v['replay_audit_stages'],
    'finalization': m['retained_finalization'], 'finalizer_static_predicate': m['finalizer_static_predicate'],
    'preservation': {
        'checks': v['checks'], 'initial_owned_exclusions': v['initial_owned_exclusions'],
        'current_owned_setup_included': v['initial_run_owned_included'], 'initial_input_count': 7015,
        'entries_other_than_current_setup': 7014, 'inventory_not_creation_time_ordering': True,
        'archive_artifacts': 174, 'manifest_entries': 172, 'indexed_logical_bytes': 35600772,
        'manifest_only': v['manifest_only'], 'prior_reconciliation': m['prior_reconciliation'],
        'prior165_opaque_cache_boundary': m['prior165_opaque_cache_boundary'],
        'additional_bundle_requires_preservation': True,
        'supplemental_opaque_cache_bundle': {'metadata': late_metadata, 'observation': late_observation, 'files': late_files,
            'scope': 'Two exact-request opaque caches outside archive/manifest/controller records. Initial broader inventory already found them. Discovery does not establish creation time, source version or successor attribution. Bytes retained without interpretation, execution or validation upgrade; original archive unchanged.'},
        'separate_publication_documents': v['preservation_scope']['separate_documentation_identity_only']},
    'deadline_qualification': v['deadline_qualification'],
    'final_observations': {'validation': v['final_static_stability'], 'method': m['final_static_input_stability'],
        'late_scope': v['late_scope_observation'], 'absences': v['final_absence_observation'],
        'project_reads_closed': True, 'seal_extends_project_observation': False},
    'crossreview': {
        'validation_reviewer': '/root/monitoring_audit/sealed136_review',
        'method_reviewer': '/root/monitoring_audit/sealed136_review/method138',
        'both_final_audit_files_only_reviews_received': True, 'necessary_corrections_remaining': [],
        'temporary_input_rechecks': rechecks, 'mathematical_support_crosscheck': v['mathematical_support_crosscheck'],
        'shared_field_count': len(v['method_crosscheck']), 'inherited_pairs': v['method_pair_crosscheck'],
        'shared_input_hashes': v['method_shared_input_crosscheck'],
        'scope_refinements': [
            'All-natural-column first correction-row factorization has actual numerator-three source guard q >= 2.',
            'Residual support and adjacent iff CrossLC do not establish the unproved uniform adjacent sign premise.',
            'Generic packed soundness includes base, coefficient, length and identity hypotheses; its multivariable source application remains open.',
            'Twelve compiled and printed modules contain 33 theorem closures; five replayed core modules contain 26 closures and six definitions.',
            'Seven product prefixes are compiled/printed but unreplayed; the failed combined replay has no guard or successful traversal output.',
            'Full products, aggregate sign and source/root candidates remain unbuilt; three root residual conjuncts remain open.',
            'No new unconditional raw LC region, root completion or actual-source counterexample.',
            'Generated/private/elaborator constants and inherited objects retain ordinary loader and replay boundaries.',
            'Finalizer no longer asserts exact theorem names, full replay, compiled hashes or empty manifest mismatches; actual retained associations checked independently.',
            'Host completed 19.439300060272217 seconds late; selected checks and report mtime precede deadline.',
            'Two absent receipt checks precede closure, all intervals exceed 60 seconds; requested59-second waits returned59.0054 and59.0051 seconds.',
            'Old212/195 unrecovered; historical Window/Abel and original156 timeout/recovery chronology remain distinct.',
            'Two opaque caches are retained separately,176 current paths versus174archive, with no attribution or validation upgrade.',
            'All final consistency calculations read only saved audit files; no project or mathematical execution.']},
    'inherited_pair_map': pin(T / (PRE + 'inherited_pair_expectations.json')),
    'audit_helpers': [pin(T / 'static_audit_worker166.py'), pin(Path(__file__))],
    'preservation_paths': preservation_paths,
    'pending_required_research_execution': False, 'completion_claim': False}
output = T / (PRE + 'audit_integrity.json')
assert not output.exists()
output.write_text(json.dumps(out, indent=2, ensure_ascii=False) + '\n')
print(json.dumps({'main': files[0], 'integrity': pin(output), 'pairmap': out['inherited_pair_map'],
    'additional_bundle_requires_preservation': True, 'supplemental_files': late_files,
    'preservation_file_count_including_integrity': len(preservation_paths) + 1}, indent=2))
