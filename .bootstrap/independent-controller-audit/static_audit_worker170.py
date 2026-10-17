"""Closed worker 170: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import ast, hashlib, json, re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000170';A=W/'artifacts';E=A/'evidence/markov-a646848d'
REQUEST='a646848db8dc4dffbca4cc335370b378'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'before.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792204580099926000.json');axioms=js(E/'axioms-1792204591268916000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':170,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed, return 0, delivered report; elapsed 1586.8477318286896 seconds. Twelve final mathematical modules compiled/replayed, 53 closures printed. First-correction horizontal row closed; full root remains open.',
 'scope':'Archive-first closed 170 and explicitly named inherited/current counterparts only. Static hashes, source/record parsing, literal syntax comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution or import, project edit or proposer help/contact. Active 171 and later excluded. Earlier seals/windows unchanged.'}
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel],rel;return h
pat=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(src):
 ms=list(pat.finditer(src));decls=[];th=[];defs=[]
 for i,m in enumerate(ms):
  kind,name=m.groups();end=ms[i+1].start() if i+1<len(ms) else src.rfind('\nend')
  block=src[m.start():end].strip();decls.append({'kind':kind,'name':name})
  row={'kind':kind,'name':name,'header':block.split(':=',1)[0].rstrip(),
   'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)}
  if kind!='theorem':row['definition_text']=block
  (th if kind=='theorem' else defs).append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return decls,th,defs,bad
new=[];structure=[];counts=Counter()
for module in selected:
 rel='research/'+module+'.lean';src=(A/rel).read_text();sh=binding(rel);decls,th,defs,bad=parse(src);assert not bad
 attempts=[(p,d) for p,d in builds if module in d.get('modules',{})]
 current_success=[(p,d) for p,d in attempts if d.get('returncode')==0 and d['modules']=={module:sh}]
 assert len(current_success)==1 and sha(current_success[0][0].with_suffix('.lean'))==sh
 op='evidence/markov-a646848d/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],
   'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),
   'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in170':True,'printed_in170':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(current_success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_ordinary_objects_not_separately_retained':module=='MarkovCorrectionClosedMA64'}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':53,'def':9} and len(axioms['declarations'])==53
prior=js(T/'markov_worker_000169_mathematical_source_hashes.json');older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed169_sha256':h,'initial170_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in170':False})
assert len(older)==len({x['path'] for x in older})==419
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],
  'whole_old_module_recovery_in170':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel='research/markov-a646848d-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_a646848d.py','margin_experiments_a646848d.py','run_source_experiment_a646848d.py',
 'generate_margin_a646848d.py','generate_border_margin_a646848d.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,
  'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'executed_by_auditor':False,
  'scope':'Historical script identity only. Current generators extract an explicit pure-definition slice from the named worker169 generator; the frame helper is an experiment dependency. Auditor imports/executes neither.'})
assert len(inherited_scripts)==41
record_names=['source-experiment.json','source-progress.json','source-run-1792204291853284000.json',
 'margin-experiments.json','first-margin-experiments.json','rerun-margin-experiments.json',
 'next-row-experiment.json','first-next-row-experiment.json','rerun-next-row-experiment.json','next-row-progress.json',
 'overrelaxed-next-margin.json','experiment-rerun.json','margin-generation.json','border-margin-generation.json','source-visit.json']
data={name:js(E/name) for name in record_names}
for name in record_names:
 rel='evidence/markov-a646848d/'+name;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
assert data['source-run-1792204291853284000.json']['source_sha256']==sha(A/'research/source_experiment_a646848d.py')
# Parse generated Horner syntax only. Do not evaluate expressions or regenerate any polynomial.
certificate_shapes=[]
for module,record in [('MarkovMarginCertificateMA64','margin-generation.json'),('MarkovBorderScalarMA64','border-margin-generation.json')]:
 src=(A/'research'/(module+'.lean')).read_text()
 if module=='MarkovMarginCertificateMA64':
  line=next(x for x in src.splitlines() if x.startswith(' let num : ℚ := '));expr=line.split(':=',1)[1].strip()
  den=next(x for x in src.splitlines() if x.startswith(' let den : ℚ := ')).split(':=',1)[1].strip()
  assert den=='(x+5)^2*(x+8)^2*(x+9)*(x+10)*(x+11)'
  assert all(f'have h{i} : x+{i}≠0 := by positivity' in src for i in [5,8,9,10,11])
  assert 'field_simp [h5,h8,h9,h10,h11]' in src and 'have hd : 0 < den' in src
 else:
  line=next(x for x in src.splitlines() if x.startswith(' have he : borderScalar'))
  expr=line.split('=',1)[1].rsplit(' := by',1)[0].strip();den=None
 assert re.fullmatch(r'[0-9xgz()+*/\s]+',expr)
 tree=ast.parse(expr,mode='eval');allowed=(ast.Expression,ast.BinOp,ast.Add,ast.Mult,ast.Div,ast.Name,ast.Load,ast.Constant)
 assert all(isinstance(node,allowed) for node in ast.walk(tree))
 assert all(node.id in ['x','g','z'] for node in ast.walk(tree) if isinstance(node,ast.Name))
 fractions=[]
 for node in ast.walk(tree):
  if isinstance(node,ast.BinOp) and isinstance(node.op,ast.Div):
   assert isinstance(node.left,ast.Constant) and isinstance(node.right,ast.Constant)
   numerator=ast.get_source_segment(expr,node.left);denominator=ast.get_source_segment(expr,node.right)
   assert re.fullmatch(r'\d+',numerator) and re.fullmatch(r'[1-9]\d*',denominator)
   fractions.append({'numerator_token':numerator,'denominator_token':denominator})
 plain=re.sub(r'\(\d+/\d+\)','R',expr);integer_tokens=[x for x in re.findall(r'\d+',plain) if x!='0']
 assert len(integer_tokens)+len(fractions)==data[record]['terms']
 certificate_shapes.append({'module':module,'source_sha256':sha(A/'research'/(module+'.lean')),
  'generated_line_sha256':hashlib.sha256(line.encode()).hexdigest(),'expression_characters':len(expr),
  'grammar':'Unsigned numeral tokens, literal unsigned fractions with nonzero literal denominator, x/g/z, addition, multiplication and parentheses. Parsed without evaluation.',
  'integer_literal_count':len(integer_tokens),'rational_literal_count':len(fractions),
  'coefficient_literal_count':len(integer_tokens)+len(fractions),'saved_term_count':data[record]['terms'],
  'denominator_tokens':sorted(set(x['denominator_token'] for x in fractions)),
  'saved_degree_only':data[record]['degrees'],'saved_negative_only':data[record]['negative'],
  'outer_denominator_text':den,'long_literal_omitted_from_display':len(line)>900,'mathematical_values_recomputed':False})
# Source index domains only. The first-row support mask is not extrapolated to exceptional next-row cases.
source=Counter();qs=data['source-experiment.json']['q_values'];assert qs==[1,2,3,4,6,9,16,24,40,64]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+1;d=q-(2 if r else 1);source['source_cases']+=1;source['visited_coefficient_positions']+=n+7
  if q>=2:
   source['formula_source_cases']+=1
   for i in range(n+7):source['coefficients']+=1;source['index_zero_region_positions']+=i<2 or i+j>n+2
  for i in range(n+5):
   source['triples']+=1
   source['polygon_triples']+=all(3*n<=n*k+3*j and k+j<=n+2 for k in [i,i+1,i+2])
   source['window_triples']+=q>=2 and 7<=i<=d+2
for k in ['coefficients','triples','polygon_triples','window_triples']:assert source[k]==data['source-experiment.json'][k]
assert source['index_zero_region_positions']==data['source-experiment.json']['zeros']==462
margin=Counter()
for j in range(7,41):
 for t in range(4,j-2):
  margin['parameter_cases']+=1;margin['scalar_checks']+=2
  for h in range(t+1):margin['quantitative_border_checks']+=1
for k in ['scalar_checks','quantitative_border_checks']:assert margin[k]==data['margin-experiments.json'][k]
nxt=Counter();nextqs=data['next-row-experiment.json']['q_values'];assert nextqs==[1,2,3,4,5,6,8,12,20,32]
for q in nextqs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+2;d=q-(4 if r else 3);nxt['source_cases']+=1
  nxt['source_coefficients']+=n+7;nxt['source_triples']+=n+5
  if d<0:nxt['excluded_negative_exponent_cases']+=1;continue
  nxt['formula_source_cases']+=1;nxt['formula_checks']+=n+7
  for t in range(4,d+1):nxt['scalar_checks']+=2
for k in ['source_coefficients','source_triples','formula_checks','scalar_checks']:assert nxt[k]==data['next-row-experiment.json'][k]
for prefix in ['source','next-row']:
 assert data[prefix+'-progress.json']=={k:v for k,v in data[prefix+'-experiment.json'].items() if k!='seconds'}
run=data['source-run-1792204291853284000.json'];lines=run['stdout'].splitlines()
assert run['returncode']==0 and run['stderr']=='' and lines[:-1]==['completed q '+str(q) for q in qs]
assert json.loads(lines[-1])==data['source-experiment.json']
for prefix in ['margin-experiments','next-row-experiment']:
 assert data[prefix+'.json']==data['rerun-'+prefix+'.json']
 assert {k:v for k,v in data[prefix+'.json'].items() if k!='seconds'}=={k:v for k,v in data['first-'+prefix+'.json'].items() if k!='seconds'}
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()];event_bindings=[]
for name in ['first-margin-experiments.json','first-next-row-experiment.json','margin-experiments.json','next-row-experiment.json',
 'margin-generation.json','border-margin-generation.json','overrelaxed-next-margin.json']:
 expected=data[name];hits=[]
 for n,event in enumerate(events,1):
  item=event.get('item',{})
  if item.get('exit_code')!=0:continue
  raw=item.get('aggregated_output','')
  for candidate in [raw]+raw.splitlines():
   try:parsed=json.loads(candidate)
   except (ValueError,TypeError):
    try:parsed=ast.literal_eval(candidate)
    except (ValueError,SyntaxError,TypeError):continue
   if parsed==expected:hits.append(n);break
 event_bindings.append({'record':name,'exact_saved_JSON_or_literal_output_events':hits,
  'scope':'Static equality of retained event output and saved object only; a missing direct whole-object match does not create invocation authentication.'})
assert next(x for x in event_bindings if x['record']=='first-margin-experiments.json')['exact_saved_JSON_or_literal_output_events']==[202]
assert next(x for x in event_bindings if x['record']=='first-next-row-experiment.json')['exact_saved_JSON_or_literal_output_events']==[202]
assert 207 in next(x for x in event_bindings if x['record']=='margin-experiments.json')['exact_saved_JSON_or_literal_output_events']
assert 207 in next(x for x in event_bindings if x['record']=='next-row-experiment.json')['exact_saved_JSON_or_literal_output_events']
assert json.loads(events[175]['item']['aggregated_output'])=={k:(v[:200] if k=='stdout' else v) for k,v in run.items()}
assert ast.literal_eval(events[187]['item']['aggregated_output'])==data['source-experiment.json']
event_bindings.append({'record':'source-run-1792204291853284000.json','wrapper_event':176,'stdout_prefix_characters':200,
 'complete_result_event':188,'complete_result_output_format':'Python literal, parsed without execution','full_receipt_retained':True,'source_sha256_sampled_after_run':True})
watch=js(T/'markov_worker_000170_receipt_watch.json');checks=watch['receipt_only_checks']
assert len(checks)==8 and len([x for x in checks if x['status']=='absent'])==7 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json') and all(x['interval_seconds']>=60 for x in checks[1:])
assert all(x['requested_ms']<=59000 for x in watch['waits'])
residual={'root_open':True,'FirstCorrectionWindowM418_proved':True,'AbsorbedMiddleM418_proved':True,
 'AbsorbedUncutMF8F_proved':True,'AbsorbedBorderMarginMF8F_proved':True,
 'BorderDominanceMF8F_unproved':True,'BorderDominance_used_as_premise':False,
 'new_unconditional_raw_LC_region':True,'actual_a3_H_range':'All natural i,j, actual frame numerator a=3, 3*j<=b+3. Both q>=1 residue families, equivalently j<=q+1; zeros and small parameters retained.',
 'general_auxiliary_range':'Natural d,j,t,h,k; 4<=t<d, d+2<=j, h<=t; real 0<=c<=8; every coefficient k.',
 'root_equivalence':'Conjecture63 iff ThreeBeyondCorrectionM418 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondCorrectionM418','OtherFourM9E2'],
 'next_row_formula_unproved':True,'next_row_universal_LC_claimed':False,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'certificate_literal_comparisons':certificate_shapes,'residual_binding':residual,'receipt_waiting':watch,
 'all_named_new_match_current':True,
 'read_scope_notes':['All twelve final mathematical sources and proof bodies read, except two long generated expressions parsed structurally and hash-bound.',
 'Current five generator/experiment/wrapper scripts read without import or execution; older scripts pinned only.',
 '398 explicitly named older source paths from the sealed169 support were searched with rg to locate exact accepted bridge statements. No active/later paths were included.',
 'Only closed170 archive was enumerated by this helper; current reads use explicit archive or inherited pins. Cache discovery/retention belongs to the independent validation review.',
 'Primary source-visit record retained as worker evidence; no new literature access or fresh source-homogeneity proof.',
 'Root-authorized storage COW maintenance changed only identical retained164–168 copies after their seals; operation/postcheck committed797199f72af630b9987e06f641c569de5ca59f2e. Bytes and recorded metadata preserved; inode changes are operational provenance only.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'mathematical_values_recomputed':False,'source_level_scope':residual,
 'literal_raw_indices':['(i,j)','(i+1,j)','(i+2,j)'],'residue_map':{'true':'b=3*q+1','false':'b=3*q+2'},
 'source_bridge':'source_three_rawM9E2 -> inherited first-correction weighted output and window equivalence -> first_correction_closedMA64 -> lower_and_first_correctionMA64 -> source_lower_first_pathMA64',
 'zero_and_endpoint_handling':['q=1 uses inherited small-source theorem; q>=2 factorization is not extrapolated to q=1.',
 'i<=6 and tail i>d+2 handled by inherited source results; former remaining7<=i<=d+2 is now proved without a sign premise.',
 'Natural correction d-(t+s) is clamped before casting; c in[0,8] and positive t+1 denominators explicit.',
 'General middle result retains h<=t; inherited tail and h>t lemmas complete all-cut transport.',
 'Quantitative finite-sum transport retains zero pair denominators with nonpositive signed terms; generic N is arbitrary real, M>=0.',
 'Strict cancellation is only by kernelScale>0, proved from a fixed auxiliary coefficient; no raw zero coefficient is divided out.',
 'Root polygon, three memberships, endpoint/path clauses and original coefficients unchanged; no normalization of final raw LC.'],
 'proof_chain':['Nonnegative Q coefficients and binomial composition upper/lower bounds.',
 'Complete gap top coefficient supplies quantitative lower bound; two generated rational scalar certificates have ordinary Lean ring/positivity proofs.',
 'First scalar margin controls arbitrary nonnegative central constant and bounded nonnegative endpoint constants.',
 'Reflection/common-shift and above-border cut comparison preserve coefficient indices and zeros.',
 'Quantitative PairOrder transport uses inherited zero-safe finite-sum theorem; order terms cancel algebraically without new normalized-order premise.',
 'Exact kernel step bound plus second scalar margin gives the border. All source correction cuts then close, without BorderDominance.'],
 'remaining_root_clauses':{'horizontal':'q<j, j!=5, j!=q+1, every natural starting i.',
 'vertical':'All natural i,j outside ((i=3 or4) and j+1<=q) or (5<=i<=8 and j+2<=q).',
 'diagonal':'All natural i,j outside 3<=i<=6 and j+2<=q; literal points(i,j+2),(i+1,j+1),(i+2,j).',
 'other_sources':'Every actual path with numerator>=4 retains GlobalLC18.'},
 'certificate_syntax':certificate_shapes,
 'version_limit':'Final CorrectionClosed source is distinct from two earlier successful versions. Earlier replay/prints bind earlier sources only; no separately retained old ordinary object is assumed.'}
F={**base,'mathematical_values_recomputed':False,
 'audit_parser_preflight':'Initial audit helper expected JSON at event188 and stopped before writing supports. The retained output is a Python dictionary literal; corrected to safe literal parsing, without project execution or experiment rerun.',
 'source_experiment':{'q_values':qs,'counts':dict(source),'saved_result':data['source-experiment.json'],
  'ranges':'20 source cases, i=0..n+6 visited; formula q>=2 only (18 cases), starts0..n+4. Polygon guards retained separately.',
  'zero_scope':'462 formula-domain zero positions recounted from established first-row index support; no coefficient evaluated.',
  'progress_matches_final_except_seconds':True,'complete_stdout_matches_result':True},
 'margin_probe':{'j_range':[7,40],'t_range':'4<=t<=j-3','h_range':'0<=h<=t','counts':dict(margin),
  'saved_result':data['margin-experiments.json'],'q_shortcuts':'Four constant-perturbed Q diagnostic cases only; reported negative coefficient lists are auxiliary failures, not source failures.'},
 'next_row_probe':{'q_values':nextqs,'counts':dict(nxt),'saved_result':data['next-row-experiment.json'],
  'formula_domain':'false q>=3,d=q-3,c0=24,c1=4q; true q>=4,d=q-4,c0=36,c1=8q-8. Five negative-exponent source cases excluded from formula comparison.',
  'zero_count_saved_only':345,'zero_count_independently_recomputed':False,
  'zero_scope':'Do not apply the first-row i<2 mask to all exceptional next-row cases. Source zeros are reported value counts only, not independently evaluated.',
  'mixed_example_limit':8,'source_formula_and_uniform_LC_unproved':True,
  'actual_3_over_14_witness':'Saved q=4,false,i=2,j=6 lower[0,1092,9918], correction[24,40,16], mixed gap-150672, raw[24,1132,9934]; finite record only, not numerically recomputed or a Lean refutation.',
  'progress_matches_final_except_seconds':True},
 'experiment_rerun':{'record':data['experiment-rerun.json'],'original_margin':data['first-margin-experiments.json'],
  'original_next':data['first-next-row-experiment.json'],'rerun_values_except_seconds_identical':True,
  'scope':'Importing the current margin script executes both top-level experiments. Worker rerun outputs are separately retained; auditor imported/executed neither. Counts are not doubled into expanded domains.'},
 'overrelaxed_next_margin':{'saved_record':data['overrelaxed-next-margin.json'],'literal_case_count':len(data['overrelaxed-next-margin.json']['cases']),
  'scope':'Four finite parameter cases of a sufficient over-relaxed bound; no formal source identity or source LC refutation.'},
 'generation':{'literal_certificate_shapes':certificate_shapes,'records':[data['margin-generation.json'],data['border-margin-generation.json']],
  'scope':'Structural literal counts only; reported nonnegative counts/degrees not independently calculated. Generators are proposals, final ordinary Lean receipts supply proof credit.'},
 'event_bindings':event_bindings,
 'runtime_limits':{'source_wrapper_timeout_seconds':240,'saved_source_outer_seconds':run['seconds'],
  'scope':'Wrapper samples source hash after completion; event176 prints200 stdout characters. Complete receipt and event188 retain the result. No independent experiment rerun.'}}
for suffix,out in [('mathematical_source_hashes.json',H),('source_structure_audit.json',S),('finite_domain_audit.json',F)]:
 p=T/('markov_worker_000170_'+suffix);assert not p.exists(),p
 p.write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n');print(p.name,p.stat().st_size,sha(p))
