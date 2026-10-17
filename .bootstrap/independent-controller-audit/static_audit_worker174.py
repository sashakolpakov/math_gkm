"""Closed worker174: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000174';A=W/'artifacts';E=A/'evidence/markov-831d426f'
REQUEST='831d426f49894488b2803a879f0bf56a'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792210973832355000.json');axioms=js(E/'axioms-1792210983290374000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':174,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1597.433841228485. Eleven mathematical modules compiled and jointly replayed,67 theorem closures printed. Full root open.',
 'scope':'Archive-first closed174 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active175 and later excluded. Earlier seals/windows unchanged.'}
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel],rel;return h
pat=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(src):
 ms=list(pat.finditer(src));decls=[];th=[];defs=[]
 for i,m in enumerate(ms):
  kind,name=m.groups();end=ms[i+1].start() if i+1<len(ms) else src.rfind('\nend')
  block=src[m.start():end].strip();decls.append({'kind':kind,'name':name})
  if kind=='theorem':
   depth=0;delimiter=None
   for pos,ch in enumerate(block):
    if ch in '([{':depth+=1
    elif ch in ')]}':depth-=1
    elif depth==0 and block[pos:pos+2]==':=':
     line=block[block.rfind('\n',0,pos)+1:pos].strip()
     if line.startswith('let '):continue
     delimiter=pos;break
   assert delimiter is not None,name
   header=block[:delimiter].rstrip()
   if name=='source_band_lc_budgetM831':assert 'let B :' in header and 'let U :=' in header and 'threeRawM9E2 q r (s+4)' in header
   if name=='source_boundary_coeffM831':assert 'let q :=' in header and 'if 2 ≤ i then' in header
  else:header=block.split(':=',1)[0].rstrip()
  row={'kind':kind,'name':name,'header':header,'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)}
  if kind!='theorem':row['definition_text']=block
  (th if kind=='theorem' else defs).append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return decls,th,defs,bad
new=[];structure=[];counts=Counter()
for module in selected:
 rel='research/'+module+'.lean';src=(A/rel).read_text();sh=binding(rel);decls,th,defs,bad=parse(src);assert not bad
 attempts=[(p,d) for p,d in builds if module in d.get('modules',{})]
 success=[(p,d) for p,d in attempts if d.get('returncode')==0 and d['modules']=={module:sh}]
 assert len(success)==1 and sha(success[0][0].with_suffix('.lean'))==sh
 op='evidence/markov-831d426f/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in174':True,'printed_in174':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':False}
 assert len(row['historical_successful_source_versions'])==1
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':67,'def':12} and len(axioms['declarations'])==67
prior=js(T/'markov_worker_000173_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed173_sha256':h,'initial174_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in174':False})
assert len(older)==len({x['path'] for x in older})==491
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in174':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','checkpoint-3','correspondence','mathematics','next','operational','validation']:
 rel='research/markov-831d426f-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_831d426f.py','boundary_positive_probe_831d426f.py','boundary_ratio_certificate_831d426f.py','band_roots_probe_831d426f.py','augmented_residual_probe_831d426f.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 else:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'manifest_only_when_not_initial':rel not in before,'executed_by_auditor':False,'scope':'Historical script identity only. Explicit source_experiment_9647c1ba, three_probe_9e205206 and band_experiment_139fed75 are direct new experiment dependencies. Non-.py suffixes absent initial filtered map remain exact historical/manifest matches. No import or execution.'})
assert len(inherited_scripts)==63
record_names=['source-experiment.json','source-progress.json','positive-boundary-probe.json','boundary-ratio-candidate.json','roots-probe.json','augmented-residual-probe.json','source-visit.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-831d426f/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})

# Only finite index-domain counts; no mathematical coefficients, signs or gaps.
source=Counter();domains=[];qs=data['source-experiment.json']['q_values']
assert qs==list(range(2,21))+[24,32,50,73]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['source_cases']+=1
  for k in range((q-(2 if r else 1))//2+1):
   j=q+k+1;d=n-2*j-1;assert d>=0
   source['rows']+=1;source['source_coefficients']+=n+6;source['raw_triples']+=n+4
   source['positive_sum_comparisons_if_full_length']+=k+1;source['factor_adjacent']+=max(k-1,0)
   for i in range(n+4):source['polygon_triples']+=all(3*n<=n*x+3*j and x+j<=n+2 for x in range(i,i+3))
   domains.append({'q':q,'r':r,'k':k,'j':j,'d':d,'coefficient_positions':n+6,'triple_positions':n+4})
for key in ['rows','source_coefficients','raw_triples','polygon_triples','factor_adjacent']:assert source[key]==data['source-experiment.json'][key]
assert source['positive_sum_comparisons_if_full_length']==data['source-experiment.json']['positive_sum_comparisons']
assert data['source-progress.json']=={k:v for k,v in data['source-experiment.json'].items() if k!='seconds'}
boundary=Counter()
for k in range(61):
 for r in [False,True]:boundary['rows']+=1;boundary['boundary_and_equivalence_positions']+=k+1
for r in [False,True]:
 for d in range(13):
  for k in range(17):boundary['convolution_rows']+=1
bdata=data['positive-boundary-probe.json']
assert boundary['boundary_and_equivalence_positions']==bdata['boundary_checks']==bdata['formula_equivalence_checks']==3782
assert boundary['convolution_rows']==bdata['convolution_checks']==442 and len(bdata['lambda_prefix'])==7
ratio=data['boundary-ratio-candidate.json'];assert len(ratio)==2 and [len(x['terms']) for x in ratio]==[30,30]
assert [len(x['lean']) for x in ratio]==[418,428]
roots=data['roots-probe.json'];root_tests=Counter()
for k in range(1,17):
 for d in [0,1,2,5,20]:
  for r in [False,True]:root_tests['rows']+=1
assert root_tests['rows']==roots['tests']==160
aug=data['augmented-residual-probe.json'];assert aug['d_values']==list(range(25))+[50,100] and aug['k_bound']==40
aug_count=Counter()
for d in aug['d_values']:
 for k in range(41):
  for r in [False,True]:
   q=d+2*k+(2 if r else 1);j=q+k+1
   aug_count['rows']+=1;aug_count['adjacent_positions']+=j
   aug_count['Q_adjacent_positions']+=max(k-1,0);aug_count['H_adjacent_positions']+=j-1
   aug_count['source_q_at_least2_rows']+=q>=2;aug_count['auxiliary_q1_rows']+=q==1
assert aug_count['rows']==aug['rows']==2214 and aug_count['adjacent_positions']==aug['adjacent_checks']==175275
assert len(aug['mixed_examples'])==5
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()]
event_bindings=[]
for n,name in enumerate(record_names):
 matches=[]
 for idx,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output')
  if not isinstance(out,str):continue
  try:parsed=json.loads(out)
  except (ValueError,TypeError):continue
  if parsed==data[name]:matches.append({'event':idx,'returncode':item.get('exit_code'),'projection':'full'})
 event_bindings.append({'record':name,'exact_json_output_matches':matches})
for idx,name,projection in [(81,'positive-boundary-probe.json','without_lambda_prefix'),(157,'boundary-ratio-candidate.json','r_and_negative_only')]:
 expected={k:v for k,v in data[name].items() if k!='lambda_prefix'} if projection=='without_lambda_prefix' else [{'r':row['r'],'negative':row['negative']} for row in data[name]]
 assert json.loads(events[idx-1]['item']['aggregated_output'])==expected
 assert events[idx-1]['item']['exit_code']==0
 event_bindings.append({'record':name,'event':idx,'projection':projection,'returncode':0})
watch=js(T/'markov_worker_000174_receipt_watch.json');checks=watch['checks']
assert len(checks)==8 and sum(x['status']=='absent' for x in checks)==7 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json')
for a,b in zip(checks,checks[1:]):assert b['observed_epoch']-a['observed_epoch']>=60
assert all(x['requested_ms']<=59000 for x in watch['waits'])
residual={'root_open':True,'new_unconditional_raw_LC_region':False,
 'actual_source_formula':'Actual numerator-three source classification q>=1,r; new source identities retain q>=2,k>=0,j=q+k+1 and literal2*j+1<=b. b=3*q+1 fortrue,3*q+2 forfalse.',
 'q1_new_source_formula':False,'negative_exponent_region_new_source_formula':False,
 'band_parameterization':'a=2(true),1(false); bweight=3-a. q=d+2*k+a; P(d,k,r)=Q(q,r,k). Source exponent d=b-2j-1 is guarded.',
 'boundary_formula_now_proved':True,'boundary_nonnegativity_now_proved':True,
 'full_band_Q_nonnegative':'Every natural d,k,i,r P(d,k,r).coeff i>=0; positive exactly0<=i<=k in integer CoeffSeq, zero outside. Hence every band-guarded Q is nonnegative with support0..k.',
 'full_band_Q_CrossLC_proved':False,'boundary_d0_Q_CrossLC_proved':True,
 'positive_sum':'P=4*(a*doublePrefix(diagonalFib,k+1)+bweight*doublePrefix(diagonalFib,k)); finite polynomial theorem. Expanded single coefficient-sum display is prose expansion, not a separately named theorem.',
 'conditional_budget_LC':'Old Q nonnegativity premise discharged, but s<=j,c>=0,all coefficient budgets and explicit scalar margin remain.',
 'augmented_factor':'R=Q+X*rowH(b,j); bandRow=X^2*(X+1)^d*R. Nonnegative with positive coefficients through j+1=q+k+2 and zero beyond; source identity q>=2 plus band guard.',
 'augmented_CrossLC_proved':False,'conditional_augmented_LC':'Assumed CrossLC of augmented R gives allnatural rawhorizontal starts, includingzero tails. No hidden proof of this premise.',
 'auxiliary_obstruction':'P(0,2,false)=72+96X+40X^2, positive at every real argument, yet its coefficient adjacent gap is positive. Obstructs a proposed real-rooted certificate, not source/root LC.',
 'root_equivalence':'Conjecture63 iff ThreeBeyondThirdM964 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondThirdM964','OtherFourM9E2'],
 'inherited_actual_a3_H':'All natural starts/zeros with3*j<=b+9; not enlarged universally here.',
 'residual_H':'q<j,j!=5,j!=q+1,j!=q+2,j!=q+3,all natural i.',
 'residual_V':'Outside the union of ((i=3 or4) and j+1<=q) and (5<=i<=8 and j+2<=q).',
 'residual_D':'Outside3<=i<=6 andj+2<=q; indices(i,j+2),(i+1,j+1),(i+2,j).',
 'new_vertical_or_diagonal_region':False,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False,
 'prior171_host_outcome_unchanged':'missing_or_malformed_report / return1 / reportnull; not timeout or completed.',
 'prior173_boundary_status_unchanged':'Boundary formula/positivity were unproved at173 cutoff;174 supplies new proofs without rewriting173 history.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'residual_binding':residual,'receipt_waiting':watch,'all_named_new_match_current':True,
 'read_scope_notes':['All11 final mathematical source files and proof bodies read; five experiment scripts statically read/AST parsed, never executed or imported.',
 'Explicit inherited archived160 PositiveRows/DiagonalRows read; older source pins extend previously named sets only. No broad current source enumeration.',
 '491 older mathematical source hash comparisons,181 historical pending/other pins,63 older scripts,2 operational source pins and16 external source/object pairs; inherited compiled-import limits unchanged.',
 'Finite index-domain counts only; no coefficient, binomial, polynomial, sign, root, gap or certificate value recomputation.',
 'One display accidentally printed all21142 keys from the archived initial input map; these are historical metadata names, not active/current file enumeration or content reads. Output was truncated; no completeness claim for that display.',
 'Audit helper initial text substitution changed sha256 to sha267 and request56 to67; corrected by source inspection before execution/output generation. No project edit/check.',
 'First static run stopped before outputs on a term-proof header; second stopped before outputs on an inherited .g path absent from the filtered initial map. Balanced top-level assignment parsing and sealed173+manifest binding correct both audit assumptions.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,
 'source_level_scope':residual,'literal_raw_indices':['(i,j)','(i+1,j)','(i+2,j)'],
 'budget_raw_indices':['(s+3,j)','(s+4,j)','(s+5,j)'],'residue_map':{'true':'b=3*q+1,a=2,bweight=1','false':'b=3*q+2,a=1,bweight=2'},
 'zero_and_endpoint_handling':['Fib closed coefficient alln,j,m retains literal natural n-j-1; no replacement by algebraically simplified expression without guard.',
 'Fcoeff positive iffm<=j; integer sequence zero atnegative indices. Q coefficient support is0..k; tails and internal positivity are formally established this round.',
 'Actual source factorization retainsq>=2 and2j+1<=b; natural exponent subtraction is valid only under this guard. Auxiliaryq1,false,d0,k0 does not extend actual source theorem.',
 'Boundary allm formula includesm>k zero tails. Cleared factor2m+3 positive; ratio denominators positive onlyinrange0<=m<=k; adjacentoff-support cases handled separately.',
 'Source boundary correction is if2<=i thenboundaryBinomial(k,i-2) else0; natural underflow cannot aliasi0/1 withconstant term.',
 'Augmented factorization and conditional CrossLC transport retain allnaturalstarts includingleadingzeros andzerotails. Rootpolygon guards andall3directions unchanged.'],
 'proof_chain_details':{
 'fib':'Finite Vandermonde and choose_split prove exactproduct coefficient; offsupport usesdegree/choose zero. Adjacent LC of two binomialsequences and intervalsupport yield CrossLC.',
 'shift':'Extended Fibshift usesn>=j+1; Qshift q>=k+1. Inherited generic row_diagonal_operator plus signedQrecurrence gives second-difference4G, an exact identity.',
 'positive':'Gcoeff nonnegative, initialP0constant4/8, initialdifference nonnegative. Induction givesPnonnegative andmonotoneink; oldboundary-to-all reduction thenmonotoneind. Strictpositivei<=k plusoldtail closes support.',
 'sum':'TwoStep induction withinitialpolynomials anddiagonalsecond-difference provesdoublePrefix formula. Atboundaryd0, weightedchoose evaluatesprefix; central_double relatesbinomial coefficients. Both formerBoundaryFormula props nowdischarged.',
 'boundaryLC':'Exact rationalratio steps, denominatorpositivity, ring_nf/positivity at k=m+t+2; ratio_cross givesin-supportadjacency, zero tailhandlesremainingcases; exactcasts andintervalsupport giveCrossLC.',
 'source':'Inherited actual numerator-three sourceclassification andbandrowfactorization; coefficientnonnegative correction givesraw>=lower. Budgettheorem merelyremoves oldhQnonnegative premise.',
 'residual':'R=Q+X*rowH withnonnegativepieces; shifted rowH fills0..j+1 andQfillsconstant. Productidentity followslowerRowfactorization, polynomialring andexactcasts. CrossLC ofR remainsassumed.',
 'obstruction':'Ordinary Lean proves exactauxquadratic, forallreal positiveevaluation andpositivecoefficientgap. No actualrawsource counterexample ornew sourcewitness theorem.',
 'root':'No newroot residualtheorem orunconditionalrawLCregion. Same exactrootiff inherited.'}}
F={**base,'mathematical_values_recomputed':False,
 'source_experiment':{'script':py_names[0],'q_values':qs,'counts':dict(source),'index_domains':domains,'saved_result':data['source-experiment.json'],
  'zero_count_saved_only':17509,'zero_count_independently_recomputed':False,
  'qualification':'46 source families,388 rows,39809 coefficient positions,39033 raw starts,21524 polygon triples and2541 factoradjacent domains counted.3271positive-sum comparisons assumesoldQ listlengthk+1: code useszip withoutlengthassert; no value-dependent length recomputation. Formal support theorem separate. No-failure and17509zeros savedonly.'},
 'boundary':{'counts':dict(boundary),'saved_result':bdata,'qualification':'k0..60,bothresidues,m0..k:3782 boundary/formula comparisons.2*13*17=442 convolutionrows. Exploratorylambda seriestruncatedat16 with7 prefixes saved; no formalseriesbridge inferred.'},
 'ratio_candidate':{'saved_result':ratio,'term_counts':[30,30],'qualification':'Static term-list lengths andLean-string lengths only. No coefficient signs/symbolicexpansion recomputed. Accepted formalratio proof usesring_nf/positivity, not thisliteral generated list.'},
 'roots':{'counts':dict(root_tests),'saved_result':roots,'recorded_nonreal_count':len(roots['nonreal']),'recorded_repeated_count':len(roots['repeated']),
  'qualification':'160indexcases k1..16,d0/1/2/5/20,bothresidues. Exact rationalSturm diagnostic reported126nonreal and0repeated; lists countedonly, root/sign classifications not rerun. FullJSONparsed; prior display wastruncated.'},
 'augmented':{'counts':dict(aug_count),'saved_result':aug,
  'qualification':'2214 auxiliaryrows,175275 adjacentindices; oneq1false row outsideq>=2 sourcebridge.46494mixedfailures and5examples are savedresults; augmented/Q/H failurelists capfirst10badrows andsavedempty. No signs/gaps recalculated; mixedfailure isnot rawLCfailure.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'saved_script_versions':[],
 'source_visit':{'record':data['source-visit.json'],'qualification':'Saved consultationmetadata only; no independentwebsearch ornoveltyclaim.'},
 'invocation_limits':['Five finalscripts retained; source/boundary-positive main-guarded,ratio/roots/augmentedtop-level. Notimported/executed.',
 'Finalscript hashes andsavedcommand/outputbindings, not atomic runtime-bodyattestation. No timed experimentwrapper orfresh rerun.',
 'Directhistorical imports identifiedstatically; no importexecution. Zero/sign/failurecounts evidence-only.']}
for name,obj in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 p=T/('markov_worker_000174_'+name+'.json');p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
print(json.dumps({'counts':dict(counts),'older':len(older),'source':dict(source),'boundary':dict(boundary),'augmented':dict(aug_count),'event_bindings':event_bindings}))
