"""Static audit only: hashes, declaration/literal parsing and finite index counts.
Never imports or executes research modules or recomputes mathematical values/RNG.
"""
from pathlib import Path
import json,re,hashlib,datetime,ast
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000186';A=W/'artifacts';E=A/'evidence/markov-ca9709f2';pins={}
def pin(p):
 p=Path(p);b=p.read_bytes();z=dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest());pins[str(p)]=z;return z
def text(p):pin(p);return Path(p).read_text()
def js(p):return json.loads(text(p))
def dump(n,d):
 p=T/('markov_worker_000186_'+n+'.json');p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
v=js(E/'validation.json');mods=js(E/'mathematical-modules.json');receipt=js(W/'receipt.json');watch=js(T/'markov_worker_000186_receipt_watch.json');primary=js(T/'markov_worker_000186_primary_source_pins.json');events=[json.loads(s) for s in text(W/'events.jsonl').splitlines()]
base=dict(worker=186,request='ca9709f2af7048a4813bd37d46ae4ce9',created_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),historical_status='completed0, delivered report, mathematical_resolution false',scope='Closed186 archive-first static review only; no later-worker reads, project execution, mathematical-value computation, source edits or proposer assistance.',mathematical_values_recomputed=False)
modules=[]
for m in mods:
 p=A/'research'/(m+'.lean');s=text(p);sp=pin(p);br=A/v['successful_builds'][m];b=js(br);snap=pin(br.with_suffix('.lean'));assert sp['sha256']==snap['sha256']==v['modules'][m]==b['modules'][m] and b['returncode']==0
 assert next(x['sha256'] for x in primary['files'] if x['module']==m)==sp['sha256']
 decl=[];starts=list(re.finditer(r'(?m)^(?:private\s+)?(theorem|lemma|def|abbrev|axiom|opaque)\s+(\S+)',s))
 for ix,z in enumerate(starts):
  end=starts[ix+1].start() if ix+1<len(starts) else len(s);body=s[z.start():end]
  decl.append(dict(kind=z[1],name=z[2],line=s.count('\n',0,z.start())+1,header=body.split(':=',1)[0].strip(),body_sha256=hashlib.sha256(body.encode()).hexdigest()))
 modules.append(dict(module=m,source_pin=sp,project_relative_source='research/'+m+'.lean',imports=re.findall(r'(?m)^import\s+(\S+)',s),declarations=decl,theorem_count=sum(x['kind'] in ('theorem','lemma') for x in decl),definition_count=sum(x['kind'] in ('def','abbrev') for x in decl),successful_build=pin(br),build_snapshot=snap,admission_literal_tokens=re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s))))
