"""Closed168 audit-owned static parsing, hashes and finite index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000168';A=W/'artifacts';E=A/'evidence/markov-418bcc64'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'before.json');manifest=js(E/'manifest.json');v=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792201320610313000.json');axioms=js(E/'axioms-1792201345607986000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert set(selected)==set(v['compiled'])==set(v['successfully_replayed'])==set(replay['modules'])
base={'worker':168,'request':'418bcc643df14f6f8cfd3b6b16eb3aef','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed/return0/report,1633.0466740131378 seconds. Ten selected modules compiled,replayed,61 theorem closures printed. Two excluded candidate modules remain unvalidated. Root open.',
 'scope':'Closed168 archive and explicitly named inherited/current counterparts only. Static parsing, hashes, literal syntax comparison and domain-index counts. No project/compiler/checker/proof/replay/experiment/CAS/generator/finalizer execution or mathematical-value recomputation. No source edits/proposer contact/research help. Active169 and later excluded; prior seals/windows unchanged.'}
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel];return h
pat=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(src):
 matches=list(pat.finditer(src));decls=[];th=[];defs=[]
 for i,m in enumerate(matches):
  kind,name=m.groups();end=matches[i+1].start() if i+1<len(matches) else src.rfind('\nend')
  block=src[m.start():end].strip();decls.append({'kind':kind,'name':name})
  row={'kind':kind,'name':name,'header':block.split(':=',1)[0].rstrip(),
   'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)}
  (th if kind=='theorem' else defs).append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return decls,th,defs,bad
new=[];structure=[];excluded=[];excluded_structure=[];counts=Counter();excounts=Counter()
for module in selected+['MarkovAbsorbedBoundaryCertificateM418','MarkovAbsorbedBoundarySourceM418']:
 rel='research/'+module+'.lean';src=(A/rel).read_text();sh=binding(rel);decls,th,defs,bad=parse(src);assert not bad
 attempts=[(p,d) for p,d in builds if module in d.get('modules',{})]
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],
    'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),
    'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts]}
 if module in selected:
  successes=[(p,d) for p,d in attempts if d.get('returncode')==0 and d['modules']=={module:sh}]
  assert len(successes)==1 and sha(successes[0][0].with_suffix('.lean'))==sh
  op='evidence/markov-418bcc64/'+module+'.olean';oh=binding(op)
  assert sh==v['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
  assert oh==v['compiled'][module]['olean_sha256']
  assert all(x['name'] in axioms['declarations'] for x in th)
  row.update(status='selected_replayed_printed',selected=True,replayed_in168=True,printed_in168=True,
   object_path=op,object_sha256=oh,successful_build=str(successes[0][0].relative_to(A)))
  counts.update(x['kind'] for x in decls);new.append(row)
 else:
  assert module not in replay['modules'] and module not in axioms['sources']
  assert all(d.get('returncode')!=0 for p,d in attempts)
  row.update(status='timeout_only' if attempts else 'unbuilt',selected=False,replayed_in168=False,printed_in168=False,
   object_scope='No object credited; delegate records exact bounded absence observations. No historical absence extended by this helper.')
  excounts.update(x['kind'] for x in decls);excluded.append(row)
 record={**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad}
 (structure if module in selected else excluded_structure).append(record)
assert counts=={'theorem':61,'def':27} and excounts=={'theorem':16,'def':12}
assert len(axioms['declarations'])==61
prior=js(T/'markov_worker_000167_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed167_sha256':h,'initial168_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in168':False})
assert len(older)==len({x['path'] for x in older})==388
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],
  'whole_old_module_recovery_in168':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==179
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel='research/markov-418bcc64-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_418bcc64.py','correction_probe_418bcc64.py','correction_polynomials_418bcc64.py',
 'absorbed_probe_418bcc64.py','absorbed_clamped_probe_418bcc64.py','absorbed_q_probe_418bcc64.py',
 'absorbed_symbolic_probe_418bcc64.py','generate_correction_418bcc64.py','generate_boundary_418bcc64.py',
 'generate_boundary_source_418bcc64.py','run_boundary_418bcc64.py','run_boundary_linear_418bcc64.py','run_boundary_export_418bcc64.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,
  'executed_or_imported_by_auditor':False})
for name in ['absorbed_boundary_418bcc64.g','absorbed_boundary_linear_418bcc64.g','absorbed_boundary_export_418bcc64.g']:
 rel='research/'+name;scripts.append({'path':rel,'sha256':binding(rel),'language':'GAP','executed_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'executed_by_auditor':False,
  'scope':'Historical script identity; only named frame helper is a current experiment import. Prior generation/experimental statuses unchanged.'})
assert len(inherited_scripts)==16
record_names=['source-experiment.json','correction-probe.json','polynomial-probe.json','absorbed-probe.json',
 'absorbed-clamped-probe.json','absorbed-q-probe.json','absorbed-symbolic-probe.json','absorbed-boundary-gap.json',
 'absorbed-boundary-gap-1792200871008785000.json','absorbed-boundary-linear-1792200885028183000.json',
 'absorbed-boundary-export-1792200992845188000.json','boundary-export-console.json','boundary-generation.json']
data={name:js(E/name) for name in record_names}
for name in record_names:
 rel='evidence/markov-418bcc64/'+name;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
failed_g='evidence/markov-418bcc64/absorbed-boundary-failed.g'
records.append({'path':failed_g,'sha256':binding(failed_g),'bytes':(A/failed_g).stat().st_size})
assert sha(A/failed_g)==data['absorbed-boundary-gap.json']['source_sha256']
# Literal source-block comparison only. Original Column0 remains historically unbuilt.
old0=P/'.control/markov/workers/000161/artifacts/research/MarkovColumn0MAE9.lean'
assert sha(old0)==next(x['sha256'] for x in oldexcluded if x['module']=='MarkovColumn0MAE9')
old=old0.read_text().split('def column0MAE9',1)[1].split('theorem source_column0MAE9',1)[0]
old=('def column0MAE9'+old).replace('column0MAE9','columnZeroM418').replace('column_explicit0MAE9','column_zero_explicitM418')
current=(A/'research/MarkovCorrectionColumnsM418.lean').read_text().split('def columnZeroM418',1)[1].split('def correctionColumn2M418',1)[0]
assert re.sub(r'\s','',old)==re.sub(r'\s','','def columnZeroM418'+current)
column0={'original_module':'MarkovColumn0MAE9','original_status':'Historical unbuilt module; unchanged.',
 'new_module':'MarkovCorrectionColumnsM418','renamed_definition':'columnZeroM418','renamed_theorem':'column_zero_explicitM418',
 'literal_renaming_comparison_passed':True,'original_source_column0_theorem_ported':False,
 'qualification':'Only this definition/general identity is newly compiled/replayed/printed under new names. No whole old module recovery.'}
# Finite index counts only. No project function, coefficients, sign or symbolic degree evaluated.
source=Counter()
for q in range(1,65):
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+1;d=q-(2 if r else 1);source['source_cases']+=1
  if q>=2:
   source['formula_source_cases']+=1
   for i in range(n+7):
    source['coefficients']+=1;source['index_zero_region_positions']+=i<2 or i+j>n+2
  for i in range(n+5):
   source['triples']+=1
   source['polygon_triples']+=all(3*n<=n*k+3*j and k+j<=n+2 for k in [i,i+1,i+2])
   source['window_triples']+=q>=2 and 7<=i<=d+2
for key in ['coefficients','triples','polygon_triples','window_triples']:assert source[key]==data['source-experiment.json'][key]
assert source['index_zero_region_positions']==data['source-experiment.json']['zeros']==5040
correction=Counter()
for j in range(3,41):
 for d in [j-3,j-2]:
  for t in range(d+j+2):
   correction['triple_cases']+=1;correction['coefficient_slots']+=2*t+3
for j in range(3):
 for d in range(10):
  for _ in [4,8]:correction['small_j_triplet_cases']+=d+j+2
assert correction['coefficient_slots']==data['correction-probe.json']['checks']==180310
early=Counter()
for j in range(4,31):
 for d in [j-3,j-2]:
  for t in range(1,d):
   early['parameter_cases']+=1
   for h in range(t+2):early['cuts']+=1;early['coefficient_slots']+=2*t+1
assert early['coefficient_slots']==data['absorbed-probe.json']['checks']==226872
clamped=Counter()
for d in range(41):
 for _ in [False,True]:
  for t in range(d+3):
   clamped['parameter_cases']+=1;clamped['identities']+=3
   for h in range(t+3):clamped['cuts']+=1;clamped['coefficient_slots']+=2*t+3
assert clamped['coefficient_slots']==data['absorbed-clamped-probe.json']['checks']==1394328
assert clamped['identities']==data['absorbed-clamped-probe.json']['identities']==5658
qprobe=Counter()
for d in range(1,45):
 for j in [d+3,d+2]:
  for t in range(d):qprobe['parameter_cases']+=1;qprobe['coefficient_slots']+=2*j+1
assert qprobe['coefficient_slots']==data['absorbed-q-probe.json']['checks']==129360
symbolic=Counter()
for t in range(13):
 for _ in [False,True]:
  for h in range(t+1):symbolic['cut_cases']+=1;symbolic['gap_polynomials']+=2*t+3
assert symbolic['gap_polynomials']==data['absorbed-symbolic-probe.json']['gap_polynomials']==3458
poly_domain=[(i,r,shift) for i in range(2,21) for r in [False,True] for shift in [2,max(2,i if r else i-1)]]
assert poly_domain==[(x['i'],x['r'],x['shift']) for x in data['polynomial-probe.json']]
assert len(poly_domain)==76 and len(set(poly_domain))==73
# Parse retained GAP JSON stream only. Term-list lengths are counted; no algebra or coefficient comparison is performed.
export=data['absorbed-boundary-export-1792200992845188000.json'];console=data['boundary-export-console.json']
assert export==console
stream=export['stdout'].strip();decoder=json.JSONDecoder();rows=[]
while stream:
 row,stop=decoder.raw_decode(stream);rows.append(row);stream=stream[stop:].lstrip()
assert [(r[0],r[1],r[2]) for r in rows]==[(s,m,k) for s in [2,3] for m in [0,1] for k in [1,2,3]]
export_inventory=[{'s':r[0],'mode':r[1],'k':r[2],'numerator_literal_terms':len(r[3]),'denominator_literal_terms':len(r[4])} for r in rows]
linear_rows=re.findall(r's=(\d+) mode=(\d+) k=(\d+) terms=(\d+) negative=(\d+)',data['absorbed-boundary-linear-1792200885028183000.json']['stdout'])
assert len(linear_rows)==12
assert [(int(a),int(b),int(c),int(n)) for a,b,c,n,_ in linear_rows]==[(x['s'],x['mode'],x['k'],x['numerator_literal_terms']) for x in export_inventory]
assert all(x[-1]=='0' for x in linear_rows) # Retained reported counters only, not recomputed signs.
assert len(data['boundary-generation.json']['cases'])==12
assert data['absorbed-boundary-gap.json']['returncode']==0 and "Variable: 'Z' is read only" in data['absorbed-boundary-gap.json']['stderr']
# Bind complete retained experimental output where present; symbolic progress prefixes are separated.
events=[json.loads(line) for line in (W/'events.jsonl').read_text().splitlines()];event_bindings=[]
for name in record_names[:7]:
 expected=data[name];hits=[]
 for number,event in enumerate(events,1):
  item=event.get('item',{})
  if item.get('exit_code')!=0:continue
  out=item.get('aggregated_output','');candidates=[out]+out.splitlines()
  for candidate in candidates:
   try:parsed=json.loads(candidate)
   except (ValueError,TypeError):continue
   if parsed==expected:hits.append(number);break
 assert len(hits)==1,(name,hits)
 event_bindings.append({'record':name,'event':hits[0],'complete_JSON_matches':True,'progress_prefix_possible':name=='absorbed-symbolic-probe.json'})
waiting={'receipt_only_checks':[
 {'observed_utc':'2026-10-17T01:42:43.025447+00:00','status':'absent'},
 {'observed_utc':'2026-10-17T01:43:56.313814+00:00','status':'absent'},
 {'observed_utc':'2026-10-17T01:45:06.582460+00:00','status':'absent'},
 {'observed_utc':'2026-10-17T01:46:26.240340+00:00','status':'absent'},
 {'observed_utc':'2026-10-17T01:47:35.070186+00:00','status':'final'}],
 'wait_seconds':[18.8658,10.0218,58.0059,51.7713,58.0059],
 'requested_wait_milliseconds':[58000,10000,58000,58000,58000],
 'interrupted_wait_indices':[0,3],'cutoff_utc':'2026-10-17T02:00:04.529026+00:00',
 'correction':'Closure notice initially said five absent checks; corrected to four absent checks followed by fifth/final observation. No early read occurred.'}
times=[datetime.fromisoformat(x['observed_utc']) for x in waiting['receipt_only_checks']]
waiting['check_intervals_seconds']=[(b-a).total_seconds() for a,b in zip(times,times[1:])]
assert all(x>=60 for x in waiting['check_intervals_seconds']) and all(x<=59 for x in waiting['wait_seconds'])
residual={'root_open':True,'new_unconditional_raw_horizontal_region':True,
 'source_region':'All actual numerator-three q>=1,bothr,rowq+1,starting i<=6 or correctionExponent(q,r)+2<i; all natural zero tails. All starts whenq<=5.',
 'root_equivalence':'Conjecture63 iff FirstCorrectionWindowM418 and ThreeBeyondCorrectionM418 and OtherFourM9E2.',
 'all_three_residual_conjuncts_unproved':True,'AbsorbedMiddleM418_unproved':True,
 'boundary_h_equals_t_positivity_unproved':True,'boundary_certificate_two_timeouts':True,
 'boundary_source_candidate_unbuilt':True,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,
 'old161_column0_whole_module_recovery_claimed':False}
h={**base,'new_sources':new,'excluded_modules':excluded,'accepted_counts':dict(counts),'excluded_counts':dict(excounts),
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,
 'historical_operational_comparisons':operational,'documents':docs,'new_scripts':scripts,
 'inherited_scripts':inherited_scripts,'result_bindings':records,'imported_libraries':libs,
 'new_imported_libraries':[],'imported_four_functions':four,'column0_literal_comparison':column0,
 'residual_binding':residual,'receipt_waiting':waiting,'all_named_new_match_current':True,
 'read_scope_notes':['Only closed168 archive enumerated; exact named current/inherited files read.',
 'All ten selected theorem bodies read. Excluded Source candidate read; Certificate formulas/proof skeletons read with long numerator literals omitted from display and hash-bound, never evaluated.',
 'Old161 ColumnPolynomial/FirstCorrectionPolynomial/SmallHorizontal/Column0 exact sources read; older full source bridges retain sealed audits.',
 'One overlong display of GAP export was truncated; data subsequently parsed only to count saved term lists, without algebra or sign recomputation.',
 'No project scripts imported/executed; all finite counts below are domain-index counts or explicitly labeled saved reported counters.']}
s={**base,'new_modules':structure,'excluded_modules':excluded_structure,'accepted_counts':dict(counts),'excluded_counts':dict(excounts),
 'source_scope':residual['source_region'],
 'prefix_scope':'Exact raw columns2..8 foractualq>=2 encodedq=x+2; gap identities/nonnegative Horner forms for rationalx>=0; integer casts without renormalization. Columns0/1 actual zeros, q1 separately inherited small-row theorem. No strict positivity claim for every gap.',
 'tail_scope':'Binomial correction vanishes only at its support cutoff; remaining lift output may be nonzero. For arbitrary integerc,d<t+1 the augmented successor triple equals proved lift-output triple. Source starti=t+3>d+2; no sign premise on c is needed in tail.',
 'absorbed_scope':'Real kernel liftPoly(j,t)+C(c*((d-t:Nat):Real)/(t+1))*X^t. Natural subtraction clamps; denominator positive at all naturalt. choose(d,t)*extra=c*choose(d,t+1) and weighted evaluation=augmentedOutput(t+1), including outside binomial support. Coefficient nonnegativity assumesc>=0; conditional output transport assumes all lower-cut coefficient gaps, with any integerc.',
 'middle_scope':'AbsorbedMiddleforall naturald,t,h,k,bothr,4<=t<d,h<=t; j=d+3,c8 true orj=d+2,c4 false. Highcuts h>t and tailt>=d proved. No global sign premise discharged; it suffices for FirstCorrectionWindow and whole correctionrow, with other two root predicates still needed.',
 'boundary_scope':'At h=t exact polynomial gap=X^(2t)*(Cgap0+Cgap1X+Cgap2X²), allnaturald,j,t,realc. Conditional sign fromthree scalar signs; rational normalization needsj>=2 andintegerc. choose(t+j+3,j)>=j+1 proved. No general h=t positivity theorem accepted.',
 'pending_scope':'Certificate12defs/12theorem candidates twice timeout, finalfactoreddenominator; Source4theorem candidates unbuilt, casesd=t+2+g or d=t+1,t=v+4,s2/3. No compiler/replay/print credit. Generator/GAP positivity assertions not proof.',
 'obstruction_scope':'Weighted augmented j7,d4,c8 coefficientgap1=-2880; actualpaththreePath5true labels3/19, row7columns2,3,4 gives[8,2000,34302], threepolygon guards and positivegap3725584 formally checked. Auxiliary coefficientwise obstruction only, no raw/root refutation.',
 'root_scope':'FirstCorrectionWindowq>=2,bothr,7<=i<=d+2,rowq+1. ThreeBeyond Hq<j,j!=5,j!=q+1; V/D exactly prior MFEE exclusions; OtherFoura>=4GlobalLC unchanged. Endpoints/alreadydischarged families remain handled by inherited iff, not new open clauses.',
 'column0_literal_comparison':column0,'mathematical_values_recomputed':False}
f={**base,'source_experiment':{'counts':dict(source),'saved_record':data['source-experiment.json'],
 'domain':'q1..64bothr; all128source cases for triples, but coefficient identity/zero counters only126casesq2..64. i0..n+6,triples0..n+4. Zero positions from i<2 or i+j>n+2, no coefficient calculation.'},
 'correction_probe':{'counts':dict(correction),'saved_record':data['correction-probe.json'],
 'domain':'j3..40,d=j-3/c8 orj-2/c4,t0..d+j+1; fixedfullconvolution lengths. Separate smallj0..2,d0..9,c4/8. Saved failure arrays capped10/20, not total failure counts.'},
 'early_absorbed_probe':{'counts':dict(early),'saved_record':data['absorbed-probe.json'],
 'domain':'j4..30,d=j-3 orj-2,t1..d-1,h0..t+1; unclamped expression confined to its nonnegative-subtraction range. extra_failures is initialized but never populated; not a separate tested property.'},
 'clamped_probe':{'counts':dict(clamped),'saved_record':data['absorbed-clamped-probe.json'],
 'domain':'d0..40,t0..d+2,bothactualrelationsj=d+3/c8 orj=d+2/c4,allh0..t+2;3weightedidentities perparameter.'},
 'q_probe':{'counts':dict(qprobe),'saved_record':data['absorbed-q-probe.json'],
 'domain':'d1..44,bothj=d+3/d+2,t0..d-1,all2j+1gap slots. Reported1980negativeconstant entries not independently recalculated. Two saved negative arrays capped20. This is a pre-composition auxiliary kernel.'},
 'symbolic_probe':{'counts':dict(symbolic),'saved_record':data['absorbed-symbolic-probe.json'],
 'domain':'t0..12,two source relations,h0..t,remaining parameterG formal in d=t+2+G. Excludesd=t+1clamp boundary.',
 'coefficient_count_scope':'76804 is retained reported count from dynamically trimmed rational-polynomial lists; cannot recount it independently from index lengths without forbidden algebra. Only3458outergap slots recounted.'},
 'polynomial_probe':{'rows':76,'unique_parameter_rows':73,'duplicate_parameter_rows':3,'saved_record':data['polynomial-probe.json'],
 'domain':'i2..20,bothr,two shifts [2,max(2,i ifr elsei-1)]. Duplicate shifts retained. Degree/sign/constant flags are saved observations only, not recomputed.'},
 'gap_boundary_records':{'failed':data['absorbed-boundary-gap.json'],'weak_bound':data['absorbed-boundary-gap-1792200871008785000.json'],
 'linear_bound':data['absorbed-boundary-linear-1792200885028183000.json'],'export_literal_inventory':export_inventory,
 'export_stdout_console_identical':True,'generation':data['boundary-generation.json'],
 'scope':'12symboliccases=s2/3,mode0/1,k1..3. WeakB=Z+1 has reportednegativecoefficients; B=Z+j+1 reportednone. Exportterm-list counts match printed counts; no value, positivity, identity, factorization or denominator recomputation. Both Lean certificate attempts failed bytimeout.'},
 'event_bindings':event_bindings,'records':records,
 'runtime_limits':'Four numerical Python programs main-guarded; three absorbed probes top-level. Three generators andthree CAS wrappers top-level. All read only, never imported. Historical helper modules retain prior guarded-main audit. No mathematical program executed by auditor.',
 'mathematical_values_recomputed':False}
for suffix,obj in [('mathematical_source_hashes.json',h),('source_structure_audit.json',s),('finite_domain_audit.json',f)]:
 p=T/('markov_worker_000168_'+suffix);assert not p.exists();p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
