#!/usr/bin/env python3
"""Audit-files-only consistency seal. No project reads/programs/mathematical computation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000184_';REQUEST='eb6a900170904ab59255de637301f446'
def local(p):
 p=Path(p);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(p):
 p=local(p);b=p.read_bytes();return dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
def load(n):return json.loads(local(T/(PRE+n)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
FIXED_PINS = {'markov_worker_000184_mathematical_source_hashes.json': '765ae572dd22d8d176b77ca3b9d991632f5b6684a86165ea2322ce565fe83059', 'markov_worker_000184_source_structure_audit.json': '0653cd390657fc883b7305d23af72f0b99034ea3859f24d140430961c14b7540', 'markov_worker_000184_finite_domain_audit.json': 'a380340a7242a1f5c4c92c94d5a2d91d504047aca196fba88f2cf567518ff744', 'markov_worker_000184_validation_audit.md': 'a01cadc8fc4e100fa200aedc905549c90a9b2cdcff77cb0431d1a74d498db7e9', 'markov_worker_000184_validation_evidence.json': 'd8a212ed976c2e965f5e6568389314a5151d8c69a8b51944984ca16100dd962a', 'markov_worker_000184_replay_method.md': '7353dfe5564140d5b899f72c2031fdb7955a05a5ba7116fb3424a848aee5a6ae', 'markov_worker_000184_replay_method_evidence.json': '06783cd253cd191f6154d73b5cd22be4dbab3c7271f9324cefdc54601ffc1e4b', 'markov_worker_000184_inherited_pair_expectations.json': 'd44f30053d87038ec4b92988a646c44d62cfe903fb8a02d2f85f2eeee5314a13', 'markov_worker_000184_unindexed_cache_bundle.json': '3ad78a66673d642c11825d6404885019362814ad10b62373e22e5ccf189fb027', 'markov_worker_000184_unindexed_cache_observation.json': 'fcc643d626ec38c00799e68ddd80daae143d1ede5a5b41cfe09099ab1064ccfa', 'static_math_worker184.py': 'c7479e1f077f6fb421f36b7d7f01a50b66ed30642539a70b96ee9504c70dda2b'}
assert FIXED_PINS
for p,h0 in FIXED_PINS.items():assert pin(T/p)['sha256']==h0,p
h=load('mathematical_source_hashes.json');s=load('source_structure_audit.json');f=load('finite_domain_audit.json');v=load('validation_evidence.json');m=load('replay_method_evidence.json');b=load('unindexed_cache_bundle.json');o=load('unindexed_cache_observation.json');cr=load('final_crossreview.json')
for x in [h,s,f,v,b,o,cr]:assert x['worker']==184 and x['request']==REQUEST
assert m['worker']==184 and m['request_id']==REQUEST
assert h['counts']==s['counts']==dict(selected_modules=21,recovered183=10,new184=11,theorems=94,definitions=46,recovered_theorems=54,new_theorems=40)
assert h['source_level_scope']==s['source_level_scope']
assert v['receipt']['outcome']=='completed' and v['receipt']['returncode']==0 and v['receipt']['report'] is not None and v['receipt']['mathematical_resolution'] is False
assert v['receipt_pin']['sha256']=='c7eaeb3ee3e197db66a0ade9453907964a2c50bb4f9c81c9fe9609063829c6b9'
assert v['timing']['elapsed_seconds']==v['timing']['calculated_elapsed_seconds']==1412.7423160076141
assert v['timing']['host_margin_seconds']==387.25768399238586
for k,n in [('selected_modules',21),('new_modules',11),('recovered_modules',10),('build_receipts',29),('successful_math_builds',21),('successful_audit_builds',1),('rejected_builds',7),('timeouts',0),('replay_invocations',1),('replayed_modules',21),('printed_closures',94),('new_printed_closures',40),('recovered_printed_closures',54),('compiled_unselected_math',0),('pending_math',0)]:assert v['counts'][k]==n,(k,v['counts'][k])
assert all(v['checks'].values())
assert v['counts']['all_selected_declarations']==m['all_new_counts']=={'def':46,'theorem':94}
assert m['coverage_partition']['new184']['counts']=={'def':20,'theorem':40} and m['coverage_partition']['recovered183']['counts']=={'def':26,'theorem':54}
assert set(v['selection'])==set(v['validation']['modules'])==set(m['coverage_partition']['selected']['modules'])
assert m['compiler_attempt_summary']=={'attempts':29,'rc1':7,'success':22,'timeouts':0}
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':92,'propext,Quot.sound':2},'distinct':94,'rows':94}
assert m['isolated_checker']['guard_suffixes']==['M55C','MEB6'] and m['isolated_checker']['guarded_counts']==[140]
assert m['isolated_checker']['sha256']=='e6e4c2d5978d872af2fa6cb975c7c76ec64b9b413ce9a9999a513692791827f2'
assert m['isolated_checker']['body_equal_prior183_except_added_suffix'] is True
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['selected_import_base_count']==m['import_scope']['successful_replay_base_count']==2797
assert m['import_scope']['full_graph_nodes']==2818 and len(m['source_graph'])==2818
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['worker166_boundary']['new_recovery_count']==0
assert h['mathematical_values_recomputed'] is s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert f['source']['rows_recounted']==746 and f['source']['coefficient_positions_recounted']==13948 and f['source']['short_formula_recounted']==3546
assert f['source']['edge_calls_recounted']==1076 and f['source']['distinct_edge_domain_positions']==1038
assert f['source']['polygon_triples_recounted']==[90383,90383,90889] and f['source']['total_polygon_triples']==271655
assert f['gap']['gap_domains_recounted']==1225 and f['gap']['coefficient_slots_recounted']==50225
assert f['newton']['identity_checks_recounted']==322 and f['newton']['cases_recounted']==26 and f['monomial']['cases_recounted']==7
assert [x['terms'] for x in f['certificates']]==[99,70]
assert all(x['all_serialized_terms_match_Lean_identity_inorder'] and x['all_terms_present_in_positivity_expression'] and x['polynomial_recalculated'] is False for x in f['certificates'])
assert len(b['files'])==b['count']==3 and b['bytes']==16873
extra=[pin(T/(PRE+'unindexed_cache_bundle.json')),pin(T/(PRE+'unindexed_cache_observation.json'))]
assert extra[1]['path']==b['observation']['path'] and extra[1]['sha256']==b['observation']['sha256']
for x in b['files']:
 q=pin(x['path']);assert q['sha256']==x['sha256'] and q['bytes']==x['bytes'];extra.append(q)
assert set(b['preservation_paths'])=={x['path'] for x in extra}
# Final observations were already completed by independent reviewers; no project re-reads here.
for obs,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_input_stability'],m['static_input_sha256'])]:
 assert obs['all_unchanged'] is True and obs['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert obs.get(k,[])==[]
assert v['project_reads_closed_utc'] and m['project_reads_closed_utc']
for obs in [v['final_absence_observation'],m['final_absence_observation']]:
 assert obs['applicable'] is False and obs['paths']=={} and obs.get('observed_at_utc',obs.get('observed_utc'))
closing=v['late_scope_observation']
assert closing['archive_count']==131 and closing['current_count']==144 and closing['manifest_count']==139
for key in ['added_current','missing_current','added_archive','missing_archive','archive_hash_changes','current_hash_changes','manifest_mismatches']:assert closing[key]==[],(key,closing[key])
assert set(closing['unindexed_unarchived_paths'])=={x['relative_path'] for x in b['files']}
assert closing['metadata_count']==len(closing['metadata_checks'])==6
assert all(x['all_stable_match'] is True for x in closing['metadata_checks'])
assert {x['path'] for x in closing['metadata_checks']}=={x[k] for x in b['files'] for k in ['source','path']}
assert v['method_pair_crosscheck']['count']==2797 and v['method_pair_crosscheck']['sealed183_expected_set_matches'] is True
assert v['method_pair_crosscheck']['no_recovered183_targets_in_base'] is True and v['method_pair_crosscheck']['current_source_object_and_controller_before_match'] is True
assert v['method_pair_crosscheck']['pairmap']==pin(T/(PRE+'inherited_pair_expectations.json'))
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert len(v['method_crosscheck'])==v['method_crosscheck_summary']['copied_fields']
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert v['method_support_hashes']['evidence']==pin(T/(PRE+'replay_method_evidence.json'))
assert cr['both_final_audit_files_only_reviews_received'] is True and cr['necessary_corrections_remaining']==[]
# Rehash retained audit inputs only. Historical project hashes are evidence of bounded windows, not fresh reads.
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,digest in inputs.items():
  if p.startswith(str(T)+'/'):
   q=pin(p);assert q['sha256']==digest,(label,p);rows.append(q)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+n)) for n in suffixes];assert files[0]['sha256']==sys.argv[1]
assert cr['main_sha256']==files[0]['sha256']
assert cr['sealer_sha256']==pin(Path(__file__))['sha256']
for x in cr['support_pins']:assert pin(x['path'])==x
pair=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_math_worker184.py'),pin(Path(__file__))];reviewpin=pin(T/(PRE+'final_crossreview.json'))
preserve=[x['path'] for x in files]+[pair['path']]+[x['path'] for x in helpers]+[reviewpin['path']]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==17
out=dict(worker=184,request=REQUEST,sealed_at_utc=datetime.now(timezone.utc).isoformat(),scope='Static archive-first closed184 audit; sealer reads T only. No project programs, math recomputation, active185 reads or proposer assistance. Earlier outcomes/windows unchanged.',files=files,receipt_pin=v['receipt_pin'],historical_outcome=v['receipt'],timing=v['timing'],counts=v['counts'],root_contract_binding=v['root_contract_binding'],mathematical_scope=h['source_level_scope'],mathematical_values_recomputed=False,finite_domains_and_qualifications=f,recovery183=v['recovery183'],recovery_qualification=v['recovery_qualification'],late183_audit_attribution=v['late183_audit_attribution'],coverage_partition=m['coverage_partition'],isolation=m['isolated_checker'],import_scope=m['import_scope'],endpoint_import_boundaries=m['endpoint_import_boundaries'],historical_boundaries={k:m[k] for k in ['worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','named_older_window_boundary','named_older_abel_boundary','historical_boundaries']},compiler_summary=m['compiler_attempt_summary'],printed_closures=m['printed_closure_summary'],failed_versions=m['rejected_builds'],validation=v['validation'],preservation=dict(checks=v['checks'],initial_input_count=len(v['initial_checks']),archive_artifacts=131,manifest_entries=139,manifest_only_recovered_sources=v['recovered_selection'],supplemental_unindexed_cache_bundle=dict(metadata=b,observation=o,files=extra,qualification='Three opaque unindexed/unarchived cache files. Exact bytes only; no decoding, producer attribution or proof upgrade. Original archive unchanged.')),final_observations=dict(validation=v['final_static_stability'],method=m['final_static_input_stability'],validation_project_reads_closed=v['project_reads_closed_utc'],method_project_reads_closed=m['project_reads_closed_utc'],late_scope=v['late_scope_observation'],validation_absence=v['final_absence_observation'],method_absence=m['final_absence_observation'],seal_extends_project_window=False),crossreview=dict(record=cr,pin=reviewpin,temporary_input_rechecks=rechecks,pre_window_audit_refinements=v.get('pre_window_audit_refinements'),post_observation_note_rendering=v.get('post_observation_note_rendering'),primary_preparation=h.get('audit_helper_corrections'),method_preparation=m.get('audit_helper_refinements'),method_fields_compared=len(v['method_crosscheck']),pair_crosscheck=v['method_pair_crosscheck'],shared_input_crosscheck=v['method_shared_input_crosscheck']),inherited_pair_map=pair,audit_helpers=helpers,preservation_paths=preserve,pending_required_research_execution=False,completion_claim=False)
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps(dict(main=files[0],integrity=pin(outpath),preservation_count_including_integrity=len(preserve)+1,supplemental_files=extra),indent=2))
