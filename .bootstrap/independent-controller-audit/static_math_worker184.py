"""Audit-owned static byte/header/literal parsing and index-domain counting only.
No project imports/execution and no coefficient, gap, polynomial, sign or RNG recomputation.
"""
from pathlib import Path
import json,re,hashlib,datetime,ast
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000184';A=W/'artifacts';E=A/'evidence/markov-eb6a9001'
H={}
def pin(p):
 p=Path(p);b=p.read_bytes();x=dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest());H[str(p)]=x;return x
def text(p):pin(p);return Path(p).read_text()
def js(p):return json.loads(text(p))
def dump(n,d):
 p=T/f'markov_worker_000184_{n}.json';p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
validation=js(E/'validation.json');recovered=js(E/'recovered-modules.json');mods=js(E/'mathematical-modules.json');receipt=js(W/'receipt.json');old=js(T/'markov_worker_000183_mathematical_source_hashes.json');commands=js(T/'markov_worker_000184_completed_commands.json')
base=dict(worker=184,request='eb6a900170904ab59255de637301f446',created_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),historical_status='completed, return0, delivered report, mathematical_resolution false',scope='Closed184 archive-first static review, exact inherited counterparts; no active185 material, research execution, mathematical-value recomputation or proposer assistance',mathematical_values_recomputed=False)
modules=[]
for m in mods:
 bpath=validation['successful_builds'][m];snap=A/bpath.replace('.json','.lean');src=A/'research'/(m+'.lean');isrec=m in recovered
 if isrec:src=snap
 s=text(src);decl=[];starts=list(re.finditer(r'(?m)^(?:private\s+)?(theorem|lemma|def|abbrev|axiom|opaque)\s+(\S+)',s))
 for k,z in enumerate(starts):
  end=starts[k+1].start() if k+1<len(starts) else len(s);body=s[z.start():end]
  decl.append(dict(kind=z[1],name=z[2],line=s.count('\n',0,z.start())+1,header=body.split(':=',1)[0].strip(),body_sha256=hashlib.sha256(body.encode()).hexdigest()))
 build=js(A/bpath);sp=pin(src);snapshot=pin(snap)
 assert sp['sha256']==snapshot['sha256']==validation['modules'][m]==build['modules'][m] and build['returncode']==0
 previous=next((x for x in old['new_sources'] if x['module']==m),None)
 if isrec:assert previous and previous['sha256']==sp['sha256']
 x=dict(module=m,source_pin=sp,project_relative_source='research/'+m+'.lean',selected_recovered_from183=isrec,selected_new184=not isrec,imports=re.findall(r'(?m)^import\s+(\S+)',s),declarations=decl,theorem_count=sum(d['kind'] in ('theorem','lemma') for d in decl),definition_count=sum(d['kind'] in ('def','abbrev') for d in decl),successful_build=pin(A/bpath),build_snapshot=snapshot,source_equals183_sealed_source=isrec and previous['sha256']==sp['sha256'],historical183_status='ordinary compilation only; zero replay/print; uncertain host/nullreport' if isrec else None,admission_literal_tokens=re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s)))
 modules.append(x)
