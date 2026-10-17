#!/usr/bin/env python3
"""Audit-files-only seal for closed179; no project reads/programs or mathematical recomputation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000179_';REQUEST='beca0ad5893a498d8ecc9af0fd97b9f0'
def local(x):
 p=Path(x);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(x):
 p=local(x);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
def read(x):return json.loads(local(T/(PRE+x)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');v=read('validation_evidence.json');m=read('replay_method_evidence.json')
b=read('manifest_only_bundle.json');o=read('manifest_only_observation.json')
for d in [h,s,f,v]:assert d['worker']==179 and d['request']==REQUEST
assert m['worker']==179 and m['request_id']==REQUEST
# Exact reviewed final pins populated before either reviewer's final concurrence.
fixed={
 'mathematical_source_hashes.json':'cac80cd62ebd2f327867ea4ee2dbc0a3d8d3a65d89fd97c46f81a66741ca68c8',
 'source_structure_audit.json':'4bf5503e53dfe4e9fe1d6ddf6de7ea8f0eee8b71b5a13651d66f65df13d37c51',
 'finite_domain_audit.json':'cd8b96069a6d2f25fbfe29d4e77703087b2ebb4f2cf8a1a7dc15bcf02c9970c1',
 'manifest_only_bundle.json':'7f574c047abde40cddcc4d53fe8cf33fd8538d652c2f13c89e46b20ab43644b0',
 'manifest_only_observation.json':'ddbfc35e40d03007e01062dbc9775f93c06c242c2f54c54280504fed721e1c13',
 'replay_method.md':'f0f0f2d0d533bbc50c449a32bcf16dad47df557b1791c9f6e92a4735b001c95e',
 'replay_method_evidence.json':'9fdb7ca101b242fcdda0a8762bb3927dfac249156a767d20b592fa2194ffa0ee',
 'inherited_pair_expectations.json':'c4a96a0345662937dd9d59ece888ab55c45f5d04c475e6edc4b26f98ce35309f',
 'validation_audit.md':'f90aeacaeafd6e19840a847eb15b659b81f023a6f27219042ab8ea72e7d8d1a3',
 'validation_evidence.json':'b5039278505d837368c6dd7c6d20c2b01e45a06051e66b8ac722699d7583fbe6',
}
for name,digest in fixed.items():assert pin(T/(PRE+name))['sha256']==digest,name
c=v['counts']
expected={'new_math':10,'new_theorems':56,'new_definitions':20,'new_inductives':0,'build_attempts':32,'successful_build_attempts':14,'rejected_builds':18,'build_timeouts':1,'replay_attempts':3,'successful_replays':3,'replay_timeouts':0,'audits':3,'distinct_printed_closures':56,'print_rows':56,'indexed':388,'archive_artifacts':151,'controller_artifacts':151,'initial_entries':21638,'inherited_checked':21638,'prior178_artifacts':100,'prior178_manifest':334,'unselected_math':1}
for key,value in expected.items():assert c[key]==value,(key,c[key])
assert h['accepted_counts']==s['accepted_counts']==m['coverage_partition']['selected_replayed']['counts']=={'theorem':56,'def':20}
assert m['all_new_counts']=={'theorem':59,'def':21}
assert h['excluded_counts']==s['excluded_counts']=={'theorem':3,'def':1}
assert len(h['new_sources'])==len(s['new_modules'])==10 and len(h['excluded_modules'])==1
assert h['excluded_modules'][0]['module']=='MarkovDetTestMBEC' and h['excluded_modules'][0]['replayed_in179'] is False
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0 and v['controller']['report'] is not None
assert v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==v['controller_times']['timestamp_difference']==1504.6151270866394
assert v['controller_times']['elapsed_discrepancy_seconds']==0 and v['controller_times']['finish_minus_deadline']==-295.3848729133606
assert v['contract']['root']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert v['contract']['raw']=='cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068'
assert v['contract']['canonical']==v['contract']['request']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert v['contract']['parsed_request_matches'] is True
for key,value in v['checks'].items():
 if key in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(key,value)
 else:assert not value,(key,value)
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21638
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
r=h['residual_binding'];assert r==s['source_level_scope']
assert r['root_open'] is True and r['new_unconditional_raw_LC_region'] is r['new_unconditional_source_estimate'] is False
for key in ['UpperAdjacentMA45_proved','ReverseCoreMBEC_proved','ClearedCoreMBEC_proved','CertificatePositiveMBEC_proved','SharpCompleteMargin_proved','actual_raw_source_counterexample','old212_recovery_claimed','old166_prefix_recovery_claimed']:assert r[key] is False
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2'
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is f['random_samples_regenerated'] is False
assert m['isolated_checker']['sha256']=='3143edb34ab86889556eef39b6ee589f4f89293774a1924d931b51f973f0b285'
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[51,62,76]
assert m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':56},'distinct':56,'rows':56}
assert m['compiler_attempt_summary']=={'attempts':32,'rc1':17,'success':14,'timeouts':1}
versions=m['successful_version_selection'];failed=m['failed_version_qualifications']
assert versions['one_final_source_success_per_module'] is versions['final_source_matching'] is True
assert versions['replay_stage_module_counts']==[8,9,10] and versions['validation_stage_count']==3 and versions['final_stage_modules']==10
assert versions['successful_mathematical_builds']==11 and versions['successful_selected_mathematical_builds']==10 and versions['superseded_successful_current_sources']==[]
assert failed['attempt_count']==18 and failed['rc1_count']==17 and failed['timeout_count']==1
assert m['source_resolution_errors']==m['all_resolved_source_cycles']==[]
assert m['selected_duplicate_names']=={}
assert m['import_scope']['selected_import_base_count']==m['import_scope']['all_inherited_pair_count']==2764
assert m['import_scope']['selected_math_source_closure']==2774 and m['import_scope']['full_graph_nodes']==2778
assert len(h['named_older_comparisons'])==546 and sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==412
assert len(h['historical_pending_comparisons'])==181 and len(h['historical_operational_comparisons'])==2
assert len(h['inherited_scripts'])==92 and len(h['result_bindings'])==24
assert len(h['imported_libraries'])+len(h['new_imported_libraries'])+1==18
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes']}
 assert row['inherited_count']==(2764 if name in ['MarkovWeightDeterminantsMBEC','MarkovWeightObstructionMBEC','MarkovDetTestMBEC'] else 2763)
 assert row['Window_imported'] is row['Abel_imported'] is True
 for key,count in [('old121_212',212),('old121_195',195),('old121_accepted',19)]:assert len(row[key])==count;endpoints[name][key+'_count']=count
assert len(endpoints)==11
assert f['source_experiment']['counts']=={'fractions':50,'rows':370,'coefficients':25161}
assert f['source_experiment']['polygon_triple_counts']==[69385,69385,69685] and f['source_experiment']['polygon_triples_total']==208455
assert f['representation']['domain_counts']=={'reverse_formulas':6880,'cleared_formulas':6880,'polynomial_identities':220,'determinants':4845,'forbidden_zeros':4060,'top_gaps':2478}
assert f['fixed_polynomial_certificates']['combined_saved_total']==11806
watch=h['receipt_waiting'];assert len(watch['checks'])==10 and sum(x['status']=='absent' for x in watch['checks'])==9
assert watch['checks'][-1]['sha256']=='0909caf73f94acdd70f4587aa19e17406813bacce6589ef9dee259fdf4aa5b0e'
assert all(y['observed_epoch']-x['observed_epoch']>=60 for x,y in zip(watch['checks'],watch['checks'][1:]))
assert all(x['requested_ms']<=59000 for x in watch['waits'])
assert m['retained_finalization']['finalizer_events']==[278,284] and m['retained_finalization']['final_report_event']==287
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True
# Final project observations remain bounded; from here only retained T files are opened.
for row,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert row['all_unchanged'] is True and row['input_count']==len(inputs)
 for key in ['changed','missing','mismatches']:assert row.get(key,[])==[]
assert v['method_pair_crosscheck']['count']==2764 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert len(v['method_crosscheck'])==85 and v['method_shared_input_crosscheck']['shared_count']==424
assert v['final_static_stability']['input_count']==25365 and m['final_static_input_stability']['input_count']==442
assert v['final_static_stability']['start_utc']=='2026-10-17T06:51:54.383665+00:00'
assert v['final_static_stability']['finish_utc']=='2026-10-17T06:52:21.600237+00:00'
assert m['final_static_input_stability']['started_utc']=='2026-10-17T06:51:33.971691+00:00'
assert m['final_static_input_stability']['finished_utc']=='2026-10-17T06:51:34.074597+00:00'
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert v['final_absence_observation']['applicable'] is m['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['manifest_only_retention_supplement']==m['manifest_only_retention_supplement']==b
assert v['manifest_only_retention_observation']==m['manifest_only_retention_observation']==o
assert b['file_count']==239 and b['total_bytes']==2138798
assert o['archive_file_count']==o['controller_file_count']==151 and o['manifest_count']==388 and o['current_request_file_count']==154
closing=v['late_scope_observation']
assert closing['observed_utc']=='2026-10-17T06:52:21.624354+00:00'
for key,value in {'archive_file_count':151,'current_request_file_count':154,'manifest_count':388,'manifest_union_archive_count':390,'supplemental_file_count':239,'historical_manifest_only_count':236,'current_request_manifest_only_count':3}.items():assert closing[key]==value,(key,closing[key])
assert closing['late_bundle_required'] is True
assert closing['extra_current_request_paths']==['research/__pycache__/probe_beca0ad5.cpython-314.pyc','research/__pycache__/reverse_certificate_beca0ad5.cpython-314.pyc','research/__pycache__/validate_beca0ad5.cpython-314.pyc']
for key in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[key]==[]
assert set(closing['manifest_only_paths'])=={x['relative_path'] for x in b['files']}
assert len(closing['supplemental_metadata_checks'])==478
assert all(x['bytes_mode_uid_gid_mtime_sha256_match'] is True for x in closing['supplemental_metadata_checks'])
assert {x['path'] for x in closing['supplemental_metadata_checks']}=={x[k] for x in b['files'] for k in ['source_path','bundle_path']}
assert closing['supplemental_manifest_sha256']==pin(T/(PRE+'manifest_only_bundle.json'))['sha256']
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,digest in inputs.items():
  if path.startswith(str(T)+'/'):row=pin(path);assert row['sha256']==digest,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==258 and len(rechecks['method'])==262
assert pin(T/'static_audit_worker179.py')['sha256']=='d863b24933e08d08c800178fecee80e5beb8f43f4ce598300eff99392f91de66'
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert files[0]['sha256']==sys.argv[1]
main=local(T/(PRE+'monitoring_audit.md')).read_text();assert '[VALIDATION_FINAL]' not in main and '[FINAL_OBSERVATION]' not in main and '[PRESERVATION_FINAL]' not in main
extra=[pin(T/(PRE+'manifest_only_bundle.json')),pin(T/(PRE+'manifest_only_observation.json'))]
assert extra[1]['path']==b['observation_path'] and extra[1]['sha256']==b['observation_sha256']
for x in b['files']:
 row=pin(x['bundle_path']);assert x['bytes_and_selected_metadata_match'] is True and x['source_observed']==x['copy_observed'];assert row['bytes']==x['copy_observed']['bytes'] and row['sha256']==x['copy_observed']['sha256'];extra.append(row)
assert len(extra)==241
pairmap=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_audit_worker179.py'),pin(Path(__file__))]
preserve=[x['path'] for x in files]+[pairmap['path']]+[x['path'] for x in helpers]+[x['path'] for x in extra];assert len(preserve)==len(set(preserve))==252
boundary_keys=[k for k in m if k.endswith('_boundary')]+['inherited_corrected_versions_scope','worker166_host_status_qualification']
out={'worker':179,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed179 audit. Sealer reads only retained temporary auditfiles; no project reads/programs or mathematical/RNG recomputation. Active180+ excluded; earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in ['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']},'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],'residual_binding':r,'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','scope','new_modules','excluded_modules']},
 'mathematical_values_recomputed':False,'random_samples_regenerated':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':546,'named_older_imported':412,'named_older_comparison_only':134,'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'historical_script_pins':92,'external_pairs':18,'qualification':'All ten selected endpoints, and the separate DetTest endpoint, inherit old212/subset195/separate19 and Window/Abel; no imported-body recovery or freshwhole-sourcebuild. Historical166combinedtimeout and7unreplayedprefixes remain distinct.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21638,'owned_initial_exclusions':[],'prior_manifest_count':334,'prior_controller_artifact_count':100,'archive_artifacts':151,'manifest_entries':388,'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],'inventory_schema_boundary':m['inventory_schema_boundary'],'additional_bundle_requires_preservation':True,'supplemental_manifest_only_bundle':{'metadata':b,'observation':o,'files':extra,'scope':'239opaque manifest-onlyfiles:236sealed178identities plus3currentcaches. Noexecution/decoding/creation-time attribution orvalidationupgrade;originalarchiveunchanged.'},'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':closing,'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_pre_window_audit_refinements':v['pre_window_audit_refinements'],'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],'parent_helper_refinements':h['audit_helper_corrections']+['Sealer reviewed beforeexecution and corrected all-current59/21 versus selected56/20,11successfulmath versus10selected, and11endpointrows includingcompiled-onlyDetTest. No sealerexecution occurred before final review.']},
 'inherited_pair_map':pairmap,'audit_helpers':helpers,'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(outpath),'pairmap':pairmap,'supplement_metadata':extra[:2],'supplement_count':len(extra),'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
