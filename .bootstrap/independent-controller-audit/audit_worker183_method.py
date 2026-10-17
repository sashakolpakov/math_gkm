"""Independent static review of reconciled partial183. Never execute project programs."""
from pathlib import Path
import json,re,hashlib,datetime,collections,difflib,ast
T=Path('/private/tmp/math_gkm_godel_20261013');R=Path('/Users/sasha/math_gkm');C=R/'.control/markov/workers/000183';A=C/'artifacts';tag='55cf20d2';suf='M55C';er='evidence/markov-'+tag+'/'
H={};used={}
def read(p):
 p=Path(p);b=p.read_bytes();h=hashlib.sha256(b).hexdigest();assert str(p) not in H or H[str(p)]==h;H[str(p)]=h;return b
def js(p):return json.loads(read(p))
def sha(p):read(p);return H[str(p)]
def utc(t):return datetime.datetime.fromtimestamp(t,datetime.timezone.utc).isoformat()
inv=js(T/'markov_worker_000183_initial_inventory.json')
retobs=js(T/'markov_worker_000183_partial_retention_observation.json');retbundle=js(T/'markov_worker_000183_partial_retention_bundle.json');retmap={z['relative_path']:z for z in retobs['files']}
def retained(rel):
 assert rel in inv['current'];p=A/rel if rel in inv['archive'] else Path(retmap[rel]['copy'])
 b=read(p);expect=inv['archive'][rel] if rel in inv['archive'] else inv['current'][rel];assert H[str(p)]==expect['sha256']
 used[rel]=dict(path=str(p),sha256=H[str(p)],archive_present=rel in inv['archive'],current_sha256=inv['current'][rel]['sha256'],matches_current=H[str(p)]==inv['current'][rel]['sha256'])
 return b
def data(rel):return json.loads(retained(rel))
def clean(s):return re.sub(r'--[^\n]*','',re.sub(r'/\-.*?\-/','',s,flags=re.S))
def parse(s,rel,provenance):
 s=clean(s);return dict(path=rel,sha256=used[rel]['sha256'],provenance=provenance,imports=re.findall(r'^import\s+([\w.]+)',s,re.M),namespaces=re.findall(r'^namespace\s+(\S+)',s,re.M),declarations=[dict(kind=k,name=n) for k,n in re.findall(r'^(?:@\[[^\]]*\]\s*)?(?:(?:private|protected|noncomputable|unsafe|partial)\s+)*(theorem|lemma|def|abbrev|opaque|axiom|inductive|structure|class|instance)\s+([\w.]+)',s,re.M)],flags=sorted(set(re.findall(r'\b(?:sorry|admit|axiom|native_decide|unsafe|partial)\b',s))),anonymous_examples=len(re.findall(r'^example\b',s,re.M)))
def sections(s):
 s=clean(s);ms=list(re.finditer(r'^(?:@\[[^\]]*\]\s*)?(?:(?:noncomputable|private|protected|unsafe|partial)\s+)*(theorem|lemma|def|abbrev|instance|inductive)\s+(\w+)',s,re.M));out={}
 for i,m in enumerate(ms):
  b=s[m.start():ms[i+1].start() if i+1<len(ms) else len(s)];stack=[];quote=False;escape=False;assignment=None
  for j,ch in enumerate(b):
   if quote:
    if escape:escape=False
    elif ch=='\\':escape=True
    elif ch=='"':quote=False
    continue
   if ch=='"':quote=True;continue
   if ch in '([{':stack.append(ch)
   elif ch in ')]}':
    assert stack and {'(':')','[':']','{':'}'}[stack[-1]]==ch,(m[2],j);stack.pop()
   elif ch==':' and b[j:j+2]==':=' and not stack:assignment=j;break
  if assignment is None and m[1] in ['def','abbrev']:
   eq=re.search(r'^\s*\|',b,re.M)
   if eq:assignment=eq.start()-2
  assert assignment is not None or m[1]=='inductive',(m[2],b[:300])
  out[m[2]]=dict(kind=m[1],header=re.sub(r'\s+',' ',b[:assignment+2] if assignment is not None else b).strip(),block=b.strip())
 return out
