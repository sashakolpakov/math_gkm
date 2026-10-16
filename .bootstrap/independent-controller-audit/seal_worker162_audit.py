"""Seal closed162 audit using audit files only; no project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000162_'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p);assert p.is_relative_to(T);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
assert all(d['worker']==162 for d in [v,m,h,s,f])
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['successful_target_counts']=={'theorem':43,'def':18}
assert len(h['new_sources'])==len(s['new_modules'])==9
assert len(h['named_older_comparisons'])==299 and h['all_named_new_match_current'] is True
assert h['pending_modules']==s['pending_modules']==[]
assert len(h['historical_pending_comparisons'])==2
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] and h['residual_binding']['both_residual_conjuncts_unproved']
assert h['residual_binding']['new_raw_LC_region'] is False
assert h['residual_binding']['new_auxiliary_coefficientwise_parameter_LC'] is True
assert h['residual_binding']['LiftBoundary_unproved'] is True
assert h['residual_binding']['binomial_weighting_transport_not_formalized'] is True
assert m['coverage']['compiled_only_without_replay']==m['coverage']['pending_math_drafts']==m['coverage']['unbuilt_math_drafts']==[]
for k,x in v['checks'].items():
 if k in ['method_independent_validation_agrees','selected_receipts_match']:assert x is True,(k,x)
 elif isinstance(x,bool):assert x is False,(k,x)
 else:assert x is None or x==[] or x=={},(k,x)
c=v['counts'];expected={'new_math':9,'new_theorems':43,'new_definitions':18,'new_abbreviations':0,'pending_math':0,'pending_theorems':0,'pending_definitions':0,'build_attempts':19,'successful_build_attempts':11,'rejected_builds':8,'build_timeouts':0,'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'selected_distinct':9,'audits':2,'distinct_printed_closures':43,'print_rows':83,'indexed':92,'archive_artifacts':94,'controller_artifacts':94,'initial_entries':6740,'inherited_checked':6738,'prior161_artifacts':174,'prior161_manifest':172,'unused_theorems':0,'unbuilt_math':0}
for k,n in expected.items():assert c[k]==n,(k,c[k])
assert c['build_returncodes']=={'0':11,'1':8}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['all_current_graph_imported_count']==212
assert m['worker156_recovery_boundary']['new162_recovery_count']==0
assert m['import_scope']['new_replay_base_count']==2528 and m['import_scope']['new_math_source_closure']==2537 and m['import_scope']['full_graph_nodes']==2539
assert v['final_static_stability']['changed']==[] and m['final_static_input_stability']['all_unchanged'] is True
assert v['final_absence_observation']['applicable'] is False
assert v['late_scope_observation']['late_bundle_required'] is False
assert f['kernel_probe']['counts']=={'parameter_positions':57000,'midpoint_checks':114000,'aligned_checks':51816}
a=f['auxiliary_experiments']['counts']
assert a['Q_gap_coefficients']==a['E_gap_coefficients']==38440
assert a['Q_comp_lift_comparisons']==66960 and a['distinct_bridge_coefficients']==23436
assert a['source_comparisons']==15003 and a['sources']==36 and a['positions_outside_proved_support']==3036
assert f['pair_ratio']['counts']['candidate_adjacent_comparisons_before_value_filter']==396270
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':42,'propext,Quot.sound':1},'distinct':43,'rows':83}
assert m['isolated_checker']['all_explicit_selected_names_guarded'] is True
assert m['isolated_checker']['exact_prior161_retag'] is True
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,eh in inputs.items():
  if p.startswith(str(T)+'/'):
   row=pin(p);assert row['sha256']==eh,p;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text();assert '## Final audit observation' in main
assert 'This draft awaits' not in main
assert 'five absent observations' in main and '108 started items' in main
endpoints={}
for n,r in m['endpoint_import_boundaries'].items():
 endpoints[n]={k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in r}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in r:endpoints[n][k+'_count']=len(r[k])
assert len(endpoints)==9 and all(r['old121_212_count']==212 for r in endpoints.values())
cf=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={
 'worker':162,'request':'7e2e958e791546e6988c1db8eaecb1c3','sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed completed162. Final consistency seal reads audit files only. No project/compiler/proof/checker/replay/experiment/finalizer execution, mathematical-value computation, project edits or research assistance. Active163 and successors excluded; earlier seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in cf},'controller_times':v['controller_times'],'timing':m['retained_timing'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','pending_modules','scope']},'residual_binding':h['residual_binding'],'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{k:f[k] for k in ['kernel_probe','auxiliary_experiments','pair_ratio','boundary_candidates','inline_observations']},'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker157':m['worker157_boundary'],'worker158':m['worker158_boundary'],'worker159':m['worker159_boundary'],'worker160':m['worker160_boundary'],'worker161':m['worker161_boundary'],'named_older_comparisons':299,'named_older_in_joint_base':175,'named_older_comparison_only':124,'external_pairs':12,'window_history':m['named_older_window_boundary'],'worker153':m['prior153_pending_boundary'],'corrected_versions':m['inherited_corrected_versions_scope'],'qualification':'All nine endpoints inherit old212/195/19 and Window; no recovery. Ordinary compiled-import and original source/object production boundaries persist. No fresh whole-source rebuild.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],'historical161_unbuilt_column0':m['prior161_unbuilt_column0_boundary'],'historical160_pending_kernel':m['prior160_pending_kernel_boundary'],'pending_source_declarations':h['pending_modules'],'validation_stages':m['validation_stages'],'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{'initial_snapshot':m['initial_preservation_split'],'checks':v['checks'],'initial_owned_exclusions':v['initial_owned_exclusions'],'archive_artifacts':94,'manifest_entries':92,'manifest_only':v['manifest_only'],'prior157_cache_boundary':m['prior157_manifest_cache_boundary'],'prior_reconciliation':m['prior_reconciliation'],'additional_bundle_requires_preservation':False,'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':'Completed/return0/delivered structured report/turn.completed. Host finish158.620218s before deadline. Initial8/40 and final9/43 checks distinct. First failed owned-checkpoint finalizer, then91-entry and final92-entry successful summaries retained; earlier finalizer/index bytes are not separately retained. No historical timeout upgraded.',
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':v['late_scope_observation'],'absences':v['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'shared_fields':v.get('method_crosscheck'),'inherited_pairs':v.get('method_pair_crosscheck'),'shared_input_hashes':v.get('method_shared_input_crosscheck'),'scope_refinements':['Q/E coefficientwise adjacent-parameter LC and ordered minor positivity do not establish raw source LC.','LiftBoundary h<=t<j+h remains unproved; weighted source transport is not formalized.','Reflect fixes indices above degree; explicit degree bounds provide the zero tail.','Source bridge is literal binomial weighting on j<=q,column t+3; no normalization or broader range.','Formal dummy truncation failure and finite3/73 auxiliary failure are not root refutations.','QKernel directly uses inherited crossLC_balanced; Window body/print limitations remain.','Initial8/40/18 and final9/43/18 stages retain exact unchanged first8 source versions.','New compiled_sha256 values are post-selection observations, not compiler output-production authentication.','Old212/195 remain unrecovered in all nine endpoints.','All finite arithmetic outputs are saved observations; only domains/indices were counted.','Receipt was absent five times, then final; 108 started items include file changes.','Seven old156 modules were replayed in one joint invocation historically; no seven-invocation claim.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker162.py'),pin(Path(__file__))],
 'preservation_paths':[str(T/(PRE+x)) for x in suffixes]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker162.py'),str(Path(__file__))],
 'pending_required_research_execution':False,'completion_claim':False}
p=T/(PRE+'audit_integrity.json');assert not p.exists();p.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'pairmap':out['inherited_pair_map'],'additional_bundle_requires_preservation':False},indent=2))
