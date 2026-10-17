"""Closed164 final audit-files-only consistency seal; no project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys

T = Path('/private/tmp/math_gkm_godel_20261013')
PRE = 'markov_worker_000164_'
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
assert all(d['worker'] == 164 for d in [v, m, h, s, f])
assert h['accepted_counts'] == s['accepted_counts'] == m['coverage']['successful_target_counts'] == {'theorem': 54, 'def': 58}
assert len(h['new_sources']) == len(s['new_modules']) == 10
assert h['excluded_counts'] == s['excluded_counts'] == {'theorem': 33, 'def': 120}
assert len(h['excluded_modules']) == len(s['excluded_modules']) == 32
assert len(h['named_older_comparisons']) == 322 and h['all_named_new_match_current'] is True
assert len(h['historical_pending_comparisons']) == 3
assert h['excluded_group_counts'] == {
    'compiled_only_excluded': {'theorem': 6, 'def': 70},
    'timed_out_excluded': {'theorem': 2, 'def': 26},
    'unattempted_excluded': {'theorem': 25, 'def': 24}}
expected_partition = {'selected': (10, 54, 58), 'compiled_only': (6, 6, 70), 'timeout_only': (2, 2, 26), 'unbuilt': (24, 25, 24)}
for name, (n, th, de) in expected_partition.items():
    part = m['coverage_partition'][name]
    assert part['module_count'] == len(part['modules']) == n
    assert part['counts'] == {'theorem': th, 'def': de}
    assert all(part[k] == (name == 'selected') for k in ['full_validation', 'printed', 'replayed'])
assert m['coverage']['pending_counts'] == {'theorem': 27, 'def': 50}
assert len(m['coverage']['pending_math_drafts']) == 26
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
r = h['residual_binding']
for k in ['root_open', 'all_three_residual_conjuncts_unproved', 'new_general_zero_factor_and_centered_transport',
          'RationalPairStep_unproved', 'ParametricPairPositive_unproved', 'ReducedPairPositive_unproved',
          'rational_parametric_reduced_equivalent', 'these_auxiliary_premises_only_sufficient_for_lowerH_not_root_iff',
          'previous_zero_factor_source_ratio_cut_weighting_bridges_now_formal']:
    assert r[k] is True, k
assert r['new_raw_LC_region'] is False
for k, x in v['checks'].items():
    if k in ['method_independent_validation_agrees', 'selected_receipts_match']:
        assert x is True, (k, x)
    elif isinstance(x, bool):
        assert x is False, (k, x)
    else:
        assert x is None or x == [] or x == {}, (k, x)
c = v['counts']
expected_counts = {'new_math': 10, 'new_theorems': 54, 'new_definitions': 58, 'new_abbreviations': 0,
    'unselected_math': 32, 'compiled_only_math': 6, 'timed_out_math': 2, 'unbuilt_math': 24,
    'pending_theorems': 33, 'pending_definitions': 120, 'build_attempts': 30, 'successful_build_attempts': 18,
    'rejected_builds': 12, 'build_timeouts': 3, 'replay_attempts': 2, 'successful_replays': 2,
    'replay_timeouts': 0, 'selected_distinct': 10, 'audits': 2, 'distinct_printed_closures': 54,
    'print_rows': 80, 'indexed': 153, 'archive_artifacts': 155, 'controller_artifacts': 155,
    'initial_entries': 6806, 'inherited_checked': 6806, 'prior163_artifacts': 130, 'prior163_manifest': 128,
    'unused_theorems': 0}
for k, n in expected_counts.items():
    assert c[k] == n, (k, c[k])
assert c['build_returncodes'] == {'0': 18, '1': 9, 'None': 3}
assert v['controller']['outcome'] == 'completed' and v['controller']['returncode'] == 0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count'] == 0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count'] == 212
assert m['worker156_recovery_boundary']['new164_recovery_count'] == 0
assert m['import_scope']['new_replay_base_count'] == 2589
assert m['import_scope']['new_math_source_closure'] == 2599 and m['import_scope']['full_graph_nodes'] == 2633
assert v['final_static_stability']['all_unchanged'] is True and v['final_static_stability']['changed'] == []
assert v['final_static_stability']['input_count'] == 9980 and v['final_static_stability']['missing'] == []
assert m['final_static_input_stability']['all_unchanged'] is True and m['final_static_input_stability']['input_count'] == 270
assert v['late_scope_observation']['late_bundle_required'] is False
assert v['late_scope_observation']['archive_file_count'] == v['late_scope_observation']['current_request_file_count'] == 155
assert all(m['pending_pair_boundary']['object_absences'].values())
assert len(m['pending_pair_boundary']['object_absences']) == 52
assert all(v['final_absence_observation']['paths'].values()) and len(v['final_absence_observation']['paths']) == 52
assert m['pending_pair_boundary']['selected'] is m['pending_pair_boundary']['replayed'] is m['pending_pair_boundary']['axiom_printed'] is False
expected_finite = {'j_t_pairs': 441, 'ratio_comparisons': 9702, 'ratio_endpoint_comparisons': 1722,
    'antidiagonals': 11025, 'symmetric_pair_positions': 90699, 'global_order_comparisons': 79674,
    'zero_denominator_pairs': 53508, 'cut_parameters': 4193, 'cut_coefficients': 112609,
    'shift_coefficients': 325248, 'local_pair_comparisons': 27930}
assert f['centered_experiments']['counts'] == expected_finite
assert f['literal_serialization_counts'] == {'factor_lists': 4, 'factor_list_lengths': [22, 22, 22, 22], 'factored_extrep_terms': 20813}
assert f['generation']['factor_bridge_characters'] == 9753 and f['generation']['factor_bridge_UTF8_bytes'] == 9967
assert m['printed_closure_summary'] == {'axiom_sets': {'propext,Classical.choice,Quot.sound': 54}, 'distinct': 54, 'rows': 80}
assert m['isolated_checker']['all_explicit_selected_names_guarded'] is True and m['isolated_checker']['exact_prior163_retag'] is True
assert v['method_pair_crosscheck']['count'] == 2589 and v['method_pair_crosscheck']['mismatches'] == []
assert v['method_shared_input_crosscheck']['shared_count'] == 259 and v['method_shared_input_crosscheck']['mismatches'] == {}
assert len(v['method_crosscheck']) == 88

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
assert len(sys.argv) == 2 and files[0]['sha256'] == sys.argv[1]
main = (T / (PRE + 'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'remain to be appended' not in main
assert 'Three absent receipt observations' in main
endpoints = {}
for n, x in m['endpoint_import_boundaries'].items():
    endpoints[n] = {k: x[k] for k in ['current_count', 'current_counts', 'inherited_count', 'local_nodes'] if k in x}
    for k in ['old121_195', 'old121_212', 'old121_accepted']:
        if k in x:
            endpoints[n][k + '_count'] = len(x[k])
assert len(endpoints) == 42
selected = set(m['coverage']['successful_targets'])
small = {'MarkovZeroNormalizedMAD5', 'MarkovSymmetricCutMAD5', 'MarkovPairStepMAD5'}
assert all(x['old121_212_count'] == (212 if n in selected - small else 0) for n, x in endpoints.items())
cf = ['request_id', 'outcome', 'returncode', 'report', 'mathematical_resolution', 'elapsed_seconds', 'started', 'finished']
out = {
    'worker': 164, 'request': 'ad504da6c8b84f10b937c15cf985413e', 'sealed_at_utc': datetime.now(timezone.utc).isoformat(),
    'scope': 'Independent archive-first static audit of closed completed164. Final seal reads audit files only. No project/compiler/proof/checker/replay/experiment/Singular/generator/finalizer execution, mathematical-value computation, project edits or research assistance. Active165 and later workers excluded. Earlier seals/windows unchanged.',
    'files': files, 'consistency': c, 'historical_outcome': {k: v['controller'][k] for k in cf},
    'controller_times': v['controller_times'], 'timing': m['retained_timing'],
    'mathematical_scope': {k: x for k, x in s.items() if k not in ['worker', 'request', 'created_at_utc', 'new_modules', 'excluded_modules', 'scope']},
    'residual_binding': r, 'mathematical_values_recomputed': False,
    'finite_domains_and_qualifications': {k: f[k] for k in ['centered_experiments', 'generation', 'Singular', 'literal_serialization_counts']},
    'finite_runtime_limits': f['runtime_limits'], 'finite_event_bindings': f['event_bindings'],
    'inherited_boundary': {
        'scope': m['import_scope'], 'pair_observation': v['dependency_hash_observation'], 'endpoints': endpoints,
        'old121': m['worker121_inherited_boundary'], 'worker156': m['worker156_recovery_boundary'],
        'later_inherited_workers': {str(n): m[f'worker{n}_boundary'] for n in range(157, 164)},
        'named_older_comparisons': 322, 'named_older_in_joint_base': 237, 'named_older_comparison_only': 85,
        'external_pairs': 12, 'historical_helper_identity_pins': 10,
        'window_history': m['named_older_window_boundary'], 'abel_history': m['named_older_abel_boundary'],
        'worker153': m['prior153_pending_boundary'], 'corrected_versions': m['inherited_corrected_versions_scope'],
        'qualification': 'Seven accepted endpoints inherit old212/195/19; three accepted general endpoints avoid them. The 32 excluded drafts have minimal inherited bases and grant no selected theorem. All ten selected endpoints inherit Abel. Joint selected replay does not recover inherited bodies; original Window/Abel production and print boundaries persist. No fresh whole-source rebuild.'},
    'method_limits': m['method_limits'], 'isolation': m['isolated_checker'], 'printed_closures': m['printed_closure_summary'],
    'compiler_summary': m['compiler_attempt_summary'], 'failed_versions': m['failed_version_qualifications'],
    'coverage_partition': m['coverage_partition'], 'excluded_candidates': m['pending_pair_boundary'],
    'historical161_unbuilt_column0': m['prior161_unbuilt_column0_boundary'], 'historical160_pending_kernel': m['prior160_pending_kernel_boundary'],
    'historical163_pending_pair': m['prior163_pending_pair_boundary'], 'excluded_source_declarations': h['excluded_modules'],
    'validation_stages': m['validation_stages'], 'finalization': m['retained_finalization'], 'finalizer_static_predicate': m['finalizer_static_predicate'],
    'generator_rewrite_boundary': m['generator_rewrite_boundary'],
    'preservation': {'initial_snapshot': m['initial_preservation_split'], 'checks': v['checks'],
        'initial_owned_exclusions': v['initial_owned_exclusions'], 'current_owned_setup_included': v['initial_run_owned_included'],
        'initial_input_count': 6806, 'entries_other_than_current_setup': 6805,
        'inventory_not_creation_time_ordering': True, 'archive_artifacts': 155, 'manifest_entries': 153,
        'manifest_only': v['manifest_only'], 'prior157_cache_boundary': m['prior157_manifest_cache_boundary'],
        'prior_reconciliation': m['prior_reconciliation'], 'additional_bundle_requires_preservation': False,
        'separate_publication_documents': v['preservation_scope']['separate_documentation_identity_only']},
    'deadline_qualification': 'Completed/return0/delivered report/turn.completed. Host finish 224.81503796577454 seconds before deadline. Initial 8/26 and final 10/54 stages distinct. Sole finalizer invocation succeeds after all selected checks. Six extra compiled halves, two timeout-only halves and 24 unbuilt candidates remain excluded.',
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
            'The zero-factor extension handles nonpositive numerators at zero denominators without deleting zero cases.',
            'The exact centered cut identity, ratio/support bridges, parameterization and positive prefactor cancellation are formal.',
            'Reduced/parametric/rational positivity propositions are equivalent and unproved; they only suffice for LowerHorizontalMFEE.',
            'Actual numerator-three lower-row source transport covers both denominator residues, all natural columns and zero tails, conditionally.',
            'Inherited exact root residual and its three unproved source conjuncts remain unchanged; no new raw LC region.',
            'Natural positivity is not silently strengthened to all nonnegative rational parameters.',
            'Six compiled-only halves, two timeout-only halves and 24 unbuilt candidates remain outside selected proof coverage.',
            'Generator rewrites during two excluded half builds limit atomic-read attribution despite equal saved bytes.',
            'Singular factor output and generated expansion metadata are finite/candidate evidence, not a sign proof.',
            'Reported global-order experiment counts are adjacent inward comparisons, not every ordered pair.',
            'Generator bytes metadata are character lengths; final UTF8 lengths are separately bound.',
            'Old 212/195 backlog is globally unrecovered; three selected general endpoints avoid it; imported Abel/Window limits persist.',
            '6806 initial entries include unchanged current setup; 6805 others is not a creation-time claim.',
            'Audit imports the current validation wrapper; finite-experiment/generator scripts import no inherited project Python helper.',
            'Three absent receipt observations precede the final fourth; receipt checks were at least 60 seconds apart and individual waits at most 60 seconds.',
            'No mathematical values were recomputed; all final consistency calculations read audit files only.']},
    'inherited_pair_map': pin(T / (PRE + 'inherited_pair_expectations.json')),
    'audit_helpers': [pin(T / 'static_audit_worker164.py'), pin(Path(__file__))],
    'preservation_paths': [str(T / (PRE + x)) for x in suffixes] + [str(T / (PRE + 'inherited_pair_expectations.json')), str(T / 'static_audit_worker164.py'), str(Path(__file__))],
    'pending_required_research_execution': False, 'completion_claim': False}
p = T / (PRE + 'audit_integrity.json')
assert not p.exists()
p.write_text(json.dumps(out, indent=2, ensure_ascii=False) + '\n')
print(json.dumps({'main': files[0], 'integrity': pin(p), 'pairmap': out['inherited_pair_map'], 'additional_bundle_requires_preservation': False}, indent=2))
