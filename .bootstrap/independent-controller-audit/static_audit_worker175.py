"""Closed worker175: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000175';A=W/'artifacts';E=A/'evidence/markov-6576ccc5'
REQUEST='6576ccc531a74d75b259fda7f71c9b95'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792212696692659000.json');axioms=js(E/'axioms-1792212706671820000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':175,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1590.866719007492. Fourteen mathematical modules compiled and jointly replayed,52 distinct theorem closures printed across two stages. Full root open.',
 'scope':'Archive-first closed175 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active176 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-6576ccc5/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in175':True,'printed_in175':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':False}
 assert len(row['historical_successful_source_versions'])==1
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':52,'def':17} and len(axioms['declarations'])==52
prior=js(T/'markov_worker_000174_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed174_sha256':h,'initial175_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in175':False})
assert len(older)==len({x['path'] for x in older})==502
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in175':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','correspondence','mathematics','next','operational']:
 rel='research/markov-6576ccc5-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_6576ccc5.py','prefix_probe_6576ccc5.py','band_column_probe_6576ccc5.py','generate_columns_6576ccc5.py','transposed_kernel_probe_6576ccc5.py','transposed_tail_probe_6576ccc5.py','transposed_mixed_probe_6576ccc5.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 else:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'manifest_only_when_not_initial':rel not in before,'executed_by_auditor':False,'scope':'Historical script identity only. Explicit source_experiment_9647c1ba and three_probe_9e205206 are direct current experiment dependencies. Non-.py suffixes absent initial filtered map remain exact historical/manifest matches. No import or execution.'})
assert len(inherited_scripts)==68
record_names=['source-experiment.json','source-progress.json','prefix-probe.json','column-probe.json','transposed-kernel-probe.json','transposed-tail-probe.json','transposed-mixed-probe.json','source-visit.json']+[f'column-gap-{col}-{r}.json' for col in range(3,8) for r in range(2)]
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-6576ccc5/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})

# Static index counts only: no polynomial/binomial/ratio/gap/sign evaluation.
source=Counter();domains=[];qs=data['source-experiment.json']['q_values']
assert qs==list(range(2,25))+[32,50,73]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['source_cases']+=1
  for k in range((q-(2 if r else 1))//2+1):
   j=q+k+1;d=q-2*k-(2 if r else 1);source['rows']+=1
   source['coefficients']+=n+6;source['lift_comparisons']+=n+6;source['raw_triples']+=n+4
   for i in range(n+4):
    polygon=all(3*n<=n*x+3*j and x+j<=n+2 for x in range(i,i+3))
    source['polygon_triples']+=polygon
    prior_remaining=j>q and j!=5 and j not in [q+1,q+2,q+3]
    region=i<=5 or n<i+j+q
    source['new_region_positions_in_prior_H_residual']+=prior_remaining and region
    source['new_region_polygon_positions_in_prior_H_residual']+=prior_remaining and region and polygon
   domains.append({'q':q,'r':r,'k':k,'j':j,'d':d,'coefficient_positions':n+6,'triple_positions':n+4})
for key in ['rows','coefficients','lift_comparisons','raw_triples','polygon_triples']:assert source[key]==data['source-experiment.json'][key]
assert data['source-progress.json']=={k:v for k,v in data['source-experiment.json'].items() if k!='seconds'}
prefix=Counter()
for d in range(21):
 for k in range(41):
  prefix['mixed_checks']+=2*max(k-1,0)+max(k-2,0)
  prefix['edge_ratio_checks']+=2*max(k-1,0)
for d in range(10):
 for s0 in range(20):
  for t in range(20):
   for mi in range(10):prefix['midpoint_checks']+=1
for key,val in prefix.items():assert val==data['prefix-probe.json'][key]
columns=[]
for row in data['column-probe.json']['columns']:
 name=f"column-gap-{row['start_column']}-{int(row['r'])}.json";terms=data[name]
 assert len(terms)==row['terms']
 literal={(a,b):c for a,b,c in terms};assert len(literal)==len(terms)
 for exponents,literal_value in row['negative_examples']:assert literal[tuple(exponents)]==literal_value
 columns.append({'record':name,'rows':len(terms),'reported_negative_count':row['negative_count'],'negative_example_literals_match':True})
kernel=Counter();tail=Counter();mixed=Counter();kd=data['transposed-kernel-probe.json'];td=data['transposed-tail-probe.json']
assert kd['d_values']==td['d_values']==list(range(13))+[25,50]
assert kd['k_values']==td['k_values']==list(range(13))+[20,36]
assert kd['s_values']==td['s_values']==list(range(3,13))
for d in kd['d_values']:
 for k in kd['k_values']:
  for r in [False,True]:
   for s0 in kd['s_values']:
    kernel['triplets']+=1;kernel['weighted_identity_checks']+=3;tail['triplets']+=1
    kernel['auxiliary_q1_triplets']+=d+2*k+(2 if r else 1)==1
    for cut in range(min(d,s0+2)+1):
     la,lb,lc=[min(s0+t+1,cut+1) for t in range(3)]
     kernel['cut_coefficient_checks']+=max(2*lb-1,la+lc-1)
    for cut in range(s0+4):tail['cut_coefficient_checks']+=2*s0+3
for key in ['triplets','weighted_identity_checks','cut_coefficient_checks']:assert kernel[key]==kd[key]
for key in ['triplets','cut_coefficient_checks']:assert tail[key]==td[key]
for d in [0,1,3,8,20,50]:
 for k in [0,1,2,3,5,10,20,36]:
  for r in [False,True]:
   for s0 in range(3,16):
    mixed['triplets']+=1;mixed['auxiliary_q1_triplets']+=d+2*k+(2 if r else 1)==1
    for cut in range(s0+4):mixed['checks']+=2*s0+3
for key in ['triplets','checks']:assert mixed[key]==data['transposed-mixed-probe.json'][key]
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()];event_bindings=[]
for name in record_names:
 matches=[]
 for idx,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output')
  if not isinstance(out,str):continue
  try:parsed=json.loads(out)
  except (ValueError,TypeError):continue
  if parsed==data[name]:matches.append({'event':idx,'returncode':item.get('exit_code'),'projection':'full'})
 event_bindings.append({'record':name,'exact_json_output_matches':matches})
watch=js(T/'markov_worker_000175_receipt_watch.json');checks=watch['checks']
assert len(checks)==10 and sum(x['status']=='absent' for x in checks)==9 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json')
for a,b in zip(checks,checks[1:]):assert b['observed_epoch']-a['observed_epoch']>=60
assert all(x['requested_ms']<=59000 for x in watch['waits'])
residual={'root_open':True,'new_unconditional_raw_LC_region':True,
 'actual_source_region':'q>=2,q<j,2*j+1<=N, and(i<=5 OR N<i+j+q), for both actual numerator-three families; no denominator bound.',
 'literal_predicate':'BandClosedRegionM657 q r i j := 2<=q AND q<j AND 2*j+1<=sourceNME9C q r AND(i<=5 OR sourceNME9C q r<i+j+q).',
 'source_triple':'(i,j),(i+1,j),(i+2,j), every natural i satisfying the region, zeros included.',
 'band_parameterization':'c=1false/2true,q=d+2*k+c,j=q+k+1,N=3*q+3-c,d=N-2*j-1; guarded natural subtraction. Tail i>d+k+2 equivalent toN<i+j+q underband.',
 'q1_new_source_formula':False,'negative_exponent_region_new_source_formula':False,
 'positive_lift':'Exact allnatural d,k,t formula forcoefft of(1+X)^dP(d,k), finite sum m0..t. Source columnt+3 equals lowerLift(t)+correctionLift(t+1).',
 'coefficient_polynomial':'Every fixed natural column index t, exact rationalcast ofrawsource; source parameters natural andq>=2. No interpolation trusted.',
 'first_gap':'AuxiliaryQ firstadjacent allnaturald,k,r; augmentedresidual FirstLC withq>=2; binomialsmoothing preservesFirstLC andyieldsactualrawstarts2.',
 'columns3_4_5':'Universal rationald,k>=0 scalar certificates viaordinaryLean normalization, mappedtonaturalactualsources. No numericalpolynomiallists trusted.',
 'remaining_band_window':'Effective natural starts6<=i<=d+k+2 afternewprefix/tail; BandMiddleM657 itselfstarts3, with3..5dischargedintheconditionalassembly.',
 'transposed_kernel':'Nonnegativeauxiliarykernel withcoeffbinomialweights reconstructsexactrawsourceoutput; clampednatural(d-s)/(s+1) hasallboundarycases.',
 'TransposedCuts_proved':False,'transposed_tail_semantics':'cut_h keepscoefficientindices>=h; forallnaturald,k,s,r withs>=3, foralltailcut h andcoefficientn, completecutgap>=0.',
 'transposed_candidate_is_root_equivalence':False,'conditional_transport':'TransposedCuts gives allremaining bandH viaCrossLC binomialweights, sourceidentity andnewprefix. Otherrows/V/D/numerators remain.',
 'auxiliary_obstructions':'Formalratiofailure atd0,k8,false withQfirstLCstilltrue; formalmixedkernel coeff-30888 whilecompletegapcoeff87742248. Neither raw/root refutation.',
 'root_equivalence':'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondBandM657','OtherFourM9E2'],
 'inherited_actual_a3_H':'Allnaturalstarts/zeros with3*j<=N+9 retained; new bandregion additionally discharged.',
 'residual_H':'q>=1,q<j,j!=5,j!=q+1,j!=q+2,j!=q+3,notBandClosedRegion,allnaturali.',
 'residual_V':'Outside the union of ((i=3 or4) and j+1<=q) and (5<=i<=8 and j+2<=q).',
 'residual_D':'Outside3<=i<=6 andj+2<=q;indices(i,j+2),(i+1,j+1),(i+2,j).',
 'new_vertical_or_diagonal_region':False,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False,
 'prior171_host_outcome_unchanged':'missing_or_malformed_report / return1 / reportnull; not timeout orcompleted.',
 'prior174_scope_unchanged':'174 auxiliarypositivity/boundaryCrossLC completedwithoutnewuniversalrawLC;175newprefix/tail proofs do notrewrite174.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'residual_binding':residual,'receipt_waiting':watch,'all_named_new_match_current':True,
 'read_scope_notes':['All14 finalmath bodies read; seven experiment/generator scripts statically read/AST parsed, neverexecuted/imported.',
 'Explicit archived163PolynomialWeightMFEE and168AbsorbedKernelM418 read toverify tailcut/weight/zero-clamp interfaces; inherited historicalbody validation limits unchanged.',
 '502oldermathsourcecomparisons,181historicalpending/other,2operational,68scripts and16externalpairs. Explicitnamedcounterparts only; no active176+reads.',
 'Finite counts are index/list-domain arithmetic only; no coefficients,binomials,polynomials,products,gaps,roots orsigns recomputed. Savednegativeexample strings comparedliterally.',
 'Generatedcolumnproof script inspected as text only, notregenerated; acceptedproofs independentlyuseordinary Lean normalization. No researchhelper execution.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,
 'source_level_scope':residual,'literal_raw_indices':['(i,j)','(i+1,j)','(i+2,j)'],'kernel_output_indices':['(s+3,j)','(s+4,j)','(s+5,j)'],
 'residue_map':{'true':'N=3*q+1,c=2','false':'N=3*q+2,c=1'},
 'zero_and_endpoint_handling':['Rawcolumns0/1zeroinband; starti0/1trivialLC, start2handledbyFirstLC. Nozero isdeleted.',
 'Qfirstgap k<2usescoefficient2zero; k>=2exactclearedlinear/quadraticidentitieswithpositiveintegerconstants. No divisionbyrawcoefficient.',
 'FirstLC requiresP0/P1nonnegative andP0P2<=P1², notfullsequenceLC; smoothingproofvalidunderexactpremises.',
 'Tailstartstricti>d+k+2; allthreepositionsbeyondcorrectionsupport reduce tolowerrow includingzero tails. Boundaryequalityi=d+k+2 remainsunlessprefix.',
 'Sourceformula q>=2plusliteralbandguard; q1case andnegativeexponentregion retainedbyrootresidual/history.',
 'Columnformula allnaturalt; naturalbinomialzeros retainedviachoose_poly_nat. Rationalcertificate nonnegative d,k specializedtonaturals; no arbitraryrationalsourceidentification.',
 'Kernelclamp d-s is naturalsubtraction; denominator s+1 nonzero; absorbed_choose coversd<=s andd>s. Tailcuts retainindices>=h, includingemptycuts andzero weights.',
 'Exactroot copiespreviousV/D clauses unchanged, keepsOtherFour andalloriginalpolygon/endpointzero semantics throughinheritedrootiff.'],
 'proof_chain_details':{
 'first':'ExactQ0/Q1/Q2 identities clearedby30/1260; nonnegativepolynomialcertificate; k0/1tail. H0/H1 fromfiniteweightedchoose; exactrationalcasts intoaugmentedresidualgap.',
 'smooth':'FirstLC((X+1)P) fromthreeexactcoefficientsandnonnegativefirsttwo; inductiononPascalpower. X²shift yieldssourcecolumns2,3,4.',
 'lift':'Finiteoffsetchooseproduct,Vandermonde, smoothedFibidentity andweightedhockey-stickprove doubleprefixlift thenfullcorrectionlift, allnaturalindices.',
 'polynomial':'choosePoly exactnatural identity yieldsrationalrawcoeff expression foreachfixedcolumnt. Column3/4/5 normalizeuniversalexpressionwithbinomialtables0..9/11/13.',
 'root':'BandClosedRegionprovedfirst; rootiffoldresidual case-splitsregion. Allpathattachment viaexactthree-sourceclassification, no freepolynomial identification.',
 'kernel':'Reflectfinitecorrectionindices, absorbtopbinomialweight usingclampedidentity, finitecoeffkernel nonnegative. Binomialweightingevaluation recoversrawoutput.',
 'conditional':'Inheritedtail-cut weighting theorem usesforallh,n gaps plusnonnegativeCrossLCzchoose. TransposedCuts remainsProp, no proof. Existingprefix handlesi<=5, remainder s=i-3>=3.',
 'obstructions':'Formalratiofailure auxiliaryfactorandpositivefirstgap; mixed-30888 andcomplete87742248 literalordinaryLean certificates. Source3/53triple existsonlysavedexperimentrecord, notnewformalrawnumeralwitness.'}}
F={**base,'mathematical_values_recomputed':False,
 'source_experiment':{'script':py_names[0],'q_values':qs,'counts':dict(source),'index_domains':domains,'saved_result':data['source-experiment.json'],
  'zero_count_saved_only':19690,'zero_count_independently_recomputed':False,
  'qualification':'52sourcefamilies/454rows;44667coefficientandliftpositions,43759rawstarts,24069polygontriples. Fixedlistlengths, no trimdependentcount. Zero19690/no failures/threewitnessgaps savedonly. Newregion-vs-oldresidual counts compareguards only, notproofvalues ornewresearchwitness.'},
 'prefix':{'counts':dict(prefix),'saved_result':data['prefix-probe.json'],'qualification':'d0..20,k0..40; beforeupdateS/Tlenk,Flenk+1.2max(k-1,0)+max(k-2,0) mixedindices. Midpointd0..9,s/t0..19,m0..9. Recorded2188midpoint and486edgeratiofailures not recomputed; cappedexamples only.'},
 'columns':{'record_counts':columns,'saved_result':data['column-probe.json'],'qualification':'Tenpolynomialrecordlistsforcolumns3..7,bothresidues; fourteen candidatecolumnlookups0..6. Termcounts/uniqueexponentkeys/negativeexampleliteralidentity checked, notpolynomialcalculation/sign recomputation. Acceptedonlycolumns3..5; truecolumn6finitecandidate notformalLCcredit.'},
 'prefix_cut_kernel':{'counts':dict(kernel),'saved_result':kd,'qualification':'4500triplets,13500identitypositions,265560PREFIX-cutcoefficientpositions. Cut0..min(d,s+2), prefixslicelengths. Wrongpredicateforretainedtail-weighttransport, no universalshapecredit.'},
 'tail_cut_kernel':{'counts':dict(tail),'saved_result':td,'qualification':'Same4500triplets, cuts0..s+3 retainindices>=cut withouttrimming, each2s+3gapcoefficientpositions:1005750. Includes10auxq1tripletsoutsideq>=2sourcebridge. Finiteonly; no sign/identityrerun.'},
 'mixed_kernel':{'counts':dict(mixed),'saved_result':data['transposed-mixed-probe.json'],'qualification':'6d*8k*2r*13s=1248triplets;375648cutcoefficientpositions.13auxq1tripletsoutsidebridge.120816mixednegative/1581correctionnegative are savedresults,6examples each. Formalonecoefficientcertificate separate.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'saved_script_versions':[],
 'source_visit':{'record':data['source-visit.json'],'qualification':'Savedconsultationmetadata only; no independentweb/literature/noveltyreview.'},
 'invocation_limits':['Sevenfinalscripts includinggenerator retained. Onlysource,columnprobe,kernelprobe main-guarded; otherstop-level. Noneexecuted/importedbythisaudit.',
 'Finalhashes andeventcommands/outputs do notinventatomicinvocation-timePythonbodyhashes.',
 'Prefixcut andtailcut programs/results remainseparate; earlierwrongpredicate isnot silentlyupgraded.',
 'Raw3/53exampleandnegativeauxiliarycoefficients are literalrecords; no rootrefutation inferred.']}
for name,obj in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 p=T/('markov_worker_000175_'+name+'.json');p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
print(json.dumps({'counts':dict(counts),'older':len(older),'source':dict(source),'prefix':dict(prefix),'kernel':dict(kernel),'tail':dict(tail),'mixed':dict(mixed),'event_bindings':event_bindings}))

