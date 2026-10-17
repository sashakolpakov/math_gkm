"""Closed worker 171: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import ast, hashlib, json, re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000171';A=W/'artifacts';E=A/'evidence/markov-c3e5369f'
REQUEST='c3e5369fa14d43dbbe480d50598f6f6a'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'before.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792206366544300000.json');axioms=js(E/'axioms-1792206404123166000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='missing_or_malformed_report' and receipt['returncode']==1 and receipt['report'] is None
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':171,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Closed partial host outcome missing_or_malformed_report, return 1, null report; elapsed 1710.595972776413 seconds. Fourteen final mathematical modules compiled/replayed, 90 closures printed; successful finalizer precedes model-capacity error. Second-correction horizontal row closed as retained proof product; full root remains open.',
 'scope':'Archive-first closed 171 and explicitly named inherited/current counterparts only. Static hashes, source/record parsing, literal syntax comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution or import, project edit or proposer help/contact. Active 172 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-c3e5369f/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],
   'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),
   'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in171':True,'printed_in171':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(current_success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':False}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':90,'def':36} and len(axioms['declarations'])==90
prior=js(T/'markov_worker_000170_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed170_sha256':h,'initial171_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in171':False})
assert len(older)==len({x['path'] for x in older})==431
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],
  'whole_old_module_recovery_in171':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel='research/markov-c3e5369f-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_c3e5369f.py','third_experiment_c3e5369f.py','two_slot_probe_c3e5369f.py',
 'run_source_experiment_c3e5369f.py','generate_margin_c3e5369f.py','generate_columns_c3e5369f.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,
  'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'executed_by_auditor':False,
  'scope':'Historical script identity only; no imported or executed project code. Current generator extracts explicit worker169 P-definition slice; column generator imports worker168 helper; frame helper is a direct experiment dependency.'})
assert len(inherited_scripts)==46
record_names=['source-experiment.json','source-progress.json','source-run-1792205792614796000.json',
 'third-experiment.json','two-slot-experiment.json','two-slot-progress.json','margin-generation.json',
 'column-generation.json','failed-margin-base5.json','source-visit.json']
data={name:js(E/name) for name in record_names}
for name in record_names:
 rel='evidence/markov-c3e5369f/'+name;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
# Parse unsigned generated expression syntax only: never evaluate coefficients or products.
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
  'grammar':'Unsigned numeral tokens, unsigned literal fractions with nonzero literal denominator, named variables, addition, multiplication and parentheses; AST parsed without evaluation.',
  'integer_literal_count':len(integers),'rational_literal_count':len(fractions),'coefficient_literal_count':len(integers)+len(fractions),
  'denominator_tokens':sorted(set(x['denominator_token'] for x in fractions)),'mathematical_values_recomputed':False}
certificate_shapes=[];module='MarkovSecondMarginCertificateMC3E';src=(A/'research'/(module+'.lean')).read_text()
for r in [False,True]:
 for kind in ['complete','border']:
  name='second_'+kind+'_'+str(r).lower()+'MC3E';start=src.index('theorem '+name);end=src.find('\ntheorem ',start+1);block=src[start:end if end!=-1 else len(src)]
  if kind=='complete':
   line=next(x for x in block.splitlines() if x.startswith(' let num : ℚ := '));expr=line.split(':=',1)[1].strip()
   den=next(x for x in block.splitlines() if x.startswith(' let den : ℚ := ')).split(':=',1)[1].strip()
   assert den=='(x+5)^2*(x+8)^2*(x+9)*(x+10)*(x+11)'
   assert all(f'have h{i} : x+{i}≠0 := by positivity' in block for i in [5,8,9,10,11])
   assert 'field_simp [h5,h8,h9,h10,h11]' in block
  else:
   line=next(x for x in block.splitlines() if x.startswith(' have he : secondBorderScalar'))
   expr=line.split('=',1)[1].rsplit(' := by',1)[0].strip();den=None
  row=syntax(expr,['x','g','z']);saved=next(x for x in data['margin-generation.json'] if x['residue']==r and x['kind']==kind)
  assert row['coefficient_literal_count']==saved['terms']
  certificate_shapes.append({'module':module,'theorem':name,'kind':kind,'residue':r,**row,
   'generated_line_sha256':hashlib.sha256(line.encode()).hexdigest(),'source_sha256':sha(A/'research'/(module+'.lean')),
   'outer_denominator_text':den,'saved_generator_record':saved,'long_literal_omitted_from_display':True})
column_shapes=[]
for module,prefix,indices in [('MarkovSecondColumnsMC3E','secondColumn',range(2,9)),('MarkovSecondGapsMC3E','secondGap',range(2,7))]:
 src=(A/'research'/(module+'.lean')).read_text()
 for i in indices:
  line=src.split('def '+prefix+str(i)+'MC3E',1)[1].splitlines()[1].strip()
  assert line.startswith('if r then ')
  a,b=line.removeprefix('if r then ').split(' else ')
  for r,expr in [(True,a),(False,b)]:
   row=syntax(expr,['x']);column_shapes.append({'module':module,'definition':prefix+str(i)+'MC3E','residue':r,**row,
    'generated_line_sha256':hashlib.sha256(line.encode()).hexdigest(),'source_sha256':sha(A/'research'/(module+'.lean')),
    'saved_degree_only':next(x for x in data['column-generation.json'] if x['i']==i)['degrees'][1 if r else 0] if prefix=='secondGap' else None})
# Count experiment indices, never mathematical values. Zero counts remain saved-only.
source=Counter();qs=data['source-experiment.json']['q_values'];assert qs==[1,2,3,4,5,7,10,16,24,40,64]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+2;d=q-(4 if r else 3);source['source_cases']+=1;source['coefficients']+=n+7
  if d>=0:source['formula_source_cases']+=1;source['formula_comparisons']+=n+7
  else:source['excluded_negative_exponent_cases']+=1
  if q in [3,4,7]:source['sample_cases']+=1
  for i in range(n+5):
   source['triples']+=1
   source['polygon_triples']+=all(3*n<=n*k+3*j and k+j<=n+2 for k in [i,i+1,i+2])
for k in ['coefficients','formula_comparisons','triples','polygon_triples']:assert source[k]==data['source-experiment.json'][k]
third=Counter();thirdqs=data['third-experiment.json']['q_values'];assert thirdqs==[5,6,7,10,16,24]
for q in thirdqs:
 for r in [False,True]:
  third['attempted_residue_cases']+=1;d=q-(6 if r else 5)
  if d<0:third['excluded_negative_exponent_cases']+=1;continue
  n=3*q+(1 if r else 2);third['source_cases']+=1;third['coefficients']+=n+7;third['triples']+=n+5;third['edge_checks']+=1
for k in ['coefficients','triples','edge_checks']:assert third[k]==data['third-experiment.json'][k]
two=Counter();twoqs=data['two-slot-experiment.json']['q_values'];assert twoqs==[5,6,7,8,10,12,16,20,24]
for q in twoqs:
 for r in [False,True]:
  two['attempted_residue_cases']+=1;d=q-(6 if r else 5)
  if d<0:two['excluded_negative_exponent_cases']+=1;continue
  two['admissible_residue_cases']+=1
  if list(range(4,d+2)):two['residue_cases_with_t']+=1
  for t in range(4,d+2):
   two['parameters']+=1;two['weighted_comparisons']+=1
   for h in range(t+3):
    for k in range(2*t+4):two['cut_coefficients']+=1
for k in ['parameters','weighted_comparisons','cut_coefficients']:assert two[k]==data['two-slot-experiment.json'][k]
for prefix in ['source','two-slot']:
 assert data[prefix+'-progress.json']=={k:v for k,v in data[prefix+'-experiment.json'].items() if k!='seconds'}
run=data['source-run-1792205792614796000.json'];lines=run['stdout'].splitlines()
assert run['returncode']==0 and run['stderr']=='' and lines[:-1]==['completed q '+str(q) for q in qs]
assert json.loads(lines[-1])=={k:v for k,v in data['source-experiment.json'].items() if k!='samples'}
assert run['source_sha256']==sha(A/'research/source_experiment_c3e5369f.py')
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()]
def output(n):return events[n-1]['item']['aggregated_output']
assert json.loads(output(175))=={k:(v[:200] if k=='stdout' else v) for k,v in run.items()}
assert ast.literal_eval(output(200))=={k:v for k,v in data['source-experiment.json'].items() if k!='samples'}
assert json.loads(output(113))==data['margin-generation.json']
assert json.loads(output(157))==data['column-generation.json']
assert json.loads(output(231))=={k:v for k,v in data['third-experiment.json'].items() if k!='edges'}
assert json.loads(output(246))==data['two-slot-experiment.json']
assert json.loads(output(105).splitlines()[0])==data['failed-margin-base5.json']['observed_stdout']
assert events[104]['item']['exit_code']==1
assert events[278]['type']=='error' and events[279]['type']=='turn.failed'
assert events[278]['message']==events[279]['error']['message']=='Selected model is at capacity. Please try a different model.'
event_bindings=[{'record':'source-run-1792205792614796000.json','event':175,'summary_event':200,'summary_format':'Python literal, samples excluded','scope':'200-character stdout prefix in event; full receipt matches all11 progress lines and final result excluding samples. Event200 matches the same summary projection.'},
 {'record':'margin-generation.json','event':113,'scope':'Exact literal saved output; generator not executed by auditor.'},
 {'record':'column-generation.json','event':157,'scope':'Exact literal saved output; generator not executed by auditor.'},
 {'record':'third-experiment.json','event':231,'scope':'Exact result with edges omitted; saved edge values not recomputed.'},
 {'record':'two-slot-experiment.json','event':246,'scope':'Exact complete saved output; no universal source-weight bridge or positivity claimed.'},
 {'record':'failed-margin-base5.json','event':105,'scope':'Recorded stdout exactly retained, rc1 before source emission; earlier executable bytes not separately snapshotted. Reconstruction is text, not reexecution.'}]
watch=js(T/'markov_worker_000171_receipt_watch.json');checks=watch['receipt_only_checks']
assert len(checks)==9 and sum(x['status']=='absent' for x in checks)==8 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json')
for a,b in zip(checks,checks[1:]):assert b['observed_epoch']-a['observed_epoch']>=60
assert all(x['requested_ms']<=59000 for x in watch['waits'])
residual={'root_open':True,'new_unconditional_raw_LC_region':True,
 'actual_a3_H_range':'All actual frame paths with a=3; all natural i,j satisfying3*j<=b+6. Equivalent actual family range q>=1,b=3*q+(1 if r else2),j<=q+2. Zeros and smallq retained.',
 'raw_second_row_theorem':'second_correction_closedMC3E: every q>=1, r:Bool, natural starting i, rowq+2.',
 'second_formula_ranges':{'false':'q>=3,d=q-3,c0=24,c1=4q','true':'q>=4,d=q-4,c0=36,c1=8q-8'},
 'third_formula_ranges':{'false':'q>=5,d=q-5,c0=72,c1=28q-44,c2=2q(q-1)','true':'q>=6,d=q-6,c0=96,c1=44q-108,c2=4(q-1)(q-2)'},
 'third_row_formula_proved':True,'third_row_universal_LC_claimed':False,'third_two_slot_transport_proved':False,
 'third_two_slot_cut_positivity_proved':False,'third_single_slot_obstruction_proved':True,
 'generic_perturbation_range':'Naturalj,t,h,k witht+1<=j; reala,b,c,u>=0;a,c<=u; explicit complete and border scalar margins. b has no upper bound. Allcuts h and coefficients k.',
 'root_equivalence':'Conjecture63 iff ThreeBeyondSecondMC3E and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondSecondMC3E','OtherFourM9E2'],
 'new_vertical_or_diagonal_region':False,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'certificate_literal_comparisons':certificate_shapes,'column_literal_comparisons':column_shapes,
 'residual_binding':residual,'receipt_waiting':watch,'all_named_new_match_current':True,
 'read_scope_notes':['All14 final mathematical files and proof bodies read; four long margin expressions and three long gap-definition lines parsed structurally/hash-bound instead of full display.',
 'Current6 experiment/generator/wrapper scripts read, never imported/executed. Older scripts identity-only.',
 'Inherited archived ThreeRaw/ThreeArithmetic154, CorrectionClosed170 and LowerClosed167 read. Two exact guessed inherited archive paths were absent: worker164/MarkovSmallHorizontalMAE9 and worker166/MarkovPolynomialWeightMFEE; explicit named current counterparts then read and matched sealed170/current171before pins. ThreeSourceM9E2 explicit current counterpart also read.',
 'Only closed171 archive enumerated; all current reads explicit. No active172 or later sources/events. Cache retention delegated to validator.',
 'Source-visit JSON retained as worker metadata; no new external retrieval/homogeneity/Newton-polygon/Laurent completeness audit.',
 'Own temporary helper static parsing/hashes/index counting only; no proof, coefficient or polynomial recomputation.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'mathematical_values_recomputed':False,'source_level_scope':residual,
 'literal_raw_indices':['(i,j)','(i+1,j)','(i+2,j)'],'residue_map':{'true':'b=3*q+1','false':'b=3*q+2'},
 'source_bridge':'Exact source discriminant recurrence and Fibonacci rows -> second_row_formula/source -> binomial weighted perturbed lift -> generic allcuts + certified scalar margins -> high columns; exact column2..8 gap identities -> starts2..6; zero starts0/1 + inherited smallq -> all second row -> source path and exact root iff.',
 'zero_and_endpoint_handling':['No normalization or zero filtering. q1/2 use inherited rowsj<=4; q3 uses universalj5. q>=4 is represented by secondExponent; falseq3 also has a valid formula but assembly uses existingj5.',
 'Polynomial source formula restricted falseq>=3,trueq>=4; no negative exponent extrapolation. Columns0/1 vanish in formula ranges; column2 is24/36. High starts i>=7 correspond t=i-3>=4.',
 'secondExtra has natural subtraction d-t before real cast; t+1 positive. For4<=t<=d certified margins; for t>d both correction binomial weights vanish and lower outputLC applies. t=d remains in certified branch.',
 'Generic perturbation centralb unbounded above;endpointsa/c bounded by commonu; allnonnegative. Cuts h>t killleftfactor. k<t+h usesoldgap; equalborder quantitativebound; k>t+h reflectedcompletecomparison.',
 'Only positive auxiliarykernelScale is cancelled; no division by a rawsource coefficient or binomial weight.',
 'Root endpoints/polygon guards remain inherited unchanged; current rawH result itself has no polygonrestriction. V/D residualclauses unchanged.'],
 'proof_chain_details':{'polynomial_cancellation':'Nonzero(X+1)^2 overPolynomialZ justified by constant coefficient, then mul_left_cancel0. Signed source recurrence is not treated as positive.',
 'second_parameters':'q=d+3/j=d+5 false;q=d+4/j=d+6 true. c0=24/36,c1=4d+12/8d+24. Weighted output lowerLift+c0 choose(d,t+1)+c1 choose(d,t), everyt.',
 'scalar_margins':'t>=4,t<=d; B=choose(t+j+3,j)>=product(j+1..7)/5040; x=t-4,g=d-t,z=B-base>=0. Four exact rational polynomial certificates; ordinaryLeanfield_simp/ring/positivity only.',
 'third_fibonacci':'Signedfibrecurrence; exactn5row2base; inductionn+5 and generaln>=5. RawrowsviaBivariate.swap with exactcoeffidentity.',
 'third_obstruction':'For honestexponentranges, sourcecoefficienti=d+4,rowq+3 equalslower+c2>lower. Everyreal single-slotcorrection at outputt=d+1 is annihilated by choose(d,d+1)=0. This disproves thatrepresentation only, notrawLC; no polygonwitness asserted.',
 'residual_H':'q<j,j!=5,j!=q+1,j!=q+2, allnatural i; residualV/D exactly priorranges; OtherFouractuala>=4 GlobalLC18.'},
 'certificate_syntax':certificate_shapes,'column_syntax':column_shapes}
F={**base,'mathematical_values_recomputed':False,
 'source_experiment':{'script':'source_experiment_c3e5369f.py','q_values':qs,'counts':dict(source),'saved_result':data['source-experiment.json'],
  'zero_count_saved_only':527,'zero_count_independently_recomputed':False,'domain':'Bothresidues, i0..n+6,starts0..n+4. Formula onlyd>=0, bothallq/rawtriple tests retainzeros. No coefficient evaluation by auditor.'},
 'third_experiment':{'script':'third_experiment_c3e5369f.py','q_values':thirdqs,'counts':dict(third),'saved_result':data['third-experiment.json'],
  'zero_count_saved_only':230,'zero_count_independently_recomputed':False,'domain':'Excludeq5true;allremainingformula coefficients i0..n+6,triples0..n+4,oneedge percase. Edges are saved values not recomputed.'},
 'two_slot_experiment':{'script':'two_slot_probe_c3e5369f.py','q_values':twoqs,'counts':dict(two),'saved_result':data['two-slot-experiment.json'],
  'domain':'d>=0,t4..d+1,h0..t+2,k0..2t+3;90weightedtriplecomparisons. Universalpositivity/sourcebridge unproved. Failurelist cap12 affectsnegativecut examples only; notanexhaustive failure inventory.'},
 'generation':{'literal_certificate_shapes':certificate_shapes,'column_syntax':column_shapes,'saved_margin':data['margin-generation.json'],'saved_columns':data['column-generation.json'],
  'failed_degree_five':data['failed-margin-base5.json'],'scope':'No generator/CAS/import executed. Finalscripts proposeexpressions, acceptedLeanidentities/positivityreceipts provideproofcredit; reportedpolynomialdegrees and negativecounts not recomputed.'},
 'output_event_bindings':event_bindings,'result_bindings':records,
 'source_visit':{'record':data['source-visit.json'],'qualification':'Savedhistorical workerretrievalmetadata only; no independentwebretrieval.'},
 'invocation_limits':['Sourcewrapper hashes executable after execution and prints200stdoutchars; fullsavedreceipt matches finalsummary withoutsamplearrays.',
 'Thirdexperiment output omitsedgearrays; theirvalues retainedonly, notindependentlyevaluated. Source/thirdscripts main-guarded; two-slot main-guarded; generatorsandwrapper top-level.',
 'Firstgenerator failure output preserved; prose reconstruction doesnotreplace historical executable bytes or supply proof. NoGAPexecutionthisround.']}
for name,obj in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 p=T/('markov_worker_000171_'+name+'.json');p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
print(json.dumps({'counts':dict(counts),'older':len(older),'source':dict(source),'third':dict(third),'two':dict(two),
 'certificate_literals':[(x['theorem'],x['integer_literal_count'],x['rational_literal_count']) for x in certificate_shapes]}))
