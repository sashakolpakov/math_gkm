"""Audit-owned hashes, literal parsing and finite index counts only. No project code imports/execution or mathematical-value recomputation."""
from pathlib import Path
import json,re,hashlib,datetime
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000188';A=W/'artifacts';E=A/'evidence/markov-73199834';pins={}
def pin(p):
 p=Path(p);b=p.read_bytes();d=dict(path=str(p),bytes=len(b),sha256=hashlib.sha256(b).hexdigest());pins[str(p)]=d;return d
def text(p):pin(p);return Path(p).read_text()
def js(p):return json.loads(text(p))
def dump(n,d):
 p=T/('markov_worker_000188_'+n+'.json');p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
base=dict(worker=188,request='73199834a78f44d9a2ee490e7f54f632',created_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),historical_status='completed/return0, delivered report; no mathematical resolution',scope='Closed188 archive-first static review; no189+ sources/events, project execution, mathematical-value recomputation, edits or research assistance.',mathematical_values_recomputed=False)
v=js(E/'validation.json');mods=js(E/'mathematical-modules.json');receipt=js(W/'receipt.json');primary=js(T/'markov_worker_000188_primary_source_pins.json')
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
 d=declarations(s);modules.append(dict(module=m,source_pin=sp,imports=re.findall(r'(?m)^import\s+(\S+)',s),declarations=d,theorems=sum(x['kind'] in ['theorem','lemma'] for x in d),definitions=sum(x['kind'] in ['def','abbrev'] for x in d),successful_build=pin(br),build_snapshot=snap,admission_literal_tokens=re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s))))
