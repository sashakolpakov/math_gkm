"""Closed worker172: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import ast, hashlib, json, re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000172';A=W/'artifacts';E=A/'evidence/markov-9647c1ba'
REQUEST='9647c1ba01484705bdaa6edb4d3c7d32'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'before.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792207634996263000.json');axioms=js(E/'axioms-1792207654020128000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':172,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome, return0, structured report present, elapsed1326.2065389156342 seconds. Thirty final mathematical modules compiled/replayed and82 closures printed. Universal third-correction horizontal row closed; full root open.',
 'scope':'Archive-first closed172 and explicitly named inherited/current counterparts only. Static hashes, source/record parsing, literal syntax comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution or import, project edit or proposer help/contact. Active173 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-9647c1ba/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],
   'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),
   'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in172':True,'printed_in172':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(current_success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':False}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':82,'def':34} and len(axioms['declarations'])==82
prior=js(T/'markov_worker_000171_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed171_sha256':h,'initial172_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in172':False})
assert len(older)==len({x['path'] for x in older})==445
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],
  'whole_old_module_recovery_in172':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel='research/markov-9647c1ba-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_9647c1ba.py','band_probe_9647c1ba.py','run_source_9647c1ba.py',
 'generate_margin_9647c1ba.py','generate_columns_9647c1ba.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,
  'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'executed_by_auditor':False,
  'scope':'Historical script identity only. Current generator extracts explicit worker169 P-definition slice; column generator imports worker168 helper; frame helper is a direct experiment dependency. No project import or execution.'})
assert len(inherited_scripts)==52
snapshots=[]
for n in ['failed-margin-linear-generator.py','failed-margin-sum-generator.py','band-first-run.py','band-corrected-initial.py']:
 rel='evidence/markov-9647c1ba/'+n;src=(A/rel).read_text();ast.parse(src)
 snapshots.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'executed_or_imported_by_auditor':False})
record_names=['source-experiment.json','source-progress.json','source-run-1792207218843301000.json',
 'band-experiment.json','band-progress.json','band-first-run.json','band-corrected-initial.json',
 'margin-generation.json','column-generation.json','failed-margin-sum.json','failed-margin-linear.json','source-visit.json']
data={name:js(E/name) for name in record_names}
for name in record_names:
 rel='evidence/markov-9647c1ba/'+name;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
# AST syntax only: no arithmetic evaluation of certificate literals.
def syntax(expr,variables):
 assert re.fullmatch(r'[0-9a-z()+*/\s]+',expr)
 tree=ast.parse(expr,mode='eval');allowed=(ast.Expression,ast.BinOp,ast.Add,ast.Mult,ast.Div,ast.Name,ast.Load,ast.Constant)
 assert all(isinstance(node,allowed) for node in ast.walk(tree))
 assert all(node.id in variables for node in ast.walk(tree) if isinstance(node,ast.Name))
 fractions=[]
 for node in ast.walk(tree):
  if isinstance(node,ast.BinOp) and isinstance(node.op,ast.Div):
   assert isinstance(node.left,ast.Constant) and isinstance(node.right,ast.Constant)
   a=ast.get_source_segment(expr,node.left);b=ast.get_source_segment(expr,node.right)
   assert re.fullmatch(r'\d+',a) and re.fullmatch(r'[1-9]\d*',b)
   fractions.append({'numerator_token':a,'denominator_token':b})
 plain=re.sub(r'\(\d+/\d+\)','R',expr)
 integers=[x for x in re.findall(r'\d+',plain) if x!='0']
 return {'expression_characters':len(expr),'expression_sha256':hashlib.sha256(expr.encode()).hexdigest(),
  'grammar':'Unsigned numeral tokens, unsigned literal fractions with nonzero literal denominator, named variables, addition, multiplication and parentheses. AST parsed without evaluation.',
  'integer_literal_count':len(integers),'rational_literal_count':len(fractions),'coefficient_literal_count':len(integers)+len(fractions),
  'denominator_tokens':sorted(set(x['denominator_token'] for x in fractions)),'mathematical_values_recomputed':False}
certificate_shapes=[];module='MarkovThirdMarginCertificateM964';src=(A/'research'/(module+'.lean')).read_text()
for r in [False,True]:
 name='third_margin_'+str(r).lower()+'M964';start=src.index('theorem '+name);end=src.find('\ntheorem ',start+1);block=src[start:end]
 line=next(x for x in block.splitlines() if len(x)>1000)
 expr=line.strip().removesuffix(' := by');row=syntax(expr,['x','g','z'])
 saved=next(x for x in data['margin-generation.json'] if x['residue']==r)
 assert row['coefficient_literal_count']==saved['terms']
 certificate_shapes.append({'module':module,'theorem':name,'residue':r,**row,
  'generated_line_sha256':hashlib.sha256(line.encode()).hexdigest(),'source_sha256':sha(A/'research'/(module+'.lean')),
  'saved_generator_record':saved,'long_literal_omitted_from_display':True})
column_shapes=[]
for prefix,indices in [('Column',range(2,12)),('Gap',range(2,10))]:
 for i in indices:
  module=f'MarkovThird{prefix}{i}M964';src=(A/'research'/(module+'.lean')).read_text()
  line=next(x for x in src.splitlines() if x.startswith(' if r then '))
  a,b=line.removeprefix(' if r then ').split(' else ')
  for r,expr in [(True,a),(False,b)]:
   row=syntax(expr,['x']);column_shapes.append({'module':module,'definition':f'third{prefix}{i}M964','residue':r,**row,
    'generated_line_sha256':hashlib.sha256(line.encode()).hexdigest(),'source_sha256':sha(A/'research'/(module+'.lean')),
    'saved_degree_only':next(x for x in data['column-generation.json'] if x['i']==i)['degrees'][1 if r else 0] if prefix=='Gap' else None})
# Index-domain counts only. Never evaluate source values, binomials, residual coefficients or signs.
source=Counter();qs=data['source-experiment.json']['q_values'];assert qs==list(range(1,13))+[16,24,32,48,64]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+3;d=q-(6 if r else 5);source['source_cases']+=1;source['coefficients']+=n+8
  if d>=0:
   source['formula_source_cases']+=1;source['formula_checks']+=n+8
   source['two_slot_checks']+=n+4;source['endpoint_checks']+=1
   source['scalar_checks']+=len(range(7,d+2))
  else:source['excluded_negative_exponent_cases']+=1
  for i in range(n+6):
   source['triples']+=1
   source['polygon_triples']+=all(3*n<=n*k+3*j and k+j<=n+2 for k in [i,i+1,i+2])
for k in ['coefficients','formula_checks','two_slot_checks','scalar_checks','endpoint_checks','triples','polygon_triples']:
 assert source[k]==data['source-experiment.json'][k]
band=Counter();bandqs=data['band-experiment.json']['q_values'];assert bandqs==[8,10,12,16,20,24,32,40]
band_domains=[]
for q in bandqs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);band['source_cases']+=1
  for k in range(1,(n-1)//2-q+1):
   j=q+k;d=n-2*j-1
   band['rows']+=1;band['pretrim_raw_positions']+=n+4;band['division_steps_if_no_break']+=d
   band['candidate_budget_positions_if_len_h_equals_k']+=len(range(1,k))
   if k<=6:band['sample_rows']+=1
   if k>=2:band['candidate_scalar_positions_if_len_h_at_least2']+=len(range(max(1,k-1),d+k-1))
   band_domains.append({'q':q,'r':r,'k':k,'j':j,'d':d,'pretrim_positions':n+4,
    'candidate_budget_positions':len(range(1,k)),'candidate_scalar_positions':len(range(max(1,k-1),d+k-1)) if k>=2 else 0})
assert band['rows']==162 and band['sample_rows']==len(data['band-experiment.json']['samples'])==90
assert band['candidate_budget_positions_if_len_h_equals_k']==data['band-experiment.json']['budget_checks']
assert band['candidate_scalar_positions_if_len_h_at_least2']==data['band-experiment.json']['scalar_pass']+data['band-experiment.json']['scalar_fail']
assert all(len(x['coefficients'])==x['k'] for x in data['band-experiment.json']['samples'])
assert len(data['band-experiment.json']['scalar_failures_at_ge7'])==11
assert all(x[-1]==7 for x in data['band-experiment.json']['scalar_failures_at_ge7'])
assert data['band-experiment.json']['largest_failed_s']==7
assert data['band-first-run.json']['samples']==data['band-corrected-initial.json']['samples']==data['band-experiment.json']['samples']
for prefix in ['source','band']:
 assert data[prefix+'-progress.json']=={k:v for k,v in data[prefix+'-experiment.json'].items() if k!='seconds'}
first=(E/'band-first-run.py').read_text();mid=(E/'band-corrected-initial.py').read_text()
assert first.replace('C,L,frame,F,O','C,L,lift,frame,F,O').replace('M=L(0,j,s+1)**2','M=lift(j,s+1,0)**2')==mid
run=data['source-run-1792207218843301000.json']
assert run['returncode']==0 and run['stderr']=='' and json.loads(run['stdout'])==data['source-experiment.json']
assert run['source_sha256']==sha(A/'research/source_experiment_9647c1ba.py')
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()]
def output(n):return events[n-1]['item']['aggregated_output']
assert json.loads(output(137))==run
for event,name in [(60,'failed-margin-sum.json'),(62,'failed-margin-linear.json')]:
 assert json.loads(output(event).splitlines()[0])==data[name] and events[event-1]['item']['exit_code']==1
for event,name in [(66,'margin-generation.json'),(109,'column-generation.json')]:
 assert json.loads(output(event))==data[name]
for event,name in [(154,'band-first-run.json'),(163,'band-corrected-initial.json'),(207,'band-experiment.json')]:
 assert json.loads(output(event))=={k:v for k,v in data[name].items() if k!='samples'}
assert json.loads(events[215]['item']['text'])==receipt['report']
event_bindings=[{'record':name,'event':event,'scope':scope} for event,name,scope in [
 (60,'failed-margin-sum.json','Exact first-line output; rc1, no certificate emitted. Saved generator bytes retained.'),
 (62,'failed-margin-linear.json','Exact first-line output; rc1, no certificate emitted. Saved generator bytes retained.'),
 (66,'margin-generation.json','Exact final proposal output; no generator executed by auditor.'),
 (109,'column-generation.json','Exact proposal output; no generator executed by auditor.'),
 (137,'source-run-1792207218843301000.json','Complete saved wrapper output, including full source result. Source hash collected after execution.'),
 (154,'band-first-run.json','Exact saved output excluding samples; erroneous auxiliary scale, retained and superseded.'),
 (163,'band-corrected-initial.json','Exact saved output excluding samples; corrected scale.'),
 (207,'band-experiment.json','Exact final saved output excluding samples; added candidate linear-formula and failure-location diagnostics.'),
 (216,'controller receipt report','Exact structured agent text equals receipt report; report is not a full-root completion claim.')]]
watch=js(T/'markov_worker_000172_receipt_watch.json');checks=watch['checks']
assert len(checks)==6 and sum(x['status']=='absent' for x in checks)==5 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json')
for a,b in zip(checks,checks[1:]):assert b['observed_epoch']-a['observed_epoch']>=60
assert all(x['requested_ms']<=59000 for x in watch['waits'])
residual={'root_open':True,'new_unconditional_raw_LC_region':True,
 'actual_a3_H_range':'Every actual frame path with a=3; all natural i,j with3*j<=b+9. Familyq>=1,b=3*q+(1 if r else2),j<=q+3. All zeros and smallq retained.',
 'third_row_theorem':'third_correction_closedM964, allq>=1,r:Bool,i:Nat atrowq+3.',
 'third_formula_ranges':{'false':'q>=5,d=q-5,c0=72,c1=28q-44,c2=2q(q-1)','true':'q>=6,d=q-6,c0=96,c1=44q-108,c2=4(q-1)(q-2)'},
 'third_two_slot_transport_proved':True,'third_two_slot_cut_positivity_proved_in_used_domain':True,
 'general_factored_identity':'Every naturald,j,s and arbitrary realpolynomialQ; weightedkernel equals factoredcorrection coefficient includingzeros,s=0.',
 'general_LC_conditions':'s<=j;c>=0; allQcoeff>=0; allm Q_(m+1)<=c*choose(j,m); explicit scalar robustnessmargin. Source adapter additionally assumes alln sourcecoeff(n+3,row)=factoredValue(d,j,n,Q). No universal later-row identity/budget/margin.',
 'root_equivalence':'Conjecture63 iff ThreeBeyondThirdM964 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondThirdM964','OtherFourM9E2'],
 'residual_H':'q<j,j!=5,j!=q+1,j!=q+2,j!=q+3, allnaturali.',
 'residual_V':'Outside ((i=3 or4) andj+1<=q) or(5<=i<=8 andj+2<=q).',
 'residual_D':'Outside3<=i<=6 andj+2<=q; indices(i,j+2),(i+1,j+1),(i+2,j).',
 'new_vertical_or_diagonal_region':False,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False,
 'prior171_host_outcome_unchanged':'missing_or_malformed_report / return1 / reportnull, not timeout or completed.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':snapshots,'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'certificate_literal_comparisons':certificate_shapes,'column_literal_comparisons':column_shapes,
 'residual_binding':residual,'receipt_waiting':watch,'all_named_new_match_current':True,
 'read_scope_notes':['All30 final mathematical files and proof bodies read. Two long margin identities and long column/gap definition expressions parsed/hash-bound instead of displaying every literal.',
 'Five final experiment/generator/wrapper scripts and four saved versions statically read/AST parsed, never imported/executed. Fifty-two older scripts hash identity only.',
 'Inherited archived ThirdRowFormula/SecondClosed171, ThreeRaw/ThreeArithmetic154 and explicit current ThreeSourceM9E2 read. No broad current research enumeration.',
 'Finite band residual length, zero counts, coefficient values and signs remain recorded-only; index-domain counts are distinguished from conditional loop maxima.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'mathematical_values_recomputed':False,'source_level_scope':residual,
 'literal_raw_indices':['(i,j)','(i+1,j)','(i+2,j)'],'residue_map':{'true':'b=3*q+1','false':'b=3*q+2'},
 'source_bridge':'Inherited exact actualsource third-row formula -> two-slot binomial weighted lift -> generic robustness/allcuts with certified scalar margins -> highcolumns; exact rational columns2..11 and gaps2..9 -> lowstarts; smallq and zerotails -> allthirdrow -> exactroot iff.',
 'zero_and_endpoint_handling':[
 'q1 uses inheritedj4; q2 inheriteduniversalj5; q3..5 andi<=11 ordinarydecide finite arithmetic. i>11 uses totaldegreezero forleftfactor. q>=6 uses exponentparameter; falseq5 also lies in validformula range but assembly uses smallq.',
 'Parameterizedfalseq=d+5,j=d+8;trueq=d+6,j=d+9. All naturald. Starts0/1 leftcoefficientzero; i2..9 exactgapcertificate; i>=10 maps t=i-4>=6.',
 'Outputt corresponds sourcecolumn t+4 and liftindexs=t+1. At t=d finalquadraticbinomial correction remains; onlyt>d takes zero-correction tailbranch.',
 'Natural subtraction d-s occurs before cast in absorbedExtra. Coefficient correction guardsi>=2,3,4 are explicit. General kernel guardk<=s ensures s-k+1 is not misinterpreted beyond its range.',
 'Only positive auxiliaryx^2*M or rational denominators are cancelled; no division by rawsourcecoefficient or possiblyzero binomialweight.',
 'Root guards/endpoint definitions are unchanged; newH theorem itself is allnatural indices. V/D residualclauses unchanged.'],
 'proof_chain_details':{
 'generic_robustness':'A,B,C,Aprime,Bprime,Cprime realpolynomials; M>0,x>0,y>=0; Aprime,B,C coefficientnonnegative; xAprime<=yA,xCprime<=yC,B<=Bprime; explicit coefficientwise basecut margin and scalar margin. No assumed positivity of every remaining coefficient beyond actual stated hypotheses.',
 'twin':'twinLift(j,t,a,v)=liftPoly(j,t+1)+aX^(t+1)+vX^t. t+1<=j; B>0,U>=0,a,b,c,v>=0,a,c<=U,v<=Uj, lowerbinomialBbound, explicitmargin. Centralb has no upperbound.',
 'third_scalar':'s>=7,s<=d+1; B>=choose(j+10,10); variablesx=s-7,g=d-s+1,z=B-base nonnegative. Two rational expressions each514unsigned literals, ring/positivity. Rational transfer uses cut_kernel_values/base_choose formulas and nonnegativeF; exactcasts then robustmargin.',
 'small_columns':'Ten exact sourcecolumn identities2..11, eight gapidentities2..9 for every naturald andbothresidues; positivity of rationalHorner expressions forx>=0. FinalLC is integerraw with no scaling.',
 'general_budget':'LiftBudget(j,s,U,R): allk 0<=R_k<=ifk<=s thenUchoose(j,s-k) else0. Endpolynomials budgeted, middleonlynonnegative; arbitrary nonnegative integer-index CrossLC weighting.',
 'general_transport':'correctionKernel=C(absorbedExtra(d,s,Q0))X^s + sumk0..s Q_(s-k+1)X^k. Exact weighted coefficient(s+1) of(1+X)^dQ, including arbitrarysignedQ ands0. Positivity/budget premises enter onlylaterLCcriterion.',
 'root':'Exact previousroot equivalence rewritten; backwardcasej=q+3 discharged by newtheorem, everyotherclause passedthrough. No rootcompletion.'},
 'certificate_syntax':certificate_shapes,'column_syntax':column_shapes}
F={**base,'mathematical_values_recomputed':False,
 'source_experiment':{'script':'source_experiment_9647c1ba.py','q_values':qs,'counts':dict(source),'saved_result':data['source-experiment.json'],
  'zero_count_saved_only':860,'zero_count_independently_recomputed':False,
  'domain':'Bothresidues,q1..12,16,24,32,48,64. Rawpositionsi0..n+7,starts0..n+5; formulaonlyd>=0;two-slot i>=4;scalar s7..d+1;oneendpoint pervalidcase. No coefficient evaluation.'},
 'band_experiment':{'script':'band_probe_9647c1ba.py','q_values':bandqs,'counts':dict(band),'index_domains':band_domains,
  'saved_first_run':data['band-first-run.json'],'saved_corrected_initial':data['band-corrected-initial.json'],'saved_final':data['band-experiment.json'],
  'qualification':'162rows and90sampleindices independently countable. Trimmed coefficient count3447 is value-dependent and recorded-only. Budget960 matches full-length k coefficient-domain maximum, conditional on len(h)=k; only90 retained samples expose those lengths. Scalar1701 matches k>=2 domains, conditional on len(h)>=2. No values/signs/factorization/divisions recomputed. Pass1450/fail251 and11failuresats7 are recorded classifications. First20failures capped; listed>=7 failures uncapped.',
  'incorrect_scale':'FirstusesL(0,j,s+1)^2; correcteduseslift(j,s+1,0)^2. Two-replacement textual transition exactly matches savedinitialcorrectedscript. First22pass/1679fail superseded; allthree retained.',
  'source_or_root_refutation':False},
 'generation':{'literal_certificate_shapes':certificate_shapes,'column_syntax':column_shapes,
  'saved_margin':data['margin-generation.json'],'saved_columns':data['column-generation.json'],
  'failed_sum':data['failed-margin-sum.json'],'failed_linear':data['failed-margin-linear.json'],
  'scope':'No generator/CAS/import executed. Finalscripts propose expressions; acceptedLeanidentity/positivity receipts provideproofcredit. Reported polynomial degrees/negativecounts not recomputed. Failedgenerators retained before later changes.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'saved_script_versions':snapshots,
 'source_visit':{'record':data['source-visit.json'],'qualification':'Savedhistorical workerretrievalmetadata only; no independentwebretrieval.'},
 'invocation_limits':['Sourcewrapper captures fullstdout and hashes executableafterexecution; savedhash matches finalsource, not an atomicpre-execution freeze.',
 'Source/band main-guarded; generators/wrapper top-level. No projectimport or execution byauditor.',
 'Bandoutput omits samplearrays, whosevalues retained butnotrecomputed. Negative scalarcriterion doesnot establish rawLCfailure.',
 'Failedmargin proposals produce noLean certificate; negativecoeffdiagnosticsdo not by themselves refute their universal inequalities. NoGAPexecution credited.']}
for name,obj in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 p=T/('markov_worker_000172_'+name+'.json');p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
print(json.dumps({'counts':dict(counts),'older':len(older),'source':dict(source),'band':dict(band),
 'certificate_literals':[(x['theorem'],x['integer_literal_count'],x['rational_literal_count']) for x in certificate_shapes]}))

