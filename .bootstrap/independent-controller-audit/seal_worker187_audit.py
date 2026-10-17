#!/usr/bin/env python3
"""Audit-owned T-only seal. No project reads/execution or mathematical-value calculation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000187_';REQUEST='2082509481ba44c7bfe6fb10865a70b1'
def local(p):
 p=Path(p);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(p):
 p=local(p);b=p.read_bytes();return dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
def load(n):return json.loads(local(T/(PRE+n)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=load('mathematical_source_hashes.json');s=load('source_structure_audit.json');f=load('finite_domain_audit.json');v=load('validation_evidence.json');m=load('replay_method_evidence.json');b=load('unindexed_cache_bundle.json');o=load('unindexed_cache_observation.json');cr=load('final_crossreview.json')
for x in [h,s,f,v,b,o,cr]:assert x['worker']==187 and x['request']==REQUEST
assert m['worker']==187 and m['request_id']==REQUEST
assert h['counts']==s['counts']==dict(selected_modules=9,theorems=50,definitions=19)
assert h['source_level_scope']==s['source_level_scope']
assert h['mathematical_values_recomputed'] is s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert v['receipt']['outcome']=='completed' and v['receipt']['returncode']==0 and v['receipt']['report'] is not None and v['receipt']['mathematical_resolution'] is False
assert v['receipt_pin']['sha256']=='44b566e8d863a1cdc58c66ceef77500859581390dfff97ded454f3df5aae8b99' and v['receipt_pin']['bytes']==18724
assert v['timing']['elapsed_seconds']==v['timing']['calculated_elapsed_seconds']==1659.330782175064
assert v['timing']['elapsed_difference_seconds']==0 and v['timing']['host_margin_seconds']==140.6692178249359
for k,n in [('selected_modules',9),('new_modules',9),('recovered_modules',0),('build_receipts',19),('successful_math_builds',10),('successful_audit_builds',2),('rejected_builds',7),('rc1_builds',4),('timeouts',3),('replay_invocations',2),('replayed_modules',9),('printed_closures',50),('printed_rows_across_stages',95),('compiled_unselected_math',0),('pending_math',2)]:assert v['counts'][k]==n,(k,v['counts'][k])
assert all(v['checks'].values())
assert v['counts']['all_selected_declarations']=={'def':19,'theorem':50}
assert v['counts']['pending_declarations']=={'def':5,'theorem':6} and m['all_new_counts']=={'def':24,'theorem':56}
assert set(v['selection'])==set(v['validation']['modules'])==set(m['coverage_partition']['selected']['modules'])
for k,n in [('attempts',19),('rc1',4),('success',12),('timeouts',3),('successful_audit',2),('successful_math',10)]:assert m['compiler_attempt_summary'][k]==n
assert m['printed_closure_summary']['distinct']==50 and m['printed_closure_summary']['rows']==95
assert m['isolated_checker']['guard_suffixes']==['M208'] and m['isolated_checker']['guarded_counts']==[64,69]
assert m['isolated_checker']['sha256']=='c440fbfda9d0d87a6ffac046ec48f8e982a785451de48fa18f240dd40a60660f'
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['worker166_boundary']['new_recovery_count']==0
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['selected_import_base_count']==m['import_scope']['successful_replay_base_count']==2833
assert m['import_scope']['full_graph_nodes']==2842
assert m['import_scope']['all_new_source_graph_nodes']==len(m['source_graph'])==2846
assert len(m['import_scope']['imported_accepted186'])==8 and len(m['import_scope']['excluded_accepted186'])==4
assert m['recovery183']['current187_is_imported_reuse_not_new_recovery'] is True
assert m['coverage_partition']['new_recovery']['module_count']==0
assert [f['source'][k] for k in ['rows_recounted','coefficient_positions_recounted','wedge_triples_recounted','beyond_previous_column_bound_recounted','total_polygon_triples']]==[1056,29168,4224,844,634762]
assert f['source']['polygon_triples_recounted']==[211392,211392,211978]
assert [f['exact_wedge'][k] for k in ['group_count_with_multiplicity','distinct_group_indices','kernel_index_count']]==[1416,1392,360]
assert [f['correction_stress'][k] for k in ['index_count','distinct_indices','failure_entries']]==[1767,1737,66]
assert [f['central_probe'][k] for k in ['index_count','distinct_indices','saved_rows']]==[1959,1926,1959]
assert f['correction_probe']['domain_count']==420 and f['actual_stein_probe']['rows']==60
assert [f['accepted_certificates']['positive'][k]['terms'] for k in ['den','Cp','reduced']]==[19,46,80]
assert len(b['files'])==b['count']==5 and b['bytes']==22436
extra=[pin(T/(PRE+'unindexed_cache_bundle.json')),pin(T/(PRE+'unindexed_cache_observation.json'))]
assert extra[1]['path']==b['observation']['path'] and extra[1]['sha256']==b['observation']['sha256']
for x in b['files']:
 q=pin(x['path']);assert q['sha256']==x['sha256'] and q['bytes']==x['bytes'];extra.append(q)
assert set(b['preservation_paths'])=={x['path'] for x in extra}
for obs,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_observation'],m['static_input_sha256'])]:
 assert obs['all_unchanged'] is True and obs['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert not obs.get(k)
assert v['project_reads_closed_utc'] and m['project_reads_closed_utc']
for obs in [v['final_absence_observation'],m['final_absence_observation']]:
 assert obs['applicable'] is True and set(obs['paths'])==set(v['pending_object_absence_initial']['paths']) and len(obs['paths'])==4
 assert obs.get('observed_at_utc',obs.get('observed_utc'))
 assert all(x is True for x in obs['paths'].values())
cas=v['final_optional_cas_observation'];assert cas['path_count']==len(cas['paths'])==11 and cas['observed_at_utc'] and cas['finished_utc']
assert set(cas['paths'])=={x['content_addressed_observation']['path'] for x in v['objects']}
for x in v['objects']:
 y=cas['paths'][x['content_addressed_observation']['path']]
 assert x['content_addressed_observation']['present'] is True and y['present'] is True and y['matches_retained_object'] is True
 assert y['sha256']==x['archive']['sha256']==x['current']['sha256'] and y['bytes']==x['archive']['bytes']==x['current']['bytes']
closing=v['late_scope_observation'];assert closing['archive_count']==112 and closing['current_count']==117 and closing['manifest_count']==110
for k in ['added_current','missing_current','added_archive','missing_archive','archive_hash_changes','current_hash_changes','manifest_mismatches']:assert closing[k]==[],(k,closing[k])
assert set(closing['unindexed_unarchived_paths'])=={x['relative_path'] for x in b['files']}
assert closing['metadata_count']==len(closing['metadata_checks'])==10
assert all(x['all_stable_match'] is True for x in closing['metadata_checks'])
assert {x['path'] for x in closing['metadata_checks']}=={x[k] for x in b['files'] for k in ['source','path']}
assert v['method_pair_crosscheck']['pairmap']==pin(T/(PRE+'inherited_pair_expectations.json'))
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert len(v['method_crosscheck'])==v['method_crosscheck_summary']['copied_fields']
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert v['method_support_hashes']['evidence']==pin(T/(PRE+'replay_method_evidence.json'))
assert cr['both_final_audit_files_only_reviews_received'] is True and cr['necessary_corrections_remaining']==[]
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,digest in inputs.items():
  if p.startswith(str(T)+'/'):
   q=pin(p);assert q['sha256']==digest,(label,p);rows.append(q)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+n)) for n in suffixes];assert files[0]['sha256']==sys.argv[1]
assert cr['main_sha256']==files[0]['sha256'] and cr['sealer_sha256']==pin(Path(__file__))['sha256']
for x in cr['support_pins']:assert pin(x['path'])==x
pair=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_math_worker187.py'),pin(Path(__file__))];reviewpin=pin(T/(PRE+'final_crossreview.json'))
preserve=[x['path'] for x in files]+[pair['path']]+[x['path'] for x in helpers]+[reviewpin['path']]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==19
out=dict(worker=187,request=REQUEST,sealed_at_utc=datetime.now(timezone.utc).isoformat(),scope='Static archive-first closed187 audit; sealer reads T only. No project execution, mathematical recomputation, active188+ reads or proposer assistance. Earlier outcomes/windows unchanged.',files=files,receipt_pin=v['receipt_pin'],historical_outcome=v['receipt'],timing=v['timing'],counts=v['counts'],root_contract_binding=v['root_contract_binding'],mathematical_scope=h['source_level_scope'],mathematical_values_recomputed=False,finite_domains_and_qualifications=f,prior184_recovery_of183=v['preserved184_recovery_of183'],recovery_qualification=v['recovery_qualification'],coverage_partition=m['coverage_partition'],imported_recovery183=m['recovery183'],isolation=m['isolated_checker'],import_scope=m['import_scope'],endpoint_import_boundaries=m['endpoint_import_boundaries'],historical_boundaries={k:m[k] for k in ['worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','worker166_current187','historical_nested_field_qualification','named_older_window_boundary','named_older_abel_boundary','historical_boundaries']},compiler_summary=m['compiler_attempt_summary'],printed_closures=m['printed_closure_summary'],failed_versions=m['rejected_builds'],superseded_successes=m['superseded_successes'],validation=v['validation'],validation_stages=v['validation_stages'],pending_drafts=s['pending_modules'],optional_CAS_qualification='Eleven optional controller CAS paths present and matching complete archive/current objects at initial and final availability observations; not fresh proof validation or completion-time binary attestation.',preservation=dict(checks=v['checks'],initial_input_count=len(v['initial_checks']),archive_artifacts=112,manifest_entries=110,supplemental_unindexed_cache_bundle=dict(metadata=b,observation=o,files=extra,qualification='Five opaque unindexed/unarchived cache files, exact bytes only. No decoding, producer attribution, creation inference or proof upgrade. Original archive unchanged.')),final_observations=dict(validation=v['final_static_stability'],method=m['final_static_observation'],validation_project_reads_closed=v['project_reads_closed_utc'],method_project_reads_closed=m['project_reads_closed_utc'],late_scope=v['late_scope_observation'],validation_absence=v['final_absence_observation'],method_absence=m['final_absence_observation'],optional_CAS_availability=cas,seal_extends_project_window=False),crossreview=dict(record=cr,pin=reviewpin,temporary_input_rechecks=rechecks,primary_preparation=h.get('audit_helper_corrections'),validation_preparation=v.get('preparation_history'),post_observation_note_rendering=v.get('post_observation_note_rendering'),pre_window_audit_refinements=v.get('pre_window_audit_refinements'),independent_inherited_pair_check=v.get('independent_inherited_pair_check'),method_preparation=m.get('audit_helper_refinements'),method_fields_compared=len(v['method_crosscheck']),pair_crosscheck=v['method_pair_crosscheck'],shared_input_crosscheck=v['method_shared_input_crosscheck']),inherited_pair_map=pair,audit_helpers=helpers,preservation_paths=preserve,pending_required_research_execution=False,completion_claim=False)
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps(dict(main=files[0],integrity=pin(outpath),preservation_count_including_integrity=len(preserve)+1,supplemental_files=extra),indent=2))
