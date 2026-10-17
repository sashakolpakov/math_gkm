"""Worker173 integrity seal: temporary audit files only, no project reads/execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000173_';REQUEST='139fed75c29240ba95427717b28c29a7'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(path):
 p=Path(path);assert p.is_relative_to(T)
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==173 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':56,'def':11}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==m['coverage']['successful_target_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']=={}
assert len(h['new_sources'])==len(s['new_modules'])==len(m['coverage']['selected_targets'])==16
assert h['excluded_modules']==s['excluded_modules']==m['coverage']['pending_math_drafts']==[]
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
for k in ['selected_not_replayed','compiled_only','rejected_only','timeout_only','unbuilt']:assert m['coverage_partition'][k]['module_count']==0
assert h['all_named_new_match_current'] is True and s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert len(h['named_older_comparisons'])==475 and len(h['historical_pending_comparisons'])==181
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==57
assert len(h['new_scripts'])==6 and len(h['saved_script_versions'])==0 and len(h['result_bindings'])==11
for k,value in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(k,value)
 elif isinstance(value,bool):assert value is False,(k,value)
 else:assert value is None or value==[] or value=={},(k,value)
c=v['counts'];expected={'new_math':16,'new_theorems':56,'new_definitions':11,'new_inductives':0,
 'all_math_theorems':56,'all_math_definitions':11,'all_math_inductives':0,'total_math':16,'unselected_math':0,
 'fully_validated_math':16,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':33,'successful_build_attempts':17,'rejected_builds':16,'build_timeouts':0,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'audits':1,'distinct_printed_closures':56,'print_rows':56,
 'indexed':142,'archive_artifacts':142,'controller_artifacts':142,'initial_entries':7340,'inherited_checked':7340,'prior172_artifacts':187,'prior172_manifest':187}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':17,'1':16}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['mathematical_resolution'] is False
assert v['controller']['report']==m['retained_finalization']['controller_report']
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1658.4703290462494
assert v['controller_times']['elapsed_discrepancy_seconds']==0 and v['controller_times']['finish_minus_deadline']==-141.5296709537506
assert m['retained_finalization']['finalizer_events']==[289] and m['retained_finalization']['final_report_event']==290 and m['retained_finalization']['turn_completed_event']==291
assert m['retained_finalization']['terminal_error'] is None and m['retained_finalization']['turn_failed_event'] is None
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True and m['retained_finalization']['final_json_absent'] is False
r=h['residual_binding'];assert r==s['source_level_scope']
for k in ['root_open','boundary_formula_is_unproved_Prop','boundary_nonnegativity_is_unproved','proposed_budget_c_equals_Q1_formally_refuted']:assert r[k] is True,k
for k in ['new_unconditional_raw_LC_region','new_vertical_or_diagonal_region','actual_raw_source_counterexample','old212_recovery_claimed',
 'old166_prefix_recovery_claimed','older_failed_versions_retroactively_recovered','q1_new_source_formula','negative_exponent_region_new_source_formula']:assert r[k] is False,k
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondThirdM964 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondThirdM964','OtherFourM9E2']
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212 and m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported212']==212
assert m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2675
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2675
assert m['import_scope']['selected_math_source_closure']==2691 and m['import_scope']['full_graph_nodes']==2692
assert m['import_scope']['direct_imports_including_implicit_Init']==4
assert m['import_scope']['direct_inherited_imports']==['MarkovFactoredRowM964','MarkovFibSecondRowMC3E','MarkovSecondJet8934']
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[67]
assert m['isolated_checker']['sha256']=='f2e304f85f1ae6d83383714316ffe3263e334d824fbacb399c4db436480d4216'
assert m['isolated_checker']['exact_prior172_retag'] is True and m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':53,'propext,Quot.sound':3},'distinct':56,'rows':56}
assert m['compiler_attempt_summary']=={'attempts':33,'rc1':16,'success':17,'timeouts':0}
versions=m['successful_version_selection'];assert versions['superseded_successful_current_sources']==[]
assert versions['one_final_source_success_per_module'] is True and versions['final_source_matching'] is True
assert versions['validation_stage_count']==1 and versions['final_stage_modules']==16
failed=m['failed_version_qualifications'];assert failed['attempt_count']==16 and failed['all_rc1'] is True
assert failed['all_headers_unchanged'] is False and failed['unchanged_header_attempt_count']==15
assert failed['changed_statement_receipt']=='build-1792208469216739000.json'
assert set(failed['changed_statement_headers'])=={'band_gain_linearM139'}
assert len(failed['changed_import_receipts'])==1 and failed['changed_import_receipts'][0]['receipt']=='build-1792209275411393000.json'
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['checks_replay_checker_hash'] is False and m['finalizer_static_predicate']['requires_exact_theorem_name_set'] is False
assert m['finalizer_static_predicate']['owned_snapshot_exceptions']==[] and m['finalizer_static_predicate']['scan_includes_comments'] is False
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==7340
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
assert v['reconciliation_prior_events_hash_field_present'] is False
assert f['source_experiment']['counts']=={'source_cases':36,'rows':211,'coefficients':11860,'raw_triples':11438,'budget_positions_if_full_length':770,'residual_adjacent_positions_if_full_length':595,'sample_rows':20,'polygon_triples':6118}
assert f['source_experiment']['zero_count_saved_only']==5320 and f['source_experiment']['zero_count_independently_recomputed'] is False
assert f['newton']['counts']=={'rows':26,'coefficient_sequences':182,'input_index_lookups':1092,'saved_newton_slots':910}
assert f['boundary']['counts']=={'rows':102,'positions_if_full_length':2652,'difference_positions':165}
assert f['budget']['counts']=={'rows':200,'positions':9900} and f['budget']['saved_original']==f['budget']['saved_reproduced']
assert f['margin']['counts']=={'rows':20179,'positions':120931} and f['margin']['saved_scope']['in_correction_support']==[]
assert f['actual_witness']['literal_source_json_agreement'] is True and f['actual_witness']['source_or_root_refutation'] is False
watch=h['receipt_waiting'];assert len(watch['checks'])==11 and sum(x['status']=='absent' for x in watch['checks'])==10
assert watch['checks'][-1]['sha256']=='b220e790beee945d904e2e8f2fa20b01874599b66fb21ecce788273ffb245d9a'
# Final reviewer observations are retained; sealer does not extend project reads.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])
assert v['final_static_stability']['input_count']==10700
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])
assert m['final_static_input_stability']['input_count']==208
assert len(v['method_crosscheck'])==74
assert v['method_pair_crosscheck']['count']==2675 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert v['method_shared_input_crosscheck']['shared_count']==195
assert v['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']=={}
assert m['final_absence_observation']['applicable'] is False and m['final_absence_observation']['paths']=={}
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==142 and v['late_scope_observation']['current_request_file_count']==144
relatives=['research/__pycache__/band_experiment_139fed75.cpython-314.pyc','research/__pycache__/validate_139fed75.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths'])==relatives
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert v['late_scope_observation'][k]==[]
assert v['opaque_cache_retention_supplement']==late and v['initial_unarchived_cache_observation']==observation
assert late['file_count']==2 and late['total_bytes']==15732
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==25 and len(rechecks['method'])==22
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
assert len(endpoints)==16 and all(row['old121_212_count']==212 for row in endpoints.values())
assert sorted(set(x['inherited_count'] for x in endpoints.values()))==[2534,2675]
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker173.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==15
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=['worker121_inherited_boundary','worker134_boundary','worker135_boundary','worker136_boundary','worker156_recovery_boundary','worker166_boundary',
 'prior153_pending_boundary','prior160_pending_kernel_boundary','prior161_unbuilt_column0_boundary','prior163_pending_pair_boundary','prior167_certificate_boundary',
 'prior168_pending_boundary','prior169_source_boundary','prior170_source_boundary','prior171_source_boundary','prior172_source_boundary',
 'named_older_window_boundary','named_older_abel_boundary','inherited_corrected_versions_scope']
out={'worker':173,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed completed worker173. Audit sealer reads temporary audit files only; no project reads/execution or mathematical-value computation. No proof/checker/replay/experiment/finalizer execution, project edit, proposer help/contact or active174+ inspection. Prior outcomes and seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'mathematical_scope':{k:value for k,value in s.items() if k not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':475,'named_older_imported':sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons']),
  'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':57,
  'qualification':'All16 endpoints inherit212/195/separate19 and Window/Abel. Selected replay trusts inherited compiled bodies. Six172 modules inherited; completed172 and failed-report171 histories unchanged. No old backlog recovery or fresh whole-source rebuild.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],
 'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':7340,'non_owned_initial_checked':7340,'owned_initial_exclusions':[],
  'prior_manifest_count':187,'prior_controller_artifact_count':187,'archive_artifacts':142,'manifest_entries':142,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'prior172_opaque_cache_boundary':m['prior172_opaque_cache_boundary'],'additional_bundle_requires_preservation':True,
  'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
   'scope':'Two manifest-matching exact-request opaque caches absent archive/controller, retained separately without interpretation/execution/process/source-version/successor attribution or validation upgrade. Archive/index unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],
  'method_absence_observation':m['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'pre_observation_support_rebinding':v['pre_observation_support_rebinding'],
  'method_audit_helper_refinements':m['audit_helper_refinements'],
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'scope_refinements':[
   'Universal actuala3 correctionband formula q>=2,k>=0,literal2j+1<=b,allnaturali; q1/d<0 remain excluded.',
   'Signed recurrence does not establish general positivity; exactdegree/positiveendpoint/zero tail do not prove no internal holes.',
   'ConditionalLC keeps s<=j,c>=0,allQnonnegative,allcoefficientbudgets andscalar margin; no new unconditionalLCregion.',
   'Actual3/221 disprovesc=Q1budget; exactpolygonvalidrawtriplehas positivegap; no source/rootrefutation.',
   'Boundarynonnegativity iff allbandnonnegativity proved; explicitboundaryformula isunprovedProp,onlyconditionalimplication.',
   '16finalmodules/56closures/11defs compiledjointlyreplayed/printed;16rejectedrc1attempts,noextra pendingmodule.',
   'FirstrejectedBandLinear changesstatement; firstSourceWitness changesimports. No superseded successfulsource.',
   'Old212/195/separate19 andWindow/Abel limits unchanged;166prefixbacklogunrecovered; ordinarycompiled-importtrust.',
   'Finite domains countedonly; coefficient/sign/zero/failurevalues savedonly. Residualtrim-dependentcountsqualified.',
   '142archive/142manifest with140common;144currentincludes2opaqueextras separatelyretained; discoverynotcreation.',
   'All7340initialinputs/187priorartifacts unchanged; hostcompletedbeforedeadline; historical171outcomeunchanged.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker173.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,'preservation_file_count_including_integrity':len(preserve)+1},indent=2))

