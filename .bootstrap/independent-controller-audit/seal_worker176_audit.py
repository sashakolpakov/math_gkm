#!/usr/bin/env python3
"""Audit-files-only integrity seal for closed176. No project reads or research execution."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013'); PRE='markov_worker_000176_'
REQUEST='be35517714ad4fa2a3e9e4312d96ce0a'
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
for data in [h,s,f,v]:assert data['worker']==176 and data['request']==REQUEST
assert m['worker']==176 and m['request_id']==REQUEST
fixed={
 'mathematical_source_hashes.json':'e7d0359489c46f6c82de5b2e7b09cc4318a5bc958643f7d18a292082aca53fc4',
 'source_structure_audit.json':'6f2a4eb5ff57de82de26e06fa2ea7fc0b94c543c694dddfc7343f453e9b52898',
 'finite_domain_audit.json':'13206ffc6548e235fdee9f1971746b0c580c0318638b86e8de34970a691b3f52',
 'manifest_only_bundle.json':'dce13533c3cbacb0d283242b2f9feaaaa0211b323a2991166e4f00de9d814225',
 'manifest_only_observation.json':'3eb8078188aeb90ff9a64526c3028c94074ecaac5d6832d128a47f85e4f1af9a',
 'validation_audit.md':'e2c86bf5100a4cef83cff86a73cec21c47c33da2e2143adc36d95a8dda4370e0',
 'validation_evidence.json':'bd18e1d2c109b1777411cb57b761fbe44e73a368b66246a0b4ed1b9dc4413282',
 'replay_method.md':'4ec71d70a1d5f40ec29b3d629f08dfb57fd8728dc413e90034bb06b35e8c12fa',
 'replay_method_evidence.json':'33e47402a593ecb5b3073f47ddab3ca291c74fe3c888b5145ac11ab510d07161',
 'inherited_pair_expectations.json':'ad623653559edac3c9b4a15ef78034cc89add956d02a3da673666f1d1106a456',
}
for suffix,digest in fixed.items():assert pin(T/(PRE+suffix))['sha256']==digest,suffix
c=v['counts']
expected={'new_math':8,'new_theorems':46,'new_definitions':8,'new_inductives':0,
 'all_math_theorems':46,'all_math_definitions':8,'all_math_inductives':0,
 'total_math':8,'fully_validated_math':8,'unselected_math':0,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':19,'successful_build_attempts':11,'rejected_builds':8,'build_timeouts':0,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'audits':2,
 'distinct_printed_closures':46,'print_rows':88,'indexed':328,'archive_artifacts':100,'controller_artifacts':100,
 'initial_entries':21355,'inherited_checked':21355,'prior175_artifacts':128,'prior175_manifest':353}
for key,value in expected.items():assert c[key]==value,(key,c[key])
assert c['build_returncodes']=={'0':11,'1':8}
assert h['accepted_counts']==s['accepted_counts']==m['all_new_counts']=={'theorem':46,'def':8}
assert len(h['new_sources'])==len(s['new_modules'])==8
assert h['excluded_counts']==s['excluded_counts']=={}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1414.709665775299
assert v['controller_times']['timestamp_difference']==1414.7096650600433
assert v['controller_times']['elapsed_discrepancy_seconds']==7.152557373046875e-07
assert v['controller_times']['finish_minus_deadline']==-385.29033493995667
assert v['contract']['root']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert v['contract']['raw']=='cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068'
assert v['contract']['canonical']==v['contract']['request']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert v['contract']['parsed_request_matches'] is True
for key,value in v['checks'].items():
 if key in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(key,value)
 else:assert not value,(key,value)
assert v['checks']['method_independent_validation_agrees'] is True
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21355
assert all(not row['owned_excluded'] and row['current']==row['expected'] for row in v['initial_checks'])
r=h['residual_binding']
assert r['root_open'] is True and r['new_unconditional_raw_LC_region'] is False and r['new_unconditional_source_estimate'] is True
assert r['SharpCompleteMargin_proved'] is False and r['SharpTopScalars_proved'] is False
assert r['conditional_is_root_equivalence'] is False and r['actual_raw_source_counterexample'] is False
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondBandM657','OtherFourM9E2']
assert s['mathematical_values_recomputed'] is False and f['mathematical_values_recomputed'] is False
assert m['coverage_partition']['selected_replayed']['module_count']==8
assert m['coverage_partition']['selected_replayed']['counts']=={'theorem':46,'def':8}
assert all(row['module_count']==0 for key,row in m['coverage_partition'].items() if key!='selected_replayed')
assert m['isolated_checker']['sha256']=='b8ea66a48749b1d1f1f299bae4d5b23d855fb0f35a1f2ff11657a6e3822df63a'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[54]
assert m['isolated_checker']['exact_prior175_retag'] is True and m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':46},'distinct':46,'rows':88}
assert m['compiler_attempt_summary']=={'attempts':19,'rc1':8,'success':11,'timeouts':0}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is True and versions['final_source_matching'] is True
assert versions['stage_module_counts']==[7,8] and versions['replay_stage_module_counts']==[8]
assert versions['validation_stage_count']==2 and versions['final_stage_modules']==8 and versions['successful_mathematical_builds']==9
superseded=versions['superseded_successful_current_sources'];assert len(superseded)==1
assert superseded[0]['module']=='MarkovSharpObstructionsMBE3' and superseded[0]['snapshot_counts']=={'theorem':7}
assert superseded[0]['final_counts']=={'theorem':8} and superseded[0]['added_final_names']==['source_three_eleven_pathMBE3']
assert superseded[0]['snapshot_sha256']=='75fb874fe2fd3959f40add01b980605c34e6a2786b09fa762bcf4eac6e3fe65e'
assert failed['attempt_count']==failed['rc1_count']==8 and failed['timeout_count']==0
assert failed['all_differ_from_final'] is True and failed['all_imports_unchanged'] is True
assert failed['changed_existing_statement_receipts']==['build-1792213183348932000.json']
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[]
assert m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2736
assert m['import_scope']['selected_math_source_closure']==2744 and m['import_scope']['full_graph_nodes']==2746
assert len(h['named_older_comparisons'])==516 and sum(row['module'] in m['source_graph'] for row in h['named_older_comparisons'])==384
assert len(h['historical_pending_comparisons'])==181 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==75 and len(h['result_bindings'])==11
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={key:row[key] for key in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==2736 and row['Window_imported'] is True and row['Abel_imported'] is True
 for key,count in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:
  assert len(row[key])==count;endpoints[name][key+'_count']=count
assert len(endpoints)==8
assert f['source_experiment']['counts']=={'source_cases':44,'rows':319,'coefficients':24055,'raw_triples':23417,'kernel_weighting_checks':23098,'uniform_bound_checks':19648,'polygon_triples':12636}
assert f['source_experiment']['zero_count_saved_only']==10781 and f['source_experiment']['zero_count_independently_recomputed'] is False
assert f['transposed_stress']['random_samples_regenerated'] is False and f['candidate']['random_samples_regenerated'] is False
assert f['transposed_stress']['counts']['deterministic_coefficient_positions']==3667104
assert f['robust']['counts']['cut_coefficient_positions']==2750328
assert f['relative_margin']['counts']=={'complete_coefficients':157440,'pair_checks':2205120}
assert f['scalar']['outputs_equal_except_seconds'] is True
assert f['candidate']['counts']['eligible_grid_scalars']==821 and f['candidate']['counts']['complete_coefficients']==11851
watch=h['receipt_waiting'];assert len(watch['checks'])==5 and sum(row['status']=='absent' for row in watch['checks'])==4
assert watch['checks'][-1]['sha256']=='33543e3df060c25c91ca328bd183ecb926791204bba67bed6a74f56e182af1e7'
assert all(b['observed_epoch']-a['observed_epoch']>=60 for a,b in zip(watch['checks'],watch['checks'][1:]))
assert all(row['requested_ms']<=59000 for row in watch['waits'])
assert m['retained_finalization']['finalizer_events']==[198]
assert m['retained_finalization']['final_report_event']==199 and m['retained_finalization']['turn_completed_event']==200
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True

# Project observations are already closed. This section checks saved audit data only.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 assert row.get('changed',[])==row.get('missing',[])==[]
assert v['final_static_stability']['input_count']==25188 and m['final_static_input_stability']['input_count']==388
assert len(v['method_crosscheck'])==79 and v['method_shared_input_crosscheck']['shared_count']==373
assert v['final_static_stability']['start_utc']=='2026-10-17T05:33:16.985012+00:00'
assert v['final_static_stability']['finish_utc']=='2026-10-17T05:33:41.899745+00:00'
assert m['final_static_input_stability']['started_utc']=='2026-10-17T05:33:00.763018+00:00'
assert m['final_static_input_stability']['finished_utc']=='2026-10-17T05:33:00.835457+00:00'
assert v['method_pair_crosscheck']['count']==2736 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is False and m['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['manifest_only_retention_supplement']==m['manifest_only_retention_supplement']==bundle
assert v['manifest_only_retention_observation']==m['manifest_only_retention_observation']==observation
assert bundle['file_count']==230 and bundle['total_bytes']==2083558
assert observation['archive_file_count']==observation['controller_file_count']==100
assert observation['manifest_count']==328 and observation['current_request_file_count']==103
closing=v['late_scope_observation']
for key,value in {'archive_file_count':100,'current_request_file_count':103,'manifest_count':328,'manifest_union_archive_count':330,
 'supplemental_file_count':230,'historical_manifest_only_count':227,'current_request_manifest_only_count':3,'supplemental_total_bytes':2083558}.items():assert closing[key]==value,(key,closing[key])
assert closing['late_bundle_required'] is True
assert closing['observed_utc']=='2026-10-17T05:33:41.921037+00:00'
assert closing['extra_current_request_paths']==['research/__pycache__/scalar_probe_be355177.cpython-314.pyc','research/__pycache__/transposed_stress_be355177.cpython-314.pyc','research/__pycache__/validate_be355177.cpython-314.pyc']
for key in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[key]==[]
assert set(closing['manifest_only_paths'])=={row['relative_path'] for row in bundle['files']}
metadata=closing['supplemental_metadata_checks'];assert len(metadata)==460
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
assert len(rechecks['validation'])==478 and len(rechecks['method'])==251
assert pin(T/'static_audit_worker176.py')['sha256']=='bc0ca2e3b0de4aa26a4f687016f152020f3621ce1baf2616c4ce17a5d93ef3b2'
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+suffix)) for suffix in suffixes];assert files[0]['sha256']==sys.argv[1]
main=local(T/(PRE+'monitoring_audit.md')).read_text();assert '## Final audit observation' in main and 'Final review remains pending' not in main
extra=[pin(T/(PRE+'manifest_only_bundle.json')),pin(T/(PRE+'manifest_only_observation.json'))]
assert extra[1]['path']==bundle['observation_path'] and extra[1]['sha256']==bundle['observation_sha256']
for entry in bundle['files']:
 row=pin(entry['bundle_path']);assert entry['bytes_and_selected_metadata_match'] is True and entry['source_observed']==entry['copy_observed']
 assert row['bytes']==entry['copy_observed']['bytes'] and row['sha256']==entry['copy_observed']['sha256'];extra.append(row)
assert len(extra)==232
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker176.py'),pin(Path(__file__))]
preserve=[row['path'] for row in files]+[pairmap['path']]+[row['path'] for row in helpers]+[row['path'] for row in extra]
assert len(preserve)==len(set(preserve))==243
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=[key for key in m if key.endswith('_boundary')]+['inherited_corrected_versions_scope']
out={'worker':176,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed176 audit. Sealer reads only temporary audit files; no project reread/execution, mathematics or RNG recomputation. Active177+ excluded. Earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{key:v['controller'][key] for key in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'residual_binding':r,'mathematical_scope':{key:value for key,value in s.items() if key not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{key:m[key] for key in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':516,'named_older_imported':384,'named_older_comparison_only':132,
  'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'historical_script_pins':75,'external_pairs':16,
  'qualification':'All8 endpoints inherit212/195/separate19 and Window/Abel. No backlog recovery or fresh whole-source rebuild;166 prefixes and historical partial/failed outcomes unchanged.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21355,'owned_initial_exclusions':[],
  'prior_manifest_count':353,'prior_controller_artifact_count':128,'archive_artifacts':100,'manifest_entries':328,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'inventory_schema_boundary':m['inventory_schema_boundary'],'prior175_manifest_only_boundary':m['prior175_manifest_only_boundary'],
  'additional_bundle_requires_preservation':True,
  'supplemental_manifest_only_bundle':{'metadata':bundle,'observation':observation,'files':extra,
   'scope':'230 opaque manifest-only files:227 sealed175 matches and3 current caches.219pyc+11 other files; no execution, interpretation, attribution or validation upgrade. Original archive and earlier seals unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,
  'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_version_parser_refinement':v['version_review_parser_refinement'],
  'validation_pre_draft_repair':v.get('pre_draft_audit_file_repair'),'validation_wrapper_normalization_refinement':v.get('wrapper_normalization_refinement'),
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'parent_helper_refinements':['Static helper first run passed. Before pinning, finite stdout binding enhanced to parse complete JSON objects within mixed output; existing full-output matches retained. No research/RNG/value execution.',
   'Initial exact guessed164 QuantitativeCut path absent; batch stopped before file content read. Named170 source then read; no broad current search.']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':pairmap,'additional_bundle_requires_preservation':True,
 'supplement_metadata':extra[:2],'supplement_count':len(extra),'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
