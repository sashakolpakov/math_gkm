"""Audit-files-only seal; no project reads or mathematical computations."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000154_'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p);assert p.is_relative_to(T);b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');math=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json')
assert all(d['worker']==154 for d in [v,m,math,s,f]);assert math['accepted_counts']==s['accepted_counts']=={'theorem':43,'def':35,'abbrev':1}
assert len(math['new_sources'])==len(s['new_modules'])==9 and len(math['named_older_comparisons'])==204
assert math['pending_modules']==[] and math['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert math['residual_binding']['root_open'] is True and math['residual_binding']['both_new_residual_conjuncts_unproved'] is True
for k,x in v['checks'].items():assert x is True or x is None or x==[],(k,x)
assert all(all(x is True for x in row.values()) for row in m['validation_checks'].values())
assert v['counts']['accepted_theorems']==43 and v['counts']['accepted_definitions']==35 and v['counts']['accepted_abbreviations']==1 and v['counts']['accepted_explicit_declarations']==79
assert v['counts']['compiled_pending']==v['counts']['unbuilt_math']==0
assert v['historical_cutoff']['controller_outcome']=='completed'
assert v['prior121_replay_recovery']['prior_compiled_pending']==212 and m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['new_replay_base_union']['old_count']==2499 and m['accepted_scope']['local_nodes']==2508
assert v['late_scope_observation']['late_preservation_needed'] is False and v['final_static_stability']['changed']==[] and m['final_static_input_stability']['all_unchanged'] is True
assert f['combined_raw_report']['sum_of_recorded_triple_counts']==320517 and f['combined_raw_report']['distinct_union_claimed'] is False
assert f['source_scan']['counts']['coefficient_positions']==99795 and f['shape_probe']['counts']=={'individual':113715,'mixed_pairs':113715}
assert f['pell_transfer_probe']['uncounted_synchronization_comparisons']==183760 and f['kernel_probe']['auxiliary_kernel_three_direction_comparisons']==22113
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,h in inputs.items():
  if p.startswith(str(T)+'/'):
   row=pin(p);assert row['sha256']==h,p;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes];assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text();assert '## Final audit observation' in main
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes']}
 endpoints[name].update({k+'_count':len(row[k]) for k in ['old121_195','old121_212','old121_accepted']})
assert sorted(x['old121_212_count'] for x in endpoints.values())==[0,0]+[212]*7
out={'worker':154,'request':'9e205206685d4a9cbba612509f4cc95e','sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of completed154. Final crossreview/seal read audit files only; no project/proof/checker/replay/experiment/finalizer execution, mathematical-value recomputation, project edit or researcher assistance. Active155 excluded. Earlier seals and153timeout remain unchanged.',
 'files':files,'consistency':v['counts'],'historical_outcome':v['historical_cutoff'],'controller_times':v['controller_times'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','accepted_counts','scope']},
 'residual_definition_comparison':math['residual_binding'],
 'count_qualification':'Nine accepted mathematical modules,43 theorem closures,35 definitions and one abbreviation=79 explicit declarations.18 builds=11 successes(9math+2Audit),5return1,2wrappertimeouts.2 successful replay stages8/75 then9/79 with39 then43theoremprints=82rows43distinct.93indexed/95controller-archiveartifacts. Removed two kernel claims from timedout Obstruction snapshot are not accepted.',
 'finite_domain_counts':{'source':f['source_scan']['counts'],'raw_formula_positions':1780,'shape':f['shape_probe']['counts'],'kernel_global_triples':56412,'kernel_auxiliary_comparisons':22113,'pell_rhombi':140340,'pell_uncounted_synchronization':183760,'combined_report':f['combined_raw_report']},
 'finite_qualifications':{'mathematical_values_recomputed':False,'source_domain':f['source_scan']['qualification'],'runtime_binding':f['runtime_limits'],'raw_domain':f['raw_formula_probe']['qualification'],'shape_domain':f['shape_probe']['qualification'],'kernel_domain':f['kernel_probe']['qualification'],'pell_domain':f['pell_transfer_probe']['qualification'],'gap':f['gap'],'event_bindings':f['event_bindings']},
 'old121_replay_recovery':v['prior121_replay_recovery'],
 'inherited_boundary':{'accepted_scope':m['accepted_scope'],'replay_base':m['new_replay_base_union'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,'all_mapped_pairs':2499,'old212_imported':212,'old212_current_recovery':0,'named_older_comparisons':204,'named_older_imported':144,'named_older_comparison_only':60,'worker153':m['prior153_pending_boundary'],'window_history':v['inherited_window_history'],'corrected_versions':m['inherited_corrected_versions_scope'],'external_pairs':9,'scope':'Inherited source/object identities and earlier historical receipt limits preserved. No new inheritedbodyreplay or freshwhole-sourcebuild.'},
 'method_limits':m['method_limits'],'printed_closures':m['printed_closure_summary'],'replay_stages':v['replay_audit_stages'],
 'failed_versions':[{k:r[k] for k in ['path','sha256','snapshot_sha256','modules','returncode','seconds','timeout','same_final_sources','start_utc','end_estimate_utc']} for r in v['rejections']],
 'removed_obstruction_claims':m['removed_obstruction_claims'],'finalizer_change':v['finalizer_static_predicate'],'request_literal_correction':v['finalizer_request_id_correction'],'finalization_history':v['finalization_history'],
 'preservation':{'initial':6472,'inherited':6471,'own_initial':v['self_owned_initial_preservation'],'indexed':93,'controller_archive_artifacts':95,'nonindexed':v['nonindexed'],'checks':v['checks'],'storage_history':v['storage_copy_history'],'prior134_late_failure':v['prior134_late_failure_membership']},
 'deadline_qualification':'Completed/return0/deliveredstructuredreport/turn.completed. Host finish61.696220s beforedeadline; finalreplay217.493133s andAudit216.704720s before; verifierwrite151.542436s before. Draftreport retained separately differs inprose, controllerfile/event/receipt agree. Archivecopymtime isbookkeeping, notnewcheck. Prior153timeout/nullreport unchanged.',
 'activity_binding':v['activity_binding'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],'late_scope':v['late_scope_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138','both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],'shared_fields':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],'temporary_input_rechecks':rechecks,'wording_refinements_applied_before_seal':['Full WindowLC printed names specified. Only two of four retained Obstruction proof blocks changed. Internal let assignments preserved by corrected theorem-header extraction before final validation observation. Both residual conjuncts unproved; q0 remains auxiliary. Positive transfer identity distinguished from formal kernelnonnegativity and missing LCsign. Overlapping finite domains and accumulated coefficientposition count explicit. Removed timedout kernelclaims not accepted. Prior153timeout and212backlog unchanged.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'auditor_helper':pin(T/'static_audit_worker154.py'),'seal_helper':pin(T/'seal_worker154_audit.py'),'additional_late_project_bundle_required':False}
p=T/(PRE+'integrity.json');assert not p.exists(),'Never overwrite a prior seal';p.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'sealed_at_utc':out['sealed_at_utc'],'temporary_rechecks':{k:len(x) for k,x in rechecks.items()}},indent=2))