counts=dict(selected_modules=len(modules),recovered183=len(recovered),new184=sum(not x['selected_recovered_from183'] for x in modules),theorems=sum(x['theorem_count'] for x in modules),definitions=sum(x['definition_count'] for x in modules),recovered_theorems=sum(x['theorem_count'] for x in modules if x['selected_recovered_from183']),new_theorems=sum(x['theorem_count'] for x in modules if not x['selected_recovered_from183']))
assert counts['selected_modules']==21 and counts['theorems']==94 and counts['recovered_theorems']==54 and counts['new_theorems']==40
scope={
 'actual_sources':'Every generated path with numerator a=3 has q>=1 and r:Bool, denominator b=3q+1 for true,3q+2 for false, and exact raw threeRaw coefficients. This source-classification theorem is inherited, not reproved184.',
 'new_edges':'For q>=1,5<=t<=q+2,row j=b+2-t: raw coeff(3,j)*coeff(5,j)<coeff(4,j)^2 and raw coeff(t-2,j)*coeff(t,j)<coeff(t-1,j)^2. Source polygon contains exactly1<=i<=t in this sector. No extra gap/shape sign premise.',
 'generic_edges':'For natural n,t,5<=t,2t<=n, both strict template edges hold. The generic edge theorems do not require3t<=n+5. Actual-source adapters retain5<=t<=q+2.',
 'small_depths':'All natural starts, including zero endpoints/tails, for5<=t<=6 andt<=q+2. q1/q2 strict sector empty, rather than silently adding exceptional cases.',
 'polynomial_bound':'For rational P with positive leading coefficient: negativeMass=sum overk<natDegree max(0,-coeffk),threshold=Nat.ceil(negativeMass/leadingCoeff)+1; allnatural n>=threshold give P.eval(n)>0. Degree0 handled separately; no numerical root computation.',
 'gap_polynomial':'G(T,i)(d)=Mass(d,T,i+1)^2-Mass(d,T,i)*Mass(d,T,i+2) overQ, allnaturalparameters. Degree<=2i+8; degreeexact and positiveleading ifi+1<=T, using recovered183leadingstrict theorem. topGapThreshold usespolynomial bound.',
 'all_starts_after':'rowThreshold(T)=sup_{i inrangeT}gapThreshold(T,i). Ifd>=rowThreshold(T), allnaturali massLC; i<T strict, remainingtails usezeroendpoint. Generictemplate requires5<=t,2t<=n,3t<=n+5 androwThreshold(t-3)<=n-2t.',
 'source_threshold':'sourceThreshold(t)=2t+rowThreshold(t-3)+1. For everyt>=5, allq>=sourceThreshold(t),allr,allnaturalstarts give sourceH atrowb+2-t. Actualpath theorem takesB=3*sourceThreshold(t)+2 andb>=B. Explicit but depth-dependent; no single bound closes all depths.',
 'finite_strip':'TopMomentBoundM55C iff TopFiniteStripMEB6 (T>=2,i+2<=T,T<=d+2,d<gapThreshold). Newedge results reduce this exactly toTopInnerFiniteStripMEB6:1<=i,i+3<=T,T<=d+2,d<gapThreshold,requiringG.eval(d)>=0. FiniteforfixedT; forallT remains open, not a completed finite proof.',
 'short_sum':'Mass(d,T,i)=sum_{k<i+4} choose(i+k,i)*choose(d+2i+8,i+3-k)*(choose(T,i+k)+4choose(T+1,i+k+2)), allnaturalparameters includingzeros. Vandermonde and weightedfinite-sum identities; no assumption of eventualsign.',
 'tail_certificate':'ForT=i+2: exact8,4,1 /4,1 /singleton shifted-kernel masses. Integer rowstep identity clears denominators using i<=s. Multipliers L,Scale andK are explicitlypositive; strict scalar certificate70literalterms transfers without dividing byrawmass.',
 'third_certificate':'Rational topShortQ exactcast ofnaturalMass. For h,d>=0, T=h+2, firstmassgapstrict via6350400 timesgap equal99literaltermpositivepolynomial. TransferT>=2 usesh=T-2 with explicitbounds.',
 'root_equivalence':'Conjecture63 iff ThreeFrontierMEB6 andOtherFourM9E2. Bothunproved. IntermediateThreeRemainingMEB6 alsoexact; rootdefinition unchanged.',
 'horizontal_residual':'For q>=1,allr,i,j: q+3<j,b<2j+1,j!=5,notTopClosedRegionMEB6 =>rawH. TopClosedRegion includesoldM55Cfinishedregion, allstarts aboveparameterthreshold, andsectorstarts i=3 ori+2=t.',
 'vertical_residual':'Allnaturalstarts outside ((i=3 ori=4) andj+1<=q) OR(5<=i<=8 andj+2<=q). Unchanged.',
 'diagonal_residual':'Allnaturalstarts outside3<=i<=6 andj+2<=q; literalindices(i,j+2),(i+1,j+1),(i+2,j). Unchanged.',
 'original_guard_preservation':'Root raw polynomial, naturalindices andpolygon guards retained by inherited exactroot_iff_upper_residualM5BF. Source subproblem stronger allnaturalindices, withzero extension; no positive-coefficient filtering or normalization.',
 'unproved':'Universal coefficient positivity, innerfinite-strip sign forallT, middlehorizontalstrip, remainingV/D, OtherFoura>=4 andfullConjecture63. Finite genericgap experiments do not prove these.',
 'recovery_boundary':'Allten unchanged183mathematicalsources receive new184rebuild/replay/94-print coverage.183historical uncertain_effects/nullreport/no-replay/no-prints remainsimmutable. Existing121212incl195,separate19,WindowLC/Abel,166seven-prefix compiled-only,171outcome and180versions unchanged.'}
