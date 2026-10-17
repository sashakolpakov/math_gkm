"""Seal only temporary audit records for interrupted183; no project reads or checks."""
from pathlib import Path
import hashlib,json,datetime
T=Path('/private/tmp/math_gkm_godel_20261013')
REQUEST='55cf20d29efe4eebb6677e949f2beb36'
def load(s):return json.loads((T/s).read_text())
def pin(p):
 assert p.is_relative_to(T),p
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
def same(p,h):assert pin(Path(p))['sha256']==h,(p,h)
H=load('markov_worker_000183_mathematical_source_hashes.json');S=load('markov_worker_000183_source_structure_audit.json');F=load('markov_worker_000183_finite_domain_audit.json')
V=load('markov_worker_000183_validation_evidence.json');M=load('markov_worker_000183_replay_method_evidence.json');I=load('markov_worker_000183_initial_inventory.json')
P=load('markov_worker_000183_inherited_pair_expectations.json');R=load('markov_worker_000183_final_crossreview.json')
assert R['both_final_audit_files_only_reviews_received'] and not R['necessary_corrections_remaining']
assert R['request']==REQUEST
for f in R['reviewed_files']:same(f['path'],f['sha256'])
assert H['compiled_counts']==S['compiled_counts']
assert H['compiled_counts']['theorem_declarations']==54 and H['compiled_counts']['definitions']==26
assert V['counts']['compiled_declarations']=={'def':26,'theorem':54}
assert M['all_new_counts']=={'def':26,'theorem':54}
assert V['counts']['compiled_modules']==10 and V['counts']['successful_builds']==10 and V['counts']['rejected_builds']==8
assert V['counts']['timeout_builds']==0 and V['counts']['replayed_modules']==0 and V['counts']['printed_closures']==0
assert not V['coverage_partition']['fully_accepted'] and not V['coverage_partition']['selected']
assert not M['replay_receipts'] and not M['axiom_audits']
assert M['host_reconciliation']['outcome']=='uncertain_effects' and M['host_reconciliation']['report'] is None
assert M['host_reconciliation']['request_id']==REQUEST and not M['host_reconciliation']['mathematical_resolution']
assert M['retained_finalization']['returncode'] is None and not M['retained_finalization']['receipt_retained']
assert V['receipt'] is None and V['report'] is None
assert I['archive_count']==24 and I['current_count']==78
assert len(V['initial_checks'])==22032 and all(x['matches'] for x in V['initial_checks'])
assert P['count']==2797 and not V['dependency_hash_observation']['mismatches']
assert V['dependency_hash_observation']['pair_count']==2797
shared=set(V['input_hashes'])&set(M['static_input_sha256'])
assert all(V['input_hashes'][k]==M['static_input_sha256'][k] for k in shared)
for k,v in V['method_crosscheck'].items():assert M[k]==v,k
for x in H['new_sources']:
 assert x['selected'] is None and not x['replayed_in183'] and not x['printed_in183']
 assert len([b for b in x['attempts'] if b['returncode']==0 and b['final_source_identical']])==1
assert all(x['snapshot_matches_record'] for x in H['builds'])
assert F['source_experiment']['total_polygon_triples']==254702
assert F['certificate']['all56serialized_terms_match_Lean_he_inorder'] and not F['certificate']['certificate_recalculated']
# Final observations must already be completed by the independent reviewers.
vs=V['final_static_stability'];assert vs and vs['all_unchanged'] and not vs['changed'] and not vs['missing']
va=V['final_absence_observation'];assert va and all(va['paths'].values())
ms=M['final_static_observation'];assert ms and ms['all_unchanged'] and not ms['changed'] and not ms['missing']
expected_absences={
 '/Users/sasha/math_gkm/.control/markov/workers/000183/receipt.json',
 '/Users/sasha/math_gkm/.control/markov/workers/000183/report.json',
 '/Users/sasha/math_gkm/.control/markov/workers/000183/final.json',
 '/Users/sasha/math_gkm/evidence/markov-55cf20d2/validation.json',
 '/Users/sasha/math_gkm/evidence/markov-55cf20d2/mathematical-modules.json',
 '/Users/sasha/math_gkm/evidence/markov-55cf20d2/manifest.json',
 '/Users/sasha/math_gkm/evidence/markov-55cf20d2/final-check.json',
 '/Users/sasha/math_gkm/evidence/markov-55cf20d2/last-verification.json',
 '/Users/sasha/math_gkm/evidence/markov-55cf20d2/report.json',
 '/Users/sasha/math_gkm/research/finalize_55cf20d2.py'}
assert set(va['paths'])==expected_absences and set(ms['absence_paths'])==expected_absences
assert va['paths']==ms['absence_paths'] and all(v is True for v in va['paths'].values())
assert M['final_admin_absence_observation']['paths']==va['paths']
assert M['final_absence_observation']['applicable'] is False
assert M['final_absence_observation']['paths']=={}
# Exact late-inventory and supplement-metadata schema is checked below after validator closes.