counts=dict(selected_modules=len(modules),theorems=sum(x['theorems'] for x in modules),definitions=sum(x['definitions'] for x in modules));assert counts==dict(selected_modules=13,theorems=46,definitions=26)
tiny=A/'research/MarkovTopFirstCentralTinyM731.lean';tinytext=text(tiny);tinydecl=declarations(tinytext);assert len(tinydecl)==3 and all(x['kind']=='def' for x in tinydecl)
compiled_only=dict(module='MarkovTopFirstCentralTinyM731',source_pin=pin(tiny),declarations=tinydecl,status='Ordinary compiled diagnostic, unselected and unimported by selected graph. Three names overlap selected Defs; no theorem closures or replay credit. Not a pending source proof.')
scope={
 'new_raw':'For q>=1, both actual numerator-three families b=3q+1/3q+2, every6<=t<=q+2: raw(4,b+2-t)*raw(6,b+2-t)<raw(5,b+2-t)^2. ONE horizontal start4, not three separate LC starts. All three points formally in original polygon. Path theorem existentially classifies q/residue; no source formula/gap assumption remains. No new V/D region; no whole-row improvement.',
 'generic_fourth':'Rational topShort(d,h+3,1)*topShort(...,3)<topShort(...,2)^2 for d,h>=0, by154positive monomials scaled50295168000. Natural topMass(d,T,1..3) strict forT>=3. tailGap(1,d,r)>0 forr>=2; actual source template needs t>=6,2t<=n. The family q bound discharges this, includingt=6endpoint; smallq may have no admissiblet.',
 'first_central':'New188 completes fresh margin/attachment, not a retrospective upgrade of187timeouts/unbuilt text. For i>=1,r>=5,i+r<=d+2, actual betaGroup(d,i,r,r)>0. Q-free base cut sum is first provedpositive using cleared moment, mass lower bound and negative endpoint scalar; actual q-pair then attached by finite covariance. Both endpoint corrections retained.',
 'central_identity':'For r>=1 the first-central q-free cut sum is16*betaWeightedSum+8r*W0*F0. Interior cut16k(r-k), endpoint cut4r. D=(2a)..(2a+5)>0, N=2a^2(a+1)r(r-1)*weightedPolynomial, Margin=2N(r+1)+r*F0*D. Margin=a^2(a+1)r(r-1)*Reduced;78signed reduced terms,90positive shifted Horner coefficients undera>=2,r>=5,H>=3a+r+4. No endpoint discarded.',
 'integer_representation':'QDen=choose(d+2i+8,i+3)>0; q_k*QDen=choose(d+2i+k+8,i+3). Integer density positive for all naturals. Integer cut=1atk=r,4(r-k)belowr,0above. IntegerGroup cast=QDen^2*realGroup; IntegerTotal=sum m0..2r; Total cast=2QDen^2*densitygap; tailDen^2*Total=2QDen^2*tailGap. Both strict/nonstrict sign iff all naturals, includingzero/smallindices; no universal sign theorem.',
 'central_residual':'CentralInteriorM731 retainsi>=1,r>=5,i+r<=d+2,d+1<i+4r,i+1<4r, andr<m,m+2<=2r. Exactiff olderCentralBetaMCA9 after removing provedm=r and inherited wedge. This groupwise condition is sufficient for total gap/raw upperH but not asserted equivalent to root. Integer group reformulation exact. Stillopen.',
 'total_residual':'TopInteriorWedgeM731 same total conditions excepti>=2 (r>=5,i+r<=d+2,d+1<i+4r,i+1<4r); exactiff TopWedgeStripM208 andTopMomentBoundM55C. IntegerTotal nonneg formulation exact. Stillopen; do not confusei>=2 total withi>=1 groupwisecentral.',
 'root':'Conjecture63 iff ThreeFrontierM731 AND OtherFourM9E2, bothopen. TopClosedM731 adds existence of6<=t<=q+2,j=b+2-t,i=4 to priorM208. ResidualH quantifies all naturali,j withq+3<j,b<2j+1,j!=5,notTopClosed, no additional InPolygon premise; originalrootpolygon guards retained by exactiff.',
 'V_D':'UnchangedVexclusions (i=3or4 andj+1<=q)or(5<=i<=8 andj+2<=q); unchangedDexclusion3<=i<=6,j+2<=q. Dliteralraw(i,j+2),(i+1,j+1),(i+2,j). No new V/D theorem.',
 'scaling':'Auxiliary real algebra Num=u(g+u)(g-2a)^2, Den>0 andNum>0 fora>0,u>0,g>=3a+1; a1/5,u4/5,g8/5 q-free polynomial negative but Numpositive. No asymptotic limit, uniform error, source/rawcounterexample proved.',
 'fourth_moment_scalar':'J=a*m(m-1)*Reduced,83signedterms. Undera=x+3,m=y+2,H=3a+m/2+4+z,x/y/z>=0 and4y<=x^2,2Reduced=Rem+(x^2-4y)Fac;84positive Remterms(constant9937152),11positive Facterms(constant35930064). HenceJ>0 fora>=3,m>=2,4(m-2)<=(a-3)^2,2H>=6a+m+8. Scalarcertificate only.',
 'conditional_sum':'Pointidentity Den*Delta*(4a+7)*F2+Den[2(a+2)Delta+Cp]*Lp+Cp(8a+14)[Den*(k-m/2)^4-Num]=J. Finite sum theorem additionally assumes Delta>0,Cp>=0,positive totalmass,sum wLp<=0,andfourthmomentdefectsum<=0. Weights need not individuallynonnegative in statement; explicit aggregate premises suffice. No actualsource quadraticregion follows yet.',
 'unproved_attachments':'Actual normalized fourthmoment/covariance/sign/source bridges remain open in this run. Proposed i>=2,8(r-1)<=(i-2)^2 region is not an accepted source theorem or rootresidualremoval. Finite210cases do not supply proof.',
 'obstructions':'Exact saved integer q-free cut sum negative at a800,r4000,m6400,H6404,i799,d4797 while actual q-scaled group positive; finite only, neither source coefficienttriple. Scalingwitness auxiliary. No rootrefutation.',
 'history':'Old121212/195 and separate19,WindowLC/Abel,166 partialreplay, historical183uncertain ordinarycompile and separate184recovery remain. New selection not freshrebuild of inheritedwholechain. Originalrootopen.'}
