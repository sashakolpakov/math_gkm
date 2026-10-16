"""Audit-owned static parsing/hash/domain-count helper. No project imports or math evaluation."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000163';A=W/'artifacts';E=A/'evidence/markov-fee405c8'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
base={'worker':163,'request':'fee405c8897249a786084298201a14aa','created_at_utc':datetime.now(timezone.utc).isoformat(),'historical_status':'Completed / return0 / delivered report; full root remains open.','scope':'Closed163 archive and explicit named inherited/current counterparts only. Static parsing, hashing, literal comparisons and input-index/domain counts. No project/compiler/proof/checker/replay/finalizer/experiment execution, mathematical-value recomputation, project edits, proposer contact or research assistance. Active164 unexamined. Earlier sealed observations remain final.'}
before=js(E/'before.json');receipt=js(W/'receipt.json');v=js(E/'validation.json');manifest=js(E/'manifest.json');sel=js(E/'mathematical-modules.json');rep=js(A/v['joint_replay']);axi=js(A/v['axiom_audit']);builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
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
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['source_sha256'][m]==rep['modules'][m]==axi['sources'][m]==manifest[rel]
 bs=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules']=={m:h}];assert len(bs)==1
 bp,bd=bs[0];assert sha(bp.with_suffix('.lean'))==h and str(bp.relative_to(A)) == v['successful_builds'][m]
 op='evidence/markov-fee405c8/'+m+'.olean';oh=sha(A/op);assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]==v['compiled_sha256'][m]
 decl,st,defs,forbidden=declarations(src);counts.update(x['kind'] for x in decl)
 assert [x['name'] for x in decl]==rep['declared_names'][m]
 assert all(x['name'] in axi['declarations'] for x in decl if x['kind']=='theorem')
 row={'module':m,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,'status':'Compiled final source, joint isolated replay passed, all explicit theorem closures printed in163.','declarations':decl,'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row);mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':st,'definitions':defs,'forbidden_tokens':forbidden})
assert len(new)==13 and counts=={'theorem':50,'def':13} and not any(x['forbidden_tokens'] for x in mods)
assert len(axi['declarations'])==50 and rep['returncode']==0
prior=js(T/'markov_worker_000162_mathematical_source_hashes.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];older.append({'module':d['module'],'path':rel,'sha256':h,'initial163_source_sha256':h,'sealed162_sha256':h,'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in163':False,'worker156_recovered_in157':d.get('worker156_recovered_in157',False)})
rel='research/MarkovAbel65c4.lean';h=sha(P/rel);assert h==before[rel]
older.append({'module':'MarkovAbel65c4','path':rel,'sha256':h,'initial163_source_sha256':h,'historical_status':'New named inherited comparison; exact source/body read. crossLC_center_weights directly used. Method audit separately binds old source/object/receipts and limits.','selected_recovery_in163':False})
assert len(older)==len({x['path'] for x in older})==309
pending=[];old_pending=[]
for d in prior['pending_modules']+prior['historical_pending_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==d['sha256']==before[rel];old_pending.append({'module':d['module'],'path':rel,'sha256':h,'status':d['status'],'selected_recovery_in163':False})
m='MarkovPairClearedMFEE';rel='research/'+m+'.lean';src=(A/rel).read_text();h=sha(A/rel);decl,st,defs,bad=declarations(src)
assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel]
bs=[(p,d) for p,d in builds if d.get('modules')=={m:h}];assert len(bs)==1 and bs[0][1].get('timeout') is True
assert sha(bs[0][0].with_suffix('.lean'))==h and m not in sel
pending=[{'module':m,'path':rel,'sha256':h,'declarations':decl,'theorem_statements':st,'definitions':defs,'forbidden_tokens':bad,'status':'Unvalidated: one120-second compiler timeout. Excluded from final selected replay/prints; no theorem credit.','build_receipt':bs[0][0].name,'build_receipt_sha256':sha(bs[0][0]),'archive_object_present':(E/(m+'.olean')).exists(),'current_object_present_at_initial_observation':(P/'evidence/markov-fee405c8'/ (m+'.olean')).exists()}]
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-fee405c8-{tag}.md';h=sha(A/rel);assert h==sha(P/rel);docs.append({'path':rel,'sha256':h,'current_match':True})
scriptnames=['transport_experiment_fee405c8.py','pair_certificate_fee405c8.py','ratio_convexity_fee405c8.py','boundary_certificate_fee405c8.py','check_pair_candidate_fee405c8.py','gap_probe_fee405c8.py','pair_symbolic_fee405c8.py','pair_symbolic_fee405c8.g','pair_raw_fee405c8.py','pair_raw_fee405c8.g','pair_factored_fee405c8.g','generate_pair_lean_fee405c8.py']
for name in scriptnames:
 rel='research/'+name;h=sha(A/rel);assert h==sha(P/rel)==manifest[rel];scripts.append({'path':rel,'sha256':h,'current_match':True,'main_guarded':"if __name__=='__main__'" in (A/rel).read_text(),'executed_by_auditor':False})
inherited=[]
for d in prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];inherited.append({'path':rel,'sha256':h,'sealed162_match':True,'role':d.get('role','Retained inherited/helper comparison pin.'),'executed_by_auditor':False})
names=['transport-experiments.json','pair-extension-rejected.json','pair-extension.json','ratio-convexity.json','boundary-certificate-generation.json','pair-candidate-consistency.json','pair-symbolic.json','pair-raw.json','pair_factored-1792192145934966000.json'];data={n:js(E/n) for n in names}
for n in names+['pair-extension-rejected.py','pair-raw-extrep.txt','pair-factored-extrep.txt','pair-factors-extrep.txt']:
 rel='evidence/markov-fee405c8/'+n;h=sha(A/rel);assert h==sha(P/rel)==manifest[rel];records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(89,'pair-extension-rejected.json'),(96,'pair-extension.json'),(163,'transport-experiments.json'),(165,'pair-symbolic.json'),(194,'pair-raw.json'),(209,'pair_factored-1792192145934966000.json'),(225,'ratio-convexity.json'),(245,'pair-candidate-consistency.json')]:
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n];bindings.append({'event':num,'record':n,'command':it['command'],'full_JSON_stdout_exact_match':True,'outer_python_return0_not_inner_proof_success':n=='pair-symbolic.json'})
# Literal serialization parsing only; no polynomial operations, coefficient evaluation or signs computed.
import ast
arrays={n:ast.literal_eval((E/n).read_text().replace('\\\n','')) for n in ['pair-raw-extrep.txt','pair-factored-extrep.txt','pair-factors-extrep.txt']}
arrcounts={'raw_terms':len(arrays['pair-raw-extrep.txt'])//2,'factored_terms':len(arrays['pair-factored-extrep.txt'])//2,'factor_list_count':len(arrays['pair-factors-extrep.txt']),'factor_counts':[len(a) for a in arrays['pair-factors-extrep.txt']]}
assert arrcounts['raw_terms']==42675 and arrcounts['factored_terms']==20813 and arrcounts['factor_counts']==[22]*4
it=events[215]['item'];generated=json.loads(it['aggregated_output']);assert generated['factor_counts']==arrcounts['factor_counts']
bindings.append({'event':216,'generated_source_character_count':generated['source_bytes'],'final_source_bytes':len(src.encode()),'final_source_characters':len(src),'reported_count_is_characters_not_UTF8_bytes':generated['source_bytes']==len(src),'factor_counts_exact_literal_match':True,'qualification':'No generator reconstruction or polynomial arithmetic. Failed candidate snapshot exact source hash binds final bytes.'})
for num in [103,109]:
 it=events[num-1]['item'];assert it['exit_code']==0 and ast.literal_eval(it['aggregated_output'])==data['boundary-certificate-generation.json']['modules'];bindings.append({'event':num,'generated_module_names_match':True,'qualification':'Stdout names only; no term arrays printed. Final generator source/results hash-bound; earlier generation separately qualified by validation.'})
rejected=(E/'pair-extension-rejected.py').read_text();accepted=(A/'research/pair_certificate_fee405c8.py').read_text()
assert rejected.replace('if m+2<=j else 0','if m+1<=j else 0')==accepted
# Input domains and previously proved support membership only. No mathematical values are evaluated.
transport=Counter();weighted_positions=set();source_positions=set();old162_overlap=set();old161_overlap=set()
for j in range(21):
 for t in range(31):
  transport['kernel_parameter_pairs']+=1
  transport['boundary_coefficients']+=2*t+3
  for h in range(t+3):
   transport['cut_parameter_triples']+=1;transport['all_cut_coefficients']+=2*t+3
   if h<t and t+1<j+h:transport['open_middle_parameter_triples']+=1;transport['open_middle_coefficients']+=2*t+3
  for d in [0,j,2*j+3,40]:
   transport['weighted_gap_coefficients']+=2*t+3
   for k in range(2*t+3):weighted_positions.add((j,t,d,k))
transport['distinct_weighted_gap_coefficients']=len(weighted_positions)
source_domains=[]
for q in range(1,26):
 for r in [False,True]:
  n=3*q+(1 if r else 2);transport['sources']+=1
  source_domains.append({'q':q,'r':r,'n':n,'j_max':q,'t_max':n+2})
  for j in range(q+1):
   for t in range(n+3):
    transport['source_triples']+=1;transport['source_coefficients']+=3
    transport['source_zero_triples']+=any(t+v>n-j-1 for v in range(3))
    for v in range(3):
     transport['source_zeros']+=t+v>n-j-1
     source_positions.add((q,r,j,t+v))
     if q<=18 and t+v<=n+1:old162_overlap.add((q,r,j,t+v))
     if t+v<=n+1:old161_overlap.add((q,r,j,t+v))
transport['distinct_source_coefficients']=len(source_positions);transport['distinct_positions_in162_grid']=len(old162_overlap);transport['distinct_positions_in161_lift_grid']=len(old161_overlap)
for k in ['boundary_coefficients','all_cut_coefficients','weighted_gap_coefficients','source_coefficients','source_zeros','source_triples','source_zero_triples']:assert transport[k]==data['transport-experiments.json'][k]
pair=Counter()
for j in range(2,51):
 for t in [1,2,3,5,10,25,50,100,250]:
  pair['j_t_parameters']+=1
  for m in range(2,j+1):
   for n in range(m-1):pair['comparisons']+=1
assert pair['comparisons']==data['pair-extension.json']['comparisons']==data['pair-extension-rejected.json']['comparisons']
ratio=Counter()
for j in range(2,61):
 for t in [1,2,3,5,10,25,50,100,250]:
  ratio['j_t_parameters']+=1;ratio['monotonicity_comparisons']+=2*j;ratio['convexity_comparisons']+=2*(j-1)
ratio['comparisons']=ratio['monotonicity_comparisons']+ratio['convexity_comparisons'];assert ratio['comparisons']==data['ratio-convexity.json']['comparisons']
# Count generated literal positive-term syntax without evaluating any coefficient/sign or expansion.
cert=[]
for idx in range(2):
 ss=(A/f'research/MarkovCutCertificate{idx}MFEE.lean').read_text();expr=ss.split(': ℚ :=\n',1)[1].split('\ntheorem',1)[0];termcount=expr.count('+')+1
 assert termcount==data['boundary-certificate-generation.json']['terms'][idx];cert.append({'index':idx,'literal_additive_term_count':termcount,'checked_identity_and_sign_theorems_present':True})
rootrow=next(d for d in new if d['module']=='MarkovLiftRootMFEE')
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':pending,'historical_pending_comparisons':old_pending,'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited,'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,'residual_binding':{'path':rootrow['path'],'sha256':rootrow['sha256'],'root_equivalence':'Conjecture63 iff LowerHorizontalMFEE and ThreeOutsideLowerMFEE and OtherFourM9E2.','root_open':True,'all_three_residual_conjuncts_unproved':True,'new_raw_LC_region':False,'new_general_weighting_transport':True,'new_auxiliary_edges':'h=t and t+1=j+h; all cuts j<=2','LiftMiddle_unproved':True,'binomial_weighting_transport_formalized_conditional_on_cuts':True,'normalized_pair_source_and_zero_factor_bridges_unproved':True},'all_named_new_match_current':True,'read_scope_notes':['All13 selected and1 pending mathematical source bodies read;6prose,12mathematical/GAP/operational scripts plus rejectedpair source and savedoutputs inspected. No script executed/imported.','Named inherited Abel65c4 body inspected; crossLC_center_weights imported body not newly replayed. Prior12external pairs and10helpers retained.309older source comparisons.','Only exact receipt read before closure:7absent observations,8checks total; final23:16:56.661843UTC. Parent closure notice arrived during an interrupted sleep, followed by25sec wait; own final interval>=60sec. All waits<=59.007sec. Active164 and later unexamined.','Closed archive enumeration and completed named event parsing only. No active/later research discovery. No compiler,GAP,proof,replay,finalizer,generator or numeric mathematical output recomputed.']}
struct={**base,'new_modules':mods,'pending_modules':pending,'accepted_counts':dict(counts),
 'rank_weight_scope':'Finite arbitrary type/index set, signed a, natural rank<=N, weight w0>=0 and wk<=w(k+1) only k<N. All upper rank cuts h<=N nonnegative. Exact telescoping finite interchange, no sign restriction on a/no coefficient division.',
 'polynomial_weight_scope':'Arbitrary real A,B,C, no coefficient nonnegativity assumption. Every literal high-index cut gap coefficient h,n nonnegative; f:Z->R full CrossLC and nonnegative allintegers. On antidiagonal n, rank=min(i,j)<=floor(n/2), product f(k)f(n-k) increasing towardcenter from inherited Abel. Weighted coefficientwise gap nonnegative, theneval1 LC. Zero weights retained; adjacentLC not substituted.',
 'source_bridge_scope':'Exact weighted lift eval for all naturald,j,t, binomial integerzeroextension CrossLC. LiftBoundary implies output LC allnatural t. Raw source lowerH j<=q, allnatural i: i<3 leftzero branch andi=t+3 exact raw identity otherwise. Actualq>=1 paths withnumerator3 classified both3q1/3q2; q0 genericlemma notextraactualcoverage. All zero tails retained; casts exact; global boundary premise remains.',
 'boundary_scope':'Cutshift allj,h,v includes k<h/k>h+v andnaturalzero guards. h=t gap is X^(2t) times exactquadratic. Firsttwo inequalities use87/75term rational certificates j=s+2,s>=0,t>=0, allreal/rationaldenominatorspositive; fixedchoosebase squared multiplied, notdivided. Third viaoldQgap. j0tailzero,j1explicitvalues handled. CorrectL(1,t,1)=t+4; priorproset+5typo notsourceedit.',
 'outer_scope':'t+1=j+h includesh0. X*leftcut=X^h(E-C(Ecoeff0)); middle=X^hE,next=X^(h+1)E. Xnonzero cancellation inR[X] provesgap=X^(2h)(Egap+C(Ecoeff0)Enext). NonnegativeEcoeffandgap allindices; no negative exponent or coefficientdivision.',
 'middle_scope':'LiftBoundary iffLiftInterior h<t,t<j+h; LiftLCPositive iffLiftMiddle h<t,t+1<j+h. Allnaturalj,t,h,k. Exhaustivezero,tail,h=t,oppositeedge; allj<=2cutsunconditional. Remainingh<t,t+1<j+h (relative1<=t-h<=j-2) unproved; nofinite hbound.',
 'normalized_scope':'Generic finite signed a, strictlypositiveb onEVERYs, totalsum a>=0, orderedcrossratio comparisons implysubset/rank-upper-cut sum>=0. Emptyset separatelyhandled. These strictdenominator andcenteredcut hypotheses are not provedforfullkernel; zero-factor outerterms unresolved.',
 'root_scope':'Exactroot iffLowerHorizontal (q>=1,j<=q,allnaturali) andThreeOutsideLower (q<j,j!=5 H; retains literalV complement of i3/4,j+1<=q or i5..8,j+2<=q; D complementi3..6,j+2<=q) andOtherFourunchanged. H/V/D rawliteralindices,zero/endpoints/polygon inherited. LiftMiddle onlysufficient forLowerHorizontal/root withremaining premises, notiffauxiliarywithroot. No newunconditionalrawstrip orrootcompletion.',
 'obstruction_scope':'Formal exactauxiliary ratio difference atj13,t2 equals-18761/44990946 andnegative. Sourcevalid theorem gives allthreepolygonmemberships andoldrawHLC atcolumns4,5,6,row13,q13,true (actual3/40), usinginheritedlower-band/source-horizontal theorem. No newrawLCregion orsourcecounterexample; no claim refutingsymmetric-pairmonotonicity.',
 'candidate_scope':'PairCleared1definition1theorem, one120sectimeout, excluded. 42675raw/20813factored GAP literalterms and30finiteconsistency comparisons do notestablishLean theorem orratio/zerofactor/centered-tailbridges.',
 'mathematical_values_recomputed':False}
finite={**base,'transport_experiments':{'counts':dict(transport),'source_domains':source_domains,'saved_record':data['transport-experiments.json'],'qualification':'j0..20,t0..30,h0..t+2, gaparrayslength2t+3. Weights[0,j,2j+3,40] repeatatj0. Sourceq1..25bothresidues,j0..q,t0..n+2,threeconsecutivecolumns t+3+v. Zero counts fromproved support only; overlapping coefficient occurrences/distinctpositions separately counted. No actualpolynomial,binomial,gap/sign evaluated.'},'pair_extension':{'counts':dict(pair),'saved_record':data['pair-extension.json'],'rejected_record':data['pair-extension-rejected.json'],'only_source_difference':'second choose guard m+2<=j changedto m+1<=j','qualification':'Same187425indexdomain before/aftercorrection:j2..50,tin9explicitvalues,m2..j,n0..m-2. Rejected30failurelistiswrongkernel; correctedemptylistfiniteonly. No rawsourcefailureoruniversalpairproof.'},'ratio_convexity':{'counts':dict(ratio),'saved_record':data['ratio-convexity.json'],'qualification':'j2..60,tin9values. AdjacentAincreasing/Bdecreasing andsecond-difference tests separatelycounted; failurescap20. Formalmodulecertifiesonlyspecificj13t2failure/sourcepass, no rerun.'},'boundary_certificates':{'literal_counts':cert,'saved_record':data['boundary-certificate-generation.json'],'qualification':'Two literal87/75term generated certificates now accepted ring identity+positivity; oldgeneratorstatus stringgeneratedcandidates doesnotoverride latermatchedcompiled/replayedtheorems. Firstgeneration/finalrenderer corrected versions separately audited.'},'GAP_candidates':{'literal_serialization_counts':arrcounts,'records':{n:data[n] for n in ['pair-symbolic.json','pair-raw.json','pair_factored-1792192145934966000.json','pair-candidate-consistency.json']},'qualification':'RationalsymbolicGAP90sectimeout; raw/factoredpolynomial commands completed60sec bounds. Signcounts are retainedstdout only, not independently recounted. Arrays parsedforliteralterm/factorlengths only.10explicitpoints*3comparisons=30, no evaluations. PendingLean positivity120sectimeout gives no theorem credit.'},'event_bindings':bindings,'records':records,'runtime_limits':'Transport andpair scripts have guardedmains; ratio/boundary/generation/check/GAP wrappers executeattoplevel ifrun/imported; none imported/executedby auditor. Exactinheritedhelperchains asretained; interpreter/GAPbinary identitynotauthenticatedby sourcehash receipt. Saved literatureonly,no freshsearch.','mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000163_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(suffix,p.stat().st_size,sha(p))
print('counts',dict(counts),'older',len(older),'transport',dict(transport),'pair',dict(pair),'ratio',dict(ratio),'arrays',arrcounts)
