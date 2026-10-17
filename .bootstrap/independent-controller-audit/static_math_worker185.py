"""Static audit only: hashes, declaration/literal parsing and finite index counts.
Never imports or executes research modules or recomputes mathematical values/RNG.
"""
from pathlib import Path
import json,re,hashlib,datetime,ast
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000185';A=W/'artifacts';E=A/'evidence/markov-dcb64029';pins={}
def pin(p):
 p=Path(p);b=p.read_bytes();z=dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest());pins[str(p)]=z;return z
def text(p):pin(p);return Path(p).read_text()
def js(p):return json.loads(text(p))
def dump(n,d):
 p=T/('markov_worker_000185_'+n+'.json');p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
v=js(E/'validation.json');mods=js(E/'mathematical-modules.json');receipt=js(W/'receipt.json');watch=js(T/'markov_worker_000185_receipt_watch.json');primary=js(T/'markov_worker_000185_primary_source_pins.json');events=[json.loads(s) for s in text(W/'events.jsonl').splitlines()]
base=dict(worker=185,request='dcb6402998ac4eed9feb37199e0f0cee',created_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),historical_status='completed0, delivered report, mathematical_resolution false',scope='Closed185 archive-first static review only; no later-worker reads, project execution, mathematical-value computation, source edits or proposer assistance.',mathematical_values_recomputed=False)
modules=[]
for m in mods:
 p=A/'research'/(m+'.lean');s=text(p);sp=pin(p);br=A/v['successful_builds'][m];b=js(br);snap=pin(br.with_suffix('.lean'));assert sp['sha256']==snap['sha256']==v['modules'][m]==b['modules'][m] and b['returncode']==0
 assert next(x['sha256'] for x in primary['files'] if x['module']==m)==sp['sha256']
 decl=[];starts=list(re.finditer(r'(?m)^(?:private\s+)?(theorem|lemma|def|abbrev|axiom|opaque)\s+(\S+)',s))
 for ix,z in enumerate(starts):
  end=starts[ix+1].start() if ix+1<len(starts) else len(s);body=s[z.start():end]
  decl.append(dict(kind=z[1],name=z[2],line=s.count('\n',0,z.start())+1,header=body.split(':=',1)[0].strip(),body_sha256=hashlib.sha256(body.encode()).hexdigest()))
 modules.append(dict(module=m,source_pin=sp,project_relative_source='research/'+m+'.lean',imports=re.findall(r'(?m)^import\s+(\S+)',s),declarations=decl,theorem_count=sum(x['kind'] in ('theorem','lemma') for x in decl),definition_count=sum(x['kind'] in ('def','abbrev') for x in decl),successful_build=pin(br),build_snapshot=snap,admission_literal_tokens=re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s))))