before=js(C/'before.json');reconciliation=js(C/'reconciliation.json');req=js(C/'request.json');proc=js(C/'process.json');activity=js(C/'activity.json');watchdog=read(C/'watchdog.log').decode();stderr=read(C/'stderr.log');events=[json.loads(x) for x in read(C/'events.jsonl').splitlines()]
priorpath=T/'markov_worker_000182_replay_method_evidence.json';prior=js(priorpath);initial=data(er+'input-hashes.json');inh=data(er+'inherited-lean-path.json');rec=data(er+'reconciliation.json');inter=data(er+'interruption-reconciliation.json');caps=data(er+'capabilities.json')
mathrels=sorted(p for p in inv['current'] if re.fullmatch(r'research/Markov.*M55C\.lean',p));text={};graph={}
for rel in mathrels:
 s=retained(rel).decode();m=Path(rel).stem;text[m]=s;graph[m]=parse(s,rel,used[rel]['path']);assert sha(R/rel)==graph[m]['sha256']
new=set(graph);cache={}
for m,n in prior['source_graph'].items():
 if before.get(n['path'])==n['sha256']:cache[m]=dict(n,provenance='hash-bound sealed182 source graph',before183_source_sha256=before[n['path']])
oldmap={}
for m,z in prior['inherited_object_bindings_from_prior181']['entries'].items():oldmap[m]=dict(source=z['source'],source_sha256=z['source_sha256'],object=z['object'],object_sha256=z['prior_object_sha256'],origin='sealed182 inherited binding',recovered_in157=z.get('previously_recovered156_in157',False))
for k in ['compiled_source_object_bindings','compiled_only_source_object_bindings','operational_source_object_bindings']:
 for m,z in prior.get(k,{}).items():oldmap[m]=dict(source=z['source'],source_sha256=z['source_sha256'],object=z['object'],object_sha256=z['object_sha256'],origin='sealed182 '+k)
external=set();errors=[]
def resolve(m):
 if m in graph:return graph[m]
 if m in cache:graph[m]=cache[m];return graph[m]
 if not m.startswith(('Markov','MathGKM','KernelRfl')):external.add(m);return None
 errors.append(m);return None
def closure(ms):
 seen=set();stack=list(ms)
 while stack:
  m=stack.pop()
  if m in seen:continue
  n=resolve(m)
  if n is not None:seen.add(m);stack.extend(n['imports'])
 return seen
def counts(ms):return dict(collections.Counter(x['kind'] for m in ms for x in graph[m]['declarations']))
full=closure(new);assert not errors,errors;inherited=full-new;ob={};orders={}
for m in sorted(inherited):
 n=graph[m];z=oldmap[m];assert n['sha256']==z['source_sha256']==before.get(n['path']) and z['object_sha256']==before.get(z['object'])
 ob[m]=dict(source=n['path'],source_sha256=n['sha256'],prior_source_sha256=z['source_sha256'],before183_source_sha256=before[n['path']],object=z['object'],prior_object_sha256=z['object_sha256'],before183_object_sha256=before[z['object']],binding_origin=z['origin'],in_compiled_source_closure=True,in_selected_source_closure=False,in_successful_replay_base=False,in_requested_import_base=False,previously_recovered156_in157=z.get('recovered_in157',False),all_bindings_match=True)
 candidates=[]
 for root in inh.split(':'):
  p=Path(root)/(m.replace('.','/')+'.olean')
  try:rel=str(p.relative_to(R))
  except ValueError:continue
  if rel in before:candidates.append(rel)
 assert candidates and candidates[0]==z['object'],(m,candidates,z['object']);orders[m]=dict(before183_candidates_in_saved_path_order=candidates,first_matches_pair_map=True)
