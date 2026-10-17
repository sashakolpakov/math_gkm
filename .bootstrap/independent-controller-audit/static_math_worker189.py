"""Audit-owned literal parsing, hashes, and index-domain counts only. Never imports or executes project programs; never evaluates mathematical coefficient/weight/gap expressions."""
from pathlib import Path
import json,re,hashlib,datetime,ast,collections
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000189';A=W/'artifacts';pins={}
def pin(p):
 p=Path(p);b=p.read_bytes();z=dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest());pins[str(p)]=z;return z
def locate(rel):return A/rel if (A/rel).is_file() else P/rel
def text(p):pin(p);return Path(p).read_text()
def js(p):return json.loads(text(p))
def readrel(rel):return text(locate(rel))
def ej(n):return js(locate('evidence/markov-97b019af/'+n+'.json'))
def dump(n,x):
 p=T/('markov_worker_000189_'+n+'.json');p.write_text(json.dumps(x,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
base=dict(worker=189,request='97b019af81a143628246a03e1f19b898',created_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),host_status='uncertain_effects; watchdog exited without receipt; reconciliation reportnull; no completed or timeout upgrade',scope='Closed interrupted189 archive-first with explicitly named current fallbacks for missing partial-archive files. No later worker material, mathematical-value recomputation, research execution, edits or assistance.')
v=ej('validation');mods=ej('mathematical-modules');primary=js(T/'markov_worker_000189_primary_source_pins.json')
def decls(s):
 starts=list(re.finditer(r'(?m)^(?:private\s+)?(theorem|lemma|def|abbrev|axiom|opaque)\s+(\S+)',s));out=[]
 for i,z in enumerate(starts):
  b=s[z.start():starts[i+1].start() if i+1<len(starts) else len(s)]
  out.append(dict(kind=z[1],name=z[2],line=s.count('\n',0,z.start())+1,header=b.split(':=',1)[0].strip(),body_sha256=hashlib.sha256(b.encode()).hexdigest()))
 return out
modules=[];sources={}
for m in mods:
 p=locate('research/'+m+'.lean');s=text(p);sources[m]=s;sp=pin(p);br=locate(v['compilation'][m]);b=js(br);snap=pin(locate(str(Path(v['compilation'][m]).with_suffix('.lean'))))
 assert sp['sha256']==snap['sha256']==v['modules'][m]==b['modules'][m] and b['returncode']==0
 assert next(x['sha256'] for x in primary['files'] if x['module']==m)==sp['sha256']
 d=decls(s);modules.append(dict(module=m,source_pin=sp,archive_present=(A/'research'/(m+'.lean')).is_file(),imports=re.findall(r'(?m)^import\s+(\S+)',s),declarations=d,theorems=sum(x['kind'] in ['theorem','lemma'] for x in d),definitions=sum(x['kind'] in ['def','abbrev'] for x in d),successful_build=pin(br),build_snapshot=snap,admission_literal_tokens=re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s))))
counts=dict(selected_modules=len(modules),theorems=sum(x['theorems'] for x in modules),definitions=sum(x['definitions'] for x in modules));assert counts['selected_modules']==23 and counts['theorems']==66
# Read every RHS literally, compare he/hp syntax; do NOT expand or evaluate expressions.
def expr(s):return ast.parse(' '.join(s.strip().split()).replace('^','**'),mode='eval').body
def positive_syntax(n):
 if isinstance(n,ast.Constant):return type(n.value)==int and n.value>=0
 if isinstance(n,ast.Name):return n.id in ['x','y','z','h','d']
 if isinstance(n,ast.BinOp) and isinstance(n.op,(ast.Add,ast.Mult)):return positive_syntax(n.left) and positive_syntax(n.right)
 if isinstance(n,ast.BinOp) and isinstance(n.op,ast.Pow):return positive_syntax(n.left) and isinstance(n.right,ast.Constant) and type(n.right.value)==int and n.right.value>=0
 return False
def coef_literals(n):
 if isinstance(n,ast.Constant):return [str(n.value)]
 if isinstance(n,ast.Name):return []
 if isinstance(n,ast.BinOp) and isinstance(n.op,ast.Pow):return coef_literals(n.left)
 return coef_literals(n.left)+coef_literals(n.right)
def rhs_pairs(s):
 hs=re.findall(r'have he\s*:[\s\S]*?=(?!>)\s*([\s\S]*?)\s*:=\s*by',s)
 ps=re.findall(r'have hp\s*:\s*\(0:[ℝℚ]\)\s*<\s*([\s\S]*?)\s*:=\s*by',s)
 assert len(hs)==len(ps)
 return list(zip(hs,ps))
