#!/usr/bin/env python3
"""Audit-owned T-only seal. No project reads/execution or mathematical-value calculation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000188_';REQUEST='73199834a78f44d9a2ee490e7f54f632'
def local(p):
 p=Path(p);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(p):
 p=local(p);b=p.read_bytes();return dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
def load(n):return json.loads(local(T/(PRE+n)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=load('mathematical_source_hashes.json');s=load('source_structure_audit.json');f=load('finite_domain_audit.json');v=load('validation_evidence.json');m=load('replay_method_evidence.json');b=load('unindexed_cache_bundle.json');o=load('unindexed_cache_observation.json');cr=load('final_crossreview.json')
for x in [h,s,f,v,b,o,cr]:assert x['worker']==188 and x['request']==REQUEST
assert m['worker']==188 and m['request_id']==REQUEST
assert h['counts']==s['counts']==dict(selected_modules=13,theorems=46,definitions=26)
assert h['source_level_scope']==s['source_level_scope']
assert h['mathematical_values_recomputed'] is s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert v['receipt']['outcome']=='completed' and v['receipt']['returncode']==0 and v['receipt']['report'] is not None and v['receipt']['mathematical_resolution'] is False
assert v['receipt_pin']['sha256']=='cf2d12a125fed41aaaa6c0840d00287ca243e48347b8f53df587c3c3b3f64cfb' and v['receipt_pin']['bytes']==21955
assert v['timing']['elapsed_seconds']==v['timing']['calculated_elapsed_seconds']==1748.7853219509125
assert v['timing']['elapsed_difference_seconds']==0 and v['timing']['host_margin_seconds']==51.214678049087524
for k,n in [('selected_modules',13),('new_modules',13),('recovered_modules',0),('build_receipts',23),('successful_math_builds',14),('successful_audit_builds',2),('rejected_builds',7),('rc1_builds',4),('timeouts',3),('replay_invocations',2),('replayed_modules',13),('printed_closures',46),('printed_rows_across_stages',87),('compiled_unselected_math',1),('pending_math',0)]:assert v['counts'][k]==n,(k,v['counts'][k])
assert all(v['checks'].values())
assert v['counts']['all_selected_declarations']=={'def':26,'theorem':46}
assert v['counts']['pending_declarations']=={} and m['all_new_counts']=={'def':29,'theorem':46}
assert set(v['selection'])==set(v['validation']['modules'])==set(m['coverage_partition']['selected']['modules'])
for k,n in [('attempts',23),('rc1',4),('success',16),('timeouts',3),('successful_audit',2),('successful_math',14)]:assert m['compiler_attempt_summary'][k]==n
assert m['printed_closure_summary']['distinct']==46 and m['printed_closure_summary']['rows']==87
assert m['isolated_checker']['guard_suffixes']==['M731'] and m['isolated_checker']['guarded_counts']==[61,72]
assert m['isolated_checker']['sha256']=='a525c25f96f526ce3594a0d9564a75215d3976a421163968223eeb9cb3f7ac58'
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['worker166_boundary']['new_recovery_count']==0
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['selected_import_base_count']==m['import_scope']['successful_replay_base_count']==2844
assert m['import_scope']['full_graph_nodes']==2857
assert m['import_scope']['all_new_source_graph_nodes']==len(m['source_graph'])==2858
assert len(m['import_scope']['imported_accepted187'])==8 and len(m['import_scope']['excluded_accepted187'])==1
assert m['recovery183']['current188_is_imported_reuse_not_new_recovery'] is True
assert m['coverage_partition']['new_recovery']['module_count']==0
assert [f['source'][k] for k in ['recounted_rows','recounted_coefficients','recounted_wedge','recounted_beyond_old_column','total_polygon']]==[994,23472,3188,662,488872]
assert f['source']['recounted_polygon']==[162774,162774,163324]
assert f['integer']['case_count']==75 and f['integer']['q_and_group_indices']==1875 and f['integer']['fourth_auxiliary_count']==128
assert [f['fourth_moment'][k] for k in ['domain_count','quadratic_count','beyond_old_count']]==[210,88,47]
assert [f['qfree_probe'][k] for k in ['count','distinct']]==[486,432]
assert [f['qfree_stress'][k] for k in ['count','distinct','failure_entries']]==[1184,1056,3]
assert f['qfree_search']['domain_count']==324 and f['qfree_search']['saved_failures']==25
assert f['fourth_gap']['terms']==154 and f['fourth_gap']['source_literal_array_matches'] is True
assert f['fourth_moment_cert']['reduced_terms']==83 and f['fourth_moment_cert']['reduced_literal_array_matches'] is True
assert h['compiled_only']['module']==s['compiled_only']['module']=='MarkovTopFirstCentralTinyM731'
assert len(b['files'])==b['count']==2 and b['bytes']==12458
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
 assert obs['applicable'] is False and obs['paths']=={} and obs.get('observed_at_utc',obs.get('observed_utc'))
cas=v['final_optional_cas_observation'];assert cas['path_count']==len(cas['paths'])==16 and cas['observed_at_utc'] and cas['finished_utc']
assert set(cas['paths'])=={x['content_addressed_observation']['path'] for x in v['objects']}
for x in v['objects']:
 y=cas['paths'][x['content_addressed_observation']['path']]
 assert x['content_addressed_observation']['present'] is True and y['present'] is True and y['matches_retained_object'] is True
 assert y['sha256']==x['archive']['sha256']==x['current']['sha256'] and y['bytes']==x['archive']['bytes']==x['current']['bytes']
closing=v['late_scope_observation'];assert closing['archive_count']==130 and closing['current_count']==132 and closing['manifest_count']==128
for k in ['added_current','missing_current','added_archive','missing_archive','archive_hash_changes','current_hash_changes','manifest_mismatches']:assert closing[k]==[],(k,closing[k])
assert set(closing['unindexed_unarchived_paths'])=={x['relative_path'] for x in b['files']}
assert closing['metadata_count']==len(closing['metadata_checks'])==4
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
pair=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_math_worker188.py'),pin(Path(__file__))];reviewpin=pin(T/(PRE+'final_crossreview.json'))
preserve=[x['path'] for x in files]+[pair['path']]+[x['path'] for x in helpers]+[reviewpin['path']]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==16
out=dict(worker=188,request=REQUEST,sealed_at_utc=datetime.now(timezone.utc).isoformat(),scope='Static archive-first closed188 audit; sealer reads T only. No project execution, mathematical recomputation, active189+ reads or proposer assistance. Earlier outcomes/windows unchanged.',files=files,receipt_pin=v['receipt_pin'],historical_outcome=v['receipt'],timing=v['timing'],counts=v['counts'],root_contract_binding=v['root_contract_binding'],mathematical_scope=h['source_level_scope'],mathematical_values_recomputed=False,finite_domains_and_qualifications=f,prior184_recovery_of183=v['preserved184_recovery_of183'],recovery_qualification=v['recovery_qualification'],coverage_partition=m['coverage_partition'],imported_recovery183=m['recovery183'],isolation=m['isolated_checker'],import_scope=m['import_scope'],endpoint_import_boundaries=m['endpoint_import_boundaries'],historical_boundaries={k:m[k] for k in ['worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','worker166_current188','historical_nested_field_qualification','named_older_window_boundary','named_older_abel_boundary','historical_boundaries']},compiler_summary=m['compiler_attempt_summary'],printed_closures=m['printed_closure_summary'],failed_versions=m['rejected_builds'],superseded_successes=m['superseded_successes'],validation=v['validation'],validation_stages=v['validation_stages'],pending_drafts=[],compiled_only=s['compiled_only'],optional_CAS_qualification='Sixteen optional controller CAS paths present and matching complete archive/current objects at initial and final availability observations; not fresh proof validation or completion-time binary attestation.',preservation=dict(checks=v['checks'],initial_input_count=len(v['initial_checks']),archive_artifacts=130,manifest_entries=128,supplemental_unindexed_cache_bundle=dict(metadata=b,observation=o,files=extra,qualification='Two opaque unindexed/unarchived cache files, exact bytes only. No decoding, producer attribution, creation inference or proof upgrade. Original archive unchanged.')),final_observations=dict(validation=v['final_static_stability'],method=m['final_static_observation'],validation_project_reads_closed=v['project_reads_closed_utc'],method_project_reads_closed=m['project_reads_closed_utc'],late_scope=v['late_scope_observation'],validation_absence=v['final_absence_observation'],method_absence=m['final_absence_observation'],optional_CAS_availability=cas,seal_extends_project_window=False),crossreview=dict(record=cr,pin=reviewpin,temporary_input_rechecks=rechecks,primary_preparation=h.get('audit_helper_corrections'),validation_preparation=v.get('preparation_history'),post_observation_note_rendering=v.get('post_observation_note_rendering'),pre_window_audit_refinements=v.get('pre_window_audit_refinements'),independent_inherited_pair_check=v.get('independent_inherited_pair_check'),method_preparation=m.get('audit_helper_refinements'),method_fields_compared=len(v['method_crosscheck']),pair_crosscheck=v['method_pair_crosscheck'],shared_input_crosscheck=v['method_shared_input_crosscheck']),inherited_pair_map=pair,audit_helpers=helpers,preservation_paths=preserve,pending_required_research_execution=False,completion_claim=False)
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps(dict(main=files[0],integrity=pin(outpath),preservation_count_including_integrity=len(preserve)+1,supplemental_files=extra),indent=2))
