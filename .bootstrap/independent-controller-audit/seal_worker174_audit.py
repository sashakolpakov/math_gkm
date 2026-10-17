"""Worker174 final integrity: temporary audit files only; no project reads/execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,sys
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000174_';REQUEST='831d426f49894488b2803a879f0bf56a'
def read(s):return json.loads((T/(PRE+s)).read_text())
def pin(path):
 p=Path(path);assert p.is_relative_to(T)
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
v=read('validation_evidence.json');m=read('replay_method_evidence.json');h=read('mathematical_source_hashes.json')
s=read('source_structure_audit.json');f=read('finite_domain_audit.json');pairs=read('inherited_pair_expectations.json')
bundle=read('manifest_only_bundle.json');observation=read('manifest_only_observation.json')
assert all(x['worker']==174 for x in [v,m,h,s,f,bundle,observation])
assert v['request']==m['request_id']==h['request']==s['request']==f['request']==bundle['request']==observation['request']==REQUEST
counts={'theorem':67,'def':12}
assert h['accepted_counts']==s['accepted_counts']==m['coverage']['selected_counts']==m['coverage']['successful_target_counts']==counts
assert h['excluded_counts']==s['excluded_counts']==m['coverage']['pending_counts']=={}
assert len(h['new_sources'])==len(s['new_modules'])==len(m['coverage']['selected_targets'])==11
assert h['excluded_modules']==s['excluded_modules']==m['coverage']['pending_math_drafts']==[]
assert m['coverage']['compiled_and_printed_not_replayed']==m['coverage']['compiled_only_without_replay']==[]
assert m['coverage_partition']['selected_replayed']['full_validation'] is True and m['coverage_partition']['selected_replayed']['counts']==counts
for k in ['selected_not_replayed','compiled_only','rejected_only','timeout_only','unbuilt']:assert m['coverage_partition'][k]['module_count']==0
assert h['all_named_new_match_current'] is True and s['mathematical_values_recomputed'] is f['mathematical_values_recomputed'] is False
assert len(h['named_older_comparisons'])==491 and len(h['historical_pending_comparisons'])==181
assert len(h['historical_operational_comparisons'])==2 and len(h['inherited_scripts'])==63
assert len(h['new_scripts'])==5 and len(h['saved_script_versions'])==0 and len(h['result_bindings'])==7
for k,value in v['checks'].items():
 if k in ['selected_receipts_match','method_independent_validation_agrees']:assert value is True,(k,value)
 elif isinstance(value,bool):assert value is False,(k,value)
 else:assert value is None or value==[] or value=={},(k,value)
c=v['counts'];expected={'new_math':11,'new_theorems':67,'new_definitions':12,'new_inductives':0,
 'all_math_theorems':67,'all_math_definitions':12,'all_math_inductives':0,'total_math':11,'unselected_math':0,
 'fully_validated_math':11,'compiled_only_math':0,'timeout_only_math':0,'unbuilt_math':0,
 'build_attempts':26,'successful_build_attempts':12,'rejected_builds':14,'build_timeouts':0,
 'replay_attempts':1,'successful_replays':1,'replay_timeouts':0,'audits':1,'distinct_printed_closures':67,'print_rows':67,
 'indexed':334,'archive_artifacts':113,'controller_artifacts':113,'initial_entries':21142,'inherited_checked':21142,'prior173_artifacts':142,'prior173_manifest':142}
for k,value in expected.items():assert c[k]==value,(k,c[k])
assert c['build_returncodes']=={'0':12,'1':14}
assert v['controller']['request_id']==REQUEST and v['controller']['outcome']=='completed' and v['controller']['returncode']==0
assert v['controller']['mathematical_resolution'] is False and v['controller']['report']==m['retained_finalization']['controller_report']
assert v['controller']['elapsed_seconds']==1597.433841228485
assert v['controller_times']['timestamp_difference']==1597.4338402748108
assert v['controller_times']['elapsed_discrepancy_seconds']==9.5367431640625e-07
assert v['controller_times']['finish_minus_deadline']==-202.5661597251892
assert m['retained_finalization']['finalizer_events']==[254,268] and m['retained_finalization']['final_report_event']==269 and m['retained_finalization']['turn_completed_event']==270
assert m['retained_finalization']['terminal_error'] is None and m['retained_finalization']['turn_failed_event'] is None
assert m['retained_finalization']['report_equals_delivered_and_receipt'] is True and m['retained_finalization']['final_json_absent'] is False
r=h['residual_binding'];assert r==s['source_level_scope']
for k in ['root_open','boundary_formula_now_proved','boundary_nonnegativity_now_proved','boundary_d0_Q_CrossLC_proved']:assert r[k] is True,k
for k in ['new_unconditional_raw_LC_region','full_band_Q_CrossLC_proved','augmented_CrossLC_proved','new_vertical_or_diagonal_region','actual_raw_source_counterexample','old212_recovery_claimed','old166_prefix_recovery_claimed','older_failed_versions_retroactively_recovered','q1_new_source_formula','negative_exponent_region_new_source_formula']:assert r[k] is False,k
assert r['root_equivalence']=='Conjecture63 iff ThreeBeyondThirdM964 and OtherFourM9E2'
assert r['remaining_predicates_unproved']==['ThreeBeyondThirdM964','OtherFourM9E2']
assert m['worker121_inherited_boundary']['global_unrecovered_backlog']==212 and m['worker121_inherited_boundary']['current_recovery_count']==0
assert m['worker121_inherited_boundary']['imported195']==195 and m['worker121_inherited_boundary']['imported212']==212 and m['worker121_inherited_boundary']['imported_accepted19']==19
assert m['import_scope']['all_inherited_pair_count']==pairs['count']==2688
assert m['import_scope']['successful_replay_base_count']==m['import_scope']['selected_import_base_count']==2688
assert m['import_scope']['selected_math_source_closure']==2699 and m['import_scope']['full_graph_nodes']==2700
assert m['import_scope']['direct_imports_including_implicit_Init']==10
assert m['isolated_checker']['guarded_counts']==m['isolated_checker']['lexical_top_level_counts']==[79]
assert m['isolated_checker']['sha256']=='e569fe2194ef2900bd249a7947321d713c070c0a60182343bad74cccb9af6d0a'
assert m['isolated_checker']['exact_prior173_retag'] is True and m['isolated_checker']['body_equal_prior110_after_guard_removal'] is True
assert m['printed_closure_summary']=={'axiom_sets':{'propext,Classical.choice,Quot.sound':66,'propext,Quot.sound':1},'distinct':67,'rows':67}
assert m['compiler_attempt_summary']=={'attempts':26,'rc1':14,'success':12,'timeouts':0}
versions=m['successful_version_selection'];assert versions['superseded_successful_current_sources']==[]
assert versions['one_final_source_success_per_module'] is True and versions['final_source_matching'] is True
assert versions['validation_stage_count']==1 and versions['final_stage_modules']==11
failed=m['failed_version_qualifications'];assert failed['attempt_count']==14 and failed['all_rc1'] is True
assert failed['all_headers_unchanged_modulo_whitespace'] is True and failed['all_imports_unchanged'] is True
assert m['all_resolved_source_cycles']==[] and m['selected_duplicate_names']==m['selected_excluded_collisions']=={}
assert v['initial_owned_exclusions']==[] and len(v['initial_checks'])==21142
assert all(not x['owned_excluded'] and x['current']==x['expected'] for x in v['initial_checks'])
assert f['source_experiment']['counts']=={'source_cases':46,'rows':388,'source_coefficients':39809,'raw_triples':39033,'positive_sum_comparisons_if_full_length':3271,'factor_adjacent':2541,'polygon_triples':21524}
assert f['source_experiment']['zero_count_saved_only']==17509 and f['source_experiment']['zero_count_independently_recomputed'] is False
assert f['boundary']['counts']=={'rows':122,'boundary_and_equivalence_positions':3782,'convolution_rows':442}
assert f['augmented']['counts']=={'rows':2214,'adjacent_positions':175275,'Q_adjacent_positions':42120,'H_adjacent_positions':173061,'source_q_at_least2_rows':2213,'auxiliary_q1_rows':1}
assert f['roots']['counts']=={'rows':160} and f['ratio_candidate']['term_counts']==[30,30]
watch=h['receipt_waiting'];assert len(watch['checks'])==8 and sum(x['status']=='absent' for x in watch['checks'])==7
assert watch['checks'][-1]['sha256']=='cd8f0b1bdd5390230c189e1f69b52476e367b6c9158f1399641c79d951cf46cb'
# Reviewer windows were completed independently; this file does not extend them.
assert v['final_static_stability']['all_unchanged'] is True
assert v['final_static_stability']['changed']==v['final_static_stability']['missing']==[]
assert v['final_static_stability']['input_count']==len(v['input_hashes'])
assert v['final_static_stability']['input_count']==24730
assert m['final_static_input_stability']['all_unchanged'] is True
assert m['final_static_input_stability']['input_count']==len(m['static_input_sha256'])
assert m['final_static_input_stability']['input_count']==401
assert v['method_pair_crosscheck']['count']==2688 and v['method_pair_crosscheck']['mismatches']==[]
assert v['method_shared_input_crosscheck']['mismatches']=={}
assert len(v['method_crosscheck'])==77 and v['method_shared_input_crosscheck']['shared_count']==384
assert v['final_absence_observation']['applicable'] is False and m['final_absence_observation']['applicable'] is False
assert v['final_absence_observation']['paths']==m['final_absence_observation']['paths']=={}
assert v['manifest_only_retention_supplement']==m['manifest_only_retention_supplement']==bundle
assert v['manifest_only_retention_observation']==m['manifest_only_retention_observation']==observation
assert bundle['file_count']==223 and bundle['total_bytes']==2036289
assert observation['archive_file_count']==observation['controller_file_count']==113
assert observation['manifest_count']==334 and observation['current_request_file_count']==114
closing=v['late_scope_observation']
for key,value in {'archive_file_count':113,'current_request_file_count':114,'manifest_count':334,'manifest_union_archive_count':336,'supplemental_file_count':223,'historical_manifest_only_count':222,'current_request_manifest_only_count':1,'supplemental_total_bytes':2036289}.items():assert closing[key]==value,(key,closing[key])
assert closing['late_bundle_required'] is True
assert closing['extra_current_request_paths']==['research/__pycache__/validate_831d426f.cpython-314.pyc']
for key in ['missing_current_request_paths','extra_archive_paths','missing_archive_paths']:assert closing[key]==[]
assert set(closing['manifest_only_paths'])==set(x['relative_path'] for x in bundle['files'])
metadata_checks=closing['supplemental_metadata_checks'];assert len(metadata_checks)==446
assert all(x['bytes_mode_uid_gid_mtime_sha256_match'] is True for x in metadata_checks)
assert {x['path'] for x in metadata_checks}=={x[k] for x in bundle['files'] for k in ['source_path','bundle_path']}
assert closing['supplemental_manifest_path']==str(T/(PRE+'manifest_only_bundle.json'))
assert closing['supplemental_manifest_sha256']==pin(T/(PRE+'manifest_only_bundle.json'))['sha256']
rechecks={}
for label,inputs in [('validation',v['input_hashes']),('method',m['static_input_sha256'])]:
 rows=[]
 for path,expected_hash in inputs.items():
  if path.startswith(str(T)+'/'):
   row=pin(path);assert row['sha256']==expected_hash,path;rows.append(row)
 rechecks[label]=rows
assert len(rechecks['validation'])==248 and len(rechecks['method'])==246
suffixes=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
files=[pin(T/(PRE+x)) for x in suffixes]
extra=[pin(T/(PRE+'manifest_only_bundle.json')),pin(T/(PRE+'manifest_only_observation.json'))]
assert extra[1]['path']==bundle['observation_path'] and extra[1]['sha256']==bundle['observation_sha256']
for entry in bundle['files']:
 row=pin(entry['bundle_path']);assert entry['bytes_and_selected_metadata_match'] is True
 assert entry['source_observed']==entry['copy_observed']
 assert row['bytes']==entry['copy_observed']['bytes'] and row['sha256']==entry['copy_observed']['sha256']
 extra.append(row)
assert len(extra)==225
assert len(sys.argv)==2 and files[0]['sha256']==sys.argv[1]
main=(T/(PRE+'monitoring_audit.md')).read_text();assert '## Final audit observation' in main and 'Final review remains pending' not in main
endpoints={}
for name,row in m['endpoint_import_boundaries'].items():
 endpoints[name]={k:row[k] for k in ['current_count','current_counts','inherited_count','local_nodes'] if k in row}
 for k in ['old121_195','old121_212','old121_accepted']:
  if k in row:endpoints[name][k+'_count']=len(row[k])
assert len(endpoints)==11 and all(x['old121_212_count']==212 for x in endpoints.values())
assert sorted(set(x['inherited_count'] for x in endpoints.values()))==[2543,2545,2688]
preserve=[x['path'] for x in files]+[str(T/(PRE+'inherited_pair_expectations.json')),str(T/'static_audit_worker174.py'),str(Path(__file__))]+[x['path'] for x in extra]
assert len(preserve)==len(set(preserve))==236
controller_keys=['request_id','outcome','returncode','report','mathematical_resolution','elapsed_seconds','started','finished']
boundary_keys=[k for k in m if k.endswith('_boundary')]+['inherited_corrected_versions_scope']
out={'worker':174,'request':REQUEST,'sealed_at_utc':datetime.now(timezone.utc).isoformat(),
 'scope':'Independent static archive-first closed174 audit. Sealer reads temporary audit files only, no project reads/execution or mathematical computation. Active175+ excluded. Earlier outcomes/seals/windows unchanged.',
 'files':files,'consistency':c,'historical_outcome':{k:v['controller'][k] for k in controller_keys},
 'controller_times':v['controller_times'],'timing':m['retained_timing'],'receipt_waiting':watch,'root_contract_binding':v['contract'],
 'mathematical_scope':{k:value for k,value in s.items() if k not in ['worker','request','created_at_utc','new_modules','excluded_modules','scope']},
 'residual_binding':r,'mathematical_values_recomputed':False,'finite_domains_and_qualifications':f,
 'inherited_boundary':{'scope':m['import_scope'],'pair_observation':v['dependency_hash_observation'],'endpoints':endpoints,
  'historical_qualifications':{k:m[k] for k in boundary_keys},'imported_worker_memberships':m['imported_worker_memberships'],
  'named_older_comparisons':491,'named_older_imported':sum(x['module'] in m['source_graph'] for x in h['named_older_comparisons']),
  'historical_pending_or_other_status_pins':181,'historical_operational_pins':2,'external_pairs':16,'historical_script_pins':63,
  'qualification':'All11 endpoints inherit212/195/separate19 and Window/Abel. No oldbacklog recovery orfresh whole-source rebuild.166prefix limits and171 failedreport/173 conditional boundary histories unchanged.'},
 'method_limits':m['method_limits'],'isolation':m['isolated_checker'],'printed_closures':m['printed_closure_summary'],
 'compiler_summary':m['compiler_attempt_summary'],'failed_versions':failed,'successful_version_selection':versions,
 'coverage_partition':m['coverage_partition'],'pending_boundary':m['pending_boundary'],'validation_stages':v['replay_audit_stages'],
 'finalization':m['retained_finalization'],'finalizer_static_predicate':m['finalizer_static_predicate'],'finalizer_preparation_history':m['finalizer_preparation_history'],'preparation_history':v['preparation_history'],
 'preservation':{'checks':v['checks'],'initial_input_count':21142,'owned_initial_exclusions':[],
  'prior_manifest_count':142,'prior_controller_artifact_count':142,'archive_artifacts':113,'manifest_entries':334,
  'indexed_logical_bytes':v['indexed_artifact_bytes'],'manifest_only':v['manifest_only'],'prior_reconciliation':m['prior_reconciliation'],
  'inventory_schema_boundary':m['inventory_schema_boundary'],'prior173_opaque_cache_boundary':m['prior173_opaque_cache_boundary'],
  'additional_bundle_requires_preservation':True,
  'supplemental_manifest_only_bundle':{'metadata':bundle,'observation':observation,'files':extra,
   'scope':'223 manifest-only exact files,222 sealed173 matches and1current opaque cache.212pyc+11other scripts/text. Notallnew/notalllate/notallcache; no interpretation/execution/attribution/validationupgrade. Archive unchanged.'},
  'separate_publication_documents':v['preservation_scope']['separate_documentation_identity_only']},
 'deadline_qualification':v['deadline_qualification'],
 'final_observations':{'validation':v['final_static_stability'],'method':m['final_static_input_stability'],
  'late_scope':v['late_scope_observation'],'absence_scope':v['absence_scope'],'absence_observation':v['final_absence_observation'],'method_absence_observation':m['final_absence_observation'],
  'project_reads_closed':True,'seal_extends_project_observation':False},
 'crossreview':{'validation_reviewer':'/root/monitoring_audit/sealed136_review','method_reviewer':'/root/monitoring_audit/sealed136_review/method138',
  'both_final_audit_files_only_reviews_received':True,'necessary_corrections_remaining':[],
  'temporary_input_rechecks':rechecks,'mathematical_support_crosscheck':v['mathematical_support_crosscheck'],
  'method_audit_helper_refinements':m['audit_helper_refinements'],'validation_version_parser_refinement':v['version_review_parser_refinement'],
  'pre_observation_support_rebinding':v.get('pre_observation_support_rebinding'),
  'shared_field_count':len(v['method_crosscheck']),'inherited_pairs':v['method_pair_crosscheck'],'shared_input_hashes':v['method_shared_input_crosscheck'],
  'scope_refinements':['Boundary formula nowproved andallbandQ nonnegative withstrictsupport;173 historicalunprovedstatus unchanged.',
   'Boundaryd0Q CrossLC proved; generaldQ andaugmentedR CrossLC remainunproved. No newunconditionalrawLCregion.',
   'Actualsource q>=2 andliteral2j+1<=N guards retained; allnaturalcolumnzeros preserved.',
   'Auxiliaryno-real-rootfactor andfinite mixedfailures are notsource/rootcounterexamples.',
   '11finalmodules/67closures/12defs jointlyreplayed andprinted;14rc1rejections,no timeouts/superseded successes.',
   '334manifest entries are111archived+223manifest-only;113archive includes2administrative files;114exactcurrent scope.',
   'All223extras preservedseparately;222historical pins,onecurrentcache,discoverynotcreation.',
   'New21142entry suffixfilter changespreservation scope,emptyownedexemptions; no wholetreeclaim.',
   'Twofinalizers samevalidationhash332then334; firstfullmanifestbytes absent, retainedhash/count only.',
   'Inherited212/195/separate19,Window/Abel and166 unreplayedprefixes not recovered. No freshsourcechainbuild.']},
 'inherited_pair_map':pin(T/(PRE+'inherited_pair_expectations.json')),'audit_helpers':[pin(T/'static_audit_worker174.py'),pin(Path(__file__))],
 'preservation_paths':preserve,'pending_required_research_execution':False,'completion_claim':False}
output=T/(PRE+'audit_integrity.json');assert not output.exists()
output.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'main':files[0],'integrity':pin(output),'pairmap':out['inherited_pair_map'],
 'additional_bundle_requires_preservation':True,'supplement_metadata':extra[:2],'supplement_count':len(extra),'preservation_file_count_including_integrity':len(preserve)+1},indent=2))
