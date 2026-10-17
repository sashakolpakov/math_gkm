"""Closed worker173: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000173';A=W/'artifacts';E=A/'evidence/markov-139fed75'
REQUEST='139fed75c29240ba95427717b28c29a7'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'before.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792209475075264000.json');axioms=js(E/'axioms-1792209487216653000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':173,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1658.4703290462494. Sixteen mathematical modules compiled and jointly replayed,56 theorem closures printed. Full root open.',
 'scope':'Archive-first closed173 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active174 and later excluded. Earlier seals/windows unchanged.'}
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel],rel;return h
pat=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(src):
 ms=list(pat.finditer(src));decls=[];th=[];defs=[]
 for i,m in enumerate(ms):
  kind,name=m.groups();end=ms[i+1].start() if i+1<len(ms) else src.rfind('\nend')
  block=src[m.start():end].strip();decls.append({'kind':kind,'name':name})
  if kind=='theorem':
   delimiter=re.search(r':=\s*by\b|:=[ \t]*\n',block)
   assert delimiter is not None,name
   header=block[:delimiter.start()].rstrip()
   if name=='source_band_lcM139':assert 'let U :=' in header and 'threeRawM9E2 q r (s+4)' in header
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
 op='evidence/markov-139fed75/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in173':True,'printed_in173':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':False}
 assert len(row['historical_successful_source_versions'])==1
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':56,'def':11} and len(axioms['declarations'])==56
prior=js(T/'markov_worker_000172_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed172_sha256':h,'initial173_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in173':False})
assert len(older)==len({x['path'] for x in older})==475
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in173':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','checkpoint-3','correspondence','mathematics','next','operational','validation','literature']:
 rel='research/markov-139fed75-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['band_experiment_139fed75.py','band_newton_probe_139fed75.py','band_boundary_probe_139fed75.py','band_margin_probe_139fed75.py','quadratic_probe_139fed75.py','budget_obstruction_probe_139fed75.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'executed_by_auditor':False,'scope':'Historical script identity only. Explicit source_experiment_9647c1ba and three_probe_9e205206 are direct new experiment dependencies. No import or execution.'})
assert len(inherited_scripts)==57
record_names=['band-experiment.json','band-progress.json','boundary-probe.json','budget-obstruction-probe.json','budget-obstruction-reproduced.json','budget-source-witness.json','margin-probe.json','margin-scope.json','newton-probe.json','quadratic-probe.json','source-visit.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-139fed75/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
# Count indices only, not polynomial values, signs, coefficients or binomials.
source=Counter();domains=[];qs=data['band-experiment.json']['source_q']
assert qs==list(range(2,17))+[20,24,32]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['source_cases']+=1
  for k in range((q-(2 if r else 1))//2+1):
   j=q+k+1;d=n-2*j-1;assert d>=0
   source['rows']+=1;source['coefficients']+=n+5
   source['raw_triples']+=n+3
   source['budget_positions_if_full_length']+=k
   source['residual_adjacent_positions_if_full_length']+=max(k-1,0)
   source['sample_rows']+=q in [8,16] and k<=5
   for i in range(n+3):source['polygon_triples']+=all(3*n<=n*x+3*j and x+j<=n+2 for x in range(i,i+3))
   domains.append({'q':q,'r':r,'k':k,'j':j,'d':d,'coefficient_positions':n+5,'triple_positions':n+3})
for key in ['rows','coefficients','raw_triples','polygon_triples']:assert source[key]==data['band-experiment.json'][key]
assert source['budget_positions_if_full_length']==data['band-experiment.json']['budget_checks']
assert source['residual_adjacent_positions_if_full_length']==data['band-experiment.json']['residual_lc_checks']
assert source['sample_rows']==len(data['band-experiment.json']['samples'])==20
assert all(len(x[4])==x[2]+1 for x in data['band-experiment.json']['samples'])
assert data['band-progress.json']=={k:v for k,v in data['band-experiment.json'].items() if k!='seconds'}
newton=Counter()
for r in [False,True]:
 for k in range(13):
  newton['rows']+=1
  for m in range(k+1):
   newton['coefficient_sequences']+=1;newton['input_index_lookups']+=len(range(m+2));newton['saved_newton_slots']+=len(range(m+1))
assert newton['coefficient_sequences']==data['newton-probe.json']['checks']==182
assert len(data['newton-probe.json']['rows'])==26
assert sum(len(x['newton_in_d']) for x in data['newton-probe.json']['rows'])==182
boundary=Counter()
for k in range(51):
 for r in [False,True]:boundary['rows']+=1;boundary['positions_if_full_length']+=k+1
for k in range(1,11):
 for q in [2*k+2,2*k+3,3*k+5]:
  for m in range(1,k+1):boundary['difference_positions']+=1
assert boundary['positions_if_full_length']==data['boundary-probe.json']['boundary_checks']
assert boundary['difference_positions']==data['boundary-probe.json']['difference_checks']
budget=Counter()
for k in range(1,101):
 for r in [False,True]:
  budget['rows']+=1
  for m in range(1,k):budget['positions']+=1
assert data['budget-obstruction-probe.json']==data['budget-obstruction-reproduced.json']
margin=Counter();marginqs=data['margin-probe.json']['q_values'];assert marginqs==list(range(2,201))+[256,512,1000,2000,10000]
for q in marginqs:
 for r in [False,True]:
  maxk=(q-(2 if r else 1))//2
  ks=range(maxk+1) if q<=200 else sorted({0,1,2,3,maxk//4,maxk//2,maxk-1,maxk})
  for k in ks:
   if k<0:continue
   d=q-2*k-(2 if r else 1);j=q+k+1;margin['rows']+=1
   for s in range(7,min(13,j+1)):margin['positions']+=1
assert margin['positions']==data['margin-probe.json']['checks']
assert margin['positions']==data['margin-probe.json']['pass']+data['margin-probe.json']['fail']
assert len(data['margin-probe.json']['failures_at_ge8'])==data['margin-scope.json']['failures_at_s_ge8']==10
assert [z for z in data['margin-probe.json']['failures_at_ge8'] if z[3]<z[4]+z[2]]==data['margin-scope.json']['in_correction_support']==[]
assert all(z[3]==8 for z in data['margin-probe.json']['failures_at_ge8'])
# Literal witness matching only, no mathematical values recomputed.
witness=data['budget-source-witness.json'];assert witness['raw_values']==witness['predicted_values']
assert witness['source_triple_columns']==[2,3,4] and witness['q']==73 and witness['k']==36 and witness['row']==110
assert witness['path']==[False]*72+[True,False]
quad=data['quadratic-probe.json'];assert quad['witnesses'][0]['Q1']==witness['Q0_Q1_Q2'][1] and quad['witnesses'][0]['Q2']==witness['Q0_Q1_Q2'][2]
src=(A/'research/MarkovBandSourceWitnessM139.lean').read_text()
for value in witness['raw_values']+[witness['raw_gap']]:assert str(value) in src
budgetsrc=(A/'research/MarkovBandBudgetObstructionM139.lean').read_text()
for value in witness['Q0_Q1_Q2'][1:]:assert str(value) in budgetsrc
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()]
def output(n):return events[n-1]['item']['aggregated_output']
event_bindings=[]
for n,name,projection in [(72,'band-experiment.json','without_samples'),(160,'boundary-probe.json','full'),(184,'margin-probe.json','full'),(200,'budget-obstruction-probe.json','full'),(213,'quadratic-probe.json','full'),(236,'budget-source-witness.json','full')]:
 expected={k:v for k,v in data[name].items() if k!='samples'} if projection=='without_samples' else data[name]
 assert json.loads(output(n))==expected
 assert events[n-1]['item']['exit_code']==0
 event_bindings.append({'event':n,'record':name,'projection':projection,'returncode':0})
n=93;nr=data['newton-probe.json'];assert json.loads(output(n))=={'checks':nr['checks'],'negative':nr['negative'],'samples':nr['rows'][3:6]}
event_bindings.append({'event':93,'record':'newton-probe.json','projection':'checks,negative,rows[3:6]','returncode':0})
event_bindings.append({'event':282,'record':'margin-scope.json','projection':'Static command writes index-filtered subset; output says scalar failure scope recorded. No values recomputed.','returncode':events[281]['item']['exit_code']})
watch=js(T/'markov_worker_000173_receipt_watch.json');checks=watch['checks']
assert len(checks)==11 and sum(x['status']=='absent' for x in checks)==10 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json')
for a,b in zip(checks,checks[1:]):assert b['observed_epoch']-a['observed_epoch']>=60
assert all(x['requested_ms']<=59000 for x in watch['waits'])
residual={'root_open':True,'new_unconditional_raw_LC_region':False,
 'actual_source_formula':'Every actual numerator-three path classified q>=1,r; identity applies q>=2,k>=0,j=q+k+1 with literal2*j+1<=b. b=3*q+1 fortrue,3*q+2 forfalse.',
 'q1_new_source_formula':False,'negative_exponent_region_new_source_formula':False,
 'band_factor':'rawRow(threePoly(q,r),q+k+1)=lowerRow(b,q+k+1)+X^2*(X+1)^d*Q(q,r,k),d=b-2j-1.',
 'conditional_LC':'Starts(s+3,s+4,s+5),s<=j,c>=0,all Q coefficients nonnegative,allm Q_(m+1)<=c*choose(j,m),explicit scalar robustness margin. No shape/budget/margin assumed silently.',
 'band_boundary_equivalence':'All d,k,i,r coefficients of bandAt(d,k,r) nonnegative iff all k,i,r boundaryd0 coefficients nonnegative.',
 'boundary_formula_is_unproved_Prop':True,'boundary_nonnegativity_is_unproved':True,
 'proposed_budget_c_equals_Q1_formally_refuted':True,
 'single_actual_witness':'threePathM9E2 72 false,actual3/221,q73,k36,j110; formal coefficients and allthreepolygon guards plus positive rawgap. Auxiliary budget false; rawLC holds.',
 'root_equivalence':'Conjecture63 iff ThreeBeyondThirdM964 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondThirdM964','OtherFourM9E2'],
 'inherited_actual_a3_H':'Allnaturalstarts/zeros with3*j<=b+9; not enlarged universally here.',
 'residual_H':'q<j,j!=5,j!=q+1,j!=q+2,j!=q+3,allnaturali.',
 'residual_V':'Outside((i=3 or4) andj+1<=q) or(5<=i<=8 andj+2<=q).',
 'residual_D':'Outside3<=i<=6 andj+2<=q;indices(i,j+2),(i+1,j+1),(i+2,j).',
 'new_vertical_or_diagonal_region':False,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False,
 'prior171_host_outcome_unchanged':'missing_or_malformed_report / return1 / reportnull; not timeout or completed.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'residual_binding':residual,'receipt_waiting':watch,'all_named_new_match_current':True,
 'read_scope_notes':['All16finalmath files/proof bodies read; six final experiment scripts statically read and AST parsed, not imported/executed.',
 'Explicit inherited archived172FactoredRow/ThirdClosed and171FibSecondRow/SecondRowEquation plus currentThreeSourceM9E2/ThreeRawM9E2 read. No broad current research enumeration.',
 '475older mathematical source hash comparisons,181historical pending/other pins,57older script pins; ordinary inherited compiled-import trust unchanged.',
 'Exact witness numeral strings compared across saved source/JSON only; no products, binomials, signs, polynomial identities or coefficients recomputed.',
 'Finite loop counts with value-dependent trim lengths explicitly conditional; zeros/signs/failures retained as recorded only.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,
 'source_level_scope':residual,'literal_raw_indices':['(s+3,j)','(s+4,j)','(s+5,j)'],'witness_raw_indices':['(2,110)','(3,110)','(4,110)'],
 'residue_map':{'true':'b=3*q+1','false':'b=3*q+2'},
 'source_bridge':'Inherited exact source discriminant row equation plus first/second row equations -> strong induction with nonzero(X+1)^2 cancellation -> exact polynomial/coefficient identity -> inherited actualpath classification. Conditional LC separately maps integer Q to real polynomial and back exactly.',
 'zero_and_endpoint_handling':['Exponent is natural subtraction but literal2j+1<=b required before sourcefactorization; q>=2 separately required. q1 andd<0 notcovered bynewidentity.',
 'Fibonacci factorization checks zerocolumni0,guardedi+j<=n,andbinomialzero tail; no division by raw coefficient or binomial.',
 'Q natDegree<=k allq,k,r; Qconstant exactallq,k,r; Qlinear/quadratic/top formulas requireq>=2 andbandguard. Top strictlypositive andexactdegree onlythere.',
 'Correction coefficient equalsQtop atd+k+2,zero foralllateri; universalauxiliaryendpoint/tail identities hold even outsideband but positivity/sourceattachment retainbandguards. No claim everyintermediateQ coefficient positive or full intervalsupport.',
 'ConditionalrawLC starts s+3, s<=j; sourceidentityallnaturali. Casts exact; nofactorial/binomialnormalizedsource.',
 'Boundary auxiliaryparameterization includesd0,k0,falseq1;constantbasehandlesit. New actualsourcebridge stillq>=2.',
 'Rootpolygon/endpoints/zeros/directions unchanged; singletonwitness checksallthreeInPolygonconditions.'],
 'proof_chain_details':{
 'fib_factor':'Finite sum over s<=j. Vandermonde-style weighted_binomial_coeffMFFD yieldsproductcoeff under2j+1<=n; factor X; allzerosguarded.',
 'forcing':'bandGain base1(false)/2(true); higher sum of3fibBandpieces. Exactforcing exponent d+2; no positivity inferred fromsignedrecurrence.',
 'recurrence':'Q0=4G0,Q1=4G1+2(1-X)Q0,Q(k+2)=4G(k+2)+2(1-X)Q(k+1)-(X+1)^2Qk.',
 'source_induction':'basefirstrow; second row forcing; stronginductionk+2 with inheriteddiscriminant recurrence. Cancel polynomial(X+1)^2 nonzero via coeff0,never pointwisevalues.',
 'degree':'Degree estimates sums/products/subtraction. Exactconstantintegercubic. Leading4choose(q,k)false/8choose(q-1,k)true; choose positivity establishedbybandindices.',
 'first_coefficients':'Cleared integerfactor30 forlinear,1260forquadratic; intermediateFiblinear2/Fibquadratic12, rationalbinomialpolynomialidentities andexactcasts. Quadraticinterpolationonlyproposedformula; acceptedordinaryLeanrecurrenceproofindependent.',
 'boundary':'Shiftuses2(k+1)<=q thenbandAtparameteridentityunconditional. Inductk: monotonicityfrompreviousnonnegativeandmonotone; inductdfromboundary. Explicitformula isonlyProp premise; tailm>k handled separately.',
 'budget_obstruction':'Universalnegation instantiatedq73,false,k36,m1; sourcefactor d0. Actualpath72false andrawtripleprovenby inheritedlowerlift pluscheckedQcoefficients; failingearlysmallbinomialproofversionsnotcredited.',
 'root':'No newroot theorem; inheritedexactroot residual unchanged.'}}
F={**base,'mathematical_values_recomputed':False,
 'source_experiment':{'script':py_names[0],'q_values':qs,'counts':dict(source),'index_domains':domains,'saved_result':data['band-experiment.json'],
  'zero_count_saved_only':5320,'zero_count_independently_recomputed':False,
  'qualification':'211rows/11860positions/11438starts/6118polygon triples independently index-counted.770budget/595adjacent counts are full-length k+1 residual maxima; code trims zero tails.20saved samples expose lengths; formalpositiveendpoint agrees withfull degree in sourceband, but noPythonvalue evaluation. Zero5320 andno-failure results saved-only.'},
 'newton':{'counts':dict(newton),'saved_result':data['newton-probe.json'],'qualification':'26rows,k0..12bothresidues;182coefficient sequences. Finite difference values/zero terminal differences/negative absence not recomputed; no universalclaim.'},
 'boundary':{'counts':dict(boundary),'saved_result':data['boundary-probe.json'],'qualification':'102rows,k0..50bothresidues;2652positions conditional onfull residual length.165guessedderivative index triples for k1..10,3qchoices,m1..k. Only first10failures retained bycode; not totalfailurecount. Formula remainsunproved.'},
 'budget':{'counts':dict(budget),'saved_original':data['budget-obstruction-probe.json'],'saved_reproduced':data['budget-obstruction-reproduced.json'],
  'qualification':'200d0rows,k1..100bothresidues,9900positionsm1..k-1. Saved4825failures; first/firstten orderedrecords agree betweenforeground andsavedscript. No failure values recomputed. m0equality skipped. Actualsourcewitness separateformalproof andfinitecomputation.'},
 'margin':{'counts':dict(margin),'q_values':marginqs,'saved_result':data['margin-probe.json'],'saved_scope':data['margin-scope.json'],
  'qualification':'120931indexcases; q2..200allk,largerq256/512/1000/2000/10000sparse eightk-set; s7..min(12,j).245failures/120686passes saved-only. Tenuncapped s>=8 failureindices all s8 ands>=d+k, so source start s+3 beyondcorrectiondegree d+k+2. This is index-supportclassification only, not sign/LC recomputation; thresholdunproved.'},
 'quadratic_proposal':{'saved_result':quad,'interpolation_index_scope':'Bothresidues,k2..7,threeqvalues2k+2..2k+4:36inputcoefficient lookups. Threeq-power coefficient sequences each6ks. Witnesssearchk2..100stopsatfirstvalue-dependentfailure, savedk36each. No interpolation or witness-search recomputation.',
  'qualification':'Savedrationalformula proposal is notproof; formal denominator-clearedidentity separatelycompiled/replayed. No general quadraticpositivity inference.'},
 'actual_witness':{'saved_result':witness,'literal_source_json_agreement':True,'source_or_root_refutation':False,
  'qualification':'Numeral strings/rawindices/pathlist compared only. No arithmetic, signs, rawgap or coefficient recomputed.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'saved_script_versions':[],
 'source_visit':{'record':data['source-visit.json'],'qualification':'Savedworkerconsultationmetadata only; no independentwebretrieval.'},
 'invocation_limits':['Sixfinalscriptsretained; onlybandandbudgetmain-guarded,othersruntoplevel. Never imported/executedbyauditor.',
 'No dedicatedtimed/hashpinned experimentwrapper; finalsourcehashes andeventcommands/resultsbound, notatomicrun-timebodyattestation.',
 'Originalbudgetforegroundcommand retainedat200; savedreproductionrecordequal butstdout236onlysourcewitness.',
 'Samples/newtonfullarrays retained butoutputprojectionslimited. No mathematicalvalues recomputed.']}
for name,obj in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 p=T/('markov_worker_000173_'+name+'.json');p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
print(json.dumps({'counts':dict(counts),'older':len(older),'source':dict(source),'newton':dict(newton),'boundary':dict(boundary),'budget':dict(budget),'margin':dict(margin)}))