certs=[];small=ej('small-gap-certificates');smallrows={r['i']:r for r in small['rows']}
for suffix in ['FourthSigns','SixthDeltaSign','SixthASign','SixthCSign','SixthKSign','SixthReducedSign','Small2Gap','Small3Gap','Small4Gap','Small5Gap']:
 m='MarkovTop'+suffix+'M97B';s=sources[m]
 for h,p in rhs_pairs(s):
  hn,pn=expr(h),expr(p);assert ast.dump(hn)==ast.dump(pn) and positive_syntax(hn)
  poly=hn.right if suffix.startswith('Small') else hn
  lits=coef_literals(poly);row=dict(module=m,rhs_sha256=hashlib.sha256(h.encode()).hexdigest(),positive_rhs_same_ast=True,nonnegative_literal_syntax=True,coefficient_literal_count=len(lits),coefficient_literals_sha256=hashlib.sha256(json.dumps(lits).encode()).hexdigest(),constant_positivity='Compiler positivity proof; auditor checks syntax/literals, not evaluated polynomial sign')
  if suffix.startswith('Small'):
   k=int(suffix[5]);r=smallrows[k];assert collections.Counter(lits)==collections.Counter(c[2] for c in r['coefficients']);assert len(lits)==r['terms'];row.update(i=k,offset=r['offset'],scale=r['scale'],coefficient_multiset_matches_saved_array=True,terms=r['terms'],constant_literal=r['coefficients'][0][2])
  certs.append(row)
assert [x['coefficient_literal_count'] for x in certs]==[16,28,65,80,28,34,224,156,195,238,285]
# Index-only finite domains. Counts involving values/zeros remain saved claims.
source=ej('source-experiment');qs=list(range(1,21))+[28,40,60,100];rows=coef=quad=novel=0
for q in qs:
 for residue in [1,2]:
  b=3*q+residue
  for t in range(q+3):
   rows+=1;coef+=t+5
   for c in range(5,t-1):
    if 8*(t-c-1)<=(c-5)**2:quad+=1;novel+=6*t>b+3*c+4 and 4*t+2>5*c
