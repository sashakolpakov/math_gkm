"""Worker171 integrity seal. Reads audit files only, never project material."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000171_';REQUEST='c3e5369fa14d43dbbe480d50598f6f6a'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(path):
 p=Path(path);assert p.is_relative_to(T)
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==171 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':90,'def':36}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==m['coverage']['successful_target_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']=={}
assert len(h['new_sources'])==len(s['new_modules'])==len(m['coverage']['selected_targets'])==14
assert h['excluded_modules']==s['excluded_modules']==m['coverage']['pending_math_drafts']==[]
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
for k in ['selected_not_replayed','compiled_only','rejected_only','timeout_only','unbuilt']:assert m['coverage_partition'][k]['module_count']==0
assert h['all_named_new_match_current'] is True and s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert len(h['named_older_comparisons'])==431 and len(h['historical_pending_comparisons'])==181
assert sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==304
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==46
assert len(h['new_scripts'])==6 and len(h['result_bindings'])==10
for k,value in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(k,value)
 elif isinstance(value,bool):assert value is False,(k,value)
 else:assert value is None or value==[] or value=={},(k,value)
c=v['counts'];expected={'new_math':14,'new_theorems':90,'new_definitions':36,'new_inductives':0,
 'all_math_theorems':90,'all_math_definitions':36,'all_math_inductives':0,'total_math':14,'unselected_math':0,
 'fully_validated_math':14,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':28,'successful_build_attempts':16,'rejected_builds':12,'build_timeouts':0,
 'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'audits':2,'distinct_printed_closures':90,
 'print_rows':166,'indexed':127,'archive_artifacts':127,'controller_artifacts':127,
 'initial_entries':7254,'inherited_checked':7254,'prior170_artifacts':128,'prior170_manifest':128}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':16,'1':12}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='missing_or_malformed_report'
assert v['controller']['returncode']==1 and v['controller']['report'] is None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1710.595972776413
assert v['controller_times']['timestamp_difference']==1710.5959718227386
assert v['controller_times']['elapsed_discrepancy_seconds']==9.5367431640625e-7
assert v['controller_times']['finish_minus_deadline']==-89.40402817726135
assert v['deadline_qualification']['report_precedes_deadline'] is None
assert v['deadline_qualification']['report_null'] is True
assert m['retained_finalization']['finalizer_events']==[278]
assert m['retained_finalization']['terminal_error_event']==279 and m['retained_finalization']['turn_failed_event']==280
assert m['retained_finalization']['terminal_error']['message']=='Selected model is at capacity. Please try a different model.'
assert m['retained_finalization']['final_json_absent'] is True and m['retained_finalization']['controller_report'] is None
assert m['retained_finalization']['turn_completed_event'] is None and m['retained_finalization']['final_report_event'] is None
r=h['residual_binding'];assert r==s['source_level_scope']
for k in ['root_open','new_unconditional_raw_LC_region','third_row_formula_proved','third_single_slot_obstruction_proved']:assert r[k] is True,k
for k in ['third_row_universal_LC_claimed','third_two_slot_transport_proved','third_two_slot_cut_positivity_proved','new_vertical_or_diagonal_region',
 'actual_raw_source_counterexample','old212_recovery_claimed','old166_prefix_recovery_claimed','older_failed_versions_retroactively_recovered']:assert r[k] is False,k
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondSecondMC3E and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondSecondMC3E','OtherFourM9E2']
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212 and m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported212']==212
assert m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2656
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2656
assert m['import_scope']['selected_math_source_closure']==2670 and m['import_scope']['full_graph_nodes']==2672
assert m['import_scope']['direct_imports_including_implicit_Init']==5
assert m['import_scope']['direct_inherited_imports']==['MarkovCorrectionClosedMA64','MarkovCorrectionColumnsM418','MarkovCorrectionFactorMDB2','MarkovMarginCertificateMA64']
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[107,126]
assert m['isolated_checker']['sha256']=='cf2fbd2f8ff27e955e94c86b693137d0fcbe8938cd499e298a6892b5078ca207'
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':90},'distinct':90,'rows':166}
assert m['compiler_attempt_summary']=={'attempts':28,'rc1':12,'success':16,'timeouts':0}
versions=m['successful_version_selection'];assert versions['superseded_successful_current_sources']==[]
for k in ['common_sources_identical','finalizer_retains_both_stages','first_stage_subset_of_final','one_final_source_success_per_module']:assert versions[k] is True
assert versions['first_stage_modules']==11 and versions['final_stage_modules']==14
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['compiled_object_hash_sample_after_build_selection'] is True
assert m['finalizer_static_predicate']['owned_snapshot_exceptions']==[] and m['finalizer_static_predicate']['scan_includes_comments'] is False
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==7254
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
assert v['preservation_scope']['setup_excludes_current_request_tag_in_basename'] is True
assert f['source_experiment']['counts']=={'source_cases':22,'coefficients':1243,'excluded_negative_exponent_cases':5,'triples':1199,'polygon_triples':672,'formula_source_cases':17,'formula_comparisons':1174,'sample_cases':6}
assert f['third_experiment']['counts']=={'attempted_residue_cases':12,'source_cases':11,'coefficients':487,'triples':465,'edge_checks':11,'excluded_negative_exponent_cases':1}
assert f['two_slot_experiment']['counts']=={'attempted_residue_cases':18,'admissible_residue_cases':17,'excluded_negative_exponent_cases':1,'residue_cases_with_t':11,'parameters':90,'weighted_comparisons':90,'cut_coefficients':28716}
assert f['source_experiment']['zero_count_saved_only']==527 and f['third_experiment']['zero_count_saved_only']==230
assert f['source_experiment']['zero_count_independently_recomputed'] is f['third_experiment']['zero_count_independently_recomputed'] is False
shapes=f['generation']['literal_certificate_shapes'];assert shapes==h['certificate_literal_comparisons']==s['certificate_syntax']
assert [(x['integer_literal_count'],x['rational_literal_count'],x['coefficient_literal_count']) for x in shapes]==[(20,314,334),(35,101,136),(22,312,334),(30,106,136)]
assert len(f['generation']['column_syntax'])==24 and f['generation']['column_syntax']==h['column_literal_comparisons']==s['column_syntax']
assert f['output_event_bindings'][0]['summary_event']==200
watch=h['receipt_waiting'];assert len(watch['receipt_only_checks'])==9 and sum(x['status']=='absent' for x in watch['receipt_only_checks'])==8
assert watch['receipt_only_checks'][-1]['sha256']=='92e4d17bf87b2f0b6b1e53cccd37e873dd209a9129e5d0aceebaf7f7deded987'
# Final reviewer observations; the sealer does not repeat or extend project reads.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])==10457
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])==196
assert len(v['method_crosscheck'])==73 and v['method_shared_input_crosscheck']['shared_count']==182
assert v['method_pair_crosscheck']['count']==2656 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert v['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']=={}
assert all(v['final_report_absence_observation']['paths'].values()) and len(v['final_report_absence_observation']['paths'])==5
assert all(m['final_report_absence_observation']['paths'].values()) and len(m['final_report_absence_observation']['paths'])==5
assert v['final_report_absence_observation']['paths']==m['final_report_absence_observation']['paths']
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==127 and v['late_scope_observation']['current_request_file_count']==129
relatives=['research/__pycache__/source_experiment_c3e5369f.cpython-314.pyc','research/__pycache__/validate_c3e5369f.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths'])==relatives
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert v['late_scope_observation'][k]==[]
assert v['opaque_cache_retention_supplement']==late and v['initial_unarchived_cache_observation']==observation
assert late['file_count']==2 and late['total_bytes']==11437
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 assert len(rows)=={'validation':22,'method':23}[label]
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
assert len(endpoints)==14 and all(row['old121_212_count']==212 for row in endpoints.values())
assert sorted(set(x['inherited_count'] for x in endpoints.values()))==[2532,2646,2656]
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker171.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==15
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=['worker121_inherited_boundary','worker134_boundary','worker135_boundary','worker136_boundary','worker156_recovery_boundary','worker166_boundary',
 'prior153_pending_boundary','prior160_pending_kernel_boundary','prior161_unbuilt_column0_boundary','prior163_pending_pair_boundary','prior167_certificate_boundary',
 'prior168_pending_boundary','prior169_source_boundary','prior170_source_boundary','named_older_window_boundary','named_older_abel_boundary','inherited_corrected_versions_scope']
out={'worker':171,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed partial worker171. Host missing_or_malformed_report/return1/nullreport retained despite successful final mathematical checks. Sealer reads temporary audit files only. No project execution/reads, mathematical-value computation, proof/checker/replay/experiment/generator/finalizer execution, project edit or proposer help/contact. Active172 and later excluded; older seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'mathematical_scope':{k:value for k,value in s.items() if k not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':431,'named_older_imported':304,'named_older_comparison_only':127,'historical_pending_or_other_status_pins':181,
  'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':46,
  'qualification':'All14 endpoints inherit212/195/separate19 and Window/Abel. New replay trusts inherited compiled bodies; seven worker166 prefixes remain unreplayed. All12 worker170 final modules inherited; no earlier failure or superseded body upgraded. No fresh whole-source rebuild.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],
 'report_absence_boundary':m['report_absence_boundary'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':7254,'non_owned_initial_checked':7254,'owned_initial_exclusions':[],
  'prior_manifest_count':128,'prior_controller_artifact_count':128,'archive_artifacts':127,'manifest_entries':127,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'prior170_opaque_cache_boundary':m['prior170_opaque_cache_boundary'],'additional_bundle_requires_preservation':True,
  'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
   'scope':'Two manifest-matching exact-request opaque caches absent archive/controller, retained separately without interpretation/execution/process/source-version/successor attribution or validation upgrade. Original archive/index unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],
  'report_absence_observation':v['final_report_absence_observation'],
  'method_report_absence_observation':m['final_report_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'scope_refinements':['All actual numerator-three H triples with3*j<=b+6, every natural start/zeros/smallq. Root iff two open predicates; no newV/D.',
   'Second-row formula falseq>=3/trueq>=4; third-row formula falseq>=5/trueq>=6. Exponent restrictions not extrapolated.',
   'Generic last-slot perturbation theorem retains explicit complete/border margins. Actual second-row margins and weights are proved; no residual source premise.',
   'Third single-slot obstruction applies every real correction at its edge; not a sourceLC refutation. Two-slot bridge/positivity remain finite-only.',
   '14 final modules/90 closures compiled, jointly replayed and printed;12 rejected snapshots retained, no timeout or unbuilt current module. No superseded successful source.',
   'Host missing_or_malformed_report/return1/nullreport remains historical. Successful finalizer278 precedes capacityerror279 and turn.failed280; not a timeout.',
   'Old212/195/separate19, seven166prefixes and Window/Abel limits unchanged; expectedobjects derive sealed/controller-before maps, not workerinitialsnapshot.',
   'Finite domains recounted only;527 and230 zeros retained as reported values. Source/third stdout omits sample/edge arrays; event200 is a summary projection.',
   'Four margin and24 column/gap expressions parsed structurally, not evaluated. Degree-five proposal failure is not a rawsource counterexample.',
   '127 archive/127 index with125 common;129 current includes2 opaque extras retained separately. Discovery is not creation or validation.',
   'All7254 initial inputs and128 prior manifest entries unchanged, no owned exemption; bounded final windows/report absences do not extend old history.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker171.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
