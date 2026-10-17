"""Audit-owned static parsing, byte hashes and finite index-domain counts only.
Never imports or executes project modules; never computes coefficients/gaps/signs.
Input discovery is exclusively the already bounded183 inventory and sealed182 notes.
"""
from pathlib import Path
import json,re,hashlib,datetime,ast
T=Path('/private/tmp/math_gkm_godel_20261013')
P=Path('/Users/sasha/math_gkm')
B=T/'markov_worker_000183_partial_retention_bundle'
I=json.loads((T/'markov_worker_000183_initial_inventory.json').read_text())
C=json.loads((T/'markov_worker_000183_completed_commands.json').read_text())
req='55cf20d29efe4eebb6677e949f2beb36'
def sha(b):return hashlib.sha256(b).hexdigest()
def pin(p):
 b=p.read_bytes();return {'path':str(p),'bytes':len(b),'sha256':sha(b)}
def loc(r):return Path(I['archive'][r]['path']) if r in I['archive'] and not r.endswith('.olean') else B/r
def read(r):return loc(r).read_text()
def data(r):return json.loads(read('evidence/markov-55cf20d2/'+r))
def dump(n,x):
 p=T/f'markov_worker_000183_{n}.json';p.write_text(json.dumps(x,indent=2,ensure_ascii=False)+'\n');print(json.dumps(pin(p)))
