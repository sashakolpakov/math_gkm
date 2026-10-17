"""Audit-owned static provenance parser. No imported project code or mathematical evaluation."""
from pathlib import Path
from datetime import datetime,timezone
from collections import Counter,defaultdict
import ast,difflib,hashlib,json,os,re,stat
P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000183';A=W/'artifacts'
E=P/'evidence/markov-55cf20d2';T=Path('/private/tmp/math_gkm_godel_20261013')
PRE='markov_worker_000183_';B=T/(PRE+'partial_retention_bundle')
OUT=T/(PRE+'validation_evidence.json');REQ='55cf20d29efe4eebb6677e949f2beb36'
started=datetime.now(timezone.utc).isoformat();inputs={};digests={}
def sha(p):
 p=Path(p);st=p.stat();key=(str(p),st.st_size,st.st_mtime_ns,st.st_ino)
 if key not in digests:
  h=hashlib.sha256()
  with p.open('rb') as f:
   for b in iter(lambda:f.read(1048576),b''):h.update(b)
  digests[key]=h.hexdigest()
 value=digests[key];inputs[str(p)]=value;return value
def pin(p):
 p=Path(p);s=p.lstat()
 return {'path':str(p),'bytes':s.st_size,'sha256':sha(p),'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns}
def load(p):sha(p);return json.loads(Path(p).read_text())
def read(p):sha(p);return Path(p).read_text()
def saved(rel):
 p=A/rel
 if p.exists():return p
 p=B/rel
 assert p.exists(),rel
 return p
def utc(x):return datetime.fromtimestamp(x,timezone.utc).isoformat()
initial=load(T/(PRE+'initial_inventory.json'));bundle=load(T/(PRE+'partial_retention_bundle.json'));observation=load(T/(PRE+'partial_retention_observation.json'))
assert initial['archive_count']==24 and initial['current_count']==78 and bundle['count']==46
recon=load(W/'reconciliation.json');assert recon['request_id']==REQ and recon['outcome']=='uncertain_effects' and recon['report'] is None and recon['mathematical_resolution'] is False
request=load(W/'request.json');process=load(W/'process.json');activity=load(W/'activity.json')
control={p.name:pin(p) for p in sorted(W.iterdir()) if p.is_file()}
raw=read(W/'events.jsonl');events=[json.loads(s) for s in raw.splitlines()]
assert len(events)==180 and activity['bytes']==len(raw.encode())
command_rows=[];starts={};completions={};file_changes=[]
for line,event in enumerate(events,1):
 item=event.get('item',{});id=item.get('id')
 if event['type']=='item.started':starts[id]=(line,item)
 if event['type']=='item.completed':completions[id]=(line,item)
 if item.get('type')=='file_change' and event['type']=='item.completed':
  for change in item['changes']:file_changes.append({'line':line,'id':id,**change})
 if item.get('type')=='command_execution' and event['type']=='item.completed':
  command_rows.append({'line':line,'id':id,'started_line':starts[id][0],'command':item['command'],'returncode':item['exit_code'],'status':item['status'],'stdout':item.get('aggregated_output','')})
assert len(command_rows)==61
event_builds={}
for row in command_rows:
 if 'research/validate_55cf20d2.py build ' in row['command']:
  report=json.loads(row['stdout']);event_builds[Path(report['receipt']).name]=(row,report)
source_paths={Path(k).stem:k for k in initial['current'] if k.startswith('research/Markov') and k.endswith('M55C.lean')}
assert len(source_paths)==10
def decls(text):
 return [{'kind':m.group(1),'name':m.group(2),'line':text[:m.start()].count('\n')+1} for m in re.finditer(r'^(?:(?:noncomputable|private|protected)\s+)*(theorem|def|abbrev|instance|inductive)\s+([\w\u0080-\uffff]+)',text,re.M)]
sources={}
for mod,rel in sorted(source_paths.items()):
 p=saved(rel);txt=read(p);current=P/rel
 assert sha(p)==sha(current)==initial['current'][rel]['sha256']
 sources[mod]={'path':str(current),'retained_path':str(p),'sha256':sha(p),'bytes':p.stat().st_size,'archive_present':(A/rel).exists(),'declarations':decls(txt),'counts':dict(Counter(d['kind'] for d in decls(txt))),'imports':re.findall(r'^\s*import\s+(\S+)',txt,re.M),'compiled':False,'selected':False,'replayed':False,'printed':False,'fully_accepted':False}
runs=[];versions=defaultdict(list)
for name in sorted(k for k in initial['current'] if re.search(r'/build-\d+\.json$',k)):
 p=saved(name);d=load(p);assert d['mode']=='build' and len(d['modules'])==1
 mod,expected=next(iter(d['modules'].items()));assert mod in sources
 snapshot=Path(name).with_suffix('.lean');sp=saved(str(snapshot));sh=sha(sp);assert sh==expected
 row,report=event_builds[p.name]
 assert report['returncode']==d.get('returncode')==row['returncode'] and report['seconds']==d['seconds'] and report['timeout']==d.get('timeout',False)
 assert report['stdout']==(d['stdout'][-2500:] if d.get('returncode')!=0 else '')
 assert len(d['command'])==6 and d['command'][1:4]==['-j','1','-o'] and d['command'][-1]==str(P/source_paths[mod])
 epoch=int(p.stem.split('-')[1])/1e9
 before_edit=[v for v in file_changes if row['started_line']<v['line']<row['line'] and v['path']==str(P/source_paths[mod])]
 final_identical=sh==sources[mod]['sha256'];txt=read(sp);finaltxt=read(Path(sources[mod]['retained_path']))
 diff=''.join(difflib.unified_diff(txt.splitlines(True),finaltxt.splitlines(True),fromfile=sp.name,tofile=Path(source_paths[mod]).name))
 item={'receipt':pin(p),'module':mod,'source_sha256':expected,'snapshot':pin(sp),'final_source_identical':final_identical,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'seconds':d['seconds'],'started_epoch_estimate':epoch,'started_utc_estimate':utc(epoch),'finished_utc_estimate':utc(epoch+d['seconds']),'finished_epoch_estimate':epoch+d['seconds'],'event_line':row['line'],'event_started_line':row['started_line'],'event_id':row['id'],'event_summary_matches':True,'command':d['command'],'bound_seconds':int(re.search(r' build (\d+) ',row['command']).group(1)),'source_file_changes_during_command':before_edit,'snapshot_declarations':decls(txt),'diff_to_final':diff,'stdout_sha256':hashlib.sha256(d['stdout'].encode()).hexdigest(),'stderr':d['stderr']}
 runs.append(item);versions[mod].append(item)
 if d.get('returncode')==0:assert final_identical;sources[mod]['compiled']=True
assert len(runs)==18 and sum(r['returncode']==0 for r in runs)==10 and sum(r['returncode']==1 for r in runs)==8
assert not any(r['timeout'] for r in runs) and set(event_builds)=={Path(r['receipt']['path']).name for r in runs}
objects=[]
for mod,data in sources.items():
 successful=[r for r in versions[mod] if r['returncode']==0];assert len(successful)==1
 cp=E/(mod+'.olean');cur=pin(cp);ap=A/cp.relative_to(P);archive=pin(ap) if ap.exists() else None
 object_path=P/'.control/markov/objects'/cur['sha256'];cas=pin(object_path) if object_path.exists() else None
 objects.append({'module':mod,'current':cur,'archive':archive,'archive_matches_current':archive is not None and archive['sha256']==cur['sha256'],'content_addressed_object':cas,'content_addressed_matches_current':cas is not None and cas['sha256']==cur['sha256'],'successful_snapshot_receipt':successful[0]['receipt'],'object_mtime_inside_estimated_compile':successful[0]['started_epoch_estimate']<=cp.stat().st_mtime<=successful[0]['finished_epoch_estimate'],'compiler_receipt_has_object_digest':False,'qualification':'Current ordinary object is observed separately; compiler receipt records source digest and return code, not object-output digest. Partial archived objects are not substituted or repaired.'})
assert sum(o['archive'] is not None for o in objects)==2
all_current=[];archive_mismatch=[]
for rel,old in initial['current'].items():
 cur=pin(P/rel);assert cur['sha256']==old['sha256']
 ap=A/rel;arch=pin(ap) if ap.exists() else None
 bp=B/rel;retained=pin(bp) if bp.exists() else None
 if arch and arch['sha256']!=cur['sha256']:archive_mismatch.append(rel)
 if retained:assert retained['sha256']==cur['sha256']
 all_current.append({'relative_path':rel,'current':cur,'archive':arch,'supplement':retained})
assert archive_mismatch==['evidence/markov-55cf20d2/MarkovTopSecondGapM55C.olean']
before=load(W/'before.json');initial_map=load(saved('evidence/markov-55cf20d2/input-hashes.json'))
assert len(before)==25578 and len(initial_map)==22032
initial_checks=[];not_before=[];before_conflicts=[]
for rel,expected in initial_map.items():
 assert rel.startswith(('research/','evidence/','MathGKM/')) and '..' not in Path(rel).parts
 if rel not in before:not_before.append(rel)
 elif before[rel]!=expected:before_conflicts.append(rel)
 p=P/rel;actual=sha(p) if p.exists() else None
 initial_checks.append({'path':str(p),'relative_path':rel,'expected':expected,'current':actual,'matches':expected==actual,'controller_before':before.get(rel)})
prior=[]
for prior_tag,expected_count in [('b3eed364',95),('c3e5369f',127)]:
 manifest=P/f'evidence/markov-{prior_tag}/manifest.json';mapping=load(manifest)
 assert len(mapping)==expected_count
 rows=[]
 for rel,expected in mapping.items():
  current=sha(P/rel) if (P/rel).exists() else None
  rows.append({'path':str(P/rel),'relative_path':rel,'expected':expected,'current':current,'matches':current==expected,'controller_before':before.get(rel),'initial':initial_map.get(rel)})
 prior.append({'manifest':pin(manifest),'tag':prior_tag,'count':len(rows),'rows':rows,'mismatch':[r['relative_path'] for r in rows if not r['matches']]})
setup=read(saved('research/setup_55cf20d2.py'));validate=read(saved('research/validate_55cf20d2.py'));audit=read(saved('research/audit_55cf20d2.py'));checker=read(saved('research/ReplayIsolatedM55C.lean'))
wrapper_comparisons=[]
for previous,current in [('validate_b3eed364.py','validate_55cf20d2.py'),('audit_b3eed364.py','audit_55cf20d2.py'),('ReplayIsolatedMB3E.lean','ReplayIsolatedM55C.lean')]:
 old=read(P/'research'/previous);new=read(saved('research/'+current));changed=old.replace('b3eed364','55cf20d2').replace('MB3E','M55C')
 wrapper_comparisons.append({'old':pin(P/'research'/previous),'new':pin(saved('research/'+current)),'exact_retag_match':changed==new,'diff_after_retag':''.join(difflib.unified_diff(changed.splitlines(True),new.splitlines(True)))})
finite=[]
for name,eventline in [('top-midpoint.json',35),('high-mass-probe.json',83),('kernel-lc-weight-probe.json',93),('geometric-weight-probe.json',95),('top-moment-probe.json',122),('source-experiment.json',168)]:
 p=saved('evidence/markov-55cf20d2/'+name);obj=load(p);row=next(r for r in command_rows if r['line']==eventline)
 try:printed=json.loads(row['stdout']);fmt='JSON'
 except json.JSONDecodeError:printed=ast.literal_eval(row['stdout']);fmt='Python literal (safe parser, not execution)'
 projection={k:v for k,v in obj.items() if k!='labels'} if name=='source-experiment.json' else obj
 assert printed==projection and row['returncode']==0
 if name=='source-experiment.json':assert set(obj)-set(printed)=={'labels'}
 finite.append({'file':pin(p),'event_line':eventline,'format':fmt,'complete_literal_object_matches':printed==obj,'projection_excludes':['labels'] if name=='source-experiment.json' else [],'literal_projection_matches':True,'no_values_or_rng_recomputed':True})
genrow=next(r for r in command_rows if r['line']==49);g=ast.literal_eval(genrow['stdout']);certificate=load(saved('evidence/markov-55cf20d2/top-second-certificate.json'))
generator_binding={'event_line':49,'stdout':g,'certificate_keys':list(certificate),'certificate':pin(saved('evidence/markov-55cf20d2/top-second-certificate.json')),'projection_matches':g=={'scale':certificate['scale'],'terms':len(certificate['coefficients'])},'projection_scope':'Saved scale literal and number of retained coefficient records only; no coefficient value or identity recomputed.'}
assert generator_binding['projection_matches']
raw_contract=next(r['stdout'] for r in command_rows if r['line']==8)
contract,offset=json.JSONDecoder().raw_decode(raw_contract);historical_contract_line=raw_contract[:offset]
assert contract==request['contract']
root=P/request['contract']['root_file'];root_pin=pin(root);assert root_pin['sha256']==request['contract']['root_sha256']
contract_binding={'root':root_pin,'request_contract_hash':request.get('contract_hash'),'request_contract':contract,'event_line':8,'saved_raw_json_sha256':hashlib.sha256(historical_contract_line.encode()).hexdigest(),'saved_raw_json_newline_sha256':hashlib.sha256((historical_contract_line+'\n').encode()).hexdigest(),'canonical_json_sha256':hashlib.sha256(json.dumps(contract,sort_keys=True).encode()).hexdigest(),'compact_json_sha256':hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),'current_mutable_contract_read':False}
historical171=load(saved('evidence/markov-55cf20d2/interruption-reconciliation.json'))
old171=W.parent/'000171/events.jsonl';assert sha(old171)==historical171['raw_events_sha256']
old171events=[json.loads(s) for s in read(old171).splitlines()]
assert len(old171events)==historical171['event_count'] and old171events[-4:]==historical171['last_events']
absence_names=['receipt.json','report.json','final.json']
absence={str(W/n):not(W/n).exists() for n in absence_names}
for name in ['validation.json','mathematical-modules.json','manifest.json','final-check.json','last-verification.json','report.json']:
 absence[str(E/name)]=not(E/name).exists()
