"""Final audit-files-only consistency seal; no project reads or mathematics."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys
T=Path('/private/tmp/math_gkm_godel_20261013'); PRE='markov_worker_000160_'
def read(s): return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p); assert p.is_relative_to(T); b=p.read_bytes()
 return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json'); m=read('replay_method_evidence.json')
h=read('mathematical_source_hashes.json'); s=read('source_structure_audit.json'); f=read('finite_domain_audit.json')
pairs=read('inherited_pair_expectations.json')
assert all(d['worker']==160 for d in [v,m,h,s,f])
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['successful_target_counts']=={'theorem':39,'def':11}
assert len(h['new_sources'])==len(s['new_modules'])==7
assert len(h['named_older_comparisons'])==266 and h['all_named_new_match_current'] is True
assert len(h['pending_modules'])==1
assert {k:sum(d['kind']==k for d in h['pending_modules'][0]['declarations']) for k in ['theorem','def']}=={'theorem':5,'def':2}
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] and h['residual_binding']['both_residual_conjuncts_unproved']
assert h['residual_binding']['new_raw_LC_region'] is False
assert h['residual_binding']['minimal_denominator_base_now_proved'] is True
assert m['coverage']['compiled_only_without_replay']==m['coverage']['unbuilt_math_drafts']==[]
assert m['coverage']['pending_math_drafts']==['MarkovKernelLimitMDAB']
for k,x in v['checks'].items():
 if k in ['method_independent_validation_agrees','selected_receipts_match']:assert x is True,(k,x)
 elif isinstance(x,bool):assert x is False,(k,x)
 else:assert x is None or x==[] or x=={},(k,x)
c=v['counts']
expected={'new_math':7,'new_theorems':39,'new_definitions':11,'new_abbreviations':0,
 'pending_math':1,'pending_theorems':5,'pending_definitions':2,
 'build_attempts':18,'successful_build_attempts':8,'rejected_builds':10,'build_timeouts':2,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'selected_distinct':7,
 'audits':1,'distinct_printed_closures':39,'print_rows':39,'indexed':83,
 'archive_artifacts':85,'controller_artifacts':85,'initial_entries':6661,'inherited_checked':6660,
 'prior159_artifacts':107,'prior159_manifest':105,'unused_theorems':0}
for k,n in expected.items():assert c[k]==n,(k,c[k])
assert c['build_returncodes']=={'0':8,'1':8,'None':2}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count']==212
assert m['worker156_recovery_boundary']['new160_recovery_count']==0
assert len(m['worker156_recovery_boundary']['current_imported'])==5
assert len(m['worker156_recovery_boundary']['current_outside'])==7
assert m['worker157_boundary']['accepted_in_all_current_graph']==[]
assert 'MarkovResidualM468' in m['worker159_boundary']['accepted_outside_all_current_graph']
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['new_replay_base_count']==2525
assert m['import_scope']['new_math_source_closure']==2532 and m['import_scope']['full_graph_nodes']==2534
assert pairs['count']==len(pairs['entries'])==2525
assert all(d['all_bindings_match'] for d in pairs['entries'].values())
assert v['manifest_only']==v['extra_current']==[]
assert v['final_static_stability']['changed']==[]
assert v['final_static_stability']['input_count']==9584
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==126
assert len(v['final_absence_observation']['exact_pending_object_paths'])==2
assert all(v['final_absence_observation']['exact_pending_object_paths'].values())
assert v['late_scope_observation']['late_bundle_required'] is False
assert f['positive_rows']['counts']['positive_formula_checks']==7544
assert f['positive_rows']['counts']['minimal_cross_checks']==176851
assert f['source_checks']['counts']['coefficient_comparisons']==150660
assert f['source_checks']['counts']['all_three_polygon_guarded']==113940
assert f['source_checks']['counts']['triples_touching_outside_proved_positive_interval']==36720
assert f['kernel_source']['counts']['total_coefficient_occurrences']==4596200
assert m['printed_closure_summary']['axiom_sets']=={'propext,Classical.choice,Quot.sound':39}
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
assert 'late-file observations are pending' not in main
endpoints={}
for name,r in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in r}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in r:endpoints[name][k+'_count']=len(r[k])
assert len(endpoints)==8
assert endpoints['MarkovMinimalRatioMDAB']['local_nodes']==82
assert endpoints['MarkovMinimalRatioMDAB']['old121_212_count']==0
assert all(r['old121_212_count']==212 for n,r in endpoints.items() if n!='MarkovMinimalRatioMDAB')
controllerfields=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':160,'request':'daba8bcf97ae4038b0d8ea8a63d4a71e','sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of completed160. Final crossreview/seal use audit files only. No project/proof/compiler/checker/replay/experiment/finalizer or mathematical-value execution, source edits or research help. Active161 and separately edited publication docs excluded. Historical seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controllerfields},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','pending_modules','scope']},
 'residual_binding':h['residual_binding'],'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{k:f[k] for k in ['positive_rows','source_checks','gap_newton','kernel_probe','kernel_source','inline_observations']},
 'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],
  'endpoints':endpoints,'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],
  'worker157':m['worker157_boundary'],'worker158':m['worker158_boundary'],'worker159':m['worker159_boundary'],
  'named_older_comparisons':266,'named_older_in_joint_base':171,'named_older_comparison_only':95,'external_pairs':9,
  'window_history':m['named_older_window_boundary'],'worker153':m['prior153_pending_boundary'],
  'corrected_versions':m['inherited_corrected_versions_scope'],
  'qualification':'Ordinary compiled imports retain historical production/replay limits. No fresh whole-source rebuild or inherited-body replay. MinimalRatio small-base exception is separate from broad accepted/pending branches.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],
 'pending_kernel':m['pending_kernel_boundary'],'pending_source_declarations':h['pending_modules'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{'initial_snapshot':m['initial_preservation_split'],'checks':v['checks'],
  'initial_owned_exclusions':v['initial_owned_exclusions'],'archive_artifacts':85,'manifest_entries':83,
  'manifest_only':v['manifest_only'],'prior157_cache_boundary':m['prior157_manifest_cache_boundary'],
  'prior_reconciliation':m['prior_reconciliation'],'additional_bundle_requires_preservation':False,
  'separate_publication_documents':'Four edited publication documents are absent from the archived input map; their current contents/hashes were not read. Only recorded exact inputs are covered.'},
 'deadline_qualification':'Completed/return0/delivered report/turn.completed. Host finish63.328602s before deadline. Selected replay/Audit finish before both optional candidate timeouts. Two finish invocations preserve distinct reported manifest states; only final manifest bytes retained. No timeout upgraded.',
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absences':v['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
  'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'shared_fields':v.get('method_crosscheck'),'inherited_pairs':v.get('method_pair_crosscheck'),
  'shared_input_hashes':v.get('method_shared_input_crosscheck'),
  'scope_refinements':['Minimal residual all-integer CrossLC base is proved, but uniform shape and new unconditional source LC are not.',
   'Positive sum is derived from actual recurrences; no missing Euler/Lagrange substitution bridge is assumed.',
   'Raw positive formula restores the common binomial factor; source support includes all zeros and boundary equalities.',
   'Difference coefficient positivity does not discharge difference CrossLC/mixed signs or gap monotonicity.',
   'KernelLimit has two failed timeout snapshots with changed constants; no individual prefix declaration is credited.',
   'Auxiliary geometric weights and d0 failures are distinct from actual source weights/range.',
   'MinimalRatio avoids old212; broad branches and joint inherited base retain it without recovery.',
   'ResidualM468 is preserved previous work outside the selected160 graph; no new root reduction is credited.',
   'Two combined finish calls differ after prose edits; earlier reported manifest hash is not an archived earlier manifest.',
   'Separate publication documentation and active161 remain excluded.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T/'static_audit_worker160.py'),pin(Path(__file__))],
 'preservation_paths':[str(T/(PRE+x)) for x in suffixes]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker160.py'),str(Path(__file__))],
 'pending_required_research_execution':False,'completion_claim':False}
p=T/(PRE+'audit_integrity.json');assert not p.exists();p.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':False},indent=2))
