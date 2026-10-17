#!/usr/bin/env python3
"""Seal retained audit files only. No project reads, programs or mathematical values."""
from pathlib import Path
from datetime import datetime, timezone
import json, hashlib, sys
T=Path('/private/tmp/math_gkm_godel_20261013'); PRE='markov_worker_000185_'; REQUEST='dcb6402998ac4eed9feb37199e0f0cee'
def local(p):
 p=Path(p); assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T); return p
def pin(p):
 p=local(p); b=p.read_bytes(); return dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
def load(n):return json.loads(local(T/(PRE+n)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json'); assert not outpath.exists()
FIXED_PINS = {'markov_worker_000185_mathematical_source_hashes.json': 'ba0b2671fa5fa358bb7894bea79d76b348ed4899a87165b94c9bee541d4072bd', 'markov_worker_000185_source_structure_audit.json': 'b7e360b853dd4bc21a9a5695ffcc353078d3835ecbcad0736f35c5097f18c15c', 'markov_worker_000185_finite_domain_audit.json': 'b894a64a7cb096209314a93d1663d8ae530f926ed0817d7dd7e104ffca3b5849', 'markov_worker_000185_validation_audit.md': '0e2f570e3c806f4dc1eb128902ce7ee5cef06ee8be2d1b072d706687fa0da091', 'markov_worker_000185_validation_evidence.json': 'dbbeb56537889177bbe993f6b72ad9dc2f5bddbc5f6d72fa9b0fafe3b5f5bea3', 'markov_worker_000185_replay_method.md': 'cb0f227a87daee591914cd790c890b8fc670987aa333d0d8418974a1a8eccdbb', 'markov_worker_000185_replay_method_evidence.json': '15c607c7e978e508d33b04146d0ae3613216a546ae80b98879f03b6ff1943d5a', 'markov_worker_000185_inherited_pair_expectations.json': '04d08ca297270863f46e07b833f46a70988a8003e51c0fcdbff7a6967e22c878', 'markov_worker_000185_unindexed_cache_bundle.json': '8944c5a395aa76c3640d4c1dfebd8756254ec4df13f25a036e37a715659dfeeb', 'markov_worker_000185_unindexed_cache_observation.json': '736fe6256921166484e96aaa481bd07ab8ccf31ef13b5ca071f629fbdae1fdb4', 'static_math_worker185.py': '28189c7a8ddd5d021a0662d7b7beca3ca4037f2589bb6b9c816a7eddc58e8197'}
assert FIXED_PINS
for p,h0 in FIXED_PINS.items():assert pin(T/p)['sha256']==h0,p
h=load('mathematical_source_hashes.json'); s=load('source_structure_audit.json'); f=load('finite_domain_audit.json'); v=load('validation_evidence.json'); m=load('replay_method_evidence.json'); b=load('unindexed_cache_bundle.json'); o=load('unindexed_cache_observation.json'); cr=load('final_crossreview.json')
for x in [h,s,f,v,b,o,cr]:assert x['worker']==185 and x['request']==REQUEST
assert m['worker']==185 and m['request_id']==REQUEST
assert h['counts']==s['counts']==dict(selected_modules=9,theorems=51,definitions=25)
assert h['source_level_scope']==s['source_level_scope']
assert v['receipt']['outcome']=='completed' and v['receipt']['returncode']==0 and v['receipt']['report'] is not None and v['receipt']['mathematical_resolution'] is False
assert v['receipt_pin']['sha256']=='330d9363efd22ff503710adf8919ebf0e834026139fe4223ee87a8b54a3741f4'
assert v['timing']['elapsed_seconds']==v['timing']['calculated_elapsed_seconds']==1667.8943130970001
assert v['timing']['host_margin_seconds']==132.10568690299988
for k,n in [('selected_modules',9),('new_modules',9),('recovered_modules',0),('build_receipts',14),('successful_math_builds',9),('successful_audit_builds',2),('rejected_builds',3),('timeouts',0),('replay_invocations',2),('replayed_modules',9),('printed_closures',51),('printed_rows_across_stages',98),('compiled_unselected_math',0),('pending_math',0)]:assert v['counts'][k]==n,(k,v['counts'][k])
assert all(v['checks'].values())
assert v['counts']['all_selected_declarations']==m['all_new_counts']=={'def':25,'theorem':51}
assert set(v['selection'])==set(v['validation']['modules'])==set(m['coverage_partition']['selected']['modules'])
for k,n in [('attempts',14),('rc1',3),('success',11),('timeouts',0),('successful_audit',2),('successful_math',9)]:assert m['compiler_attempt_summary'][k]==n
assert m['printed_closure_summary']['distinct']==51 and m['printed_closure_summary']['rows']==98
assert m['isolated_checker']['guard_suffixes']==['MDCB'] and m['isolated_checker']['guarded_counts']==[72,76]
assert m['isolated_checker']['sha256']=='9e47b8e9c040e3dd282128b79c73f6a5e62896f9ded442549b48d27d0a312ec3'
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['worker166_boundary']['new_recovery_count']==0
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['selected_import_base_count']==m['import_scope']['successful_replay_base_count']==2817
assert m['import_scope']['full_graph_nodes']==len(m['source_graph'])==2826
assert m['import_scope']['excluded_accepted184']==['MarkovTopObstructionsM55C'] and len(m['import_scope']['imported_accepted184'])==20
assert m['recovery183']['current185_is_imported_reuse_not_new_recovery'] is True
assert m['coverage_partition']['new_recovery']['module_count']==0
assert h['mathematical_values_recomputed'] is s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert [f['source'][k] for k in ['rows_recounted','coefficient_positions_recounted','tail_identity_parameter_cases','new_tail_calls_recounted','total_polygon_triples']]==[952,15944,1950,1246,295433]
assert f['source']['polygon_triples_recounted']==[98269,98269,98895]
assert f['polynomial']['serialized_term_count_sum']==147225 and f['polynomial']['cases']==39
assert f['antidiagonal']['group_count']==165 and f['parameter']['domain_count']==8568 and f['weight']['domain_count']==4704
assert [f['beta'][k] for k in ['moment_domains_recounted','radial_domains_recounted','positive_comparison_domains_recounted']]==[10365,64220,5184]
assert [x['terms'] for x in f['certificates']]==[117,176,21]
assert all(x['literal_terms_match_source'] and x['recomputed'] is False for x in f['certificates'])
assert len(b['files'])==b['count']==3 and b['bytes']==16543
extra=[pin(T/(PRE+'unindexed_cache_bundle.json')),pin(T/(PRE+'unindexed_cache_observation.json'))]
assert extra[1]['path']==b['observation']['path'] and extra[1]['sha256']==b['observation']['sha256']
for x in b['files']:
 q=pin(x['path']); assert q['sha256']==x['sha256'] and q['bytes']==x['bytes']; extra.append(q)
assert set(b['preservation_paths'])=={x['path'] for x in extra}
for obs,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert obs['all_unchanged'] is True and obs['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert not obs.get(k)
assert v['project_reads_closed_utc'] and m['project_reads_closed_utc']
for obs in [v['final_absence_observation'],m['final_absence_observation']]:
 assert obs['applicable'] is False and obs['paths']=={} and obs.get('observed_at_utc',obs.get('observed_utc'))
cas=v['final_optional_cas_observation']
assert cas['path_count']==len(cas['paths'])==11 and cas['observed_at_utc'] and cas['finished_utc']
assert set(cas['paths'])=={x['content_addressed_observation']['path'] for x in v['objects']}
assert all(isinstance(x['present'],bool) for x in cas['paths'].values())
for x in v['objects']:
 y=cas['paths'][x['content_addressed_observation']['path']]
 assert x['content_addressed_observation']['present'] is False and y['present'] is True and y['matches_retained_object'] is True
 assert y['sha256']==x['archive']['sha256']==x['current']['sha256'] and y['bytes']==x['archive']['bytes']==x['current']['bytes']
closing=v['late_scope_observation']
assert closing['archive_count']==95 and closing['current_count']==98 and closing['manifest_count']==93
for key in ['added_current','missing_current','added_archive','missing_archive','archive_hash_changes','current_hash_changes','manifest_mismatches']:assert closing[key]==[],(key,closing[key])
assert set(closing['unindexed_unarchived_paths'])=={x['relative_path'] for x in b['files']}
assert closing['metadata_count']==len(closing['metadata_checks'])==6
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
   q=pin(p); assert q['sha256']==digest,(label,p); rows.append(q)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+n)) for n in suffixes]; assert files[0]['sha256']==sys.argv[1]