# Rehash temporary inputs only; the project windows above remain closed.
tmp_rechecks={}
for owner,mp in [('validation',V['input_hashes']),('method',M['static_input_sha256'])]:
 rows=[]
 for p,h in mp.items():
  if Path(p).is_relative_to(T):same(p,h);rows.append(pin(Path(p)))
 tmp_rechecks[owner]=rows
for p,h in ms.get('audit_only_input_sha256',{}).items():same(p,h)
# Exact manifests enumerate copies, never rebuild/repair project artifacts.
bundles=[]
for stem,count,size in [('partial_retention',46,2952709),('partial_binary',9,12946720)]:
 j=load(f'markov_worker_000183_{stem}_bundle.json')
 assert j['request']==REQUEST and j['count']==count and j['bytes']==size
 assert len(j['files'])==count and sum(f['bytes'] for f in j['files'])==size
 for f in j['files']:
  q=pin(Path(f['path']));assert q['bytes']==f['bytes'] and q['sha256']==f['sha256']
  assert I['current'][f['relative_path']]['sha256']==f['sha256']
 bundles.append({'kind':stem,'manifest':pin(T/f'markov_worker_000183_{stem}_bundle.json'),'observation':pin(T/f'markov_worker_000183_{stem}_observation.json'),'files':j['files'],'preservation_paths':j['preservation_paths'],'required':True,'validation_upgrade':False})
j=load('markov_worker_000183_late_observed_bundle.json')
assert j['count']==2 and j['total_bytes']==13469 and len(j['files'])==2
late_expected={
 'research/MarkovAudit1792226823913821000M55C.lean':'a6a116434758fc4a57d27b068843845b5746da4434135705d440568eaada3c7a',
 'research/__pycache__/source_experiment_55cf20d2.cpython-314.pyc':'65d43226330ce04622d96fc7602f4c355336286080a0dc5a73ac77ce9a780eb1'}
assert {f['relative_path']:f['sha256'] for f in j['files']}==late_expected
for f in j['files']:
 q=pin(Path(f['path']));assert q['bytes']==f['bytes'] and q['sha256']==f['sha256']
 assert f['relative_path'] not in I['current']
late_copy_paths=[f['path'] for f in j['files']]+[str(T/'markov_worker_000183_late_observed_bundle.json'),str(T/'markov_worker_000183_late_observed_observation.json')]
bundles.append({'kind':'opaque_late_observed','manifest':pin(T/'markov_worker_000183_late_observed_bundle.json'),'observation':pin(T/'markov_worker_000183_late_observed_observation.json'),'files':j['files'],'preservation_paths':late_copy_paths,'required':True,'validation_upgrade':False,'interpretation':'Neither Audit source body nor cache decoded/read for mathematics; no producer attribution or recovery.'})
late=V['late_scope_observation']
assert late['archive_file_count']==24 and late['original_expected_current_count']==78
assert late['archive_paths']==sorted(I['archive'])
assert set(I['current']).issubset(late['current_paths'])
assert late['current_request_file_count']==len(late['current_paths'])
assert late['current_request_file_count']>=80
for k in ['archive_additions','archive_missing','current_missing']:assert late[k]==[],k
for k in ['archive_hash_changes','current_hash_changes']:assert late[k]=={},k
assert late['initial_paths_unchanged'] is True
assert set(late['current_additions'])==set(late['current_paths'])-set(I['current'])
assert set(late['known_late_additions'])==set(late_expected)
assert set(late['additional_unretained_paths'])==set(late['current_additions'])-set(late_expected)
assert late['archive_current_mismatch']==['evidence/markov-55cf20d2/MarkovTopSecondGapM55C.olean']
for r,h in late_expected.items():
 row=late['known_late_hash_checks'][r]
 assert row['expected']==h and row['current']==h and row['matches'] is True
expected_sources={f['source'] for b in bundles[:2] for f in b['files']}
expected_copies={f['path'] for b in bundles[:2] for f in b['files']}
assert len(expected_sources)==len(expected_copies)==55
assert set(late['supplemental_source_paths'])==expected_sources
assert set(late['supplemental_copy_paths'])==expected_copies
meta=late['supplemental_metadata'];assert meta['checked_count']==110 and meta['all_match'] is True and meta['mismatches']==[]
assert len(meta['records'])==110 and {r['path'] for r in meta['records']}==expected_sources|expected_copies
late_meta=late['late_opaque_metadata'];assert late_meta['checked_count']==4 and late_meta['all_match'] is True and late_meta['mismatches']==[]
assert len(late_meta['records'])==4
assert {r['path'] for r in late_meta['records']}=={f[k] for f in bundles[2]['files'] for k in ['path','source']}
for row in meta['records']+late_meta['records']:
 assert row['all_match'] is True
 for field in ['bytes','mode','uid','gid','mtime_ns']:assert row['expected'][field]==row['current'][field],(row['path'],field)
