"""Audit-owned static parsing/hash/domain-count helper. No project imports or math evaluation."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000161';A=W/'artifacts';E=A/'evidence/markov-ae9e841e'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
base={'worker':161,'request':'ae9e841e98884e419ff8cadb546d21cc','created_at_utc':datetime.now(timezone.utc).isoformat(),'historical_status':'Completed / return0 / delivered report; full root remains open.','scope':'Closed161 archive and explicit named inherited/current counterparts only. Static parsing, hashing, literal comparisons and input-index/domain counts. No project/compiler/proof/checker/replay/finalizer/experiment execution, mathematical-value recomputation, project edits, proposer contact or research assistance. Active162 unexamined. Earlier sealed observations remain final.'}
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
 op='evidence/markov-ae9e841e/'+m+'.olean';oh=sha(A/op);assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]
 decl,st,defs,forbidden=declarations(src);counts.update(x['kind'] for x in decl)
 assert [x['name'] for x in decl]==rep['declared_names'][m]
 assert all(x['name'] in axi['declarations'] for x in decl if x['kind']=='theorem')
 row={'module':m,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,'status':'Compiled final source, joint isolated replay passed, all explicit theorem closures printed in161.','declarations':decl,'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row);mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':st,'definitions':defs,'forbidden_tokens':forbidden})
assert len(new)==25 and counts=={'theorem':66,'def':21} and not any(x['forbidden_tokens'] for x in mods)
assert len(axi['declarations'])==66 and rep['returncode']==0
m='MarkovColumn0MAE9';rel='research/'+m+'.lean';src=(A/rel).read_text();h=sha(A/rel);decl,st,defs,forbidden=declarations(src)
assert h==sha(P/rel)==manifest[rel]==receipt['changes'][rel]['after'];assert not any(m in d['modules'] for p,d in builds)
assert not (A/('evidence/markov-ae9e841e/'+m+'.olean')).exists() and not (P/('evidence/markov-ae9e841e/'+m+'.olean')).exists()
pending=[{'module':m,'path':rel,'sha256':h,'declarations':decl,'theorem_statements':st,'definitions':defs,'forbidden_tokens':forbidden,'status':'Generated but unselected/unbuilt; no accepted object, replay or closure print. Its two theorem statements receive no new mathematical credit.'}]
prior=js(T/'markov_worker_000160_mathematical_source_hashes.json');pairs=js(T/'markov_worker_000160_inherited_pair_expectations.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'initial161_source_sha256':h,'sealed160_sha256':d['sha256'],'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in161':False,'worker156_recovered_in157':d.get('worker156_recovered_in157',False)})
m='MarkovHorizontalFourAllM9E1';d=pairs['entries'][m];rel=d['source'];h=sha(P/rel);assert h==before[rel]==d['source_sha256'] and sha(P/d['object'])==d['prior_object_sha256']
older.append({'module':m,'path':rel,'sha256':h,'initial161_source_sha256':h,'sealed160_pair_source_sha256':h,'object_path':d['object'],'object_sha256':d['prior_object_sha256'],'historical_status':'Inherited compiled universal raw horizontal rows0..4, exact body read; no selected body recovery in161.','selected_recovery_in161':False})
assert len(older)==len({x['path'] for x in older})==274
old_pending=[]
for d in prior['pending_modules']:
 rel=d['path'];h=sha(P/rel);assert h==d['sha256']==before[rel]
 old_pending.append({'module':d['module'],'path':rel,'sha256':h,'status':'Historical160 KernelLimit candidate: two timeouts, no accepted compilation/replay/print. Comparison pin only; not imported or selected in161.','selected_recovery_in161':False})
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
s=P/'.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Intervals.lean';o=P/'.lake/packages/mathlib/.lake/build/lib/lean/Mathlib/Algebra/BigOperators/Intervals.olean'
libs=libs+[{'qualified_module':'Mathlib.Algebra.BigOperators.Intervals','source_path':str(s),'source_sha256':sha(s),'object_path':str(o),'object_sha256':sha(o),'observation':'Exact sum_range_reflect declaration read: finite range n reflection n-1-j; applied at n=t+1 with r<=t. Hash binding only, no imported body replay or fresh build.'}]
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-ae9e841e-{tag}.md';h=sha(A/rel);assert h==sha(P/rel);docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['column_certificates','correction_probe','horizontal_shift','laurent_lift','lift_lc_probe','lift_probe','shape_probe','source_experiments','source_strips']:
 rel=f'research/{tag}_ae9e841e.py';h=sha(A/rel);assert h==sha(P/rel);scripts.append({'path':rel,'sha256':h,'current_match':True,'main_guarded':True,'executed_by_auditor':False})
inherited=[]
for d in prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];inherited.append({'path':rel,'sha256':h,'sealed160_match':True,'executed_by_auditor':False})
for f,role in [('column_five_4687d03f.py','Actual imported Fraction polynomial helper; imports lower_rows, whose retained transitive pins are above. Its interpolation main is not called by161 generator.'),('crossing_certificate_1bb0aa1e.py','Read as named predecessor comparison; not imported by161 mathematical probes.'),('poly_probe_0d346fa7.py','Read as named predecessor comparison; not imported by161 mathematical probes.')]:
 rel='research/'+f;h=sha(P/rel);assert h==before[rel];inherited.append({'path':rel,'sha256':h,'initial161_match':True,'role':role,'executed_by_auditor':False})
names=['lift-probe.json','lift-lc-probe.json','shape-probe.json','source-experiments.json','laurent-lift.json','horizontal-shifts.json','column-candidates.json','correction-candidates.json']+[f'gap-{z}{k}.json' for z in ['horizontal','vertical','diagonal'] for k in range(1,4)]
data={n:js(E/n) for n in names}
for n in names:
 rel='evidence/markov-ae9e841e/'+n;h=sha(A/rel);assert h==sha(P/rel);records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(37,'shape-probe.json'),(50,'lift-probe.json'),(54,'lift-lc-probe.json'),(133,'source-experiments.json'),(210,'laurent-lift.json'),(83,'horizontal-shifts.json')]:
 it=events[num-1]['item'];assert it['exit_code']==0
 out=json.JSONDecoder().raw_decode(it['aggregated_output'].lstrip())[0];assert out==data[n]
 bindings.append({'event':num,'record':n,'command':it['command'],'printed_JSON_fields_exact_match':True,'trailing_stdout_present':num==83})
for num,n,out in [(74,'column-candidates.json',{'columns':len(data['column-candidates.json']['columns']),'gaps':data['column-candidates.json']['gaps'],'seconds':data['column-candidates.json']['seconds']}),(154,'correction-candidates.json',{k:{'negative_count':v['negative_count'],'factors':v['factors']} for k,v in data['correction-candidates.json'].items()})]:
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==out
 bindings.append({'event':num,'record':n,'command':it['command'],'printed_projection_exact_match':True,'not_full_record_stdout':True})
# Static literal generator-expression comparison, no polynomial evaluation.
columns=data['column-candidates.json']['columns'];literal_columns=[]
for k,d in columns.items():
 s=(A/f'research/MarkovColumn{k}MAE9.lean').read_text();expr=re.search(r'def column\dMAE9 .*? := (.+)',s)[1];assert expr==d['expression'];literal_columns.append({'t':int(k),'recorded_terms':d['terms'],'expression_exact_match':True,'accepted':k!='0'})
gap_records=[]
for kind in ['horizontal','vertical','diagonal']:
 for k in range(1,4):
  n=f'gap-{kind}{k}.json';d=data[n];declared=data['column-candidates.json']['gaps'][kind+str(k)];assert len(d)==declared['terms']
  gap_records.append({'name':n,'literal_term_count':len(d),'saved_core_terms':declared['core_terms'],'saved_negative_entries':len(declared['negative']),'status':'Unshifted horizontal candidate; final shifted theorem is a different expression.' if kind=='horizontal' else 'Generated candidate for accepted rational identity; ring validation, not generator trust, supplies proof.'})
# Domain counts only: no C/coefficients/F/poly/gap values evaluated.
lift=Counter();lift_domains=[]
for j in range(21):
 ds=[0,1,j,2*j,3*j]
 for d in ds:
  lift['parameter_occurrences']+=1;lift['lift_checks']+=d+j+3
  lift_domains.append({'j':j,'d':d,'t_max':d+j+2})
 for t in range(1,2*j+4):lift['midpoint_checks']+=t*(t+2)
 lift['distinct_parameter_pairs']+=len(set(ds))
for k in ['lift_checks','midpoint_checks']:assert lift[k]==data['lift-probe.json'][k]
liftlc=Counter()
for j in range(21):
 for t in range(1,2*j+8):
  liftlc['truncated_gap_arrays']+=t+1;liftlc['checks']+=(t+1)*(2*t+3)
  for r in range(t+1):liftlc['symmetric_pair_tests']+=t+2-r
assert liftlc['checks']==data['lift-lc-probe.json']['checks']
shape={'parameter_pairs':18*3,'mixed_summand_positions':sum(3*j*j for j in range(2,20)),'raw_summand_positions':sum(3*j*j for j in range(2,20)),'shifted_pair_checks':0}
source=Counter();domains=[]
for q in range(1,31):
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['sources']+=1
  for j in range(q+1):
   source['lift_comparisons']+=n+2;source['column_comparisons']+=6
   source['positions_outside_proved_support']+=sum(t>n-j-1 for t in range(n+2))
   tests=[('horizontal',[(i,j),(i+1,j),(i+2,j)]) for i in range(4,7)]
   if j+2<=q:tests += [('vertical',[(i,j),(i,j+1),(i,j+2)]) for i in range(6,9)]+[('diagonal',[(i,j+2),(i+1,j+1),(i+2,j)]) for i in range(4,7)]
   for kind,points in tests:
    source[kind+'_triples']+=1
    source['polygon_triples']+=all(3*n<=n*i+3*k and i+k<=n+2 for i,k in points)
    source['triples_touching_outside_proved_support']+=any(not (3<=i and i+k<=n+2) for i,k in points)
  domains.append({'q':q,'r':r,'n':n,'j_max':q,'lift_t_max':n+1,'column_t_max':5})
for k in ['sources','lift_comparisons','column_comparisons','horizontal_triples','vertical_triples','diagonal_triples','polygon_triples']:assert source[k]==data['source-experiments.json'][k]
assert source['positions_outside_proved_support']==data['source-experiments.json']['zeros'];assert source['triples_touching_outside_proved_support']==data['source-experiments.json']['zero_triples']
laurent=Counter()
for j in range(31):
 for t in range(1,2*j+5):
  laurent['parameter_pairs']+=1;laurent['extended_formula_checks']+=j+3;laurent['Q_gap_coefficients']+=2*j+1
  for vv in range(2*(t-j-1),2*t+3):
   laurent['laurent_gap_coefficients']+=1;laurent['pair_sign_sequences']+=1
   laurent['pair_sequence_entries']+=len(range(min(t-j-1,vv-t-1),vv//2+1))
for k in ['extended_formula_checks','Q_gap_coefficients','laurent_gap_coefficients','pair_sign_sequences']:assert laurent[k]==data['laurent-lift.json'][k]
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':pending,'historical_pending_comparisons':old_pending,'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited,'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,'residual_binding':{'path':'research/MarkovResidualMAE9.lean','sha256':sha(A/'research/MarkovResidualMAE9.lean'),'root_equivalence':'Conjecture63 iff ThreeRemainingMAE9 and OtherFourM9E2','root_open':True,'both_residual_conjuncts_unproved':True,'new_raw_LC_region':True,'uniform_transform_LC_unproved':True,'first_correction_crossing_LC_not_newly_proved':True},'all_named_new_match_current':True,'read_scope_notes':['All25 accepted math bodies plus unbuiltColumn0,6 saved prose files,9 math scripts and17 result records read; closed161 completed command inventory inspected. No mathematical values recomputed.','Exact named inherited ThreeRaw/ThreeArithmetic/ResidualM468/FirstRowM1BB/BinomialPolyM0D3/HorizontalFourAllM9E1 bodies read; other prior proof scope retains sealed audits.','274 named old source pins:273 prior160 selected/older plus HorizontalFourAll from sealed160 pair map;10 external library/source pairs;10 inherited script pins,3 comparison-only.','No source/events read before final closure; receipt-only absent checks recorded separately in main. Active162 excluded. Three inherited separate docs only byte-hashed by validator from explicit before map; no semantic review.','UnbuiltColumn0 and historical160 KernelLimit are not accepted or replayed in161.']}
struct={**base,'new_modules':mods,'pending_modules':pending,'accepted_counts':dict(counts),'source_scope':'Every actual numerator3 source path is covered by q>=1, r:Bool, n=3q+1(true) or3q+2(false); coefficient equality holds at all natural indices. Generic new lift identities allow q0,j0 but actual classification uses q>=1.','lift_scope':'For all natural d,j,t, lowerRow(2j+1+d,j)[t+3]=sum_{m=0}^t C(d,t-m)*C(t+m+3,m)*(C(t+j+3,t+m+3)+4C(t+j+4,t+m+5)). Derived by Vandermonde, choose-product and weighted finite sum, with natural zeros. Source adapter j<=q fixes d=n-2j-1; no formula premise or normalization.','support_scope':'Reverse kernel uses r<=t guard, then m=t-r; reversal uses sum_range_reflect on range(t+1). Output nonnegative all d,j,t and positive iff t<=d+j; above that interval exactly zero. This is output support, not a proof of transform LC. Lower source columns i<3 remain zero by inherited lower-row formula.','polynomial_scope':'lowColumn rational falling-factorial binomial sum equals raw column(t+3) for all natural t andj<=q. Natural top parameters nonnegative so natural-zero binomials match choosePoly even when lower index exceeds top. Explicit column1..5 are all-rational identities, source cols4..8; unusedColumn0 lacks compilation/replay.','gap_scope':'Nine exact rational gap identities are separate from nonnegative proofs at d,x>=0. H uses n=3j+1+d,j=x+1 for starts4/5 andj=x+2 forstart6; omittedj0 orj0/1 handled by universal inherited source horizontalj<=4. V/D use n=3j+7+d,j=x and sourcej+2<=q. Positive scalar denominators are constants; linarith/exact_mod_cast transfers rational raw identities to original integers. All asserted source gaps are weak LC.','raw_scope':'Both actual denominator families, H (i,j),(i+1,j),(i+2,j) for4<=i<=6,j<=q; V (i,j),(i,j+1),(i,j+2) for6<=i<=8,j+2<=q; D (i,j+2),(i+1,j+1),(i+2,j) for4<=i<=6,j+2<=q. No polygon assumptions or positivity filters needed for these statements; zeros retained. Path adapter uses exhaustive actual source classification.','root_scope':'Exact conjunction with OtherFourM9E2; new ThreeRemaining removes H row5 or3<=i<=6,j<=q; V cols3/4,j+1<=q or5<=i<=8,j+2<=q; D3<=i<=6,j+2<=q. All other natural starts remain obligations, including correction bands and support zeros. Full original root, endpoints and polygon guards remain through inherited equivalences. Both conjuncts unproved.','gain_scope':'Relative to159/160 residual, starts/columns4..6/6..8 are newly removed. lower_band_polygon proves3<=i<=8,j<=q,q>=3 in actual polygon, giving unbounded valid source subfamilies; no new separately named strict-noncoverage witness against every older sufficient criterion.','correction_scope':'q>=2,t>=0: first rowq+1 equals lowColumn(n,q+1,t) plus8C(q-2,t+1) fortrue or4C(q-1,t+1) forfalse. q1 true alternating correction remains inherited, not replaced by natural truncated subtraction. Only columns>=3 in new bridge; full old first-row formula retains allcolumns. No crossingLC follows from candidate20 polynomials in this round.','ratio_scope':'m<=j scaled rational kernel identity with liftDen=(t+m+4)(t+m+5); positive weight for rational0<=t,0<=m<=j; adjacentm recurrence needsm+1<=j. Multiplicative identity, no division by vanishing binomial and no uniform sign/LC conclusion.','obstruction_scope':'Formal liftTerm midpoint failure48>45; actual3/4 row1 raw[8,14,6] passes weak LC and allthree polygon guards. Different auxiliary arrays and finite mixed-summand failures are not source/root counterexamples.','unformalized_scope':'Laurent negative-index extension, Q generating representation, one-sign-change observations, truncation/transform preservation and correction crossing signs remain finite/prose candidates. No added raw LC region from them.','mathematical_values_recomputed':False}
finite={**base,'lift_probe':{'counts':dict(lift),'domains':lift_domains,'saved_record':data['lift-probe.json'],'qualification':'j0..20; slacks[0,1,j,2j,3j] include duplicate labels atj0 andj1. t0..d+j+2. Midpointsj0..20,t1..2j+3,r0..t-1,s0..t+1; onlyfirst10failures retained. Natural reverse kernel, not all negative-index Laurent terms.'},'lift_lc_probe':{'counts':dict(liftlc),'saved_record':data['lift-lc-probe.json'],'qualification':'j0..20,t1..2j+7,r0=0..t; three lists lengtht+2, convolution length2t+3 including zero padding. Symmetric pair tests0<=r<=t,r<=s<=t+1; failureexamples capped5. Coefficient tests finite, no universal transform theorem.'},'shape_probe':{'counts':shape,'saved_record':data['shape-probe.json'],'qualification':'j2..19, d0/j/2j,0<=s,k<j. Mixed and raw summand positions overlap same parameter tuples; shifted_pair_failures is initialized but never populated/tested, so empty list is not evidence of success. Examples capped5.'},'source_experiments':{'counts':dict(source),'domains':domains,'saved_record':data['source-experiments.json'],'qualification':'60actualsourcesq1..30bothresidues; allj0..q,rawcolt+3 witht0..n+1; explicitcolumnst0..5. Hstarts4..6always, V6..8 andD4..6onlyj+2<=q. 8190triples8180allpolygon10zero-containing, no filter. Formula62985checks include11900zero positions. Counts/support/polygon domains only, no coefficients or gaps evaluated.'},'laurent_probe':{'counts':dict(laurent),'saved_record':data['laurent-lift.json'],'qualification':'j0..30,t1..2j+4; r=t-j-1..t+1 includes signed extension indices; Qarrayslengthj+1; v=2(t-j-1)..2t+2. 46810sequence tests and46810gap positions share same vdomain, not independent triples. All remain finite, no formal universal Laurent/truncation theorem.'},'column_certificates':{'literal_columns':literal_columns,'gap_records':gap_records,'saved_summary':data['column-candidates.json'],'qualification':'Generator expands from lift formula using inherited Fraction operations, no interpolation call. Columns0..5 emitted, column6computed internally but no emitted record/theorem. Column0 unbuilt. Nine unshifted gap records include failed sufficient coefficient-sign tests forH; finalHuses separate shifts. Literal expression match only; no polynomial recomputation.'},'horizontal_shifts':{'saved_record':data['horizontal-shifts.json'],'attempted_shift_count':len(data['horizontal-shifts.json']),'selected_shifts':{'1':1,'2':1,'3':2},'qualification':'Seven recorded shift trials; negative coefficient counts are retained values only. All finalshiftedHidentities compiled and rational domains explicitly connected. Smallrows inherited, not inferred from scan.'},'correction_candidates':{'candidate_count':len(data['correction-candidates.json']),'saved_record':data['correction-candidates.json'],'qualification':'20 symbolic candidates:bothfamilies times Hstarts4..6,Vcols5..8,Dstarts4..6 atq=x+2. Allzero negative_count is a saved candidate result, not accepted Lean crossingLC. q1excluded. No generator rerun.'},'event_bindings':bindings,'records':records,'runtime_limits':'Nine main-guarded new scripts read. Actual inherited helper hashes pinned, no project imports/execution. Fullstdout records match5 probes plus horizontal leadingJSON; column/correction print projections only. Source_strips regenerated after failedsource snapshot; compiler receipts bind accepted versions. No fresh interpretation of binary caches or executable authentication.','mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000161_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(suffix,p.stat().st_size,sha(p))
print('counts',dict(counts),'older',len(older),'lift',dict(lift),'liftlc',dict(liftlc),'shape',shape,'source',dict(source),'laurent',dict(laurent))
