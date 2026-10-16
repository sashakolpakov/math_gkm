"""Closed163 final audit-files-only consistency seal; no project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000163_'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p);assert p.is_relative_to(T);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
assert all(d['worker']==163 for d in [v,m,h,s,f])
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['successful_target_counts']=={'theorem':50,'def':13}
assert len(h['new_sources'])==len(s['new_modules'])==13
assert len(h['named_older_comparisons'])==309 and h['all_named_new_match_current'] is True
assert len(h['pending_modules'])==len(s['pending_modules'])==1
assert {k:sum(x['kind']==k for x in h['pending_modules'][0]['declarations']) for k in ['theorem','def']}=={'theorem':1,'def':1}
assert len(h['historical_pending_comparisons'])==2
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
r=h['residual_binding'];assert r['root_open'] and r['all_three_residual_conjuncts_unproved'] and r['LiftMiddle_unproved']
assert r['new_raw_LC_region'] is False and r['new_general_weighting_transport'] is True
assert r['binomial_weighting_transport_formalized_conditional_on_cuts'] is True
assert r['normalized_pair_source_and_zero_factor_bridges_unproved'] is True
assert m['coverage']['compiled_only_without_replay']==m['coverage']['unbuilt_math_drafts']==[]
assert m['coverage']['pending_math_drafts']==['MarkovPairClearedMFEE']
assert m['coverage']['pending_counts']=={'theorem':1,'def':1}
for k,x in v['checks'].items():
 if k in ['method_independent_validation_agrees','selected_receipts_match']:assert x is True,(k,x)
 elif isinstance(x,bool):assert x is False,(k,x)
 else:assert x is None or x==[] or x=={},(k,x)
c=v['counts'];expected={'new_math':13,'new_theorems':50,'new_definitions':13,'new_abbreviations':0,'pending_math':1,'pending_theorems':1,'pending_definitions':1,'build_attempts':25,'successful_build_attempts':15,'rejected_builds':10,'build_timeouts':1,'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'selected_distinct':13,'audits':2,'distinct_printed_closures':50,'print_rows':97,'indexed':128,'archive_artifacts':130,'controller_artifacts':130,'initial_entries':6766,'inherited_checked':6766,'prior162_artifacts':94,'prior162_manifest':92,'unused_theorems':0,'unbuilt_math':0}
for k,n in expected.items():assert c[k]==n,(k,c[k])
assert c['build_returncodes']=={'0':15,'1':9,'None':1}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['report']['completion'] is None
assert v['controller']['mathematical_resolution'] is False
assert m['worker121_inherited_boundary']['current_recovery_count']==0 and m['worker121_inherited_boundary']['all_current_graph_imported_count']==212
assert m['worker156_recovery_boundary']['new163_recovery_count']==0
assert m['import_scope']['new_replay_base_count']==2576 and m['import_scope']['new_math_source_closure']==2589 and m['import_scope']['full_graph_nodes']==2592
assert v['final_static_stability']['changed']==[] and m['final_static_input_stability']['all_unchanged'] is True
assert v['late_scope_observation']['late_bundle_required'] is False
assert m['pending_pair_boundary']['has_retained_object'] is False and m['pending_pair_boundary']['timeout'] is True
assert m['pending_pair_boundary']['replayed'] is False and m['pending_pair_boundary']['axiom_printed'] is False
assert all(m['pending_pair_boundary']['object_absences'].values())
a=f['transport_experiments']['counts']
for k,n in {'kernel_parameter_pairs':651,'boundary_coefficients':21483,'all_cut_coefficients':490854,'weighted_gap_coefficients':85932,'distinct_weighted_gap_coefficients':84909,'sources':50,'source_triples':38250,'source_coefficients':114750,'source_zeros':25950,'source_zero_triples':9350,'distinct_source_coefficients':39650,'distinct_positions_in162_grid':15003,'distinct_positions_in161_lift_grid':37550}.items():assert a[k]==n,(k,a[k])
assert f['pair_extension']['counts']['comparisons']==187425
assert f['ratio_convexity']['counts']['comparisons']==64782
assert f['GAP_candidates']['literal_serialization_counts']=={'raw_terms':42675,'factored_terms':20813,'factor_list_count':4,'factor_counts':[22,22,22,22]}
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':50},'distinct':50,'rows':97}
assert m['isolated_checker']['all_explicit_selected_names_guarded'] is True and m['isolated_checker']['exact_prior162_retag'] is True
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
assert 'remain to be appended' not in main and 'Seven absent observations' in main
endpoints={}
for n,x in m['endpoint_import_boundaries'].items():
 endpoints[n]={k:x[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in x}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in x:endpoints[n][k+'_count']=len(x[k])
assert len(endpoints)==14
small={'MarkovRankWeightMFEE','MarkovPolynomialWeightMFEE','MarkovNormalizedCutMFEE','MarkovPairClearedMFEE'}
assert all(x['old121_212_count']==(0 if n in small else 212) for n,x in endpoints.items())
cf=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={
 'worker':163,'request':'fee405c8897249a786084298201a14aa','sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed completed163. Final seal reads audit files only. No project/compiler/proof/checker/replay/experiment/GAP/generator/finalizer execution, mathematical-value computation, project edits or research assistance. Active164 and later workers excluded. Earlier seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in cf},'controller_times':v['controller_times'],'timing':m['retained_timing'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','pending_modules','scope']},'residual_binding':r,'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{k:f[k] for k in ['transport_experiments','pair_extension','ratio_convexity','boundary_certificates','GAP_candidates']},'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker157':m['worker157_boundary'],'worker158':m['worker158_boundary'],'worker159':m['worker159_boundary'],'worker160':m['worker160_boundary'],'worker161':m['worker161_boundary'],'worker162':m['worker162_boundary'],'named_older_comparisons':309,'named_older_in_joint_base':224,'named_older_comparison_only':85,'external_pairs':12,'window_history':m['named_older_window_boundary'],'abel_history':m['named_older_abel_boundary'],'worker153':m['prior153_pending_boundary'],'corrected_versions':m['inherited_corrected_versions_scope'],'qualification':'Ten accepted endpoints inherit old212/195/19; three accepted general endpoints have small bases without them. PendingPairCleared minimalbase grants no theorem. Joint selected replay does not recover inherited bodies. Window and Abel original production/print boundaries persist; no fresh whole-source rebuild.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],'pending_pair':m['pending_pair_boundary'],'historical161_unbuilt_column0':m['prior161_unbuilt_column0_boundary'],'historical160_pending_kernel':m['prior160_pending_kernel_boundary'],'pending_source_declarations':h['pending_modules'],'validation_stages':m['validation_stages'],'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{'initial_snapshot':m['initial_preservation_split'],'checks':v['checks'],'initial_owned_exclusions':v['initial_owned_exclusions'],'current_owned_setup_included':v['initial_run_owned_included'],'initial_input_count_not_all_inherited':6766,'preexisting_input_count':6765,'archive_artifacts':130,'manifest_entries':128,'manifest_only':v['manifest_only'],'prior157_cache_boundary':m['prior157_manifest_cache_boundary'],'prior_reconciliation':m['prior_reconciliation'],'additional_bundle_requires_preservation':False,'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':'Completed/return0/deliveredreport/turn.completed. Host finish249.223255s beforedeadline. Initial12/47 andfinal13/50 stages distinct. One successful finalizer invocation after finalchecks; pendingPairCleared timeout retained, no historical upgrade.',
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':v['late_scope_observation'],'absences':v['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],'shared_fields':v.get('method_crosscheck'),'inherited_pairs':v.get('method_pair_crosscheck'),'shared_input_hashes':v.get('method_shared_input_crosscheck'),'scope_refinements':['General weighting permits signed polynomial coefficients and zero CrossLC weights; all literal upper-cut gaps remain a premise.','Raw lowerH source andpathresults are conditional on unprovedLiftMiddle, no newunconditionalrawstrip.','i<3 branch only needs leftcoefficientzero; no all-threezero assertion.','Bothcutedges andallj<=2auxiliarycutsproved; remainingh<t,t+1<j+h notfinitehbound.','Exactrootresidual hasthreeunprovedsourceconjuncts; auxiliarymiddle onlysufficient.','Normalizedcutrequiresstrictpositiveb onentireset; outerzero-factor andcentered bridgesopen.','Auxiliaryratiofailure andactual3/40 passingrawtriple distinguished.','PairCleared1theorem1def timedout/excluded; GAP20813/42675literalterms finitecandidateonly.','Firstexperimentalguardwrong; rejected30failures retained, corrected187425finitepassnotuniversal.','OldAbeltwofailedsorryAxdiagnostics distinct fromlatercorrectsource/2allowedprints; no freshcenterlemmabodyreplay.','Old212globallyunrecovered, but3acceptedgeneralendpoints avoidbacklog.','6766initialinputsincludeunchangedcurrentsetup; noownedexemption.','All domain/serialization counts are static; no mathematical values evaluated.','Seven absent receiptobservations thenfinal eighth; everyinterval>=60s andwait<60s.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker163.py'),pin(Path(__file__))],
 'preservation_paths':[str(T/(PRE+x)) for x in suffixes]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker163.py'),str(Path(__file__))],
 'pending_required_research_execution':False,'completion_claim':False}
p=T/(PRE+'audit_integrity.json');assert not p.exists();p.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'pairmap':out['inherited_pair_map'],'additional_bundle_requires_preservation':False},indent=2))