structure={**base,'modules':modules,'counts':counts,'source_level_scope':scope,'indices':dict(H=['(i,j)','(i+1,j)','(i+2,j)'],V=['(i,j)','(i,j+1)','(i,j+2)'],D=['(i,j+2)','(i+1,j+1)','(i+2,j)'],new_first=['(3,b+2-t)','(4,b+2-t)','(5,b+2-t)'],new_last=['(t-2,b+2-t)','(t-1,b+2-t)','(t,b+2-t)']),'support_and_cancellation':['Natsubtraction casts requireexplicit2t<=n andothersectorbounds; no integer-to-naturaltruncation premise lost.','Lowstarts0,1,2 usezero/inheritedstrict; highi>=T useendpointzeros, no division byzeroMass.','AllnaturalT,d,i shortsum, including k/supportzeros. Naturalchoose guards preserved.','Kernelrowstep cancellation usesstrictpositive factors; T=i+2 tailidentity retains lowerkernelzeroterms exactly.','First/last strict source triples haveformalpolygonmembership; sourcepaththreshold retainsbothdenominatorresidues.']}
# These counters count iteration domains and serialized list lengths only.
source=js(E/'source-experiment.json');qvals=list(range(1,19))+[29,43,67]
rows=sum(2*len(range(q+3)) for q in qvals);coefs=sum(2*sum(len(range(t+4)) for t in range(q+3)) for q in qvals)
short=sum(2*sum(len(range(3,min(t+1,9)+1)) for t in range(5,q+3)) for q in qvals)
edge_domains=[(q,r,t,i) for q in qvals for r in [False,True] for t in range(5,q+3) for i in [3,t-2]]
triples=[0,0,0]
for a,b in source['labels']:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for k,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):triples[k]+=1
assert (rows,coefs,short,len(edge_domains),triples)==(source['rows'],source['coefficients'],source['short_formula_checks'],source['new_edge_triples'],source['raw_triples'])
gap=js(E/'top-gap-polynomial-probe.json');newton=js(E/'top-short-newton-probe.json');mono=js(E/'top-short-monomial-probe.json')
gapdomain=[(t,i) for t in range(2,51) for i in range(t-1)];coeffslots=sum(2*i+9 for t,i in gapdomain);shortids=sum(t+1 for t in range(2,25))
assert len(gapdomain)==gap['gap_polynomials'] and coeffslots==gap['coefficients'] and shortids==newton['identity_checks']
assert [(x['sector'],x['i']) for x in newton['cases']]==[(s,i) for s in [False,True] for i in range(13)]
assert [x['i'] for x in mono]==list(range(7))
certificates=[]
for filename,module,var in [('top-third-certificate.json','MarkovTopThirdGapMEB6','h'),('top-tail-certificate.json','MarkovTopTailScalarMEB6','i')]:
 cert=js(E/filename);s=text(A/'research'/(module+'.lean'));he=s.split('have he :',1)[1].split(':= by',1)[0];hp=s.split('have hp :',1)[1].split(':= by',1)[0];terms=he.split('=',1)[1].strip().split('+');parsed=[]
 for term in terms:
  m=re.fullmatch(r'\s*(\d+)(?:\*'+var+r'\^(\d+))?(?:\*d\^(\d+))?\s*',term);assert m,term;parsed.append([int(m[2] or 0),int(m[3] or 0),m[1]])
 assert parsed==cert['coefficients'] and all(z.strip() in hp for z in terms)
 certificates.append(dict(result=pin(E/filename),module=module,terms=len(parsed),constant_literal=parsed[0],scale_literal=cert.get('scale'),all_serialized_terms_match_Lean_identity_inorder=True,all_terms_present_in_positivity_expression=True,unsigned_nonzero_decimal_literals=all(re.fullmatch('[1-9][0-9]*',z[2]) is not None for z in parsed),polynomial_recalculated=False,generator_executed=False))
