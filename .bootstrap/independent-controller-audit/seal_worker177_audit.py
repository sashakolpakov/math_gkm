#!/usr/bin/env python3
"""Audit-files-only seal for closed177. No project reads or research execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000177_'
REQUEST='09fffb56626d410db28e496da5a3241c'
def local(path):
 p=Path(path);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(path):
 p=local(path);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
def read(suffix):return json.loads(local(T/(PRE+suffix)).read_text())
assert len(sys.argv)==2
output=T/(PRE+'audit_integrity.json');assert not output.exists()
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json')
v=read('validation_evidence.json');m=read('replay_method_evidence.json')
bundle=read('manifest_only_bundle.json');observation=read('manifest_only_observation.json')
for data in [h,s,f,v]:assert data['worker']==177 and data['request']==REQUEST
assert m['worker']==177 and m['request_id']==REQUEST
fixed={
 'mathematical_source_hashes.json':'fa3b21b8ca585c8bb0c7fff2c8d86c7fd920af81d6c03630b0d55d3b3308727f',
 'source_structure_audit.json':'3fdad5624c9536923759869fc8aee7d67c77749cc7824ac0d8bf340f8e206777',
 'finite_domain_audit.json':'4bf3b5211c56af220293d7697c3717aa95be4764d015d33506e3387e8368c62c',
 'manifest_only_bundle.json':'2524f9e6596481f5098e80e84d2f50ea24bf208d70fd3edb0e7a40f299403936',
 'manifest_only_observation.json':'0885eb8e265694836537511f859b54287eb240e8ecb3fa77c68038fd128d654c',
 'validation_audit.md':'874d1d58f214394714972905c0ac613e5fd8f02b507fde239ea78a416a438389',
 'validation_evidence.json':'ef1e41145b54bc474f290b90510d9c7349ae1395ea69ce8070aa663e71676362',
 'replay_method.md':'4957edc0a66c94fe3b903b2ed7def766d8de971f803772420c455e42b9bfc6f0',
 'replay_method_evidence.json':'327fc30f55af8bce1c0b9c740427d3b514e207cec6634f27cac2cc6cb6780e6d',
 'inherited_pair_expectations.json':'f1b7271a5d30a4fe473b4a2b6c3c8e4ee8d38eb37b50b782a204c6cc5c768e76',
}
for suffix,digest in fixed.items():assert pin(T/(PRE+suffix))['sha256']==digest,suffix
c=v['counts']
expected={'new_math':12,'new_theorems':59,'new_definitions':9,'new_inductives':0,
 'all_math_theorems':59,'all_math_definitions':9,'all_math_inductives':0,
 'total_math':12,'fully_validated_math':12,'unselected_math':0,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':26,'successful_build_attempts':14,'rejected_builds':12,'build_timeouts':0,
 'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'audits':2,
 'distinct_printed_closures':59,'print_rows':105,'indexed':356,'archive_artifacts':125,'controller_artifacts':125,
 'initial_entries':21444,'inherited_checked':21444,'prior176_artifacts':100,'prior176_manifest':328}
for key,value in expected.items():assert c[key]==value,(key,c[key])
assert c['build_returncodes']=={'0':14,'1':12}
assert h['accepted_counts']==s['accepted_counts']==m['all_new_counts']=={'theorem':59,'def':9}
assert len(h['new_sources'])==len(s['new_modules'])==12
assert h['excluded_counts']==s['excluded_counts']=={}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1606.1280918121338
assert v['controller_times']['elapsed_discrepancy_seconds']==0
assert v['controller_times']['finish_minus_deadline']==-193.8719081878662
assert v['contract']['root']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert v['contract']['raw']=='cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068'
assert v['contract']['canonical']==v['contract']['request']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert v['contract']['parsed_request_matches'] is True
for key,value in v['checks'].items():
 if key in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(key,value)
 else:assert not value,(key,value)
assert v['checks']['method_independent_validation_agrees'] is True
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21444
assert all(not row['owned_excluded'] and row['current']==row['expected'] for row in v['initial_checks'])
r=h['residual_binding']
assert r['root_open'] is True and r['new_unconditional_raw_LC_region'] is False and r['new_unconditional_source_estimate'] is True
assert r['SharpTopScalars_proved'] is True
assert r['SharpCompleteMargin_proved'] is r['UnshiftedRatio_proved'] is r['UnshiftedAdjacent_proved'] is False
assert r['conditional_is_root_equivalence'] is r['actual_raw_source_counterexample'] is False
assert r['proposed_low_degree_formulas_proved'] is False
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondBandM657','OtherFourM9E2']
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is f['random_samples_regenerated'] is False
assert m['coverage_partition']['selected_replayed']['module_count']==12
assert m['coverage_partition']['selected_replayed']['counts']=={'theorem':59,'def':9}
assert all(row['module_count']==0 for key,row in m['coverage_partition'].items() if key!='selected_replayed')
assert m['isolated_checker']['sha256']=='4a06c8e6d0d942b5811688bbea79368569fd2a2ec63bd0689f857b81fae10be6'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[53,68]
assert m['isolated_checker']['exact_prior176_retag'] is True and m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':58,'propext,Quot.sound':1},'distinct':59,'rows':105}
assert m['compiler_attempt_summary']=={'attempts':26,'rc1':12,'success':14,'timeouts':0}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is True and versions['final_source_matching'] is True
assert versions['first_stage_sources_match_final'] is True
assert versions['stage_module_counts']==versions['replay_stage_module_counts']==[10,12]
assert versions['validation_stage_count']==2 and versions['final_stage_modules']==12 and versions['successful_mathematical_builds']==12
assert versions['superseded_successful_current_sources']==[]
assert failed['attempt_count']==failed['rc1_count']==12 and failed['timeout_count']==0
assert failed['all_differ_from_final'] is True and failed['all_imports_unchanged'] is True
assert failed['first_normalized_kernel_added_names_are_parser_artifact'] is True
assert failed['first_normalized_kernel_literal_plus_continuations_removed'] is True
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[]
assert m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2742
assert m['import_scope']['selected_math_source_closure']==2754 and m['import_scope']['full_graph_nodes']==2756
assert m['import_scope']['direct_imports_including_implicit_Init']==5
assert len(h['named_older_comparisons'])==524 and sum(row['module'] in m['source_graph'] for row in h['named_older_comparisons'])==390
assert len(h['historical_pending_comparisons'])==181 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==82 and len(h['result_bindings'])==13
endpoint_bases={'MarkovAbsorbedBudgetM09F':2740,'MarkovAdjacentConvolutionM09F':2742,'MarkovBaseCurvatureM09F':2739,
 'MarkovChooseGrowthM09F':2740,'MarkovCorrectionBudgetM09F':2740,'MarkovNormalizedCoefficientsM09F':2739,
 'MarkovNormalizedKernelM09F':2739,'MarkovOrderedConvolutionM09F':2742,'MarkovSharpScalarsClosedM09F':2742,
 'MarkovTopScalarM09F':2742,'MarkovWeightedSeparationM09F':2738,'MarkovZeroBandBudgetM09F':2740}
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={key:row[key] for key in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==endpoint_bases[name] and row['Window_imported'] is True and row['Abel_imported'] is True
 for key,count in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:
  assert len(row[key])==count;endpoints[name][key+'_count']=count
assert set(endpoints)==set(endpoint_bases)
assert f['source_experiment']['counts']=={'source_cases':54,'rows':449,'coefficients':36521,'raw_triples':35623,'bounds':33827,'polygon_triples':19339}
assert f['source_experiment']['zeros_saved_only']==16284 and f['source_experiment']['signs_coefficients_and_failures_recomputed'] is False
assert f['budget']['random_samples_regenerated'] is False
assert f['budget']['deterministic_grid_counts']=={'cases':13608,'clamp_zero':9108,'top_scalar_eligible':11666,'q1_auxiliary':21,'clamp_positive':4500}
assert f['budget']['random_counts_inferred_from_saved_totals_only']=={'clamp_zero':0,'clamp_positive':1000,'top_scalar_eligible':1000}
assert f['convolution']['counts']=={'parameter_pairs':1368,'individual_concavity_positions':53333,'margin_checks':105298,'ratio_steps':103930,'positive_pair_sum_checks':1497618}
assert f['q_ratio']['count']==259200 and f['q_ratio']['early_event199_count']==72450
assert f['q_low_formula']['counts']=={'interior_coefficients':181800,'boundary_coefficients':3600}
assert [x['saved_literal_terms'] for x in f['polynomial_proposals']['literal_bindings']]==[75,498]
watch=h['receipt_waiting'];assert len(watch['checks'])==9 and sum(row['status']=='absent' for row in watch['checks'])==8
assert watch['checks'][-1]['sha256']=='6446ba45d651da2231c5f0fb4874127174039d0aea79b0d7d6ee71ab9b09bf56'
assert all(b['observed_epoch']-a['observed_epoch']>=60 for a,b in zip(watch['checks'],watch['checks'][1:]))
assert all(row['requested_ms']<=59000 for row in watch['waits'])
assert m['retained_finalization']['finalizer_events']==[251,257]
assert m['retained_finalization']['final_report_event']==260 and m['retained_finalization']['turn_completed_event']==261
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True
# These records are already closed. Only audit files are read below.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 for key in ['changed','missing','mismatches']:assert row.get(key,[])==[]
assert v['final_static_stability']['input_count']==25313 and m['final_static_input_stability']['input_count']==420
assert len(v['method_crosscheck'])==81 and v['method_shared_input_crosscheck']['shared_count']==405
assert v['final_static_stability']['start_utc']=='2026-10-17T05:59:42.079521+00:00'
assert v['final_static_stability']['finish_utc']=='2026-10-17T06:00:07.493431+00:00'
assert m['final_static_input_stability']['started_utc']=='2026-10-17T05:57:49.755611+00:00'
assert m['final_static_input_stability']['finished_utc']=='2026-10-17T05:57:50.087313+00:00'
assert v['method_pair_crosscheck']['count']==2742 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is False and m['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['manifest_only_retention_supplement']==m['manifest_only_retention_supplement']==bundle
assert v['manifest_only_retention_observation']==m['manifest_only_retention_observation']==observation
assert bundle['file_count']==233 and bundle['total_bytes']==2105426
assert observation['archive_file_count']==observation['controller_file_count']==125
assert observation['manifest_count']==356 and observation['current_request_file_count']==128
closing=v['late_scope_observation']
for key,value in {'archive_file_count':125,'current_request_file_count':128,'manifest_count':356,'manifest_union_archive_count':358,
 'supplemental_file_count':233,'historical_manifest_only_count':230,'current_request_manifest_only_count':3,'supplemental_total_bytes':2105426}.items():assert closing[key]==value,(key,closing[key])
assert closing['late_bundle_required'] is True
assert closing['observed_utc']=='2026-10-17T06:00:07.514719+00:00'
assert closing['extra_current_request_paths']==['research/__pycache__/convolution_probe_09fffb56.cpython-314.pyc','research/__pycache__/normalized_probe_09fffb56.cpython-314.pyc','research/__pycache__/validate_09fffb56.cpython-314.pyc']
for key in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[key]==[]
assert set(closing['manifest_only_paths'])=={row['relative_path'] for row in bundle['files']}
metadata=closing['supplemental_metadata_checks'];assert len(metadata)==466
assert all(row['bytes_mode_uid_gid_mtime_sha256_match'] is True for row in metadata)
assert {row['path'] for row in metadata}=={row[key] for row in bundle['files'] for key in ['source_path','bundle_path']}
assert closing['supplemental_manifest_path']==str(T/(PRE+'manifest_only_bundle.json'))
assert closing['supplemental_manifest_sha256']==pin(T/(PRE+'manifest_only_bundle.json'))['sha256']
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==484 and len(rechecks['method'])==255
assert pin(T/'static_audit_worker177.py')['sha256']=='29b2cf033ba4b6390f591b5038534513201d06870143606c87d1db9740c9dba3'
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+suffix)) for suffix in suffixes];assert files[0]['sha256']==sys.argv[1]
main=local(T/(PRE+'monitoring_audit.md')).read_text();assert '## Final audit observation' in main
extra=[pin(T/(PRE+'manifest_only_bundle.json')),pin(T/(PRE+'manifest_only_observation.json'))]
assert extra[1]['path']==bundle['observation_path'] and extra[1]['sha256']==bundle['observation_sha256']
for entry in bundle['files']:
 row=pin(entry['bundle_path']);assert entry['bytes_and_selected_metadata_match'] is True and entry['source_observed']==entry['copy_observed']
 assert row['bytes']==entry['copy_observed']['bytes'] and row['sha256']==entry['copy_observed']['sha256'];extra.append(row)
assert len(extra)==235
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker177.py'),pin(Path(__file__))]
preserve=[row['path'] for row in files]+[pairmap['path']]+[row['path'] for row in helpers]+[row['path'] for row in extra]
assert len(preserve)==len(set(preserve))==246
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=[key for key in m if key.endswith('_boundary')]+['inherited_corrected_versions_scope','worker166_host_status_qualification']
out={'worker':177,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed177 audit. Sealer reads only temporary audit files; no project reread/execution, mathematics or RNG recomputation. Active178+ excluded. Earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{key:v['controller'][key] for key in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'residual_binding':r,'mathematical_scope':{key:value for key,value in s.items() if key not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{key:m[key] for key in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':524,'named_older_imported':390,'named_older_comparison_only':134,
  'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'historical_script_pins':82,'external_pairs':16,
  'qualification':'All12 endpoints inherit212/195/separate19 and Window/Abel. No backlog recovery/fresh whole-source rebuild;166 hostcompleted with combined replay timeout and seven unreplayed prefixes remain distinct.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'generator_version_boundary':m['generator_version_boundary'],
 'preservation':{'checks':v['checks'],'initial_input_count':21444,'owned_initial_exclusions':[],
  'prior_manifest_count':328,'prior_controller_artifact_count':100,'archive_artifacts':125,'manifest_entries':356,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'inventory_schema_boundary':m['inventory_schema_boundary'],'prior176_manifest_only_boundary':m['prior176_manifest_only_boundary'],
  'additional_bundle_requires_preservation':True,
  'supplemental_manifest_only_bundle':{'metadata':bundle,'observation':observation,'files':extra,
   'scope':'233 opaque manifest-only files:230 sealed176 matches and3 current caches.222pyc+11 other files; no execution, interpretation, attribution or validation upgrade. Original archive/earlier seals unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,
  'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_version_parser_refinement':v['version_review_parser_refinement'],
  'validation_pre_window_audit_refinements':v['pre_window_audit_refinements'],
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'parent_helper_refinements':['Primary static helper passed first run; no project/math/RNG execution.',
   'Exact T lookup of not-yet-rendered validation note was absent; no project scope change.',
   'Current166 hostcompleted/replaytimeout precision preserves all old sealed nested records.']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,
 'pending_required_research_execution':False,'completion_claim':False}
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':pairmap,
 'additional_bundle_requires_preservation':True,'supplement_metadata':extra[:2],'supplement_count':len(extra),
 'preservation_file_count_including_integrity':len(preserve)+1},indent=2))