base={'worker':183,'request':req,'created_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'historical_status':'uncertain_effects, interrupted controller/watchdog; report null; no receipt','scope':'Static closed183 archive-first; exact missing text counterparts from separate retained bundle; no research execution or mathematical-value recomputation','mathematical_values_recomputed':False}
modules=[]
for r in sorted(I['current']):
 if r.startswith('research/Markov') and r.endswith('M55C.lean'):
  s=read(r); ds=[]
  starts=list(re.finditer(r'(?m)^(?:private\s+)?(theorem|lemma|def|abbrev|axiom|opaque)\s+(\S+)',s))
  for ix,m in enumerate(starts):
   end=starts[ix+1].start() if ix+1<len(starts) else len(s)
   body=s[m.start():end];head=body.split(':=',1)[0].strip()
   ds.append({'kind':m[1],'name':m[2],'line':s.count('\n',0,m.start())+1,'header':head,'body_sha256':sha(body.encode())})
  x={'module':Path(r).stem,'path':r,**pin(loc(r)),'project_relative_path':r,'archive_available':r in I['archive'],'initial_current':I['current'][r],'imports':re.findall(r'(?m)^import\s+(\S+)',s),'declarations':ds,'theorem_count':sum(d['kind'] in ('theorem','lemma') for d in ds),'definition_count':sum(d['kind'] in ('def','abbrev') for d in ds),'status':'ordinary compiled-only; no selected/replayed/printed183 set','selected':None,'replayed_in183':False,'printed_in183':False,'source_admission_token_occurrences':re.findall(r'\b(?:sorry|admit|axiom|unsafe|native_decide)\b',re.sub(r'/-[\s\S]*?-/', '',s))}
  assert x['sha256']==I['current'][r]['sha256'];modules.append(x)
builds=[]
for r in sorted(I['current']):
 if re.search(r'/build-\d+\.json$',r):
  j=json.loads(read(r)); snap=r[:-5]+'.lean'; sb=loc(snap).read_bytes();m=list(j['modules']);assert len(m)==1
  name=m[0]; mod=next(x for x in modules if x['module']==name)
  bs={'receipt':pin(loc(r)),'project_relative_path':r,'module':name,'returncode':j.get('returncode'),'timeout':j.get('timeout',False),'seconds':j['seconds'],'source_sha256':j['modules'][name],'snapshot':pin(loc(snap)),'snapshot_matches_record':sha(sb)==j['modules'][name],'final_source_identical':sha(sb)==mod['sha256'],'command':j['command'],'limits':j.get('limits'),'diagnostic_sha256':sha(j.get('stdout','').encode()),'diagnostic_first_lines':j.get('stdout','').splitlines()[:5]}
  assert bs['snapshot_matches_record'];builds.append(bs)
for m in modules:
 m['attempts']=[b for b in builds if b['module']==m['module']]
 successes=[b for b in m['attempts'] if b['returncode']==0]
 assert len(successes)==1 and successes[0]['final_source_identical']
 obj='evidence/markov-55cf20d2/'+m['module']+'.olean'
 m['ordinary_current_object']=I['current'][obj];m['archived_object']=I['archive'].get(obj)
counts={'ordinary_compiled_modules':len(modules),'theorem_declarations':sum(m['theorem_count'] for m in modules),'definitions':sum(m['definition_count'] for m in modules),'success_receipts':sum(b['returncode']==0 for b in builds),'failed_rc1_receipts':sum(b['returncode']==1 for b in builds),'timeout_receipts':sum(b['timeout'] for b in builds),'selected_modules':None,'replayed183':0,'axiom_printed183':0}
assert counts['ordinary_compiled_modules']==10 and counts['theorem_declarations']==54 and counts['definitions']==26
scope={
'new_unconditional_compiled_source_statement':'Actual numerator-three q>=1, b=3q+1 for r=true or3q+2 for r=false;5<=t<=q+2,j=b+2-t: raw coeff2*coeff4<coeff3^2. All actual paths with a=3 have q,r source representation. No auxiliary sign premise; effective nonempty range q>=3. This is ordinary-compilation evidence, not fresh replay/print admission.',
'generic_strict_statement':'Natural n,t with2t<=n,5<=t,3t<=n+5: template coeff2*coeff4<coeff3^2. Rational certificate s=t-5,d=n+5-3t requires s,d>=0. Casts of Nat.sub use explicit bounds.',
'root_equivalence':'Compiled Conjecture63 iff ThreeRemainingM55C and OtherFourM9E2; neither predicate proved.',
'finished_region':'Exists t with5<=t<=q+2,j=b+2-t and(i<=2 or t<i+2). i0 zero and i1 inherited; i2 new strict; t<i+2 right endpoint zero. All retained natural-index triples, not just positive coefficients.',
'horizontal_remaining':'q>=1,all r,i,j; q+3<j,b<2j+1,j!=5,not TopFinishedRegionM55C: rawH(i,j),(i+1,j),(i+2,j).',
'vertical_remaining':'Allnatural i,j outside ((i=3 or4 and j+1<=q) or(5<=i<=8 and j+2<=q)); rawV(i,j),(i,j+1),(i,j+2). Unchanged.',
'diagonal_remaining':'Allnatural i,j outside3<=i<=6 andj+2<=q; rawD(i,j+2),(i+1,j+1),(i+2,j). Unchanged.',
'root_guards':'Root polygon guards/endpoints/raw coefficient convention inherited unchanged through root_iff_upper_residualM5BF; source subproblem is all natural indices, so zeros are retained. No new root definition.',
'kernel':'K(d,i,s)=choose(s,i)*choose(d+s+i+8,i+3); L_T(f)=f(T)+4 sum_{s<T}(T-s)f(s); Mass=L_T(K). Integer weights and endpoint f(T) retained. top_mass_coeff: template n=2(T+3)+d,t=T+3 atcolumni+3 equalsMass, all naturals.',
'moment_identity':'Eigen=s(s+d+9),Scale=(i+1)(i+4),Excess=moment1-Eigen(i)*Mass,VarianceNumer=Mass*moment2-moment1^2. Scale(i)^2*Scale(i+1)*(Mass(i+1)^2-Mass(i)*Mass(i+2))=Drift. Positive scale gives exact iff. Excess nonnegative follows recurrence; no general Drift sign theorem.',
'conditional_bound':'TopMomentBound: allnatural d,T,i,T<=d+2,Scale*VarianceNumer <=(2i+6)*Excess^2+Scale*(2i+d+10)*Mass*Excess. Unproved.',
'exact_sector_reduction':'TopSectorLC forallnatural n,t,2t<=n,5<=t,3t<=n+5,allnaturalstarts iff TopMomentBound iff TopInteriorMoment with2<=T<=d+2 andi+2<=T. T<2 and right-zero tails discharged; lowstarts0,1,2 discharged. Actualsource allstarts adapter remains conditional on TopMomentBound.',
'parameter_polynomials':'Rational polynomial in free natural d evaluates tointegerMass; degree<=i+3, coefficient(i+3)=Leading(T,i)=(choose(T,i)+4choose(T+1,i+2))/(i+3)!. No equality-of-degree or asymptotic inequality theorem asserted in finalsource.',
'leading':'LeadingNumer nonnegative allT,i and positivei<=T; LC allnaturalstarts via inherited quadratic/binomial theorem; Leading strict LC when i+1<=T usingpositive factorial scaling. Auxiliary leading coefficients, not actual raw LC or eventual-in-d theorem.',
'obstructions':'Finite midpoint and geometric-weight shortcuts fail; geometric weights formallynonnegative,intervalsupport andallCrossLC but outputfails. Actual3/16 row11 raw[7168,34852,78260] has saved positivegap653694224 and polygon proof. No source/root refutation.',
'prior_limits':'Allactuala2three directions152; a3H2j+1<=b plus priorbands,row5 retained. OtherFour>=4 open. Old121212incl195,separate19,WindowLC/Abel,166seven-prefix compiled-only,171malformedreport,180historicalversions unchanged. No inherited replay recovery in183.'}
H={**base,'initial_inventory_binding':pin(T/'markov_worker_000183_initial_inventory.json'),'new_sources':modules,'compiled_counts':counts,'builds':builds,'partial_archive':{'archive_count':24,'current_count':78,'text_bundle_count':46,'archive_matching':23,'archive_zero_byte_object':'evidence/markov-55cf20d2/MarkovTopSecondGapM55C.olean','receipt_absent':True,'report_absent':True,'index_absent':True,'ordinary_binary_archive_coverage':'Only ParameterPoly complete and matching;SecondGap zero bytes;other8 absent. Separate9-object supplemental retention is current-observation evidence, not archive repair.'},'scripts':[{'project_relative_path':r,**pin(loc(r))} for r in sorted(I['current']) if r.startswith('research/') and r.endswith('.py')],'prior_scope_binding':pin(T/'markov_worker_000182_mathematical_source_hashes.json'),'source_level_scope':scope}
S={**base,'new_modules':modules,'compiled_counts':counts,'source_level_scope':scope,'literal_raw_indices':{'H':['(i,j)','(i+1,j)','(i+2,j)'],'V':['(i,j)','(i,j+1)','(i,j+2)'],'D':['(i,j+2)','(i+1,j+1)','(i+2,j)'],'new_strict':['(2,b+2-t)','(3,b+2-t)','(4,b+2-t)']},'zero_endpoint_handling':['Sourceclassification q>=1, both residues; t>=5 implies nonemptyq>=3, no q1/q2 strict claims.','Finite sums use guard3<=s or reindexs=3+u; Nat subtraction casts haveexplicit bounds.','topMass zero ifT<i, positive iff supporti<=T via two theorems; endpointK(T) not lost.','Moment tail i+2>T gives endpointzero; no division byMass,Excess orVariance. Scale factors strictlypositive.','Rootresidual includesallnaturalstarts andsame raw coefficients, not normalized orsupport-restricted.']}
source=data('source-experiment.json');qvals=list(range(1,20))+[27,41,61]
rows=sum(2*len(range(q+3)) for q in qvals);coefs=sum(2*sum(len(range(t+5)) for t in range(q+3)) for q in qvals);edges=sum(2*sum(t>=5 for t in range(q+3)) for q in qvals)
triples=[0,0,0]
for a,b in source['labels']:
 for i in range(a+b+1):
  for j in range(a+b+1-i):
   for k,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):triples[k]+=1
