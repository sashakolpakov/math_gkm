"""Closed worker181: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000181';A=W/'artifacts';E=A/'evidence/markov-5bf6837d'
REQUEST='5bf6837d0c5b4b818f68c99f57ad498a'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'kernel-1792221517779394000.json');axiom_records=[(p,js(p)) for p in sorted(E.glob('axioms-*.json'))]; axioms={'sources':{},'declarations':{}}
for p,d in axiom_records:
 for group in ['sources','declarations']:
  for key,value in d[group].items():
   if key in axioms[group]:assert axioms[group][key]==value
   axioms[group][key]=value
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['modules'])==set(replay['modules'])
base={'worker':181,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1063.704658985138. Eight final mathematical modules compiled and jointly replayed,39 distinct theorem closures printed;7 rejected compiler attempts retained. Full root open.',
 'scope':'Archive-first closed181 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active182 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-5bf6837d/'+module+'.olean';oh=binding(op)
 assert sh==validation['modules'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['modules'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in181':True,'printed_in181':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':39,'def':8} and len(axioms['declarations'])==39

prior=js(T/'markov_worker_000180_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed180_sha256':h,'initial181_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in181':False})
assert len(older)==len({x['path'] for x in older})==568
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in181':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==182
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
newlibs=[]
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint-1','checkpoint-2','checkpoint-3','correspondence','mathematics','next','operational']:
 rel='research/markov-5bf6837d-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['probe_outward_5bf6837d.py','probe_drop_5bf6837d.py','source_experiment_5bf6837d.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 elif rel in manifest:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'absent_from_initial_filter':rel not in before,'in_current_manifest':rel in manifest,'executed_by_auditor':False,'scope':'Historical identity only. Explicit source experiment dependencies are three_probe_9e205206,source_experiment_6576ccc5,source_experiment_9647c1ba; no imports or execution.'})
assert len(inherited_scripts)==106
record_names=['source-experiment.json','outward-probe.json','outward-probe-initial.json','drop-probe.json','capabilities.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-5bf6837d/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines() if x.strip()]
event_bindings=[];decoder=json.JSONDecoder()
for n,value in data.items():
 if n=='capabilities.json':continue
 matches=[];projection_matches=[]
 for event_no,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output','')
  for start in re.finditer(r'(?m)^[ \t]*([\[{])',out):
   pos=start.start(1)
   try:obj,end=decoder.raw_decode(out,pos)
   except (ValueError,TypeError):continue
   row={'event':event_no,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'start_character':pos,'end_character':end,'whole_stdout':out.strip()==out[pos:end]}
   if obj==value:matches.append(row)
   if n=='source-experiment.json' and obj=={k:v for k,v in value.items() if k!='labels'}:projection_matches.append(row)
   if n=='outward-probe.json' and obj==({k:v for k,v in value.items() if k!='failures'}|{'failure_count':len(value['failures'])}):projection_matches.append(row)
 event_bindings.append({'record':n,'complete_saved_json_matches':matches,'projection_matches':projection_matches,'scope':'Literal saved JSON comparison only; no commands or imported source versions executed.'})
# Index-domain counts only; no polynomial, kernel, moment, gap or sign evaluation.
qs=list(range(2,16))+[24,35,50];sc=Counter();tc=[0,0,0]
for q in qs:
 for r in [False,True]:
  b=3*q+(1 if r else 2);sc['deterministic_band_source_labels']+=1
  for k in range((q-(2 if r else 1))//2+1):
   d=q-2*k-(2 if r else 1);j=q+k+1;assert d>=0 and 2*j+1<=b
   sc['rows']+=1;sc['coefficients']+=b+6
labels=data['source-experiment.json']['labels'];assert len(labels)==len(set(map(tuple,labels)))==52
for a,b in labels:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for z,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):tc[z]+=all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
assert sc['rows']==228==data['source-experiment.json']['rows'] and sc['coefficients']==18334==data['source-experiment.json']['coefficients'] and tc==data['source-experiment.json']['raw_triples']
initial=data['outward-probe-initial.json'];finalout=data['outward-probe.json'];grid=[(j,s,h) for j in range(2,40) for s in [0,1,2,7,25,1000] for h in range(1,j+1)]
assert len(grid)==4674 and len(initial['failures'])==initial['cases']==4774
assert all(len(row)==5 and row[0]=='moment' and isinstance(row[4],list) and len(row[4])==5 for row in initial['failures'])
case_labels=[tuple(row[1:4]) for row in initial['failures']];assert case_labels[:4674]==grid
random_saved=case_labels[4674:];assert len(random_saved)==100 and all(40<=j<200 and 0<=s<100 and 1<=h<=j for j,s,h in random_saved)
oc=Counter()
for j,s,h in case_labels:
 oc['cases']+=1;oc['birth_checks']+=h;oc['radial_checks']+=h-1;oc['identities']+=2
assert all(oc[k]==initial[k]==finalout[k] for k in oc)
gridcounts=Counter()
for j,s,h in grid:
 gridcounts['cases']+=1;gridcounts['birth_checks']+=h;gridcounts['radial_checks']+=h-1;gridcounts['identities']+=2
assert finalout['failures']==[]
drop=sum(1 for j in range(2,101) for s in [0,1,2,5,10,30,100,1000] for h in range(1,j+1));assert drop==40392==data['drop-probe.json']['checks'];assert len(data['drop-probe.json']['failures'])==20
rel='evidence/markov-5bf6837d/outward-probe-initial.py';initialsrc=(A/rel).read_text();ast.parse(initialsrc);finalsrc=(A/'research/probe_outward_5bf6837d.py').read_text()
changed=initialsrc.replace('S,T,v=moments(f,h);P,U,u=moments(f,H)','S,_,v=moments(f,h);P,_,u=moments(f,H);T=S*v;U=P*u').replace('print(json.dumps(out))',"print(json.dumps({k:v for k,v in out.items() if k!='failures'}|{'failure_count':len(out['failures'])}))")
assert changed==finalsrc
savedversions=[{'path':rel,'sha256':binding(rel),'status':'saved initial outward helper interpretation; exact two textual edits produce final script','invocation_chronology':'Initial execution98; explicit byte copies107/108 before edit109/111 and corrected rerun112/113. Saved pre-edit copies, not later reconstruction; no compiler/process authentication beyond retained events.','executed_by_auditor':False}]
oldmap={x['module']:x for x in older};reads=[]
for name in ['MarkovUpperReductionMA45','MarkovThirdClosedM964','MarkovThreeSourceM9E2','MarkovThreeRawM9E2','MarkovSharpTransportMBE3']:
 row=oldmap[name];reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'scope':'Explicit full body reread for current source/root attachment; source identity bound to sealed180 and initial181. No proof execution or old validation upgrade.'})
residual={'root_open':True,'new_unconditional_raw_LC_region':True,'new_unconditional_source_estimate':False,
 'root_equivalence':'Conjecture63 iff ThreeUpperResidualM5BF and OtherFourM9E2','remaining_predicates_unproved':['ThreeUpperResidualM5BF','OtherFourM9E2'],
 'UpperAdjacentMA45_proved':True,'PositiveParameterTailM1C6_proved':True,'UnshiftedAdjacentM09F_proved':True,'UnshiftedRatioM09F_proved':True,'SharpCompleteMargin_proved':True,
 'new_unconditional_auxiliary_results':'Variance drift strictly positive for all natural j,s,h with1<=h<=j; strict reversed adjacent comparison in same domain. Radial covariance and exact mass/moment transport retain both exterior endpoints.',
 'new_unconditional_source_LC':'Every path with frame.mid.a=3, every natural i,j with2*j+1<=frame.mid.b: raw horizontal LC at(i,j),(i+1,j),(i+2,j), zeros retained. No denominator bound or auxiliary premise.',
 'full_band':'Natural q,k,i, Bool r, q>=2 and2*(q+k+1)+1<=sourceN(q,r); all i. FullBandRegion(q,r,i,j):q>=2,q<j,2*j+1<=sourceN; independent of i.',
 'source_residues':'rfalse:N=3q+2; rtrue:N=3q+1, actual path false^(q-1)++[true,r]. All actual a3 classified withq>=1. q1 handled by inherited lower/three corrections in half-plane theorem.',
 'horizontal_residual':'For every q>=1,r, allnatural i,j withq+3<j,sourceN<2*j+1,j!=5, rawH inequality. Both endpoints source0/1,1/1 and a1/a2 coverage inherited unchanged.',
 'vertical_residual':'Allnatural i,j outside ((i=3 or4) andj+1<=q) or(5<=i<=8 andj+2<=q), rawV(i,j),(i,j+1),(i,j+2).',
 'diagonal_residual':'Allnatural i,j outside3<=i<=6 andj+2<=q, rawD(i,j+2),(i+1,j+1),(i+2,j).',
 'other_four':'OtherFourM9E2 unchanged:every actual path with numerator>=4 requiresGlobalLC18. No all-source root completion.',
 'formal_auxiliary_obstruction':'Quarter-drop v(h-1)<=v(h)+1/4 false atj22,s5,h22; exact variance constants and negative difference retained, required drift positive. Not a source counterexample.',
 'strictness_limit':'Strict only for auxiliary drift/reverse gap; raw source conclusion non-strict and includes zero entries.',
 'actual_raw_source_counterexample':False,'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,
 'prior_source_scope':'Allactuala2all3 directions152 retained; a3Hj<=q+3 andj5 inherited. New entireband removes175prefix/tail column restrictions; no newV/D claim.'}
proof={
 'birth':'Natural j,r; r0 exceptional4j. Forr>0 rate=j-r-1+j/r=(r+1)(j-r)/r. Exact(N-r)K(r+1)=birth(r)K(r) onlyr<j; falling-factorial denominators positive. No division byzero r0.',
 'radial':'B(t)=birth(t)+birth(H-t). Reflectiont<=H. EndpointH>0:5j-H-1+j/H. Interior0<t<H:2j-H-2+jH/[t(H-t)]. Radial order proved for arbitrary naturalj,H andt,u<=H ordered bysquaredcenter distance; endpoint cases split, H0 covered.',
 'covariance':'Generic finiteN, w>=0, b monotone on x-order. Expand double sum w_i*w_k*(x_i-x_k)*(b_i-b_k)>=0; yields(sumwx)(sumwb)<=(sumw)(sumwbx), no probability assumption/division. N0 allowed.',
 'outward_sum':'Identity for anynaturalH,real y,functionf:Nat->Real,F:Real->Real. Split first andlast indices ofrangeH+2, retain two external endpoint terms. ReindexH+1-(t+1)=H-t under t<=H; no endpoint deletion.',
 'rates_to_moments':'ForH<j, rateMassR+E=2zS_(H+1), rateMomentQ+E*(H/2+1)^2=2(z+1)T_(H+1)+(z/2)S_(H+1); E=2(s+j+4)K0K_(H+1). Rate covariance holdsH<=j via positivekernelweights.',
 'drift':'Previousvariancebound v_H<=H^2/4 andpositiveS_H giveT_H<=S_H*(H/2+1)^2; E>=0 permits addingoutsidecontribution. Momentidentity andpositive masses implyD>=0. StrongerE>0 and strict square bound giveD>0 for all1<=h<=j includingh1/H0. Naturalh-1 cast/integerbounds retained.',
 'strict_gap':'reverse_gap_drift plusmoment_variance identity cancelpositive y^3(y+1),(2z+1) andbothmasses. B_h A_(h-1)<B_(h-1)A_h for1<=h<=j; sourceLC not claimedstrict.',
 'auxiliary_assembly':'D>=0 closesPositiveParameterTail; its exactiff yieldsUpperAdjacent, thenUnshiftedAdjacent/Ratio andSharpCompleteMargin. Inherited low/cutoff/final/zero-tail orderedtransport used with actualprovedglobalpremise.',
 'source_attachment':'source_band_of_upper inherited transport now applied toclosedUpperAdjacent; actualcubic/sourceclassification andrawcoefficient identity retained, no normalization orformula assumption. Nonnegative exponent2j+1<=N remains; noNat-truncation extension to upperrows.',
 'half_plane':'Ifj<=q+3 use inherited lower_and_three_corrections; otherwise rowguardforcesq>=2 byexplicit bothresidue arithmetic, thenfullband. Everyactualpath mappedvia source_three_raw, q>=1 andbothresidues. Allnaturali inclsupportzeros.',
 'root':'Two exactiffs fromroot_iff_beyond_thirdM964; fullband excludedorproved; transparentresidualsplits2j+1<=N vsN<2j+1. Vertical/diagonal tuple copied verbatim. Hremainingq+3<j,j!=5; otherfour unchanged. No residualproof.',
 'obstruction':'Norm_num certificates bind v(22,5,21)=2668474283/272959244, v(22,5,22)=4129805/433571, quarterdropfails and actualD=281228064706395/29586803095081>0; auxiliaryonly, no auditedvaluecalculation.'}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,'source_level_scope':residual,'proof_chain_details':proof,
 'literal_raw_indices':{'horizontal':['(i,j)','(i+1,j)','(i+2,j)'],'vertical_residual':['(i,j)','(i,j+1)','(i,j+2)'],'diagonal_residual':['(i,j+2)','(i+1,j+1)','(i+2,j)']},'zero_and_endpoint_handling':'r0birth4j,w0=1;H0/h1 strictcomparison;bothoutsideendpointsEpositive;allnaturalsourcecolumnszero tails inherited. q1smallcases via lowerrows; root0/1,1/1 andoriginalpolygon unchanged.'}
F={**base,'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'source_experiment':{'q_values':qs,'band_counts':dict(sc),'saved_unique_labels':labels,'saved_unique_label_count':52,'planned_append_slots':57,'random_paths_planned':18,'random_path_length':6,'random_seed_literal':181,'polygon_triple_counts':tc,'polygon_triples_total':sum(tc),'zeros_saved_only':8181,'saved':data['source-experiment.json'],'scope':'34 deterministic a3labels228bandrows18334coefficients;52savedunique broaderlabels includingendpoints,170491polygon triples. Countsonly, noframe/polynomial/RNG reconstruction.'},
 'outward_probe':{'initial_saved':{k:v for k,v in initial.items() if k!='failures'},'initial_failure_count':len(initial['failures']),'stdout_scope':'Raw event98 contains complete initial JSON despite displayed truncation prose; final113prints failure-list-free summary withcount0.','initial_case_labels':case_labels,'deterministic_grid_counts':dict(gridcounts),'initial_saved_domain_counts':dict(oc),'initial_saved_random_case_labels':random_saved,'final_saved':finalout,'domain':'Gridj2..39,s0,1,2,7,25,1000,h1..j,4674cases plus100seed181 randomcasesj40..199,s0..99,h1..j. Initialfailurelist containsall4774parametertriples; prefixmatchesgrid andsavedtailprovidesrandomdomaincounts withoutRNG.','random_final_scope':'Finalscript same randomloop/seed literals andsamecounters; no finalper-case labels saved. Initial labels/counters do not independently authenticate exact finalrandomdraw sequence. No moment/identity/sign recomputation.','helper_error':'Inheritedmoments returns(S,sum r(h-r)weights,variance). Initial mistakenlytreatedsecond ascenteredmoment. Final usesT=S*v,U=P*u; savedinitialall4774moment failures vsfinalnone; no failedtest promoted.'},
 'drop_probe':{'domain_count':drop,'domain':'j2..100,s0,1,2,5,10,30,100,1000,h1..j','saved':data['drop-probe.json'],'saved_failure_limit':20,'scope':'40392indexpositions;first20failuresonly, nottotalfailurecount. Exactvalues/minimum savedonly, no recomputation.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'capabilities_record':data['capabilities.json'],
 'invocation_limits':'ThreefinalPythonprogramsandinitialoutwardscriptread/ASTparsedonly. probe_drop executes top-level loopifimported; outward/source main guarded; inheritedmoments fullsource reread. Noauditorimports/execution. No kernel/variance/binomial/polynomial/coefficient/gap/sign/RNG recomputation.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':savedversions,'named_inherited_result_inputs':[],'result_bindings':records,'imported_libraries':libs,'new_imported_libraries':newlibs,'imported_four_functions':four,'residual_binding':residual,'receipt_waiting':js(T/'markov_worker_000181_receipt_watch.json'),'all_named_new_match_current':True,'explicit_inherited_body_reads':reads,
 'audit_helper_corrections':[],
 'read_scope_notes':['All8 selected Lean bodies and3 finalPythonprograms+initialoutwardscript readinfull; finalmathematics/correspondence/operational/nextread. Checkpointsidentityonly.','Five explicitly named inheritedLean bodies reread; inheritedprobe_moments fullread provesreturntupleinterpretation.568oldermathematicalidentitypins,182historicalpending/compiledonlystatuspins;no oldbodyreplay.','Raw181 validationmodules/kernel_replays schema retained; actualsource/build/object/replay/axiom associationschecked. No assumedfinalizerpredicate.','Source/proofclaimsgainunconditionalrawHhalfplane butfullrootandV/D/otherfourremainopen. Strictauxiliaryonly.','Initialfailurecase labels usedonlyforindexdomaincounts;finalrandomdrawsnotregenerated/independentlyidentified. No mathematicalvalues computed.','Onlyclosed181 archive andexplicitnamedinherited/currentcounterparts;active182+excluded. No researchprogram/proof/checker/replay/experiment/finalizer execution orproposerhelp/contact.']}
for label,value in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 path=T/f'markov_worker_000181_{label}.json';assert not path.exists();path.write_text(json.dumps(value,indent=2,ensure_ascii=False)+'\n');print(path.name,path.stat().st_size,sha(path))
print(json.dumps({'band_counts':dict(sc),'triple_counts':tc,'outward_counts':dict(oc),'grid_counts':dict(gridcounts),'drop_domain':drop,'event_bindings':{x['record']:{'full':[z['event'] for z in x['complete_saved_json_matches']],'projection':[z['event'] for z in x['projection_matches']]} for x in event_bindings}},indent=2))
