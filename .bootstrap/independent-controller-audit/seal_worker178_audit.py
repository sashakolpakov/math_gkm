#!/usr/bin/env python3
"""Audit-files-only seal for closed178. No project reads or research execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000178_'
REQUEST='a45def12b7c24d888741ec0c6895391b'
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
for data in [h,s,f,v]:assert data['worker']==178 and data['request']==REQUEST
assert m['worker']==178 and m['request_id']==REQUEST
fixed={
 'mathematical_source_hashes.json':'edceb84cd60a18971bb41e7bc7a13c50a32721c1a7b5fe1915542b445212ac93',
 'source_structure_audit.json':'549f9bc0fd358b3663fe53c6c0f96d2cb06cdbc2d1810845b7945ba3a4db724b',
 'finite_domain_audit.json':'91c1ea2eb9f19c170e1f21905cea4b3c165de9611f305dbddf57034be3bd71fa',
 'manifest_only_bundle.json':'aec130bf032f9960bd29f2e5acd39c0b783e692c202fd1ae5eb5389e4bf8ceef',
 'manifest_only_observation.json':'84911036a6531e9d521ad3b5c9d9e315fe98737094fc688565b06444b74c74f9',
 'validation_audit.md':'2ce445239eeb00f310bcd6265331ae7ec96b297651cad8961662c3294f4289da',
 'validation_evidence.json':'bec9905dd5c4dcf142d95b2dbcaf357a5b64dbc9227ace829dba78bcc73940ca',
 'replay_method.md':'3bf640f1a2f51710bdda599198d4cb9babb8312f8cc7d5f76f47454961b4a946',
 'replay_method_evidence.json':'82e01bacfd5ae50d9a2837a11f9d72c2f1dd8b91d3e97f591d8ab6f9fe03a5a7',
 'inherited_pair_expectations.json':'c56850dfa1890f9b1d09472d09afd124445bf5a96572789aa1e20095087561ef',
}
for suffix,digest in fixed.items():assert pin(T/(PRE+suffix))['sha256']==digest,suffix
c=v['counts']
expected={'new_math':10,'new_theorems':38,'new_definitions':4,'new_inductives':0,
 'build_attempts':19,'successful_build_attempts':11,'rejected_builds':8,'build_timeouts':0,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'audits':1,
 'distinct_printed_closures':38,'print_rows':38,'indexed':334,'archive_artifacts':100,'controller_artifacts':100,
 'initial_entries':21553,'inherited_checked':21553,'prior177_artifacts':125,'prior177_manifest':356,'unselected_math':0}
for key,value in expected.items():assert c[key]==value,(key,c[key])
assert c['build_returncodes']=={'0':11,'1':8}
assert h['accepted_counts']==s['accepted_counts']==m['all_new_counts']=={'theorem':38,'def':4}
assert len(h['new_sources'])==len(s['new_modules'])==10
assert h['excluded_counts']==s['excluded_counts']=={}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1615.2113001346588
assert v['controller_times']['elapsed_discrepancy_seconds']==0
assert v['controller_times']['finish_minus_deadline']==-184.7886998653412
assert v['contract']['root']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert v['contract']['raw']=='cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068'
assert v['contract']['canonical']==v['contract']['request']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert v['contract']['parsed_request_matches'] is True
for key,value in v['checks'].items():
 if key in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(key,value)
 else:assert not value,(key,value)
assert v['checks']['method_independent_validation_agrees'] is True
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21553
assert all(not row['owned_excluded'] and row['current']==row['expected'] for row in v['initial_checks'])
r=h['residual_binding']
assert r['root_open'] is True and r['new_unconditional_raw_LC_region'] is r['new_unconditional_source_estimate'] is False
for key in ['UpperAdjacentMA45_proved','SharpCompleteMargin_proved','UnshiftedRatio_proved','UnshiftedAdjacent_proved','actual_raw_source_counterexample','general_weight_or_Schur_result_proved']:assert r[key] is False
assert r['specific_weight_series_and_determinants_proved'] is True
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondBandM657','OtherFourM9E2']
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is f['random_samples_regenerated'] is False
assert m['coverage_partition']['selected_replayed']['module_count']==10
assert m['coverage_partition']['selected_replayed']['counts']=={'theorem':38,'def':4}
assert all(row['module_count']==0 for key,row in m['coverage_partition'].items() if key!='selected_replayed')
assert m['isolated_checker']['sha256']=='398f69b72e9bb027c9873cf206e14848b1784cd136e716c7b1bb4b47531b80b8'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[42]
assert m['isolated_checker']['exact_prior177_retag'] is True and m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':38},'distinct':38,'rows':38}
assert m['compiler_attempt_summary']=={'attempts':19,'rc1':8,'success':11,'timeouts':0}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is versions['final_source_matching'] is True
assert versions['stage_module_counts']==versions['replay_stage_module_counts']==[10]
assert versions['validation_stage_count']==1 and versions['final_stage_modules']==10 and versions['successful_mathematical_builds']==10
assert versions['superseded_successful_current_sources']==[]
assert failed['attempt_count']==failed['rc1_count']==8 and failed['timeout_count']==0
assert all(failed[key] is True for key in ['all_differ_from_final','all_imports_unchanged','all_common_headers_unchanged','all_declaration_name_sets_unchanged'])
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[]
assert m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2754
assert m['import_scope']['selected_math_source_closure']==2764 and m['import_scope']['full_graph_nodes']==2765
assert m['import_scope']['direct_imports_including_implicit_Init']==3
assert len(h['named_older_comparisons'])==536 and sum(row['module'] in m['source_graph'] for row in h['named_older_comparisons'])==402
assert len(h['historical_pending_comparisons'])==181 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==88 and len(h['result_bindings'])==6
assert len(h['imported_libraries'])+len(h['new_imported_libraries'])+1==18
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={key:row[key] for key in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==2754 and row['Window_imported'] is row['Abel_imported'] is True
 for key,count in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:
  assert len(row[key])==count;endpoints[name][key+'_count']=count
assert len(endpoints)==10
assert f['source_experiment']['counts']=={'fractions':36,'rows':195,'coefficients':9666}
assert f['source_experiment']['polygon_triple_counts']==[25785,25785,26001]
assert f['source_experiment']['polygon_triples_total']==77571 and f['source_experiment']['zeros_saved_only']==4491
assert f['convolution']['deterministic_counts']=={'parameter_pairs':960,'low_formulas':77760,'cutoff_formulas':1920,'bounds':948,'cutoff_steps':960,'last_steps':960,'low_steps':37920,'open_steps':37920,'random_open_steps_saved':600}
assert f['pf_probe']['parameter_cases_from_empty_failure_record']==12800
schur=f['schur']['domain_counts']
for key,value in {'probe_attempts':168,'probe_distinct_parameters':168,'validation_attempts':108,'validation_distinct_parameters':105,'validation_upper_residual_attempts':99,'validation_closed_final_step_attempts':9,'probe_validation_distinct_overlap':54}.items():assert schur[key]==value
watch=h['receipt_waiting'];assert len(watch['checks'])==9 and sum(row['status']=='absent' for row in watch['checks'])==8
assert watch['checks'][-1]['sha256']=='384ee28f36c95c46052665ff4c7b2460465e1d1b99a161eca0198d67ce27d832'
assert all(b['observed_epoch']-a['observed_epoch']>=60 for a,b in zip(watch['checks'],watch['checks'][1:]))
assert all(row['requested_ms']<=59000 for row in watch['waits'])
assert m['retained_finalization']['finalizer_events']==[193,198]
assert m['retained_finalization']['final_report_event']==199 and m['retained_finalization']['turn_completed_event']==200
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True
# Final reviewer windows are retained observations; this sealer never reads project paths.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 for key in ['changed','missing','mismatches']:assert row.get(key,[])==[]
assert v['method_pair_crosscheck']['count']==2754 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert len(v['method_crosscheck'])==82 and v['method_shared_input_crosscheck']['shared_count']==378
assert v['final_static_stability']['input_count']==25421 and m['final_static_input_stability']['input_count']==394
assert v['final_static_stability']['start_utc']=='2026-10-17T06:23:29.429252+00:00'
assert v['final_static_stability']['finish_utc']=='2026-10-17T06:23:54.767858+00:00'
assert m['final_static_input_stability']['started_utc']=='2026-10-17T06:23:16.912545+00:00'
assert m['final_static_input_stability']['finished_utc']=='2026-10-17T06:23:16.960664+00:00'
assert v['final_absence_observation']['applicable'] is m['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['manifest_only_retention_supplement']==m['manifest_only_retention_supplement']==bundle
assert v['manifest_only_retention_observation']==m['manifest_only_retention_observation']==observation
assert bundle['file_count']==236 and bundle['total_bytes']==2123517
assert observation['archive_file_count']==observation['controller_file_count']==100
assert observation['manifest_count']==334 and observation['current_request_file_count']==103
closing=v['late_scope_observation']
assert closing['observed_utc']=='2026-10-17T06:23:54.795760+00:00'
for key,value in {'archive_file_count':100,'current_request_file_count':103,'manifest_count':334,'manifest_union_archive_count':336,
 'supplemental_file_count':236,'historical_manifest_only_count':233,'current_request_manifest_only_count':3,'supplemental_total_bytes':2123517}.items():assert closing[key]==value,(key,closing[key])
assert closing['late_bundle_required'] is True
assert closing['extra_current_request_paths']==['research/__pycache__/pf_probe_a45def12.cpython-314.pyc','research/__pycache__/schur_probe_a45def12.cpython-314.pyc','research/__pycache__/validate_a45def12.cpython-314.pyc']
for key in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[key]==[]
assert set(closing['manifest_only_paths'])=={row['relative_path'] for row in bundle['files']}
metadata=closing['supplemental_metadata_checks'];assert len(metadata)==472
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
assert len(rechecks['validation'])==490 and len(rechecks['method'])==258
assert pin(T/'static_audit_worker178.py')['sha256']=='a04cd16234c3fe60965b4fc05c4348010b3eedd0805da9f13a036dd9d700907b'
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+suffix)) for suffix in suffixes];assert files[0]['sha256']==sys.argv[1]
assert '## Final audit observation' in local(T/(PRE+'monitoring_audit.md')).read_text()
extra=[pin(T/(PRE+'manifest_only_bundle.json')),pin(T/(PRE+'manifest_only_observation.json'))]
assert extra[1]['path']==bundle['observation_path'] and extra[1]['sha256']==bundle['observation_sha256']
for entry in bundle['files']:
 row=pin(entry['bundle_path']);assert entry['bytes_and_selected_metadata_match'] is True and entry['source_observed']==entry['copy_observed']
 assert row['bytes']==entry['copy_observed']['bytes'] and row['sha256']==entry['copy_observed']['sha256'];extra.append(row)
assert len(extra)==238
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker178.py'),pin(Path(__file__))]
preserve=[row['path'] for row in files]+[pairmap['path']]+[row['path'] for row in helpers]+[row['path'] for row in extra]
assert len(preserve)==len(set(preserve))==249
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=[key for key in m if key.endswith('_boundary')]+['inherited_corrected_versions_scope','worker166_host_status_qualification']
out={'worker':178,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed178 audit. Sealer reads only temporary audit files, no project reread/execution, mathematics or RNG recomputation. Active179+ excluded. Earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{key:v['controller'][key] for key in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'residual_binding':r,'mathematical_scope':{key:value for key,value in s.items() if key not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{key:m[key] for key in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':536,'named_older_imported':402,'named_older_comparison_only':134,
  'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'historical_script_pins':88,'external_pairs':18,
  'qualification':'All10 endpoints inherit212/195/separate19 and Window/Abel. No backlog recovery or fresh whole-source rebuild;166hostcompleted with combinedreplaytimeout and sevenunreplayedprefixes remain distinct.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21553,'owned_initial_exclusions':[],
  'prior_manifest_count':356,'prior_controller_artifact_count':125,'archive_artifacts':100,'manifest_entries':334,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'inventory_schema_boundary':m['inventory_schema_boundary'],'prior177_manifest_only_boundary':m['prior177_manifest_only_boundary'],
  'additional_bundle_requires_preservation':True,
  'supplemental_manifest_only_bundle':{'metadata':bundle,'observation':observation,'files':extra,
   'scope':'236opaque manifest-only files:233sealed177matches and3currentcaches.225pyc+11otherfiles; noexecution,interpretation,attribution orvalidationupgrade. Originalarchive/earlierseals unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,
  'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'method_audit_helper_refinements':m['audit_helper_refinements'],
  'validation_pre_window_audit_refinements':v['pre_window_audit_refinements'],
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'parent_helper_refinements':['Primary178statichelper passedfirst run. Newsealer reviewed as text before oneexecution. No project/math/RNGexecution.']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,
 'pending_required_research_execution':False,'completion_claim':False}
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':pairmap,
 'additional_bundle_requires_preservation':True,'supplement_metadata':extra[:2],'supplement_count':len(extra),
 'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