assert [rows,coefs,edges]==[source['rows'],source['coefficients'],source['edge_strict']] and triples==source['raw_triples']
mid=data('top-midpoint.json');midcount=sum(1 for t in range(5,26) for d in [max(0,t-5),t,t+7,3*t,10*t] for i in range(3,t-1) for s in range(i,t+1) for r in range(i+2,t+1))
mixedcount=sum(1 for t in range(5,12) for d in [max(0,t-5),t,t+7,3*t,10*t] for i in range(3,t-1) for s in range(3,t+1) for r in range(s,t+1))
assert midcount==mid['midpoint_tests']
mom=data('top-moment-probe.json');momentparams=[(d,t,i) for t in list(range(2,61))+[80,100,150,200] for d in [0,1,2,max(0,t-2),t,2*t,10*t,100*t] for i in range(t-1)]
assert len(momentparams)==mom['tested']
high=data('high-mass-probe.json');hc=sum(7*(t+1) for t in range(2,101));assert hc==high['tests']
rand=data('kernel-lc-weight-probe.json');rc=sum(4*15*(t+1) for t in range(2,31));assert rc==rand['tested']
geo=data('geometric-weight-probe.json');gc=sum(4*6*(min(t,30)-1) for t in [10,20,50,100,200]);assert gc==geo['checks']
cert=data('top-second-certificate.json');s=read('research/MarkovTopSecondGapM55C.lean');he=s.split('have he :',1)[1].split(':= by',1)[0];hp=s.split('have hp :',1)[1].split(':= by',1)[0]
terms=he.split('=',1)[1].strip().split('+');parsed=[]
for term in terms:
 m=re.fullmatch(r'\s*(\d+)(?:\*s\^(\d+))?(?:\*d\^(\d+))?\s*',term);assert m,term
 parsed.append([int(m[2] or 0),int(m[3] or 0),m[1]])