absence[str(P/'research/finalize_55cf20d2.py')]=not(P/'research/finalize_55cf20d2.py').exists()
assert all(absence.values())
start=process['started'];deadline=start+1800
timing={'started_epoch':start,'started_utc':utc(start),'nominal_deadline_epoch':deadline,'nominal_deadline_utc':utc(deadline),'receipt_finish':None,'receipt_elapsed':None,'activity_epoch':activity['time'],'activity_utc':utc(activity['time']),'raw_last_event_line':180,'raw_last_event_type':events[-1]['type'],'raw_last_event_id':events[-1]['item']['id'],'turn_completed_present':any(e['type']=='turn.completed' for e in events),'turn_failed_present':any(e['type']=='turn.failed' for e in events),'reconciliation_mtime_utc':utc((W/'reconciliation.json').stat().st_mtime),'builds_estimated_after_deadline':[r['receipt']['path'] for r in runs if r['finished_epoch_estimate']>deadline],'current_files_mtime_after_deadline':[r['relative_path'] for r in all_current if r['current']['mtime_ns']/1e9>deadline],'qualification':'No receipt finish/elapsed is inferred. Compiler timestamp filenames plus monotonic duration give approximate intervals only; archive-copy and reconciliation mtimes are distinct from validation execution.'}
unmatched=[{'id':id,'line':line,'type':item.get('type')} for id,(line,item) in starts.items() if id not in completions]
sameoverlap=[]
for mod,rs in versions.items():
 for n,r in enumerate(rs):
  for s in rs[n+1:]:
   if max(r['event_started_line'],s['event_started_line'])<min(r['event_line'],s['event_line']):sameoverlap.append([mod,r['receipt']['path'],s['receipt']['path']])