pairmap=dict(entries=ob,count=len(ob),origins=dict(collections.Counter(z['binding_origin'] for z in ob.values())),successful_replay_base_count=0,selected_import_base_count=0,compiled_import_base_count=len(ob),scope='Exact inherited identities from sealed182 and before183; all ten current source import closures. No replay or selected final validation set is retained; compiler success does not establish replay/axiom coverage.')
builds=[];versions=[];bounds={};commands=[]
for i,e in enumerate(events,1):
 it=e.get('item',{})
 if it.get('type')=='command_execution' and (tag in it.get('command','') or suf in it.get('command','')):commands.append(dict(line=i,type=e['type'],item_id=it['id'],command=it.get('command',''),output=it.get('aggregated_output',''),exit_code=it.get('exit_code')))
for rel in sorted(p for p in inv['current'] if re.fullmatch(er+r'build-\d+\.json',p)):
 b=data(rel);stamp=int(Path(rel).stem.split('-')[-1])/1e9;b=dict(receipt=Path(rel).name,path=used[rel]['path'],receipt_sha256=used[rel]['sha256'],archive_present=rel in inv['archive'],started=stamp,finished=stamp+b['seconds'],started_utc=utc(stamp),finished_estimate_utc=utc(stamp+b['seconds']),**b);assert b['mode']=='build' and len(b['modules'])==1;m=next(iter(b['modules']));snaprel=rel.replace('.json','.lean');s=retained(snaprel).decode();assert used[snaprel]['sha256']==b['modules'][m];aa=sections(s);ff=sections(text[m]);changed={n:dict(snapshot=aa.get(n,{}).get('header',''),final=ff.get(n,{}).get('header','')) for n in aa.keys()|ff.keys() if aa.get(n,{}).get('header')!=ff.get(n,{}).get('header')}
 version=dict(receipt=b['receipt'],module=m,returncode=b.get('returncode'),timeout=b.get('timeout',False),snapshot_path=used[snaprel]['path'],snapshot_sha256=b['modules'][m],snapshot_archived=snaprel in inv['archive'],final_sha256=graph[m]['sha256'],same_final_source=b['modules'][m]==graph[m]['sha256'],snapshot_counts=dict(collections.Counter(x['kind'] for x in aa.values())),final_counts=counts([m]),snapshot_imports=re.findall(r'^import\s+([\w.]+)',clean(s),re.M),final_imports=graph[m]['imports'],changed_headers=changed,added_final_names=sorted(ff.keys()-aa.keys()),removed_final_names=sorted(aa.keys()-ff.keys()),changed_common_blocks=sorted(n for n in aa.keys()&ff.keys() if aa[n]['block']!=ff[n]['block']),common_headers_equal_ignoring_whitespace=all(re.sub(r'\s+','',x['snapshot'])==re.sub(r'\s+','',x['final']) for x in changed.values() if x['snapshot'] and x['final']),literal_admissions=bool(re.search(r'\b(?:sorry|admit)\b',clean(s))),full_literal_diff=''.join(difflib.unified_diff(s.splitlines(True),text[m].splitlines(True))))
 matches=[e for e in commands if e['type']=='item.completed' and b['receipt'] in e['output'] and ('validate_'+tag+'.py' in e['command'])];assert len(matches)==1,(b['receipt'],len(matches));e=matches[0];start=next(x['line'] for x in commands if x['item_id']==e['item_id'] and x['type']=='item.started');bound=int(re.search(r' build (\d+) ',e['command'])[1]);bounds[b['receipt']]=dict(module=m,timeout_seconds=bound,started_event=start,completed_event=e['line'],command=e['command'],outer_exit_code=e['exit_code']);builds.append(b);versions.append(version)
compiled={next(iter(b['modules'])) for b in builds if b.get('returncode')==0};assert compiled==new and len(new)==10;assert len(builds)==18 and sum(b.get('returncode')==0 for b in builds)==10 and sum(b.get('returncode')==1 for b in builds)==8
objects={}
for m in sorted(new):
 rel=er+m+'.olean';p=R/rel;h=sha(p);assert h==inv['current'][rel]['sha256'];matching=[b for b in builds if b.get('returncode')==0 and b['modules'].get(m)==graph[m]['sha256']];assert len(matching)==1;ap=A/rel;ah=sha(ap) if rel in inv['archive'] else None
 objects[m]=dict(source=graph[m]['path'],source_sha256=graph[m]['sha256'],source_provenance=graph[m]['provenance'],object=rel,object_sha256=h,object_bytes=p.stat().st_size,object_archive_present=rel in inv['archive'],archive_object_sha256=ah,archive_object_bytes=inv['archive'].get(rel,{}).get('bytes'),archive_object_matches_current=ah==h if ah else None,matching_final_build=matching[0]['receipt'],replayed_successfully=False,axiom_printed=False,retained_full_validation=False,scope='Current ordinary object association only; incomplete archive and no final object inventory. No binary decoding or production re-execution.')
