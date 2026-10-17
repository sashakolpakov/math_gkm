#!/usr/bin/env python3
"""Audit-files-only seal for closed180; no project reads, execution or mathematical recomputation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000180_';REQUEST='1c65a30634f843b1b22e83fb453dc26d'
def local(x):
 p=Path(x);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(x):
 p=local(x);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
def read(x):return json.loads(local(T/(PRE+x)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');v=read('validation_evidence.json');m=read('replay_method_evidence.json')
b=read('unindexed_cache_bundle.json');o=read('unindexed_cache_observation.json')
for d in [h,s,f,v,b,o]:assert d['worker']==180 and d['request']==REQUEST
assert m['worker']==180 and m['request_id']==REQUEST
# Exact final pins and observation assertions are populated before final concurrence.
fixed={
 'mathematical_source_hashes.json':'58de80869de12433ee6882ed896cfb35ef595939857400f4881b615726c6be95',
 'source_structure_audit.json':'7cf0d3474514f99d8705b3478c2a70a1b794432fc536925292ba268549bc5eab',
 'finite_domain_audit.json':'a5fc849dfe892e59be4d1107bd30c708665136bee623c90c31e7422e7295b895',
 'unindexed_cache_bundle.json':'cb0948e80becfb0fecb6fdf00b561631630511e899fe17b761864169127adb7e',
 'unindexed_cache_observation.json':'cae4b11fe8a951b081c85059d4bd33997d97c6659fb9ce3fb2bcba353a5e17d6',
 'replay_method.md':'371ce0412f99f19cf98fef1cec1839fc4b04691535dddac55d152ca1acd773cd',
 'replay_method_evidence.json':'cb96f9d811f947c51db7897f1d6cd0bdb854ce0c72c6c18859d1fabed7f01324',
 'inherited_pair_expectations.json':'a99e90e9b2e7732e8281699c690128009f7b9b20f367f2df20fb76015a2ed23b',
 'validation_audit.md':'9a9704aeb46c02e74aa1533771ac4064f5106fa7fb7d92ded0fd4a65c2605d94',
 'validation_evidence.json':'cbf1ded696efc81a35d8cfc46b680a891ab222ae9ad635f3aa6b4fbb5fe5ddfd',
}
for name,digest in fixed.items():assert pin(T/(PRE+name))['sha256']==digest,name
c=v['counts'];expected={'new_math':12,'new_theorems':66,'new_definitions':18,'new_inductives':0,'build_attempts':23,'successful_build_attempts':13,'rejected_builds':10,'build_timeouts':0,'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'audits':1,'distinct_printed_closures':66,'print_rows':66,'indexed':110,'archive_artifacts':112,'controller_artifacts':112,'initial_entries':21774,'inherited_checked':21774,'prior179_artifacts':151,'prior179_manifest':388,'unselected_math':0}
for k,x in expected.items():assert c[k]==x,(k,c[k])
assert h['accepted_counts']==s['accepted_counts']==m['all_new_counts']==m['coverage_partition']['selected_replayed']['counts']=={'theorem':66,'def':18}
assert len(h['new_sources'])==len(s['new_modules'])==12 and h['excluded_modules']==s['excluded_modules']==[]
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0 and v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1544.4578330516815
assert v['controller_times']['elapsed_discrepancy_seconds']==0 and v['controller_times']['finish_minus_deadline']==m['retained_timing']['finish_minus_deadline']==-255.54216694831848
assert m['retained_timing']['request_seconds']==1800
for k,x in {'root':'8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe','raw':'cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068','canonical':'6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'}.items():assert v['contract'][k]==x
assert v['contract']['parsed_request_matches'] is True and v['contract']['canonical']==v['contract']['request']
for k,x in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert x is True,(k,x)
 else:assert not x,(k,x)
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21774
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
r=h['residual_binding'];assert r==s['source_level_scope'] and r['root_open'] is True
for k in ['new_unconditional_raw_LC_region','new_unconditional_source_estimate','UpperAdjacentMA45_proved','PositiveParameterTailM1C6_proved','VarianceTailM1C6_proved','ReverseTailM1C6_proved','CertificatePositiveMBEC_proved','SharpCompleteMargin_proved','actual_raw_source_counterexample','old212_recovery_claimed','old166_prefix_recovery_claimed']:assert r[k] is False
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2'
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is f['random_samples_regenerated'] is False
assert m['isolated_checker']['sha256']=='6b6fe53ff85a87412bddb65b92bf738d7a64a309abf40bbaf6e9dd04ae6e7202'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[84]
assert m['isolated_checker']['body_equal_prior110_after_guard_removal'] is m['isolated_checker']['exact_prior179_retag'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':66},'distinct':66,'rows':66}
assert m['compiler_attempt_summary']=={'attempts':23,'rc1':10,'success':13,'timeouts':0}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is versions['final_source_matching'] is True
assert versions['replay_stage_module_counts']==[12] and versions['validation_stage_count']==1 and versions['final_stage_modules']==12
assert versions['successful_mathematical_builds']==versions['successful_selected_mathematical_builds']==12 and versions['superseded_successful_current_sources']==[]
assert failed['attempt_count']==failed['rc1_count']==10 and failed['timeout_count']==0
assert failed['all_common_headers_equal_ignoring_whitespace'] is False and failed['removed_placeholder_definition']=='risingConvM1C6'
assert failed['added_final_theorems']==['q_zero_orderedM1C6','sharp_zero_marginM1C6']
assert m['method_limits']['live_source_edit_during_rejected_build'] is m['method_limits']['same_module_failed_successful_build_overlap'] is True
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2771
assert m['import_scope']['selected_math_source_closure']==2783 and m['import_scope']['full_graph_nodes']==2784
assert len(h['named_older_comparisons'])==556 and sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==419
assert len(h['historical_pending_comparisons'])==182 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==99 and len(h['result_bindings'])==10
assert len(h['imported_libraries'])+len(h['new_imported_libraries'])+1==18
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==2771 and row['Window_imported'] is row['Abel_imported'] is True
 for k,n in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:assert len(row[k])==n;endpoints[name][k+'_count']=n
assert len(endpoints)==12
assert f['source_experiment']['band_counts']=={'deterministic_band_source_labels':28,'rows':169,'coefficients':12488}
assert f['source_experiment']['polygon_triple_counts']==[39584,39584,40061] and f['source_experiment']['polygon_triples_total']==119229
assert f['moment_probe']['domain_count']==22365 and f['moment_probe']['saved_failure_rows']==4217
assert f['drift_probe']['domain_counts']=={'grid_drift_sign_positions':19635,'grid_checks':19074,'variance_contraction_checks':19074,'limit_checks':7140,'stress_checks_saved_planned':400}
assert f['fixed_parameter']['validation_domain_counts']=={'formula_checks':7644,'gap_checks':3675}
watch=h['receipt_waiting'];assert len(watch['checks'])==9 and sum(x['status']=='absent' for x in watch['checks'])==8 and len(watch['waits'])==8
assert watch['receipt']['sha256']=='132137674e35e9be7876cd7d7d456b9167763ac7848e91817ac2e0f41ad5fd03'
assert all(y['observed_epoch']-x['observed_epoch']>=60 for x,y in zip(watch['checks'],watch['checks'][1:])) and all(x['requested_ms']<=59000 for x in watch['waits'])
assert m['retained_finalization']['finalizer_events']==[210] and m['retained_finalization']['final_report_event']==213 and m['retained_finalization']['turn_completed_event']==214
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True
assert v['raw_validation']==m['raw_final_validation'] and set(v['raw_validation'])=={'modules','kernel_replays','axiom_audit','closures','allowed_axioms','rejected_builds','limits','completion'}
assert 'manifest_sha256' not in v['last_verification'] and 'validation_sha256' not in v['last_verification']
assert m['finalizer_static_predicate']['kernel_exact_selected_module_set_required'] is True and m['finalizer_static_predicate']['axiom_permitted_sets_asserted_by_finalizer'] is m['finalizer_static_predicate']['axiom_name_coverage_asserted_by_finalizer'] is m['finalizer_static_predicate']['banned_token_scan_present'] is False
# Project observations end in reviewer evidence; this sealer reads only T.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert row.get(k,[])==[]
assert v['method_pair_crosscheck']['count']==2771 and v['method_pair_crosscheck']['mismatches']==[] and v['method_shared_input_crosscheck']['mismatches']=={}
assert all(x==m[k] for k,x in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is m['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['opaque_retention']==m['opaque_retention'] and v['opaque_retention']['bundle']==b and v['opaque_retention']['observation']==o
assert v['opaque_retention']['manifest_only_count']==0 and v['opaque_retention']['prior239_recopied'] is v['opaque_retention']['prior239_reindexed'] is False
assert b['file_count']==3 and b['total_bytes']==18149
assert o['archive_file_count']==o['controller_file_count']==112 and o['manifest_count']==110 and o['current_request_file_count']==115
closing=v['late_scope_observation']
for k,x in {'archive_file_count':112,'current_request_file_count':115,'manifest_count':110,'supplemental_file_count':3,'supplemental_total_bytes':18149}.items():assert closing[k]==x
assert closing['late_bundle_required'] is True and closing['manifest_only_paths']==[]
assert closing['extra_current_request_paths']==['research/__pycache__/fixed_parameter_1c65a306.cpython-314.pyc','research/__pycache__/probe_moments_1c65a306.cpython-314.pyc','research/__pycache__/validate_1c65a306.cpython-314.pyc']
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[k]==[]
assert len(closing['supplemental_metadata_checks'])==6 and all(x['bytes_mode_uid_gid_mtime_sha256_match'] is True for x in closing['supplemental_metadata_checks'])
assert {x['path'] for x in closing['supplemental_metadata_checks']}=={x[k] for x in b['files'] for k in ['source_path','bundle_path']}
for k,n in [('manifest','unindexed_cache_bundle.json'),('observation','unindexed_cache_observation.json')]:
 q=pin(T/(PRE+n));assert closing['supplemental_'+k+'_path']==q['path'] and closing['supplemental_'+k+'_sha256']==q['sha256']
assert len(v['method_crosscheck'])==86 and v['method_shared_input_crosscheck']['shared_count']==162
assert v['final_static_stability']['input_count']==25250 and m['final_static_input_stability']['input_count']==179
assert v['final_static_stability']['start_utc']=='2026-10-17T07:20:30.094013+00:00'
assert v['final_static_stability']['finish_utc']=='2026-10-17T07:20:56.402215+00:00'
assert m['final_static_input_stability']['started_utc']=='2026-10-17T07:20:08.828398+00:00'
assert m['final_static_input_stability']['finished_utc']=='2026-10-17T07:20:09.136320+00:00'
assert v['final_absence_observation']['observed_utc']=='2026-10-17T07:20:56.415576+00:00'
assert m['final_absence_observation']['observed_utc']=='2026-10-17T07:20:09.136332+00:00'
assert closing['observed_utc']=='2026-10-17T07:20:56.415805+00:00'

rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,digest in inputs.items():
  if path.startswith(str(T)+'/'):row=pin(path);assert row['sha256']==digest,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==22 and len(rechecks['method'])==25
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert files[0]['sha256']==sys.argv[1]
main=local(T/(PRE+'monitoring_audit.md')).read_text();assert all(x not in main for x in ['[VALIDATION_FINAL]','[FINAL_OBSERVATION]','[PRESERVATION_FINAL]'])
extra=[pin(T/(PRE+'unindexed_cache_bundle.json')),pin(T/(PRE+'unindexed_cache_observation.json'))]
assert extra[1]['path']==b['observation_path'] and extra[1]['sha256']==b['observation_sha256']
for x in b['files']:
 row=pin(x['bundle_path']);assert x['bytes_and_selected_metadata_match'] is True and x['source_observed']==x['copy_observed'];assert row['bytes']==x['copy_observed']['bytes'] and row['sha256']==x['copy_observed']['sha256'];extra.append(row)
assert len(extra)==5
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker180.py'),pin(Path(__file__))]
assert helpers[0]['sha256']=='6e30b58ff4ccadb1e64cbc5e1bb05607149029ba999faf694086dc5e7a8cfa70'
assert pairmap['sha256']=='a99e90e9b2e7732e8281699c690128009f7b9b20f367f2df20fb76015a2ed23b'
preserve=[x['path'] for x in files]+[pairmap['path']]+[x['path'] for x in helpers]+[x['path'] for x in extra];assert len(preserve)==len(set(preserve))==16
boundary_keys=[k for k in m if k.endswith('_boundary')]+['inherited_corrected_versions_scope','worker166_host_status_qualification']
out={'worker':180,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed180 audit. Sealer reads only retained temporary audit files; no project reads/programs or mathematical/RNG recomputation. Active181+ excluded; earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in ['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']},'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],'residual_binding':r,'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':556,'named_older_imported':419,'named_older_comparison_only':137,'historical_pending_or_other_status_pins':182,'historical_operational_pins':2,'historical_script_pins':99,'external_pairs':18,'qualification':'All twelve endpoints inherit old212/subset195/separate19 and Window/Abel. No imported-body recovery or fresh whole-source build. Historical166 combined timeout and seven unreplayed prefixes remain distinct.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],'raw_validation':v['raw_validation'],'validation_schema_scope':v['validation_schema_scope'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21774,'owned_initial_exclusions':[],'prior_manifest_count':388,'prior_controller_artifact_count':151,'archive_artifacts':112,'manifest_entries':110,'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],'inventory_schema_boundary':m['inventory_schema_boundary'],'additional_bundle_requires_preservation':True,'supplemental_unindexed_cache_bundle':{'metadata':b,'observation':o,'files':extra,'scope':'Three opaque unindexed/unarchived cache files, separate from prior239 supplement. No execution/decoding/creation-time attribution or validation upgrade; original archive unchanged.'},'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_pre_window_audit_refinements':v['pre_window_audit_refinements'],'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],'parent_helper_refinements':h['audit_helper_corrections']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(outpath),'pairmap':pairmap,'supplement_metadata':extra[:2],'supplement_count':len(extra),'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
