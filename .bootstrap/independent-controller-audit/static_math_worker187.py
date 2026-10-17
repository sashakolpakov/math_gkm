"""Audit-owned static parsing, hashes and finite index-domain counts only.
No project modules imported/executed; no coefficients, gaps, polynomials or RNG evaluated.
"""
from pathlib import Path
import json,re,hashlib,datetime
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000187';A=W/'artifacts';E=A/'evidence/markov-20825094';pins={}
def pin(p):
 p=Path(p);b=p.read_bytes();d=dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest());pins[str(p)]=d;return d
def text(p):pin(p);return Path(p).read_text()
def js(p):return json.loads(text(p))
def dump(n,d):
 p=T/('markov_worker_000187_'+n+'.json');p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
base=dict(worker=187,request='2082509481ba44c7bfe6fb10865a70b1',created_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),historical_status='completed/return0, delivered report, mathematical_resolution false',scope='Closed187 archive-first static review only; no188+ reads, project execution, mathematical-value computation, source changes or proposer assistance.',mathematical_values_recomputed=False)
v=js(E/'validation.json');mods=js(E/'mathematical-modules.json');receipt=js(W/'receipt.json');watch=js(T/'markov_worker_000187_receipt_watch.json');primary=js(T/'markov_worker_000187_primary_source_pins.json')
def declarations(s):
 starts=list(re.finditer(r'(?m)^(?:private\s+)?(theorem|lemma|def|abbrev|axiom|opaque)\s+(\S+)',s));out=[]
 for ix,z in enumerate(starts):
  body=s[z.start():starts[ix+1].start() if ix+1<len(starts) else len(s)]
  out.append(dict(kind=z[1],name=z[2],line=s.count('\n',0,z.start())+1,header=body.split(':=',1)[0].strip(),body_sha256=hashlib.sha256(body.encode()).hexdigest()))
 return out
modules=[]
for m in mods:
 p=A/'research'/(m+'.lean');s=text(p);sp=pin(p);br=A/v['compilation'][m];b=js(br);snap=pin(br.with_suffix('.lean'));assert sp['sha256']==snap['sha256']==v['modules'][m]==b['modules'][m] and b['returncode']==0
 assert next(x['sha256'] for x in primary['files'] if x['module']==m)==sp['sha256']
 decl=declarations(s)
 modules.append(dict(module=m,source_pin=sp,project_relative_source='research/'+m+'.lean',imports=re.findall(r'(?m)^import\s+(\S+)',s),declarations=decl,theorem_count=sum(x['kind'] in ('theorem','lemma') for x in decl),definition_count=sum(x['kind'] in ('def','abbrev') for x in decl),successful_build=pin(br),build_snapshot=snap,admission_literal_tokens=re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s))))
counts=dict(selected_modules=len(modules),theorems=sum(m['theorem_count'] for m in modules),definitions=sum(m['definition_count'] for m in modules));assert counts==dict(selected_modules=9,theorems=50,definitions=19)
drafts=js(E/'draft-status.json');pending=[]
for m,entry in drafts.items():
 p=A/'research'/(m+'.lean');s=text(p);z=pin(p);assert z['sha256']==entry['sha256'];d=declarations(s);pending.append(dict(module=m,source_pin=z,status=entry,declarations=d,theorems=sum(t['kind'] in ['theorem','lemma'] for t in d),definitions=sum(t['kind'] in ['def','abbrev'] for t in d),validation_credit=False))