counts=dict(selected_modules=len(modules),theorems=sum(m['theorem_count'] for m in modules),definitions=sum(m['definition_count'] for m in modules));assert counts==dict(selected_modules=12,theorems=73,definitions=20)
scope={
 'actual_sources':'All actual a=3 generated paths: q>=1 and Bool residue, b=3q+1 or3q+2; inherited exact threeRaw representation, no unproved source-formula premise.',
 'whole_raw_row':'source_top_path_linearMCA9: a(path)=3, t>=5, 6t<=b(path)+16 implies rawH at row b+2-t for EVERY natural start i. All coefficients, leading/interior/terminal zeros and arbitrary far tails remain.',
 'source_sector':'Source-family adapter assumes q>=1,5<=t<=q+2 and 6t<=b+16. Path theorem derives sector from its hypotheses. Generic whole-row template additionally requires2t<=n and3t<=n+5, both discharged for actual sources.',
 'strict_column':'For every actual source q>=1,both residues,5<=t<=q+2,c>=3,c+1<=t and 6t<=b+3c+4, rawH at(c,b+2-t) is strict. Generic column template requires2t<=n but not3t<=n+5.',
 'polygon_caveat':'Three actual horizontal points belong to original polygon if1<=c andc+2<=t. Strict endpoint c=t-1 is an algebraic zero-tail triple beyond the three-point polygon condition; do not call all strict columns polygon-valid.',
 'kernel':'K_i(d,s)=choose(s,i)choose(d+s+i+8,i+3); Mass_i(d,T)=K_i(d,T)+4sum(s<T)(T-s)K_i(d,s). T=t-3,d=b-2t. Natural support and tail zeros retained.',
 'beta_mean':'Universal exact ten falling-moment identity: four rising factors at2a times betaBaseSum equals2a^2(a+1)m(m-1)*betaGapMDCB(a,m,H)*betaMass, a=i+1. Small moment orders split into zero cases. Positive mean requiresm>=2,H>=3a+2m+5.',
 'radial_covariance':'Finite covariance comparison assumes only w>=0, symmetric f/g underk↔m-k, and one-step inward monotonicity2k+1<=m. f/g need not be nonnegative; min(k,m-k) orders all pairs. No probability normalization or zero-support filter.',
 'comparison':'q0=1,q(k+1)/qk=(d+2i+9+k)/(d+i+6+k), w_r(k)=4(r-k) for k<r,1 at r,0 afterr. Beta group at m is base-weighted qkwk*q_lw_l times doubled scalar F2. Groupstrict ifi+4r<=d+1,2<=m<=2r; groups0/1 zero.',
 'transport':'Exact antidiagonal regrouping gives sum(groups)=2*densityGap. Denominator-clearing products D_r positive; D_r^2*densityGap=tailGapMDCB. Strict tail/mass gap ifr>=1 andi+4r<=d+1. No raw-coefficient division. Whole Mass row forT>=2,4T<=d+4 uses inherited stricti0 separately and zeros fori>=T.',
 'linear_residual':'TopLinearStripMCA9: forall natural d,i,r,1<=i,5<=r,i+r<=d+2,d+1<i+4r =>tailGap>=0. Exactly equivalent toTopTailResidualMDCB, hence toTopMomentBoundM55C. Still unproved; fixingi,r boundsd buti,r unbounded.',
 'root':'Conjecture63 iffThreeFrontierMCA9 andOtherFourM9E2. Both unresolved. TopClosedRegionMCA9 includes oldMDCB region plus rowlinear/strictcolumn bounds at actual source upper-sector rows. No new V/D raw region.',
 'horizontal_residual':'q>=1, q+3<j, b<2j+1,j!=5,notTopClosedRegionMCA9 =>rawH, with original source and polygon guards inherited through root equivalences.',
 'vertical_residual':'Unchanged exclusions: (i=3or4 andj+1<=q) or(5<=i<=8 andj+2<=q).',
 'diagonal_residual':'Unchanged exclusion3<=i<=6 andj+2<=q; literal raw positions(i,j+2),(i+1,j+1),(i+2,j).',
 'weighted_identity':'Universal integer weighted beta sum with(r-k)(r-(m-k)); 21 falling moments and six rising factors at2a clear denominators. Exact reduced polynomial123 signed literal terms. Identity itself has no positivity hypothesis.',
 'weighted_positive':'Accepted shift a=x+2,m=y+2,r=m+s+1,H=3a+r+4+z gives176 positive terms, constant3338496. Domaina>=2,m>=2,r>=m+1,H>=3a+r+4. Earlier x+1 shift has3 negative literals and is not the accepted positive certificate.',
 'lower_groups':'For naturali>=1,i+r<=d+2 and2<=m<r, betaGroup>0. Every k<=m lies belowr, so both actual weights use4(r-k),product16. No use of this polynomial weight at the special endpointw(r)=1.',
 'end_groups':'For all natural d,i, r>=1 gives groupm=2r>0; r>=2 gives groupm=2r-1>0. Scalar equal/adjacent pair positivity and vanishing outside support, no actual-source sector premise needed.',
 'central_condition':'UpperHalfBeta (i>=1,r>=5,i+r<=d+2,r<=m<=2r, group>=0) iffCentralBeta with additionallyd+1<i+4r andm+2<=2r. Both open; sufficient for tail residual/moment/source upperrows, NOT proved equivalent to raw/root LC because groups can cancel.',
 'ptilt':'Formal betaWeightedSum 3 98 0 65=-1340117822782233600, alongside actual auxiliary betaGroup 50 3 49 98>0 and sector arithmetic. The zero third argument in weighted sum is distinct from actualr49. No direct source/path/raw counterexample theorem.',
 'gain_boundary':'New explicit linear sufficient source bound is formal in186; worker185 proposed beta cutoff remains historically unformalized there. Previous depth5..8 and184 depth-dependent threshold retained. No invented formal strict-set-difference witness.',
 'inherited_limits':'No recovery of old121212(including195), separate19, WindowLC/Abel, or166 missing replay. Historical183 uncertain/no replay stays; separately184 recovered10/54. Inherited compiled objects trusted, no fresh whole-source build or root completion.'}
structure={**base,'modules':modules,'counts':counts,'source_level_scope':scope,'literal_indices':{'H':['(i,j)','(i+1,j)','(i+2,j)'],'V':['(i,j)','(i,j+1)','(i,j+2)'],'D':['(i,j+2)','(i+1,j+1)','(i+2,j)']},'zero_boundaries':['All natural starts, including entire zero tails, are quantified in path theorem.','Empty and oversized falling moments are split explicitly; natural subtraction and integer cast are not interchangeable.','Auxiliary denominators/mass/base kernel positivity is proved before cancellation; no raw support restriction.','End weight1 differs from interior4(r-k); lower-group theorem requiresm<r.','Strict source column c=t-1 does not satisfy the three-point polygon condition.']}
# Counts below enumerate index domains only. No coefficients, gaps or polynomial values.
source=js(E/'source-experiment.json');qs=list(range(1,37))+[49,67];rows=coef=linearrows=lineartriples=strictcols=0
for q in qs:
 for z in [1,2]:
  b=3*q+z
  for t in range(q+3):
   rows+=1;coef+=t+4
   if t>=5 and 6*t<=b+16:linearrows+=1;lineartriples+=t+3
   strictcols+=sum(t>=5 and 6*t<=b+3*i+4 for i in range(3,t))
