"""Audit-files-only integrity seal; no project reads, imports or value computations."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000157_'
def read(s): return json.loads((T/(PRE+s)).read_text())
def pin(p):
 p=Path(p);assert p.is_relative_to(T);b=p.read_bytes()
 return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json')
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json')
bundle=read('manifest_only_inputs.json')
assert all(x['worker']==157 for x in [v,m,h,s,f,bundle])
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['successful_target_counts']=={'theorem':43,'def':12}
assert len(h['new_sources'])==len(s['new_modules'])==8
assert len(h['named_older_comparisons'])==234 and len(h['worker156_recoveries'])==12
assert h['pending_modules']==[] and h['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['residual_binding']['root_open'] is True and h['residual_binding']['both_residual_conjuncts_unproved'] is True
assert m['coverage']['recovered_counts']=={'theorem':44,'def':16}
assert m['coverage']['compiled_only_without_replay']==m['coverage']['unbuilt_math_drafts']==[]
for k,x in v['checks'].items():
 if isinstance(x,bool): assert x is (not k.endswith('_mismatch')),(k,x)
 else: assert x is None or x==[] or x=={},(k,x)
c=v['counts']
for k,n in {'new_math':8,'new_theorems':43,'new_definitions':12,'recovered_math':12,
 'recovered_theorems':44,'recovered_definitions':16,'build_attempts':18,'successful_build_attempts':11,
 'rejected_builds':7,'build_timeouts':0,'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,
 'selected_distinct':20,'audits':3,'distinct_printed_closures':87,'print_rows':87,
 'indexed':96,'archive_artifacts':96,'controller_artifacts':96,'initial_entries':6564,'prior156_artifacts':98}.items():
 assert c[k]==n,(k,c[k])
assert c['build_returncodes']=={'0':11,'1':7}
assert v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['report'] is not None and v['controller']['mathematical_resolution'] is False
assert v['controller']['report']['completion'] is None
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['all_current_graph_imported_count']==212
assert m['import_scope']['all_inherited_pair_count']==2521
assert m['import_scope']['recovery_replay_base_count']==2509
assert m['import_scope']['new_replay_base_count']==2515
assert m['import_scope']['new_math_source_closure']==2523
assert m['import_scope']['full_graph_nodes']==2532
assert len(m['import_scope']['recovered_in_new_base'])==6 and len(m['import_scope']['recovered_outside_new_base'])==6
assert v['initial_preservation_split']['inherited_excluding_setup']==6563
assert v['initial_preservation_split']['pyc_count']==189
assert v['final_static_stability']['changed']==[]
assert m['final_static_input_stability']['all_unchanged'] is True
assert v['late_scope_observation']['late_bundle_required'] is False
assert f['tail_probe']['counts']=={'correction_entries':5520,'correction_source_families':80,
 'raw_source_comparisons':648,'direct_source_families':24,'exceptional_printed_positions':10,
 'first_tail_low_formulas':1800,'crossing_triples':1200}
assert f['lower_rows']['counts']['row_checks']==1104
assert f['lower_rows']['counts']['adjacent_positions_upper_bound']==8450
assert f['lower_rows']['counts']['actual_residue_rows']==754
assert f['correction_band']['counts']['rows']==819
assert f['correction_band']['counts']['coefficients']==72569
assert f['correction_band']['counts']['adjacent_positions_upper_bound']==4389
assert f['correction_band']['counts']['coefficients_overlapping_tail']==5499
assert f['next_row']['counts']=={'candidate_coefficients':1194,'direct_source_comparisons':72,
 'strict_crossing_triples':800,'exceptional_q1_branches':2}
assert f['certificate_generation']['json_terms']==44 and f['certificate_generation']['source_terms']==53

copies=[]
assert len(bundle['files'])==3
for d in bundle['files']:
 assert d['archive_present'] is d['controller_change_present'] is False
 assert d['in_controller_before'] is d['in_worker_initial_snapshot'] is False
 row=pin(d['copy']);assert row['sha256']==d['sha256']==d['copy_sha256'] and row['bytes']==d['size']
 copies.append(row)

rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for p,expected in inputs.items():
  if p.startswith(str(T)+'/'):
   row=pin(p);assert row['sha256']==expected,p;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json',
 'finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and '**Both residual predicates remain unproved.**' in main
assert '63,355?' not in main
endpoints={}
for name,r in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:r[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in r}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in r:endpoints[name][k+'_count']=len(r[k])
assert len(endpoints)==20
assert sum(n.endswith('M1BB') for n in endpoints)==8
assert sum(n.endswith('ME9C') for n in endpoints)==12
for name,r in m['endpoint_import_boundaries'].items():
 endpoints[name]['recovered156_count']=r['recovered156_count']
 endpoints[name]['other_inherited_count']=r['other_inherited_count']
assert all(r['old121_212_count']==212 for r in endpoints.values())
controller_fields=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
finite={k:{kk:vv for kk,vv in f[k].items() if kk not in ['domains','saved_record']}
 for k in ['tail_probe','lower_rows','correction_band','next_row','certificate_generation','firstforce_generation']}
out={
 'worker':157,'request':'1bb0aa1ee066482294f620401d001bf2','sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of completed157. Final crossreview and seal use audit files only. No project/proof/checker/replay/experiment/generator/finalizer execution, mathematical-value recomputation, source edits or research assistance. Active158 excluded. Prior156 timeout and all earlier seals unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_fields},
 'controller_times':v['controller_times'],'timing':v['timing'],
 'mathematical_scope':{k:x for k,x in s.items() if k not in ['worker','request','created_at_utc','new_modules','scope']},
 'residual_binding':h['residual_binding'],
 'recovered_worker156':h['worker156_recoveries'],
 'recovery_qualification':'New157 body replay selects12 unchanged156 compiled modules;42+2 printed theorem closures cover44theorems. Seven had earlier156 replay,five had compilation only,and all44 lacked156 prints. No new156 compilation, no historicaltimeout/finalization upgrade, and no old212 recovery.',
 'finite_domain_counts_and_qualifications':finite,'finite_runtime_limits':f['runtime_limits'],
 'finite_event_bindings':f['event_bindings'],'mathematical_values_recomputed':False,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],
  'endpoints':endpoints,'pair_count':2521,'old121':m['worker121_inherited_boundary'],
  'named_older_comparisons':234,'named_older_in_new_base':160,'named_older_outside_new_base':74,
  'named_older_in_union_pair_map':166,'window_history':m['named_older_window_boundary'],
  'worker153':m['prior153_pending_boundary'],'corrected_versions':m['inherited_corrected_versions_scope'],
  'external_pairs':9,'qualification':'Ordinary compiled imports retain original production/replay limits; no fresh whole-source rebuild or replay of inherited bodies.'},
 'method_limits':m['method_limits'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],
 'recovery_boundary':m['worker156_recovery_boundary'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{'initial_snapshot':v['initial_preservation_split'],'checks':v['checks'],
  'manifest_archive_scope':v['manifest_archive_scope'],'prior_reconciliation':v['prior_reconciliation_binding'],
  'archive_artifacts':96,'manifest_entries':96,'common_paths':93,
  'prior156_artifacts':98,'raw_root_open':True},
 'manifest_only_preservation':{'companion':pin(T/(PRE+'manifest_only_inputs.json')),
  'files':copies,'source_metadata':bundle['files'],
  'qualification':'Three manifest-pinned operational caches were absent from controller/archive. Opaque matching copies only; no decoding,execution,reconstruction or historicalarchive mutation. This bundle closes an audit-retention gap, not a late proof or validation upgrade.',
  'additional_bundle_requires_preservation':True},
 'deadline_qualification':'Completed/return0/delivered report/turn.completed. Host finish is347.493904s before nominaldeadline; report delivery and turn.completed have their own earlier records. Separate recovery and new replay/Audit checks all succeed; overlapping starts retained. Current originals distinct from archivecopy metadata. No historical156 timeout upgrade.',
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absences':v['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
  'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'shared_fields':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],
  'shared_input_hashes':v['method_shared_input_crosscheck'],'temporary_input_rechecks':rechecks,
  'scope_refinements':['Complete correction formula P=L+C retains the definedlowerauxiliary; it is not the rawcoefficient equalto C alone.',
   'StrictrawV columns3/4 onlyj+1<=q;nextrow/correctionband/shape obligations remainopen.',
   'Unboundedgain comparedwith immediate156residual, notallhistoricalcriteria.',
   'Distincttwojointreplays,new55/recovered60explicitnames,43+42+2theoremprints.',
   'Dualsuffixactualguard versus staleM1BB-only receiptprose.',
   '96manifest/96archive sets differ by3each; opaque caches separatelypreserved.',
   '6564snapshot includesownsetup; noobjectfiles inworkerinitialsnapshot.',
   'Finite8450/4389 counts arestructuralupperbounds matchingretainedloops, no trim/sign reexecution.',
   'Allold212/Window andhistoricaltimeout qualifications remain.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'auditor_helper':pin(T/'static_audit_worker157.py'),'seal_helper':pin(T/'seal_worker157_audit.py'),
 'additional_late_project_bundle_required':False}
p=T/(PRE+'integrity.json');assert not p.exists(),'Never overwrite a prior seal'
p.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(p),'sealed_at_utc':out['sealed_at_utc'],
 'temporary_rechecks':{k:len(x) for k,x in rechecks.items()},'manifest_only_companion':out['manifest_only_preservation']['companion']},indent=2))