assert sum(x['theorems'] for x in pending)==6 and sum(x['definitions'] for x in pending)==5
scope={
 'actual_source_strict_wedge':'source_top_path_wedgeM208: every actual path with a=3 and natural t,c, t>=5,3t<=b+5,c>=3,c+1<=t,4t+2<=5c has STRICT rawH at (c,b+2-t),(c+1,b+2-t),(c+2,b+2-t). The source-sector premise3t<=b+5 is explicit and must not be omitted.',
 'family_adapter':'q>=1, both Bool residues b=3q+1 or3q+2,5<=t<=q+2,c>=3,c+1<=t,4t+2<=5c. Generic template additionally requires2t<=n and3t<=n+5; actual-source adapters discharge these, with no unproved source-formula premise.',
 'polygon':'Three actual horizontal points are formally in the original polygon under stronger c+2<=t, together with same sector/wedge assumptions. c=t-1 is an algebraic zero-tail triple outside that three-point polygon condition.',
 'gain':'Additional universal column region, not a new whole-row assertion or V/D region. Previous186 whole-row6t<=b+16 remains inherited. Finite844 beyond_linear entries fail previous column condition6t<=b+3c+4; this is not a formal strict-set-difference theorem from ALL old coverage.',
 'base_density':'a=i+1,H=d+2i+9,Q=H-a-2=d+i+6. steinDensity=choose(i+k,i)*betaQSeq(d,i,k); steinPair is product at k and m-k. Density is positive for all natural parameters; cast identities explicitly guard k<=m.',
 'generator':'B(k)=(a+k)(H+k)(m-k)(H-a-3+m-k), D(k)=k(H-a-3+k)(a+m-k)(H+m-k). Lp=B(k)(m-2k-1)+D(k)(2k-m-1). Cleared density recurrence proves detailed balance, k<m; B(m)=D(0)=0 give finite stationarity sum W Lp=0 with all endpoints retained.',
 'algebra':'For real parameters and p=k(m-k): Lp=F+E*p-(8a+14)p^2; (4a+7)F2=-2(a+2)Lp+C0+Cp*p; den=(8a+14)m^2-4E; C0*den+4Cp*F=a*m*(m-1)*R. Point certificate den(4a+7)F2+[2(a+2)den+4Cp]Lp-a*m*(m-1)R=Cp(8a+14)p(m^2-4p). These are universal identities, not universal sign claims.',
 'positive_certificate':'Three accepted shifts a=x+2(y+2),m=y+2,H=3a+m/2+4+z have19/46/80 positive literal terms, constants14448/1042256/1920960, scaling1. Therefore den,Cp,R>0 for real m>=2,a>=2m,2H>=6a+m+8.',
 'generic_sum':'stein_sum_positive assumes weights strictly positive on k<=m AND zero stationary sum. Actual steinPair instance proves both hypotheses; p>=0,m^2-4p>=0 on the finite domain. Positive den(4a+7) is established before cancellation.',
 'actual_cut':'Actual factor f(k)=w_r(k)w_r(m-k), w_r(k)=4(r-k) belowr,1 atr,0 above. Symmetric inward comparison and positive cut mass(m<=2r) transfer positivity from the q-tilted base using inherited finite covariance. Special endpoint1 is retained.',
 'groups':'For naturals d,i,r,m:2<=m<=2r,2m<=i+1,6(i+1)+m+8<=2(d+2i+9) imply actual betaGroup>0. Under i+r<=d+2 and4r<=i+1 all m2..2r satisfy these. Groups0/1 vanish and r>=1 supplies strict m2.',
 'source_transport':'Exact antidiagonal regrouping gives density gap, positive denominator product squared gives tail gap, inherited tail_strict_iff gives raw mass gap. Source substitution i=c-3,r=t-c,d=b-2t is guarded for natural subtraction. No division by raw coefficients and no omission of zero tails.',
 'correction':'Universal all-natural d,i,r,m identity: den(4a+7)betaGroup=a*m(m-1)R*Mass+Cp(8a+14)*Spread+[2(a+2)den+4Cp]*Energy. Mass=sum Wf; Spread=sum Wf*p(m^2-4p); Energy=sum(k<m) W_k B(k)(f(k+1)-f(k))(m-2k-1). Summation by parts gives sum Wf Lp=-Energy. Spread>=0 and Energy>=0 are universal; scalar multipliers are not universally asserted nonnegative. This does not prove the remaining group sign.',
 'mass_lower_qualification':'BetaMassLower concerns q-FREE betaBaseWeightMCA9=choose(i+k,i)choose(i+m-k,i), not q-tilted steinPair. It proves symmetry, inward monotonicity, endpoint lower bound and (m+1)W0<=sum W for all naturals with explicit index guards; five accepted theorems, no separate new raw-source consequence.',
 'tail_residual':'TopWedgeStripM208: all natural d,i,r with1<=i,5<=r,i+r<=d+2,d+1<i+4r,i+1<4r require tailGap>=0. Exact iff TopLinearStripMCA9, hence TopMomentBoundM55C, still open.',
 'root':'Conjecture63 iff ThreeFrontierM208 AND OtherFourM9E2. TopClosedRegionM208 is previousMCA9 OR exists upperdepth t with5<=t<=q+2,j=b+2-t,3<=i,i+1<=t,4t+2<=5i. Both residual conjuncts unproved; full original root remains open.',
 'horizontal_residual':'q>=1,q+3<j,b<2j+1,j!=5,notTopClosedRegionM208: rawH remains for all natural i,j, without an additional InPolygon premise. The separate root equivalence retains the original polygon-guarded target. This adds the wedge to older closed regions.',
 'vertical_residual':'Unchanged exclusions: (i=3or4 andj+1<=q) or(5<=i<=8 andj+2<=q).',
 'diagonal_residual':'Unchanged exclusion3<=i<=6 andj+2<=q; literal raw positions(i,j+2),(i+1,j+1),(i+2,j). Auxiliary antidiagonal grouping is not a new raw diagonal theorem.',
 'formal_obstruction':'Untruncated sum over range8 of steinPair(4,1,7,k)*betaScalar(4,1,k,7-k) is negative, while actual cut betaGroup(4,1,5,7)>0. Formal sector arithmetic is included. No actual path/raw coefficient failure is asserted.',
 'finite_obstruction':'Saved exact correction examplea20,r1000,m1100,extra0 has negative energy-only expression and positive full group; it shows omitted spread term cannot be universally discarded. This particular example is not a Lean obstruction theorem and not a raw-source refutation.',
 'pending':'FirstCentralMargin final source has4defs/3theorems but three builds timed out(120/180/100s). FirstCentral attachment1def/3theorems has no build and depends on it. Six theorem texts/five definitions are unaccepted; no recovery of centralm=r through them.',
 'inherited_limits':'Old121212(including195) and separate19/WindowLC/Abel qualifications persist;166 partial replay remains. Historical183 uncertain/no replay unchanged, separate184 recovery retained. Compiled inherited bodies trusted; no whole-source fresh rebuild/root completion.'}
