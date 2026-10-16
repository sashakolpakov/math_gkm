"""Final audit-files-only consistency seal. No project reads, execution, or mathematics."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000161_'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p);assert p.is_relative_to(T);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
assert all(d['worker']==161 for d in [v,m,h,s,f])
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['successful_target_counts']=={'theorem':66,'def':21}
assert len(h['new_sources'])==len(s['new_modules'])==25
assert len(h['named_older_comparisons'])==274 and h['all_named_new_match_current'] is True
assert len(h['pending_modules'])==1
assert {k:sum(d['kind']==k for d in h['pending_modules'][0]['declarations']) for k in ['theorem','def']}=={'theorem':2,'def':1}
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] and h['residual_binding']['both_residual_conjuncts_unproved']
assert h['residual_binding']['new_raw_LC_region'] is True
assert h['residual_binding']['uniform_transform_LC_unproved'] is True
assert m['coverage']['compiled_only_without_replay']==[]
assert m['coverage']['pending_math_drafts']==m['coverage']['unbuilt_math_drafts']==['MarkovColumn0MAE9']
for k,x in v['checks'].items():
 if k in ['method_independent_validation_agrees','selected_receipts_match']:assert x is True,(k,x)
 elif isinstance(x,bool):assert x is False,(k,x)
 else:assert x is None or x==[] or x=={},(k,x)
c=v['counts'];expected={'new_math':25,'new_theorems':66,'new_definitions':21,'new_abbreviations':0,'pending_math':1,'pending_theorems':2,'pending_definitions':1,'build_attempts':31,'successful_build_attempts':27,'rejected_builds':4,'build_timeouts':0,'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'selected_distinct':25,'audits':2,'distinct_printed_closures':66,'print_rows':129,'indexed':172,'archive_artifacts':174,'controller_artifacts':174,'initial_entries':6691,'inherited_checked':6689,'prior160_artifacts':85,'prior160_manifest':83,'unused_theorems':0,'unbuilt_math':1}
for k,n in expected.items():assert c[k]==n,(k,c[k])
assert c['build_returncodes']=={'0':27,'1':4}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['all_current_graph_imported_count']==212
assert m['worker156_recovery_boundary']['new161_recovery_count']==0
assert len(m['worker156_recovery_boundary']['current_imported'])==7 and len(m['worker156_recovery_boundary']['current_outside'])==5
assert len(m['worker157_boundary']['accepted_in_all_current_graph'])==8
assert len(m['worker158_boundary']['accepted_in_all_current_graph'])==11
assert len(m['worker159_boundary']['accepted_in_all_current_graph'])==8
assert 'MarkovResidualM468' in m['worker159_boundary']['accepted_in_all_current_graph']
assert len(m['worker160_boundary']['accepted_in_all_current_graph'])==5
assert m['import_scope']['all_inherited_pair_count']==m['import_scope']['new_replay_base_count']==2548
assert m['import_scope']['new_math_source_closure']==2573 and m['import_scope']['full_graph_nodes']==2576
assert m['import_scope']['direct_imports_including_implicit_Init']==8 and m['import_scope']['initial_direct_imports_including_implicit_Init']==7
assert pairs['count']==len(pairs['entries'])==2548 and all(d['all_bindings_match'] for d in pairs['entries'].values())
assert v['manifest_only']==v['extra_current']==[]
assert v['final_static_stability']['changed']==[] and m['final_static_input_stability']['all_unchanged'] is True
assert len(v['final_absence_observation']['exact_pending_object_paths'])==2 and all(v['final_absence_observation']['exact_pending_object_paths'].values())
assert v['late_scope_observation']['late_bundle_required'] is False
assert f['lift_probe']['counts']['lift_checks']==2646 and f['lift_probe']['counts']['midpoint_checks']==177856
assert f['lift_lc_probe']['counts']['checks']==509551
assert f['shape_probe']['counts']['shifted_pair_checks']==0
assert f['source_experiments']['counts']['lift_comparisons']==62985 and f['source_experiments']['counts']['column_comparisons']==5940
assert sum(f['source_experiments']['counts'][z+'_triples'] for z in ['horizontal','vertical','diagonal'])==8190
assert f['source_experiments']['counts']['polygon_triples']==8180 and f['source_experiments']['counts']['triples_touching_outside_proved_support']==10
assert f['laurent_probe']['counts']['extended_formula_checks']==23932 and f['laurent_probe']['counts']['pair_sign_sequences']==46810
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':66},'distinct':66,'rows':129}
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,eh in inputs.items():
  if p.startswith(str(T)+'/'):
   row=pin(p);assert row['sha256']==eh,p;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text();assert '## Final audit observation' in main and '**Both residual propositions remain unproved.**' in main
assert 'does not yet claim a final hash window' not in main
endpoints={}
for n,r in m['endpoint_import_boundaries'].items():
 endpoints[n]={k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in r}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in r:endpoints[n][k+'_count']=len(r[k])
assert len(endpoints)==26 and all(r['old121_212_count']==212 for r in endpoints.values())
cf=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':161,'request':'ae9e841e98884e419ff8cadb546d21cc','sealed_at_utc':datetime.now(timezone.utc).isoformat(),'scope':'Independent archive-first static audit of closed completed161. Final consistency seal reads audit files only. No project/compiler/proof/checker/replay/experiment/finalizer execution, mathematical-value computation, project edits or research assistance. Active162 excluded; earlier seals/windows unchanged.','files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in cf},'controller_times':v['controller_times'],'timing':m['retained_timing'],'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','pending_modules','scope']},'residual_binding':h['residual_binding'],'mathematical_values_recomputed':False,'finite_domains_and_qualifications':{k:f[k] for k in ['lift_probe','lift_lc_probe','shape_probe','source_experiments','laurent_probe','column_certificates','horizontal_shifts','correction_candidates']},'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker157':m['worker157_boundary'],'worker158':m['worker158_boundary'],'worker159':m['worker159_boundary'],'worker160':m['worker160_boundary'],'named_older_comparisons':274,'named_older_in_joint_base':195,'named_older_comparison_only':79,'external_pairs':10,'window_history':m['named_older_window_boundary'],'worker153':m['prior153_pending_boundary'],'corrected_versions':m['inherited_corrected_versions_scope'],'qualification':'All new endpoints inherit old212/195/19 and Window; no recovery. Ordinary compiled-import and original source/object production boundaries persist; no fresh whole-source rebuild.'},'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],'pending_column0':m['pending_column0_boundary'],'historical160_pending_kernel':m['prior160_pending_kernel_boundary'],'pending_source_declarations':h['pending_modules'],'validation_stages':m['validation_stages'],'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'preservation':{'initial_snapshot':m['initial_preservation_split'],'checks':v['checks'],'initial_owned_exclusions':v['initial_owned_exclusions'],'archive_artifacts':174,'manifest_entries':172,'manifest_only':v['manifest_only'],'prior157_cache_boundary':m['prior157_manifest_cache_boundary'],'prior_reconciliation':m['prior_reconciliation'],'additional_bundle_requires_preservation':False,'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},'deadline_qualification':'Completed/return0/delivered structured report/turn.completed. Host finish41.363880s before deadline. Initial24 and final25 checks separate; captured intermediate171-entry self-check repaired to172 before report. No historical timeout upgraded.','final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':v['late_scope_observation'],'absences':v['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'shared_fields':v.get('method_crosscheck'),'inherited_pairs':v.get('method_pair_crosscheck'),'shared_input_hashes':v.get('method_shared_input_crosscheck'),'scope_refinements':['Universal positive output formula/support do not prove uniform transform LC.','New raw H starts4..6,j<=q; Vcolumns6..8 andDstarts4..6,j+2<=q; all zeros and smallrowcases retained.','First correction polynomial bridge requiresq>=2; inheritedq1 alternating exception remains separate.','Literal diagonal indices preserve original direction; new residual conjunction remains open.','Auxiliary midpoint failure differs from actual3/4 raw[8,14,6] passingLC.','Column0 is unbuilt;160KernelLimit timeouts remain outside.','Initial24/63 andfinal25/66 replays/prints are both retained, without source-version backdating.','Initial153manifest retained; intermediate171manifest summary capture differs from final172manifest after explicit repair.','Old212/195 backlog unrecovered despite allnewendpoints importing it.','Empty shifted-pair-failure field was not tested; no evidence credit.','All finite arithmetic outputs are saved observations only; audit counted domains, not mathematical values.']},'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker161.py'),pin(Path(__file__))],'preservation_paths':[str(T/(PRE+x)) for x in suffixes]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker161.py'),str(Path(__file__))],'pending_required_research_execution':False,'completion_claim':False}
p=T/(PRE+'audit_integrity.json');assert not p.exists();p.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'pairmap':out['inherited_pair_map'],'additional_bundle_requires_preservation':False},indent=2))
