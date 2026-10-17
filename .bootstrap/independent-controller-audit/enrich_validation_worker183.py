"""Audit-owned metadata/hash and retained JSON crosscheck enrichment; no project execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json
P=Path('/Users/sasha/math_gkm');T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000183_'
V=T/(PRE+'validation_evidence.json');v=json.loads(V.read_text());inputs=v['input_hashes']
def sha(p):
 p=Path(p);h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 value=h.hexdigest();inputs[str(p)]=value;return value
def pin(p):
 p=Path(p);return {'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}
def load(p):sha(p);return json.loads(Path(p).read_text())
me=T/(PRE+'replay_method_evidence.json');m=load(me);pp=T/(PRE+'inherited_pair_expectations.json');pairs=load(pp)
oldpair=load(T/'markov_worker_000182_inherited_pair_expectations.json');oldv=load(T/'markov_worker_000182_validation_evidence.json')
before=load(P/'.control/markov/workers/000183/before.json')
old={k:(r['source'],r['prior_source_sha256'],r['object'],r['prior_object_sha256']) for k,r in oldpair['entries'].items()}
for r in oldv['compiled']:
 if r['module'] not in old:
  old[r['module']]=(r['source'],r['source_sha256'],r['object'],r['object_sha256'])
assert len(old)==2797 and set(old)==set(pairs['entries'])
start=datetime.now(timezone.utc).isoformat();rows=[];mismatch=[]
for mod,row in pairs['entries'].items():
 source,source_sha,obj,obj_sha=old[mod]
 assert (row['source'],row['prior_source_sha256'],row['object'],row['prior_object_sha256'])==(source,source_sha,obj,obj_sha)
 cs=sha(P/source);co=sha(P/obj)
 ok=cs==source_sha==before[source]==row['before183_source_sha256'] and co==obj_sha==before[obj]==row['before183_object_sha256']
 if not ok:mismatch.append(mod)
 rows.append({'module':mod,'source':source,'object':obj,'source_sha256':cs,'object_sha256':co,'all_expected_current_controller_before_match':ok})
assert not mismatch
v['dependency_hash_observation']={'started_utc':start,'finished_utc':datetime.now(timezone.utc).isoformat(),'pair_count':2797,'source_current_hashes_read':2797,'object_current_hashes_read':2797,'cache_policy':'Fresh independent stream hashes for all exact named pairs, no digest cache. This is a bounded identity observation, not a replay or compilation.','mismatches':mismatch,'rows':rows}
v['method_pair_crosscheck']={'count':2797,'sealed182_base_count':2788,'accepted182_additions':9,'independent_expected_set_matches':True,'source_object_controller_before_matches':True,'current_hash_matches':True,'pairmap':pin(pp)}
assert m['all_new_counts']==v['counts']['compiled_declarations']
assert set(m['coverage']['compiled_math_targets'])==set(v['all_sources'])
assert m['coverage']['selected_targets']==m['coverage']['successful_targets']==[]
for mod,s in v['all_sources'].items():
 ms=m['compiled_only_source_object_bindings'][mod]
 assert ms['source_sha256']==s['sha256'] and ms['object_sha256']==next(r['current']['sha256'] for r in v['objects'] if r['module']==mod)
for r in v['runs']:
 mr=next(x for x in m['source_versions'] if x['receipt']==Path(r['receipt']['path']).name)
 assert mr['snapshot_sha256']==r['snapshot']['sha256'] and mr['returncode']==r['returncode'] and mr['same_final_source']==r['final_source_identical']
h=load(T/(PRE+'mathematical_source_hashes.json'));s=load(T/(PRE+'source_structure_audit.json'));f=load(T/(PRE+'finite_domain_audit.json'))
for a in h['new_sources']:
 b=v['all_sources'][a['module']]
 assert a['sha256']==b['sha256'] and [(d['kind'],d['name']) for d in a['declarations']]==[(d['kind'],d['name']) for d in b['declarations']]
assert h['compiled_counts']==s['compiled_counts']
assert f['mathematical_values_recomputed'] is False and f['random_samples_regenerated'] is False
v['mathematical_support_crosscheck']={'support_pins':[pin(T/(PRE+n+'.json')) for n in ['mathematical_source_hashes','source_structure_audit','finite_domain_audit']],'ten_source_hashes_match':True,'all80_explicit_names_kind_order_match':True,'compiled_counts':v['counts']['compiled_declarations'],'no_mathematical_values_recomputed':True,'scope':'Primary source statement/finite-domain review retained separately. This check compares literal names, hashes, counts, and saved statuses only.'}
b=load(T/(PRE+'partial_binary_bundle.json'));o=load(T/(PRE+'partial_binary_observation.json'))
assert b['count']==9 and b['bytes']==12946720 and b['observation']['sha256']==sha(T/(PRE+'partial_binary_observation.json'))
for r in b['files']:
 assert sha(r['path'])==sha(r['source'])==r['sha256']
 assert r['sha256']==v['initial_request_scope']['current'][r['relative_path']]['sha256']
v['partial_binary_retention']={'manifest':pin(T/(PRE+'partial_binary_bundle.json')),'observation':pin(T/(PRE+'partial_binary_observation.json')),'count':9,'bytes':12946720,'copy_window':[o['copy_started_utc'],o['copy_finished_utc']],'preservation_paths':b['preservation_paths'],'scope':'Updated authorization adds independent COW retention; original hash-only initial choice remains historical in text-bundle observation. Original24 archive and current source/object files unchanged. No proof credit.'}
# Bind the separate copy manifests and all copied bytes; no rewrite of originals.
tb=load(T/(PRE+'partial_retention_bundle.json'))
for r in tb['files']:assert sha(r['path'])==r['sha256']
mkeys=['all_new_counts','all_resolved_source_cycles','audit_source_object_bindings','axiom_audits','capabilities','compiled_duplicate_names','compiled_only_source_object_bindings','compiled_source_object_bindings','compiler_attempt_summary','compiler_invocation_bounds','coverage','coverage_partition','current_dependency_build_order','endpoint_import_boundaries','experiment_program_interfaces','external_source_boundaries','final_source_mtimes','historical_boundaries','host_reconciliation','import_scope','imported_worker_memberships','inventory_schema_boundary','isolated_checker','live_source_version_boundary','method_limits','named_older_abel_boundary','named_older_window_boundary','operational_source_object_bindings','printed_closure_summary','prior182_source_boundary','prior_interruption_reconciliation','prior_reconciliation','rejected_builds','replay_checks','replay_receipts','retained_finalization','retained_path_provenance','same_module_attempt_overlaps','selected_duplicate_names','source_mtime_overlaps','source_resolution_errors','source_versions','successful_build_snapshots','successful_version_selection','worker121_inherited_boundary','worker166_boundary','worker166_host_status_qualification','wrapper_comparisons']
assert all(k in m for k in mkeys)
v['method_crosscheck']={k:m[k] for k in mkeys}
v['method_crosscheck_summary']={'copied_fields':len(mkeys),'all_independent_compiled_bindings_match':True,'all18_versions_match':True,'pairs':2797,'fresh_pair_observation_performed_by_validator':True}
shared={k:val for k,val in m['static_input_sha256'].items() if k in inputs};conflicts={k:[val,inputs[k]] for k,val in shared.items() if val!=inputs[k]};assert not conflicts
v['method_shared_input_crosscheck']={'shared_count':len(shared),'mismatches':conflicts}
v['method_support_hashes']={'evidence':pin(me),'pairmap':pin(pp)}
v['rejected_static_version_review']=m['rejected_builds']
v['named_older_window_boundary']=m['named_older_window_boundary'];v['named_older_abel_boundary']=m['named_older_abel_boundary']
v['historical_boundaries']=m['historical_boundaries'];v['worker166_boundary']=m['worker166_boundary']
v['worker121_inherited_boundary']=m['worker121_inherited_boundary']
v['new_object_archive_and_cas_summary']={'current_count':10,'exact_content_addressed_matches':sum(r['content_addressed_matches_current'] for r in v['objects']),'original_archive_entries':2,'original_archive_exact_matches':sum(r['archive_matches_current'] for r in v['objects']),'empty_original_archive_objects':1,'separate_cow_copies':9,'current_object_bytes':sum(r['current']['bytes'] for r in v['objects']),'compiler_output_digest_authenticated':False}
assert v['new_object_archive_and_cas_summary']['exact_content_addressed_matches']==10
v['deadline_qualification']='No receipt finish/elapsed or delivered report exists. All saved build intervals estimate before the nominal1800-second deadline. Activity, archive copy failure and later reconciliation have separate timestamps; none supplies a successful worker outcome.'
v['checks']['method_independent_compiled_validation_agrees']=True
v['input_hashes']=inputs
v['pre_window_enrichment_history']=[{'time':datetime.now(timezone.utc).isoformat(),'scope':'Fresh2797 source/object pairs, primary literal-name/hash checks,18 version comparisons and authorized nine binary retention added before closing observations; no selected/replay/print status upgrade.'}]
V.write_text(json.dumps(v,indent=2)+'\n')
print(json.dumps({'pair_count':2797,'mismatches':mismatch,'input_hash_count':len(inputs),'method_fields':len(mkeys),'shared_hashes':len(shared),'evidence':{'path':str(V),'bytes':V.stat().st_size},'objects':v['new_object_archive_and_cas_summary']},indent=2))
