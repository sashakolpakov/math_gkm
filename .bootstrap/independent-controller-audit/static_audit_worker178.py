"""Closed worker178: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000178';A=W/'artifacts';E=A/'evidence/markov-a45def12'
REQUEST='a45def12b7c24d888741ec0c6895391b'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792217322909676000.json');axioms=js(E/'axioms-1792217337390581000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':178,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1615.2113001346588. Ten final mathematical modules compiled and jointly replayed,38 distinct theorem closures printed;8 rejected compiler attempts retained. Full root open.',
 'scope':'Archive-first closed178 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active179 and later excluded. Earlier seals/windows unchanged.'}
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel],rel;return h
pat=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(src):
 ms=list(pat.finditer(src));decls=[];th=[];defs=[]
 for i,m in enumerate(ms):
  kind,name=m.groups();end=ms[i+1].start() if i+1<len(ms) else src.rfind('\nend')
  block=src[m.start():end].strip();decls.append({'kind':kind,'name':name})
  if kind=='theorem':
   depth=0;delimiter=None
   for pos,ch in enumerate(block):
    if ch in '([{':depth+=1
    elif ch in ')]}':depth-=1
    elif depth==0 and block[pos:pos+2]==':=':
     line=block[block.rfind('\n',0,pos)+1:pos].strip()
     if line.startswith('let '):continue
     delimiter=pos;break
   assert delimiter is not None,name
   header=block[:delimiter].rstrip()
  else:header=block.split(':=',1)[0].rstrip()
  row={'kind':kind,'name':name,'header':header,'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)}
  if kind!='theorem':row['definition_text']=block
  (th if kind=='theorem' else defs).append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return decls,th,defs,bad
new=[];structure=[];counts=Counter()
for module in selected:
 rel='research/'+module+'.lean';src=(A/rel).read_text();sh=binding(rel);decls,th,defs,bad=parse(src);assert not bad
 attempts=[(p,d) for p,d in builds if module in d.get('modules',{})]
 success=[(p,d) for p,d in attempts if d.get('returncode')==0 and d['modules']=={module:sh}]
 assert len(success)==1 and sha(success[0][0].with_suffix('.lean'))==sh
 op='evidence/markov-a45def12/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in178':True,'printed_in178':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':38,'def':4} and len(axioms['declarations'])==38

prior=js(T/'markov_worker_000177_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed177_sha256':h,'initial178_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in178':False})
assert len(older)==len({x['path'] for x in older})==536
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in178':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
newlibs=[]
for module,statement in [('Mathlib.Algebra.Polynomial.Degree.Operations','coeff_mul_add_eq_of_natDegree_le'),('Mathlib.LinearAlgebra.Matrix.Determinant.Basic','det_succ_row and det_fin_three')]:
 rel=module.replace('.','/');src=P/'.lake/packages/mathlib'/(rel+'.lean');obj=P/'.lake/packages/mathlib/.lake/build/lib/lean'/(rel+'.olean')
 newlibs.append({'qualified_module':module,'source_path':str(src),'source_sha256':sha(src),'object_path':str(obj),'object_sha256':sha(obj),'named_statements_read':statement,'scope':'Explicit named library statements read. Source/object identity only, no production linkage, invocation-time resolution, imported-body replay or fresh compilation.'})
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','checkpoint-final','correspondence','mathematics','next','operational']:
 rel='research/markov-a45def12-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['experiment_a45def12.py','pf_probe_a45def12.py','schur_probe_a45def12.py','schur_validate_a45def12.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 else:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'manifest_only_when_not_initial':rel not in before,'executed_by_auditor':False,'scope':'Historical identity only. Explicit source experiment dependencies are three_probe_9e205206,source_experiment_6576ccc5,source_experiment_9647c1ba; no imports or execution.'})
assert len(inherited_scripts)==88
record_names=['source-experiment.json','convolution-experiment.json','pf-probe.json','schur-probe.json','schur-validation.json','source-visit.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-a45def12/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines() if x.strip()]
event_bindings=[];decoder=json.JSONDecoder()
for n,value in data.items():
 if n=='source-visit.json':continue
 matches=[];projection_matches=[]
 for event_no,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output','')
  for pos,ch in enumerate(out):
   if ch not in '[{':continue
   try:obj,end=decoder.raw_decode(out,pos)
   except (ValueError,TypeError):continue
   row={'event':event_no,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'start_character':pos,'end_character':end,'whole_stdout':out.strip()==out[pos:end]}
   if obj==value:matches.append(row)
   if n=='schur-probe.json' and obj=={k:v for k,v in value.items() if k!='samples'}:projection_matches.append(row)
 event_bindings.append({'record':n,'complete_saved_json_matches':matches,'projection_without_samples_matches':projection_matches,'scope':'Literal saved JSON binding only; no regeneration or command-time imported-version inference.'})
# Count loop/index domains only: no mathematical coefficient, choose, gap, sign, determinant or RNG work.
qs=list(range(2,19))+[25];source_counts=Counter();triple_counts=[0,0,0]
for q in qs:
 for r in [False,True]:
  a=3;b=3*q+(1 if r else 2);source_counts['fractions']+=1
  for k in range((q-(2 if r else 1))//2+1):
   d=q-2*k-(2 if r else 1);j=q+k+1;assert d>=0 and 2*j+1<=b
   source_counts['rows']+=1;source_counts['coefficients']+=b+6
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     triple_counts[direction]+=all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
for key in ['fractions','rows','coefficients']:assert source_counts[key]==data['source-experiment.json'][key]
assert triple_counts==data['source-experiment.json']['raw_triples']
aux_counts=Counter()
for j in range(1,81):
 for s in list(range(10))+[20,100]:
  aux_counts['parameter_pairs']+=1;aux_counts['low_formulas']+=2*j;aux_counts['cutoff_formulas']+=2;aux_counts['bounds']+=j>=2
  for n in range(2*j):
   aux_counts['low_steps' if n+1<j else 'cutoff_steps' if n+1==j else 'last_steps' if n+1==2*j else 'open_steps']+=1
aux_counts['random_open_steps_saved']=600
for key in ['low_formulas','cutoff_formulas','bounds','low_steps','cutoff_steps','last_steps']:
 assert aux_counts[key]==data['convolution-experiment.json'][key]
assert aux_counts['open_steps']+600==data['convolution-experiment.json']['open_steps']
probe_domain=[(j,s,h) for h in range(1,8) for j in range(h,h+6) for s in [0,1,3,10]]
validation_domain=[(j,s,h) for h in range(1,13) for j in [h,h+1,2*h] for s in [0,3,10]]
assert len(probe_domain)==data['schur-probe.json']['cases']==168
assert len(validation_domain)==data['schur-validation.json']['cases']==108
assert 400*8*4==data['pf-probe.json']['parameter_cases']==12800 and data['pf-probe.json']['families']==400
schur_counts={'probe_attempts':len(probe_domain),'probe_distinct_parameters':len(set(probe_domain)),
 'probe_upper_residual_attempts':sum(h>=2 for j,s,h in probe_domain),'probe_closed_final_step_attempts':sum(h==1 for j,s,h in probe_domain),
 'validation_attempts':len(validation_domain),'validation_distinct_parameters':len(set(validation_domain)),
 'validation_upper_residual_attempts':sum(h>=2 for j,s,h in validation_domain),'validation_closed_final_step_attempts':sum(h==1 for j,s,h in validation_domain),
 'probe_validation_distinct_overlap':len(set(probe_domain)&set(validation_domain)),
 'validation_duplicate_parameters':[{'parameter':list(p),'occurrences':n} for p,n in Counter(validation_domain).items() if n>1]}
# Stored shapes/coefficients are inspected only as literal records; no partitions, Pieri, determinant or signs regenerated.
schur_counts['stored_negative_probe_rows']=len(data['schur-probe.json']['negative'])
schur_counts['stored_sample_nonzero_rows']=sum(len(x['expansion']) for x in data['schur-probe.json']['samples'])
reads=[];all_old={r['module']:r for r in older}
for name in ['MarkovAdjacentConvolutionM09F','MarkovOrderedConvolutionM09F']:
 p=P/'.control/markov/workers/000177/artifacts/research'/(name+'.lean');assert sha(p)==all_old[name]['sha256']
 reads.append({'path':str(p),'sha256':sha(p),'full_body_read':True,'scope':'Named immediate inherited implication/support bridge inspected, prior proof audit reused; no old replay upgrade.'})
for name in ['MarkovQKernelM7E2','MarkovTransposedKernelM657','MarkovThreeSourceM9E2']:
 row=all_old[name];reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'full_body_read':False,'scope':'Explicit first90lines including definitions and named bridge statements; prior proof audit reused.'})
for name in ['three_probe_9e205206.py','source_experiment_6576ccc5.py','source_experiment_9647c1ba.py']:
 row=next(x for x in inherited_scripts if x['path']=='research/'+name)
 reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'full_body_read':False,'scope':'Explicit recurrence/L/correction definitions and bounded surrounding text only, no import/execution.'})
residual={'root_open':True,'new_unconditional_raw_LC_region':False,'new_unconditional_source_estimate':False,
 'root_equivalence':'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2','remaining_predicates_unproved':['ThreeBeyondBandM657','OtherFourM9E2'],
 'UpperAdjacentMA45_proved':False,'SharpCompleteMargin_proved':False,'UnshiftedAdjacent_proved':False,'UnshiftedRatio_proved':False,
 'closed_auxiliary_ranges':'All natural j,s,n: n<j (including n=j-1 cutoff) and last n=2j-1 for j>=1. j0 imposes no adjacency; j1 first step separate and final step covered.',
 'remaining_auxiliary_range':'UpperAdjacentMA45: forall natural j,s,n, j<=n and n+1<2*j imply B_n*A_(n+1)<=B_(n+1)*A_n. No finite bound; remains unproved.',
 'exact_auxiliary_equivalences':'UpperAdjacentMA45 iff UnshiftedAdjacentM09F iff UnshiftedRatioM09F. Not an equivalence with the root or SharpCompleteMargin.',
 'conditional_source_LC':'UpperAdjacentMA45 implies sharp margin and raw H LC for q,k,i natural,r Boolean,q>=2,2*(q+k+1)+1<=N. Indices(i,q+k+1),(i+1,q+k+1),(i+2,q+k+1),allnaturalstarts/zeros. No extra polygon guard needed for this conditional stronger row conclusion.',
 'source_residues':'r=false:N=3q+2; r=true:N=3q+1; actual paths false^(q-1)++[true,r]. q1 remains outside this adapter.',
 'general_weight_or_Schur_result_proved':False,'specific_weight_series_and_determinants_proved':True,'actual_raw_source_counterexample':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False,
 'prior_source_scope_unchanged':'Allactuala2 all3directions152;a3H3j<=N+9 inherited172;175bandprefixi<=5 or strict tailN<i+j+q,withq>=2,q<j,2j+1<=N. No clause removed178.'}
proof_details={
 'formal_moments':'geom=PowerSeries.mk1, negBin(t)=geom^(t+1). CommRing formal identities and Nat.choose recurrences, no convergence. Weighted antidiagonal identity uses i+k=n and coefficient multiplication.',
 'lower_formula':'q_product_interior for natural n<j. Shifted coefficient negBin(s+t+9)*X^2 has zero coefficients n0/1; no Nat(n-2) substitution without guards. Second moment scale separates n0,n1,n>=2.',
 'lower_adjacent':'n+1<j; D=(2s+10)(2s+11)>0. Denominator-free identity with256*C_n*C_(n+1)*D*j*n*(2j-n-1); only D^2 positive canceled, no coefficient division.',
 'cutoff':'j>0 restores both distinct endpoint contributions(0,j),(j,0) with weight1 at q indexj. j0 excluded here; j1first handled separately. j=k+2,k>=0 uses exact Pascal second difference/endpoint sum, universal quadratic choose bound p>=3, and nonnegative scalar certificate.',
 'top':'j=k+1>=1; polynomial reflection at supplied degree upper bound j, not unguarded natural-degree reversal. Positive x(x+1)(x+2),x=s+j+3, clears last-step identity; no possibly-zero coefficient division.',
 'zero_support':'Inherited q coefficients positive0..j, products positive0..2j and zero beyond. Adjacent-to-ordered proof uses this proven interval support, includes j0 and zero tails. Actual raw zeros never removed.',
 'series_scope':'weightSeries*(1-X)^2=(1+X)^2 via exact formal inverse; no analytic division. Affine3det and affine4det with arbitrary fourth row, plus explicit weight333det zero. General Schur evaluation/positivity/expansion not formalized.',
 'source_bridge':'New source_band_of_upper invokes named177 source_band_of_adjacent; retains global UpperAdjacent premise and exact q>=2/nonnegative-exponent band. Original raw integer coefficients unchanged; no ratio normalization of target.'}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,
 'source_level_scope':residual,'literal_raw_indices':{'horizontal':['(i,q+k+1)','(i+1,q+k+1)','(i+2,q+k+1)']},
 'zero_and_endpoint_handling':'Formal power series shifted n0/1 zeros; distinct cutoff endpoints j>0;j1 explicit;j0 vacuous adjacency. Inherited complete interval support/tails proved, raw natural zeros retained. Original root polygon and0/1,1/1 endpoints unchanged.',
 'proof_chain_details':proof_details}
F={**base,'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'source_experiment':{'q_values':qs,'residues':[False,True],'counts':dict(source_counts),'polygon_triple_counts':triple_counts,'polygon_triples_total':sum(triple_counts),'saved':data['source-experiment.json'],
  'scope':'36actuala3 fractions. Identity only correction-band rows/allcolumns0..N+5; all-direction triples scanned over entire natural triangular bounding domain and all3original polygon memberships, not confined to those195rows.',
  'zeros_saved_only':4491,'signs_coefficients_or_failures_recomputed':False,'source_formula':'raw(i,j)=L(d,j,i-3)+correction(d,k,i-2,r),negative Python arguments explicitly zero; no negative-index Nat truncation.'},
 'convolution':{'j_values':list(range(1,81)),'s_values':list(range(10))+[20,100],'deterministic_counts':dict(aux_counts),'saved':data['convolution-experiment.json'],
  'random_planned_cases':600,'random_seed_literal':'0xa45def12','random_domain':'j2..500,s0..300,n=j..2j-2','random_samples_regenerated':False,
  'scope':'960parameter pairs;77760lower coefficient identities,1920cutoff identities;37920strict-lower steps,960cutoff,960final,37920deterministic upper plus600random upper;948bound positions. Lower-gap identities checked at37920positions without a separate saved counter.'},
 'pf_probe':{'saved':data['pf-probe.json'],'planned_families':400,'parameter_cases_from_empty_failure_record':12800,
  'j_values':[2,3,4,5,8,12,18,25],'s_values':[0,1,3,10],'rng_seed_literal':'0xa45def12','rng_recreated':False,
  'scope':'Random1..7positive linear/geometric factors with parameter1..6,truncateddegree25. Early stop iffailure; savedemptyfailures permits domaincount400*8*4. Generated weight vectors and actual adjacent-value computations not reconstructed; no source-family identification.'},
 'schur':{'domain_counts':schur_counts,'probe_saved':data['schur-probe.json'],'validation_saved':data['schur-validation.json'],
  'scope':'Pieri implementation unverified; both finite scans include already-proved h1 final step. Validation h1 list[h,h+1,2h] repeats j2 for each of3s,so108attempts105distinct;99remaining-upper attempts/unique and9final-step attempts6distinct. Counts2448/5301/404 and determinant/sign identities saved only.',
  'negative_probe_cap':12,'negative_coefficients_not_root_refutation':True,
  'literal_example':'Saved j5,s0,n5 shape333 coefficient-12250,determinant0,gap631276800; final Lean proves only explicit weight333detzero,not its Schur expansion or coefficient value.',
  'negative_sign_or_partition_counts_recomputed':False,'overlap_not_independent_sample_total':True},
 'output_event_bindings':event_bindings,'result_bindings':records,
 'source_visit':{'path':'evidence/markov-a45def12/source-visit.json','sha256':binding('evidence/markov-a45def12/source-visit.json'),'scope':'Worker-retained literature record only. Auditor did not browse or claim novelty; no external theorem imported into new proofs.'},
 'invocation_limits':'Four new scripts read/ASTparsed only; no import/execution,frame recurrence,binomial/polynomial/kernel values,Schur/Pieri/partition/determinant calculations or RNG regenerated. Saved JSON compared literally to saved event outputs.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':newlibs,'imported_four_functions':four,'residual_binding':residual,
 'receipt_waiting':js(T/'markov_worker_000178_receipt_watch.json'),'all_named_new_match_current':True,'explicit_inherited_body_reads':reads,
 'read_scope_notes':['All10newmath bodies and4newexperimental scripts read in full; final mathematics/correspondence/operational/checkpoint-final/next read. Early checkpoints identity-only.',
 'Only exact closed178 archive and named inherited/current counterparts read; active179+ excluded. Oldsealedwindows unchanged.',
 'Named library WellKnown statements,Polynomial Degree Operations andMatrixDeterminant Basic declarations read; imported library trust remains ordinarycompiled,notwhole-source rebuild.',
 'No project edits/proposercontact/help, no program/proof/checker/replay/experiment/finalizer/CAS execution or mathematical-value/RNG recomputation.',
 'Finite domains use actual already-formal a3labels and natural indices/polygon tests only. Prior storageCOW changes inode metadata only,bytesremainbinding.']}
for label,value in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 path=T/f'markov_worker_000178_{label}.json';assert not path.exists();path.write_text(json.dumps(value,indent=2,ensure_ascii=False)+'\n')
 print(path.name,path.stat().st_size,sha(path))
print(json.dumps({'source_counts':dict(source_counts),'triple_counts':triple_counts,'auxiliary_counts':dict(aux_counts),'schur_domain_counts':schur_counts,
 'event_bindings':{x['record']:{'full':[z['event'] for z in x['complete_saved_json_matches']],'projection':[z['event'] for z in x['projection_without_samples_matches']]} for x in event_bindings}},indent=2))