counts=dict(selected_modules=len(modules),theorems=sum(m['theorem_count'] for m in modules),definitions=sum(m['definition_count'] for m in modules));assert counts==dict(selected_modules=9,theorems=51,definitions=25)
scope={
 'source_family':'All actual a=3 generated paths represented by q>=1 and Bool residue, b=3q+1(true) or3q+2(false), exact threeRawM9E2 via inherited source_three_rawM9E2. No new source formula premise.',
 'new_raw_edges':'At rowj=b+2-t: strict H startt-3 for6<=t<=q+2; strict H startt-4 for7<=t<=q+2. Allq>=1,bothresidues. Generictemplate requires2t<=n withsame tminimum; no3t<=n+5neededforindividualnewedge.',
 'whole_depths':'source_top_depths_through_eightMDCB quantifies allnaturali with5<=t<=8,t<=q+2,q>=1,bothresidues; allzero positions andtails retained. Exactnewtheorem startsatdepth5; do not paraphrase italone as0<=t<=8.',
 'polygon':'source_top_new_tail_polygonMDCB gives t-4<=i<=t-1 for t>=7. At t=6 the r3triple coincides with oldfirsthightriple and inheritedpolygoniff applies. No validtriple omitted.',
 'denominator_free':'tailNum productj<k(i+j+1)(d+2i+j+9);tailDen productj<r(j+1)(d+i+j+6);tailRest productk<=j<r denominatorfactors;tailTerm=tailNum*tailRest. Definedforintegeri,d; scaledkernel/source identitiesfornatural d,i,r,k withk<=r asneeded.',
 'mass_scaling':'AtT=i+r, D Mass_i=A K_i(i),D S_i Mass_i+1=E K_i(i),D S_i S_i+1 Mass_i+2=C K_i(i). L_r=f(r)+4sumk<r(r-k)f(k);A=L(V),E=L(k(d+2i+k+9)V),C=L(k(k-1)(d+2i+k+9)(d+2i+k+10)V). Allparametersnatural,includingr0/1andkernelzeros.',
 'gap_equivalence':'D^2 S_i^2 S_i+1*(Mass_i+1^2-Mass_i Mass_i+2)=K_i(i)^2*G_r(i,d),G=(i+2)(i+5)E^2-(i+1)(i+4)AC. D,scales,baseKpositive explicitly. Bothstrict/nonstrictiff universal in naturald,i,r; no divisionbyrawmass andno positive-supportfilter.',
 'tail_certificates':'r3and4 strict G for allintegeri,d>=0 by117and176literaltermpositive expansions; transfer tonaturalmasses andrawsource. Genericallr gap signnotproved.',
 'tail_residual':'TopMomentBoundM55C iffTopTailResidualMDCB:forallnatural d,i,r,1<=i,5<=r,i+r<=d+2 imply0<=G_r(i,d). Proofforward/reverse retainsi0,r2,r3,r4dischargedbranches; interiori+2<=Tforcesr>=2. Newresidualunproved.',
 'polynomial_condition':'Two-variableintegerBiPoly evaluates exactlytoG atallnatural i,d,r. TailCoefficientPositiveMDCB forallr>=5,alla,b rawpolynomialcoeff>=0 impliesTopTailResidual,TopMomentBound andactualsourceallstarts5<=t<=q+2. Hypothesisunproved,onlysufficient,notnewrootiff.',
 'likelihood':'Realqseq q0=1,q(k+1)=qk*(d+2i+k+9)/(d+i+k+6),positiveallnatural d,i,k. w=1 atk=r,4(r-k) fork<r,0 beyond. Both CrossLC andnonnegativeproduct; beta_likelihood_inward onlysingleinwardstep2k+1<=m. No completed covariance/globalgap/sourceadapter theorem.',
 'beta_moments':'Integer betaMoment sumk0..m choose(i+k,i)choose(i+m-k,i)*(k descendingfactorialu)*((m-k) descendingfactorialv). Allnatural indices. Explicitconvolutionformula form=u+v+N; zerofor m<u+v. BetaCleared gives universalclearedandrealnormalizedformula includingzeroorders/oversizedorders; masschoose(2i+m+1,2i+1)>0 anddenominator descendingfactorial(2i+1+u+v,u+v)>0.',
 'beta_scalar':'21literalterms proveinteger betaGap(a,m,H)>0 for a>=1,m>=2,H>=3a+2m+5. Tailparameteradapter formallyassumesi+4r<=d+1,2<=m<=2r, concludesonly betaGap>0,notactualMassgap.',
 'unformalized_beta':'Written proposed d>=i+4r-1 / d>=4T-1 / n>=6t-13 sourcecutoff isnotformal in185. Missingexpectationassembly,covariancecomparison,symmetrizedactualgapidentityandsourceattachment areexplicitlyrecorded. Noauditproofcompletion ormathematicalassessmentofthatwrittenroute.',
 'root':'Conjecture63 iffThreeFrontierMDCB andOtherFourM9E2; bothopen. TopClosedRegion extends184 bynewtailstarts. Previous184depth-dependentdenominatorbound retained unchanged.',
 'horizontal_residual':'forallq>=1,r,i,j withq+3<j,b<2j+1,j!=5,notTopClosedRegionMDCB =>rawH.',
 'vertical_residual':'Unchanged exclusion((i3or4 andj+1<=q)or(5<=i<=8 andj+2<=q));allnaturalstarts.',
 'diagonal_residual':'Unchanged exclusion3<=i<=6 andj+2<=q;literal(i,j+2),(i+1,j+1),(i+2,j).',
 'guards':'Originalroot/rawcoefficient/polygon/naturalzero/endpoints unchangedthrough exactprior184rootiff. No coefficientnormalizationtarget,probabilityreplacement ordiscardedzero.',
 'auxiliary_failures':'Parametergap-ratiomonotonicitybothdirections,strongerNewton/factorialLC andpositiveantidiagonalpiece shortcuts fail inretainedfiniteexperiments. r11,i0,d0,m3 negativeconstantpiece isoutsidesourcesectorT=i+r<=d+2; notactualrawrootrefutation.',
 'inherited_limits':'Worker183 remains historically uncertain with no replay. Worker184 separately recovered all ten modules/54 closures; worker185 imports nine of those bodies, with TopObstructionsM55C absent, and supplies no new recovery. Old121212 including195, separate19, WindowLC/Abel,166 seven unreplayed prefixes,171 failed report and180 source-version limits remain. No fresh whole-source rebuild/root completion.'}
