"""Closed169 final audit-files-only seal. No project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000169_'
REQUEST='f8f306c0701a4692b57e05ac3c809fa5'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(path):
 p=Path(path);assert p.is_relative_to(T)
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==169 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':38,'def':18}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==m['coverage']['successful_target_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']=={}
assert len(h['new_sources'])==len(s['new_modules'])==len(m['coverage']['selected_targets'])==21
assert h['excluded_modules']==s['excluded_modules']==m['coverage']['pending_math_drafts']==[]
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert len(h['named_older_comparisons'])==398 and len(h['historical_pending_comparisons'])==181
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==32
assert len(h['new_scripts'])==9 and len(h['result_bindings'])==11
assert h['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
for k in ['selected_not_replayed','compiled_only','rejected_only','timeout_only','unbuilt']:
 assert m['coverage_partition'][k]['module_count']==0
for k,value in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(k,value)
 elif isinstance(value,bool):assert value is False,(k,value)
 else:assert value is None or value==[] or value=={},(k,value)
c=v['counts'];expected={'new_math':21,'new_theorems':38,'new_definitions':18,'new_inductives':0,
 'all_math_theorems':38,'all_math_definitions':18,'all_math_inductives':0,'total_math':21,'unselected_math':0,
 'fully_validated_math':21,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':27,'successful_build_attempts':23,'rejected_builds':4,'build_timeouts':0,
 'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'audits':2,'distinct_printed_closures':38,
 'print_rows':72,'indexed':142,'archive_artifacts':142,'controller_artifacts':142,
 'initial_entries':7179,'inherited_checked':7179,'prior168_artifacts':114,'prior168_manifest':116}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':23,'1':4}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed'
assert v['controller']['returncode']==0 and v['controller']['report'] is not None
assert v['controller']['report']['completion'] is None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1432.6816172599792
assert v['controller_times']['timestamp_difference']==1432.6816160678864
assert v['controller_times']['elapsed_discrepancy_seconds']==1.1920928955078125e-6
assert v['controller_times']['finish_minus_deadline']==-367.31838393211365
assert v['deadline_qualification']['report_precedes_deadline'] is True
assert v['deadline_qualification']['report_mtime_precedes_deadline_seconds']==400.39080834388733
r=h['residual_binding']
for k in ['root_open','absorbed_h_equals_t_boundary_proved','all_three_root_residual_conjuncts_unproved',
 'AbsorbedUncutMF8F_unproved','AbsorbedBorderMF8F_unproved','AbsorbedBorderMarginMF8F_unproved',
 'BorderDominanceMF8F_unproved','BorderDominance_only_sufficient','GAP_relaxed_edge_candidate_unvalidated']:assert r[k] is True,k
for k in ['new_unconditional_raw_LC_region','actual_raw_source_counterexample','old212_recovery_claimed',
 'old166_prefix_recovery_claimed','old168_failed_modules_retroactively_recovered']:assert r[k] is False,k
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported212']==212
assert m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2623
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2623
assert m['import_scope']['selected_math_source_closure']==2644 and m['import_scope']['full_graph_nodes']==2646
assert m['import_scope']['direct_imports_including_implicit_Init']==3
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[51,56]
assert m['isolated_checker']['exact_prior168_retag'] is True
assert m['isolated_checker']['sha256']=='f2f89593fbe0ead035ead5f9202f4f958a459bdcdaf9bd6da09493f301f890c6'
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':38},'distinct':38,'rows':72}
assert m['compiler_attempt_summary']=={'attempts':27,'rc1':4,'success':23,'timeouts':0}
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['compiled_object_hash_sample_after_build_selection'] is True
assert m['finalizer_static_predicate']['owned_snapshot_exceptions']==[]
assert m['finalizer_static_predicate']['scan_includes_comments'] is False
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==7179
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
assert v['preservation_scope']['setup_excludes_current_request_tag_in_basename'] is True
assert f['source_experiment']['counts']=={'source_cases':20,'triples':2074,'polygon_triples':1286,
 'window_triples':555,'formula_source_cases':18,'coefficients':2091,'index_zero_region_positions':772}
assert f['structure_probe']['counts']=={'parameter_cases':1332,'full_extended_checks':83472,
 'border_ratios':22200,'successive_border_comparisons':20868,'normalized_steps':662004}
assert f['relaxed_probe']['checks']==7395
assert f['gap_records']['literal_counts']['numerator_literal_term_pairs']==24434
assert f['gap_records']['literal_counts']['denominator_literal_term_pairs']==22589
assert len(f['generation']['literal_certificate_shapes'])==12
assert all(x['renamed_old_definition_text_identical'] for x in f['generation']['literal_certificate_shapes'])
assert {x['module']:x['rational_literal_count'] for x in f['generation']['literal_certificate_shapes'] if x['rational_literal_count']}=={
 'MarkovBoundary201MF8F':34,'MarkovBoundary301MF8F':32}
assert f['interrupted_source_scan']['exit130_events']==[191]
large=next(x for x in f['event_bindings'] if x['record']=='absorbed-boundary-linear-1792202563104857000.json')
assert large['matches'][0]['omitted_bytes']==1482519 and large['matches'][0]['full_event_JSON_equality_claimed'] is False
# Completed bounded observations only; this seal never repeats their project reads.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])==10347
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])==228
assert v['method_pair_crosscheck']['count']==2623 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']=={'shared_count':214,'mismatches':{}}
assert len(v['method_crosscheck'])==68
assert v['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']=={}
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==142
assert v['late_scope_observation']['current_request_file_count']==144
relatives=['research/__pycache__/absorbed_structure_f8f306c0.cpython-314.pyc',
 'research/__pycache__/validate_f8f306c0.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths'])==relatives
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert v['late_scope_observation'][k]==[]
assert v['opaque_cache_retention_supplement']==late and v['initial_unarchived_cache_observation']==observation
assert late['file_count']==2 and late['total_bytes']==12500
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==24 and len(rechecks['method'])==27
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json',
 'validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
extra=[pin(T/(PRE+'late_cache_bundle.json')),pin(T/(PRE+'unarchived_cache_observation.json'))]
extra.extend(pin(T/(PRE+'late_cache_bundle')/rel) for rel in relatives)
assert extra[1]['path']==late['observation_path'] and extra[1]['sha256']==late['observation_sha256']
by_rel={x['relative_path']:x for x in late['files']}
for rel,row in zip(relatives,extra[2:]):
 cache=by_rel[rel];assert cache['bundle_path']==row['path'] and cache['bytes_and_selected_metadata_match'] is True
 assert cache['source_observed']==cache['copy_observed']
 assert row['bytes']==cache['copy_observed']['bytes'] and row['sha256']==cache['copy_observed']['sha256']
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'observations and audit-files-only concurrence are pending' not in main
assert '**English scope correction:**' in main
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in row}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in row:endpoints[name][k+'_count']=len(row[k])
assert len(endpoints)==21 and all(row['old121_212_count']==212 for row in endpoints.values())
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),
 str(T/'static_audit_worker169.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==15
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':169,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed, completed worker 169. Seal reads audit files only. No project execution/reads, proof/checker/replay/experiment/generator/finalizer/CAS execution or mathematical-value recomputation. No project edits/research help. Active worker 170 and later excluded; earlier seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':h['receipt_waiting'],
 'root_contract_binding':v['contract'],'mathematical_scope':{k:value for k,value in s.items() if k not in
 ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{k:f[k] for k in ['source_experiment','structure_probe','relaxed_probe',
 'generation','gap_records','interrupted_source_scan']},'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
 'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker166':m['worker166_boundary'],
 'worker134':m['worker134_boundary'],'worker135':m['worker135_boundary'],'worker136':m['worker136_boundary'],
 'worker167':m['prior167_certificate_boundary'],'worker168_pending':m['prior168_pending_boundary'],
 'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':398,
 'named_older_imported':271,'named_older_comparison_only':127,'historical_pending_or_other_status_pins':181,
 'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':32,
 'window_history':m['named_older_window_boundary'],'abel_history':m['named_older_abel_boundary'],
 'corrected_versions':m['inherited_corrected_versions_scope'],
 'qualification':'All 21 selected endpoints inherit 212/195/separate 19 and Window/Abel. New target replay trusts inherited compiled bodies. Nine worker 168 and eleven worker 167 modules are inherited; none from worker 165, only CorrectionFactor from worker 166. Old combined failed/unbuilt worker 168 modules remain excluded; new accepted split names do not backdate recovery. No fresh whole-source build or inherited print upgrade.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'finalizer_preparation_history':m['finalizer_preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':7179,'non_owned_initial_checked':7179,
 'owned_initial_exclusions':[],'prior_manifest_count':116,'prior_controller_artifact_count':114,
 'archive_artifacts':142,'manifest_entries':142,'indexed_logical_bytes':v['indexed_artifact_bytes'],
 'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
 'prior168_opaque_cache_boundary':m['prior168_opaque_cache_boundary'],'additional_bundle_requires_preservation':True,
 'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
 'scope':'Two manifest-matching exact-request opaque caches absent archive/controller. No interpretation/execution/process/source-version/successor attribution or validation upgrade. Preserve separately; original archive/index unchanged.'},
 'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
 'late_scope':v['late_scope_observation'],'post_observation_audit_file_corrections':v['post_observation_audit_file_corrections'],'absence_scope':v['absence_scope'],
 'absence_observation':v['final_absence_observation'],'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
 'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
 'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
 'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
 'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],
 'shared_input_hashes':v['method_shared_input_crosscheck'],
 'scope_refinements':['Auxiliary h=t boundary proved for both actual parameter relations, 4<=t<d, all coefficients including the clamped endpoint; no new unconditional raw region.',
 'Exact Middle iff Uncut and BorderMargin, both unproved; BorderDominance is an unproved sufficient premise. Root three conjuncts unchanged.',
 'Twelve new split certificates use old definitions but new proofs; no old worker 168 module validation is backdated.',
 'Two numerator certificates contain literal half-integer constants; syntax parsed, never evaluated. Actual final Lean checks supply proof credit.',
 '21 modules and 38 closures compiled/replayed/printed; four failed builds retained, no Lean timeout or current pending module.',
 'Old 212/195 and seven worker 166 prefixes remain unrecovered; Window/Abel/156 historical qualifications unchanged.',
 'Finite source: 20 cases and 18 formula cases; 22,200 ratio values versus 20,868 comparisons; interrupted cumulative scan receives no count.',
 'Large GAP event has an explicit 1,482,519-byte middle omission; retained head/tail match the full saved receipt. Error/timeout reduction has no Lean credit.',
 'Setup basename-tag filter precedes the initial snapshot; all 7,179 inputs checked without finalizer exemptions; one successful finalizer.',
 'Two opaque extras retained separately; 142 archive/142 index but 144 current. No attribution or validation upgrade.',
 'Sealer reads only audit files; no mathematical/project execution or observation-window extension.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T/'static_audit_worker169.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,
 'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
