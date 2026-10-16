"""Audit-files-only seal. No project reads, imports or mathematical computations."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys

T=Path('/private/tmp/math_gkm_godel_20261013')
PRE='markov_worker_000155_'
def read(s):
    return json.loads((T/(PRE+s)).read_text())
def pin(p):
    p=Path(p)
    assert p.is_relative_to(T)
    b=p.read_bytes()
    return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}

v=read('validation_evidence.json')
m=read('replay_method_evidence.json')
h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json')
f=read('finite_domain_audit.json')
assert all(d['worker']==155 for d in [v,m,h,s,f])
assert h['accepted_counts']==s['accepted_counts']=={'theorem':37,'def':12}
assert len(h['new_sources'])==len(s['new_modules'])==9
assert len(h['named_older_comparisons'])==213
assert h['pending_modules']==[] and h['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] is True
assert h['residual_binding']['both_new_residual_conjuncts_unproved'] is True
for k,x in v['checks'].items():
    assert x is True or x is None or x==[],(k,x)
assert all(all(x is True for x in r.values()) for r in m['validation_checks'].values())
c=v['counts']
for k,n in {'accepted_theorems':37,'accepted_definitions':12,'accepted_abbreviations':0,
            'accepted_explicit_declarations':49,'compiled_pending':0,'unbuilt_math':0,
            'build_attempts':18,'successful_build_attempts':11,'rejected_builds':7,
            'build_timeouts':0,'replay_attempts':1,'distinct_printed_closures':37,
            'indexed':87,'archive_artifacts':89,'initial_entries':6503,
            'preserved_prior':6502}.items():
    assert c[k]==n,(k,c[k])
assert v['historical_cutoff']['controller_outcome']=='completed'
assert v['prior121_replay_recovery']['prior_compiled_pending']==212
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['new_replay_base_union']['old_count']==2503
assert m['accepted_scope']['local_nodes']==2512
assert v['late_scope_observation']['late_preservation_needed'] is False
assert v['final_static_stability']['changed']==[]
assert m['final_static_input_stability']['all_unchanged'] is True
assert f['source_scan']['counts']=={'source_coefficients':113640,'H':109416,'V':109416,'D':105384,'lower_column_checks':600}
assert f['inverse_tests']['impulse_checks']==3600 and f['inverse_tests']['convolution_checks']==960
assert f['boundary_probes']['equality_inputs']==10
assert f['boundary_probes']['prefix_comparisons']==270
assert f['boundary_probes']['all_requested_candidates_if_no_break']==714
assert f['column_interpolation']['validation_checks']==32900
assert f['column_interpolation']['point_constraints']==520
assert f['certificate_generation']['term_count']==34
assert f['certificate_generation']['json_literals_equal_lean_gap_tokens'] is True
assert f['certificate_generation']['archived_generator_template_matches_final_source'] is True
assert v['superseded_binomial_version_boundary']['old_source_replayed'] is False
assert m['superseded_binomial_inverse']['changed_common_blocks']==['inverse_kernel_interiorM96A']
assert m['superseded_binomial_inverse']['old_object_hash_retained'] is False

rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
    rows=[]
    for p,expected in inputs.items():
        if p.startswith(str(T)+'/'):
            row=pin(p)
            assert row['sha256']==expected,p
            rows.append(row)
    rechecks[label]=rows

suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json',
          'finite_domain_audit.json','validation_audit.md','validation_evidence.json',
          'replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main
assert 'doubleSumThreeM96A' not in main

endpoints={}
for name,r in m['endpoint_import_boundaries'].items():
    endpoints[name]={k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes']}
    endpoints[name].update({k+'_count':len(r[k]) for k in ['old121_195','old121_212','old121_accepted']})
assert len(endpoints)==9 and all(r['old121_212_count']==212 for r in endpoints.values())

out={
 'worker':155,'request':'96ada19b024045ac97c60b3c8dfb10e6',
 'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of completed155. Final crossreview and seal read audit files only. No project/proof/checker/replay/experiment/finalizer execution, mathematical-value recomputation, source edits or research assistance. Active156 excluded. Prior seals and timeout histories remain unchanged.',
 'files':files,'consistency':c,'historical_outcome':v['historical_cutoff'],
 'controller_times':v['controller_times'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','accepted_counts','scope']},
 'residual_binding':h['residual_binding'],
 'count_qualification':'Nine accepted mathematical modules,37 theorems,12 definitions=49 explicit declarations.18 builds=11 successes(9 final math,1 superseded BinomialInverse,1 Audit)+7 return1,zero timeouts. One final joint replay and37 distinct printed theorem closures.87 indexed/89 controller-archive artifacts. No final pending or compiled-only module.',
 'finite_domain_counts':{
     'source':f['source_scan']['counts'],'source_saved_zero_triples':f['source_scan']['saved_record']['zero_triples'],
     'inverse':f['inverse_tests'],'lower':f['lower_checks'],
     'boundary_prefix_comparisons':270,'boundary_requested_without_break':714,'endpoint_equalities':10,
     'column_training_positions':790,'column_interpolation_constraints':520,'column_validation_positions':32900,
     'certificate_literal_terms':34},
 'finite_qualifications':{'mathematical_values_recomputed':False,
     'runtime_binding':f['runtime_limits'],'source':f['source_scan']['qualification'],
     'boundary':f['boundary_probes']['qualification'],'column':f['column_interpolation']['qualification'],
     'certificate':f['certificate_generation']['qualification'],'gap':f['gap_history'],
     'event_bindings':f['event_bindings']},
 'old121_replay_recovery':v['prior121_replay_recovery'],
 'inherited_boundary':{'accepted_scope':m['accepted_scope'],'replay_base':m['new_replay_base_union'],
     'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
     'all_mapped_pairs':2503,'old212_imported':212,'old212_current_recovery':0,
     'named_older_comparisons':213,'named_older_imported':148,'named_older_comparison_only':65,
     'worker153':m['prior153_pending_boundary'],'window_history':v['inherited_window_history'],
     'corrected_versions':m['inherited_corrected_versions_scope'],'external_pairs':9,
     'scope':'Compiled imports retain historical qualifications. Hash identities are not fresh source builds or inherited-body replay.'},
 'method_limits':m['method_limits'],'printed_closures':m['printed_closure_summary'],
 'replay_stages':v['replay_audit_stages'],
 'failed_versions':[{k:r[k] for k in ['path','sha256','snapshot_sha256','modules','returncode','seconds','timeout','same_final_sources','start_utc','end_estimate_utc']} for r in v['rejections']],
 'superseded_success':m['superseded_binomial_inverse'],
 'prose_chronology_qualification':v['superseded_binomial_version_boundary'],
 'rejected_dependency_overlap':m['rejected_dependency_overlap'],
 'finalizer_behavior':v['finalizer_static_predicate'],
 'request_literal_correction':v['finalizer_request_id_correction'],
 'finalization_history':v['finalization_history'],
 'preservation':{'initial':6503,'inherited':6502,'own_initial':v['self_owned_initial_preservation'],
     'indexed':87,'controller_archive_artifacts':89,'nonindexed':v['nonindexed'],
     'checks':v['checks'],'storage_history':v['storage_copy_history'],
     'prior134_late_failure':v['prior134_late_failure_membership']},
 'deadline_qualification':'Completed/return0/delivered structured report/turn.completed. Host finish86.563926 seconds predeadline; final replay308.725439 and Audit297.699283 seconds predeadline; verifier write162.869234 seconds predeadline. Retained elapsed differs from timestamp subtraction by1.192 microseconds. Two finalizers86 then87 entries; draft added between them; early checkpoint separate. Archive-copy mtimes are bookkeeping. No historical timeout is upgraded.',
 'activity_binding':v['activity_binding'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
     'late_scope':v['late_scope_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
     'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
     'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
     'shared_fields':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],
     'shared_input_hashes':v['method_shared_input_crosscheck'],'temporary_input_rechecks':rechecks,
     'wording_refinements_applied_before_seal':[
         'Exact three_double_sum theorem equality names the finite convolution; no invented definition.',
         'Weighted core-gap identity distinguished from denominator-cleared candidate LC product.',
         'Three total direct imports include implicit Init; endpoint counts and per-module pair expectations distinguished.',
         'Superseded successful inverse completes before edit; separately rejected dependent invocation overlaps final rebuild.',
         'Doubled integer inverse versus Python halved floor kernel retained; no universal divisibility inference.',
         'Both root residuals unproved; candidate source identification unproved; no new raw LC region.',
         'Finite overlapping domains, break-truncated boundary counts, GAP semantic failure and in-progress prefix retained.',
         'Old212 backlog and WindowLC historical receipt limits remain unchanged.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'auditor_helper':pin(T/'static_audit_worker155.py'),
 'seal_helper':pin(T/'seal_worker155_audit.py'),
 'additional_late_project_bundle_required':False}
p=T/(PRE+'integrity.json')
assert not p.exists(),'Never overwrite a prior seal'
p.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'sealed_at_utc':out['sealed_at_utc'],
                  'temporary_rechecks':{k:len(x) for k,x in rechecks.items()}},indent=2))
