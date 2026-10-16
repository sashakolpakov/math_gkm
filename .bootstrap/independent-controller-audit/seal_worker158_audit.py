"""Audit-files-only final integrity seal. No project reads or mathematical computation."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000158_'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p);assert p.is_relative_to(T);b=p.read_bytes()
 return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json')
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
assert all(d['worker']==158 for d in [v,m,h,s,f])
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['successful_target_counts']=={'theorem':43,'def':14}
assert len(h['new_sources'])==len(s['new_modules'])==11
assert len(h['named_older_comparisons'])==242 and h['all_named_new_match_current'] is True
assert len(h['pending_modules'])==1 and len(h['pending_modules'][0]['declarations'])==16
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] and h['residual_binding']['both_residual_conjuncts_unproved']
assert m['coverage']['compiled_only_without_replay']==[]
assert m['coverage']['unbuilt_math_drafts']==['unused-small-rows-candidate.lean']
for k,x in v['checks'].items():
 if k in ['method_independent_validation_agrees','selected_receipts_match']:assert x is True,(k,x)
 elif isinstance(x,bool):assert x is False,(k,x)
 else:assert x is None or x==[] or x=={},(k,x)
c=v['counts']
expected={'new_math':11,'new_theorems':43,'new_definitions':14,'new_abbreviations':0,
 'build_attempts':22,'successful_build_attempts':12,'rejected_builds':10,'build_timeouts':2,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'selected_distinct':11,
 'audits':1,'distinct_printed_closures':43,'print_rows':43,'indexed':100,'archive_artifacts':102,
 'controller_artifacts':102,'initial_entries':6599,'inherited_checked':6597,'prior157_artifacts':96,
 'prior157_manifest':96,'unused_theorems':16}
for k,n in expected.items():assert c[k]==n,(k,c[k])
assert c['build_returncodes']=={'0':12,'1':8,'None':2}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count']==212
assert m['worker156_recovery_boundary']['new158_recovery_count']==0
assert len(m['worker156_recovery_boundary']['current_imported'])==7
assert len(m['worker156_recovery_boundary']['current_outside'])==5
assert m['import_scope']['all_inherited_pair_count']==2522
assert m['import_scope']['new_replay_base_count']==2522
assert m['import_scope']['new_math_source_closure']==2533
assert m['import_scope']['full_graph_nodes']==2534
assert pairs['count']==len(pairs['entries'])==2522
assert all(d['all_bindings_match'] for d in pairs['entries'].values())
assert v['manifest_only']==v['extra_current']==[]
assert v['final_static_stability']['changed']==[]
assert m['final_static_input_stability']['all_unchanged'] is True
assert v['late_scope_observation']['late_bundle_required'] is False
assert f['source_rows']['counts']['coefficient_checks']==21930 and f['source_rows']['counts']['horizontal_triples']==1560
assert f['row_shape']['counts']['adjacent_positions_upper_bound']==19600
assert f['resolvent']['counts']['coefficients']==31785
assert m['printed_closure_summary']['axiom_sets']=={'propext,Classical.choice,Quot.sound':42,'propext,Quot.sound':1}
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,expectedhash in inputs.items():
  if p.startswith(str(T)+'/'):
   row=pin(p);assert row['sha256']==expectedhash,p;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json',
 'finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and '**Both residual predicates remain unproved.**' in main
assert 'will be inserted before sealing' not in main
endpoints={}
for name,r in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in r}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in r:endpoints[name][k+'_count']=len(r[k])
assert len(endpoints)==11
assert endpoints['MarkovFifthShapeMFFD']['local_nodes']==4
assert endpoints['MarkovFifthShapeMFFD']['old121_212_count']==0
assert all(r['old121_212_count']==212 for n,r in endpoints.items() if n!='MarkovFifthShapeMFFD')
controllerfields=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':158,'request':'ffd747f5c7a147069d5bfcaffb3e60e8','sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of completed158. Final crossreview/seal use audit files only. No project/proof/checker/replay/experiment/generator/finalizer execution, mathematical-value recomputation, source edits or research help. Active159 excluded. Prior observation windows and timeout/recovery history unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controllerfields},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','scope']},
 'residual_binding':h['residual_binding'],'mathematical_values_recomputed':False,
 'finite_domain_counts_and_qualifications':{k:{kk:vv for kk,vv in f[k].items() if kk not in ['domains','saved_record']} for k in ['source_rows','row_shape','resolvent','candidate_generation']},
 'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],
  'endpoints':endpoints,'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],
  'named_older_comparisons':242,'named_older_in_joint_base':167,'named_older_comparison_only':75,
  'external_pairs':9,'window_history':m['named_older_window_boundary'],'worker153':m['prior153_pending_boundary'],
  'corrected_versions':m['inherited_corrected_versions_scope'],
  'qualification':'Ordinary compiled imports retain historical production/replay limits. No fresh whole-source rebuild or new body replay of inherited modules.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{'initial_snapshot':m['initial_preservation_split'],'checks':v['checks'],
  'initial_owned_exclusions':v['initial_owned_exclusions'],'archive_artifacts':102,'manifest_entries':100,
  'manifest_only':v['manifest_only'],'prior157_cache_boundary':m['prior157_manifest_cache_boundary'],
  'prior_reconciliation':m['prior_reconciliation'],'additional_bundle_requires_preservation':False},
 'deadline_qualification':'Completed/return0/delivered report/turn.completed. Host finish197.593607s before nominal deadline. Earlier replay/Audit/finalizer/report timings are distinct; original artifact metadata differs from archive-copy bookkeeping. No timeout outcome upgraded.',
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absences':v['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
  'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'shared_fields':v.get('method_crosscheck'),'inherited_pairs':v.get('method_pair_crosscheck'),
  'shared_input_hashes':v.get('method_shared_input_crosscheck'),
  'scope_refinements':['Universal lower-row representation is signed and restricted to actual j<=q; degree<=j is not general positivity or CrossLC.',
   'Generic H5 shape n>=11 is insufficient for actual lower-source row5; q>=5 bridge plus q1..4 ordinary-kernel/tail proof is essential.',
   'Unbounded polygon gain compared with immediate157 H residual, not exclusion from every older criterion.',
   'Uniform shape and resolvent coefficient bridge remain open; unused16theorem candidate gets no credit.',
   'Worker156 recovery belongs to157 only; old212 backlog remains unrecovered; FifthShape endpoint avoids that backlog.',
   'Manifest100/archive102 with no new gap; previous157 three-cache bundle retains its distinct historical provenance.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T/'static_audit_worker158.py'),pin(Path(__file__))],
 'preservation_paths':[str(T/(PRE+x)) for x in suffixes]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker158.py'),str(Path(__file__))],
 'pending_required_research_execution':False,'completion_claim':False}
p=T/(PRE+'audit_integrity.json');assert not p.exists();p.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'pairmap':out['inherited_pair_map'],'additional_bundle_requires_preservation':False},indent=2))