counts=dict(Counter(d['kind'] for s in sources.values() for d in s['declarations']))
out={'worker':183,'request':REQ,'scope':'Independent static retained-record audit of reconciled closed partial183 only. No project programs, compiler/checker/replay/experiments/finalizer/math-value or RNG execution; no active184+ access or advice. Current ordinary object hashes do not repair the partial archive or establish independent proof validation.',
 'created_utc':datetime.now(timezone.utc).isoformat(),'started_utc':started,'historical_outcome':recon,'receipt':None,'report':None,'control_metadata':control,'initial_inventory':pin(T/(PRE+'initial_inventory.json')),'initial_request_scope':initial,
 'partial_retention':{'manifest':pin(T/(PRE+'partial_retention_bundle.json')),'observation':pin(T/(PRE+'partial_retention_observation.json')),'count':46,'bytes':2952709,'preservation_paths':bundle['preservation_paths']},
 'event_count':len(events),'completed_command_count':len(command_rows),'event_types':dict(Counter(e['type'] for e in events)),'unmatched_starts':unmatched,'activity':activity,'activity_bytes_accounted':True,
 'source_file_change_events':file_changes,'all_sources':sources,'counts':{'compiled_modules':10,'compiled_declarations':counts,'selected_modules':0,'replayed_modules':0,'printed_closures':0,'fully_accepted_modules':0,'builds':18,'successful_builds':10,'rejected_builds':8,'timeout_builds':0},
 'coverage_partition':{'compiled_only':sorted(sources),'selected':[],'replayed':[],'printed':[],'fully_accepted':[],'unbuilt_math':[],'selection_file_absent':True},
 'runs':runs,'versions':{k:[r['receipt']['path'] for r in v] for k,v in versions.items()},'objects':objects,'same_module_build_overlaps':sameoverlap,
 'current_artifacts':all_current,'archive_current_mismatch':archive_mismatch,'initial_checks':initial_checks,'initial_not_in_controller_before':not_before,'initial_before_conflicts':before_conflicts,
 'preservation_scope':{'initial_count':len(initial_map),'controller_before_count':len(before),'initial_excludes_objects':True,'own_files_in_initial_snapshot':[k for k in initial_map if '55cf20d2' in k or 'M55C' in k],'owned_exclusions':[],'current_input_mismatches':[r['relative_path'] for r in initial_checks if not r['matches']]},
 'prior_manifest_checks':prior,'wrapper_comparisons':wrapper_comparisons,'root_contract_binding':contract_binding,
 'historical171_reconciliation':{'saved':historical171,'raw_events_match':True,'raw_last_events_match':True,'qualification':'This inherited reconciliation concerns171 missing_or_malformed_report, not current183; neither host outcome is upgraded.'},
 'finite_output_bindings':finite,'generator_output_binding':generator_binding,'timing':timing,'initial_absence_observation':{'observed_at':datetime.now(timezone.utc).isoformat(),'paths':absence},
 'method_scope':{'retained_checker_not_executed_in183':True,'retained_axiom_wrapper_not_executed_in183':True,'finalizer_source_absent':True,'compiled_objects_not_fresh_kernel_replayed':True,'old_imports_reused':True},
 'checks':{'all_build_snapshot_hashes_match':True,'all_build_event_summaries_match':True,'all_compiled_final_sources_match_successful_snapshots':True,'all_six_saved_finite_objects_or_explicit_projection_match_literal_output':True,'all_initial_inputs_unchanged':not any(not r['matches'] for r in initial_checks),'prior_manifest_mismatches':[r for x in prior for r in x['mismatch']],'archive_mismatch_expected_zero_topsecondgap':True},
 'preparation_history':['First static pass stopped before evidence output on an incorrect expected compiler-command length7; the retained command has6 elements, now checked with exact -j/1/-o prefix. No project effect. Second static pass stopped before output because source experiment stdout omits only saved labels; parser now binds that exact projection, keeping all other five whole objects. Third pre-output stop corrected generator terms to the literal coefficient-list length, rather than a nonexistent terms key. Initial named directory enumeration and retained-byte inventory only; first metadata display used correct current_request count78. The helper is new for no-receipt partial183; no prior completed-worker status/schema retagged. Three guessed prior helper filenames were absent during T-only lookup; no project effect.'],
 'input_hashes':inputs,'final_static_stability':None,'final_absence_observation':None,'late_scope_observation':None,'project_reads_closed_utc':None}
OUT.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'path':str(OUT),'bytes':OUT.stat().st_size,'sha256':sha(OUT),'counts':out['counts'],'checks':out['checks'],'initial_not_before':not_before,'initial_before_conflicts':before_conflicts,'source_edit_overlaps':[(r['module'],r['source_file_changes_during_command']) for r in runs if r['source_file_changes_during_command']],'same_module_overlaps':sameoverlap,'retained_object_cas':sum(o['content_addressed_object'] is not None for o in objects)},indent=2))