structure={**base,'modules':modules,'counts':counts,'compiled_only':compiled_only,'source_level_scope':scope,'literal_indices':{'H':['(i,j)','(i+1,j)','(i+2,j)'],'V':['(i,j)','(i,j+1)','(i,j+2)'],'D':['(i,j+2)','(i+1,j+1)','(i+2,j)']},'zero_boundaries':['Natural source subtraction guarded; actual qfamily and t bounds establish nonnegative auxiliary parameters.','Cut endpoint1, zeros above r and both first-central endpoint corrections retained.','Only auxiliary strictly positive scales cancelled; no rawcoefficient division.','The new source theorem includes allthreeoriginalpolygon positions, includingt=6 endpoint.','All-natural integer equivalences include zero/smallcases; not sign proofs.']}
source=js(E/'source-experiment.json');qs=list(range(1,19))+[27,37,49,61,83];rows=coef=wedge=beyond=0
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
integer=js(E/'integer-experiment.json');cases=[(i,r,d) for i in [1,2,3,6,11] for r in [5,6,9,15,25] for d in [i+r-2,i+2*r,i+4*r]];ng=sum(2*r+1 for i,r,d in cases);fourthindices=[(tt,d) for tt in list(range(3,31))+[50,100,250,1000] for d in [0,1,tt,tt*tt]]
assert len(cases)==integer['total_checks']==integer['central_checks']==75 and ng==integer['q_identities']==integer['group_identities']==1875 and len(fourthindices)==integer['raw_fourth_checks']==128
fm=js(E/'fourth-moment-experiment.json');fmindices=[(a,r,m) for a in [2,3,5,10,20,50,100] for r in [5,10,20,50,100] for m in sorted(set([r,r+1,3*r//2,2*r-2,2*r-1,2*r]))];quad=[x for x in fmindices if x[0]>=3 and 4*(x[2]-2)<=(x[0]-3)**2];beyondold=[x for x in quad if x[0]<2*x[2]]
assert len(fmindices)==fm['cases']==fm['base_moment_identities']==fm['actual_moment_bounds']==210 and len(quad)==fm['quadratic_cases']==88 and len(beyondold)==fm['beyond_old_wedge']==47
# Float multiplication here constructs original integer indices only; no weights/gaps/moments evaluated.
probe=js(E/'qfree-central-probe.json');probep=[(a,r,r+int(f*r)) for a in [2,3,5,10,20,50,100,200,1000] for r in [5,10,30,100,300,1000,3000] for f in [0,.01,.05,.1,.25,.5,.75,.9] if r+int(f*r)<=2*r-2];assert len(probep)==probe['cases']==486
stress=js(E/'qfree-central-stress.json');stressp=[(a,r,r+int(f*r),ex) for a in [2,3,10,20,100,1000,10000,100000] for r in [10,100,1000,10000] for f in [0,.001,.01,.05,.1,.3,.5,.7,.9,.99] if r+int(f*r)<=2*r-2 for ex in [0,r,10*r,1000*r]];assert len(stressp)==stress['cases']==1184
search=js(E/'qfree-obstruction-search.json');searchp=[(a,r,mm*r//10) for r in [200,500,1000,2000,3000,4000,5000,6000,8000] for a in [r//20,r//10,r//5,r//2,r,2*r] for mm in [12,14,15,16,17,18]];assert all(tuple(z[:3]) in searchp for z in search)
ob=js(E/'qfree-exact-obstruction.json');decimals={}
for key in ['qfree_sum','actual_scaled_sum','qfree_mass','actual_scaled_mass','q_denominator']:
 z=ob[key];assert re.fullmatch('-?[0-9]+',z['decimal']);digest=hashlib.sha256(z['decimal'].encode()).hexdigest();assert digest==z['sha256'];assert (z['decimal'].startswith('-'))==(z['sign']==-1);decimals[key]=dict(decimal_sha256=digest,lexical_sign_matches=True,reported_bits_not_recomputed=z['bits'])
assert ob['terms']==len(range(ob['parameters']['m']-ob['parameters']['r'],ob['parameters']['r']+1))==1601
def terms(expr,vs):
 out=[]
 for line in expr.strip().splitlines():
  z=re.fullmatch(r'([+-]?\d+)((?:\*[A-Za-z]+(?:\^\d+)?)*)',line.strip().removesuffix('+'));assert z,line;ex={v:0 for v in vs}
  for name,exp in re.findall(r'\*([A-Za-z]+)(?:\^(\d+))?',z[2]):assert name in ex;ex[name]=int(exp or '1')
  out.append([[ex[v] for v in vs],z[1].removeprefix('+')])
 return out
fg=js(E/'fourth-gap-certificate.json');fgs=text(A/'research/MarkovTopFourthGapM731.lean');expr=fgs.split('have he :',1)[1].split('=',1)[1].split(':= by',1)[0];fglit=terms(expr,['h','d']);assert [[*e,c] for e,c in fglit]==fg['coefficients'] and len(fglit)==154 and fg['scale']==50295168000;assert all(re.fullmatch('[1-9][0-9]*',c) for e,c in fglit)
fmp=js(E/'fourth-moment-probe.json');fmc=js(E/'fourth-moment-certificate.json');fms=text(A/'research/MarkovTopFourthMomentCertificateM731.lean');red=terms(fms.split('def fourthReducedM731',1)[1].split(':=',1)[1].split('\ntheorem ',1)[0],['a','m','H','unused']);assert red==fmp['reduced'] and len(red)==83
cg=js(E/'central-generator-symbolic.json');cgs={k:dict(terms=len(z),negative=sum(c.startswith('-') for ex,c in z)) for k,z in cg['shifted'].items()};assert cgs==cg['summary']
commands=js(T/'markov_worker_000188_completed_commands.json');inlines=[x for x in commands if any(n in x['command'] for n in ['qfree-central-probe.json','qfree-central-stress.json','qfree-obstruction-search.json','wedge-slope-probe.json'])]
finite={**base,'source':dict(result=source,q_domain=qs,families=46,recounted_rows=rows,recounted_coefficients=coef,recounted_wedge=wedge,recounted_beyond_old_column=beyond,recounted_polygon=triples,total_polygon=sum(triples),labels=len(source['labels']),unique_labels=len(set(map(tuple,source['labels']))),zeros_reported_not_recomputed=source['zeros'],scope='Inherited187 wedge counter, not a dedicated new-fourth counter; beyond_linear excludes only186columnbound. Saved60labels used; no seeded random paths regenerated.'),'integer':dict(result=integer,case_count=len(cases),distinct_cases=len(set(cases)),q_and_group_indices=ng,fourth_auxiliary_count=len(fourthindices),fourth_auxiliary_distinct=len(set(fourthindices)),scope='raw_fourth_checks name denotes auxiliary topMass triples, not actual source identities; no numerical signs recomputed.'),'fourth_moment':dict(result=fm,domain_count=len(fmindices),distinct=len(set(fmindices)),quadratic_count=len(quad),beyond_old_count=len(beyondold),scope='Finite only; actual normalized-moment attachment not formalized.'),'qfree_probe':dict(result=probe,count=len(probep),distinct=len(set(probep)),scope='Floating exploratory, duplicate index counts retained.'),'qfree_stress':dict(result=stress,count=len(stressp),distinct=len(set(stressp)),failure_entries=len(stress['failures']),scope='Floating exploratory, three auxiliary failures, no raw source refutation.'),'qfree_search':dict(saved=search,domain_count=len(searchp),distinct=len(set(searchp)),saved_failures=len(search),failure_indices_in_domain=True),'qfree_exact':dict(pin=pin(E/'qfree-exact-obstruction.json'),parameters=ob['parameters'],terms=ob['terms'],decimal_lexical_checks=decimals,interpretation=ob['interpretation'],scope='Recorded exact experiment only, no integer values/sums/bitlength recomputed, no Lean/rawcounterexample.'),'fourth_gap':dict(pin=pin(E/'fourth-gap-certificate.json'),terms=154,source_literal_array_matches=True,positive_literals=True,scale=fg['scale'],constant_literal=fglit[0][1]),'fourth_moment_cert':dict(pin=pin(E/'fourth-moment-certificate.json'),certificate=fmc,reduced_literal_array_matches=True,reduced_terms=83,probe_rows=len(fmp['rows']),shifted_rows=len(fmp['shifted_rows']),positive_candidate_arrays=len(fmp['positive_certificates']),scope='Selectedoffset3/c4;84Rem/11Fac source counts described in main. No polynomial expansion or rational scaling recomputed. Compiler/replay checks algebra.'),'central_generator':dict(pin=pin(E/'central-generator-symbolic.json'),literal_shifted_summary=cgs,scope='Signed candidate, not accepted universal generator sign.'),'wedge_slopes':js(E/'wedge-slope-probe.json'),'inline_action_records':inlines,'limits':'Only index-domain enumeration and literal/hash comparisons. No coefficients, binomials, weights, gaps, moments, signs of evaluated expressions, RNG or proof checks recomputed.'}
scripts=[pin(A/'research'/n) for n in ['experiment_73199834.py','exact_integer_experiment_73199834.py','fourth_moment_experiment_73199834.py','qfree_obstruction_73199834.py','central_generator_73199834.py','fourth_moment_probe_73199834.py','generate_fourth_gap_73199834.py','generate_fourth_moment_73199834.py','horner_margin_73199834.py']]
notes=[pin(A/'research'/n) for n in ['markov-73199834-operational.md','markov-73199834-correspondence.md','markov-73199834-fourth-moment-route.md']]
hashes={**base,'receipt_pin':pin(W/'receipt.json'),'receipt_watch':js(T/'markov_worker_000188_receipt_watch.json'),'prior187_seal_pin':pin(T/'markov_worker_000187_audit_integrity.json'),'primary_source_pin':pin(T/'markov_worker_000188_primary_source_pins.json'),'modules':modules,'counts':counts,'compiled_only':compiled_only,'source_level_scope':scope,'scripts':scripts,'notes':notes,'audit_helper_corrections':['Initial own literal-parser assertion stopped before H/S/F output because FourthGap uses trailing plus signs; parser corrected to strip that syntax, no project changes or mathematical evaluation.'],'script_boundary':'Scripts statically read only. Six symbolic/generator/obstruction helpers have top-level effects; none imported/executed by auditor. Final script bytes do not authenticate every earlier invocation; V/M retain command/version chronology.','own_helper_pin':pin(T/'static_math_worker188.py'),'input_pins':list(pins.values())}
for n,d in [('mathematical_source_hashes',hashes),('source_structure_audit',structure),('finite_domain_audit',finite)]:dump(n,d)
print(json.dumps(dict(counts=counts,domains=[rows,coef,wedge,beyond,triples,len(cases),ng,len(fmindices),len(quad),len(beyondold),len(probep),len(set(probep)),len(stressp),len(set(stressp)),len(searchp),len(search)])))