assert parsed==cert['coefficients'] and str(cert['scale']) in he and 'all_positive' in cert
# Literal serialization matching only, not polynomial expansion or sign computation.
assert len(parsed)==56 and cert['coefficients'][0]==[0,0,'3447460800']
for term in terms:assert term.strip() in hp
bindings=[]
for filename in ['source-experiment.json','top-midpoint.json','top-moment-probe.json','geometric-weight-probe.json','high-mass-probe.json','kernel-lc-weight-probe.json']:
 expected=data(filename);matches=[]
 for c in C:
  txt=c['stdout'].strip()
  try:v=json.loads(txt)
  except (ValueError,TypeError):
   try:v=ast.literal_eval(txt)
   except (ValueError,SyntaxError):continue
  if isinstance(v,dict):
   projection={k:expected[k] for k in v if k in expected}
   if v and set(v).issubset(expected) and v==projection and len(v)>1:matches.append({'line':c['line'],'id':c['id'],'exit_code':c['exit_code'],'keys':list(v)})
 bindings.append({'result':filename,'pin':pin(loc('evidence/markov-55cf20d2/'+filename)),'matching_completed_stdout':matches})
F={**base,'random_samples_regenerated':False,'source_experiment':{'script':pin(loc('research/source_experiment_55cf20d2.py')),'result':source,'q_domain':qvals,'source_family_labels':44,'rows_recounted':rows,'coefficient_positions_recounted':coefs,'strict_edge_cases_recounted':edges,'all_saved_labels_count':len(source['labels']),'all_saved_labels_unique':len(set(map(tuple,source['labels']))),'polygon_triples_recounted':triples,'total_polygon_triples':sum(triples),'zero_count_status':'3718 copied from saved result, not recomputed; no coefficient values evaluated','random_domain_limit':'14 seeded depth6 paths not regenerated. Broader counts use saved62labels; dedup overlaps source families and endpoints as scriptstates.'},'midpoint':{'tests_recounted':midcount,'mixed_candidate_positions_recounted':mixedcount,'failure_entries_retained':len(mid['midpoint_failures']),'mixed_failures_retained':len(mid['mixed_failures']),'cap':'20midpoint and5mixed examples; nottotalfailurecounts','first_failure':mid['midpoint_failures'][0],'result':mid},'moment':{'tests_recounted':len(momentparams),'unique_parameter_triples':len(set(momentparams)),'in_source_sector_positions':sum(t<=d+2 for d,t,i in momentparams),'outside_source_sector_positions':sum(t>d+2 for d,t,i in momentparams),'duplicates_retained':'Eight listed d entries counted withmultiplicity, asoriginalscript; no momentvaluesrecomputed','result':mom},'high_mass':{'tests_recounted':hc,'result':high,'domain':'T2..100,sevenlisted d withmultiplicity, i0..T includingrightzerotails; broaderthansourcesector'},'random_weight':{'tests_recounted':rc,'result':rand,'domain':'T2..30,d0/1/5/50,15randomweightlists,i0..T; noRNGregeneration; laterfixedgeometriccounterexample defeatsgeneralconjecture'},'geometric':{'tests_recounted':gc,'result':geo,'domain':'T10/20/50/100/200,fourdvalues,sixrvalues; i0..min(T,30)-2.409failuresreported,onlyfirst30serialized; no sourceclaim'},'certificate':{'pin':pin(loc('evidence/markov-55cf20d2/top-second-certificate.json')),'scale_literal':cert['scale'],'term_count':len(parsed),'constant_literal':cert['coefficients'][0],'all56serialized_terms_match_Lean_he_inorder':True,'all56_terms_present_in_hp':True,'literal_unsigned_decimal_strings':all(re.fullmatch('[1-9][0-9]*',x[2]) is not None for x in parsed),'certificate_recalculated':False,'generator_executed':False,'ordinary_compile_status_only':True},'output_event_bindings':bindings,'limitations':'Counts and literalserialization only. Emptyfailurelists, exactarithmeticoutputs andpositivegapexamples are retained machine observations; no rerun,proof,universalconclusion orrootrefutation.'}
for n,x in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:dump(n,x)
print(json.dumps({'counts':counts,'finite_counts':[rows,coefs,edges,triples,midcount,len(momentparams),hc,rc,gc]}))
