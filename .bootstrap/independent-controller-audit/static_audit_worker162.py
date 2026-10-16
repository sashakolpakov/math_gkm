"""Audit-owned static parsing/hash/domain-count helper. No project imports or math evaluation."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000162';A=W/'artifacts';E=A/'evidence/markov-7e2e958e'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
base={'worker':162,'request':'7e2e958e791546e6988c1db8eaecb1c3','created_at_utc':datetime.now(timezone.utc).isoformat(),'historical_status':'Completed / return0 / delivered report; full root remains open.','scope':'Closed162 archive and explicit named inherited/current counterparts only. Static parsing, hashing, literal comparisons and input-index/domain counts. No project/compiler/proof/checker/replay/finalizer/experiment execution, mathematical-value recomputation, project edits, proposer contact or research assistance. Active163 unexamined. Earlier sealed observations remain final.'}
before=js(E/'before.json');receipt=js(W/'receipt.json');v=js(E/'validation.json');manifest=js(E/'manifest.json');sel=js(E/'mathematical-modules.json');rep=js(A/v['replay_receipt']);axi=js(A/v['axioms_receipt']);builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
def declarations(src):
 matches=list(re.finditer(r'(?m)^(theorem|def|abbrev)\s+(\w+)',src));decl=[];statements=[];defs=[]
 for k,x in enumerate(matches):
  kind,name=x.groups();decl.append({'kind':kind,'name':name});end=matches[k+1].start() if k+1<len(matches) else src.index('\nend',x.end());block=src[x.start():end].strip()
  if kind=='theorem':
   z=re.search(r':=\s*by\b|:=\s*\n',block);assert z;statements.append(block[:z.start()].rstrip())
  else:defs.append(block)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 return decl,statements,defs,[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
new=[];mods=[];counts=Counter()
for m in sel:
 rel='research/'+m+'.lean';src=(A/rel).read_text();h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['sources'][m]==rep['modules'][m]==axi['sources'][m]==manifest[rel]
 bs=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules']=={m:h}];assert len(bs)==1
 bp,bd=bs[0];assert sha(bp.with_suffix('.lean'))==h and str(bp.relative_to(A)) in v['build_receipts']
 op='evidence/markov-7e2e958e/'+m+'.olean';oh=sha(A/op);assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]==v['compiled_sha256'][m]
 decl,st,defs,forbidden=declarations(src);counts.update(x['kind'] for x in decl)
 assert [x['name'] for x in decl]==rep['declared_names'][m]
 assert all(x['name'] in axi['declarations'] for x in decl if x['kind']=='theorem')
 row={'module':m,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,'status':'Compiled final source, joint isolated replay passed, all explicit theorem closures printed in162.','declarations':decl,'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row);mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':st,'definitions':defs,'forbidden_tokens':forbidden})
assert len(new)==9 and counts=={'theorem':43,'def':18} and not any(x['forbidden_tokens'] for x in mods)
assert len(axi['declarations'])==43 and rep['returncode']==0
prior=js(T/'markov_worker_000161_mathematical_source_hashes.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];older.append({'module':d['module'],'path':rel,'sha256':h,'initial162_source_sha256':h,'sealed161_sha256':h,'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in162':False,'worker156_recovered_in157':d.get('worker156_recovered_in157',False)})
assert len(older)==len({x['path'] for x in older})==299
pending=[];old_pending=[]
for d in prior['pending_modules']+prior['historical_pending_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==d['sha256']==before[rel];old_pending.append({'module':d['module'],'path':rel,'sha256':h,'status':d['status'],'selected_recovery_in162':False})
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
for tail,obs in [('Algebra/Polynomial/Reverse','Exact reflect/coeff_reflect/revAt_le/upper revAt identity and reflect_mul degree guards read. Fixed reflectj of degree<=j, not uncontrolled natDegree-dependent reversal.'),('Algebra/Polynomial/Degree/Lemmas','Exact natDegree_comp_le statement read; polynomial zero case included. Degree bound supplied before product reflection.')]:
 s=P/('.lake/packages/mathlib/Mathlib/'+tail+'.lean');o=P/('.lake/packages/mathlib/.lake/build/lib/lean/Mathlib/'+tail+'.olean');libs=libs+[{'qualified_module':'Mathlib.'+tail.replace('/','.'),'source_path':str(s),'source_sha256':sha(s),'object_path':str(o),'object_sha256':sha(o),'observation':obs+' Named source/object hashes only; no fresh library compilation or body replay.'}]
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-7e2e958e-{tag}.md';h=sha(A/rel);assert h==sha(P/rel);docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['kernel_probe','auxiliary_experiments','boundary_probe','pair_ratio']:
 rel=f'research/{tag}_7e2e958e.py';h=sha(A/rel);assert h==sha(P/rel);scripts.append({'path':rel,'sha256':h,'current_match':True,'main_guarded':True,'executed_by_auditor':False})
inherited=[]
for d in prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];inherited.append({'path':rel,'sha256':h,'sealed161_match':True,'role':d.get('role','Inherited retained helper/comparison pin; exact invocation dependencies separately identified.'),'executed_by_auditor':False})
names=['kernel-probe.json','auxiliary-experiments.json','boundary-candidates.json','pair-ratio.json'];data={n:js(E/n) for n in names}
for n in names:
 rel='evidence/markov-7e2e958e/'+n;h=sha(A/rel);assert h==sha(P/rel);records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(44,'kernel-probe.json'),(129,'auxiliary-experiments.json'),(203,'pair-ratio.json')]:
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n];bindings.append({'event':num,'record':n,'command':it['command'],'full_JSON_stdout_exact_match':True})
it=events[187]['item'];d=data['boundary-candidates.json'];projection={'status':d['status'],'certificates':[{k:v for k,v in x.items() if k not in ['expression','coefficients']} for x in d['certificates']],'seconds':d['seconds']};assert it['exit_code']==0 and json.loads(it['aggregated_output'])==projection
bindings.append({'event':188,'record':'boundary-candidates.json','command':it['command'],'printed_projection_exact_match':True,'not_full_record_stdout':True})
inline=[]
for num in [46,141]:
 it=events[num-1]['item'];assert it['exit_code']==0;inline.append({'event':num,'command':it['command'],'saved_stdout':it['aggregated_output'],'qualification':'Saved observations only; no binomial, coefficient, gap, sign, filtering or search reexecution.'})
# Count input domains/list lengths only; never numerical mathematical outputs.
kern=Counter()
for d in range(16):
 for ss in range(18):
  for u in range(ss,18):
   for t in range(1,d+u+3):
    kern['parameter_positions']+=1;kern['midpoint_checks']+=2
    if ss+1<=u:kern['aligned_checks']+=1
for k in ['midpoint_checks','aligned_checks']:assert kern[k]==data['kernel-probe.json'][k]
inline_domain=Counter()
for d in range(31):
 for ss in range(d+1):
  for u in range(ss,d+1):
   for t in range(1,d+u+2):
    inline_domain['midpoint_parameter_positions']+=1;inline_domain['midpoint_comparisons']+=2
    if d<16 and u<18:inline_domain['comparisons_overlapping_kernel_probe']+=2
assert inline_domain['midpoint_comparisons']==int(inline[0]['saved_stdout'].split()[0])
aux=Counter();aux_domains=[]
for j in range(31):
 for t in range(40):
  aux['Q_E_parameter_pairs']+=1;aux['Q_gap_coefficients']+=2*j+1;aux['E_gap_coefficients']+=2*j+1
  aux['Q_comp_lift_comparisons']+=3*(j+3);aux['bridge_explicit_tail_occurrences']+=6
 aux['distinct_bridge_parameters']+=42;aux['distinct_bridge_coefficients']+=42*(j+3)
for q in range(1,19):
 for r in [False,True]:
  n=3*q+(1 if r else 2);aux['sources']+=1
  for j in range(q+1):
   aux['source_comparisons']+=n+2
   aux['positions_outside_proved_support']+=sum(t>n-j-1 for t in range(n+2))
  aux_domains.append({'q':q,'r':r,'n':n,'j_max':q,'t_max':n+1})
for k in ['Q_gap_coefficients','E_gap_coefficients','Q_comp_lift_comparisons','source_comparisons']:assert aux[k]==data['auxiliary-experiments.json'][k]
assert aux['positions_outside_proved_support']==data['auxiliary-experiments.json']['source_zeros']
# Pair-ratio loop skips zero denominator products; count its pre-value-filter candidate adjacency positions.
# Do not evaluate L or positivity. Equality to saved post-filter count is recorded, not a new universal sign proof.
pair=Counter()
for j in range(1,36):
 for t in range(1,2*j+3):
  pair['j_t_parameters']+=1
  for vv in range(2*(t-j),2*t+1):
   rs=range(max(t-j,vv-t),vv//2+1);nr=len(rs);pair['sequences']+=1;pair['candidate_pairs']+=nr;pair['candidate_adjacent_comparisons_before_value_filter']+=max(nr-1,0)
   pair['sequences_with_negative_candidate_index']+=any(rr<0 or vv-rr<0 for rr in rs)
assert pair['candidate_adjacent_comparisons_before_value_filter']==data['pair-ratio.json']['comparisons']
cert=[]
for d in data['boundary-candidates.json']['certificates']:
 assert len(d['coefficients'])==d['terms'];cert.append({'index':d['index'],'literal_term_count':len(d['coefficients']),'saved_negative_entries':len(d['negative_coefficients']),'mathematical_values_recomputed':False})
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':pending,'historical_pending_comparisons':old_pending,'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited,'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,'residual_binding':{'path':'research/MarkovResidualMAE9.lean','sha256':sha(P/'research/MarkovResidualMAE9.lean'),'root_equivalence':'Inherited Conjecture63 iff ThreeRemainingMAE9 and OtherFourM9E2, unchanged.','root_open':True,'both_residual_conjuncts_unproved':True,'new_raw_LC_region':False,'new_auxiliary_coefficientwise_parameter_LC':True,'LiftBoundary_unproved':True,'binomial_weighting_transport_not_formalized':True},'all_named_new_match_current':True,'read_scope_notes':['All9 selected mathematical bodies,6 saved prose files,4 mathematical scripts/results,2 completed mathematical one-off records read. No current unbuilt mathematical source.','Exact named inherited WindowLC6d34 full body and MarkovLogConcavity CrossLC/CoeffSeq/Quadratic helpers inspected; standard reflect and degree declarations read from exact named library paths. Earlier source bridges retain sealed source review.','299 named inherited/comparison source pins,12 external source/object pairs and10 inherited script pins. Actual helper chain7;3 comparison-only.','One audit-owned display initially treated boundary metadata strings as dictionaries and raised AttributeError; a second display omitted non-certificate fields correctly. No project execution/change or research-value recalculation resulted.','Only exact receipt read before closure; absent five times before final22:49:34.213412UTC. Active163 and later work unexamined.']}
struct={**base,'new_modules':mods,'pending_modules':[],'accepted_counts':dict(counts),'source_scope':'Inherited actual numerator3 classification q>=1,rBool,n3q+1 or3q+2. New raw bridge everyt>=0,j<=q only; q0 generic formula is not added actual-source coverage. Original polynomial/source/homogeneity conventions unchanged.','weight_scope':'c(k)=0 fornegativeintegerk,c0=1,cpositivek=4k. Nonnegative and full integer CrossLC are proved explicitly, includingnegative/zero cases, not inferred from adjacent scan. Binomial B_t(s)=C(t+s+3,s).','minor_scope':'Q(j,t)=sum_s0..j c(j-s)B_t(s)X^s, exactallnaturalcoefficientformula with cnegativezero. Foralln,m,t,k withm<=n, coefficient ofQ(n,t+1)Q(m,t)-Q(n,t)Q(m,t+1) is nonnegative. Pairing a,b andb,a gives product ofweightbalancedminor andorderedbinomialminor; fullsumreflection countscentralpair twice safely. t+4positive cancels, no sourcecoefficient division.','parameter_scope':'Exact Pascal/prefix identities yield Q(j,t+1)^2-Q(j,t)Q(j,t+2)=sum_k0..j X^k qMinor(j,j-k,t). Allnaturalj,t,coefficientk, includingzero tails. This is coefficientwise adjacent-parameterLC, not assertedall-pairparameterCrossLC or coefficient-sequenceCrossLC forQ/E.','bridge_scope':'Allnaturalj,t,m: coeff_m Q(j,t)(1+X)=L(j,t,m). Finitebinomial product+weightedchoose proof coversm>j zero cases. Q andcompositiondegree<=j. E(j,t)=reflect_j(composition), coeffk=L(j,t,j-k) fork<=j,zerofork>j. reflect leavesindices>j fixed; explicitdegreebound is essential.','reversal_scope':'Generic compositionwithX+1preservesnonnegativecoefficients. reflect_mul requiresbothdegreebounds; givesEgap=reflect_2j(Qgapcomp(X+1)). Coefficientnonnegativity allnaturalindices follows. This formalizes the polynomial realization of complete reversedkernel, not a formal signedLaurentseries theorem.','triangle_scope':'A(j,t)=sum_r0..t L(j,t,t-r)X^r. Exactcoefficients equalguardedreverseLift. Ifj<=t, A=X^(t-j)E andgapA=X^(2(t-j)+2)gapE; coefficientwiseLCprovedinthisrange,zerotailsincluded. No extension toj>t withouttruncationargument.','source_bridge_scope':'Rawthree(q,r,t+3,j) casttoReal equals sum_k0..t C(n-2j-1,k) coeff_k A(j,t), j<=q. Binomialweightingnot evaluationat1/notnormalization. No theorem turns the provedA/Egaps into rawsourceLC; no newly proved conditionalroot sufficiency ofLiftLCPositive.','cut_scope':'Cut A^[h]keepscoeffindices>=h exactly. t<hmakesleftpolynomialzero; middle-squarecoefficients nonnegative via nonnegativekernel. j+h<=tmakesallthreecutsunchangedandtailgap applies. Exactauxiliaryiff LiftLCPositive iff LiftBoundary with h<=t<j+h, allnaturalj,t,h,k; boundaryunprovedandunbounded inh. Not an iff withroot.','step_scope':'Weight identitiesallrationalj,t,r or m; clearedkernelrecurrence allnaturalswithm+1<=j, combinesguardedscaledidentitiesandchoose steps. Fixedr=t-m, but no decreasingratio or normalized-pairmonotonicity theorem.','obstruction_scope':'Formal3quadratic auxiliaryE0=[1,1,1],E1=[3,2,1],E2=[5,3,1], eachfullintegerCoeffSeqCrossLC. Fullparametergap4+4X+X² nonnegative. Explicitdecompositions show varying shift/discard givingA0=1,A1=2+X,A2=5+3X+X²; gapX-1negativeconstant. Noactualsource/polygonidentification.','root_scope':'InheritedMAE9andOtherFourresidual unchanged/open. No new unconditionalrawstrip,completea3direction,rootproof/refutation,or correction-rowextension. Alloriginalpolygon/zeros/endpoints/largernumerators/directions retained.','finite_only_scope':'Normalizedpairmonotonicity,threefirstboundarypolynomialsanduntransposedmidpointsource-rangewitness remainfinite. The3/73witnessfails anauxiliarymidpoint andsavedrawgappositive/polygonvalid; noLean sourcecountercertificate.','mathematical_values_recomputed':False}
finite={**base,'kernel_probe':{'counts':dict(kern),'saved_record':data['kernel-probe.json'],'qualification':'d0..15,s0..17,s<=u<=17,t1..d+u+2;two endpoint orientationscountseparately;alignedtestonlys+1<=u. First10failureexamples each,notcompletefailurecount.'},'auxiliary_experiments':{'counts':dict(aux),'source_domains':aux_domains,'saved_record':data['auxiliary-experiments.json'],'qualification':'Q/Ej0..30,t0..39,arrayslengthj+1andproducts2j+1;bridgesv=t,t+1,t+2,m0..j+2 overlapbetweenadjacentwindows. Sourceq1..18bothresidues,j0..q,t0..n+1;all15003positionsrepeatwithin161sourcegrid. 3036supportzero domaincount. Separateactual3/73sourcewitnessq24j24notinthe36sourcegrid, butsourcecoordinatesoccurin161grid;auxiliaryfailedmidpointalreadyprintedoneoff46. No numerical outputs recomputed.'},'pair_ratio':{'counts':dict(pair),'saved_record':data['pair-ratio.json'],'qualification':'j1..35,t1..2j+2,v2(t-j)..2t,r=max(t-j,v-t)..floor(v/2),s=v-r;negativeauxiliaryindicesallowed. Loopskipszero denominatorproducts. Auditcountsstructuraladjacentopportunitiesbeforevaluefilter;396270matchesreportedpostfiltercount, withoutcomputingL,ratio,sign,orclaiminguniversaldenominatornonvanishing/monotonicity. Failedexamplescapped10.'},'boundary_candidates':{'candidate_count':3,'literal_certificate_counts':cert,'saved_record':data['boundary-candidates.json'],'qualification':'Threeh=t(v0)rationalgapcandidates,j=S+2,t=T>=0;declaredpositiveB0anddenominatorscleared.87/75/55storedterms,nonegativeentriesasrecorded. NoLeanidentity/signcertificate, qsourcebridgeorrawLCconsequence; j1outsidecandidatechart. No polynomial recomputation.'},'inline_observations':{'counts':dict(inline_domain),'events':inline,'qualification':'Event46source-rangeuntransposedprobe d0..30,0<=s<=u<=d,t1..d+u+1,twoorientations;420112comparisons,first10failures. Its overlappingfirstprobe positionsarecounted,notdisjoint. Event141filterspositivecoefficienttriplesfrom{1..5}³ byLC then searches triplesuntilfirstwitness. Filteredsize/visitedcount not recomputed; outputexplicitauxiliarytriplelaterprovedformally,notexhaustive theorem.'},'event_bindings':bindings,'records':records,'runtime_limits':'Fournewmain-guardedmathscripts,retainednamedactualhelperchain+comparisonpins;threefullJSONstdout matchesandoneprojection. Twooneoffcommandsreadastext. No mathematical values, filters, signpatterns, recurrenceoutput or polynomialexpansion evaluated; no projectmoduleimport. Savedliteratureonly, no newsource search.','mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000162_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(suffix,p.stat().st_size,sha(p))
print('counts',dict(counts),'older',len(older),'kernel',dict(kern),'inline',dict(inline_domain),'aux',dict(aux),'pair',dict(pair))