assert cr['main_sha256']==files[0]['sha256'] and cr['sealer_sha256']==pin(Path(__file__))['sha256']
for x in cr['support_pins']:assert pin(x['path'])==x
pair=pin(T/(PRE+'inherited_pair_expectations.json')); helpers=[pin(T/'static_math_worker185.py'),pin(Path(__file__))]; reviewpin=pin(T/(PRE+'final_crossreview.json'))
preserve=[x['path'] for x in files]+[pair['path']]+[x['path'] for x in helpers]+[reviewpin['path']]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==17
out=dict(worker=185,request=REQUEST,sealed_at_utc=datetime.now(timezone.utc).isoformat(),scope='Static archive-first closed185 audit; sealer reads T only. No project execution, mathematical recomputation, active186 reads or proposer assistance. Earlier outcomes/windows unchanged.',files=files,receipt_pin=v['receipt_pin'],historical_outcome=v['receipt'],timing=v['timing'],counts=v['counts'],root_contract_binding=v['root_contract_binding'],mathematical_scope=h['source_level_scope'],mathematical_values_recomputed=False,finite_domains_and_qualifications=f,prior184_recovery_of183=v['preserved184_recovery_of183'],recovery_qualification=v['recovery_qualification'],coverage_partition=m['coverage_partition'],imported_recovery183=m['recovery183'],isolation=m['isolated_checker'],import_scope=m['import_scope'],endpoint_import_boundaries=m['endpoint_import_boundaries'],historical_boundaries={k:m[k] for k in ['worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','worker166_current185','historical_nested_field_qualification','named_older_window_boundary','named_older_abel_boundary','historical_boundaries']},compiler_summary=m['compiler_attempt_summary'],printed_closures=m['printed_closure_summary'],failed_versions=m['rejected_builds'],validation=v['validation'],validation_stages=v['validation_stages'],optional_CAS_qualification='Eleven optional controller CAS hash paths absent at initial observation; complete archive/current objects remain hash-bound. All eleven were present and matched already retained objects at the separate final availability observation; no producer/creation or validation upgrade inferred.',preservation=dict(checks=v['checks'],initial_input_count=len(v['initial_checks']),archive_artifacts=95,manifest_entries=93,supplemental_unindexed_cache_bundle=dict(metadata=b,observation=o,files=extra,qualification='Three opaque unindexed/unarchived cache files. Exact bytes only; no decoding, producer attribution or proof upgrade. Original archive unchanged.')),final_observations=dict(validation=v['final_static_stability'],method=m['final_static_input_stability'],validation_project_reads_closed=v['project_reads_closed_utc'],method_project_reads_closed=m['project_reads_closed_utc'],late_scope=v['late_scope_observation'],validation_absence=v['final_absence_observation'],method_absence=m['final_absence_observation'],optional_CAS_availability=cas,seal_extends_project_window=False),crossreview=dict(record=cr,pin=reviewpin,temporary_input_rechecks=rechecks,primary_preparation=h.get('audit_helper_corrections'),validation_preparation=v.get('preparation_history'),post_observation_note_rendering=v.get('post_observation_note_rendering'),pre_window_audit_refinements=v.get('pre_window_audit_refinements'),pre_window_helper_refinements=v.get('pre_window_helper_refinements'),independent_inherited_pair_check=v.get('independent_inherited_pair_check'),method_preparation=m.get('audit_helper_refinements'),method_fields_compared=len(v['method_crosscheck']),pair_crosscheck=v['method_pair_crosscheck'],shared_input_crosscheck=v['method_shared_input_crosscheck']),inherited_pair_map=pair,audit_helpers=helpers,preservation_paths=preserve,pending_required_research_execution=False,completion_claim=False)
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps(dict(main=files[0],integrity=pin(outpath),preservation_count_including_integrity=len(preserve)+1,supplemental_files=extra),indent=2))
