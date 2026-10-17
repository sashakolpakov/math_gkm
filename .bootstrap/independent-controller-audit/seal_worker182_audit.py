#!/usr/bin/env python3
"""Audit-files-only closed182 seal. No project reads or mathematical computation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000182_';REQUEST='b3eed36486ad48a08ac07be4c9b62794'
def local(x):
 p=Path(x);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(x):
 p=local(x);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
def read(x):return json.loads(local(T/(PRE+x)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');v=read('validation_evidence.json');m=read('replay_method_evidence.json');b=read('unindexed_cache_bundle.json');o=read('unindexed_cache_observation.json')
for d in [h,s,f,v,b,o]:assert d['worker']==182 and d['request']==REQUEST
assert m['worker']==182 and m['request_id']==REQUEST
# Filled with final exact hashes before final audit-files-only concurrence.
FIXED_PINS = {'markov_worker_000182_mathematical_source_hashes.json': '78dd5b13081c2ba1b85620354744a9a00d1752711f6d22ecbb8c87dc1d90dbcc', 'markov_worker_000182_source_structure_audit.json': 'b312192bf10b36d2d14cda359b43963d50739b651c728439ef97db50ad551a76', 'markov_worker_000182_finite_domain_audit.json': 'b54a41c1c1f9efbb7e151ed185ac398b4ee4c0144881e64155adcb9908369877', 'markov_worker_000182_validation_audit.md': '1d10511edee68a9812323a32203a5aed027da8a1365cb01c80b40997be99dec5', 'markov_worker_000182_validation_evidence.json': '53a1de8f35aae6917425fa50a96dc64b9e27e7c2f43ebc84d004079a6b36ea60', 'markov_worker_000182_replay_method.md': '808218193f662eeda971c5b928fb225d37f90c5a8f87599696c627335cc95bb6', 'markov_worker_000182_replay_method_evidence.json': '475b9151d90389053189e15cbcf0dc6a1297a1245d122d7d425d6f0e2012a42e', 'markov_worker_000182_inherited_pair_expectations.json': '338a24d1dcfce6483391a828870f4e909ca8b0e643066620b4440bae115fe0e2', 'markov_worker_000182_unindexed_cache_bundle.json': 'eef84f26bc07f7a948e72225db40bfd8e05fb1139f4b66f25e9f7ea471fb0b34', 'markov_worker_000182_unindexed_cache_observation.json': '10129d2e1dc5d320b74c4a91d364165f126d0cb3d897f4cdfba6a41b0692a4ea', 'static_audit_worker182.py': '0147c147f061a9f831effe0f90c5bfc524744f7654d60585a2fc7d4e5030e3e1'}
assert len(FIXED_PINS)==11
for filename,digest in FIXED_PINS.items():assert pin(T/filename)['sha256']==digest,filename
c=v['counts'];expected={'new_math':9,'new_theorems':45,'new_definitions':9,'new_inductives':0,'build_attempts':21,'successful_build_attempts':11,'rejected_builds':10,'build_timeouts':1,'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'audits':1,'distinct_printed_closures':45,'print_rows':45,'indexed':95,'archive_artifacts':97,'controller_artifacts':97,'initial_entries':21945,'inherited_checked':21945,'prior181_artifacts':81,'prior181_manifest':79,'unselected_math':0}
for k,x in expected.items():assert c[k]==x,(k,c[k])
assert h['accepted_counts']==s['accepted_counts']==m['all_new_counts']==m['coverage_partition']['selected_replayed']['counts']=={'theorem':45,'def':9}
assert len(h['new_sources'])==len(s['new_modules'])==9 and h['excluded_modules']==s['excluded_modules']==[]
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0 and v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1650.6843659877777
assert v['controller_times']['elapsed_discrepancy_seconds']==0 and v['controller_times']['finish_minus_deadline']==m['retained_timing']['finish_minus_deadline']==-149.3156340122223
assert m['retained_timing']['request_seconds']==1800
for k,x in {'root':'8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe','raw':'cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068','canonical':'6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'}.items():assert v['contract'][k]==x
assert v['contract']['parsed_request_matches'] is True and v['contract']['canonical']==v['contract']['request']
for k,x in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert x is True,(k,x)
 else:assert not x,(k,x)
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21945
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
r=h['residual_binding'];assert r==s['source_level_scope'] and r['root_open'] is r['new_unconditional_raw_LC_region'] is True
assert r['root_equivalence']=='Conjecture63 iff ThreeRemainingMB3E and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeRemainingMB3E','OtherFourM9E2','TopTemplateLCMB3E']
assert r['old212_recovery_claimed'] is r['old166_prefix_recovery_claimed'] is False
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is f['random_samples_regenerated'] is False
assert m['isolated_checker']['sha256']=='391a3f43eea2eeee74de7d847b3f262eb28030f660085f55f9ea528c7a04f7b4'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[50,54]
assert m['isolated_checker']['body_equal_prior110_after_guard_removal'] is m['isolated_checker']['exact_prior181_retag'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':45},'distinct':45,'rows':45}
assert m['compiler_attempt_summary']=={'attempts':21,'rc1':9,'success':11,'timeouts':1}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is versions['final_source_matching'] is True
assert versions['replay_stage_module_counts']==[8,9] and versions['final_stage_modules']==9
assert versions['successful_mathematical_builds']==versions['successful_selected_mathematical_builds']==10
assert versions['final_source_matching_math_builds']==9 and len(versions['superseded_successful_current_sources'])==1
assert len(s['superseded_successful_snapshots'])==1
assert versions['superseded_successful_current_sources'][0]['snapshot_sha256']==s['superseded_successful_snapshots'][0]['sha256']=='d525b263215ac06935e03df3b8c1a3be44a4265fd0f0d07c054b9c5b866906e2'
assert failed['attempt_count']==10 and failed['rc1_count']==9 and failed['timeout_count']==1 and failed['timeout_returncode_field_omitted'] is True
assert failed['all_common_headers_equal_ignoring_whitespace'] is failed['all_imports_unchanged'] is True
assert m['same_module_attempt_overlaps']==[] and m['source_mtime_overlaps']=={}
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2788
assert m['import_scope']['selected_math_source_closure']==2797 and m['import_scope']['full_graph_nodes']==2798
assert len(h['named_older_comparisons'])==576 and sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==436
assert len(h['historical_pending_comparisons'])==182 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==109 and len(h['result_bindings'])==7
assert len(h['imported_libraries'])+len(h['new_imported_libraries'])+1==18
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==2788 and row['Window_imported'] is row['Abel_imported'] is True
 for k,n in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:assert len(row[k])==n;endpoints[name][k+'_count']=n
assert len(endpoints)==9
assert f['source_experiment']['domain_counts']=={'deterministic_source_labels':38,'rows':604,'coefficients':10156,'strict_edge_positions':416}
assert f['source_experiment']['polygon_triple_counts']==[59388,59388,59888] and f['source_experiment']['polygon_triples_total']==178664
assert f['symbolic']['gap_domain_count']==250 and f['symbolic']['saved_gap_polynomial_count']==52
assert f['sturm_initial']['planned_source_domain_count']==235 and f['sturm_followup']['saved_filtered_source_rows']==232 and f['sturm_followup']['planned_template_positions']==120
assert f['edge_certificate']['terms_literal_count']==25 and f['edge_certificate']['literal_polynomial_expression_occurrences_in_final_Lean']==2
watch=h['receipt_waiting'];assert watch['request_id']==REQUEST and watch['checks'][-1]['status']=='present'
assert all(x['status']=='absent' for x in watch['checks'][:-1])
assert all(b['observed_epoch']-a['observed_epoch']>=60 for a,b in zip(watch['checks'],watch['checks'][1:]))
assert all(x['requested_ms']<=59000 for x in watch['waits'])
assert watch['checks'][-1]['sha256']=='d70c5ae38d770cef3d23e9ac81808cd7eafb6c03c9d04af2e954968d008c3c32'
assert watch['checks'][-1]['observed_utc']=='2026-10-17T07:51:14.398679+00:00'
assert watch['checks'][-1]['receipt']==v['controller']
assert m['retained_finalization']['finalizer_events']==[208] and m['retained_finalization']['final_report_event']==211 and m['retained_finalization']['turn_completed_event']==212
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True and m['retained_finalization']['evidence_report_equals_delivered'] is False
assert v['raw_validation']==m['raw_final_validation'] and set(v['raw_validation'])=={'modules','kernel_replays','axiom_audit','closures','allowed_axioms','rejected_builds','limits','completion'}
assert v['raw_validation']['kernel_replays']==['evidence/markov-b3eed364/kernel-1792223258039818000.json']
assert m['finalizer_static_predicate']['kernel_exact_selected_module_set_required'] is m['finalizer_static_predicate']['axiom_permitted_sets_asserted_by_finalizer'] is m['finalizer_static_predicate']['banned_token_scan_present'] is True
assert m['finalizer_static_predicate']['axiom_name_coverage_asserted_by_finalizer'] is False
# Closing project observations are already retained; this sealer reads T only.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert row.get(k,[])==[]
assert v['method_pair_crosscheck']['count']==2788 and v['method_pair_crosscheck']['mismatches']==[] and v['method_shared_input_crosscheck']['mismatches']=={}
assert all(x==m[k] for k,x in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is m['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['opaque_retention']==m['opaque_retention'] and v['opaque_retention']['bundle']==b and v['opaque_retention']['observation']==o
assert v['opaque_retention']['manifest_only_count']==0
assert b['file_count']==3 and b['total_bytes']==20092
assert o['archive_file_count']==o['controller_file_count']==97 and o['manifest_count']==95 and o['current_request_file_count']==100
closing=v['late_scope_observation']
for k,x in {'archive_file_count':97,'current_request_file_count':100,'manifest_count':95,'supplemental_file_count':3,'supplemental_total_bytes':20092}.items():assert closing[k]==x
assert closing['late_bundle_required'] is True and closing['manifest_only_paths']==[]
assert set(closing['extra_current_request_paths'])=={x['relative_path'] for x in b['files']}
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[k]==[]
assert len(closing['supplemental_metadata_checks'])==6 and all(x['bytes_mode_uid_gid_mtime_sha256_match'] is True for x in closing['supplemental_metadata_checks'])
assert {x['path'] for x in closing['supplemental_metadata_checks']}=={x[k] for x in b['files'] for k in ['source_path','bundle_path']}
for k,n in [('manifest','unindexed_cache_bundle.json'),('observation','unindexed_cache_observation.json')]:
 q=pin(T/(PRE+n));assert closing['supplemental_'+k+'_path']==q['path'] and closing['supplemental_'+k+'_sha256']==q['sha256']
updates={x['path']:x for x in v['post_observation_audit_only_updates']}
assert set(updates)=={str(T/(PRE+'replay_method.md')),str(T/(PRE+'replay_method_evidence.json'))}
assert len(v['post_observation_audit_only_updates'])==2
assert updates[str(T/(PRE+'replay_method.md'))]['previous_sha256']=='3a8a1fdae2b6fa74dd38d5053ae6c7f804bf4f6a565f1e997368d96d320374bc'
assert updates[str(T/(PRE+'replay_method_evidence.json'))]['previous_sha256']=='8725b3717d58bd340c299989f578e504fa553ecc22691b7530ab1643d52bc27a'
assert updates[str(T/(PRE+'replay_method.md'))]['current_sha256']=='808218193f662eeda971c5b928fb225d37f90c5a8f87599696c627335cc95bb6'
assert updates[str(T/(PRE+'replay_method_evidence.json'))]['current_sha256']=='475b9151d90389053189e15cbcf0dc6a1297a1245d122d7d425d6f0e2012a42e'
assert v['method_post_observation_audit_file_corrections']==m['post_observation_audit_file_corrections']
assert v['post_observation_method_refresh']['input_maps_and_project_windows_unchanged'] is True
assert v['post_observation_method_refresh']['changed_existing_fields']==['companion_crosscheck']
assert m['companion_crosscheck']['inherited_script_count']==109
assert m['companion_crosscheck_before_post_observation_count_correction']['inherited_script_count']==106
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,digest in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path)
   if label=='validation' and path in updates:
    u=updates[path];assert digest==u['previous_sha256'] and row['sha256']==u['current_sha256']
    row['observation_sha256']=digest;row['post_observation_audit_only_correction']=u
   else:assert row['sha256']==digest,path
   rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==22 and len(rechecks['method'])==27
assert v['final_static_stability']['input_count']==25103 and m['final_static_input_stability']['input_count']==164
assert len(v['method_crosscheck'])==92 and v['method_shared_input_crosscheck']['shared_count']==145

suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert files[0]['sha256']==sys.argv[1]
main=local(T/(PRE+'monitoring_audit.md')).read_text();assert all(x not in main for x in ['[FINAL_OBSERVATION]','[PRESERVATION_FINAL]'])
extra=[pin(T/(PRE+'unindexed_cache_bundle.json')),pin(T/(PRE+'unindexed_cache_observation.json'))]
assert extra[1]['path']==b['observation_path'] and extra[1]['sha256']==b['observation_sha256']
for x in b['files']:
 row=pin(x['bundle_path']);assert x['bytes_and_selected_metadata_match'] is True and x['source_observed']==x['copy_observed'];assert row['bytes']==x['copy_observed']['bytes'] and row['sha256']==x['copy_observed']['sha256'];extra.append(row)
assert len(extra)==5
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker182.py'),pin(Path(__file__))]
preserve=[x['path'] for x in files]+[pairmap['path']]+[x['path'] for x in helpers]+[x['path'] for x in extra];assert len(preserve)==len(set(preserve))==16
boundary_keys=[k for k in m if k.endswith('_boundary')]+['inherited_corrected_versions_scope','worker166_host_status_qualification']
out={'worker':182,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed182 audit. Sealer reads only retained temporary audit files; no project reads/programs or mathematical/RNG recomputation. Active183+ excluded; earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in ['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']},'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],'contract_serialization_scope':v['contract_serialization_scope'],'residual_binding':r,'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':576,'named_older_imported':436,'named_older_comparison_only':140,'historical_pending_or_other_status_pins':182,'historical_operational_pins':2,'historical_script_pins':109,'external_pairs':18,'qualification':'All nine endpoints inherit old212/subset195/separate19 and Window/Abel. No imported-body recovery or fresh whole-source build. Historical166 combined timeout and seven unreplayed prefixes remain distinct.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],'raw_validation':v['raw_validation'],'validation_schema_scope':v['validation_schema_scope'],
 'finalization':m['retained_finalization'],'report_version_boundary':m['report_version_boundary'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21945,'owned_initial_exclusions':[],'prior_manifest_count':79,'prior_controller_artifact_count':81,'archive_artifacts':97,'manifest_entries':95,'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],'inventory_schema_boundary':m['inventory_schema_boundary'],'additional_bundle_requires_preservation':True,'supplemental_unindexed_cache_bundle':{'metadata':b,'observation':o,'files':extra,'scope':'Three opaque unindexed/unarchived cache files, separate from prior historical supplements. No execution/decoding/creation-time attribution or validation upgrade; original archive unchanged.'},'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False,'post_observation_audit_only_updates':v['post_observation_audit_only_updates'],'post_observation_audit_only_input_recheck':v['post_observation_audit_only_input_recheck'],'post_observation_method_refresh':v['post_observation_method_refresh']},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_pre_window_audit_refinements':v['pre_window_audit_refinements'],'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],'parent_helper_refinements':h['audit_helper_corrections']+['Fresh sealer fixed-pin cardinality refined13to11 before any execution; no project data or old seal changed.','Narrow documented T-only method note/evidence correction106to109 incorporated before first execution; original observation digests/windows retained, no project rereads.'],'method_crosscheck_before_post_observation_updates':v['method_crosscheck_before_post_observation_updates'],'method_post_observation_audit_file_corrections':m['post_observation_audit_file_corrections']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(outpath),'pairmap':pairmap,'supplement_metadata':extra[:2],'supplement_count':len(extra),'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
