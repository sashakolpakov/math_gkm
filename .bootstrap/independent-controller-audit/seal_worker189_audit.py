#!/usr/bin/env python3
"""Audit-owned seal; reads only named T audit files. No project reads, proof/program execution, or mathematical evaluation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000189_';REQUEST='97b019af81a143628246a03e1f19b898'
def local(p):
 p=Path(p);assert p.is_absolute() and p.is_relative_to(T) and p.resolve().is_relative_to(T);return p
def pin(p):
 p=local(p);b=p.read_bytes();return dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
def load(n):return json.loads(local(T/(PRE+n)).read_text())
assert len(sys.argv)==2
outpath=T/(PRE+'audit_integrity.json');assert not outpath.exists()
h=load('mathematical_source_hashes.json');s=load('source_structure_audit.json');f=load('finite_domain_audit.json');v=load('validation_evidence.json');m=load('replay_method_evidence.json');b=load('partial_retention_bundle.json');o=load('partial_retention_observation.json');bp=load('partial_binary_retention_plan.json');cr=load('final_crossreview.json')
for x in [h,s,f,v,b,o,bp,cr]:assert x['worker']==189 and x['request']==REQUEST
assert m['worker']==189 and m['request_id']==REQUEST
assert h['counts']==s['counts']==dict(selected_modules=23,theorems=66,definitions=18)
assert v['receipt'] is None and v['host_report'] is None and v['receipt_absent'] is True
assert v['host_reconciliation']['outcome']=='uncertain_effects' and v['host_reconciliation']['report'] is None
assert v['host_reconciliation_pin']['sha256']=='c691742f5f4cd76fb392167f112502991afcb52caa7f2afdd90d8f592af800f0'
assert v['timing']['host_finished'] is None and v['timing']['host_elapsed'] is None
assert v['timing']['process_started']==1792234494.6767418
assert v['timing']['deadline_epoch']==1792236294.6767418
for k,n in [('selected_modules',23),('new_modules',23),('recovered_modules',0),('build_receipts',39),('operational_build_reports',40),('successful_math_builds',23),('successful_audit_builds',2),('overwritten_successful_math_build_reports',1),('rejected_builds',14),('rc1_builds',9),('timeouts',5),('replay_invocations',2),('replayed_modules',23),('printed_closures',66),('printed_rows_across_stages',90),('pending_math',1),('compiled_unselected_math',0)]:assert v['counts'][k]==n,(k,v['counts'][k])
assert v['counts']['all_selected_declarations']=={'def':18,'theorem':66}
assert v['counts']['all_new_declarations']=={'def':18,'theorem':68} and v['counts']['pending_declarations']=={'theorem':2}
for k in ['manifest_hashes_match','all_initial_inputs_unchanged','selected_receipts_match','all_retained_snapshot_event_summaries_match','selected_replay_and_print_maps_match']:assert v['checks'][k] is True
assert v['checks']['archive_complete'] is False and v['checks']['host_completed'] is False
assert v['receipt_collision']['lost_control_receipt_snapshot_not_reconstructed'] is True
assert set(v['selection'])==set(v['validation']['modules'])=={x['module'] for x in h['modules']}
assert [r['module_count'] for r in v['validation_stages']]==[6,23]
assert [r['guarded_names'] for r in v['validation_stages']]==[29,84]
assert [r['theorem_closures'] for r in v['validation_stages']]==[24,66]
assert v['checker']['sha256']=='923b009606dd86c73609fdc69424196963586a29120f5f4bbf4071fd9b96ba43'
assert set(v['selection'])==set(m['coverage_partition']['selected']['modules'])
assert m['compiler_attempt_summary']==dict(overwritten_reported_success=1,rc1=9,reported_operations=40,retained_receipts=39,success=25,successful_audit=2,successful_math=23,timeouts=5)
assert m['printed_closure_summary']['rows']==90 and m['printed_closure_summary']['distinct']==66 and m['printed_closure_summary']['final_rows']==66
assert m['isolated_checker']['guard_suffixes']==['M97B'] and m['isolated_checker']['guarded_counts']==[29,84]
assert m['isolated_checker']['sha256']==v['checker']['sha256']
assert m['import_scope']['full_graph_nodes']==2870 and m['import_scope']['all_new_source_graph_nodes']==2871
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['selected_import_base_count']==m['import_scope']['successful_replay_base_count']==2847
assert len(m['import_scope']['imported_accepted188'])==7 and len(m['import_scope']['excluded_accepted188'])==6
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['worker166_boundary']['new_recovery_count']==0
assert not m['superseded_successes']
assert all(not x['admission_literal_tokens'] for x in h['modules'])
assert [r['coefficient_literal_count'] for r in s['literal_certificates']]==[16,28,65,80,28,34,224,156,195,238,285]
assert [f['source_experiment'][k] for k in ['rows','coefficient_comparisons','quadratic_triples','beyond_old_linear_and_wedge','raw_polygon_total']]==[1020,26288,9748,3986,538256]
assert f['source_experiment']['raw_polygon_counts']==[179202,179202,179852]
assert f['fourth_experiment']['index_cases']==900 and f['sixth_experiment']['index_cases']==720
assert b['count']==len(b['files'])==124 and b['nonbinary_count']==122 and b['opaque_count']==2 and b['bytes']==3609264
assert bp['count']==19 and bp['bytes']==782958632
assert v['partial_retention']['count']==124 and v['partial_retention']['bytes']==3609264
extra=[pin(T/(PRE+n)) for n in ['partial_retention_bundle.json','partial_retention_observation.json','partial_binary_retention_plan.json']]
assert extra[1]['path']==b['observation']['path'] and extra[1]['sha256']==b['observation']['sha256']
for x in b['files']:
 q=pin(x['path']);assert q['sha256']==x['sha256'] and q['bytes']==x['bytes'];extra.append(q)
plan=v['special_partial_preservation_plan'];assert plan['original_archive_count']==39 and plan['supplemental_copy_count']==124 and plan['protected_in_place_current_binary_count']==19
assert plan['no_binary_copies'] is True and plan['original_archive_unchanged'] is True
assert v['project_reads_closed_utc'] and m['project_reads_closed_utc']
for obs,inputs in [(v['final_static_stability'],v['input_hashes']),(m['final_static_observation'],m['static_input_sha256'])]:
 assert obs['all_unchanged'] is True and obs['input_count']==len(inputs)
 for k in ['changed','missing','mismatches']:assert not obs.get(k)
assert v['method_pair_crosscheck']['pairmap']==pin(T/(PRE+'inherited_pair_expectations.json'))
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert all(value==m[key] for key,value in v['method_crosscheck'].items())
assert v['method_support_hashes']['evidence']==pin(T/(PRE+'replay_method_evidence.json'))
prefix='/Users/sasha/math_gkm/'
pending={prefix+'evidence/markov-97b019af/MarkovTopSmall5FastM97B.olean':True,prefix+'.control/markov/workers/000189/artifacts/evidence/markov-97b019af/MarkovTopSmall5FastM97B.olean':True}
admin={prefix+'.control/markov/workers/000189/receipt.json':True,prefix+'.control/markov/workers/000189/artifacts/evidence/markov-97b019af/validation.json':False,prefix+'.control/markov/workers/000189/artifacts/evidence/markov-97b019af/manifest.json':True,prefix+'.control/markov/workers/000189/artifacts/evidence/markov-97b019af/last-verification.json':True,prefix+'evidence/markov-97b019af/final-check.json':True}
for obs in [v['final_absence_observation'],m['final_absence_observation']]:assert obs['path_count']==2 and obs['paths']==pending and obs['applicable'] is True
assert v['final_administrative_observation']['path_count']==m['final_admin_absence_observation']['path_count']==5
assert v['final_administrative_observation']['paths']==m['final_admin_absence_observation']['paths']==admin
cas=v['final_optional_cas_observation'];assert cas['path_count']==len(cas['files'])==25
assert {r['path'] for r in cas['files']}=={r['content_addressed_observation']['path'] for r in v['objects']}
assert all(r['present'] is False for r in cas['files'])
for r in cas['files']:
 obj=next(z for z in v['objects'] if z['module']==r['module'])
 assert r['expected_sha256']==obj['current']['sha256'] and r['expected_bytes']==obj['current']['bytes']
late=v['late_scope_observation'];assert [late[k] for k in ['archive_count','current_count','manifest_count']]==[39,181,177]
for k in ['archive_added','archive_missing','current_added','current_missing','manifest_added','manifest_missing','archive_hash_changes','current_hash_changes','manifest_hash_changes','manifest_current_mismatch']:assert not late[k],(k,late[k])
assert late['archive_current_mismatch']==['evidence/markov-97b019af/MarkovTopSixthReducedSignM97B.olean']
assert set(late['unindexed_unarchived'])=={x['relative_path'] for x in b['files'] if x['opaque_cache']}|{'evidence/markov-97b019af/manifest.json','evidence/markov-97b019af/last-verification.json'}
assert late['supplemental_metadata_count']==len(late['supplemental_metadata_checks'])==248 and late['supplemental_metadata_all_match'] is True
assert {x['path'] for x in late['supplemental_metadata_checks']}=={x[k] for x in b['files'] for k in ['source','path']}
assert all(x['all_match'] is True and x['sha256_matches'] is True and all(x['stable_metadata_matches'].values()) for x in late['supplemental_metadata_checks'])
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
pair=pin(T/(PRE+'inherited_pair_expectations.json'));helpers=[pin(T/'static_math_worker189.py'),pin(Path(__file__))];reviewpin=pin(T/(PRE+'final_crossreview.json'))
misc=[pin(T/(PRE+n)) for n in ['operational_closure.json','receipt_watch.json','primary_source_pins.json']]+[pin(T/'watch_worker189_receipt.py')]
preserve=[x['path'] for x in files]+[pair['path']]+[x['path'] for x in helpers]+[reviewpin['path']]+[x['path'] for x in extra]+[x['path'] for x in misc]
assert len(preserve)==len(set(preserve))==143
out=dict(worker=189,request=REQUEST,sealed_at_utc=datetime.now(timezone.utc).isoformat(),scope='Static closed-interrupted189 audit, original partial archive with separately copied named missing source/evidence. Sealer reads T only; no project reads/execution, mathematical recomputation, later-worker inspection or proposer assistance. Earlier seals unchanged.',files=files,historical_outcome='uncertain_effects',receipt=None,report=None,returncode=None,controlling_closure_record=v['host_reconciliation_pin'],reconciliation=v['host_reconciliation'],local_final_report=v['raw_final_report'],local_final_report_qualification=v['raw_final_report_qualification'],timing=v['timing'],counts=v['counts'],root_contract_binding=v['root_contract_binding'],mathematical_scope=s['source_level_scope'],mathematical_values_recomputed=False,random_samples_regenerated=False,finite_domains_and_qualifications=f,compiler_attempts=v['runs'],receipt_collision=v['receipt_collision'],validation=v['validation'],validation_stages=v['validation_stages'],selected_method_scope={k:m[k] for k in ['coverage_partition','isolated_checker','import_scope','endpoint_import_boundaries','worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','historical_nested_field_qualification','named_older_window_boundary','named_older_abel_boundary','historical_boundaries','recovery183','compiler_attempt_summary','printed_closure_summary','superseded_successes','rejected_builds'] if k in m},retained_finalization=v['last_verification'],preservation=dict(checks=v['checks'],scope=v['preservation_scope'],special_partial_preservation_plan=plan,supplemental_partial_bundle=dict(metadata=b,observation=o,files=extra,qualification='122 missing-archive nonbinary files and two opaque caches retained separately; no repair to39-file archive, no cache interpretation/producer inference.19 ordinary objects hash-bound and protected in place, not copied.')),final_observations=dict(validation=v['final_static_stability'],method=m['final_static_observation'],validation_project_reads_closed=v['project_reads_closed_utc'],method_project_reads_closed=m['project_reads_closed_utc'],validation_absence=v['final_absence_observation'],method_absence=m.get('final_absence_observation'),validation_administrative=v['final_administrative_observation'],method_administrative=m['final_admin_absence_observation'],late_scope=v['late_scope_observation'],optional_CAS=v.get('final_optional_cas_observation'),seal_extends_project_window=False),crossreview=dict(record=cr,pin=reviewpin,temporary_input_rechecks=rechecks,primary_preparation=h.get('audit_helper_corrections'),validation_preparation=v.get('preparation_history'),method_preparation=m.get('audit_helper_refinements'),method_crosscheck=v.get('method_crosscheck_summary'),method_shared_input_crosscheck=v.get('method_shared_input_crosscheck'),method_pair_crosscheck=v.get('method_pair_crosscheck')),inherited_pair_map=pair,audit_helpers=helpers,additional_operational_pins=misc,preservation_paths=preserve,preservation_count_excluding_seal=143,preservation_count_including_seal=144,pending_required_research_execution=False,completion_claim=False)
outpath.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps(dict(main=files[0],integrity=pin(outpath),preservation_count_including_integrity=len(preserve)+1,supplemental_metadata=extra[:3],supplemental_copy_count=124),indent=2))
