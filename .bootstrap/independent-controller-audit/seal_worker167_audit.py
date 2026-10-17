"""Closed167 final audit-files-only seal. No project reads or mathematical evaluation."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, sys

T=Path('/private/tmp/math_gkm_godel_20261013'); PRE='markov_worker_000167_'
REQUEST='7a3441816890468e98c10c97d76927c6'
def read(suffix): return json.loads((T/(PRE+suffix)).read_text())
def pin(path):
 path=Path(path);assert path.is_relative_to(T)
 data=path.read_bytes();return {'path':str(path),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json')
h=read('mathematical_source_hashes.json');s=read('source_structure_audit.json');f=read('finite_domain_audit.json')
pairs=read('inherited_pair_expectations.json');late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==167 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':96,'def':74,'inductive':1}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==counts
assert len(h['new_sources'])==len(s['new_modules'])==13
assert h['excluded_counts']==s['excluded_counts']=={'def':1}
assert len(h['excluded_modules'])==len(s['excluded_modules'])==1
assert len(h['named_older_comparisons'])==375 and len(h['historical_pending_comparisons'])==178
assert len(h['historical_operational_comparisons'])==2
assert h['all_named_new_match_current'] is True
assert s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert h['inherited_sparse_binding']['initial167_contains_path'] is False
assert h['inherited_sparse_binding']['sha256']=='fca1137bc1a3d481be36cc54f81e4d43ab3c41c676225cce3673dbac500fdd18'
assert m['coverage']['successful_target_counts']==counts
assert len(m['coverage']['successful_targets'])==len(m['coverage']['selected_targets'])==13
assert m['coverage']['pending_math_drafts']==m['coverage']['compiled_and_printed_not_replayed']==[]
assert m['coverage']['compiled_only_without_replay']==['MarkovExpressionDataM7A3']
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
assert m['coverage_partition']['compiled_only']['counts']=={'def':1}
assert m['coverage_partition']['compiled_only']['full_validation'] is False
for key in ['selected_not_replayed','timeout_only','unbuilt','rejected_only']:
 assert m['coverage_partition'][key]['module_count']==0
for key,value in v['checks'].items():
 if key in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(key,value)
 elif isinstance(value,bool):assert value is False,(key,value)
 else:assert value is None or value==[] or value=={},(key,value)
c=v['counts']
expected={'new_math':13,'new_theorems':96,'new_definitions':74,'new_inductives':1,
 'all_math_theorems':96,'all_math_definitions':75,'all_math_inductives':1,'total_math':14,'unselected_math':1,
 'fully_validated_math':13,'compiled_only_math':1,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':27,'successful_build_attempts':17,'rejected_builds':10,'build_timeouts':0,
 'replay_attempts':4,'successful_replays':4,'replay_timeouts':0,'audits':3,'distinct_printed_closures':96,
 'print_rows':248,'indexed':123,'archive_artifacts':124,'controller_artifacts':124,
 'initial_entries':7103,'inherited_checked':7103,'prior166_artifacts':174,'prior166_manifest':172}
for key,value in expected.items():assert c[key]==value,(key,c[key])
assert c['build_returncodes']=={'0':17,'1':10}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed'
assert v['controller']['returncode']==0 and v['controller']['report'] is not None
assert v['controller']['report']['completion'] is None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1570.6689448356628
assert v['controller_times']['finish_minus_deadline']==-229.33105516433716
assert v['deadline_qualification']['report_precedes_deadline'] is True
assert v['deadline_qualification']['report_mtime_precedes_deadline_seconds']==289.75922775268555
r=h['residual_binding']
for key in ['root_open','new_raw_LC_region','LowerHorizontalMFEE_proved','ReducedPairPositiveMAD5_proved',
 'ParametricPairPositiveMAD5_proved_via_inherited_equivalence','RationalPairStepMAD5_proved',
 'actual_multivariate_packed_certificate_proved','both_residual_conjuncts_unproved','LowerRowShapeMFFD_unproved',
 'first_correction_row_LC_unproved']:assert r[key] is True,key
for key in ['actual_raw_source_counterexample','old166_prefix_recovery_claimed','old212_recovery_claimed']:assert r[key] is False
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2604
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2604
assert m['import_scope']['selected_math_source_closure']==2617 and m['import_scope']['full_graph_nodes']==2621
assert m['import_scope']['direct_imports_including_implicit_Init']==8
assert m['isolated_checker']['guarded_counts']==[16,141,168,172]
assert m['isolated_checker']['lexical_top_level_counts']==[16,140,167,171]
assert m['isolated_checker']['exact_prior166_retag'] is True
assert m['isolated_checker']['sha256']=='a780591ce9ee8560d4ec138ef498b04106c17bb938c044583347be1da5ac8ee4'
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':87,'propext,Quot.sound':9},'distinct':96,'rows':248}
assert m['compiler_attempt_summary']=={'attempts':27,'rc1':10,'success':17,'timeouts':0}
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['compiled_object_hash_sample_after_build_selection'] is True
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert f['source_experiment']['counts']['source_coefficients']==81328
assert f['source_experiment']['counts']['known_zero_region_positions']==19808
assert f['source_experiment']['counts']['lower_triples']==79088
assert f['source_experiment']['counts']['polygon_triples']==59280
assert f['cut_probes']['counts']['upper_cut_coefficient_slots']==1137360
assert f['cut_probes']['counts']['lower_cut_coefficient_slots']==2082192
assert f['weighted_probe']['counts']['triples']==132804
assert f['weighted_probe']['counts']['support_zero_containing_triples']==14280
assert f['generation']['sparse_gap_literal_term_count']==20813
assert len(s['literal_syntax_audit']['factors'])==38 and len(s['literal_syntax_audit']['products'])==4
assert len(s['literal_syntax_audit']['gap_definitions'])==20
# Only completed audit observation records are read here, not their project inputs.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])
assert v['method_pair_crosscheck']['count']==2604 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={} and len(v['method_crosscheck'])==66
assert v['method_shared_input_crosscheck']['shared_count']==184
assert v['final_static_stability']['input_count']==10291
assert m['final_static_input_stability']['input_count']==199
assert v['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths']=={}
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==124
assert v['late_scope_observation']['current_request_file_count']==125
relative='research/__pycache__/validate_7a344181.cpython-314.pyc'
assert v['late_scope_observation']['extra_current_request_paths']==[relative]
for key in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:
 assert v['late_scope_observation'][key]==[]
assert v['opaque_cache_retention_supplement']==late
assert v['initial_unarchived_cache_observation']==observation
assert late['file_count']==1 and late['total_bytes']==5808
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 rechecks[label]=rows
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json',
 'validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
extra=[pin(T/(PRE+'late_cache_bundle.json')),pin(T/(PRE+'unarchived_cache_observation.json')),
 pin(T/(PRE+'late_cache_bundle')/relative)]
assert extra[1]['path']==late['observation_path'] and extra[1]['sha256']==late['observation_sha256']
cache=late['files'][0];assert cache['relative_path']==relative and cache['bundle_path']==extra[2]['path']
assert cache['bytes_and_selected_metadata_match'] is True and cache['source_observed']==cache['copy_observed']
assert extra[2]['bytes']==cache['copy_observed']['bytes']==5808
assert extra[2]['sha256']==cache['copy_observed']['sha256']=='6b59a40d8443abfb9500ba85dc3819525a72fabb71bf8cfe5ad48ca89b941df2'
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text()
assert '## Final audit observation' in main and 'observations and audit-files-only concurrence are pending' not in main
assert '**English scope correction:**' in main
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={key:row[key] for key in ['current_count','current_counts','inherited_count','local_nodes'] if key in row}
 for key in ['old121_195','old121_212','old121_accepted']:
  if key in row:endpoints[name][key+'_count']=len(row[key])
small={'MarkovPackedPolynomialM7A3','MarkovKroneckerM7A3','MarkovFourEncodingM7A3','MarkovExpressionM7A3','MarkovExpressionGapM7A3'}
assert len(endpoints)==14
assert all(endpoints[name]['old121_212_count']==(0 if name in small else 212) for name in m['coverage']['selected_targets'])
preserve=[row['path'] for row in files]+[str(T/(PRE+'inherited_pair_expectations.json')),
 str(T/'static_audit_worker167.py'),str(Path(__file__))]+[row['path'] for row in extra]
assert len(preserve)==len(set(preserve))==14
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':167,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed completed167. Seal reads audit files only. No project execution/reads, proof/checker/replay/experiment/generator/finalizer execution or mathematical-value recomputation. No project edits or research help. Active168 and later excluded; earlier seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{key:v['controller'][key] for key in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':h['receipt_waiting'],
 'mathematical_scope':{key:value for key,value in s.items() if key not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,
 'finite_domains_and_qualifications':{key:f[key] for key in ['source_experiment','cut_probes','weighted_probe','generation']},
 'finite_runtime_limits':f['runtime_limits'],'finite_event_bindings':f['event_bindings'],
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
 'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker166':m['worker166_boundary'],
 'worker134':m['worker134_boundary'],'worker135':m['worker135_boundary'],'worker136':m['worker136_boundary'],
 'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':375,
 'named_older_imported':252,'named_older_comparison_only':123,'historical_pending_pins':178,
 'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':10,
 'window_history':m['named_older_window_boundary'],'abel_history':m['named_older_abel_boundary'],
 'corrected_versions':m['inherited_corrected_versions_scope'],
 'qualification':'Five generic endpoints avoid inherited local project modules; eight source/certificate endpoints import old212/195/19 and Window/Abel. All selected167 modules replayed, inherited bodies retain compiled trust. Only CorrectionFactor166 and CorrectionObstruction165 imported; seven unreplayed166 prefixes remain outside/unrecovered. No fresh whole-source rebuild or historical print upgrade.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],
 'coverage_partition':m['coverage_partition'],'concrete_certificate_boundary':m['concrete_certificate_boundary'],
 'data_elaborator_boundary':m['elaborator_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],
 'preservation':{'checks':v['checks'],'initial_input_count':7103,'prior_manifest_count':172,
 'prior_controller_artifact_count':174,'archive_artifacts':124,'manifest_entries':123,'indexed_logical_bytes':68317750,
 'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
 'prior166_opaque_cache_boundary':m['prior166_opaque_cache_boundary'],
 'inherited_sparse_binding':v['inherited_sparse_binding'],'additional_bundle_requires_preservation':True,
 'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
 'scope':'One manifest-matching exact-request opaque cache absent from archive/controller. No bytecode interpretation, execution, source-version/process/successor attribution or validation upgrade. Original archive/index unchanged; preserve separately.'},
 'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
 'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],
 'absence_observation':v['final_absence_observation'],
 'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review',
 'method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
 'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
 'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
 'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],
 'shared_input_hashes':v['method_shared_input_crosscheck'],
 'scope_refinements':['All actual numerator-three lower rows3j<=b, all natural columns and zeros are now unconditionally horizontal LC.',
 'Concrete degree/mass/packed equality hypotheses are discharged in selected final sources, not merely assumed from generated data.',
 'Exact root retains two open residual conjuncts. Endpoints and earlier numerator families are not newly open residuals.',
 'Smoothed CrossLC does not establish unsmoothed LowerRowShape; first correction identity requiresq>=2 and starts>=2, sign still open.',
 'Auxiliary coefficientwise obstruction at actual3/8 coexists with a formally positive raw gap; no root refutation.',
 'All13 selected modules/96 theorem closures compile/replay/print; Data helper compiled only and unused by selected graph.',
 'Old212/195 and seven166 prefixes unrecovered; historical Window/Abel/156 limits unchanged.',
 'Sparse-original absent worker evidence-before but present controller-before; exact sealed166 digest provenance.',
 'One manifested opaque cache separately retained;125current versus124archive, no attribution or validation upgrade.',
 'All seal consistency work reads temporary audit files only; no project or mathematical execution.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T/'static_audit_worker167.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,
 'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
