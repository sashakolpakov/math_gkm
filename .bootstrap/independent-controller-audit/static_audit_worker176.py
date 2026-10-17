"""Closed worker176: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000176';A=W/'artifacts';E=A/'evidence/markov-be355177'
REQUEST='be35517714ad4fa2a3e9e4312d96ce0a'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792214091215313000.json');axioms=js(E/'axioms-1792214105140084000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':176,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1414.709665775299. Eight final mathematical modules compiled and jointly replayed,46 distinct theorem closures printed; one superseded successful mathematical version retained. Full root open.',
 'scope':'Archive-first closed176 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active177 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-be355177/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in176':True,'printed_in176':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':46,'def':8} and len(axioms['declarations'])==46
prior=js(T/'markov_worker_000175_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed175_sha256':h,'initial176_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in176':False})
assert len(older)==len({x['path'] for x in older})==516
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in176':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','correspondence','mathematics','next','operational']:
 rel='research/markov-be355177-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['transposed_stress_be355177.py','robust_probe_be355177.py','relative_margin_probe_be355177.py','scalar_probe_be355177.py','candidate_stress_be355177.py','source_experiment_be355177.py','generate_sharp_margin_be355177.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 else:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'manifest_only_when_not_initial':rel not in before,'executed_by_auditor':False,'scope':'Historical script identity only. Explicit source_experiment_6576ccc5, source_experiment_9647c1ba and three_probe_9e205206 are named current experiment dependencies. Non-.py extensions match prior/manifest pins; no import or execution.'})
assert len(inherited_scripts)==75
record_names=['transposed-stress.json','transposed-stress-progress.json','robust-probe.json','relative-margin-probe.json','scalar-probe.json','scalar-probe-first-observed.json','candidate-stress.json','source-experiment.json','source-progress.json','source-visit.json','execution-notes.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-be355177/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})

# Count finite index domains only. Do not import research, evaluate C/L/kernel,
# regenerate RNG samples, or compute any coefficient, product, gap or sign.
source=Counter();domains=[];qs=data['source-experiment.json']['q_values']
assert qs==list(range(2,21))+[25,35,50]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['source_cases']+=1
  for k in range((q-(2 if r else 1))//2+1):
   j=q+k+1;d=q-2*k-(2 if r else 1);source['rows']+=1
   source['coefficients']+=n+6;source['raw_triples']+=n+4
   for i in range(n+6):
    if i>=3:
     source['kernel_weighting_checks']+=1
     source['uniform_bound_checks']+=d<=i-3
   for i in range(n+4):
    source['polygon_triples']+=all(3*n<=n*x+3*j and x+j<=n+2 for x in range(i,i+3))
   domains.append({'q':q,'r':r,'k':k,'j':j,'d':d,'coefficient_positions':n+6,'triple_positions':n+4})
for key in ['rows','coefficients','raw_triples','polygon_triples','uniform_bound_checks']:
 assert source[key]==data['source-experiment.json'][key]
assert data['source-progress.json']=={key:val for key,val in data['source-experiment.json'].items() if key!='seconds'}
stress=Counter();robust=Counter()
for s0 in range(3,31):
 for d in [0,1,s0-1,s0,s0+1,s0+2,2*s0,5*s0]:
  for k in [0,1,2,3,s0//2,s0,s0+1,2*s0,5*s0]:
   for r in [False,True]:
    stress['deterministic_triplets']+=1
    stress['deterministic_coefficient_positions']+=(s0+4)*(2*s0+5)
    stress['deterministic_auxiliary_q1_triplets']+=d+2*k+(2 if r else 1)==1
 for d in [0,1,s0,s0+1,2*s0,5*s0]:
  for k in [0,1,2,3,s0//2,s0,s0+1,2*s0,5*s0]:
   for r in [False,True]:
    robust['triples']+=1;robust['weighted_scalar_positions']+=1
    robust['cut_coefficient_positions']+=(s0+4)*(2*s0+5)
    robust['auxiliary_q1_triplets']+=d+2*k+(2 if r else 1)==1
    robust['s_le_band_j_triplets']+=s0<=d+3*k+(3 if r else 2)
assert stress['deterministic_triplets']==4032
assert stress['deterministic_triplets']+600==data['transposed-stress.json']['planned_cases']==data['transposed-stress.json']['triplets']
stress['random_triplets_saved_count']=600
stress['random_coefficient_positions_derived_from_saved_total']=data['transposed-stress.json']['coefficient_checks']-stress['deterministic_coefficient_positions']
assert 600*(31+4)*(2*31+5)<=stress['random_coefficient_positions_derived_from_saved_total']<=600*(100+4)*(2*100+5)
assert robust['triples']==data['robust-probe.json']['triples']
relative=Counter()
for j in range(1,81):
 for s0 in list(range(21))+[30,50,100]:
  relative['complete_coefficients']+=2*j+1
  for i in range(j+1):
   relative['pair_checks']+=len(range(i,j+1))
for key,val in relative.items():assert val==data['relative-margin-probe.json'][key]
scalar=Counter()
for d in list(range(11))+[20,50]:
 for k in list(range(31))+[50,100,200,500,1000]:
  for r in [False,True]:
   for s0 in range(3,21):
    scalar['margin_checks']+=1
    if k<=50:scalar['sharp_bound_checks']+=s0+1
    scalar['auxiliary_q1_triplets']+=d+2*k+(2 if r else 1)==1
    scalar['s_le_band_j_triplets']+=s0<=d+3*k+(3 if r else 2)
for key in ['margin_checks','sharp_bound_checks']:assert scalar[key]==data['scalar-probe.json'][key]
assert {k:v for k,v in data['scalar-probe.json'].items() if k!='seconds'}=={k:v for k,v in data['scalar-probe-first-observed.json'].items() if k!='seconds'}
candidate=Counter()
for s0 in [3,4,5,10,20,50,100]:
 for d in [0,1,s0-1,s0,s0+1,s0+2,2*s0,10000]:
  for k in [0,1,2,3,10,100,10000,1000000]:
   for r in [False,True]:
    candidate['planned_grid_triplets']+=1
    if s0>d+3*k+(3 if r else 2):
     candidate['excluded_grid_triplets']+=1;continue
    candidate['eligible_grid_scalars']+=1
    candidate['grid_zero_clamp' if d<=s0 else 'grid_positive_clamp']+=1
for j in [1,2,3,5,10,20,50,100,150,200,300]:
 for s0 in [0,1,3,10,30,100,1000]:
  candidate['complete_parameter_pairs']+=1;candidate['complete_coefficients']+=2*j+1
assert candidate['complete_coefficients']==data['candidate-stress.json']['complete_checks']
candidate['planned_random_triplets']=2000
candidate['random_eligible_inferred_from_saved_total']=data['candidate-stress.json']['scalar_checks']-candidate['eligible_grid_scalars']
assert 0<=candidate['random_eligible_inferred_from_saved_total']<=2000
assert sum(data['candidate-stress.json']['clamp_counts'].values())==data['candidate-stress.json']['scalar_checks']
events=[json.loads(line) for line in (W/'events.jsonl').read_text().splitlines()]
event_bindings=[]
for name in record_names:
 matches=[]
 for idx,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output')
  if not isinstance(out,str):continue
  try:parsed=json.loads(out)
  except (ValueError,TypeError):continue
  if parsed==data[name]:matches.append({'event':idx,'returncode':item.get('exit_code'),'projection':'full'})
 objects=[];decoder=json.JSONDecoder()
 for idx,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output')
  if not isinstance(out,str):continue
  for mat in re.finditer(r'(?m)^[ \t]*\{',out):
   start=mat.end()-1
   try:obj,end=decoder.raw_decode(out,start)
   except ValueError:continue
   if obj==data[name]:objects.append({'event':idx,'returncode':item.get('exit_code'),'character_start':start,'character_end':end,'projection':'complete_JSON_object_within_stdout'})
 event_bindings.append({'record':name,'exact_json_output_matches':matches,'exact_json_object_matches':objects})
watch=js(T/'markov_worker_000176_receipt_watch.json');checks=watch['checks']
assert len(checks)==5 and sum(x['status']=='absent' for x in checks)==4 and checks[-1]['status']=='present'
assert checks[-1]['sha256']==sha(W/'receipt.json')
assert all(b['observed_epoch']-a['observed_epoch']>=60 for a,b in zip(checks,checks[1:]))
assert all(x['requested_ms']<=59000 for x in watch['waits'])
explicit=[]
for worker,name in [(170,'MarkovQuantitativeCutMA64.lean'),(170,'MarkovLiftMarginMA64.lean'),(170,'MarkovCompleteMarginMA64.lean'),(154,'MarkovThreeSourceM9E2.lean')]:
 path=P/'.control/markov/workers'/f'{worker:06d}'/'artifacts/research'/name
 expected=next(row['sha256'] for row in older if row['path']=='research/'+name)
 assert sha(path)==expected
 explicit.append({'path':str(path),'sha256':expected,'full_body_read':True,'scope':'Explicit named inherited source; old proof/check windows unchanged.'})
residual={
 'root_open':True,'new_unconditional_raw_LC_region':False,
 'root_equivalence':'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondBandM657','OtherFourM9E2'],
 'new_unconditional_source_estimate':True,
 'source_estimate_guard':'q>=2, j=q+k+1, 2*j+1<=sourceN(q,r), d=bandExponent(q,k,r)<=s; column s+3, all natural q,k,s and both residues.',
 'source_estimate':'choose(s+9,4)*raw(s+3,j) <= (choose(s+9,4)+3*(s+3))*liftOutput(d,j,s), integer raw coefficients, no denominator bound.',
 'sharp_coefficient_bound':'For all natural d,k,s,h and both residues, B_s*K_s[h] <= V_s*L_s[h]. B_s>0; equality at h=s. Includes natural clamp and zero tails.',
 'optimality':'For every real v, (forall h,K_s[h]<=v*L_s[h]) iff V_s<=v*B_s. No division by a potentially zero coefficient.',
 'separated_choose':'All natural k>=1 and s; shifted uniform estimate handles k=0 by binomial zeros and requires j>=3*k+2.',
 'SharpCompleteMargin_proved':False,'SharpTopScalars_proved':False,
 'SharpCompleteMargin_scope':'forall natural j,s,n; B_(s+1)^2*(P_s*P_(s+2))[n] <= B_s*B_(s+2)*(P_(s+1)^2)[n]. No s<=j guard in this candidate.',
 'SharpTopScalars_scope':'forall natural d,k,s and both residues;3<=s<=bandJ(d,k,r) -> V_s*V_(s+2)<=B_(s+1)^2. Auxiliary parameter domain, not identified with every source without source guards.',
 'cut_transport':'Complete margin plus s<=j transports through inherited ordered symmetric-pair theorem to all lower tail cuts; zero denominator terms retained.',
 'robust_cuts_iff_scalar':'Under SharpCompleteMargin and s<=bandJ, all robust tail-cut coefficients nonnegative iff V_s*V_(s+2)<=B_(s+1)^2. Necessity at h=s,n=2*s+2; no s>=3 needed for this equivalence.',
 'robust_vs_complete':'Robust gap uses lower L_(s+1)^2 minus K_s*K_(s+2), discarding the nonnegative middle correction. Stronger than complete-kernel gap; no converse from source LC asserted.',
 'conditional_source_LC':'Both universal unproved candidates imply every natural horizontal start in actual guarded q>=2 correction band, via prefix/tail split, s=i-3, weighted CrossLC binomial sequence and exact source identity.',
 'conditional_is_root_equivalence':False,
 'actual_raw_source_counterexample':False,
 'obstructions':'Formal old margin deficit, negative individual symmetric pair and positive full convolution are auxiliary. Actual3/11 path/labels/raw[8652,5280,1287]/polygon/gap16743276 are formal accepted final statements.',
 'path_vs_q':'threePath2false gives raw q3false and denominator11; path=[false,false,true,false]. No indexing conflation.',
 'q1_new_source_gain':False,'new_vertical_or_diagonal_region':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,
 'older_failed_versions_retroactively_recovered':False,
 'prior175_scope_unchanged':'Raw band prefix i<=5 or strict tail N<i+j+q remains the last unconditional region improvement; no clause removed in176.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'residual_binding':residual,'receipt_waiting':watch,'all_named_new_match_current':True,'explicit_inherited_body_reads':explicit,
 'read_scope_notes':[
  'All8 final mathematical bodies and7 experiment/generator scripts read as text; no project execution/import or mathematical-value recomputation.',
  'Explicit170 QuantitativeCut/LiftMargin/CompleteMargin and154 ThreeSource read in full. Initial guessed164 QuantitativeCut path was absent; batch stopped before any content read. Correct producer170 used, no broad current enumeration.',
  '516 named older mathematics,181 pending/other,2 operational,75 scripts and16 external pairs are hash comparisons only unless explicitly listed full body reads.',
  'Finite deterministic index multiplicities counted without coefficient or RNG evaluation; randomized tail totals remain saved evidence with explicit limits.',
  'Only closed176 archive enumerated; named current/inherited counterparts used. Active177+ excluded; earlier seals/windows immutable.']}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},'mathematical_values_recomputed':False,
 'source_level_scope':residual,'literal_raw_indices':['(i,j)','(i+1,j)','(i+2,j)'],
 'kernel_output_indices':['(s+3,j)','(s+4,j)','(s+5,j)'],'residue_map':{'true':'N=3*q+1,c=2','false':'N=3*q+2,c=1'},
 'zero_and_endpoint_handling':[
  'Sharp bound allnatural indices, clamped d-s retained, h>s kernels zero; top coefficient equality and positive B avoid zero division.',
  'Uniform source estimate requires d<=s, making absorbed top term zero; q>=2 and literal2*j+1<=N retain natural exponent interpretation.',
  'Separated choose proof cancels positive index factors only; k0 shifted case vanishes by natural binomial convention.',
  'Complete margin candidate allj,s,n; cut transport requires s<=j. Top candidate additionally s>=3. Auxiliary equivalence itself does not require s>=3.',
  'All cuts keep indices>=h, including empty cuts and support zeros. Quantitative cut retains zero-denominator pairs with nonpositive transformed terms.',
  'Source prefix/tail case split retains all natural i, middle s=i-3. No original polygon, endpoint, vertical, diagonal or other-numerator residual removed.'],
 'proof_chain_details':{
  'relative':'Choose cross-ratio and successor inequalities bound both lower-kernel terms; exact finite binomial-product identity combines them.',
  'uniform':'Universal induction on k with a displayed positive polynomial step; offset cross-ratio plus top monotonicity; no interpolation or finite empirical premise.',
  'sharp':'K top equals V; nonnegative absorption and correction-relative inequality give B*K<=V*L. Equality top proves optimality among scalar coefficientwise bounds.',
  'transport':'Exact reflected complete kernel and common shifts feed inherited quantitative_cut with proved ordering/nonnegativity and explicit HM, s<=j; denominator-zero cases stay.',
  'robust':'Asymmetric product bound and positive B_s*B_s2 cancellation yield robust coefficient gap under HM and top scalar; middle monotonicity gives complete gap.',
  'weighted_source':'CrossLC zero-extended binomial weights give output LC; exact source formula, prefix/tail split and natural i-3 identities attach to actual families.',
  'scalar':'Degree upper bounds and top product coefficient identity give necessity at h=s,n=2s+2; sufficiency reuses robust transport under HM and s<=j.',
  'obstructions':'Ordinary Lean exact numeral certificates distinguish old sufficient-margin/pair failures from positive complete convolution and actual polygon-valid3/11 raw gap.'}}
F={**base,'mathematical_values_recomputed':False,
 'source_experiment':{'counts':dict(source),'q_values':qs,'index_domains':domains,'saved_result':data['source-experiment.json'],'zero_count_saved_only':10781,'zero_count_independently_recomputed':False,'qualification':'44 actual parameter families,319 band rows. Counts from literal index domains; all zero/failure/gap values saved only. Kernel identity domain startsi3; uniform bound additionallyd<=i-3.'},
 'transposed_stress':{'counts':dict(stress),'saved_result':data['transposed-stress.json'],'saved_progress':data['transposed-stress-progress.json'],'random_samples_regenerated':False,'qualification':'4032 deterministic list-multiplicity triples+600 seeded random triples. Independent deterministic count and planned total only; variable-s random coefficient total9809279 not independently reconstructed. Array padding keeps2s+5 slots percut; allcuts0..s+3.'},
 'robust':{'counts':dict(robust),'saved_result':data['robust-probe.json'],'qualification':'Deterministic3024 triplets, weighted scalar and robust tail-cut domains. Includes auxiliaryq1 ands>j cases outside later conditional-source interface; no failures are saved outcomes only.'},
 'relative_margin':{'counts':dict(relative),'saved_result':data['relative-margin-probe.json'],'qualification':'Complete convolutions and sorted symmetric pairs are different tests.49982 negative pairs saved only; first10 examples literal, no sign computation.'},
 'scalar':{'counts':dict(scalar),'saved_result':data['scalar-probe.json'],'first_observed':data['scalar-probe-first-observed.json'],'outputs_equal_except_seconds':True,'qualification':'An accidental current helper import repeated this unguarded scan. First observed record retained separately; not two independent domains or a fresh audit run.6619 failed old-margin tests saved only.'},
 'candidate':{'counts':dict(candidate),'saved_result':data['candidate-stress.json'],'random_samples_regenerated':False,'qualification':'896 planned deterministic scalar tuples filtered bys<=j;2000 additional randomized tuples not regenerated.2821 eligible total and373/2448 clamp split remain saved observations beyond independently counted grid.77 fixed complete parameter pairs give11851 coefficient positions. j<s allowed by complete-margin candidate.'},
 'output_event_bindings':event_bindings,'result_bindings':records,'saved_script_versions':[],
 'source_visit':data['source-visit.json'],'execution_notes':data['execution-notes.json'],
 'invocation_limits':'Scripts only parsed/read; no RNG or project imports/execution. Final source hashes plus command/output records are not atomic invocation-source attestations. Saved outcomes do not prove universal candidates.'}
for name,obj in [('mathematical_source_hashes.json',H),('source_structure_audit.json',S),('finite_domain_audit.json',F)]:
 p=T/('markov_worker_000176_'+name);p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
print(json.dumps({'counts':dict(counts),'older':len(older),'pending':len(oldexcluded),'scripts':len(inherited_scripts),'source':dict(source),'stress':dict(stress),'robust':dict(robust),'relative':dict(relative),'scalar':dict(scalar),'candidate':dict(candidate),'event_bindings':event_bindings},indent=2))