assert [rows,coef,quad,novel]==[source[k] for k in ['rows','coefficients','quadratic_triples','beyond_old_linear_and_wedge']]
triples=[0,0,0]
for a,b in source['labels']:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for d,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):triples[d]+=1
assert triples==source['raw_triples'] and len(source['labels'])==source['fractions']==len(set(map(tuple,source['labels'])))
fm=ej('fourth-moment-experiment');fi=[];fq=[];fb=[]
for i in [0,1,2,3,5,9,19,49,99]:
 for r in [1,2,5,10,30,100]:
  for d in [max(i+r-2,0),i+2*r+1]:
   for m in sorted(set([0,1,2,r,r+1,3*r//2,2*r-2,2*r-1,2*r,2*r+1])):
    fi.append((i,r,d,m))
    if i>=2 and 2<=m<=2*r and 4*(m-2)<=(i-2)**2 and 6*(i+1)+m+8<=2*(d+2*i+9):
     fq.append((i,r,d,m))
     if 2*m>i+1:fb.append((i,r,d,m))
assert [len(fi),len(fq),len(fb)]==[fm[k] for k in ['cases','quadratic_groups','beyond_old_wedge']]
se=ej('sixth-exact-experiment');si=[];sg=[];so=[]
for a in [1,2,3,6,7,8,11,20,50]:
 for r in [1,2,5,10,30,100]:
  for H in [3*a+r+4,3*a+2*r+7]:
   for m in sorted(set([0,1,2,r,r+1,2*r-2,2*r-1,2*r])):
    si.append((a,r,H,m))
    if a>=7 and 2<=m<=2*r:
     sg.append((a,r,H,m))
     if 4*(m-2)>(a-3)**2:so.append((a,r,H,m))
assert [len(si),len(sg),len(so)]==[se[k] for k in ['cases','groups','outside_quadratic']]
assert se['generator_checks']==2*len(si) and all(se[k]==len(si) for k in ['base_identities','actual_bounds','certificate_checks'])
probe=ej('sixth-probe');indices=[(a,r,m,3*a+r+4) for a in [3,5,10,20,50,100,500] for r in [5,10,30,100,500] for m in [r,3*r//2,2*r-2,2*r]]
assert indices==[(r['a'],r['r'],r['m'],r['H']) for r in probe['tests']]
sp=ej('sixth-sign-probe')
for name,experiment,script in [('source',source,'experiment_97b019af.py'),('fourth',fm,'experiment_97b019af.py'),('sixth',se,'sixth_exact_experiment_97b019af.py')]:assert experiment['script_sha256']==pin(locate('research/'+script))['sha256']
finite={**base,'source_experiment':dict(pin=pin(locate('evidence/markov-97b019af/source-experiment.json')),qs=qs,family_paths=48,rows=rows,coefficient_comparisons=coef,quadratic_triples=quad,beyond_old_linear_and_wedge=novel,raw_polygon_counts=triples,raw_polygon_total=sum(triples),saved_labels=source['labels'],unique_labels=63,additional_generation='15 seeded length-six path draws plus two endpoints; RNG/frame not rerun. 63 saved distinct labels counted, not independently reconstructed from draws.',saved_zeros=source['zeros'],saved_witness=source['witness'],saved_failures=source['failures'],zero_count_not_recomputed=True),'fourth_experiment':dict(saved=fm,index_cases=len(fi),distinct_index_cases=len(set(fi)),quadratic_groups=len(fq),beyond_old_wedge=len(fb),zero_mass_count_not_recomputed=True),'sixth_experiment':dict(saved=se,index_cases=len(si),distinct_index_cases=len(set(si)),positive_group_domain=len(sg),outside_quadratic_domain=len(so)),'sixth_probe':dict(status=probe['status'],polynomial_literal_entry_counts={k:len(v) for k,v in probe['polynomials'].items()},index_rows=len(indices),distinct_index_rows=len(set(indices)),saved_valid_flags=sum(r['valid'] for r in probe['tests']),saved_valid_outside_fourth_flags=sum(r['valid'] and not r['fourth'] for r in probe['tests']),saved_flags_not_recomputed=True),'sixth_sign_probe':dict(status=sp['status'],signed_reduced_entries=len(sp['reduced']),shifts=sp['shifts'],scope='Saved symbolic observations; offsets below7 do not refute source or prove certificate impossible. No symbolic expansion rerun.'),'literal_certificates':certs,'limits':'Own computations are index-domain counts and literal/hash comparisons only. No source coefficients, weights, binomials, moments, gaps, expression signs, RNG or proof checks computed.'}
scope={
'raw_upper':'Actual source a=3; q>=1,b=3q+1/3q+2;5<=t<=q+2,j=b+2-t; all natural starting i. Raw H product endpoints(i,j),(i+2,j) <=middle(i+1,j)^2. Direct path theorem assumes a=3,t>=5,3t<=b+5. No column, denominator-linear, gap, moment or formula premise remains. Zeros retained.',
'polygon':'Family theorem adds i>=1,i+2<=t and returns all three original polygon memberships. General row theorem does not filter indices. Natural j subtraction justified by family/sector conditions; small q with empty t interval vacuous.',
'generic':'TopSectorLCM55C: allnatural n,t,2t<=n,5<=t,3t<=n+5,allnatural i rawtemplate LC. TopMomentBoundM55C universally closed, not an eventual/fixed-depth statement.',
'assembly':'Exact inherited TopMomentBound iff TopInteriorWedge reduces to i>=2,r>=5,i+r<=d+2 plus two wedge exclusions. New sixth gap handles i>=6; explicit universal small2/3/4/5 short-sum certificates handle exhaustive remainder. No finite experiments used as premises.',
'fourth':'New actual beta likelihood/cut fourth moment attachment (188 conditional history unchanged). Group strict i>=2,2<=m<=2r,4(m-2)<=(i-2)^2 and H bound. Tail strict i>=2,r>=1,i+r<=d+2,8(r-1)<=(i-2)^2. Source c>=5,c+1<=t,quadratic8(t-c-1)<=(c-5)^2; polygon c+2<=t. This earlier189 route is subsumed by later all-column upper closure.',
'sixth':'All-natural exact cleared sixth moment including m<6; actual weighted moment bound retains cut endpoint1 and zero tails. Finite summation by parts handles D(0)=0,B(m)=0 explicitly. Two symmetric inward test functions give generator signs with actual likelihood. Scalar Den6*Delta*F2+Den6*A*L1+Den6*C*L2+(-K)*(Den6*x^6-Num6)=a*m*(m-1)*Reduced. Positive Delta,A,C,-K for a>=3,m>=2,2H>=6a+m+8; Reduced requires a>=7. Generic summation uses positive total mass plus three aggregate signs, not individual w nonneg; actual source supplies every premise.',
'small':'Rational d,h>=0, exact topShort gaps for auxiliary i=2,3,4,5 at T=h+i+2; positive factors product_{j<i}(T-j)^2*(T-i), no raw coefficient division. Natural topMass strict all d,T>=i+2. Positive literals156/195/238/285; compiler/replay verifies algebra, auditor only literal syntax.',
'root':'Conjecture63 iff ThreeAfterUpperM97B AND OtherFourM9E2, both remain open. UpperClosedRegion adds entire5<=t<=q+2 upperrow to188 TopClosedRegionM731. Residual H q+3<j,b<2j+1,j!=5,notUpperClosed. Residual V and D unchanged; allnaturals residual exactiff retains originalroot polygon/endpoints.',
'V_D':'V exclusions ((i=3or4)&j+1<=q)or(5<=i<=8&j+2<=q); D exclusions3<=i<=6,j+2<=q. D literal(i,j+2),(i+1,j+1),(i+2,j). No new V/D result.',
'candidate_limits':'Small5Fast duplicate-name diagnostic timed out and excluded; saved symbolic a=6 negative coefficient is auxiliary expansion observation, no source failure or root refutation. No full root completion or negation.',
'history':'Old212/195 and separate19, WindowLC/Abel,166 partialreplay,171hostnull and183uncertain ordinarycompile/separate184recovery retained. Current selected union trusts inherited compiled imports, not fresh whole-source rebuild.'}
structure={**base,'modules':modules,'counts':counts,'literal_certificates':certs,'source_level_scope':scope,'literal_directions':{'H':['(i,j)','(i+1,j)','(i+2,j)'],'V':['(i,j)','(i,j+1)','(i,j+2)'],'D':['(i,j+2)','(i+1,j+1)','(i+2,j)']}}
scriptnames=['experiment_97b019af.py','sixth_exact_experiment_97b019af.py','sixth_probe_97b019af.py','sixth_sign_probe_97b019af.py','generate_fourth_signs_97b019af.py','generate_sixth_certificate_97b019af.py','generate_small_gaps_97b019af.py','horner_small_97b019af.py','horner_sixth_reduced_97b019af.py']
scripts=[pin(locate('research/'+n)) for n in scriptnames]
notes=[pin(locate('research/markov-97b019af-'+n+'.md')) for n in ['mathematics','correspondence','operational','checkpoint-final','sixth-route','source-search']]
inherited=[pin(P/'research'/(n+'.lean')) for n in ['MarkovTopMomentsM55C','MarkovTopSectorM55C','MarkovTopFourthResidualM731','MarkovThreeSourceM9E2']]
hashes={**base,'reconciliation_pin':pin(W/'reconciliation.json'),'local_final_json_pin':pin(W/'final.json'),'operational_closure_pin':pin(T/'markov_worker_000189_operational_closure.json'),'receipt_watch_pin':pin(T/'markov_worker_000189_receipt_watch.json'),'prior188_integrity_pin':pin(T/'markov_worker_000188_audit_integrity.json'),'primary_source_pin':pin(T/'markov_worker_000189_primary_source_pins.json'),'modules':modules,'counts':counts,'notes':notes,'scripts':scripts,'named_inherited_sources':inherited,'audit_helper_corrections':['First helper run stopped before outputs because a partial-archive build JSON lacked its neighboring snapshot; snapshot is now resolved archive-first independently by exact path. Second parse stopped on Lean lambda =>; equality regex now excludes =>. No project changes or mathematical evaluation.'],'read_scope_exceptions':['Two guessed exact inherited names MarkovTopMomentM55C and MarkovTopSourceMB3E were absent; no broad search followed. Correct exact inherited names obtained from sealed184 audit.','A bulk JSON display of saved symbolic arrays was truncated; subsequent own static parser read full bytes and extracted bounded literal counts, not mathematical evaluation.'],'own_helper_pin':pin(T/'static_math_worker189.py'),'input_pins':list(pins.values())}
for n,x in [('mathematical_source_hashes',hashes),('source_structure_audit',structure),('finite_domain_audit',finite)]:dump(n,x)
print(json.dumps(dict(counts=counts,source_counts=[rows,coef,quad,novel,triples],fourth_cases=len(fi),sixth_cases=len(si),certs=[r['coefficient_literal_count'] for r in certs])))