structure={**base,'modules':modules,'counts':counts,'pending_modules':pending,'source_level_scope':scope,'literal_indices':{'H':['(i,j)','(i+1,j)','(i+2,j)'],'V':['(i,j)','(i,j+1)','(i,j+2)'],'D':['(i,j+2)','(i+1,j+1)','(i+2,j)']},'zero_boundaries':['Natural subtraction guards are explicit at source parameter conversion and k<=m casts.','Actual cut w(r)=1 differs from interior4(r-k); outside cut zeros retained.','Stationary/summation-by-parts endpoints B(m)=0,D(0)=0 retained.','Only auxiliary positive den/mass/products are cancelled. No raw coefficient division.','Strict c=t-1 is algebraic beyond polygon; polygon theorem needs c+2<=t.']}
# Domain enumeration only; no mathematical values or random paths recomputed.
source=js(E/'source-experiment.json');qs=list(range(1,16))+[25,26,31,40,50,70,100];rows=coef=wedge=beyond=0
for q in qs:
 for residue in [1,2]:
  b=3*q+residue
  for t in range(q+3):
   rows+=1;coef+=t+4
   if t>=5:
    for c in range(3,t):
     if 4*t+2<=5*c:wedge+=1;beyond+=6*t>b+3*c+4
assert [rows,coef,wedge,beyond]==[source[k] for k in ['rows','coefficients','wedge_triples','wedge_beyond_linear']]
triples=[0,0,0]
for a,b in source['labels']:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for k,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):triples[k]+=1
assert triples==source['raw_triples']
exact=js(E/'exact-wedge-experiment.json');kernels=[(d,i,r) for r in range(1,31) for i in sorted(set([4*r-1,4*r,5*r,8*r])) for d in [i+r-2,i+2*r,i+4*r]];groupindices=[(d,i,r,m) for d,i,r in kernels for m in [2,r,2*r-1,2*r] if m>=2]
assert len(kernels)==exact['kernel_checks']==360 and len(groupindices)==exact['groups']==exact['base_checks']==exact['stationary_checks']==1416
actual=js(E/'actual-stein-probe.json');actualparams=[(a,r,m) for a in [2,3,10,100,1000] for r in [5,50,500,5000] for m in [r,3*r//2,2*r]];assert [(x['a'],x['r'],x['m']) for x in actual]==actualparams
correction=js(E/'correction-probe.json');corrparams=[(a,r,m,e) for a in [2,3,4,5,10,20,50] for r in [5,10,20,40,80] for m in sorted(set([r,r+1,3*r//2,2*r-2])) for e in [0,r,3*r]];assert len(corrparams)==correction['cases']==420
# float multiplication below is ONLY original integer-index construction int(f*r), never any weights/gaps/scalars.
def stress_indices(aa):return [(a,r,m,e) for a in aa for r in sorted(set([5,10,30,100,300,1000,3000,10000,10*a,100*a])) for f in [0,.1,.25,.5,.75,.9,.99] for m in [r+int(f*r)] if m+2<=2*r for e in [0,r,3*r]]
stress=js(E/'correction-stress.json');stressparams=stress_indices([2,3,5,10,20,50,100,500,1000,10000]);assert len(stressparams)==stress['cases']==1767
central=js(E/'central-probe.json');centralparams=stress_indices([2,3,5,10,20,50,100,200,500,1000,10000]);assert len(centralparams)==central['cases']==1959;assert [tuple(x[:4]) for x in central['rows']]==centralparams
# Literal monomial parsing only, no algebraic expansion or evaluation.
def terms(expr,vs):
 out=[]
 for line in expr.strip().splitlines():
  z=re.fullmatch(r'([+-]?\d+)((?:\*[A-Za-z]+(?:\^\d+)?)*)',line.strip());assert z,line;ex={v:0 for v in vs}
  for name,exp in re.findall(r'\*([A-Za-z]+)(?:\^(\d+))?',z[2]):assert name in ex;ex[name]=int(exp or '1')
  out.append([[ex[v] for v in vs],z[1].removeprefix('+')])
 return out
alg=text(A/'research/MarkovTopSteinAlgebraM208.lean');symbolic=js(E/'stein-bound-symbolic.json');cert=js(E/'stein-certificate-generation.json');literal_matches={}
for key,name in [('E','steinEM208'),('F','steinFM208'),('C0','steinC0M208'),('Cp','steinCpM208'),('den','steindenM208')]:
 expr=alg.split('def '+name,1)[1].split(':=',1)[1].split('\ndef ',1)[0];rows0=terms(expr,['a','m','H','unused']);assert rows0==symbolic[key];literal_matches[key]=len(rows0)
positive={}
for key,name,expected,constant in [('den','stein_den_shift_positiveM208',19,'14448'),('Cp','stein_Cp_shift_positiveM208',46,'1042256'),('reduced','stein_reduced_shift_positiveM208',80,'1920960')]:
 expr=alg.split('theorem '+name,1)[1].split('have he :',1)[1].split('=',1)[1].split(':= by',1)[0];ss=terms(expr,['x','y','z']);assert len(ss)==expected==cert[key]['terms'];assert cert[key]['denominator']==1 and ss[0]==[[0,0,0],constant] and all(re.fullmatch('[1-9][0-9]*',c) for e,c in ss);positive[key]=dict(terms=len(ss),scale=1,constant_literal=constant,all_coefficients_positive_literals=True,source_literal_terms=ss)
first=js(E/'first-central-symbolic.json');wedge_search=js(E/'stein-wedge.json');obstruction=js(E/'correction-exact-obstruction.json');commands=js(T/'markov_worker_000187_completed_commands.json');inline=[x for x in commands if any(n in x['command'] for n in ['correction-exact-obstruction.json','first-central-symbolic.json'])]
finite={**base,'source':dict(result=source,q_domain=qs,family_count=44,rows_recounted=rows,coefficient_positions_recounted=coef,wedge_triples_recounted=wedge,beyond_previous_column_bound_recounted=beyond,polygon_triples_recounted=triples,total_polygon_triples=sum(triples),saved_labels=len(source['labels']),unique_saved_labels=len(set(map(tuple,source['labels']))),zero_count_saved_not_recomputed=source['zeros'],random_paths_regenerated=False,random_scope='15 seed187 paths oflength6 plus0/1and1/1; only saved58labels used for index counts. Beyond_linear tests only6t>b+3c+4, not all earlier regions.'),'exact_wedge':dict(result=exact,kernel_index_count=len(kernels),group_count_with_multiplicity=len(groupindices),distinct_group_indices=len(set(groupindices)),domain='r1..30; i deduplicated set[4r-1,4r,5r,8r]; three d entries; m list[2,r,2r-1,2r] retains duplicates and skipsm<2.'),'actual_stein_probe':dict(result_pin=pin(E/'actual-stein-probe.json'),rows=len(actual),indices_match_saved_rows=True,scope='60 rows; exact rational algebra fields plus normalized floating mean. Not universal positivity.'),'correction_probe':dict(result=correction,domain_count=len(corrparams),distinct_indices=len(set(corrparams)),scope='420 exact finite cases; truncated failure list cap15; no universal sign theorem.'),'correction_stress':dict(result=stress,index_count=len(stressparams),distinct_indices=len(set(stressparams)),failure_entries=len(stress['failures']),scope='Normalized floating stress; break whenv<1e-250;66 failures of energy-only shortcut, not raw/source LC.'),'central_probe':dict(result_pin=pin(E/'central-probe.json'),status=central['status'],index_count=len(centralparams),distinct_indices=len(set(centralparams)),saved_rows=len(central['rows']),indices_match=True,failures=central['failures'],worst_saved=central['worst'],scope='Floating normalized q-tilted finite sums;1959 rows, cutoff1e-250. No accepted central-group theorem follows.'),'accepted_certificates':dict(symbolic_pin=pin(E/'stein-bound-symbolic.json'),generation_pin=pin(E/'stein-certificate-generation.json'),signed_source_literal_matches=literal_matches,serialized_counts={k:len(z) for k,z in symbolic.items()},positive=positive,limit='Generator JSON records counts/scaling, not full positive coefficients. Literal source counts/signs match those statistics; compiler/replay supplies algebraic identity proof, auditor did not expand it.'),'quadratic_wedge_search':dict(result=wedge_search,scope='Five exploratory substitutionsa=x+c*(y+2)^2,c1/2/4/8/16 each250 positive literals; distinct from accepted linear a=x+2m certificate.'),'first_central_candidate':dict(result_pin=pin(E/'first-central-symbolic.json'),literal_counts={k:len(z) for k,z in first.items()},scope='78 reduced/90 shifted candidate entries, no Lean validation credit; pending margin timed outthree times.'),'exact_auxiliary_obstruction':dict(result=obstruction,event=171,scope='Saved exact negative energy-only expression with actual auxiliary group positive; finite only, no coefficient recomputation/root refutation.'),'inline_action_records':inline,'limitations':'Static literal parsing and finite index counts only; no coefficients, binomials, gaps, polynomial expansions, signs of evaluated expressions, RNG, project code or proof checks recomputed.'}
scripts=[pin(A/'research'/n) for n in ['experiment_20825094.py','stein_actual_20825094.py','stein_bound_20825094.py','stein_wedge_20825094.py','correction_probe_20825094.py','correction_stress_20825094.py','central_probe_20825094.py','generate_stein_algebra_20825094.py','generate_first_central_20825094.py']]
hashes={**base,'receipt_pin':pin(W/'receipt.json'),'receipt_watch':watch,'prior186_seal_pin':pin(T/'markov_worker_000186_audit_integrity.json'),'primary_source_pin':pin(T/'markov_worker_000187_primary_source_pins.json'),'modules':modules,'counts':counts,'pending_modules':pending,'source_level_scope':scope,'scripts':scripts,'script_invocation_boundary':'Final script hashes alone do not bind every earlier invocation. Several scripts run at import. stein_bound fails58/edited60/succeeds62 without a separate failed-script snapshot; Algebra generator79 precedes point_certificate edit83 and accepted build87; correction_probe JSON150 precedes path-only change169 and exact case171, so final script bytes do not authenticate invocation150; FirstCentral generator183 precedes proof edit235 and timeout250. V/M retain exact completed events/version differences.','audit_helper_corrections':['Before closing observations, reviewer corrected wording of horizontal residual: it quantifies all natural i,j without an additional InPolygon premise; the separate root iff retains the original polygon-guarded target. No source/proof changes.'],'own_helper_pin':pin(T/'static_math_worker187.py'),'input_pins':list(pins.values())}
for n,d in [('mathematical_source_hashes',hashes),('source_structure_audit',structure),('finite_domain_audit',finite)]:dump(n,d)
print(json.dumps({'counts':counts,'domains':[rows,coef,wedge,beyond,triples,len(groupindices),len(set(groupindices)),len(kernels),len(stressparams),len(set(stressparams)),len(centralparams),len(set(centralparams))]}))