old212=set(prior['worker121_inherited_boundary'] and next(z['old121_212'] for z in prior['endpoint_import_boundaries'].values() if len(z['old121_212'])==212));old195=set(next(z['old121_195'] for z in prior['endpoint_import_boundaries'].values() if len(z['old121_195'])==195));old19=set(next(z['old121_accepted'] for z in prior['endpoint_import_boundaries'].values() if len(z['old121_accepted'])==19));endpoints={}
for m in sorted(new):
 c=closure([m]);endpoints[m]=dict(selected=False,successfully_replayed=False,compiled=True,local_nodes=len(c),current_modules=sorted(c&new),current_count=len(c&new),current_counts=counts(c&new),inherited_count=len(c-new),direct_dependency_paths=[graph[x]['path'] for x in graph[m]['imports'] if x in graph],old121_212=sorted(c&old212),old121_195=sorted(c&old195),old121_accepted=sorted(c&old19),Window_imported='MarkovWindowLC6d34' in c,Abel_imported='MarkovAbel65c4' in c)
cycles=[];done=set();active=[]
def walk(m):
 if m in active:cycles.append(active[active.index(m):]+[m]);return
 if m in done:return
 active.append(m)
 for d in graph[m]['imports']:
  if d in graph:walk(d)
 active.pop();done.add(m)
for m in graph:walk(m)
assert not cycles
programs={};wrappercmp={}
for stem in ['setup','validate','audit']:
 rel='research/'+stem+'_'+tag+'.py';cur=retained(rel).decode();oldpath=R/('.control/markov/workers/000182/artifacts/research/'+stem+'_b3eed364.py');old=read(oldpath).decode();ret=old.replace('b3eed36486ad48a08ac07be4c9b62794',req['id']).replace('b3eed364',tag).replace('5bf6837d','b3eed364').replace('MB3E',suf).replace('M5BF','MB3E');wrappercmp[stem]=dict(path=used[rel]['path'],sha256=used[rel]['sha256'],prior_path=str(oldpath),prior_sha256=H[str(oldpath)],exact_after_retag=cur==ret,diff_after_retag=''.join(difflib.unified_diff(ret.splitlines(True),cur.splitlines(True))));ast.parse(cur)
checkerrel='research/ReplayIsolatedM55C.lean';checker=retained(checkerrel).decode();oldchecker=read(R/'.control/markov/workers/000182/artifacts/research/ReplayIsolatedMB3E.lean').decode();assert checker==oldchecker.replace('MB3E',suf)
for rel in sorted(p for p in inv['current'] if p.startswith('research/') and p.endswith('.py') and not Path(p).name.startswith(('setup_','validate_','audit_'))):
 s=retained(rel).decode();tree=ast.parse(s);programs[rel]=dict(sha256=used[rel]['sha256'],provenance=used[rel]['path'],imports=[ast.unparse(n) for n in tree.body if isinstance(n,(ast.Import,ast.ImportFrom))],main_guard=any(isinstance(n,ast.If) and ast.unparse(n.test)=="__name__ == '__main__'" for n in tree.body))