assert [rows,coef,linearrows,lineartriples,strictcols]==[source[x] for x in ['rows','coefficients','linear_rows','linear_triples','strict_linear_columns']]
triples=[0,0,0]
for a,b in source['labels']:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for k,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):triples[k]+=1
assert triples==source['raw_triples']
group=js(E/'sharper-group-probe.json');domains=[(i,r,d) for i in range(13) for r in range(2,43) for d in sorted(set([max(0,i+r-2),max(0,i+r-1),i+2*r,i+4*r-1]))];groups=sum(2*r-1 for i,r,d in domains);linear=sum(d+1>=i+4*r for i,r,d in domains)
stronger=js(E/'stronger-base-probe.json');strongercount=sum(2*r-1 for i in range(31) for r in range(2,101))
stein=js(E/'stein-probe.json');steincount=sum(r for a in range(2,13) for r in range(5,34))
stress=js(E/'stein-stress.json');stresscount=sum(len(set([r,r+1,r+r//4,r+r//2,2*r-3,2*r-2,2*r-1])) for a in [2,3,10,20,50,100,300,1000,10000] for r in [5,10,20,30,50,100,300])
large=js(E/'stein-large-stress.json');largedomains=[(a,r,m) for r in [1000,10000,1000000] for a in [2,10,100,r//100,r//10,r,10*r,100*r] for m in [r,r+r//10,r+r//2,2*r-r//10,2*r-2]]
assert [groups,len(domains),linear,strongercount,steincount,stresscount,len(largedomains)]==[91676,2132,533,stronger['checks'],stein['cases'],stress['cases'],large['cases']]
# Literal monomial parsing only; no expansion, multiplication, evaluation or sign calculation.
def parse_terms(expr,vs):
 out=[]
 for line in expr.strip().splitlines():
  line=line.strip();z=re.fullmatch(r'([+-]?\d+)((?:\*[A-Za-z]+(?:\^\d+)?)*)',line);assert z,line
  exps={v:0 for v in vs}
  for name,exp in re.findall(r'\*([A-Za-z]+)(?:\^(\d+))?',z[2]):assert name in exps;exps[name]=int(exp or '1')
  out.append([[exps[v] for v in vs],z[1].removeprefix('+')])
 return out
weighted=js(E/'weighted-beta-symbolic.json');cert=js(E/'weighted-beta-positive-certificate.json');s=text(A/'research/MarkovTopWeightedBetaMeanMCA9.lean')
reduced=parse_terms(s.split('def betaWeightedPolynomialMCA9',1)[1].split(':=',1)[1].split('def betaWeightedSumMCA9',1)[0],['a','m','r','H'])
positive=parse_terms(s.split('have he :',1)[1].split('=',1)[1].split(':= by',1)[0],['x','y','s','z'])
assert reduced==weighted['reduced'] and len(reduced)==123
assert positive==cert['coefficients'] and len(positive)==cert['terms']==176
assert all(re.fullmatch('[1-9][0-9]*',c) for e,c in positive)
assert positive[0]==[[0,0,0,0],'3338496']
symbolic=js(E/'stein-symbolic.json');square=js(E/'stein-square-certificate.json');ptilt=js(E/'p-tilt-obstruction.json')
commands=js(T/'markov_worker_000186_completed_commands.json');inline=[x for x in commands if any(n in x['command'] for n in ['stein-large-stress.json','stein-square-certificate.json','p-tilt-obstruction.json'])]
finite={**base,'source':{'result':source,'q_domain':qs,'family_count':76,'rows_recounted':rows,'coefficient_positions_recounted':coef,'linear_rows_recounted':linearrows,'linear_triples_recounted':lineartriples,'strict_columns_recounted':strictcols,'polygon_triples_recounted':triples,'total_polygon_triples':sum(triples),'saved_labels':len(source['labels']),'unique_saved_labels':len(set(map(tuple,source['labels']))),'zero_count_saved_not_recomputed':source['zeros'],'random_paths_regenerated':False,'random_scope':'18 seed186 paths oflength6 plus0/1and1/1; use saved93deduplicated labels only.'},'groups':{'result':group,'group_indices':groups,'full_gap_parameter_cases':len(domains),'linear_parameter_cases':linear,'domain':'i0..12,r2..42,dsetdeduplicated[max(0,i+r-2),max(0,i+r-1),i+2r,i+4r-1],m2..2r'},'stronger_base':{'result':stronger,'domain_count':strongercount,'domain':'i0..30,r2..100,m2..2r,H=3a+r+4','min_sign_warning':'min_sign=1 initialized and never updated; not a computed minimum. Failures capped30.'},'stein':{'result':stein,'domain_count':steincount,'domain':'a2..12,r5..33,mr..2r-1','scope':'Saved auxiliary identity/mean/boundary/bound observations only; universal telescoping and positivity unproved.'},'stein_stress':{'result':stress,'domain_count':stresscount,'scope':'Ninea entries,sevenr entries,deduplicated sevenm expressions; finiteonly.'},'stein_large':{'result':large,'domain_count_with_multiplicity':len(largedomains),'distinct_domain_count':len(set(largedomains)),'failure_entries':len(large['failures']),'distinct_failure_parameter_count':len(set((x['a'],x['r'],x['m']) for x in large['failures'])),'scope':'Three r values; eight a entries retain repetitions, five m entries each.28 recorded failures, no source/root refutation. Saved event218 reports8 nonpositiveC entries; no value recomputation.'},'weighted_certificate':{'result_pin':pin(E/'weighted-beta-positive-certificate.json'),'symbolic_pin':pin(E/'weighted-beta-symbolic.json'),'reduced_literal_count':123,'positive_literal_count':176,'reduced_and_positive_literals_match_source':True,'constant_literal':positive[0],'falling_moment_pairs':list(weighted['falling']),'earlier_shift_negative_literals':weighted['negative'],'boundary_negative_literals':weighted['boundary_negative'],'earlier_shift_scope':'a=x+1 candidate has3 negative literals; accepteda=x+2 certificate has176 positive literals. No polynomial expansion by auditor.'},'stein_symbolic':{'result_pin':pin(E/'stein-symbolic.json'),'serialized_counts':{k:len(symbolic[k]) for k in ['mean','bound','shifted_mean','shifted_bound','negative_mean','negative_bound']},'antiderivative_lengths':{k:len(v) for k,v in symbolic['antiderivative'].items()},'scope':'Candidate only, not Lean-proved universal sign/telescoping.'},'stein_square':{'result_pin':pin(E/'stein-square-certificate.json'),'counts':{k:{a:len(b) for a,b in v.items()} for k,v in square.items()},'failure_literals':{k:v['failures'] for k,v in square.items()},'scope':'Greedy auxiliary square search incomplete:0/1 squares and3/9 unresolved entries; no proof status.'},'ptilt':{'result':ptilt,'scope':'Auxiliary weighted-sum failure with formalsumargumentr0 andactual terminalgroupr49positive; not a rawsourcefailure.'},'inline_action_records':inline,'limitations':'Only retained literals, source parsing and domain counts. No project code/generator execution, mathematical values/RNG recomputed, experiment rerun or proof completion.'}
scripts=[pin(A/'research'/n) for n in ['experiment_ca9709f2.py','stronger_beta_probe_ca9709f2.py','stein_probe_ca9709f2.py','stein_stress_ca9709f2.py','weighted_beta_symbolic_ca9709f2.py','generate_weighted_mean_ca9709f2.py','stein_symbolic_ca9709f2.py']]
hashes={**base,'receipt_pin':pin(W/'receipt.json'),'receipt_watch':watch,'prior185_seal_pin':pin(T/'markov_worker_000185_audit_integrity.json'),'primary_source_pin':pin(T/'markov_worker_000186_primary_source_pins.json'),'modules':modules,'counts':counts,'source_level_scope':scope,'scripts':scripts,'script_invocation_boundary':'Final script hashes alone do not establish invocation-time versions. Symbolic output138 was superseded by generator-triggered explicit run() at148 with different seconds. Exact savedcommands/literalbindings retained by V/M.','audit_helper_corrections':['Pre-seal identity check caught stale worker/request metadata in own helper-derived H/S/F; corrected186/request and regenerated only static audit outputs before any closing window.', 'Narrow unsealed provenance refinement: symbolic output148 comes from generator explicit run(), not import side effect; final generator later edited.', 'Initial own helper execution stopped at parse time on missing whitespace after and; corrected before any outputs.', 'Exploratory display of stein-square-certificate was output-truncated; subsequently read only bounded schema/counts and failure literals. No claim of visual review of every candidate coefficient.'],'own_helper_pin':pin(T/'static_math_worker186.py'),'input_pins':list(pins.values())}
for n,d in [('mathematical_source_hashes',hashes),('source_structure_audit',structure),('finite_domain_audit',finite)]:dump(n,d)
print(json.dumps({'counts':counts,'domains':[rows,coef,linearrows,lineartriples,strictcols,triples,groups,len(domains),linear,strongercount,steincount,stresscount,len(largedomains),len(set(largedomains))]}))
