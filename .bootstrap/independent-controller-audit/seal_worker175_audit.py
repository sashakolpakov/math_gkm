#!/usr/bin/env python3
"""Seal already-reviewed worker175 audit files; never read project files or execute research."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import sys

T = Path('/private/tmp/math_gkm_godel_20261013')
PRE = 'markov_worker_000175_'
REQUEST = '6576ccc531a74d75b259fda7f71c9b95'

def local(path):
    path = Path(path)
    assert path.is_absolute() and path.is_relative_to(T), str(path)
    assert path.resolve().is_relative_to(T), str(path)
    return path

def pin(path):
    path = local(path)
    data = path.read_bytes()
    return {'path': str(path), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}

def read(suffix):
    return json.loads(local(T / (PRE + suffix)).read_text())

assert len(sys.argv) == 2, 'Supply the reviewed final main SHA256.'
output = T / (PRE + 'audit_integrity.json')
assert not output.exists(), 'An existing seal must never be rewritten.'
h = read('mathematical_source_hashes.json')
s = read('source_structure_audit.json')
f = read('finite_domain_audit.json')
v = read('validation_evidence.json')
m = read('replay_method_evidence.json')
bundle = read('manifest_only_bundle.json')
observation = read('manifest_only_observation.json')
for data in [h, s, f, v]:
    assert data['worker'] == 175 and data['request'] == REQUEST
assert m['worker'] == 175 and m['request_id'] == REQUEST
for suffix, expected in {
    'mathematical_source_hashes.json': '633337e322782cd26f244956f32586dfa1a9234bbba2b093c0b3944379dac162',
    'source_structure_audit.json': '92292138bda40aaa4dff9c5494761b4fc053aba931abb8aae2ca9b99e148d0fd',
    'finite_domain_audit.json': 'b298d5d75847fc55bd8dd8b7a1301592351d5c0fc83f95543e09b5d26a8e08a3',
    'manifest_only_bundle.json': 'a04224f46d7fef3e914c190db842368faaf60a7f9ca36a0c6b97fc43571c941a',
    'manifest_only_observation.json': '68021241e701caee59177eefe1d86bb27a294218448e04c4bccf9af95b3d67f2',
    'validation_audit.md': '34a7b749df47d4b5c8c429d7c2cd5bd7d2cb14c416d06e1c28d4d0bc6c3d2a26',
    'validation_evidence.json': '3ea377dac9aaeb7d73c1c6c5633e69d11d332ad7926a64c923a1f6491b7c80fa',
    'replay_method.md': 'bda342439cf5a39bde4f9f5ba6622250a26f6906f6c37bc1eebf75b7e05a5a0b',
    'replay_method_evidence.json': '558c5e8d589711eb879cb364c8a261142562d748f3c674a8dce407d5e1fc2849',
    'inherited_pair_expectations.json': 'b9d0cd5e67e1189f820b81744dcbc63f4d9d6b88f75ff81d172085a603421fae',
}.items():
    assert pin(T / (PRE + suffix))['sha256'] == expected, suffix

c = v['counts']
expected_counts = {
    'new_math': 14, 'new_theorems': 52, 'new_definitions': 17, 'new_inductives': 0,
    'all_math_theorems': 52, 'all_math_definitions': 17, 'all_math_inductives': 0,
    'total_math': 14, 'unselected_math': 0, 'fully_validated_math': 14,
    'compiled_only_math': 0, 'timeout_only_math': 0, 'unbuilt_math': 0,
    'build_attempts': 23, 'successful_build_attempts': 16, 'rejected_builds': 7,
    'build_timeouts': 1, 'replay_attempts': 2, 'successful_replays': 2,
    'replay_timeouts': 0, 'audits': 2, 'distinct_printed_closures': 52,
    'print_rows': 101, 'indexed': 353, 'archive_artifacts': 128,
    'controller_artifacts': 128, 'initial_entries': 21242, 'inherited_checked': 21242,
    'prior174_artifacts': 113, 'prior174_manifest': 334,
}
for key, expected in expected_counts.items():
    assert c[key] == expected, (key, c[key])
assert c['build_returncodes'] == {'0': 16, '1': 6, 'None': 1}
assert h['accepted_counts'] == s['accepted_counts'] == m['all_new_counts'] == {'theorem': 52, 'def': 17}
assert len(h['new_sources']) == len(s['new_modules']) == 14
assert h['excluded_counts'] == s['excluded_counts'] == {}
assert s['mathematical_values_recomputed'] is False and f['mathematical_values_recomputed'] is False
assert v['controller']['outcome'] == 'completed' and v['controller']['returncode'] == 0
assert v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds'] == 1590.866719007492
assert v['controller_times']['finish_minus_deadline'] == -209.13328099250793
assert v['contract'] == {
    'canonical': '6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc',
    'parsed_request_matches': True,
    'raw': 'cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068',
    'request': '6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc',
    'root': '8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',
}
assert v['initial_owned_exclusions'] == [] and len(v['initial_checks']) == 21242
assert all(not row['owned_excluded'] and row['current'] == row['expected'] for row in v['initial_checks'])
for key, value in v['checks'].items():
    if key in ['selected_receipts_match', 'method_independent_validation_agrees']:
        assert value is True, (key, value)
    else:
        assert not value, (key, value)
assert v['checks']['method_independent_validation_agrees'] is True

r = h['residual_binding']
assert r['root_open'] is True and r['new_unconditional_raw_LC_region'] is True
assert r['new_vertical_or_diagonal_region'] is False and r['TransposedCuts_proved'] is False
assert r['actual_raw_source_counterexample'] is False and r['old212_recovery_claimed'] is False
assert r['root_equivalence'] == 'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2'
assert r['remaining_predicates_unproved'] == ['ThreeBeyondBandM657', 'OtherFourM9E2']
assert m['coverage_partition']['selected_replayed']['module_count'] == 14
assert m['coverage_partition']['selected_replayed']['counts'] == {'theorem': 52, 'def': 17}
assert all(row['module_count'] == 0 for key, row in m['coverage_partition'].items() if key != 'selected_replayed')
assert m['isolated_checker']['sha256'] == 'dc82109d94f99b64e24549307159e2131339c652469d1bd0066ab49a35ec7f33'
assert m['isolated_checker']['guarded_counts'] == m['isolated_checker']['lexical_top_level_counts'] == [65, 69]
assert m['isolated_checker']['exact_prior174_retag'] is True
assert m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary'] == {'axiom_sets': {'propext,Classical.choice,Quot.sound': 52}, 'distinct': 52, 'rows': 101}
assert m['compiler_attempt_summary'] == {'attempts': 23, 'rc1': 6, 'success': 16, 'timeouts': 1}
versions = m['successful_version_selection']
assert versions['superseded_successful_current_sources'] == []
assert versions['one_final_source_success_per_module'] is True and versions['final_source_matching'] is True
assert versions['validation_stage_count'] == 2 and versions['stage_module_counts'] == [13, 14]
assert versions['final_stage_modules'] == versions['successful_mathematical_builds'] == 14
failed = m['failed_version_qualifications']
for key, expected in {'attempt_count': 7, 'rc1_count': 6, 'timeout_count': 1,
                      'common_normalized_headers_unchanged': True, 'all_imports_unchanged': True,
                      'all_differ_from_final': True, 'timeout_raw_returncode_field_present': False,
                      'timeout_returncode_audit_normalized_to_null': True}.items():
    assert failed[key] == expected, key
assert failed['timeout_receipt'] == 'build-1792212493665381000.json'
assert m['all_resolved_source_cycles'] == [] and m['source_resolution_errors'] == []
assert m['selected_duplicate_names'] == m['selected_excluded_collisions'] == {}
assert m['import_scope']['selected_import_base_count'] == m['import_scope']['all_inherited_pair_count'] == 2724
assert m['import_scope']['selected_math_source_closure'] == 2738 and m['import_scope']['full_graph_nodes'] == 2740
assert len(h['named_older_comparisons']) == 502
assert sum(row['module'] in m['source_graph'] for row in h['named_older_comparisons']) == 372
assert len(h['historical_pending_comparisons']) == 181 and len(h['historical_operational_comparisons']) == 2
assert len(h['inherited_scripts']) == 68 and len(h['result_bindings']) == 18
endpoints = {}
for name, row in m['endpoint_import_boundaries'].items():
    endpoints[name] = {key: row[key] for key in ['current_count', 'current_counts', 'inherited_count', 'local_nodes']}
    for key, expected in [('old121_212', 212), ('old121_195', 195), ('old121_accepted', 19)]:
        assert len(row[key]) == expected, (name, key)
        endpoints[name][key + '_count'] = len(row[key])
    assert row['Window_imported'] is True and row['Abel_imported'] is True
assert len(endpoints) == 14 and sorted({row['inherited_count'] for row in endpoints.values()}) == [2551, 2700, 2724]

# Count comparison only; mathematical values in saved results are never recomputed.
assert f['source_experiment']['counts'] == {
    'source_cases': 52, 'rows': 454, 'coefficients': 44667, 'lift_comparisons': 44667,
    'raw_triples': 43759, 'polygon_triples': 24069,
    'new_region_positions_in_prior_H_residual': 28271,
    'new_region_polygon_positions_in_prior_H_residual': 12290,
}
assert f['source_experiment']['zero_count_saved_only'] == 19690
assert f['source_experiment']['zero_count_independently_recomputed'] is False
assert f['prefix']['counts'] == {'mixed_checks': 48321, 'edge_ratio_checks': 32760, 'midpoint_checks': 40000}
assert f['prefix_cut_kernel']['counts'] == {'triplets': 4500, 'weighted_identity_checks': 13500, 'auxiliary_q1_triplets': 10, 'cut_coefficient_checks': 265560}
assert f['tail_cut_kernel']['counts'] == {'triplets': 4500, 'cut_coefficient_checks': 1005750}
assert f['mixed_kernel']['counts'] == {'triplets': 1248, 'auxiliary_q1_triplets': 13, 'checks': 375648}
watch = h['receipt_waiting']
assert len(watch['checks']) == 10 and sum(row['status'] == 'absent' for row in watch['checks']) == 9
assert watch['checks'][-1]['sha256'] == 'adcbf2a2058d57060d12936599048d6bb8a3fed3f57653d73a776052531b96b6'
assert all(b['observed_epoch'] - a['observed_epoch'] >= 60 for a, b in zip(watch['checks'], watch['checks'][1:]))
assert len(watch['waits']) == 13 and all(row['requested_ms'] <= 59000 for row in watch['waits'])
assert m['retained_finalization']['finalizer_events'] == [265]
assert m['retained_finalization']['final_report_event'] == 266 and m['retained_finalization']['turn_completed_event'] == 267
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True

# These independent bounded windows are final; sealing must not extend them.
for row, inputs in [(v['final_static_stability'], v['input_hashes']), (m['final_static_input_stability'], m['static_input_sha256'])]:
    assert row['all_unchanged'] is True and row['input_count'] == len(inputs)
    assert row.get('changed', []) == [] and row.get('missing', []) == []
assert m['final_static_input_stability']['input_count'] == 419
assert v['final_static_stability']['input_count'] == 25096
assert v['method_pair_crosscheck']['count'] == 2724 and v['method_pair_crosscheck']['mismatches'] == []
assert v['method_shared_input_crosscheck']['mismatches'] == {}
assert len(v['method_crosscheck']) == 77 and v['method_shared_input_crosscheck']['shared_count'] == 401
assert all(value == m[key] for key, value in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is False and m['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths'] == m['final_absence_observation']['paths'] == {}
assert v['manifest_only_retention_supplement'] == m['manifest_only_retention_supplement'] == bundle
assert v['manifest_only_retention_observation'] == m['manifest_only_retention_observation'] == observation
assert bundle['file_count'] == 227 and bundle['total_bytes'] == 2066342
assert observation['archive_file_count'] == observation['controller_file_count'] == 128
assert observation['manifest_count'] == 353 and observation['current_request_file_count'] == 132
closing = v['late_scope_observation']
for key, expected in {
    'archive_file_count': 128, 'current_request_file_count': 132, 'manifest_count': 353,
    'manifest_union_archive_count': 355, 'supplemental_file_count': 227,
    'historical_manifest_only_count': 223, 'current_request_manifest_only_count': 4,
    'supplemental_total_bytes': 2066342,
}.items():
    assert closing[key] == expected, (key, closing[key])
assert closing['late_bundle_required'] is True
assert closing['extra_current_request_paths'] == [
    'research/__pycache__/band_column_probe_6576ccc5.cpython-314.pyc',
    'research/__pycache__/source_experiment_6576ccc5.cpython-314.pyc',
    'research/__pycache__/transposed_kernel_probe_6576ccc5.cpython-314.pyc',
    'research/__pycache__/validate_6576ccc5.cpython-314.pyc',
]
for key in ['missing_current_request_paths', 'extra_archive_paths', 'missing_archive_paths']:
    assert closing[key] == []
assert set(closing['manifest_only_paths']) == {row['relative_path'] for row in bundle['files']}
metadata = closing['supplemental_metadata_checks']
assert len(metadata) == 454 and all(row['bytes_mode_uid_gid_mtime_sha256_match'] is True for row in metadata)
assert {row['path'] for row in metadata} == {row[key] for row in bundle['files'] for key in ['source_path', 'bundle_path']}
assert closing['supplemental_manifest_path'] == str(T / (PRE + 'manifest_only_bundle.json'))
assert closing['supplemental_manifest_sha256'] == pin(T / (PRE + 'manifest_only_bundle.json'))['sha256']

rechecks = {}
for label, inputs in [('validation', v['input_hashes']), ('method', m['static_input_sha256'])]:
    rows = []
    for path, expected_hash in inputs.items():
        if path.startswith(str(T) + '/'):
            row = pin(path)
            assert row['sha256'] == expected_hash, path
            rows.append(row)
    rechecks[label] = rows
assert len(rechecks['method']) == 251
assert len(rechecks['validation']) == 474
suffixes = ['monitoring_audit.md', 'mathematical_source_hashes.json', 'source_structure_audit.json',
            'finite_domain_audit.json', 'validation_audit.md', 'validation_evidence.json',
            'replay_method.md', 'replay_method_evidence.json']
files = [pin(T / (PRE + suffix)) for suffix in suffixes]
assert files[0]['sha256'] == sys.argv[1], 'Final main differs from reviewed digest.'
main = local(T / (PRE + 'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'Final review remains pending' not in main
extra = [pin(T / (PRE + 'manifest_only_bundle.json')), pin(T / (PRE + 'manifest_only_observation.json'))]
assert extra[1]['path'] == bundle['observation_path'] and extra[1]['sha256'] == bundle['observation_sha256']
for entry in bundle['files']:
    row = pin(entry['bundle_path'])
    assert entry['bytes_and_selected_metadata_match'] is True and entry['source_observed'] == entry['copy_observed']
    assert row['bytes'] == entry['copy_observed']['bytes'] and row['sha256'] == entry['copy_observed']['sha256']
    extra.append(row)
assert len(extra) == 229
pairmap = pin(T / (PRE + 'inherited_pair_expectations.json'))
helpers = [pin(T / 'static_audit_worker175.py'), pin(Path(__file__))]
preserve = [row['path'] for row in files] + [pairmap['path']] + [row['path'] for row in helpers] + [row['path'] for row in extra]
assert len(preserve) == len(set(preserve)) == 240
controller_keys = ['request_id', 'outcome', 'returncode', 'report', 'mathematical_resolution', 'elapsed_seconds', 'started', 'finished']
boundary_keys = [key for key in m if key.endswith('_boundary')] + ['inherited_corrected_versions_scope']
out = {
    'worker': 175, 'request': REQUEST, 'sealed_at_utc': datetime.now(timezone.utc).isoformat(),
    'scope': 'Independent static archive-first closed175 audit. Sealer reads temporary audit files only. No project execution, project reread or mathematical-value recomputation. Active176+ excluded; earlier outcomes, seals and windows unchanged.',
    'files': files, 'consistency': c, 'historical_outcome': {key: v['controller'][key] for key in controller_keys},
    'controller_times': v['controller_times'], 'timing': m['retained_timing'], 'receipt_waiting': watch,
    'root_contract_binding': v['contract'], 'residual_binding': r,
    'mathematical_scope': {key: value for key, value in s.items() if key not in ['worker', 'request', 'created_at_utc', 'scope', 'new_modules', 'excluded_modules']},
    'mathematical_values_recomputed': False, 'finite_domains_and_qualifications': f,
    'inherited_boundary': {
        'scope': m['import_scope'], 'pair_observation': v['dependency_hash_observation'], 'endpoints': endpoints,
        'historical_qualifications': {key: m[key] for key in boundary_keys},
        'imported_worker_memberships': m['imported_worker_memberships'],
        'named_older_comparisons': 502, 'named_older_imported': 372, 'named_older_comparison_only': 130,
        'historical_pending_or_other_status_pins': 181, 'historical_operational_pins': 2,
        'external_pairs': 16, 'historical_script_pins': 68,
        'qualification': 'All14 endpoints inherit212/195/separate19 and Window/Abel. No backlog recovery or fresh whole-source rebuild. Worker166 unreplayed prefixes and all earlier failed/partial host and source-version histories remain unchanged.',
    },
    'method_limits': m['method_limits'], 'isolation': m['isolated_checker'], 'printed_closures': m['printed_closure_summary'],
    'compiler_summary': m['compiler_attempt_summary'], 'failed_versions': failed, 'successful_version_selection': versions,
    'coverage_partition': m['coverage_partition'], 'pending_boundary': m['pending_boundary'], 'validation_stages': v['replay_audit_stages'],
    'finalization': m['retained_finalization'], 'finalizer_static_predicate': m['finalizer_static_predicate'],
    'finalizer_preparation_history': m['finalizer_preparation_history'], 'preparation_history': v['preparation_history'],
    'preservation': {
        'checks': v['checks'], 'initial_input_count': 21242, 'owned_initial_exclusions': [],
        'prior_manifest_count': 334, 'prior_controller_artifact_count': 113,
        'archive_artifacts': 128, 'manifest_entries': 353, 'indexed_logical_bytes': v['indexed_artifact_bytes'],
        'manifest_only': v['manifest_only'], 'prior_reconciliation': m['prior_reconciliation'],
        'inventory_schema_boundary': m['inventory_schema_boundary'], 'prior174_manifest_only_boundary': m['prior174_manifest_only_boundary'],
        'additional_bundle_requires_preservation': True,
        'supplemental_manifest_only_bundle': {
            'metadata': bundle, 'observation': observation, 'files': extra,
            'scope': '227 manifest-only files:223 sealed174 identity matches and4 current-request opaque caches.216pyc+11 other script/text files. Discovery is not creation; no attribution, execution or validation upgrade. Archive and older seals unchanged.',
        },
        'separate_publication_documents': v['preservation_scope']['separate_documentation_identity_only'],
    },
    'deadline_qualification': v['deadline_qualification'],
    'final_observations': {
        'validation': v['final_static_stability'], 'method': m['final_static_input_stability'],
        'late_scope': closing, 'absence_scope': v['absence_scope'],
        'absence_observation': v['final_absence_observation'], 'method_absence_observation': m['final_absence_observation'],
        'project_reads_closed': True, 'seal_extends_project_observation': False,
    },
    'crossreview': {
        'validation_reviewer': '/root/monitoring_audit/sealed136_review',
        'method_reviewer': '/root/monitoring_audit/sealed136_review/method138',
        'both_final_audit_files_only_reviews_received': True, 'necessary_corrections_remaining': [],
        'temporary_input_rechecks': rechecks, 'mathematical_support_crosscheck': v['mathematical_support_crosscheck'],
        'method_audit_helper_refinements': m['audit_helper_refinements'],
        'validation_version_parser_refinement': v['version_review_parser_refinement'],
        'pre_observation_support_rebinding': v.get('pre_observation_support_rebinding'),
        'shared_field_count': len(v['method_crosscheck']), 'inherited_pairs': v['method_pair_crosscheck'],
        'shared_input_hashes': v['method_shared_input_crosscheck'],
        'parent_helper_refinements': [
            'Pre-window stale new-module174 replay/print labels in H/S corrected to175, with transparent reviewer rebinding; source identities and status unchanged.',
            'Earlier-sealer adaptation stopped on static assertion before new helper/seal write. Fresh audit-only sealer prepared and reviewed.',
        ],
    },
    'inherited_pair_map': pairmap, 'audit_helpers': helpers, 'preservation_paths': preserve,
    'pending_required_research_execution': False, 'completion_claim': False,
}
output.write_text(json.dumps(out, indent=2, ensure_ascii=False) + '\n')
print(json.dumps({'main': files[0], 'integrity': pin(output), 'pairmap': pairmap,
                  'additional_bundle_requires_preservation': True, 'supplement_metadata': extra[:2],
                  'supplement_count': len(extra), 'preservation_file_count_including_integrity': len(preserve) + 1}, indent=2))