mtimes={m:dict(mtime_ns=inv['current'][graph[m]['path']]['mtime_ns'],mtime_utc=utc(inv['current'][graph[m]['path']]['mtime_ns']/1e9),inside_builds=[b['receipt'] for b in builds if m in b['modules'] and b['started']<=inv['current'][graph[m]['path']]['mtime_ns']/1e9<=b['finished']]) for m in new};overlaps=[];editover=[];deporder=[]
for i,b in enumerate(builds):
 m=next(iter(b['modules']))
 for bb in builds[i+1:]:
  if m in bb['modules'] and max(b['started'],bb['started'])<min(b['finished'],bb['finished']):overlaps.append([m,b['receipt'],bb['receipt']])
 for d in graph[m]['imports']:
  if d in new:
   preceding=[bb['receipt'] for bb in builds if bb.get('returncode')==0 and bb['modules'].get(d)==graph[d]['sha256'] and bb['finished']<=b['started']];deporder.append(dict(build=b['receipt'],module=m,dependency=d,prior_matching_success=preceding,required_for_accepted_build=b.get('returncode')==0))
 z=bounds[b['receipt']]
 for j,e in enumerate(events,1):
  if z['started_event']<j<z['completed_event'] and e['type']=='item.completed' and e.get('item',{}).get('type')=='file_change' and any(x['path']==str(R/graph[m]['path']) for x in e['item'].get('changes',[])):editover.append(dict(receipt=b['receipt'],event=j,module=m))
assert all(x['prior_matching_success'] for x in deporder if x['required_for_accepted_build'])
names=collections.defaultdict(list)
for m in new:
 for x in graph[m]['declarations']:names[x['name']].append(m)
