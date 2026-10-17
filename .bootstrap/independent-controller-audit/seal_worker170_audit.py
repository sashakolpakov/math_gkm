"""Final worker 170 seal: reads only audit files under T, never project material."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000170_';REQUEST='a646848db8dc4dffbca4cc335370b378'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(path):
 p=Path(path);assert p.is_relative_to(T)
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
late=read('late_cache_bundle.json');observation=read('unarchived_cache_observation.json')
assert all(x['worker']==170 for x in [v,m,h,s,f,late,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==REQUEST
counts={'theorem':53,'def':9}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==m['coverage']['successful_target_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']=={}
assert len(h['new_sources'])==len(s['new_modules'])==len(m['coverage']['selected_targets'])==12
assert h['excluded_modules']==s['excluded_modules']==m['coverage']['pending_math_drafts']==[]
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert m['coverage_partition']['selected_replayed']['full_validation'] is True
assert m['coverage_partition']['selected_replayed']['counts']==counts
for k in ['selected_not_replayed','compiled_only','rejected_only','timeout_only','unbuilt']:
 assert m['coverage_partition'][k]['module_count']==0
assert h['all_named_new_match_current'] is True and s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert len(h['named_older_comparisons'])==419 and len(h['historical_pending_comparisons'])==181
assert sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons'])==292
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==41
assert len(h['new_scripts'])==5 and len(h['result_bindings'])==15
for k,value in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(k,value)
 elif isinstance(value,bool):assert value is False,(k,value)
 else:assert value is None or value==[] or value=={},(k,value)
c=v['counts'];expected={'new_math':12,'new_theorems':53,'new_definitions':9,'new_inductives':0,
 'all_math_theorems':53,'all_math_definitions':9,'all_math_inductives':0,'total_math':12,'unselected_math':0,
 'fully_validated_math':12,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':29,'successful_build_attempts':16,'rejected_builds':13,'build_timeouts':0,
 'replay_attempts':2,'successful_replays':2,'replay_timeouts':0,'audits':2,'distinct_printed_closures':53,
 'print_rows':105,'indexed':128,'archive_artifacts':128,'controller_artifacts':128,
 'initial_entries':7223,'inherited_checked':7223,'prior169_artifacts':142,'prior169_manifest':142}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':16,'1':13}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed'
assert v['controller']['returncode']==0 and v['controller']['report'] is not None
assert v['controller']['report']['completion'] is None and v['controller']['mathematical_resolution'] is False
assert v['controller']['elapsed_seconds']==1586.8477318286896
assert v['controller_times']['timestamp_difference']==1586.8477318286896
assert v['controller_times']['elapsed_discrepancy_seconds']==0
assert v['controller_times']['finish_minus_deadline']==-213.15226817131042
assert v['deadline_qualification']['report_precedes_deadline'] is True
assert v['deadline_qualification']['report_mtime_precedes_deadline_seconds']==242.69343280792236
r=h['residual_binding'];assert r==s['source_level_scope']
for k in ['root_open','FirstCorrectionWindowM418_proved','AbsorbedMiddleM418_proved','AbsorbedUncutMF8F_proved',
 'AbsorbedBorderMarginMF8F_proved','BorderDominanceMF8F_unproved','new_unconditional_raw_LC_region','next_row_formula_unproved']:
 assert r[k] is True,k
for k in ['BorderDominance_used_as_premise','next_row_universal_LC_claimed','actual_raw_source_counterexample',
 'old212_recovery_claimed','old166_prefix_recovery_claimed','older_failed_versions_retroactively_recovered']:
 assert r[k] is False,k
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondCorrectionM418 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondCorrectionM418','OtherFourM9E2']
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212
assert m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported212']==212
assert m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2644
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2644
assert m['import_scope']['selected_math_source_closure']==2656 and m['import_scope']['full_graph_nodes']==2658
assert m['import_scope']['direct_imports_including_implicit_Init']==2
assert m['import_scope']['direct_inherited_imports']==['MarkovBorderDominanceMF8F']
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[61,62]
assert m['isolated_checker']['exact_prior169_retag'] is True
assert m['isolated_checker']['sha256']=='093b9212289c33f03dad699dee585ea6999c96baa27f7015bcf60b9d674f08cf'
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':53},'distinct':53,'rows':105}
assert m['compiler_attempt_summary']=={'attempts':29,'rc1':13,'success':16,'timeouts':0}
versions=m['superseded_correction_versions']
assert [x['snapshot_counts'] for x in versions['versions']]==[{'theorem':7},{'theorem':8},{'theorem':9}]
assert [x['same_final_source'] for x in versions['versions']]==[False,False,True]
assert versions['first_to_middle_added']==['source_lower_first_pathMA64']
assert versions['middle_to_final_added']==['absorbed_middle_generalMA64']
assert versions['middle_to_final_existing_statement_preserved_body_changed']==['absorbed_middle_closedMA64']
for k in ['first_replay_and_audit_bind_middle_version','final_replay_and_audit_bind_final_version','no_separate_retained_old_olean']:assert versions[k] is True
assert m['finalizer_static_predicate']['requires_successful_selected_replay_coverage'] is True
assert m['finalizer_static_predicate']['requires_single_joint_replay'] is False
assert m['finalizer_static_predicate']['compiled_object_hash_sample_after_build_selection'] is True
assert m['finalizer_static_predicate']['owned_snapshot_exceptions']==[]
assert m['finalizer_static_predicate']['scan_includes_comments'] is False
assert m['retained_finalization']['superseded_first_stage_excluded_from_final_validation'] is True
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==7223
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
assert v['preservation_scope']['setup_excludes_current_request_tag_in_basename'] is True
assert f['source_experiment']['counts']=={'source_cases':20,'visited_coefficient_positions':1184,'formula_source_cases':18,
 'coefficients':1161,'index_zero_region_positions':462,'triples':1144,'polygon_triples':666,'window_triples':252}
assert f['margin_probe']['counts']=={'parameter_cases':595,'scalar_checks':1190,'quantitative_border_checks':9520}
assert f['next_row_probe']['counts']=={'source_cases':20,'source_coefficients':728,'source_triples':688,
 'excluded_negative_exponent_cases':5,'formula_source_cases':15,'formula_checks':659,'scalar_checks':184}
assert f['next_row_probe']['zero_count_saved_only']==345 and f['next_row_probe']['zero_count_independently_recomputed'] is False
assert f['experiment_rerun']['rerun_values_except_seconds_identical'] is True
shapes=f['generation']['literal_certificate_shapes']
assert [(x['integer_literal_count'],x['rational_literal_count'],x['coefficient_literal_count']) for x in shapes]==[(34,195,229),(38,69,107)]
assert shapes==h['certificate_literal_comparisons']==s['certificate_syntax']
assert f['overrelaxed_next_margin']['literal_case_count']==4
watch=h['receipt_waiting'];assert len(watch['receipt_only_checks'])==8
assert sum(x['status']=='absent' for x in watch['receipt_only_checks'])==7
assert watch['receipt_only_checks'][-1]['sha256']=='83845ed2f4a713a1cac7a7817ffa9ede144797f06544abd4a32b0d56fcb31e4c'
# Final observations are completed by the reviewers; the sealer does not repeat project reads.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])==10423
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])==185
assert len(v['method_crosscheck'])==70
assert v['method_shared_input_crosscheck']['shared_count']==172
assert v['method_pair_crosscheck']['count']==2644 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert v['final_absence_observation']['applicable'] is False and v['final_absence_observation']['paths']=={}
assert v['late_scope_observation']['late_bundle_required'] is True
assert v['late_scope_observation']['archive_file_count']==128
assert v['late_scope_observation']['current_request_file_count']==130
relatives=['research/__pycache__/margin_experiments_a646848d.cpython-314.pyc','research/__pycache__/validate_a646848d.cpython-314.pyc']
assert sorted(v['late_scope_observation']['extra_current_request_paths'])==relatives
for k in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert v['late_scope_observation'][k]==[]
assert v['opaque_cache_retention_supplement']==late and v['initial_unarchived_cache_observation']==observation
assert late['file_count']==2 and late['total_bytes']==17995
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 assert len(rows)==22
 rechecks[label]=rows
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
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in row}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in row:endpoints[name][k+'_count']=len(row[k])
assert len(endpoints)==12 and all(row['old121_212_count']==212 for row in endpoints.values())
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker170.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==15
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
out={'worker':170,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent archive-first static audit of closed, completed worker 170. Seal reads temporary audit files only. No project execution/reads, mathematical-value computation, proof/checker/replay/experiment/generator/finalizer execution, project edit or proposer help/contact. Active 171 and later excluded; earlier seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,
 'root_contract_binding':v['contract'],'mathematical_scope':{k:value for k,value in s.items() if k not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'old121':m['worker121_inherited_boundary'],'worker156':m['worker156_recovery_boundary'],'worker166':m['worker166_boundary'],
  'worker134':m['worker134_boundary'],'worker135':m['worker135_boundary'],'worker136':m['worker136_boundary'],
  'worker167':m['prior167_certificate_boundary'],'worker168_pending':m['prior168_pending_boundary'],'worker169':m['prior169_source_boundary'],
  'imported_worker_memberships':m['imported_worker_memberships'],'named_older_comparisons':419,'named_older_imported':292,'named_older_comparison_only':127,
  'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':41,
  'window_history':m['named_older_window_boundary'],'abel_history':m['named_older_abel_boundary'],'corrected_versions':m['inherited_corrected_versions_scope'],
  'qualification':'All 12 endpoints inherit 212/195/separate 19 and Window/Abel. New replay trusts inherited compiled bodies. All 21 accepted worker 169 modules are inherited; no older failed module is retroactively recovered. Seven worker 166 prefixes remain unreplayed. No fresh whole-source rebuild or inherited-print upgrade.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':m['failed_version_qualifications'],'superseded_correction_versions':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':7223,'non_owned_initial_checked':7223,'owned_initial_exclusions':[],
  'prior_manifest_count':142,'prior_controller_artifact_count':142,'archive_artifacts':128,'manifest_entries':128,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'prior169_opaque_cache_boundary':m['prior169_opaque_cache_boundary'],'additional_bundle_requires_preservation':True,
  'supplemental_opaque_cache_bundle':{'metadata':late,'observation':observation,'files':extra,
   'scope':'Two manifest-matching exact-request opaque caches absent archive/controller. Separate byte retention only, no interpretation/execution/process/source-version/successor attribution or validation upgrade. Original archive/index unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only'],
  'operational_storage':'Separate root-authorized COW operation changed only identical retained closed workers 164–168 copies, committed 797199f72af630b9987e06f641c569de5ca59f2e. Not a mathematical validation upgrade or observation-window extension.'},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'scope_refinements':['Every actual numerator-three path has raw H LC at all natural indices with 3*j<=b+3; first correction row proved, next-row formula still experimental.',
   'General auxiliary theorem retains 4<=t<d, j>=d+2, h<=t, real c in[0,8], every coefficient. Generic quantitative-cut N is arbitrary real; M>=0 and zero pair denominators are retained.',
   'FirstCorrectionWindow, AbsorbedMiddle, Uncut and BorderMargin closed; BorderDominance remains unproved and unused as a premise. Root iff two unchanged open predicates.',
   'CorrectionClosed three successful sources have 7/8/9 theorems; first replay binds middle, final replay binds final, only final ordinary object retained.',
   'Final 12 modules/53 closures compiled, jointly replayed and printed; 13 failed compiler snapshots retained, no timeout or current pending mathematical module.',
   'Old 212/195 and seven worker 166 prefixes unrecovered; Window/Abel and older historical cutoff qualifications retained.',
   'First-row 20 cases/18 formula cases; next-row 20 cases/15 formula cases, 345 zeros saved-only. Reruns are not distinct expanded domains.',
   'Two generated rational expressions parsed structurally, not evaluated. Ordinary Lean receipts supply proof credit.',
   'Two opaque extras retained separately; 128 archive/128 index but 130 current. Discovery is not creation; no attribution or validation upgrade.',
   'All 7,223 initial inputs checked, no owned exemptions; one successful finalizer. All observations bounded; seal reads audit files only.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),
 'audit_helpers':[pin(T/'static_audit_worker170.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplemental_files':extra,'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