structure={**base,'modules':modules,'counts':counts,'source_level_scope':scope,'literal_indices':dict(H=['(i,j)','(i+1,j)','(i+2,j)'],V=['(i,j)','(i,j+1)','(i,j+2)'],D=['(i,j+2)','(i+1,j+1)','(i+2,j)']),'zero_boundaries':['Masscolumnshift discards only s<i<=i+j kernelzeros; remainingfiniteweightendpointretained.','C usesintegerk(k-1);k0/1terms vanish throughfactors/chooseidentities, no unguardednatural-subtraction replacement.','Emptyproductsr0positive1;signiffincludesdegeneratecaseswithoutclaimingstrictpositivitythere.','Newsourcebounds t6/7 justifyallNatsub rewrites; allstartsdepth5..8useslowcolumns/firsthigh/oldlast/newtails/rightzeros.','Momentordersabove m split explicitlyzero; normalizationdividesonlyprovenpositiveauxiliarymass/denominator.']}
source=js(E/'source-experiment.json');qvals=list(range(1,25))+[37,61];rows=sum(2*(q+3) for q in qvals);coef=sum(2*sum(t+4 for t in range(q+3)) for q in qvals);tails=[(q,z,t,rr,t-rr) for q in qvals for z in [False,True] for t in range(q+3) for rr in [3,4] if t>=rr+3];identity=sum(1 for d in range(10) for i in range(15) for r in range(13));triples=[0,0,0]
for a,b in source['labels']:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for k,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):triples[k]+=1
assert [rows,coef,len(tails),identity,triples]==[source['rows'],source['coefficients'],source['new_tail_triples'],source['tail_identity_checks'],source['raw_triples']]
gen=js(E/'tail-polynomial-probe.json');stress=js(E/'tail-polynomial-stress.json');poly=gen['cases']+stress['cases'];assert [x['r'] for x in poly]==list(range(2,41));slots=sum(x['terms'] for x in poly);assert slots==147225
ant=js(E/'tail-antidiagonal-probe.json');assert [x['r'] for x in ant['cases']]==list(range(2,13));assert all([g['m'] for g in x['groups']]==list(range(2*x['r']+1)) for x in ant['cases']);groupcount=sum(len(x['groups']) for x in ant['cases']);witness=next(g for x in ant['cases'] if x['r']==11 for g in x['groups'] if g['m']==3)
param=js(E/'top-parameter-probe.json');paramcount=sum(len(set([0,1,2,t-2,t,2*t,10*t])) for t in range(2,51) for i in range(t-1));assert paramcount==param['cases']
weight=js(E/'weight-polynomial-probe.json');weightcount=sum(4 for t in range(2,50) for i in range(t-1));assert weightcount==weight['cases']
beta=js(E/'beta-comparison-probe.json');domains=[(i,r,d,m) for i in range(9) for r in range(2,18) for d in sorted(set([0,max(0,i+r-2),i+4*r-1,i+4*r+9])) for m in range(2,2*r+1)];radial=sum(m//2 for i,r,d,m in domains);groups=sum(d>=i+4*r-1 for i,r,d,m in domains);assert [len(domains),radial,groups]==[beta['moment_checks'],beta['radial_pairs'],beta['group_checks']]
certs=[]
for rr in [3,4]:
 c=js(E/f'tail-{rr}-certificate.json');s=text(A/'research'/f'MarkovTopTail{rr}MDCB.lean');expr=s.split('have he :',1)[1].split(':= by',1)[0].split('=',1)[1];ts=expr.strip().split('+');out=[]
 for term in ts:
  z=re.fullmatch(r'\s*(\d+)(?:\*i\^(\d+))?(?:\*d\^(\d+))?\s*',term);assert z,term;out.append([int(z[2] or 0),int(z[3] or 0),z[1]])
 assert out==c['coefficients'] and len(out)==c['terms'];assert 'rw [he]\n positivity' in s
 certs.append(dict(result_pin=pin(E/f'tail-{rr}-certificate.json'),terms=len(out),constant_literal=out[0],literal_terms_match_source=True,positive_decimal_literal_strings=all(re.fullmatch('[1-9][0-9]*',x[2]) is not None for x in out),recomputed=False))
c=js(E/'beta-scalar-certificate.json');s=text(A/'research'/'MarkovTopBetaScalarMDCB.lean');expr=s.split('have he :',1)[1].split(':= by',1)[0].split('=',1)[1];out=[]
for term in expr.strip().split('+'):
 z=re.fullmatch(r'\s*(\d+)(?:\*x\^(\d+))?(?:\*y\^(\d+))?(?:\*z\^(\d+))?\s*',term);assert z,term;out.append([[int(z[k] or 0) for k in [2,3,4]],int(z[1])])
assert out==c['coefficients'] and len(out)==c['terms']==21
certs.append(dict(result_pin=pin(E/'beta-scalar-certificate.json'),terms=21,constant_literal=out[0],literal_terms_match_source=True,recomputed=False))
inline=[]
for ix,e in enumerate(events):
 it=e.get('item',{});cmd=it.get('command','')
 if e['type']=='item.completed' and any(z in cmd for z in ['weight-polynomial-probe','tail-polynomial-stress']):inline.append(dict(event=ix+1,command=cmd,stdout=it.get('aggregated_output',''),returncode=it.get('exit_code')))
finite={**base,'source':dict(result=source,q_domain=qvals,family_count=52,rows_recounted=rows,coefficient_positions_recounted=coef,tail_identity_parameter_cases=identity,expressions_per_identity_case=4,new_tail_calls_recounted=len(tails),distinct_tail_parameter_positions=len(set(tails)),polygon_triples_recounted=triples,total_polygon_triples=sum(triples),saved_labels=len(source['labels']),unique_saved_labels=len(set(map(tuple,source['labels']))),saved_zeros_not_recomputed=3652,random_paths_regenerated=False),'polynomial':dict(generator_result=gen,stress_result=stress,cases=39,serialized_term_count_sum=slots,scope='Saved nonzero-term counts aggregated only; positive coefficient values not recomputed; universal arbitraryrpositivity remainsopen.'),'antidiagonal':dict(result=ant,group_count=groupcount,witness_r11_m3=witness,witness_scope='Saved negativeconstantterm at i=d=0; r11givesT11outsideT<=d+2. Auxiliarypiece failure, not fullgap/source failure.',values_recomputed=False),'parameter':dict(result=param,domain_count=paramcount,cap='Each failurelist storesatmost10examples; counts are not totalfailures.'),'weight':dict(result=weight,domain_count=weightcount,scope='Fourdentries withmultiplicity,T2..49,i0..T-2; threeweight-polynomial expressions percase; finiteonly.'),'beta':dict(result=beta,moment_domains_recounted=len(domains),radial_domains_recounted=radial,positive_comparison_domains_recounted=groups,scope='i0..8,r2..17,dsetdeduplicated asrecorded,m2..2r; comparisonconditiononlyindexdomain, noexpectation/covariance evaluation.'),'certificates':certs,'inline_action_records':inline,'limitations':'Literalserializedoutputs andindexcounts only; no research imports, experiment/generator execution, polynomial reconstruction, signs orcoefficientcalculations. Writtenbeta route auditedforformalstatus only, no proofcompletion.'}
scripts=[pin(A/'research'/n) for n in ['source_experiment_dcb64029.py','top_parameter_probe_dcb64029.py','tail_antidiagonal_probe_dcb64029.py','tail_polynomial_stress_dcb64029.py','beta_comparison_dcb64029.py','generate_tail_dcb64029.py','generate_beta_scalar_dcb64029.py']]
hashes={**base,'receipt_pin':pin(W/'receipt.json'),'receipt_watch':watch,'prior184_seal_pin':pin(T/'markov_worker_000184_audit_integrity.json'),'primary_source_pin':pin(T/'markov_worker_000185_primary_source_pins.json'),'modules':modules,'counts':counts,'source_level_scope':scope,'scripts':scripts,'script_invocation_boundary':'Retained finalsource hashes alone do notauthenticateinvocationtimebytes; stresshelper documentsreproduction ofearlierinline action. Exactcommands retained separately.','audit_helper_corrections':['An initial own-helper parse failed before execution because a dictionary used keyword syntax; corrected before any outputs were written.','One exploratory JSON display stopped on integer coefficients field before reading further output; corrected typeguard, no projecteffect.'],'own_helper_pin':pin(T/'static_math_worker185.py'),'input_pins':list(pins.values())}
for n,d in [('mathematical_source_hashes',hashes),('source_structure_audit',structure),('finite_domain_audit',finite)]:dump(n,d)
print(json.dumps(dict(counts=counts,finite=[rows,coef,identity,len(tails),triples,slots,groupcount,paramcount,weightcount,len(domains),radial,groups])))
