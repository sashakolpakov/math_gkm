#!/usr/bin/env python3
"""Audit-files-only seal for closed181; no project reads, execution or mathematical recomputation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000181_';REQUEST='5bf6837d0c5b4b818f68c99f57ad498a'
def local(x):
 p=Path(x);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(x):
 p=local(x);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
def read(x):return json.loads(local(T/(PRE+x)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');v=read('validation_evidence.json');m=read('replay_method_evidence.json')
b=read('unindexed_cache_bundle.json');o=read('unindexed_cache_observation.json')
for d in [h,s,f,v,b,o]:assert d['worker']==181 and d['request']==REQUEST
assert m['worker']==181 and m['request_id']==REQUEST
# Exact final pins and observation assertions are populated before final concurrence.
fixed={'mathematical_source_hashes.json': '2812de764b00a12ff14a38203b1f33c6b8ba08bd2c20f0cef8adc0a732a12273', 'source_structure_audit.json': '6dbd52ef3b0e8973086f14ff0fd7a1f290d713dd7cd8bec7dd32b8151836ae97', 'finite_domain_audit.json': '5d5300710a48fa6aad5442a48d118a319affc4a41d82d4c4b602348c7a51b640', 'unindexed_cache_bundle.json': '4bca7c2468d04d3f05aa921f5792f603fd054a4c0e2c1ddf1bffabfcaa16d202', 'unindexed_cache_observation.json': '53abb8f620456b6943359bb08890dc7415325239501cd7a1a3e1316dcf306391',
 'replay_method.md':'51c750337cccde7a4b2e9745f74c87c1ed4211f28db4042a34da39654c6da6ba',
 'replay_method_evidence.json':'97909e22a17f4e955fc22a53dd58a080027cdbd10f8209624ad5d5c1b305ea0a',
 'inherited_pair_expectations.json':'0b8daed633429d4ce0052e01e5bf2bb4a6c0c226037ff4267d3d9850d54eb258',
 'validation_audit.md':'21a394a68431250d68d0469adc25a7382f5bad54692c5ef9665df1909bf762a7',
 'validation_evidence.json':'ae1343b46b0d55a110d2e356f46b1624c17581401c737d8cf8e4767ec2571710',
}
for name,digest in fixed.items():assert pin(T/(PRE+name))['sha256']==digest,name
c=v['counts'];expected={'new_math': 8, 'new_theorems': 39, 'new_definitions': 8, 'new_inductives': 0, 'build_attempts': 16, 'successful_build_attempts': 9, 'rejected_builds': 7, 'build_timeouts': 0, 'replay_attempts': 1, 'successful_replays': 1, 'replay_timeouts': 0, 'audits': 1, 'distinct_printed_closures': 39, 'print_rows': 39, 'indexed': 79, 'archive_artifacts': 81, 'controller_artifacts': 81, 'initial_entries': 21874, 'inherited_checked': 21874, 'prior180_artifacts': 112, 'prior180_manifest': 110, 'unselected_math': 0}
for k,x in expected.items():assert c[k]==x,(k,c[k])
assert h['accepted_counts']==s['accepted_counts']==m['all_new_counts']==m['coverage_partition']['selected_replayed']['counts']=={'theorem':39,'def':8}
assert len(h['new_sources'])==len(s['new_modules'])==8 and h['excluded_modules']==s['excluded_modules']==[]
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0 and v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1063.704658985138 and v['controller_times']['timestamp_difference']==1063.7046580314636
assert v['controller_times']['elapsed_discrepancy_seconds']==9.5367431640625e-07 and v['controller_times']['finish_minus_deadline']==m['retained_timing']['finish_minus_deadline']==-736.2953419685364
assert m['retained_timing']['request_seconds']==1800
for k,x in {'root':'8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe','raw':'cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068','canonical':'6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'}.items():assert v['contract'][k]==x
assert v['contract']['parsed_request_matches'] is True and v['contract']['canonical']==v['contract']['request']
for k,x in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert x is True,(k,x)
 else:assert not x,(k,x)
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21874
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
r=h['residual_binding'];assert r==s['source_level_scope'] and r['root_open'] is True
for k in ['new_unconditional_raw_LC_region','UpperAdjacentMA45_proved','PositiveParameterTailM1C6_proved','UnshiftedAdjacentM09F_proved','UnshiftedRatioM09F_proved','SharpCompleteMargin_proved']:assert r[k] is True
for k in ['new_unconditional_source_estimate','actual_raw_source_counterexample','old212_recovery_claimed','old166_prefix_recovery_claimed']:assert r[k] is False
assert r['root_equivalence']=='Conjecture63 iff ThreeUpperResidualM5BF and OtherFourM9E2'
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is f['random_samples_regenerated'] is False
assert m['isolated_checker']['sha256']=='560d974ecd228cba7bf08f8bada902c7a27f4934256ba6efe70855cdfde255df'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[47]
assert m['isolated_checker']['body_equal_prior110_after_guard_removal'] is m['isolated_checker']['exact_prior180_retag'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':39},'distinct':39,'rows':39}
assert m['compiler_attempt_summary']=={'attempts':16,'rc1':7,'success':9,'timeouts':0}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is versions['final_source_matching'] is True
assert versions['replay_stage_module_counts']==[8] and versions['validation_stage_count']==1 and versions['final_stage_modules']==8
assert versions['successful_mathematical_builds']==versions['successful_selected_mathematical_builds']==8 and versions['superseded_successful_current_sources']==[]
assert failed['attempt_count']==failed['rc1_count']==7 and failed['timeout_count']==0
assert failed['all_common_headers_equal_ignoring_whitespace'] is True and failed['removed_names']==failed['added_final_theorems']==[]
assert m['same_module_attempt_overlaps']==[] and m['source_mtime_overlaps']=={}
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2782
assert m['import_scope']['selected_math_source_closure']==2790 and m['import_scope']['full_graph_nodes']==2791
assert len(h['named_older_comparisons'])==568 and sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==430
assert len(h['historical_pending_comparisons'])==182 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==106 and len(h['result_bindings'])==5
assert len(h['imported_libraries'])+len(h['new_imported_libraries'])+1==18
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==(2774 if name in ['MarkovOutwardRatesM5BF','MarkovRadialCovarianceM5BF','MarkovOutwardMomentsM5BF'] else 2782) and row['Window_imported'] is row['Abel_imported'] is True
 for k,n in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:assert len(row[k])==n;endpoints[name][k+'_count']=n
assert len(endpoints)==8
assert f['source_experiment']['band_counts']=={'deterministic_band_source_labels':34,'rows':228,'coefficients':18334}
assert f['source_experiment']['polygon_triple_counts']==[56667,56667,57157] and f['source_experiment']['polygon_triples_total']==170491
assert f['outward_probe']['initial_saved_domain_counts']=={'cases':4774,'birth_checks':70800,'radial_checks':66026,'identities':9548}
assert f['outward_probe']['initial_failure_count']==4774 and len(f['outward_probe']['initial_saved_random_case_labels'])==100
assert f['drop_probe']['domain_count']==40392 and len(f['drop_probe']['saved']['failures'])==20
watch=h['receipt_waiting'];assert len(watch['checks'])==1 and watch['checks'][0]['status']=='present' and watch['waits']==[]
assert watch['checks'][0]['sha256']=='f903b2a707b7cddf85f5a7373251c92df015f0b9156543de686f99b9d69e5e98'
assert watch['checks'][0]['observed_utc']=='2026-10-17T07:24:23.004270+00:00'
assert m['retained_finalization']['finalizer_events']==[168] and m['retained_finalization']['final_report_event']==170 and m['retained_finalization']['turn_completed_event']==171
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True
assert v['raw_validation']==m['raw_final_validation'] and set(v['raw_validation'])=={'modules','kernel_replays','axiom_audit','closures','allowed_axioms','rejected_builds','limits','completion'}
assert 'manifest_sha256' not in v['last_verification'] and 'validation_sha256' not in v['last_verification']
assert m['finalizer_static_predicate']['kernel_exact_selected_module_set_required'] is m['finalizer_static_predicate']['axiom_permitted_sets_asserted_by_finalizer'] is m['finalizer_static_predicate']['banned_token_scan_present'] is True
assert m['finalizer_static_predicate']['axiom_name_coverage_asserted_by_finalizer'] is False
# Project observations end in reviewer evidence; this sealer reads only T.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert row.get(k,[])==[]
assert v['method_pair_crosscheck']['count']==2782 and v['method_pair_crosscheck']['mismatches']==[] and v['method_shared_input_crosscheck']['mismatches']=={}
assert all(x==m[k] for k,x in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is m['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['opaque_retention']==m['opaque_retention'] and v['opaque_retention']['bundle']==b and v['opaque_retention']['observation']==o
assert v['opaque_retention']['manifest_only_count']==0 and v['opaque_retention']['prior180_unindexed_caches_remain_in_sealed180_only'] is True
assert b['file_count']==1 and b['total_bytes']==5808
assert o['archive_file_count']==o['controller_file_count']==81 and o['manifest_count']==79 and o['current_request_file_count']==82
closing=v['late_scope_observation']
for k,x in {'archive_file_count':81,'current_request_file_count':82,'manifest_count':79,'supplemental_file_count':1,'supplemental_total_bytes':5808}.items():assert closing[k]==x
assert closing['late_bundle_required'] is True and closing['manifest_only_paths']==[]
assert closing['extra_current_request_paths']==['research/__pycache__/validate_5bf6837d.cpython-314.pyc']
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[k]==[]
assert len(closing['supplemental_metadata_checks'])==2 and all(x['bytes_mode_uid_gid_mtime_sha256_match'] is True for x in closing['supplemental_metadata_checks'])
assert {x['path'] for x in closing['supplemental_metadata_checks']}=={x[k] for x in b['files'] for k in ['source_path','bundle_path']}
for k,n in [('manifest','unindexed_cache_bundle.json'),('observation','unindexed_cache_observation.json')]:
 q=pin(T/(PRE+n));assert closing['supplemental_'+k+'_path']==q['path'] and closing['supplemental_'+k+'_sha256']==q['sha256']
assert len(v['method_crosscheck'])==89 and v['method_shared_input_crosscheck']['shared_count']==128
assert v['final_static_stability']['input_count']==25019 and m['final_static_input_stability']['input_count']==143
assert v['final_static_stability']['start_utc']=='2026-10-17T07:37:41.162411+00:00'
assert v['final_static_stability']['finish_utc']=='2026-10-17T07:38:09.767462+00:00'
assert m['final_static_input_stability']['started_utc']=='2026-10-17T07:37:21.422618+00:00'
assert m['final_static_input_stability']['finished_utc']=='2026-10-17T07:37:21.473375+00:00'
assert v['final_absence_observation']['observed_utc']=='2026-10-17T07:38:09.779430+00:00'
assert m['final_absence_observation']['observed_utc']=='2026-10-17T07:37:21.473384+00:00'
assert closing['observed_utc']=='2026-10-17T07:38:09.779578+00:00'

rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,digest in inputs.items():
  if path.startswith(str(T)+'/'):row=pin(path);assert row['sha256']==digest,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==20 and len(rechecks['method'])==21
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert files[0]['sha256']==sys.argv[1]
main=local(T/(PRE+'monitoring_audit.md')).read_text();assert all(x not in main for x in ['[VALIDATION_FINAL]','[FINAL_OBSERVATION]','[PRESERVATION_FINAL]'])
extra=[pin(T/(PRE+'unindexed_cache_bundle.json')),pin(T/(PRE+'unindexed_cache_observation.json'))]
assert extra[1]['path']==b['observation_path'] and extra[1]['sha256']==b['observation_sha256']
for x in b['files']:
 row=pin(x['bundle_path']);assert x['bytes_and_selected_metadata_match'] is True and x['source_observed']==x['copy_observed'];assert row['bytes']==x['copy_observed']['bytes'] and row['sha256']==x['copy_observed']['sha256'];extra.append(row)
assert len(extra)==3
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker181.py'),pin(Path(__file__))]
assert helpers[0]['sha256']=='6360edd5147c87355946134009b6bd0413456d307f6254264925a161fbb91640'
assert pairmap['sha256']=='0b8daed633429d4ce0052e01e5bf2bb4a6c0c226037ff4267d3d9850d54eb258'
preserve=[x['path'] for x in files]+[pairmap['path']]+[x['path'] for x in helpers]+[x['path'] for x in extra];assert len(preserve)==len(set(preserve))==14
boundary_keys=[k for k in m if k.endswith('_boundary')]+['inherited_corrected_versions_scope','worker166_host_status_qualification']
out={'worker':181,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed181 audit. Sealer reads only retained temporary audit files; no project reads/programs or mathematical/RNG recomputation. Active182+ excluded; earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in ['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']},'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],'residual_binding':r,'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':568,'named_older_imported':430,'named_older_comparison_only':138,'historical_pending_or_other_status_pins':182,'historical_operational_pins':2,'historical_script_pins':106,'external_pairs':18,'qualification':'All eight endpoints inherit old212/subset195/separate19 and Window/Abel. No imported-body recovery or fresh whole-source build. Historical166 combined timeout and seven unreplayed prefixes remain distinct.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],'raw_validation':v['raw_validation'],'validation_schema_scope':v['validation_schema_scope'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21874,'owned_initial_exclusions':[],'prior_manifest_count':110,'prior_controller_artifact_count':112,'archive_artifacts':81,'manifest_entries':79,'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],'inventory_schema_boundary':m['inventory_schema_boundary'],'additional_bundle_requires_preservation':True,'supplemental_unindexed_cache_bundle':{'metadata':b,'observation':o,'files':extra,'scope':'One opaque unindexed/unarchived cache file, separate from prior historical supplements. No execution/decoding/creation-time attribution or validation upgrade; original archive unchanged.'},'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_pre_window_audit_refinements':v['pre_window_audit_refinements'],'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],'parent_helper_refinements':h['audit_helper_corrections']+['Fresh sealer statically refined empty source-mtime overlap map versus attempt-overlap list and corrected a retagged1810 literal to exact1800 before any execution; no project data or old seal changed.']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(outpath),'pairmap':pairmap,'supplement_metadata':extra[:2],'supplement_count':len(extra),'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
