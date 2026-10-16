"""Static retained-text/hash and input-domain audit only; no project imports."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import hashlib, json, re
T=Path('/private/tmp/math_gkm_godel_20261013'); P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000160'; A=W/'artifacts'; E=A/'evidence/markov-daba8bcf'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
base={'worker':160,'request':'daba8bcf97ae4038b0d8ea8a63d4a71e','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed / return0 / delivered report; full root open. Pending KernelLimit excluded.',
 'scope':'Closed160 archive and exact named inherited/current counterparts. Static parsing, hashing, literal comparison and input-index counts only. No project/proof/compiler/checker/replay/experiment/finalizer execution or mathematical-value recomputation; no edits, proposer contact or research assistance. Active161 and separate documentation edits excluded. Prior seals remain final.'}
before=js(E/'before.json'); receipt=js(W/'receipt.json'); v=js(E/'validation.json'); manifest=js(E/'manifest.json')
selection=js(E/'mathematical-modules.json'); replay=js(A/v['replay_receipt']); axioms=js(A/v['axioms_receipt'])
assert receipt['outcome']=='completed' and receipt['report'] is not None
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
def declarations(src):
 matches=list(re.finditer(r'(?m)^(theorem|def|abbrev)\s+(\w+)',src)); out=[]; statements=[]; defs=[]
 for k,x in enumerate(matches):
  kind,name=x.groups(); out.append({'kind':kind,'name':name})
  end=matches[k+1].start() if k+1<len(matches) else src.index('\nend',x.end())
  block=src[x.start():end].strip()
  if kind=='theorem':
   z=re.search(r':=\s*by\b|:=\s*\n',block); assert z,(name,block)
   statements.append(block[:z.start()].rstrip())
  else: defs.append(block)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S); clean=re.sub(r'--[^\n]*','',clean)
 return out,statements,defs,[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
counts=Counter(); new=[]; mods=[]
for module in selection:
 rel='research/'+module+'.lean'; src=(A/rel).read_text(); h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['sources'][module]==replay['modules'][module]==axioms['sources'][module]==manifest[rel]
 matched=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules']=={module:h}]; assert len(matched)==1
 bp,bd=matched[0]; assert sha(bp.with_suffix('.lean'))==h and str(bp.relative_to(A)) in v['build_receipts']
 op='evidence/markov-daba8bcf/'+module+'.olean'; oh=sha(A/op)
 assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]
 decl,statements,defs,forbidden=declarations(src)
 counts.update(x['kind'] for x in decl)
 assert [x['name'] for x in decl]==replay['declared_names'][module]
 assert all(x['name'] in axioms['declarations'] for x in decl if x['kind']=='theorem')
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,
  'status':'compiled, joint replay passed, every explicit theorem closure printed in160','declarations':decl,
  'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row); mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),
  'theorem_statements':statements,'definitions':defs,'forbidden_tokens':forbidden})
assert len(new)==7 and counts=={'theorem':39,'def':11} and not any(x['forbidden_tokens'] for x in mods)
assert len(axioms['declarations'])==39 and replay['returncode']==0
pending=[]
for module in ['MarkovKernelLimitMDAB']:
 rel='research/'+module+'.lean'; src=(A/rel).read_text(); h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel]
 decl,statements,defs,forbidden=declarations(src)
 attempts=[{'receipt':p.name,'receipt_sha256':sha(p),'snapshot_sha256':sha(p.with_suffix('.lean')),
  'returncode':d.get('returncode'),'timeout':d.get('timeout'),'keys':list(d)} for p,d in builds if module in d['modules']]
 assert len(attempts)==2 and all(x['returncode']!=0 for x in attempts)
 assert module not in replay['modules'] and module not in axioms['sources']
 pending.append({'module':module,'path':rel,'sha256':h,'declarations':decl,'theorem_statements':statements,
  'definitions':defs,'forbidden_tokens':forbidden,'attempts':attempts,
  'status':'Two timed-out candidate builds; no accepted compilation, selected replay or theorem-closure print. No mathematical credit.'})
prior=js(T/'markov_worker_000159_mathematical_source_hashes.json'); oldpairs=js(T/'markov_worker_000159_inherited_pair_expectations.json')
older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path']; h=sha(P/rel); assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'initial160_source_sha256':before[rel],
  'sealed159_sha256':d['sha256'],'historical_status':d.get('status',d.get('historical_status','inherited')),
  'selected_recovery_in160':False,'worker156_recovered_in157':d.get('worker156_recovered_in157',False)})
for module in ['MarkovAdjacent67c3']:
 d=oldpairs['entries'][module]; rel=d['source']; h=sha(P/rel)
 assert h==before[rel]==d['source_sha256'] and sha(P/d['object'])==d['prior_object_sha256']
 older.append({'module':module,'path':rel,'sha256':h,'initial160_source_sha256':h,
  'sealed159_pair_source_sha256':d['source_sha256'],'object_path':d['object'],
  'object_sha256':d['prior_object_sha256'],'historical_status':'Inherited compiled helper; explicitly read ratio_cross67 and choose identities; no new body replay.',
  'selected_recovery_in160':False})
assert len(older)==len({x['path'] for x in older})==266
libs=prior['imported_libraries']; four=prior['imported_four_functions']
for d in libs+[four]: assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[]; scripts=[]; records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-daba8bcf-{tag}.md'; h=sha(A/rel); assert h==sha(P/rel)
 docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['positive_rows','source_positive','gap_newton','kernel_probe','kernel_source']:
 rel=f'research/{tag}_daba8bcf.py'; h=sha(A/rel); assert h==sha(P/rel)
 scripts.append({'path':rel,'sha256':h,'current_match':True,'main_guarded':True,'executed_by_auditor':False})
inherited_scripts=[]
for d in prior['inherited_scripts']:
 rel=d['path']; h=sha(P/rel); assert h==before[rel]==d['sha256']
 inherited_scripts.append({'path':rel,'sha256':h,'sealed159_match':True,'executed_by_auditor':False})
names=['positive-rows.json','source-positive.json','gap-newton.json','kernel-probe.json','kernel-source.json']
data={n:js(E/n) for n in names}
for n in names:
 rel='evidence/markov-daba8bcf/'+n; h=sha(A/rel); assert h==sha(P/rel)
 records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()]; bindings=[]
for num,n in zip([47,121,89,149,165],names):
 it=events[num-1]['item']; assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n]
 bindings.append({'event':num,'record':n,'command':it['command'],'all_printed_fields_exact_match':True})
inline=[]
for num in [31,33,143,167,172]:
 it=events[num-1]['item']; assert it['exit_code']==0
 inline.append({'event':num,'command':it['command'],'saved_stdout':it['aggregated_output'],
  'qualification':'Saved text only; no numerical value or identity recomputed by auditor.'})
# Count only input indices and stated support/polygon domains, never coefficient values.
positive=Counter(); positive_domains=[]
for j in range(41):
 ds=[0,1,2,3,5,10,25,100]
 positive['parameter_pairs']+=len(ds); positive['positive_formula_checks']+=len(ds)*(j+3)
 positive['minimal_formula_checks']+=j+3
 positive['explicit_tail_positions']+=len(ds)*2
 positive_domains.append({'j':j,'slacks':ds,'k_max':j+2})
for j in range(101):
 for i in range(j+1): positive['minimal_cross_checks']+=j+1-i
for k in ['positive_formula_checks','minimal_formula_checks','minimal_cross_checks']:assert positive[k]==data['positive-rows.json'][k]
source=Counter(); source_domains=[]
for q in range(1,41):
 for r in [False,True]:
  n=3*q+(1 if r else 2); source['sources']+=1
  for j in range(q+1):
   for i in range(n+6):
    source['coefficient_comparisons']+=1; source['horizontal_triples']+=1
    if 3*n<=n*i+3*j and i+j<=n+2:source['polygon_positive_checks']+=1
    if not (3<=i and i+j<=n+2):source['positions_outside_proved_positive_interval']+=1
    if all(3*n<=n*(i+s)+3*j and i+s+j<=n+2 for s in range(3)):source['all_three_polygon_guarded']+=1
    if any(not(3<=i+s and i+s+j<=n+2) for s in range(3)):source['triples_touching_outside_proved_positive_interval']+=1
  source_domains.append({'q':q,'r':r,'n':n,'j_max':q,'i_max':n+5})
for k in ['sources','coefficient_comparisons','horizontal_triples','polygon_positive_checks']:assert source[k]==data['source-positive.json'][k]
assert source['positions_outside_proved_positive_interval']==data['source-positive.json']['zero_comparisons']
newton=Counter(); newton_domains=[]
for j in range(2,36):
 for k in range(j-1):
  newton['gap_polynomials']+=1; newton['newton_coefficients']+=2*k+3
  newton_domains.append({'kind':'adjacent','j':j,'k':k,'d_max':2*k+2})
 if j<=15:
  for i in range(j):
   for k in range(i,j):
    newton['cross_gap_polynomials']+=1; newton['cross_newton_coefficients']+=i+k+2
    newton_domains.append({'kind':'cross','j':j,'i':i,'k':k,'d_max':i+k+1})
for k,n in newton.items():assert n==data['gap-newton.json'][k]
kernel=Counter(); kernel_domains=[]
for j in range(2,26):
 for d in [0,j,2*j]:
  for l in range(1,j):
   for r0 in range(l+1):
    kernel['truncated_polynomial_gaps']+=1
    kernel['truncated_gap_coefficients']+=2*l+3
  kernel_domains.append({'j':j,'d':d,'l_min':1,'l_max':j-1})
for j in range(2,101):
 kernel['geometric_parameter_pairs']+=3
 kernel['geometric_coefficient_positions']+=3*(j+1)
 kernel['geometric_adjacent_positions']+=3*(j-1)
assert kernel['truncated_gap_coefficients']==data['kernel-probe.json']['truncated_gap_coefficients']
kernel_source=Counter()
for j in range(2,51):
 for l in range(1,j):
  for r0 in range(l+1):
   kernel_source['truncated_polynomial_gaps_per_mode']+=1
   kernel_source['coefficient_checks_per_mode']+=2*l+3
assert all(x['checks']==kernel_source['coefficient_checks_per_mode'] for x in data['kernel-source.json']['by_slack'].values())
kernel_source['mode_count']=4; kernel_source['total_coefficient_occurrences']=4*kernel_source['coefficient_checks_per_mode']
inline_counts={'event31_rows':8,'event31_printed_coefficient_positions':sum(j+1 for j in range(1,9)),
 'event33_rows':14,'event33_printed_coefficient_positions':sum(j+1 for j in range(1,15)),
 'event143_parameter_pairs':15,'event143_coefficient_positions':3*sum(j+1 for j in [10,20,30,50,100]),
 'event143_adjacent_positions':3*sum(j-1 for j in [10,20,30,50,100]),
 'event167_parameters':[10,100,1000,10000,1000000],'event172_printed_scalar_terms':3}
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':pending,
 'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,
 'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,
 'residual_binding':{'path':'research/MarkovResidualM468.lean','sha256':sha(P/'research/MarkovResidualM468.lean'),
  'root_equivalence':'Conjecture63 iff ThreeRemainingM468 and OtherFourM9E2 (inherited159, unchanged)',
  'root_open':True,'both_residual_conjuncts_unproved':True,'new_raw_LC_region':False,
  'minimal_denominator_base_now_proved':True,'uniform_shape_unproved':True,
  'RowDifferenceShape_unproved':True,'RowGapMonotone_unproved':True,
  'Euler_substituted_coefficient_formula_not_newly_proved_or_used':True},
 'all_named_new_match_current':True,'read_scope_notes':[
  'Read all7 accepted math bodies and1 pending body,6 prose files,5 mathematical scripts/results,5 mathematical one-off completed events. No mathematical value evaluated.',
  'Read exact named inherited Adjacent67c3 ratio/choose helpers, Cross774 interval bridge, RowDegree/RowTransferMFFD, RowDifferenceM468, and lower_rows/row_probe/three_probe Python bodies. Other prior source/root proof scope retains sealed review.',
  '266 exact named older source pins:265 prior159 new/older sources plus explicit Adjacent67c3 from sealed159 pair map;9 external source/object pins retained.',
  'Closed160 enumeration only; active161 and separately edited documentation excluded. No current docs-directory inventory or content review.',
  'KernelLimit statements are candidate text, not validated mathematical claims. Both timeouts and later exclusion retained.']}
struct={**base,'new_modules':mods,'pending_modules':pending,'accepted_counts':dict(counts),
 'source_scope':'Every actual numerator3 path has q>=1 and residue r with n=3q+1 or3q+2. Generic source-row identities allow q0 but actual classification restricts q>=1. All new raw formulas/positivity require j<=q; correction rows excluded.',
 'positive_identity_scope':'All n,j natural with2j+1<=n: H_j(n)=J_j(n)+4sum_s<j (j-s)J_s(n-2j+2s). Derived from four parameter shifts, signed recurrence, diagonal second difference and explicit j0/j1 bases. No Euler/Lagrange substitution premise.',
 'coefficient_scope':'For all natural d,j,k, coefficient H_j(2j+1+d)=C(j+3,k+3)C(d+j+k+3,k)+4sum_s<j(j-s)C(s+3,k+3)C(d+s+k+3,k). Nonnegative allk, strictly positive k<=j, zero k>j by inherited degree. Minimal binomial formula allj,k including zeros uses weighted hockey-stick and choose multiplication.',
 'minimal_shape_scope':'Every naturalj: CrossLC of real zero extension of integer H_j(2j+1). Positive rational ratio denominators; scaled coefficient identities guard k<=j, ratio step k+1<=j, adjacent k+2<=j. Certificate atj=k+s+2, k,s>=0. Strict interval support0..j and negative/upper zeros furnish nonnegativity and interval premise of Cross774, so all integer pairs are covered. It is an auxiliary minimal residual, not every actual source lower row.',
 'difference_scope':'For2j+1<=n all natural coefficients nondecrease with n; strict for1<=k<=j, coefficient0 unchanged. Integer-index RowDifference nonnegative, negative and upper tails zero. No difference CrossLC or mixed-cross theorem.',
 'raw_scope':'For every lower source rowj<=q andt>=0: raw(t+3,j)=C(n-j-1,t)C(t+j+3,j)+4sum_s<j(j-s)C(n-2j+s-1,t)C(t+s+3,s). Restores same (1+u)^(n-2j-1) factor to each shiftedJ; no normalization. i<3 zero, t+j+1<=n positive, larger t zero. Polygon lower bound forcesi>=3 and upperboundgivesthepositiveinterval. Path wrapper explicitly uses exhaustive classification.',
 'conditional_scope':'Minimal CrossLC discharges159 base premise: RowDifferenceShape alone suffices for LowerRowShape. Alternatively RowGapMonotone requires every n,j,k with2j+1<=n andk+2<=j to have nondecreasing adjacent gap. Induction in n and exact support give LowerRowShape and conditional all-natural-i lower-source H. Both hypotheses unproved; coefficient monotonicity does not imply gap monotonicity.',
 'root_scope':'No new unconditional raw LC region or exact root residual is asserted. Inherited root iff ThreeRemainingM468 and OtherFourM9E2 unchanged, retaining original polygon, natural zeros, endpoints, correction bands, V/D and larger numerators. Full root open.',
 'obstruction_scope':'KernelLimit five theorem/two definition candidate has two timeouts, no accepted object/replay/print. Reversed-kernel geometric weights q^r differ from source weights c0=1,cr=4r. Its j8,d0,q1000000 candidate is distinct from finite base2 mixture failures atj55+. d0 forpositivej is outside actual lower source slackd>=j. Negative coefficient tests and auxiliary mixtures are not actual raw source counterexamples.',
 'mathematical_values_recomputed':False}
finite={**base,
 'positive_rows':{'counts':dict(positive),'domains':positive_domains,'saved_record':data['positive-rows.json'],
  'qualification':'j0..40,8 distinct slacks, k0..j+2. Two explicit upper-tail positions perrow. Minimal formula subsetd0; Cross tests j0..100,0<=i<=k<=j including upper zero endpoint, notnegativeinteger indices. Saved outcomes not recomputed.'},
 'source_checks':{'counts':dict(source),'domains':source_domains,'saved_record':data['source-positive.json'],
  'qualification':'80 actual sources q1..40bothresidues,j0..q,i0..n+5. All starts tested forH, no polygon or zero filter; 150660formula and150660H occurrences.33280positions lie outside formally proved support and117380insidepolygon. Additional triple support/guard counts are input-domain classifications, not coefficient evaluations or reported extra experiments.'},
 'gap_newton':{'counts':dict(newton),'domains':newton_domains,'saved_record':data['gap-newton.json'],
  'qualification':'Adjacent j2..35,k0..j-2,d0..2k+2; cross j2..15,0<=i<=k<=j-1,d0..i+k+1. Counts are finite-difference list lengths. Claimed degree bounds are script commentary, not new formal degree/sign theorems. No uniform Newton signs or gap monotonicity inferred.'},
 'kernel_probe':{'counts':dict(kernel),'domains':kernel_domains,'saved_record':data['kernel-probe.json'],
  'qualification':'j2..25,d0/j/2j,1<=l<j,0<=r0<=l, arrays lengthl+2 and untrimmed mul length2l+3. Negative examples capped20. Separate geometric base2 scanj2..100,d0/j/2j,adjacentk0..j-2; onlyfirst5failures retained, nottotalcount. Auxiliaryweights differ fromsource.'},
 'kernel_source':{'counts':dict(kernel_source),'saved_record':data['kernel-source.json'],
  'qualification':'Four labeled modes d0,floor(j/2),j,2j withj2..50;1149050positions each,4596200occurrences. Negative_count176565zero mode and0other modes are saved numerical outcomes, not audited recomputation. Examples capped3. This finite griddoesnotprove all naturald>=j. Entire236700earliertruncatedprobe occurs within zero/source/double modes; do not add asdisjoint evidence.'},
 'inline_observations':{'counts':inline_counts,'events':inline,
  'qualification':'Events31/33 print8/14rows. Event33 usesn=j+1 outsideproved2j+1range forj>0; its negative savedentry isnot actual lower source counterexample. Event14315geometricparameter triples and615adjacentpositions overlap thelater base2scan; first8failingindicesonly. Event167checks5geometricqvalues;event172prints3gap coefficients. No values recomputed.'},
 'event_bindings':bindings,'records':records,
 'runtime_limits':'Five saved JSON outputs match successful completed stdout. Main-guarded scripts; inherited lower_rows mul preserves declared list lengths without trimming, while Hrows trims numerical zeros. Named hashes are observation identities, not full invocation-start transitive maps or interpreter authentication. No GAP execution by auditor. Literature records read as saved prose only, no new source search.',
 'mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000160_'+suffix); assert not p.exists()
 p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n'); print(suffix,p.stat().st_size,sha(p))
print('accepted',dict(counts),'older',len(older),'positive',dict(positive),'source',dict(source),'newton',dict(newton),'kernel',dict(kernel),'kernel_source',dict(kernel_source),'inline',inline_counts)
