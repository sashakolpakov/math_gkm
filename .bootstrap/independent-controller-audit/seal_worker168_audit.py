"""Closed168 final audit-files-only seal. No project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000168_'
REQUEST='418bcc643df14f6f8cfd3b6b16eb3aef'
def read(suffix):return json.loads((T/(PRE+suffix)).read_text())
def pin(path):
 path=Path(path);assert path.is_relative_to(T)
 b=path.read_bytes();return {'path':str(path),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json')
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json')
pairs=read('inherited_pair_expectations.json');late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==168 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':61,'def':27};excluded={'theorem':16,'def':12}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']==excluded
assert len(h['new_sources'])==len(s['new_modules'])==10
assert len(h['excluded_modules'])==len(s['excluded_modules'])==2
assert len(h['named_older_comparisons'])==388 and len(h['historical_pending_comparisons'])==179
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==16
assert h['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['column0_literal_comparison']['literal_renaming_comparison_passed'] is True
assert h['column0_literal_comparison']['original_source_column0_theorem_ported'] is False
assert m['column0_renamed_identity_boundary']['old_imported'] is False
assert all(m['column0_renamed_identity_boundary']['normalized_blocks_equal_after_rename'].values())
assert m['coverage']['successful_target_counts']==counts
assert len(m['coverage']['successful_targets'])==len(m['coverage']['selected_targets'])==10
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
assert m['coverage_partition']['timeout_only']['counts']=={'theorem':12,'def':12}
assert m['coverage_partition']['unbuilt']['counts']=={'theorem':4}
assert m['coverage_partition']['timeout_only']['full_validation'] is False
assert m['coverage_partition']['unbuilt']['full_validation'] is False
for k in ['selected_not_replayed','compiled_only','rejected_only']:assert m['coverage_partition'][k]['module_count']==0
for key,value in v['checks'].items():
 if key in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(key,value)
 elif isinstance(value,bool):assert value is False,(key,value)
 else:assert value is None or value==[] or value=={},(key,value)
c=v['counts'];expected={'new_math':10,'new_theorems':61,'new_definitions':27,'new_inductives':0,
 'all_math_theorems':77,'all_math_definitions':39,'all_math_inductives':0,'total_math':12,'unselected_math':2,
 'fully_validated_math':10,'compiled_only_math':0,'timeout_only_math':1,'unbuilt_math':1,
 'build_attempts':19,'successful_build_attempts':11,'rejected_builds':8,'build_timeouts':2,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'audits':1,'distinct_printed_closures':61,
 'print_rows':61,'indexed':116,'archive_artifacts':114,'controller_artifacts':114,
 'initial_entries':7138,'inherited_checked':7136,'prior167_artifacts':124,'prior167_manifest':123}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':11,'1':6,'None':2}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed'
assert v['controller']['returncode']==0 and v['controller']['report'] is not None
assert v['controller']['report']['completion'] is None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1633.0466740131378
assert v['controller_times']['finish_minus_deadline']==-166.95332598686218
assert v['deadline_qualification']['report_precedes_deadline'] is True
assert v['deadline_qualification']['report_mtime_precedes_deadline_seconds']==213.9446680545807
r=h['residual_binding']
for k in ['root_open','new_unconditional_raw_horizontal_region','all_three_residual_conjuncts_unproved',
 'AbsorbedMiddleM418_unproved','boundary_h_equals_t_positivity_unproved','boundary_certificate_two_timeouts',
 'boundary_source_candidate_unbuilt']:assert r[k] is True,k
for k in ['actual_raw_source_counterexample','old212_recovery_claimed','old166_prefix_recovery_claimed',
 'old161_column0_whole_module_recovery_claimed']:assert r[k] is False,k
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195
assert m['worker121_inherited_boundary']['imported212']==212
assert m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2616
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2616
assert m['import_scope']['selected_math_source_closure']==2626 and m['import_scope']['full_graph_nodes']==2629
assert m['import_scope']['direct_imports_including_implicit_Init']==9
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[88]
assert m['isolated_checker']['exact_prior167_retag'] is True
assert m['isolated_checker']['sha256']=='9812df00f75e49a1d3bf86b348f90a40dfcc13c8f5ac06784baa4fa97a83e7ac'
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':61},'distinct':61,'rows':61}
assert m['compiler_attempt_summary']=={'attempts':19,'rc1':6,'success':11,'timeouts':2}
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['compiled_object_hash_sample_after_build_selection'] is True
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert len(v['initial_owned_exclusions'])==2 and len(v['initial_checks'])==7138
assert sum(not x['owned_excluded'] for x in v['initial_checks'])==7136
assert len([x for x in v['initial_owned_exclusions'] if x['current']!=x['expected']])==1
assert [x['path'] for x in v['initial_owned_exclusions'] if x['current']!=x['expected']]==['research/markov-418bcc64-checkpoint.md']
assert f['source_experiment']['counts']=={'source_cases':128,'triples':13312,'polygon_triples':8256,
 'window_triples':3481,'formula_source_cases':126,'coefficients':13545,'index_zero_region_positions':5040}
assert f['correction_probe']['counts']['coefficient_slots']==180310
assert f['early_absorbed_probe']['counts']['coefficient_slots']==226872
assert f['clamped_probe']['counts']['coefficient_slots']==1394328
assert f['clamped_probe']['counts']['identities']==5658
assert f['q_probe']['counts']['coefficient_slots']==129360
assert f['symbolic_probe']['counts']['gap_polynomials']==3458
assert f['symbolic_probe']['saved_record']['coefficients']==76804
assert f['polynomial_probe']['rows']==76 and f['polynomial_probe']['unique_parameter_rows']==73
assert len(f['event_bindings'])==7 and all(x['complete_JSON_matches'] for x in f['event_bindings'])
assert f['gap_boundary_records']['export_stdout_console_identical'] is True
assert len(f['gap_boundary_records']['export_literal_inventory'])==12
# Final bounded observations are read from audit evidence, never rerun by this sealer.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])
assert v['method_pair_crosscheck']['count']==2616 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert len(v['method_crosscheck'])==68 and v['method_shared_input_crosscheck']['shared_count']==162
assert v['final_static_stability']['input_count']==10265
assert m['final_static_input_stability']['input_count']==176
assert v['final_absence_observation']['applicable'] is True
assert len(v['final_absence_observation']['paths'])==4
assert all(v['final_absence_observation']['paths'].values())
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==114
assert v['late_scope_observation']['current_request_file_count']==118
relatives=['research/__pycache__/'+x+'_418bcc64.cpython-314.pyc' for x in
 ['correction_polynomials','correction_probe','generate_boundary','validate']]
assert sorted(v['late_scope_observation']['extra_current_request_paths'])==relatives
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:
 assert v['late_scope_observation'][k]==[]
assert v['opaque_cache_retention_supplement']==late
assert v['initial_unarchived_cache_observation']==observation
assert late['file_count']==4 and late['total_bytes']==24578
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json',
 'validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
extra=[pin(T/(PRE+'late_cache_bundle.json')),pin(T/(PRE+'unarchived_cache_observation.json'))]
extra.extend(pin(T/(PRE+'late_cache_bundle')/rel) for rel in relatives)
assert extra[1]['path']==late['observation_path'] and extra[1]['sha256']==late['observation_sha256']
by_rel={x['relative_path']:x for x in late['files']}
for rel,row in zip(relatives,extra[2:]):
 cache=by_rel[rel];assert cache['bundle_path']==row['path'] and cache['bytes_and_selected_metadata_match'] is True
 assert cache['source_observed']==cache['copy_observed']
 assert row['bytes']==cache['copy_observed']['bytes'] and row['sha256']==cache['copy_observed']['sha256']
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'observations and audit-files-only concurrence are pending' not in main
assert '**English scope correction:**' in main
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in row}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in row:endpoints[name][k+'_count']=len(row[k])
assert len(endpoints)==12 and all(row['old121_212_count']==212 for row in endpoints.values())
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),
 str(T/'static_audit_worker168.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==17
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':168,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed completed168. Seal reads audit files only. No project execution/reads, proof/checker/replay/experiment/generator/finalizer/CAS execution or mathematical-value recomputation. No project edits or research help. Active169 and later excluded; earlier seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':h['receipt_waiting'],
 'root_contract_binding':v['contract'],
 'mathematical_scope':{k:value for k,value in s.items() if k not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{k:f[k] for k in ['source_experiment','correction_probe','early_absorbed_probe',
 'clamped_probe','q_probe','symbolic_probe','polynomial_probe','gap_boundary_records']},
 'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
 'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker166':m['worker166_boundary'],
 'worker134':m['worker134_boundary'],'worker135':m['worker135_boundary'],'worker136':m['worker136_boundary'],
 'worker167':m['prior167_certificate_boundary'],'imported_worker_memberships':m['imported_worker_memberships'],
 'named_older_comparisons':388,'named_older_imported':264,'named_older_comparison_only':124,
 'historical_pending_or_other_status_pins':179,'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':16,
 'window_history':m['named_older_window_boundary'],'abel_history':m['named_older_abel_boundary'],
 'corrected_versions':m['inherited_corrected_versions_scope'],'column0':m['column0_renamed_identity_boundary'],
 'qualification':'All twelve mathematical endpoints inherit old212/195/separate19 and Window/Abel. Ten selected168 modules replayed; inherited bodies retain compiled trust. Twelve accepted167 modules imported, LowerCross/Data outside. Seven166 prefixes remain outside/unrecovered. Renamed Column0 identity newly validated, no whole old module recovery. No fresh whole-source build or historical print upgrade.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],
 'precompiler_wrapper_failure':m['precompiler_wrapper_failure'],'coverage_partition':m['coverage_partition'],
 'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'finalizer_repair_history':m['finalizer_repair_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':7138,'non_owned_initial_checked':7136,
 'owned_initial_exclusions':v['initial_owned_exclusions'],'prior_manifest_count':123,'prior_controller_artifact_count':124,
 'archive_artifacts':114,'manifest_entries':116,'indexed_logical_bytes':v['indexed_artifact_bytes'],
 'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
 'prior167_opaque_cache_boundary':m['prior167_opaque_cache_boundary'],'additional_bundle_requires_preservation':True,
 'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
 'scope':'Four manifest-matching exact-request opaque caches absent archive/controller. No bytecode interpretation, execution, source-version/process/successor attribution or validation upgrade. Original archive/index unchanged; preserve separately.'},
 'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
 'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],
 'absence_observation':v['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
 'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
 'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
 'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
 'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],
 'shared_input_hashes':v['method_shared_input_crosscheck'],
 'scope_refinements':['Actual numerator-three first correction row q+1: all starts i<=6 or i>d+2, both families and zeros; all startsq<=5.',
 'Exact root keeps three open residuals; endpoints and earlier numerator families are not newly open clauses.',
 'Absorbed natural subtraction clamps before real cast; all-cut/middle positivity and h=t scalar signs remain conditional.',
 'Boundary certificate twice timed out, Source candidate unbuilt; CAS/generator evidence grants no formal positivity.',
 'Weighted augmented coefficient obstruction coexists with a formal positive raw source gap; no root refutation.',
 'Ten selected modules/61 theorem closures compiled/replayed/printed; no accepted new module omitted from replay.',
 'Old212/195 and seven166 prefixes unrecovered; renamed Column0 identity does not recover the old module.',
 'Coefficient finite domain q2..64 differs from triple q1..64; dynamic symbolic coefficient count is reported only.',
 'Owned checkpoint finalizer repair preserves identical validation and all7136nonowned inputs; no inherited relaxation.',
 'Four manifested opaque caches separately retained;118current versus114archive, no attribution or validation upgrade.',
 'All seal consistency work reads temporary audit files only; no project or mathematical execution.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T/'static_audit_worker168.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,
 'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
