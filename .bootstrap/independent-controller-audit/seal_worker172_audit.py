"""Worker172 integrity seal. Audit files only; no project reads or execution."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000172_';REQUEST='9647c1ba01484705bdaa6edb4d3c7d32'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(path):
 p=Path(path);assert p.is_relative_to(T)
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==172 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':82,'def':34}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==m['coverage']['successful_target_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']=={}
assert len(h['new_sources'])==len(s['new_modules'])==len(m['coverage']['selected_targets'])==30
assert h['excluded_modules']==s['excluded_modules']==m['coverage']['pending_math_drafts']==[]
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
for k in ['selected_not_replayed','compiled_only','rejected_only','timeout_only','unbuilt']:assert m['coverage_partition'][k]['module_count']==0
assert h['all_named_new_match_current'] is True and s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert len(h['named_older_comparisons'])==445 and len(h['historical_pending_comparisons'])==181
assert sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==317
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==52
assert len(h['new_scripts'])==5 and len(h['saved_script_versions'])==4 and len(h['result_bindings'])==12
for k,value in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(k,value)
 elif isinstance(value,bool):assert value is False,(k,value)
 else:assert value is None or value==[] or value=={},(k,value)
c=v['counts'];expected={'new_math':30,'new_theorems':82,'new_definitions':34,'new_inductives':0,
 'all_math_theorems':82,'all_math_definitions':34,'all_math_inductives':0,'total_math':30,'unselected_math':0,
 'fully_validated_math':30,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':39,'successful_build_attempts':32,'rejected_builds':7,'build_timeouts':0,
 'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'audits':2,'distinct_printed_closures':82,
 'print_rows':155,'indexed':187,'archive_artifacts':187,'controller_artifacts':187,
 'initial_entries':7289,'inherited_checked':7289,'prior171_artifacts':127,'prior171_manifest':127}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':32,'1':7}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed'
assert v['controller']['returncode']==0 and v['controller']['mathematical_resolution'] is False
assert v['controller']['report']==m['retained_finalization']['controller_report']
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1326.2065389156342
assert v['controller_times']['elapsed_discrepancy_seconds']==0
assert v['controller_times']['finish_minus_deadline']==-473.79346108436584
assert m['retained_finalization']['finalizer_events']==[215]
assert m['retained_finalization']['turn_completed_event']==217 and m['retained_finalization']['final_report_event']==216
assert m['retained_finalization']['terminal_error'] is None and m['retained_finalization']['turn_failed_event'] is None
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True and m['retained_finalization']['final_json_absent'] is False
r=h['residual_binding'];assert r==s['source_level_scope']
for k in ['root_open','new_unconditional_raw_LC_region','third_two_slot_transport_proved','third_two_slot_cut_positivity_proved_in_used_domain']:assert r[k] is True,k
for k in ['new_vertical_or_diagonal_region','actual_raw_source_counterexample','old212_recovery_claimed',
 'old166_prefix_recovery_claimed','older_failed_versions_retroactively_recovered']:assert r[k] is False,k
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondThirdM964 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondThirdM964','OtherFourM9E2']
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212 and m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported212']==212
assert m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2669
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2669
assert m['import_scope']['selected_math_source_closure']==2699 and m['import_scope']['full_graph_nodes']==2701
assert m['import_scope']['direct_imports_including_implicit_Init']==5
assert m['import_scope']['direct_inherited_imports']==['MarkovCorrectionColumnsM418','MarkovSecondClosedMC3E','MarkovSecondMarginsMC3E','MarkovThirdRowFormulaMC3E']
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[105,116]
assert m['isolated_checker']['sha256']=='3005e2b1c54d6b9d4b148fe346217866539490d96d3877463473cf5342393703'
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':82},'distinct':82,'rows':155}
assert m['compiler_attempt_summary']=={'attempts':39,'rc1':7,'success':32,'timeouts':0}
versions=m['successful_version_selection'];assert versions['superseded_successful_current_sources']==[]
for k in ['common_sources_identical','finalizer_retains_both_stages','first_stage_subset_of_final','one_final_source_success_per_module']:assert versions[k] is True
assert versions['first_stage_modules']==28 and versions['final_stage_modules']==30
assert versions['added_final_stage_modules']==['MarkovCorrectionBudgetM964','MarkovFactoredRowM964']
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['compiled_object_hash_sample_after_build_selection'] is True
assert m['finalizer_static_predicate']['owned_snapshot_exceptions']==[] and m['finalizer_static_predicate']['scan_includes_comments'] is False
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==7289
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
assert v['preservation_scope']['setup_excludes_current_request_tag_in_basename'] is True
assert f['source_experiment']['counts']=={'source_cases':34,'coefficients':1895,'excluded_negative_exponent_cases':9,
 'triples':1827,'polygon_triples':967,'formula_source_cases':25,'formula_checks':1735,'two_slot_checks':1635,'endpoint_checks':25,'scalar_checks':267}
assert f['source_experiment']['zero_count_saved_only']==860 and f['source_experiment']['zero_count_independently_recomputed'] is False
assert f['band_experiment']['counts']=={'source_cases':16,'rows':162,'pretrim_raw_positions':13383,'division_steps_if_no_break':2001,
 'candidate_budget_positions_if_len_h_equals_k':960,'sample_rows':90,'candidate_scalar_positions_if_len_h_at_least2':1701}
shapes=f['generation']['literal_certificate_shapes'];assert shapes==h['certificate_literal_comparisons']==s['certificate_syntax']
assert [(x['integer_literal_count'],x['rational_literal_count'],x['coefficient_literal_count']) for x in shapes]==[(15,499,514),(15,499,514)]
assert len(f['generation']['column_syntax'])==36 and f['generation']['column_syntax']==h['column_literal_comparisons']==s['column_syntax']
watch=h['receipt_waiting'];assert len(watch['checks'])==6 and sum(x['status']=='absent' for x in watch['checks'])==5
assert watch['checks'][-1]['sha256']=='33353f78bf1fbf82c561df415109da72c491ad607e485df9e97067b05d8592b9'
# Final reviewer observations are copied; this sealer never extends project reads.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])
assert len(v['method_crosscheck'])>=66
assert v['method_pair_crosscheck']['count']==2669 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert v['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']=={}
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==187 and v['late_scope_observation']['current_request_file_count']==189
relatives=['research/__pycache__/source_experiment_9647c1ba.cpython-314.pyc','research/__pycache__/validate_9647c1ba.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths'])==relatives
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert v['late_scope_observation'][k]==[]
assert v['opaque_cache_retention_supplement']==late and v['initial_unarchived_cache_observation']==observation
assert late['file_count']==2 and late['total_bytes']==13172
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
assert '## Final audit observation' in main and 'Final review remains pending' not in main
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in row}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in row:endpoints[name][k+'_count']=len(row[k])
assert len(endpoints)==30 and all(row['old121_212_count']==212 for row in endpoints.values())
assert sorted(set(x['inherited_count'] for x in endpoints.values()))==[2659,2667,2669]
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker172.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==15
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=['worker121_inherited_boundary','worker134_boundary','worker135_boundary','worker136_boundary','worker156_recovery_boundary','worker166_boundary',
 'prior153_pending_boundary','prior160_pending_kernel_boundary','prior161_unbuilt_column0_boundary','prior163_pending_pair_boundary','prior167_certificate_boundary',
 'prior168_pending_boundary','prior169_source_boundary','prior170_source_boundary','prior171_source_boundary','named_older_window_boundary','named_older_abel_boundary',
 'inherited_corrected_versions_scope']
out={'worker':172,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed completed worker172. Audit sealer reads temporary audit files only; no project reads/execution or mathematical-value computation. No proof/checker/replay/experiment/finalizer execution, project edit, proposer help/contact or active173+ inspection. Prior outcomes and seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'mathematical_scope':{k:value for k,value in s.items() if k not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':445,'named_older_imported':317,'named_older_comparison_only':128,'historical_pending_or_other_status_pins':181,
  'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':52,
  'qualification':'All30 endpoints inherit212/195/separate19 and Window/Abel. Selected replay trusts inherited compiled bodies. Thirteen171 modules inherited; all14 predecessor products preserved without changing171 missing_or_malformed_report/return1/nullreport. No old backlog recovery or fresh whole-source rebuild.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],
 'preparation_history':v['preparation_history'],'band_scale_correction_history':m['band_scale_correction_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':7289,'non_owned_initial_checked':7289,'owned_initial_exclusions':[],
  'prior_manifest_count':127,'prior_controller_artifact_count':127,'archive_artifacts':187,'manifest_entries':187,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'prior171_opaque_cache_boundary':m['prior171_opaque_cache_boundary'],'additional_bundle_requires_preservation':True,
  'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
   'scope':'Two manifest-matching exact-request opaque caches absent archive/controller, retained separately without interpretation/execution/process/source-version/successor attribution or validation upgrade. Archive/index unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'scope_refinements':[
   'Unconditional actuala3 rawH all natural starts/zeros/smallq with3*j<=b+9; exact root iff two open residual predicates, no newV/D.',
   'Third source formula falseq>=5/trueq>=6. New two-slot weighting retains final c2 contribution; high starts>=10, low starts2..9, zero starts0/1 andsmallq all covered.',
   'General signed-Q exact identity is separate from conditional budget/LC/source transport; explicit identity, s<=j, nonnegativity, coefficient bounds andmargin retained.',
   '30 final modules/82 closures compiled/replayed/printed;7rejected snapshots, no timeout/unbuilt/superseded successfulsource. FirstTwinKernel changesv<=U tov<=U*j.',
   'Host completed0 with report216 andturn.completed217; finalizer215 precedes delivery anddeadline. Prior171 failed-report history unchanged.',
   'Old212/195/separate19 andWindow/Abel limits unchanged; seven166prefixes unrecovered; ordinary compiled-import trust.',
   'Finite source domain counts only;860zeros saved-only. Band3447trimmedcount saved-only;960budget/1701scalar counts conditional onresiduallength. Wrongscale22/1679 retained, corrected1450/251 notrawLCfailure.',
   'Two514literal margins and36column/gap expressions structurally parsed, not evaluated.',
   '187archive/187index with185common;189current includes2opaqueextras retained separately. Discovery is not creation orvalidation.',
   'All7289initial inputs and127prior manifest entries unchanged withnoownedexception. Final bounded observations do not extend older seals.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker172.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,'preservation_file_count_including_integrity':len(preserve)+1},indent=2))