core_names=['monitoring_audit.md','mathematical_source_hashes.json','source_structure_audit.json','finite_domain_audit.json','validation_audit.md','validation_evidence.json','replay_method.md','replay_method_evidence.json']
core=[pin(T/f'markov_worker_000183_{n}') for n in core_names]
seal=T/'markov_worker_000183_audit_integrity.json';assert not seal.exists(),'Never overwrite an existing historical seal'
# Enumerate this audit's own temporary products only, after reviewers have frozen them.
paths=sorted({p for p in T.iterdir() if p.is_file() and ((p.name.startswith('markov_worker_000183_') and p!=seal) or (p.suffix=='.py' and 'worker183' in p.name))})
paths += [Path(f['path']) for b in bundles for f in b['files']]
paths=sorted(set(paths));allpins=[pin(p) for p in paths]
helpers=[x for x in allpins if x['path'].endswith('.py') and '/markov_worker_000183_partial_' not in x['path']]
eligible_current_nonbinary=[]
text_copies={f['relative_path']:f for f in bundles[0]['files']}
for rel,meta in sorted(I['current'].items()):
 if rel.endswith('.olean'):continue
 archived=I['archive'].get(rel)
 if archived is not None:assert archived['sha256']==meta['sha256']
 else:assert text_copies[rel]['sha256']==meta['sha256']
 eligible_current_nonbinary.append({'project_relative_path':rel,'current':meta,'archived_counterpart':archived,'separate_retained_copy':text_copies.get(rel),'eligibility':'Original183 nonbinary bytes unchanged in final V window; excludes two late-observed names and all successor scope.'})
assert len(eligible_current_nonbinary)==68
result={
 'worker':183,'request':REQUEST,'sealed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'scope':'Audit-only static seal. No project reads, execution, proof/replay recovery, coefficient/gap/moment evaluation or successor inspection. Earlier windows immutable.',
 'files':core,'historical_outcome':M['host_reconciliation'],'receipt':None,'report':None,'returncode':None,
 'controlling_closure_record':I['controller']['reconciliation.json'],'controller_times':V['timing'],'deadline_qualification':V['deadline_qualification'],
 'mathematical_scope':S['source_level_scope'],'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'compiler_summary':V['counts'],'coverage_partition':V['coverage_partition'],'method_limits':M['method_limits'],
 'root_contract_binding':V['root_contract_binding'],'inherited_pair_map':pin(T/'markov_worker_000183_inherited_pair_expectations.json'),
 'inherited_boundary':{'pair_count':2797,'full_graph_count':2807,'worker121':M['worker121_inherited_boundary'],'worker166':M['worker166_boundary'],'WindowLC':M['named_older_window_boundary'],'Abel':M['named_older_abel_boundary']},
 'consistency':{'shared_input_hashes':len(shared),'shared_hash_mismatches':{},'copied_method_fields':len(V['method_crosscheck']),'all_method_fields_agree':True,'all_final_sources_match_successful_snapshots':True,'all18_snapshot_hashes_match':True,'no_replay_or_print_coverage_inferred':True},
 'finite_domains_and_qualifications':F,'failed_versions':M['failed_version_qualifications'],'retained_finalization':M['retained_finalization'],
 'preservation':{'mode':'reconciled_uncertain_partial_no_receipt','original_archive_must_remain_unchanged':True,'archive_entries':I['archive'],'current_request_files':I['current'],'eligible_current_nonbinary':eligible_current_nonbinary,'controller_records':I['controller'],'archive_current_mismatch':I['archive_current_mismatch'],'initial_input_count':22032,'prior_manifest182_count':95,'old171_manifest_count':127,'manifest_entries':None,'new_selection_exists':False,'supplemental_partial_evidence_bundles':bundles,'binary_copies_required':True,'binary_copy_qualification':'Nine explicit partial-evidence ordinary-object copies, not general working-cache tracking or replay output; original zero archive object remains unchanged.','missing_receipt_not_fabricated':True,'absent_manifest_not_reconstructed':True},
 'final_observations':{'validation':vs,'validation_absence':va,'method':ms,'method_admin_absence':M['final_admin_absence_observation'],'method_object_absence':M['final_absence_observation'],'method_late_audit_only_qualification':M.get('post_observation_audit_only_late_qualification'),'validation_late_scope':V.get('late_scope_observation'),'validation_project_reads_closed_utc':V.get('project_reads_closed_utc')},
 'crossreview':{**R,'temporary_input_rechecks':tmp_rechecks},'audit_helpers':helpers,'audit_file_pins':allpins,'preservation_paths':[str(p) for p in paths],
 'preservation_count_excluding_seal':len(paths),'preservation_count_including_seal':len(paths)+1,
 'pending_required_research_execution':'No checks assigned to auditor. New10 modules remain unreplayed/unprinted; inherited gaps unchanged. Future independent worker recovery must be separately attributed.',
 'completion_claim':False}
seal.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'integrity':pin(seal),'main':core[0],'preservation_count_including_seal':len(paths)+1,'supplemental_files':57},indent=2))