assert all(len(v)==1 for v in names.values())
history={str(w):dict(imported=sorted(m for m in ob if m.endswith(s)),new_recovery_in183=0) for w,s in [(156,'ME9C'),(157,'M1BB'),(158,'MFFD'),(159,'M468'),(160,'MDAB'),(161,'MAE9'),(162,'M7E2'),(163,'MFEE'),(164,'MAD5'),(165,'MC9F'),(166,'MDB2'),(167,'M7A3'),(168,'M418'),(169,'MF8F'),(170,'MA64'),(171,'MC3E'),(172,'M964'),(173,'M139'),(174,'M831'),(175,'M657'),(176,'MBE3'),(177,'M09F'),(178,'MA45'),(179,'MBEC'),(180,'M1C6'),(181,'M5BF'),(182,'MB3E')]}
absent=[C/'receipt.json',C/'final.json',R/(er+'validation.json'),R/(er+'manifest.json'),R/(er+'last-verification.json'),R/(er+'mathematical-modules.json'),R/(er+'report.json'),R/'research/finalize_55cf20d2.py'];absobs=dict(observed_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),paths={str(p):not p.exists() for p in absent});assert all(absobs['paths'].values())
out=dict(worker=183,request_id=req['id'],scope='Reconciled CLOSED PARTIAL183 static archive-first audit. Exact inventory-named current fallbacks are separately identified. No project execution, mathematical-value computation, active184+ reads or historical status upgrade.',host_reconciliation=reconciliation,initial_inventory=inv,initial_admin_absence_observation=absobs,source_graph=graph,source_resolution_errors=errors,external_source_boundaries=sorted(external),all_resolved_source_cycles=cycles,all_new_counts=counts(new),coverage=dict(selected_targets=[],selected_counts={},successful_targets=[],successful_target_counts={},compiled_math_targets=sorted(compiled),compiled_math_counts=counts(compiled),archived_math_sources=[Path(p).stem for p in mathrels if p in inv['archive']],current_math_sources=sorted(new),compiled_only_without_replay=sorted(compiled),compiled_and_printed_not_replayed=[],pending_math_drafts=[],unbuilt_math_drafts=[],operational_modules=[]),coverage_partition=dict(compiled_only=dict(modules=sorted(compiled),module_count=len(compiled),counts=counts(compiled),printed=False,replayed=False,full_validation=False)),import_scope=dict(full_graph_nodes=len(full),compiled_math_source_closure=len(full),all_inherited_pair_count=len(ob),compiled_import_base_count=len(ob),selected_math_source_closure=0,successful_replay_base_count=0,selected_import_base_count=0,direct_inherited_imports=sorted({d for m in new for d in graph[m]['imports']}-new),qualification='Direct imports and closure are static compiler dependencies, not a performed replay base.'),inherited_object_bindings_from_prior182=pairmap,ordered_inherited_object_candidates=orders,endpoint_import_boundaries=endpoints,compiled_source_object_bindings={},compiled_only_source_object_bindings=objects,operational_source_object_bindings={},audit_source_object_bindings={},build_receipts=builds,replay_receipts=[],replay_checks=[],axiom_audits=[],printed_closure_summary=dict(rows=0,distinct=0,axiom_sets={}),compiler_attempt_summary=dict(attempts=18,success=10,rc1=8,timeouts=0),compiler_invocation_bounds=bounds,source_versions=versions,rejected_builds=[z for z in versions if z['returncode']!=0],successful_build_snapshots=[z for z in versions if z['returncode']==0],successful_version_selection=dict(successful_mathematical_builds=10,successful_selected_mathematical_builds=0,final_source_matching_math_builds=10,superseded_successful_current_sources=[z for z in versions if z['returncode']==0 and not z['same_final_source']],validation_stage_count=0,scope='Ten per-module successful compiler receipts bind final current source snapshots. No selected set, joint replay, axiom prints or final validation is retained.'),wrapper_comparisons=wrappercmp,isolated_checker=dict(sha256=used[checkerrel]['sha256'],exact_prior182_retag=True,body_equal_prior110_after_guard_removal=prior['isolated_checker']['body_equal_prior110_after_guard_removal'],executed_in183=False,guard_prefix='MathGKM.Markov.',guard_suffix=suf,guarded_counts=[],lexical_top_level_counts=counts(new),qualification='Retained unexecuted checker tests every collected matching namespace/suffix name for base absence and unsafe/partial flags. Ordinary replay of collected constants, optional server/private parts and compiled import trust retain prior limits; no observed guard/replay result for183.'),selected_duplicate_names={},compiled_duplicate_names={},current_dependency_build_order=deporder,same_module_attempt_overlaps=overlaps,source_mtime_overlaps={m:z for m,z in mtimes.items() if z['inside_builds']},final_source_mtimes=mtimes,live_source_version_boundary=dict(completed_source_edit_event_overlaps=editover,same_module_build_overlaps=overlaps,scope='Snapshot-before-live-path compiler wrapper is not atomic source-input authentication; event absence does not exclude unobserved edits.'),experiment_program_interfaces=programs,retained_finalization=dict(finalizer_retained=False,finalizer_executed_observed=False,selected_list_retained=False,validation_retained=False,manifest_retained=False,report_retained=False,receipt_retained=False,outcome='uncertain_effects',returncode=None,report=None,mathematical_resolution=False,archive_controller_count=24,current_exact_inventory_count=78,scope='Missing finalization/receipt is not reconstructed from per-command successes. No blanket prior-input revalidation or final object-hash table exists.'),retained_timing=dict(controller_started=proc['started'],started_utc=utc(proc['started']),request_seconds=req['seconds'],deadline_utc=utc(proc['started']+req['seconds']),controller_finished=None,elapsed=None,events_count=len(events),started_items=sum(e['type']=='item.started' for e in events),command_starts=sum(e['type']=='item.started' and e.get('item',{}).get('type')=='command_execution' for e in events),last_events=events[-4:],terminal_event_type=events[-1]['type'],events_sha256=H[str(C/'events.jsonl')],events_bytes=len(read(C/'events.jsonl')),activity=activity,stderr_bytes=len(stderr),watchdog_traceback=watchdog,last_successful_build_finish_estimate=max(b['finished_estimate_utc'] for b in builds if b.get('returncode')==0),metadata={n:dict(bytes=(C/n).stat().st_size,mtime_ns=(C/n).stat().st_mtime_ns,mtime_utc=utc((C/n).stat().st_mtime)) for n in ['events.jsonl','activity.json','watchdog.log','reconciliation.json']},qualification='No receipt finish/elapsed. File mtimes, retained activity sample and estimated compiler intervals are separate observations; interruption reconciliation is not a completed-host outcome.'),prior_reconciliation=rec,prior_interruption_reconciliation=inter,capabilities=caps,inventory_schema_boundary=dict(initial_count=len(initial),initial_roots=dict(collections.Counter(p.split('/')[0] for p in initial)),initial_suffixes=sorted({Path(p).suffix for p in initial}),own_initial_paths=sorted(p for p in initial if tag in p or suf in p),own_exemptions=[],archive_count=24,current_count=78,archive_current_mismatch=inv['archive_current_mismatch'],manifest_retained=False,initial_snapshot_not_final_preservation_check=True),imported_worker_memberships=history,prior182_source_boundary=dict(imported_accepted_modules=sorted(set(prior['coverage']['selected_targets'])&inherited),accepted_comparison_only_modules=sorted(set(prior['coverage']['selected_targets'])-inherited),prior_final_note_and_evidence_correction_retained=True),worker121_inherited_boundary=dict(imported212=len(old212&inherited),imported195=len(old195&inherited),imported_accepted19=len(old19&inherited),global_unrecovered_backlog=212,separate_accepted19=19,subset195_is_not_additional=True,current_recovery_count=0),worker166_boundary=dict(old_seven_compiled_printed_unreplayed=prior['worker166_boundary']['old_seven_compiled_printed_unreplayed'],current183_imported=history['166']['imported'],current183_old_seven_imported=sorted(set(prior['worker166_boundary']['old_seven_compiled_printed_unreplayed'])&inherited),new_recovery_count=0),worker166_host_status_qualification=prior['worker166_host_status_qualification'],historical_boundaries=dict(sealed182_method_evidence_path=str(priorpath),sealed182_method_evidence_sha256=H[str(priorpath)],scope='Prior212/195/separate19, Window/Abel two-print limits,156/157,160/161/163/164/168 pending,166 completed-host/combined-replay-timeout/seven unreplayed prefixes,171 failed report and180 version boundaries remain exactly as sealed182. No historical body recovery.'),named_older_window_boundary=dict(module='MarkovWindowLC6d34',imported='MarkovWindowLC6d34' in inherited,current_binding=ob.get('MarkovWindowLC6d34'),scope='Historical empty-checker plus runInterval_cross6d34/runInterval_smoothed_lc6d34 prints only; crossLC_balanced6d34 has no new printed closure.'),named_older_abel_boundary=dict(module='MarkovAbel65c4',imported='MarkovAbel65c4' in inherited,current_binding=ob.get('MarkovAbel65c4'),scope='Historical source/object binding plus tail_weight_nonneg65c4/centered_weight_nonneg65c4 prints; crossLC_center_weights65c4 has no new printed closure.'),commands=commands,retained_path_provenance=used,method_limits=dict(static_only=True,no_documentation_work_reads=True,no_mathematical_value_recomputation=True,no_proof_repair_or_strategy=True,no_current_replay_or_print_credit=True,no_inherited_fresh_whole_source_rebuild=True,compiled_objects_are_associations_not_fresh_production_authentication=True,optional_server_private_parts_not_exhaustively_authenticated=True,archive_incomplete=True,one_archived_object_empty_mismatch=True,prior_host_outcomes_not_upgraded=True),static_input_sha256=H)
out['partial_retention']=dict(bundle=retbundle,observation=retobs,scope='Separate46 nonbinary copies, not a repaired controller archive; eight missing and one empty mismatched ordinary objects remain outside this bundle.')
pairpath=T/'markov_worker_000183_inherited_pair_expectations.json';pairpath.write_text(json.dumps(pairmap,indent=2,sort_keys=True)+'\n');sha(pairpath);sha(Path(__file__));out['static_input_sha256']=H
(T/'markov_worker_000183_replay_method_evidence.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps(dict(builds=out['compiler_attempt_summary'],counts=out['all_new_counts'],pairs=len(ob),origins=pairmap['origins'],graph=len(full),endpoints={m:z['inherited_count'] for m,z in endpoints.items()},old182=out['prior182_source_boundary'],overlaps=out['live_source_version_boundary'],mtimeover=out['source_mtime_overlaps'],inputs=len(H)),indent=2))
