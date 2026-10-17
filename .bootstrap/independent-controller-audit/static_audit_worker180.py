"""Closed worker180: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000180';A=W/'artifacts';E=A/'evidence/markov-1c65a306'
REQUEST='1c65a30634f843b1b22e83fb453dc26d'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'kernel-1792220527100559000.json');axiom_records=[(p,js(p)) for p in sorted(E.glob('axioms-*.json'))]; axioms={'sources':{},'declarations':{}}
for p,d in axiom_records:
 for group in ['sources','declarations']:
  for key,value in d[group].items():
   if key in axioms[group]:assert axioms[group][key]==value
   axioms[group][key]=value
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['modules'])==set(replay['modules'])
base={'worker':180,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1544.4578330516815. Twelve final mathematical modules compiled and jointly replayed,66 distinct theorem closures printed;10 rejected compiler attempts retained. Full root open.',
 'scope':'Archive-first closed180 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active181 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-1c65a306/'+module+'.olean';oh=binding(op)
 assert sh==validation['modules'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['modules'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in180':True,'printed_in180':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':66,'def':18} and len(axioms['declarations'])==66

prior=js(T/'markov_worker_000179_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed179_sha256':h,'initial180_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in180':False})
assert len(older)==len({x['path'] for x in older})==556
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in180':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==182
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
newlibs=[]
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint-1','checkpoint-2','checkpoint-3','correspondence','mathematics','next','operational']:
 rel='research/markov-1c65a306-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['probe_moments_1c65a306.py','probe_drift_1c65a306.py','fixed_parameter_1c65a306.py','validate_fixed_zero_1c65a306.py','source_experiment_1c65a306.py','generate_certificates_1c65a306.py','generate_fixed_s0_1c65a306.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 elif rel in manifest:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'absent_from_initial_filter':rel not in before,'in_current_manifest':rel in manifest,'executed_by_auditor':False,'scope':'Historical identity only. Explicit source experiment dependencies are three_probe_9e205206,source_experiment_6576ccc5,source_experiment_9647c1ba; no imports or execution.'})
assert len(inherited_scripts)==99
record_names=['source-experiment.json','moment-probe.json','drift-probe.json','fixed-parameter-probe.json','fixed-parameter-validation.json','fixed-zero-factorization.json','fixed-parameter-s0.json','fixed-parameter-s1.json','fixed-parameter-s2.json','capabilities-and-failures.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-1c65a306/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines() if x.strip()]
event_bindings=[];decoder=json.JSONDecoder()
for n,value in data.items():
 if n in ['capabilities-and-failures.json','fixed-zero-factorization.json','fixed-parameter-s0.json','fixed-parameter-s1.json','fixed-parameter-s2.json']:continue
 matches=[];projection_matches=[]
 for event_no,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output','')
  for pos,ch in enumerate(out):
   if ch not in '[{':continue
   try:obj,end=decoder.raw_decode(out,pos)
   except (ValueError,TypeError):continue
   row={'event':event_no,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'start_character':pos,'end_character':end,'whole_stdout':out.strip()==out[pos:end]}
   if obj==value:matches.append(row)
   if n=='source-experiment.json' and obj=={k:v for k,v in value.items() if k!='labels'}:projection_matches.append(row)
   if n=='drift-probe.json' and obj=={k:v for k,v in value.items() if k!='samples'}:projection_matches.append(row)
   if isinstance(value,dict) and 'cases' in value and isinstance(value['cases'],list) and obj in value['cases']:projection_matches.append(row)
   if isinstance(value,list) and any(isinstance(z,dict) and obj=={k:v for k,v in z.items() if k!='polynomial'} for z in value):projection_matches.append(row)
 event_bindings.append({'record':n,'complete_saved_json_matches':matches,'projection_without_samples_matches':projection_matches,'scope':'Literal saved JSON binding only; no regeneration or command-time imported-version inference.'})
# Own static index-domain counts only, never coefficient/binomial/moment/gap arithmetic.
qs=list(range(2,13))+[20,29,43];sc=Counter();tc=[0,0,0]
for q in qs:
 for r in [False,True]:
  b=3*q+(1 if r else 2);sc['deterministic_band_source_labels']+=1
  for k in range((q-(2 if r else 1))//2+1):
   d=q-2*k-(2 if r else 1);j=q+k+1;assert d>=0 and 2*j+1<=b
   sc['rows']+=1;sc['coefficients']+=b+6
labels=data['source-experiment.json']['labels'];assert len(labels)==len(set(map(tuple,labels)))==48
for a,b in labels:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for z,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):tc[z]+=all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
assert sc['rows']==169==data['source-experiment.json']['rows'] and sc['coefficients']==12488==data['source-experiment.json']['coefficients'] and tc==data['source-experiment.json']['raw_triples']
mc=sum(1 for j in range(1,71) for s in [0,1,2,3,5,10,30,100,1000] for h in range(1,j+1));assert mc==22365==data['moment-probe.json']['checks']
assert len(data['moment-probe.json']['failures'])==4217 and len(data['moment-probe.json']['samples'])==10
dc=Counter()
for j in range(2,35):
 for h in range(2,j+1):
  for s in range(35):
   dc['grid_drift_sign_positions']+=1
   if s>0:dc['grid_checks']+=1;dc['variance_contraction_checks']+=1
for j in range(2,121):
 for h in range(2,j+1):dc['limit_checks']+=1
dc['stress_checks_saved_planned']=400
assert all(dc[k]==data['drift-probe.json'][k] for k in ['grid_checks','variance_contraction_checks','limit_checks'])
fc=Counter()
for s in range(3):
 for j in range(2,51):
  for h in range(1,j+1):
   for name in ['A','B']:fc['formula_checks']+=1
   if h>=2:fc['gap_checks']+=1
assert all(fc[k]==data['fixed-parameter-validation.json'][k] for k in fc)
polys=[]
for z in range(3):
 value=data[f'fixed-parameter-s{z}.json'];case=data['fixed-parameter-probe.json']['cases'][z]
 assert all(value[k]==v for k,v in case.items())
 row={'s':z,'stored_list_lengths':{k:len(value[k]) for k in ['A','B','gap','shifted']},'saved_summary':case,'no_values_recomputed':True}
 assert len(value['gap'])==value['terms'] and len(value['shifted'])==value['shifted_terms']
 assert all(len(value[k])==len({tuple(x[0]) for x in value[k]}) for k in ['A','B','gap','shifted'])
 polys.append(row)
assert len(data['fixed-zero-factorization.json']['core'])==175
# An exact reconstructed source record, not an invocation-time snapshot.
rel='evidence/markov-1c65a306/fixed-parameter-initial.py';initial=(A/rel).read_text();ast.parse(initial)
final=(A/'research/fixed_parameter_1c65a306.py').read_text();assert initial==final.replace('range(1,16)','range(1,12)')
savedversions=[{'path':rel,'sha256':binding(rel),'status':'later_reconstruction_of_initial_script_from_single_recorded_table_length_edit','not_contemporaneous_failed_invocation_snapshot':True,'executed_by_auditor':False}]
oldresult=next(x for x in prior['result_bindings'] if x['path']=='evidence/markov-beca0ad5/factored-reverse-certificates.json');assert sha(P/oldresult['path'])==before[oldresult['path']]==oldresult['sha256']
inherited_results=[{**oldresult,'scope':'Explicit generator input bound to sealed179/current/initial180; no generation, division or sign recomputation.'}]
reads=[];oldmap={x['module']:x for x in older}
for name in ['MarkovPolynomialCertificateMBEC','MarkovClearedKernelMBEC','MarkovUpperReductionMA45','MarkovAdjacentConvolutionM09F','MarkovOrderedConvolutionM09F','MarkovQKernelM7E2','MarkovTransposedKernelM657','MarkovThreeSourceM9E2']:
 row=oldmap[name];reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'scope':'Prior sealed source/proof audit reused with explicit presentidentity pin; no older body replay or historicalwindow extension.'})
residual={'root_open':True,'new_unconditional_raw_LC_region':False,'new_unconditional_source_estimate':False,
 'root_equivalence':'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2','remaining_predicates_unproved':['ThreeBeyondBandM657','OtherFourM9E2'],
 'UpperAdjacentMA45_proved':False,'PositiveParameterTailM1C6_proved':False,'VarianceTailM1C6_proved':False,'ReverseTailM1C6_proved':False,'CertificatePositiveMBEC_proved':False,'SharpCompleteMargin_proved':False,
 'new_unconditional_auxiliary_results':'Alladjacent andorderedratio comparisons at s0 for allnaturaldegree/indices withprovedzero tails;translatedsharpzeromargin for allnaturalj,n. Allnaturalj,s h4/h5 reversedcomparisons. Variancecontractionins for h<=j andexactdriftiff.',
 'remaining_auxiliary_range':'PositiveParameterTailM1C6 forallnaturalj,s,h,1<=s,6<=h<=j -> varianceDrift>=0; exactiffUpperAdjacentMA45. Notrootiff.',
 'conditional_source_LC':'GlobalPositiveParameterTail (orVarianceTail) implies rawH allnaturalstarts i in row q+k+1, naturalq,k,rBool,q>=2,2*(q+k+1)+1<=sourceNME9C(q,r). No premise discharged byfiniteevidence.',
 'source_residues':'rfalse:N=3q+2;rtrue:N=3q+1,actualpathfalse^(q-1)++[true,r];q1excludedfromadapter.',
 'small_auxiliary_degree':'q_small_adjacent for j<=5 allnaturals,n<2j. jauxiliarydegree is notsource numerator.',
 'variance_scope':'decreases acrosss->s+1, h<=j;0<=v<=h^2/4. Normalizeddriftmonotonicity/limitidentification/limitsign unproved; contractionalone noDriftsign.',
 'formal_auxiliary_obstruction':'v(15,2,14)=152528/25937;v(15,2,15)=75573/12884 anddecreases. Universalhmonotonicityfalse;positiveDrift/witnessadjacentproved. Notactualsourcefailure.',
 'actual_raw_source_counterexample':False,'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,
 'prior_source_scope_unchanged':'Allactuala2all3directions152;a3H3j<=N+9 inherited172;175bandprefixi<=5 orstrictN<i+j+q underq>=2,q<j,2j+1<=N;no clause removed180.'}
proof={
 'masses':'K(j,s,r)>0 forr<=j; symmetricS=sumK*K>0 forh<=j includingh0. M=sum(r-h/2)^2K*K nonnegative;v=M/S. h-r naturalcast justified r<=h. Every canceledmass/fallingdenominator positive.',
 'moments':'y=s+j+4,z=y-h/2 positiveh<=j. K(s+1,r)=K(s,r)*(y-r)/y. Exactreflectionr->h-r balancesunbalancedconvolution. y^2B_h=z^2S_h-T_h; y(y+1)A_h=(z^2+z)S_h+T_h.',
 'drift':'For1<=h<=j, y^3(y+1)(B_(h-1)A_h-B_hA_(h-1))=(2z+1)S_hS_(h-1)D, D=(z+1)v_h-zv_(h-1)+z/4. Positivefactorcancellation givesiff;Nat(h-1)cast usesh>=1. Moment-vsvariancedriftidentity onlyneedsh<=j,includingh0.',
 'h4h5':'CertificateGap4/5 exactBiPoly ring identities factor positiveintegerlinearforms and18/35termcores. Eval(k,s)givesclearedGap(h+k,s,h)>0 forallnatural k,s; connectsviainheritedpositiveclearance. No finitegeneratorcoefficienttrusted.',
 'contraction':'Weightedsecondmomentinequality via explicitfinite doublesumofw_iw_k(x_i-x_k)^2>=0. y^2S_(s+1)S_s(v_s-v_(s+1))=S*U-T^2>=0. ZeroNallowedweightedlemma;positiveactualmassprovesdecreasingvariance forfixedh. Boundv<=h^2/4 uses0<=r<=h.',
 'rising':'rise(n,x)=prod_(i<n)(x+i+1). (s+3)!Q_s[j-r]=w(r)rise(s+3,j-r),r<=j. Fixedboundreflectiongivesproductat2j-h for h<=j. Weightsplit h>=1 preservesdistinctendpointsr0,rh with4h corrections;h0excludedfromsplit,notignoredglobally.',
 'finite_symbolic_sums':'Eleven power_sum_m m0..10 theorems forrange0..h provedbynaturalinduction/ring,notfiniteevaluation. Interiorexpansions realj/naturalh validunrestricted;finalsourcecoefficientbridges require1<=h<=j.',
 'fixed_zero':'closedA=720Q0Q2 coefficient2j-h,closedB=576Q1Q1 coefficient2j-h. Bothscaledbypositivefactorials. h=u+2,j=u+2+k givesclosedgap=(u+1)(u+2)(u+2k+11)*175termcore,strictpositiveforreal u,k>=0,degree18 stated. Noaudit expansion/evaluation.',
 'zero_assembly':'Naturalh-1 explicitlycast inacceptedfixed_zero_closed_gap. h>=2 ensuresh-1>=1 forbothformulaapplications. n<j inherited;uppern+1<2j viah2j-n;lastn2j-1separateafterj>0;j0adjacencyvacuous. Orderedall i<=n usespositiveproductinterval andbothtails,includingzeroentries.',
 'translated_margin':'q_zero_ordered fedtotranslated_zero_ratio, polynomialcomposition andcoeffzero products convertto liftTerm(j,1,0)^2*(completeLiftj0*completeLiftj2)[n] <= liftTerm(j,0,0)*liftTerm(j,2,0)*(completeLiftj1^2)[n]. s0only; notgeneralsharpmargin/sourceLC.',
 'residual':'h4/h5 plus179h2/h3 leavesh>=6; s0closed viafixedzero, s>=1remains. Exactiff withUpperAdjacent,sourceattachmentstillconditional.Originalraw/polygon/endpoints/otherdirectionsunchanged.'}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,'source_level_scope':residual,'proof_chain_details':proof,
 'literal_raw_indices':{'horizontal':['(i,q+k+1)','(i+1,q+k+1)','(i+2,q+k+1)']},'zero_and_endpoint_handling':'Endpointweight1 retainedatbothr0/rh forpositiveh;h0splitnotused;real/naturalh-1correctedversionexplicit;allnaturals0orderedzero-tailcoverage;j0andlaststepguarded;rootzeros/polygon/endpointsunchanged.'}
F={**base,'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'source_experiment':{'q_values':qs,'band_counts':dict(sc),'saved_unique_labels':labels,'saved_unique_label_count':48,'planned_append_slots':51,'random_paths_planned':18,'random_path_length':6,'random_seed_literal':180,'polygon_triple_counts':tc,'polygon_triples_total':sum(tc),'zeros_saved_only':5605,'saved':data['source-experiment.json'],'scope':'Bandidentity28deterministicactuala3labels169rows12488coefficients;polygon scanuses48saveddistinctlabels incl0/1,1/1andrandomvariedpaths. NoRNG/frame regeneration ornewrationalcoverageproof.'},
 'moment_probe':{'domain_count':mc,'j_values':'1..70','s_values':[0,1,2,3,5,10,30,100,1000],'h_values':'1..j','saved_failure_rows':4217,'saved_samples':data['moment-probe.json']['samples'],'saved_summary':{k:v for k,v in data['moment-probe.json'].items() if k!='failures'},'failures_not_recomputed':True,'display_truncation_qualification':'Worker prose reports displayed truncation; retained raw event46 contains the complete JSON matching moment-probe.json, including4217 failure rows. No loss of full retained stdout inferred.'},
 'drift_probe':{'domain_counts':dict(dc),'saved':data['drift-probe.json'],'grid_domain':'j2..34,h2..j,s0..34;19074consecutive-s comparisons andfourthmomentidentities;19635driftsignpositions withoutseparatecounter.','stress_domain':'400plannedrandomj6..250,h6..j,s0,1,2,10,100,1000,10000,seed180;noRNGregeneration.','limit_domain':'j2..120,h2..j;7140candidate limiting-kernel signs. Limitidentification anduniversalmonotonicity/sign remainunproved.'},
 'fixed_parameter':{'saved_probe':data['fixed-parameter-probe.json'],'stored_counts':polys,'saved_factorization':data['fixed-zero-factorization.json'],'stored_core_rows':175,'validation_domain_counts':dict(fc),'saved_validation':data['fixed-parameter-validation.json'],'validation_domain':'s0..2,j2..50,h1..j;A/Bformula7644;h>=2gap3675. Coefficients/signs/factorsnotrecomputed. Formalproofonlys0;experimentsats1/2notpromoted.','failed_run':'Initialtablem<=11 produceds0thenIndexErrorats1. Finalm<=15reruncompletedallthree. initial.pyislatereconstructionevent208,notcontemporaneoussnapshot. Savedbytes/summarys0comparisononly,noexperimentrerun.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'capabilities_record':data['capabilities-and-failures.json'],
 'invocation_limits':'SevennewPythonprogramsread/ASTparsedonly,includingtwocodegenerators. Generators/validatefixedzero top-levelwork;fixedparameterimportbuildsFaulhabertableevenwithmain-guardedrun. Noauditorimport/execution,coefficient/binomial/factorial/moment/gap/polynomial/value/sign orRNGrecomputation. Onlyindexdomains,storedlistlengths andliteralrecordscompared.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':savedversions,'named_inherited_result_inputs':inherited_results,'result_bindings':records,'imported_libraries':libs,'new_imported_libraries':newlibs,'imported_four_functions':four,'residual_binding':residual,'receipt_waiting':js(T/'markov_worker_000180_receipt_watch.json'),'all_named_new_match_current':True,'explicit_inherited_body_reads':reads,
 'audit_helper_corrections':['First static pass succeeded. Its literal JSON binding established complete moment-probe output in raw event46 despite worker prose describing displayed truncation. Audit-only wording corrected to distinguish display from retained raw output; no mathematical values recomputed or project reread.'],
 'read_scope_notes':['All12selectedsourcebodiesand7Pythonexperimental/generatorprogramsreadinfull;finalmathematics/correspondence/operational/nextread. Checkpointsidentityonly.','ReconstructedinitialPythonrecordcomparedliterallytofinalwithsole16to12rangechange;notexecutedandnotinvocationtimesnapshot.','Inheritedproofauditsreused;556sourceidentities,182pending/compiledonlyhistoricalstatuses;no oldbodyrecovery.179DetTestandweightsnotimplicitlyacceptedthroughnames.','Raw180validationrewrittenmodules/kernel_replays schema parsedasretained;actualcompiled/replay/axiom mapsindependentlybound. Noassumptionofpriorfinalizerpredicate.','Onlyclosed180archiveandexplicitnamedinherited/currentcounterparts. Active181+excluded. No project/math/checker/proof/replay/generator/experimentexecution orproposercontact/help.','Older sealed239opaquecopiesnotreindexedbynewtop-levelmanifest;presenthistoricalgscriptidentityusessealed179expectedhash evenwhenabsent180suffixmap/manifest. No historicalwindowupgrade.']}
for label,value in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 path=T/f'markov_worker_000180_{label}.json';assert not path.exists();path.write_text(json.dumps(value,indent=2,ensure_ascii=False)+'\n');print(path.name,path.stat().st_size,sha(path))
print(json.dumps({'band_counts':dict(sc),'triple_counts':tc,'moment_domain':mc,'drift_domains':dict(dc),'fixed_validation_domains':dict(fc),'event_bindings':{x['record']:{'full':[z['event'] for z in x['complete_saved_json_matches']],'projection':[z['event'] for z in x['projection_without_samples_matches']]} for x in event_bindings}},indent=2))
