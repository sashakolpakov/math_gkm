#!/usr/bin/env python3
"""Seal retained audit files only. No project reads, programs or mathematical values."""
from pathlib import Path
from datetime import datetime, timezone
import json, hashlib, sys
T=Path('/private/tmp/math_gkm_godel_20261013'); PRE='markov_worker_000186_'; REQUEST='ca9709f2af7048a4813bd37d46ae4ce9'
def local(p):
 p=Path(p); assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T); return p
def pin(p):
 p=local(p); b=p.read_bytes(); return dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
def load(n):return json.loads(local(T/(PRE+n)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json'); assert not outpath.exists()
FIXED_PINS = {'markov_worker_000186_mathematical_source_hashes.json': '8661c1208984de53fad25612db20b429b152ddedd3d390b6ee08e340b9039055', 'markov_worker_000186_source_structure_audit.json': '8d4af9a0de26369b0fab419e56f98874482616f260e0ec822660cf271d1fe479', 'markov_worker_000186_finite_domain_audit.json': 'c1553dc9555a0213a17e736e6f56ea71c87e2ebf6e102c0db3c0233a0d27a56c', 'markov_worker_000186_validation_audit.md': 'abf1ab634e7c07366177708fa35db868fdb2d3ceb902f61b08756e80c0f712ea', 'markov_worker_000186_validation_evidence.json': '5b3ff425ab73216ef81e33a5c81ec4df39f2e08335a234cb16ea41e9a257fe9c', 'markov_worker_000186_replay_method.md': '824c01a72189c769b88f4c35627f1c05df8f028ca706f3fda3115079a6d3b20c', 'markov_worker_000186_replay_method_evidence.json': '6c57b1c9f8b92d015c8bc064534b9b575751f824b52263b7f9748f17b3ec01ed', 'markov_worker_000186_inherited_pair_expectations.json': '7a6144c1cf23fc4dc522e69a1b742573dc2913a245b9847f76ad68658863f1ab', 'markov_worker_000186_unindexed_cache_bundle.json': '7d9d5fed83feeeeedb65fecd7e4148c4dba71063eb7f7eedc0e9782482368441', 'markov_worker_000186_unindexed_cache_observation.json': '54312da427987a258bcbf1ba988dd01604193e17f2087562f4c1f7c61a33da43', 'markov_worker_000186_late_observed_bundle.json': 'c337aaaa181d892d5bd9a11be74efaca2774eec20f844da8aabd7bd503ba6681', 'markov_worker_000186_late_observed_observation.json': '61fedaa36f399df85c1bdf42a4722d3c6cfde882954a0d3295c85c5e06a0bca4', 'static_math_worker186.py': '089f630a9552b6a85c0045bd941d9feaab76f022ccf4c0db707dc19ec5346ca8'}
assert FIXED_PINS
for p,h0 in FIXED_PINS.items():assert pin(T/p)['sha256']==h0,p
h=load('mathematical_source_hashes.json'); s=load('source_structure_audit.json'); f=load('finite_domain_audit.json'); v=load('validation_evidence.json'); m=load('replay_method_evidence.json'); b=load('unindexed_cache_bundle.json'); o=load('unindexed_cache_observation.json'); cr=load('final_crossreview.json'); lb=load('late_observed_bundle.json'); lo=load('late_observed_observation.json')
for x in [h,s,f,v,b,o,cr,lb,lo]:assert x['worker']==186 and x['request']==REQUEST
assert m['worker']==186 and m['request_id']==REQUEST
assert h['counts']==s['counts']==dict(selected_modules=12,theorems=73,definitions=20)
assert h['source_level_scope']==s['source_level_scope']
assert v['receipt']['outcome']=='completed' and v['receipt']['returncode']==0 and v['receipt']['report'] is not None and v['receipt']['mathematical_resolution'] is False
assert v['receipt_pin']['sha256']=='4960e6998376064a8734d558a6db09d3e35bbbfe970bde005b6ba048f983859f'
assert v['timing']['elapsed_seconds']==1740.9927248954773
assert v['timing']['calculated_elapsed_seconds']==1740.992723941803
assert v['timing']['elapsed_difference_seconds']==9.5367431640625e-07
assert v['timing']['host_margin_seconds']==59.00727605819702
for k,n in [('selected_modules',12),('new_modules',12),('recovered_modules',0),('build_receipts',22),('successful_math_builds',12),('successful_audit_builds',2),('rejected_builds',8),('timeouts',0),('replay_invocations',2),('replayed_modules',12),('printed_closures',73),('printed_rows_across_stages',118),('compiled_unselected_math',0),('pending_math',0)]:assert v['counts'][k]==n,(k,v['counts'][k])
assert all(v['checks'].values())
assert v['counts']['all_selected_declarations']==m['all_new_counts']=={'def':20,'theorem':73}
assert set(v['selection'])==set(v['validation']['modules'])==set(m['coverage_partition']['selected']['modules'])
for k,n in [('attempts',22),('rc1',8),('success',14),('timeouts',0),('successful_audit',2),('successful_math',12)]:assert m['compiler_attempt_summary'][k]==n
assert m['printed_closure_summary']['distinct']==73 and m['printed_closure_summary']['rows']==118
assert m['isolated_checker']['guard_suffixes']==['MCA9'] and m['isolated_checker']['guarded_counts']==[59,93]
assert m['isolated_checker']['sha256']=='2ca212d0790f2223d78aad01d4a3a5502d383f1cdbf337ea456069119493095e'
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['worker166_boundary']['new_recovery_count']==0
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['selected_import_base_count']==m['import_scope']['successful_replay_base_count']==2825
assert m['import_scope']['full_graph_nodes']==len(m['source_graph'])==2837
assert m['import_scope']['excluded_accepted185']==['MarkovTopTailPolynomialMDCB'] and len(m['import_scope']['imported_accepted185'])==8
assert m['recovery183']['current186_is_imported_reuse_not_new_recovery'] is True
assert m['coverage_partition']['new_recovery']['module_count']==0
assert h['mathematical_values_recomputed'] is s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert [f['source'][k] for k in ['rows_recounted','coefficient_positions_recounted','linear_rows_recounted','linear_triples_recounted','strict_columns_recounted','total_polygon_triples']]==[1792,34402,671,9722,10342,655603]
assert f['source']['polygon_triples_recounted']==[218288,218288,219027]
assert [f['groups'][k] for k in ['group_indices','full_gap_parameter_cases','linear_parameter_cases']]==[91676,2132,533]
assert [f[k]['domain_count'] for k in ['stronger_base','stein','stein_stress']]==[309969,6061,423]
assert f['stein_large']['domain_count_with_multiplicity']==120 and f['stein_large']['distinct_domain_count']==105 and f['stein_large']['failure_entries']==28
assert f['weighted_certificate']['reduced_literal_count']==123 and f['weighted_certificate']['positive_literal_count']==176
assert f['weighted_certificate']['reduced_and_positive_literals_match_source'] is True
assert f['weighted_certificate']['constant_literal']==[[0,0,0,0],'3338496']
assert len(b['files'])==b['count']==4 and b['bytes']==34823
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
assert cas['path_count']==len(cas['paths'])==14 and cas['observed_at_utc'] and cas['finished_utc']
assert set(cas['paths'])=={x['content_addressed_observation']['path'] for x in v['objects']}
assert all(isinstance(x['present'],bool) for x in cas['paths'].values())
for x in v['objects']:
 y=cas['paths'][x['content_addressed_observation']['path']]
 assert x['content_addressed_observation']['present'] is True and y['present'] is True and y['matches_retained_object'] is True
 assert y['sha256']==x['archive']['sha256']==x['current']['sha256'] and y['bytes']==x['archive']['bytes']==x['current']['bytes']
closing=v['late_scope_observation']
assert closing['archive_count']==117 and closing['current_count']==122 and closing['manifest_count']==115
for key in ['missing_current','added_archive','missing_archive','archive_hash_changes','current_hash_changes','manifest_mismatches']:assert closing[key]==[],(key,closing[key])
assert closing['added_current']==['research/__pycache__/stein_symbolic_ca9709f2.cpython-314.pyc']
assert set(closing['unindexed_unarchived_paths'])=={x['relative_path'] for x in b['files']+lb['files']}
assert closing['metadata_count']==len(closing['metadata_checks'])==8
assert all(x['all_stable_match'] is True for x in closing['metadata_checks'])
assert {x['path'] for x in closing['metadata_checks']}=={x[k] for x in b['files'] for k in ['source','path']}
assert lb['count']==len(lb['files'])==1 and lb['bytes']==10850
assert lo['files']==lb['files']
assert v['late_observed_retention']['separate_interval']=={'started_utc':lo['copy_started_utc'],'finished_utc':lo['copy_finished_utc']}
assert lo['original_project_reads_closed_utc']==v['project_reads_closed_utc']
assert lo['initial_current_count']==121 and lo['closing_current_count']==122
assert v['late_observed_retention']['original_observation_unchanged'] is True and v['late_observed_retention']['original_input_hash_map_unchanged'] is True
late_extra=[pin(T/(PRE+'late_observed_bundle.json')),pin(T/(PRE+'late_observed_observation.json'))]
assert late_extra[0]==v['late_observed_retention']['manifest'] and late_extra[1]==lb['observation']==v['late_observed_retention']['observation']
assert pin(v['late_observed_retention']['helper']['path'])==v['late_observed_retention']['helper']==lb['helper']
for x in lb['files']:
 q=pin(x['path']);assert q==v['late_observed_retention']['copy'] and q['sha256']==x['sha256']==x['copy_hash']==x['source_hash_after'] and q['bytes']==x['bytes']
 assert x['all_stable_match'] is True and x['relative_path']==closing['added_current'][0]
 for key in ['bytes','mode','uid','gid','mtime_ns']:
  assert all(x[label][key]==x['source_before'][key] for label in ['source_after_initial_hash','copy_metadata','source_after_copy','source_after_final_hash'])
 assert x['copy_metadata']['inode']!=x['source_before']['inode']
 late_extra.append(q)
assert {x['path'] for x in late_extra}==set(lb['preservation_paths'])==set(v['late_observed_retention']['preservation_paths'])
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
pair=pin(T/(PRE+'inherited_pair_expectations.json')); helpers=[pin(T/'static_math_worker186.py'),pin(Path(__file__))]; reviewpin=pin(T/(PRE+'final_crossreview.json'))
preserve=[x['path'] for x in files]+[pair['path']]+[x['path'] for x in helpers]+[reviewpin['path']]+[x['path'] for x in extra]+[x['path'] for x in late_extra]
assert len(preserve)==len(set(preserve))==21
out=dict(worker=186,request=REQUEST,sealed_at_utc=datetime.now(timezone.utc).isoformat(),scope='Static archive-first closed186 audit; sealer reads T only. No project execution, mathematical recomputation, active187 reads or proposer assistance. Earlier outcomes/windows unchanged.',files=files,receipt_pin=v['receipt_pin'],historical_outcome=v['receipt'],timing=v['timing'],counts=v['counts'],root_contract_binding=v['root_contract_binding'],mathematical_scope=h['source_level_scope'],mathematical_values_recomputed=False,finite_domains_and_qualifications=f,prior184_recovery_of183=v['preserved184_recovery_of183'],recovery_qualification=v['recovery_qualification'],coverage_partition=m['coverage_partition'],imported_recovery183=m['recovery183'],isolation=m['isolated_checker'],import_scope=m['import_scope'],endpoint_import_boundaries=m['endpoint_import_boundaries'],historical_boundaries={k:m[k] for k in ['worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','worker166_current186','historical_nested_field_qualification','named_older_window_boundary','named_older_abel_boundary','historical_boundaries']},compiler_summary=m['compiler_attempt_summary'],printed_closures=m['printed_closure_summary'],failed_versions=m['rejected_builds'],validation=v['validation'],validation_stages=v['validation_stages'],optional_CAS_qualification='Fourteen optional controller CAS paths were present and matched complete archive/current objects initially and at the separate final availability observation. Availability is not fresh proof validation or a completion-time binary attestation.',preservation=dict(checks=v['checks'],initial_input_count=len(v['initial_checks']),archive_artifacts=117,manifest_entries=115,supplemental_unindexed_cache_bundle=dict(metadata=b,observation=o,files=extra,qualification='Four opaque unindexed/unarchived cache files. Exact bytes only; no decoding, producer attribution or proof upgrade. Original archive unchanged.'),supplemental_late_observed_bundle=dict(metadata=lb,observation=lo,files=late_extra,qualification='One separately retained late-observed opaque cache; original hash map/window and four-cache bundle unchanged. No attribution or proof upgrade.')),final_observations=dict(validation=v['final_static_stability'],method=m['final_static_input_stability'],validation_project_reads_closed=v['project_reads_closed_utc'],method_project_reads_closed=m['project_reads_closed_utc'],late_scope=v['late_scope_observation'],validation_absence=v['final_absence_observation'],method_absence=m['final_absence_observation'],optional_CAS_availability=cas,separate_late_path_retention=v['late_observed_retention'],seal_extends_project_window=False),crossreview=dict(record=cr,pin=reviewpin,temporary_input_rechecks=rechecks,primary_preparation=h.get('audit_helper_corrections'),validation_preparation=v.get('preparation_history'),post_observation_note_rendering=v.get('post_observation_note_rendering'),pre_window_audit_refinements=v.get('pre_window_audit_refinements'),pre_window_helper_refinements=v.get('pre_window_helper_refinements'),independent_inherited_pair_check=v.get('independent_inherited_pair_check'),method_preparation=m.get('audit_helper_refinements'),method_fields_compared=len(v['method_crosscheck']),pair_crosscheck=v['method_pair_crosscheck'],shared_input_crosscheck=v['method_shared_input_crosscheck']),inherited_pair_map=pair,audit_helpers=helpers,preservation_paths=preserve,pending_required_research_execution=False,completion_claim=False)
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps(dict(main=files[0],integrity=pin(outpath),preservation_count_including_integrity=len(preserve)+1,supplemental_files=extra,late_supplemental_files=late_extra),indent=2))