bindings=[]
for filename in ['source-experiment.json','top-gap-polynomial-probe.json','top-short-newton-probe.json','top-short-monomial-probe.json']:
 expected=js(E/filename);matches=[]
 for c in commands:
  for line in c.get('stdout','').splitlines():
   try:v=json.loads(line)
   except (ValueError,TypeError):
    try:v=ast.literal_eval(line)
    except (ValueError,SyntaxError):continue
   match=v==expected or (isinstance(v,dict) and isinstance(expected,dict) and len(v)>1 and set(v).issubset(expected) and v=={k:expected[k] for k in v})
   if filename=='top-short-newton-probe.json' and isinstance(v,dict):
    projection=dict(identity_checks=expected['identity_checks'],identity_failures=expected['identity_failures'],cases=len(expected['cases']),negative_cases=[(x['i'],x['sector'],x['negative_count']) for x in expected['cases'] if x['negative_count']],seconds=expected['seconds'])
    match=match or v==projection
   if match:matches.append(dict(line=c['line'],id=c['id'],exit_code=c.get('exit_code',c.get('returncode',c.get('exit'))),keys=list(v) if isinstance(v,dict) else None))
 bindings.append(dict(result=filename,matches=matches))
finite={**base,'scope':'Index-domain counts and literalserialization comparisons only; all numeric mathematical results remain savedworker observations. No program imports or RNG regeneration.','source':dict(result=source,q_domain=qvals,source_family_labels=42,rows_recounted=rows,coefficient_positions_recounted=coefs,short_formula_recounted=short,edge_calls_recounted=len(edge_domains),distinct_edge_domain_positions=len(set(edge_domains)),edge_duplicate_explanation='Two starts coincide at t=5 and are deliberately counted twice bytheoriginalscript.',saved_label_count=len(source['labels']),unique_saved_labels=len(set(map(tuple,source['labels']))),polygon_triples_recounted=triples,total_polygon_triples=sum(triples),zero_count_status='2858 copied from savedresult; no coefficient/zero recomputation',random_limit='15 seeded length6paths plus[],[False],[True] not regenerated; saved60labels deduplicated with42a3families and2endpoints'),'gap':dict(result=gap,gap_domains_recounted=len(gapdomain),coefficient_slots_recounted=coeffslots,coefficient_slot_reason='List-length bookkeeping: mass polynomial generated length i+4; both cleared gap product arrays length2i+9. No products expanded or values evaluated.',generic_scope='T2..50,i0..T-2,unshiftedd parameter; finite coefficient-list nonnegativity not arbitraryT proof'),'newton':dict(identity_checks_recounted=shortids,cases_recounted=len(newton['cases']),case_summaries=[{k:x[k] for k in ['i','sector','nonzero','negative_count','negative_first']} for x in newton['cases']],stored_layer_lengths=[dict(i=x['i'],sector=x['sector'],layers=len(x['layers']),slots=sum(len(y) for y in x['layers'])) for x in newton['cases']],scope='26cases,i0..12,bothsectorflags. Finitedifference arithmeticnotrerun; lists retainedonlyi<=2. IdentitydomainT2..24,i0..T.'),'monomial':dict(result=mono,cases_recounted=len(mono),scope='i0..6:onlyi0 generated as universalLean first-edgecertificate; othersfiniteparameterizedpolynomial experiments'),'certificates':certificates,'output_event_bindings':bindings,'limitations':'Emptyfailurelists, coefficient signs andsourceequalities copiedfromsavedoutputs; universalcredit onlyfromrecorded source/build/replay/printchain, notthese domaincounts.'}
scripts=[pin(A/'research'/n) for n in ['source_experiment_eb6a9001.py','top_gap_probe_eb6a9001.py','top_short_probe_eb6a9001.py','generate_top_third_eb6a9001.py','generate_top_tail_eb6a9001.py']]
hashes={**base,'receipt_pin':pin(W/'receipt.json'),'prior183_scope_pin':pin(T/'markov_worker_000183_mathematical_source_hashes.json'),'new_and_recovered_sources':modules,'counts':counts,'source_level_scope':scope,'scripts':scripts,'audit_helper_corrections':['Pre-output Python syntax typo corrected.','Pre-output completed-command key changed from exit_code to recorded returncode.','Newton summary compared with its explicit count/list projection; no mathematical values recomputed.'],'own_helper_pin':pin(T/'static_math_worker184.py'),'input_pins':list(H.values())}
for n,x in [('mathematical_source_hashes',hashes),('source_structure_audit',structure),('finite_domain_audit',finite)]:dump(n,x)
print(json.dumps(dict(counts=counts,finite_counts=[rows,coefs,short,len(edge_domains),len(set(edge_domains)),triples,len(gapdomain),coeffslots,shortids])))
