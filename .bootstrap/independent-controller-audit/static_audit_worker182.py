"""Closed worker182: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000182';A=W/'artifacts';E=A/'evidence/markov-b3eed364'
REQUEST='b3eed36486ad48a08ac07be4c9b62794'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'kernel-1792223258039818000.json');axiom_records=[(p,js(p)) for p in sorted(E.glob('axioms-*.json'))]; axioms={'sources':{},'declarations':{}}
for p,d in axiom_records:
 for group in ['sources','declarations']:
  for key,value in d[group].items():
   if key in axioms[group]:assert axioms[group][key]==value
   axioms[group][key]=value
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['modules'])==set(replay['modules'])
base={'worker':182,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1650.6843659877777. Nine final mathematical modules compiled and jointly replayed,45 distinct theorem closures printed;10 rejected compiler attempts retained, one timeout. Earlier successful8-module replay and earlier successful template snapshot remain separate. Full root open.',
 'scope':'Archive-first closed182 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active183 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-b3eed364/'+module+'.olean';oh=binding(op)
 assert sh==validation['modules'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['modules'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in182':True,'printed_in182':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':45,'def':9} and len(axioms['declarations'])==45

prior=js(T/'markov_worker_000181_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed181_sha256':h,'initial182_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in182':False})
assert len(older)==len({x['path'] for x in older})==576
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in182':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==182
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
newlibs=[]
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint-1','checkpoint-2','correspondence','mathematics','next','operational']:
 rel='research/markov-b3eed364-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['probe_upper_b3eed364.py','source_experiment_b3eed364.py','top_symbolic_b3eed364.py','top_rr_b3eed364.py','generate_top_edge_b3eed364.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 elif rel in manifest:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'absent_from_initial_filter':rel not in before,'in_current_manifest':rel in manifest,'executed_by_auditor':False,'scope':'Historical identity only; current experiments explicitly import three_probe_9e205206 and same-round probe_upper/top_symbolic. No imports or execution by auditor.'})
assert len(inherited_scripts)==109
record_names=['source-experiment.json','upper-probe.json','top-symbolic.json','top-rr.json','top-edge-certificate.json','capabilities.json','literature.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-b3eed364/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines() if x.strip()]
event_bindings=[];decoder=json.JSONDecoder()
for n,value in data.items():
 if n in ['capabilities.json','literature.json']:continue
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
   if n=='top-symbolic.json' and obj=={k:v for k,v in value.items() if k!='rows'}:projection_matches.append(row)
   if n=='top-edge-certificate.json' and obj=={'scale':value['scale'],'terms':len(value['coefficients'])}:projection_matches.append(row)
 if n=='top-edge-certificate.json':
  for event_no,event in enumerate(events,1):
   item=event.get('item',{});out=item.get('aggregated_output','').strip()
   if out==repr({'scale':value['scale'],'terms':len(value['coefficients'])}):
    projection_matches.append({'event':event_no,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'format':'exact Python repr literal','whole_stdout':True})
 event_bindings.append({'record':n,'complete_saved_json_matches':matches,'projection_matches':projection_matches,'scope':'Literal saved JSON comparison only; no commands or imported source versions executed.'})
# Index-domain counts and literal saved-data comparisons only. No source polynomial,
# binomial, gap, root, certificate or RNG evaluation/imports.
qs=list(range(1,17))+[24,35,50];sc=Counter();tc=[0,0,0]
for q in qs:
 for r in [False,True]:
  sc['deterministic_source_labels']+=1
  for t in range(q+3):
   sc['rows']+=1;sc['coefficients']+=t+5
   sc['strict_edge_positions']+=t>=5
source=data['source-experiment.json'];labels=source['labels']
assert len(labels)==len(set(map(tuple,labels)))==55
for a,b in labels:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for z,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    tc[z]+=all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
assert sc['rows']==604==source['rows'] and sc['coefficients']==10156==source['coefficients']
assert sc['strict_edge_positions']==416==source['edge_strict'] and tc==source['raw_triples']
assert source['script_sha256']==sha(A/'research/source_experiment_b3eed364.py') and source['failures']==[]
sym=data['top-symbolic.json'];rr=data['top-rr.json'];upper=data['upper-probe.json'];cert=data['top-edge-certificate.json']
gaps=sum(t for t in range(3,23));savedgaps=sum(len(row['gaps']) for row in sym['rows'])
assert [row['t'] for row in sym['rows']]==list(range(3,23)) and len(sym['rows'])==20==sym['checked_rows']
assert gaps==250==sym['gap_polynomials'] and savedgaps==sum(range(3,11))==52
assert all(row['minimum_n']==3*row['t']-5 and [x[0] for x in row['gaps']]==(list(range(row['t'])) if row['t']<=10 else []) for row in sym['rows'])
assert sym['negative_coefficients']==[]
upper_positions=[(q,r,j) for q in range(1,11) for r in [False,True] for j in range((3*q+(1 if r else 2)+1)//2,3*q+(1 if r else 2)+3)]
assert len(upper_positions)==235==upper['rows']
assert rr['template_rows']==len(range(3,23))*len([0,1,2,5,20,100])==120
assert len(upper['non_real_rows'])==len(rr['source_nonreal'])==54
assert [row[:5] for row in upper['non_real_rows']]==rr['source_nonreal']
assert all(tuple(row[:3]) in upper_positions for row in upper['non_real_rows'])
assert upper['newton_failures']==rr['source_repeated']==rr['template_nonreal']==rr['template_repeated']==[]
assert len(upper['examples'])==sum(q<=3 for q,r,j in upper_positions)==39
assert all(tuple(row[:3]) in upper_positions and row[0]<=3 for row in upper['examples'])
# Reconstruct only the literal textual certificate from its retained integer strings;
# no multiplication, exponentiation, rational arithmetic or polynomial expansion.
assert cert['scale']==15 and len(cert['coefficients'])==25 and cert['all_nonnegative'] is True
terms=[]
for a,b,v in cert['coefficients']:
 assert re.fullmatch(r'[0-9]+',v)
 terms.append(v+(f'*s^{a}' if a else '')+(f'*d^{b}' if b else ''))
expr='+\n  '.join(terms);gapsrc=(A/'research/MarkovTopEdgeGapMB3E.lean').read_text()
assert gapsrc.count(expr)==2 and 'have he : 15*' in gapsrc
# Exact selected snapshot differences, preserved independently of theorem validity.
from difflib import unified_diff
prior_success=[]
for row in new:
 if row['earlier_successful_differing_source_versions']:
  for p,d in builds:
   if d.get('returncode')==0 and row['module'] in d['modules'] and d['modules'][row['module']]!=row['sha256']:
    oldsrc=p.with_suffix('.lean').read_text();newsrc=(A/row['path']).read_text();ds,ths,defs,bad=parse(oldsrc)
    prior_success.append({'module':row['module'],'snapshot':str(p.with_suffix('.lean').relative_to(A)),'sha256':sha(p.with_suffix('.lean')),'declarations':ds,'final_diff':''.join(unified_diff(oldsrc.splitlines(True),newsrc.splitlines(True),fromfile='superseded successful snapshot',tofile='final source')),'replayed_as_final':False,'scope':'Earlier compile is evidence for its own source only; both retained replays bind final source, which adds topDiagonalDeltaMB3E and changes topTemplate body.'})
assert len(prior_success)==1
oldmap={x['module']:x for x in older};reads=[]
readnames=['MarkovHalfPlaneM5BF','MarkovThreeRawM9E2','MarkovThreeSourceM9E2','MarkovSecondRowEquationMC3E','MarkovDiagonalRowsMDAB','MarkovLowDifferenceME9C','MarkovLowSourceME9C','MarkovRowOperatorsMFFD','MarkovThreeForceM96A']
for name in readnames:
 row=oldmap[name];reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'scope':'Explicit full body reread for source/root/recurrence/coefficient attachment; identity bound to sealed181 and initial182. No proof execution or old validation upgrade.'})
residual={
 'root_open':True,'new_unconditional_raw_LC_region':True,
 'root_equivalence':'Conjecture63 iff ThreeRemainingMB3E and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeRemainingMB3E','OtherFourM9E2','TopTemplateLCMB3E'],
 'new_unconditional_source_LC':'Every actual numerator-three source q>=1,b=3q+1(rtrue) or3q+2(rfalse), each depth5<=t<=q+2, rowj=b+2-t: strict rawH at columns1,2,3; non-strict startingi0 byrawcolumn0=0. No denominator bound or auxiliary premise. No general full-row LC.',
 'source_identity':'Allnatural t,i, q>=1,t<=q+2: raw source row atb+2-t equals denominator-only topTemplate(b,t); pathwrapper existentialq,r withall t,i. Finite topdepth rangej>=b-q to b+2; j>b+2 zero theorem separate.',
 'positive_formula':'topPositive(n,t,k) is coeff(k+3) under2t<=n, with explicit3<=s guard. Unconditional topPositive>=0; support0<topPositive iffk+3<=t under2t<=n. Whole-row support requires2t<=n,5<=t,3t<=n+5. Source attachment5<=t<=q+2 gives0<raw iff1<=i<=t, zerosi0ori>t.',
 'strict_first_generic':'For naturaln,t with2t<=n,3<=t,3t<=n+5:coeff1*coeff3<coeff2^2. This is broader than source range, not a source-family replacement.',
 'horizontal_residual':'Everyq>=1,r,i,j withq+3<j,b<2j+1,j!=5 and NOT(i<=1 andexists t,5<=t<=q+2,j=b+2-t), rawH at(i,j),(i+1,j),(i+2,j).',
 'vertical_residual':'Allnatural i,j outside ((i=3 or4) andj+1<=q) or(5<=i<=8 andj+2<=q), rawV(i,j),(i,j+1),(i,j+2), unchanged from181.',
 'diagonal_residual':'Allnatural i,j outside3<=i<=6 andj+2<=q, rawD(i,j+2),(i+1,j+1),(i+2,j), unchanged from181.',
 'other_four':'OtherFourM9E2 unchanged:every actual path with numerator>=4 requiresGlobalLC18. Root endpoints and earlier a1/a2 coverage inherited unchanged.',
 'conditional_full_top_LC':'TopTemplateLCMB3E forallnaturaln,t,n>=4,3t<=n+5,allnaturali, ordinaryrawtemplateHLC. No2t<=n premise in this definition. source_top_of_template proves sourceattachment forq>=1,t<=q+2 onlyconditionalonthisunprovedproposition.',
 'genuine_gain':'TopEdge source hypotheses forceq>=3. The saved full source range and polygon theorem identify an unbounded upper-edge family outside181 lowerhalfplane/lowerthreecorrections/row5; this is a static comparison of source guards, not a new auditor theorem or computed witness. Startingi0 is zero-handling and generally outside original polygon; stricti1 triple explicitlypolygonvalid.',
 'no_root_refutation':'54 nonreal source rows are finite stronger-property obstructions, not LC counterexamples; allrecordedrawLC tests pass. Jacobi identification andweighted-sum real-rootedness unformalized.',
 'prior_scope':'Allactuala2all3directions152; a3H2j+1<=b andj<=q+3,j5 retained. No newV/D result.',
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False}
proof={
 'source_equation':'rawRow is swapped polynomial coefficient; raw_row_coeff returns literal originalcoeff(i,j). source_rows_equation holdsallq,j bythree_raw_equation andguardedrowoperators. Upperforcingvanishes whenb<=j+q via gain supportq+(if r then1else2)<rowindex. No negative-exponent clipping. source_rows_above requiresq>=1 andb+2<j fromoriginalpolygon.',
 'template':'Top deptht0=1,t1=Delta(n,1)+4; higher signedrecurrence. Stronginductionusesb>=3q+1 andt<=q+2 tojustifyallNat.sub indexrewrites andtopzero boundary. No unprovedrecurrence/formulapremise.',
 'diagonal_sum':'Deltaandtemplateparameterrecurrences requiret<=n. Fourinstancesofinheritedrow_diagonal_operator andtwo-stepinduction yieldT(2t+d,t)=Delta(2t+d,t)+4doublePrefix allnaturald,t. Generaln substitutiond=n-2t requires2t<=n. Finiteweightedprefix includes s0..t-1 andretainsalllowdepthterms.',
 'coefficients':'Delta0=1,Delta1=-2+(n+2)X,Delta2=1-(n+1)X+choose(n+2,2)X². High coeffk+3 guard3<=t usesfib_delta_high underrow<n; lowcoeff0..2 vanishonly3<=t<=n+2. topPositive keeps3<=s guard, preventingfakeNat-sub terms s0,1,2.',
 'exceptional_columns':'top_edge_coeffs with2t<=n,t>=3: A0=0,A1=4(n+6-3t),A2=4(t-2)choose(n-2t+6,2); exactIntsub/cast explicitly justified. No positivityclaimfromsignedexpressionwithout3t<=n+5.',
 'telescope':'choose_prefix_general andchoose_weighted_general holdallnaturala,k,m viaPascalinduction; top_third_coeff splitsrange t at3, dropsonlyprovedzero s<3, reindexes s=3+u withm=t-3, retainsbothendpointsubtractions.',
 'certificate':'s=(t:Q)-3,d=(n:Q)+5-3t nonnegativefromguard; rationalchoosePolybridges toNatchoose useexplicitNatcastsub bounds.25integerliteralterms,scale15,constant7440. LeanringchecksidentityandpositivitycheckspositiveRHS; auditoronlycomparesliteralserialization, neverexpands/evaluates. StrictQgap transportsinjectivelytoInt;no sourcecoefficientnormalization.',
 'support':'Highsupport usesfirstpositivebinomialterm whenk+3<=t andallothertermsnonnegative; ifk+3>t allNatchoose vanish. Lowcolumns0,1,2 handledseparately. Fullsupportforall i statesnonnegativeandpositiveiff1<=i<=t; zero-tailusesbothparts. Smallt<5 notpromotedthroughthissupporttheorem; sourceidentitycoversthem.',
 'root':'TopEdgeRegion i<=1 plusdepthguard. i0 usesA0=0 andsquare_nonneg;i1 strictresultweakened. rootiff splitsTopEdgeRegion inold181Hclause; V/Dtuplescopiedverbatim. Bothremainingconjunctsunproved; allsource/endpoints inherited.',
 'scope_limit':'Positivebinomialformula andfiniteSturm experiments do notprovealltopcolumnsLC. NoJacobiLeanbridge, no unrestrictedreal-rootedness proof; literature ismachine-recordedonly,noindependentsearch.'}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'superseded_successful_snapshots':prior_success,'mathematical_values_recomputed':False,'source_level_scope':residual,'proof_chain_details':proof,
 'literal_raw_indices':{'horizontal_new':['(1,b+2-t)','(2,b+2-t)','(3,b+2-t)'],'horizontal_zero_start':['(0,b+2-t)','(1,b+2-t)','(2,b+2-t)'],'vertical_residual':['(i,j)','(i,j+1)','(i,j+2)'],'diagonal_residual':['(i,j+2)','(i+1,j+1)','(i+2,j)']},
 'zero_and_endpoint_handling':'Natural t<=q+2 withq>=1 prevents topindexunderflow; generalformula2t<=n needed. Explicit s<3zero guards; exceptionalcolumns0/1/2; supportpositivity1..t andalloutsidezeros. Smallq1/2 no new5<=t<=q+2edgecases, identitystillcovers;root0/1,1/1 unchanged.'}
F={**base,'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'source_experiment':{'q_values':qs,'domain_counts':dict(sc),'saved_unique_labels':labels,'saved_unique_label_count':55,'planned_append_slots':57,'random_paths_planned':14,'random_path_length':6,'random_seed_literal':182,'polygon_triple_counts':tc,'polygon_triples_total':sum(tc),'zeros_saved_only':2906,'saved':source,'scope':'38deterministica3labels,604rows,10156coefficients,416strictedgepositions.55savedunique broaderlabels inclendpoints;178664polygontriples.57plannedappends beforededup. Countsonly,no frame/polynomial/RNGconstruction. t0/1/2 sourceexperimentalformula includesexceptionalcases, notindependentformalproofbythisscript.'},
 'symbolic':{'depths':list(range(3,23)),'gap_domain_count':gaps,'saved_gap_polynomial_count':savedgaps,'saved_row_count':20,'coefficient_serialization_rows':sum(len(x['coefficients']) for x in sym['rows']),'gap_serialization_rows':sum(len(g) for row in sym['rows'] for i,g in row['gaps']),'saved':{k:v for k,v in sym.items() if k!='rows'},'scope':'250fixed-depth gap polynomials aftern=3t-5+d;52explicitgappolynomials savedfort3..10, noindividualgapsfort11..22.20rowcoefficientserializationssaved. Negative-listemptyreportedonly, no polynomialsignrecalculation/unbounded-tproof.'},
 'sturm_initial':{'planned_source_domain_count':len(upper_positions),'saved_rows':upper['rows'],'saved_nonreal_count':54,'saved_examples_count':39,'saved':upper,'scope':'q1..10,bothresidues,j=ceil(b/2)..b+2:235candidate rows, saved235nonempty aftertrim. Leading/trailingzero stripping anddegree<=14 Sturm filterdependoncomputedrow; auditorcannot independentlyauthenticatefiltereddegreecountwithoutprohibitedvaluework. Initialhelpercountsdistinctroots andcomparesdegree, potentiallymisclassifiesrepeats.'},
 'sturm_followup':{'planned_source_domain_count':len(upper_positions),'saved_filtered_source_rows':rr['source_rows'],'planned_template_positions':120,'source_nonreal_rows_literal_match_initial':True,'saved':rr,'scope':'FollowuprecursesonfinalSturmremainderforrepeatedfactors, strippingexteriorzerofactoronlyforrootcounts.232savedsourcechecksafterlen(row)<=15filter,3of235candidatepositionsomittedbydegreefilter;completefilteredcaselistabsent.54nonrealrowlabels/rootcounts matchinitialliterally;repeatedlists empty reportedonly.120templates t3..22,d0,1,2,5,20,100 atn=3t-5+d;no universality/rootLCrefutation.'},
 'edge_certificate':{'saved':cert,'terms_literal_count':25,'literal_polynomial_expression_occurrences_in_final_Lean':2,'scope':'Onlyliteralcoefficient/monomialstringscomparedagainstfinalLeanRHS. Nosymbolicgeneration/ringnormalization/signassessmentexecutedby auditor. RetainedsuccessfulLeanreceiptisformalvalidationauthority.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'capabilities_record':data['capabilities.json'],'literature_record':data['literature.json'],
 'invocation_limits':'Fivefinalprogramsfullread/ASTparsedonly;generatorhas top-levelcomputationandwrites,othersmain-guarded. Noauditorimports/execution, mathematicalcoefficient/binomial/polynomial/gap/Sturm/RNGrecomputation. Literatureclaimsretainedasworkerrecordonly;no freshsearch.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'named_inherited_result_inputs':[],'result_bindings':records,'imported_libraries':libs,'new_imported_libraries':newlibs,'imported_four_functions':four,'residual_binding':residual,'receipt_waiting':js(T/'markov_worker_000182_receipt_watch.json'),'all_named_new_match_current':True,'explicit_inherited_body_reads':reads,
 'audit_helper_corrections':['Preseal output binding refinement: generator event115 prints a Python dict repr, not JSON; added exact literal repr projection match without executing generator or recomputing certificate. Primary static pass had succeeded; no mathematics or project files changed.'],
 'read_scope_notes':['All9selectedLeanbodies and5finalPythonprograms readinfull;finalmathematics/correspondence/operational/nextfullread. Checkpointsidentityonly.','NineexplicitnamedinheritedLeanbodiesreread;576oldermathematicalidentitypins,182historicalpending/compiledonlystatuspins,109inheritedscriptidentitypins;no oldbodyreplay.','Raw182validationmodules/kernel_replays schema retained;actualsource/build/object/replay/axiomassociationschecked. Bothsuccessfulreplaysbindfinaltemplate;supersededcompilesourcepreserved.','NewunconditionalstrictupperedgeH;fullrowLC androotopen. Support/formulaisnotLC. No newV/Dscope.','Onlyindexdomaincounts/literalcertificatecomparison;filteredSturmcountsandvaluesnotrecomputed,randomdrawsnotregenerated.','Onlyclosed182archiveandexplicitnamedinherited/currentcounterparts;active183+excluded. No researchprogram/proof/checker/replay/experiment/finalizerexecution or proposerhelp/contact.']}
for label,value in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 path=T/f'markov_worker_000182_{label}.json';assert not path.exists();path.write_text(json.dumps(value,indent=2,ensure_ascii=False)+'\n');print(path.name,path.stat().st_size,sha(path))
print(json.dumps({'source_domains':dict(sc),'polygon_triples':tc,'symbolic_gaps':gaps,'saved_gaps':savedgaps,'upper_candidate_positions':len(upper_positions),'template_positions':120,'event_bindings':{x['record']:{'full':[z['event'] for z in x['complete_saved_json_matches']],'projection':[z['event'] for z in x['projection_matches']]} for x in event_bindings}},indent=2))
