"""Audit-files-only integrity seal; no project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys

T = Path('/private/tmp/math_gkm_godel_20261013')
PRE = 'markov_worker_000159_'
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
assert all(d['worker'] == 159 for d in [v, m, h, s, f])
assert h['accepted_counts'] == s['accepted_counts'] == m['coverage']['successful_target_counts'] == {'theorem': 43, 'def': 16}
assert len(h['new_sources']) == len(s['new_modules']) == 12
assert len(h['named_older_comparisons']) == 253
assert h['all_named_new_match_current'] is True and h['pending_modules'] == []
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] and h['residual_binding']['both_residual_conjuncts_unproved']
assert m['coverage']['compiled_only_without_replay'] == m['coverage']['unbuilt_math_drafts'] == []
for k, x in v['checks'].items():
    if k in ['method_independent_validation_agrees', 'selected_receipts_match']:
        assert x is True, (k, x)
    elif isinstance(x, bool):
        assert x is False, (k, x)
    else:
        assert x is None or x == [] or x == {}, (k, x)
c = v['counts']
expected = {'new_math':12, 'new_theorems':43, 'new_definitions':16, 'new_abbreviations':0,
 'build_attempts':23, 'successful_build_attempts':13, 'rejected_builds':10, 'build_timeouts':0,
 'replay_attempts':1, 'successful_replays':1, 'replay_timeouts':0, 'selected_distinct':12,
 'audits':1, 'distinct_printed_closures':43, 'print_rows':43, 'indexed':105,
 'archive_artifacts':107, 'controller_artifacts':107, 'initial_entries':6629,
 'inherited_checked':6628, 'prior158_artifacts':102, 'prior158_manifest':100, 'unused_theorems':0}
for k, n in expected.items():
    assert c[k] == n, (k, c[k])
assert c['build_returncodes'] == {'0':13, '1':10}
assert v['controller']['outcome'] == 'completed' and v['controller']['returncode'] == 0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count'] == 0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count'] == 212
assert m['worker156_recovery_boundary']['new159_recovery_count'] == 0
assert len(m['worker156_recovery_boundary']['current_imported']) == 7
assert len(m['worker156_recovery_boundary']['current_outside']) == 5
assert m['import_scope']['all_inherited_pair_count'] == m['import_scope']['new_replay_base_count'] == 2533
assert m['import_scope']['new_math_source_closure'] == 2545
assert m['import_scope']['full_graph_nodes'] == 2546
assert pairs['count'] == len(pairs['entries']) == 2533
assert all(d['all_bindings_match'] for d in pairs['entries'].values())
assert v['manifest_only'] == v['extra_current'] == []
assert v['final_static_stability']['changed'] == []
assert m['final_static_input_stability']['all_unchanged'] is True
assert v['late_scope_observation']['late_bundle_required'] is False
assert f['large_shape']['counts'] == {'parameter_occurrences':1050,'unique_parameters':1047,
 'positivity_checks':80325,'lc_checks':78225,'unique_coefficient_positions':80318,
 'unique_adjacent_positions':78224,'parameter_difference_checks':461}
assert f['source_checks']['counts']['column_formula_checks'] == 2970
assert f['source_checks']['counts']['triple_total'] == 2730
assert f['difference_shape']['counts']['sum_gap_checks'] == 25520
assert m['printed_closure_summary']['axiom_sets'] == {'propext,Classical.choice,Quot.sound':43}

rechecks = {}
for label, inputs in [('validation',v['input_hashes']), ('method',m['static_input_sha256'])]:
    rows = []
    for path, expectedhash in inputs.items():
        if path.startswith(str(T) + '/'):
            row = pin(path)
            assert row['sha256'] == expectedhash, path
            rows.append(row)
    rechecks[label] = rows
suffixes = ['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json',
 'finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md',
 'replay_method_evidence.json']
files = [pin(T / (PRE + x)) for x in suffixes]
assert len(sys.argv) == 2 and files[0]['sha256'] == sys.argv[1]
main = (T / (PRE + 'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and '**Both residual predicates remain unproved.**' in main
assert 'final named-input hash observations and audit-files-only crossreview are pending' not in main
assert 'controller-before159 pins' in main
endpoints = {}
for name, r in m['endpoint_import_boundaries'].items():
    endpoints[name] = {k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in r}
    for k in ['old121_195','old121_212','old121_accepted']:
        if k in r:
            endpoints[name][k + '_count'] = len(r[k])
assert len(endpoints) == 12
assert all(r['old121_212_count'] == 212 and r['old121_195_count'] == 195 and r['old121_accepted_count'] == 19 for r in endpoints.values())
controllerfields = ['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out = {
 'worker':159, 'request':'4687d03ffe8948abad1b235a519bed69',
 'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of completed159. Final crossreview and seal use audit files only. No project/proof/checker/replay/experiment/generator/finalizer execution, mathematical-value recomputation, source edits or research help. Active160 excluded. Prior observation windows and timeout/recovery history unchanged.',
 'files':files, 'consistency':c,
 'historical_outcome':{k:v['controller'][k] for k in controllerfields},
 'controller_times':v['controller_times'], 'timing':m['retained_timing'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','scope']},
 'residual_binding':h['residual_binding'], 'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{k:f[k] for k in ['large_shape','shape_routes','difference_shape','source_checks','certificate_generation']},
 'finite_runtime_limits':f['runtime_limits'], 'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{
   'scope':m['import_scope'], 'pair_observation':v['dependency_hash_observation'],
   'endpoints':endpoints, 'old121':m['worker121_inherited_boundary'],
   'worker156':m['worker156_recovery_boundary'],
   'named_older_comparisons':253, 'named_older_in_joint_base':178, 'named_older_comparison_only':75,
   'external_pairs':9, 'window_history':m['named_older_window_boundary'],
   'worker153':m['prior153_pending_boundary'], 'corrected_versions':m['inherited_corrected_versions_scope'],
   'prior158_candidate':m['prior158_unused_candidate_boundary'],
   'qualification':'Ordinary compiled imports retain historical production/replay limits. No fresh whole-source rebuild or new body replay of inherited modules.'},
 'method_limits':m['method_limits'], 'isolation':m['isolated_checker'],
 'printed_closures':m['printed_closure_summary'], 'compiler_summary':m['compiler_attempt_summary'],
 'failed_versions':m['failed_version_qualifications'],
 'strictness_version':m['horizontal_strictness_version_boundary'],
 'finalization':m['retained_finalization'], 'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{
   'initial_snapshot':m['initial_preservation_split'], 'checks':v['checks'],
   'initial_owned_exclusions':v['initial_owned_exclusions'],
   'archive_artifacts':107, 'manifest_entries':105, 'manifest_only':v['manifest_only'],
   'prior157_cache_boundary':m['prior157_manifest_cache_boundary'],
   'prior_reconciliation':m['prior_reconciliation'], 'additional_bundle_requires_preservation':False},
 'deadline_qualification':'Completed/return0/delivered report/turn.completed. Host finish284.908847s before nominal deadline. Overlapping replay and Audit both succeed before aggregation/finalizer/report. Original artifact metadata differs from archive-copy bookkeeping. No timeout outcome upgraded.',
 'final_observations':{
   'validation':v['final_static_stability'], 'method':m['final_static_input_stability'],
   'late_scope':v['late_scope_observation'],
   'absences':v.get('final_absence_observation', {'applicable':False,
     'reason':'No pending or uncompiled candidate requires a separate exact-path absence check.',
     'new_absence_checks_performed':False}),
   'project_reads_closed':True, 'seal_extends_project_observation':False},
 'crossreview':{
   'validation_reviewer':'/root/monitoring_audit/sealed136_review',
   'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
   'both_full_body_audit_files_only_reviews_received':True,
   'final_observation_footer_and_integrity_reviewed_by_validation_reviewer':True,
   'method_reviewer_released_after_stable_note_and_full_body_concurrence':True,
   'necessary_corrections_remaining':[],
   'temporary_input_rechecks':rechecks,
   'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
   'shared_fields':v.get('method_crosscheck'), 'inherited_pairs':v.get('method_pair_crosscheck'),
   'shared_input_hashes':v.get('method_shared_input_crosscheck'),
   'audit_parser_refinement':v['audit_parser_refinement'],
   'scope_refinements':[
     'Formal resolvent and lower-source bridge are proved; Euler-substituted alternating coefficient bridge remains unproved.',
     'Actual H across3,4,5 is non-strict atj<=q; V5 and D(3,j+2),(4,j+1),(5,j) are strict atj+2<=q.',
     'Strict H generator wording was corrected before the first source build; no accepted strict version is credited.',
     'Difference identity is universal; base CrossLC and all-index difference/mixed conditions remain open.',
     'Genuine new coverage is relative to the immediate158 residual, with older overlaps retained.',
     'Old212 remains unrecovered at every endpoint;156 recovery belongs to157 only.',
     'Object pairs bind controller-before159, not the worker initial snapshot that excludes objects.',
     'The revised aggregator and finalizer have narrower predicates than independently checked saved receipts.',
     'Manifest105/archive107 has no current retention gap; historical157 cache bundle remains separate.']},
 'inherited_pair_map':pin(T / (PRE + 'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T / 'static_audit_worker159.py'), pin(Path(__file__))],
 'preservation_paths':[str(T / (PRE + x)) for x in suffixes] + [str(T / (PRE + 'inherited_pair_expectations.json')),str(T / 'static_audit_worker159.py'),str(Path(__file__))],
 'pending_required_research_execution':False, 'completion_claim':False
}
p = T / (PRE + 'audit_integrity.json')
assert not p.exists()
p.write_text(json.dumps(out, indent=2, ensure_ascii=False) + '\n')
print(json.dumps({'main':files[0], 'integrity':pin(p), 'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':False}, indent=2))
