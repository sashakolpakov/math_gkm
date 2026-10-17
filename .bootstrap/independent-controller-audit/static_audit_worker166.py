"""Audit-owned closed166 static parsing, hashes and index counts; no project or mathematical execution."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import ast, hashlib, json, re

T=Path('/private/tmp/math_gkm_godel_20261013'); P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000166'; A=W/'artifacts'; E=A/'evidence/markov-db238071'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
base={'worker':166,'request':'db238071732b4d94a95826082e34e37e','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed / return0 / delivered report; host elapsed1819.4393000602722 seconds. Twelve selected compiled/printed modules, five replayed. Root unresolved.',
 'scope':'Closed166 archive and explicit named inherited/current counterparts only. Static parsing, hashes, literal inventory and loop-index counts. No project/compiler/proof/checker/replay/generator/experiment/finalizer execution, mathematical-value recomputation, project edits or research assistance. Active/later work excluded; earlier windows unchanged.'}
before=js(E/'before.json'); receipt=js(W/'receipt.json'); v=js(E/'validation.json'); manifest=js(E/'manifest.json')
sel=v['modules']; replayed=set(v['successfully_replayed']); axi=js(A/v['axiom_reports'][0])
replays=[(p,js(A/p)) for p in v['replay_receipts']]
passed=[d for p,d in replays if d.get('returncode')==0]
assert len(passed)==1 and set(passed[0]['modules'])==replayed
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
decl_re=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance)\s+(\w+)')
def parse(src):
 matches=list(decl_re.finditer(src)); ds=[]; statements=[]; definitions=[]
 for k,x in enumerate(matches):
  kind,name=x.groups(); end=matches[k+1].start() if k+1<len(matches) else src.rfind('\nend')
  block=src[x.start():end].strip(); ds.append({'kind':kind,'name':name})
  if kind=='theorem':
   assert ':=' in block
   statements.append({'name':name,'statement':block.split(':=',1)[0].rstrip(),'block_sha256':hashlib.sha256(block.encode()).hexdigest()})
  else: definitions.append({'name':name,'kind':kind,'header':block.split(':=',1)[0].rstrip(),
      'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)})
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S); clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return ds,statements,definitions,bad
def binding(rel):
 h=sha(A/rel); assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel]
 return h
new=[]; structures=[]; excluded=[]; excluded_struct=[]; counts=Counter(); ec=Counter(); partitions={}
for rel in sorted(receipt['changes']):
 m=Path(rel).stem
 if not rel.startswith('research/Markov') or not rel.endswith('MDB2.lean') or m.startswith('MarkovAudit'):continue
 src=(A/rel).read_text(); h=binding(rel); ds,statements,definitions,bad=parse(src); assert not bad,(m,bad)
 attempts=[(p,d) for p,d in builds if m in d.get('modules',{})]
 matching=[(p,d) for p,d in attempts if d['modules']=={m:h}]
 successful=[(p,d) for p,d in matching if d.get('returncode')==0]
 for p,d in matching: assert sha(p.with_suffix('.lean'))==h
 op='evidence/markov-db238071/'+m+'.olean'; ao=(A/op).exists(); co=(P/op).exists(); assert ao==co
 oh=binding(op) if ao else None
 status=('selected_replayed' if m in replayed else 'selected_unreplayed') if m in sel else ('timed_out_excluded' if attempts else 'unattempted_excluded')
 if m not in sel and attempts: assert all(d.get('timeout',False) for p,d in attempts)
 row={'module':m,'path':rel,'bytes':len(src.encode()),'characters':len(src),'sha256':h,
  'declarations':ds,'object_path':op,'object_sha256':oh,'archive_object_present':ao,
  'current_object_present_at_initial_observation':co,'selected':m in sel,'replayed_in166':m in replayed,
  'printed_in166':m in sel,'status':status,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][m],'matches_final_source':d['modules'][m]==h,
    'returncode':d.get('returncode'),'timeout':d.get('timeout',False)} for p,d in attempts]}
 structure={**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':statements,'definition_bindings':definitions,'forbidden_tokens':bad,
  'literal_mathematical_data_hashed_not_evaluated':True}
 partitions.setdefault(status,Counter()).update(d['kind'] for d in ds)
 if m in sel:
  assert h==v['source_sha256'][m]==axi['sources'][m] and successful and ao
  assert any(str(p.relative_to(A))==v['successful_builds'][m] for p,d in successful)
  assert all(d['name'] in axi['declarations'] for d in ds if d['kind']=='theorem')
  if m in replayed: assert h==passed[0]['modules'][m]
  counts.update(d['kind'] for d in ds);new.append(row);structures.append(structure)
 else:
  assert not successful and not ao
  ec.update(d['kind'] for d in ds);excluded.append(row);excluded_struct.append(structure)
assert len(new)==12 and counts=={'theorem':33,'def':13}
assert len(excluded)==52 and ec=={'theorem':84,'def':46}
assert partitions=={'selected_replayed':Counter({'theorem':26,'def':6}),
 'selected_unreplayed':Counter({'theorem':7,'def':7}),
 'timed_out_excluded':Counter({'theorem':7,'def':7}),
 'unattempted_excluded':Counter({'theorem':77,'def':39})}
assert len(axi['declarations'])==33
operational=[]
for name in ['KernelRflMDB2','KernelRflRejectMDB2']:
 rel='research/'+name+'.lean';src=(A/rel).read_text();h=binding(rel)
 attempts=[(p,d) for p,d in builds if name in d.get('modules',{})]
 operational.append({'module':name,'path':rel,'sha256':h,'source_text':src,
  'named_mathematical_closures':0,'anonymous_examples':len(re.findall(r'(?m)^example\b',src)),
  'selected':False,'replayed':False,'explicit_axiom_prints':False,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][name],
    'returncode':d.get('returncode'),'timeout':d.get('timeout',False)} for p,d in attempts]})
prior=js(T/'markov_worker_000165_mathematical_source_hashes.json');older=[];old_pending=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'sealed165_sha256':h,'initial166_sha256':h,
  'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in166':False})
assert len(older)==len({x['path'] for x in older})==363
for d in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 old_pending.append({'module':d['module'],'path':rel,'sha256':h,'status':d['status'],
  'selected_recovery_in166':False,'historical_absence_window_not_extended':True})
assert len(old_pending)==126
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
new_libs=[]
for n in ['Lemmas','Defs']:
 src=P/f'.lake/packages/mathlib/Mathlib/Data/Nat/Digits/{n}.lean'
 obj=P/f'.lake/packages/mathlib/.lake/build/lib/lean/Mathlib/Data/Nat/Digits/{n}.olean'
 observed=Path('/Users/sasha/collatz/Novikov_Collatz_Path_Complexes/formal/.lake/packages/mathlib')/f'Mathlib/Data/Nat/Digits/{n}.lean'
 assert sha(src)==sha(observed)
 new_libs.append({'source_path':str(src),'source_sha256':sha(src),'object_path':str(obj),'object_sha256':sha(obj),
  'explicit_read_counterpart':str(observed),'scope':'New named static source/object observation; ordinary compiled-library trust, not fresh production/replay authentication.'})
docs=[];scripts=[];inherited=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel=f'research/markov-db238071-{tag}.md';docs.append({'path':rel,'sha256':binding(rel),'current_match':True})
for name in ['correction_experiment_db238071.py','packed_probe_db238071.py','probe_db238071.py',
 'finish_products_db238071.py','direct_products_db238071.py','swapped_products_db238071.py','generate_transport_db238071.py']:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),
  'main_guarded':"if __name__=='__main__'" in src,'executed_by_auditor':False})
for d in prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 inherited.append({'path':rel,'sha256':h,'sealed165_match':True,'executed_by_auditor':False,
  'role':'Current finite helper import' if Path(rel).name in ['three_probe_9e205206.py','probe_9e205206.py'] else 'Historical comparison-only identity'})
record_names=['correction-experiment.json','representation-probe.json','packed-probe.json','sparse-original.json',
 'sparse-sTx.json','proposed-gap.json','product-modules.json','direct-modules.json','swap-modules.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-db238071/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size,'current_match':True})
# Index counts only: no coefficients, binomials, residual values, gaps or signs evaluated.
c=Counter()
for q in range(2,51):
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+1;c['source_cases']+=1
  for i in range(n+6):
   c['source_comparisons']+=1
   c['known_zero_region_positions']+=i<2 or i+j>n+2
  c['raw_triples']+=len(range(n+4))
  residual_length=q+3
  for i in range(-2,residual_length+2):
   c['residual_cross_pairs']+=len(range(i,residual_length+2))
assert c=={'source_cases':98,'source_comparisons':8379,'known_zero_region_positions':3136,'raw_triples':8183,'residual_cross_pairs':64778}
for k in ['source_comparisons','raw_triples','residual_cross_pairs']:assert c[k]==data['correction-experiment.json'][k]
assert c['known_zero_region_positions']==data['correction-experiment.json']['zero_comparisons']
# Literal inventories only; polynomial values, coefficient signs, products and packed integers are not recomputed.
def leaves(x):
 if isinstance(x,int):return 1
 assert isinstance(x,list)
 return sum(leaves(y) for y in x)
literal=[]
for row in new+excluded:
 src=(A/row['path']).read_text()
 for name,encoded in re.findall(r'noncomputable def (\w+) : DenseMC9F 4 := dense_data% 4 (".*")',src):
  values=json.loads(json.loads(encoded))
  literal.append({'module':row['module'],'name':name,'leaf_count':leaves(values),
    'JSON_string_sha256':hashlib.sha256(encoded.encode()).hexdigest(),
    'decoded_literal_evaluated_mathematically':False})
assert len(literal)==53
assert len(data['product-modules.json'])==20 and len(data['direct-modules.json'])==len(data['swap-modules.json'])==16
assert leaves(data['proposed-gap.json'])==23043
sparse_counts=[]
for n in ['sparse-original.json','sparse-sTx.json']:
 d=data[n];sparse_counts.append({'record':n,'factors':len(d['factors']),'factor_terms':[len(x) for x in d['factors']],
  'products':len(d['products']),'product_terms':[len(x) for x in d['products']],'gap_terms':len(d['gap']),
  'group_lengths':[len(x) for x in d['groups']]})
for row,report in zip(sparse_counts,data['representation-probe.json']['reports']):
 assert row['factor_terms']==report['factor_terms'] and row['product_terms']==report['product_terms'] and row['gap_terms']==report['gap_terms']
 assert row['factors']==38 and row['products']==4 and row['group_lengths']==[22]*4
groups=data['sparse-original.json']['groups'];assert groups==data['sparse-sTx.json']['groups']
prior_generation=js(P/'evidence/markov-c9f23b44/dense-generation.json')
assert groups==prior_generation['groups']
old_gen_pin=next(x for x in prior['result_bindings'] if x['path']=='evidence/markov-c9f23b44/dense-generation.json')
assert sha(P/old_gen_pin['path'])==old_gen_pin['sha256']
prefix=[]
for row in new:
 src=(A/row['path']).read_text()
 if row['module'] not in v['not_replayed']:continue
 mt=re.search(r'theorem (\w+) : dmulMC9F 4 (\w+) (\w+) = (\w+) :=',src);assert mt
 name,left,right,result=mt.groups();mod=row['module'];mk=re.search(r'(Product|Direct|Swap)(\d+)S(\d+)MDB2',mod);typ,g,k=mk.groups();g=int(g);k=int(k)
 fi=groups[g][k];factor=f'df{fi}MC9F'
 if typ=='Swap':assert left==factor;previous=right
 else:assert right==factor;previous=left
 prefix.append({'module':mod,'group':g,'step':k,'factor_index':fi,'reversed':typ=='Swap',
  'literal_previous':previous,'literal_result':result,'compiled':True,'printed':True,'replayed':False})
assert {g:sorted(x['step'] for x in prefix if x['group']==g) for g in range(4)}=={0:[19,20],1:[19,20],2:[15,16],3:[15]}
events=[json.loads(line) for line in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for n in ['correction-experiment.json','packed-probe.json']:
 matches=[]
 for number,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output','')
  if item.get('exit_code')!=0:continue
  try:parsed=json.loads(out)
  except (ValueError,TypeError):continue
  if parsed==data[n]:matches.append({'event':number,'record':n,'full_JSON_stdout_matches':True,'command':item.get('command')})
 assert len(matches)==1,(n,matches);bindings+=matches
residual={'root_source_path':'research/MarkovLiftRootMFEE.lean',
 'root_source_sha256':prior['residual_binding']['root_source_sha256'],
 'root_equivalence':'Conjecture63 iff LowerHorizontalMFEE and ThreeOutsideLowerMFEE and OtherFourM9E2, unchanged.',
 'root_open':True,'all_three_residual_conjuncts_unproved':True,'new_raw_LC_region':False,
 'ReducedPairPositive_unproved':True,'ParametricPairPositive_unproved':True,'RationalPairStep_unproved':True,
 'new_first_correction_factorization':True,'correction_residual_uniform_adjacent_or_CrossLC_unproved':True,
 'new_packed_soundness_with_explicit_hypotheses':True,'actual_multivariate_packed_application_unproved':True,
 'full_products_unvalidated':True,'signed_aggregate_and_sign_test_unvalidated':True,
 'LowerClosed_source_and_root_candidates_unvalidated':True,'actual_raw_source_counterexample':False}
h={**base,'new_sources':new,'accepted_counts':dict(counts),'coverage_counts':{k:dict(x) for k,x in partitions.items()},
 'excluded_modules':excluded,'excluded_counts':dict(ec),'operational_sources':operational,
 'historical_pending_comparisons':old_pending,'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,
 'inherited_scripts':inherited,'result_bindings':records,'imported_libraries':libs,'new_imported_libraries':new_libs,
 'imported_four_functions':four,'residual_binding':residual,'all_named_new_match_current':True,
 'read_scope_notes':['Only the closed166 archive was enumerated. Current source reads are exact named counterpart comparisons.',
 'All five core modules and candidate consequence/evaluation modules read fully. Large JSON literal rows are hash-bound and counted, not mathematically evaluated.',
 'KernelRfl operational positive/negative example texts are distinct from named mathematical closures.',
 'New Nat Digits definitions and injectivity statement/body were read in named library files; no library/proof execution.']}
s={**base,'new_modules':structures,'excluded_modules':excluded_struct,'accepted_counts':dict(counts),'excluded_counts':dict(ec),
 'coverage_counts':{k:dict(x) for k,x in partitions.items()},
 'correction_factor_scope':'For all natural q,i and Boolean r with q>=2, actual threeRaw(q,r,i,q+1) equals coeff_i of X^2(1+X)^d(c+X H), where n=3q+(1 if true else2), d=q-2 or q-1 and c=8 or4. Literal raw integer coefficients, no normalization. q1 excluded; inherited classification covers actual numerator3 sources. CrossLC transport is conditional.',
 'correction_support_scope':'Residual constant c; successor coefficient equals rowH coefficient. For q>=2 it is positive exactly on integer0..q+2 and zero outside; nonnegative and interval support. CrossLC iff all integer-centered adjacent inequalities; the latter remains unproved universally.',
 'packed_scope':'Natural coefficient lists including empty lists and zeros. Evaluation and sum identities universal. Soundness requires base>1, actual convolution/proposal equal lengths, product of input sums<base, each proposal digit<base, and equality of packed naturals. Variant uses proposal sum<base. Semantic transport for all rational x. A small concrete certificate is proved. No actual four-variable flattening, carry/radix bounds, concrete candidate packed equality or actual-source bridge is proved.',
 'packed_obstruction_scope':'Formal auxiliary carry obstruction: bounded input/proposal digits and equal length plus equal packed number do not imply convolution-list equality without actual-product coefficient bounds. No Markov-source claim.',
 'dense_transport_scope':'Two general conditional semantic identities for arbitrary dimension and rational valuation; exact dense multiplication or signed-addition equality remains an explicit premise.',
 'prefix_scope':{'new_steps':prefix,'reached_steps':[20,20,16,15],'factors_including_initial':[21,21,17,16],
  'complete_target_factors':22,'source_evaluation_layers_unbuilt':True,
  'qualification':'Seven exact literal multiplication certificates compiled and printed, not successfully replayed; group3 reverses factors. No complete product/sign/source consequence inferred.'},
 'candidate_scope':'Four ProductEval files, GapData/GapClosed and LowerClosed are unbuilt. Unconditional-looking candidate statements are not results; root residual unchanged.',
 'operational_scope':'KernelRfl proposes Eq.refl terms via mkAuxLemma with async false. Positive anonymous arithmetic example compiled; deliberately false1=2 operational example rejected. No named closure/replay credit assigned to helper or false test.',
 'mathematical_values_recomputed':False}
f={**base,'correction_experiment':{'counts':dict(c),'saved_record':data['correction-experiment.json'],
 'domain':'q2..50, both residues:98 actual sources, rowq+1, coefficient starts0..n+5 and raw triples0..n+3. Residual lengthq+3; integer i from-2..q+4 and k fromi..q+4. No polygon filter; zero extensions included.',
 'qualification':'Only index counts are independently recounted.3136 known zero-region positions use i<2 or i+j>n+2. No coefficients/binomials/residuals/gaps/signs recomputed; saved empty failure list is finite evidence.'},
 'representation_experiment':{'saved_record':data['representation-probe.json'],'literal_counts':sparse_counts,
 'qualification':'Literal term-list lengths only recounted. Reported signs/degrees/substitution values remain worker computations. Negative coefficients in independent s=T+x representation are not source counterexamples.'},
 'packed_experiment':{'saved_record':data['packed-probe.json'],
 'qualification':'Four product checks and one aggregate check, recorded degrees/radices/weights/base/bounds and packed bit length/hash are finite worker results, not reproduced. No kernel certificate or multivariate bridge inferred.'},
 'generation':{'literal_data':literal,'product_modules':data['product-modules.json'],'direct_modules':data['direct-modules.json'],
 'swap_modules':data['swap-modules.json'],'gap_literal_leaf_count':leaves(data['proposed-gap.json']),
 'qualification':'JSON strings decoded only as literal lists and counted. No multiplication, summation of coefficients, sign evaluation, sparse expansion, packed integer or candidate identity recomputation.'},
 'event_bindings':bindings,'records':records,
 'runtime_limits':'Correction and packed experiments guard main. Sparse probe reads named inherited factor source at import, while its computations are main-guarded. Finish-products is guarded. Direct/swapped/transport generators have top-level work and were not imported. Inherited frame helpers retain prior guarded-main qualifications. No CAS/project program executed by auditor.',
 'mathematical_values_recomputed':False}
for suffix,obj in [('mathematical_source_hashes.json',h),('source_structure_audit.json',s),('finite_domain_audit.json',f)]:
 p=T/('markov_worker_000166_'+suffix);assert not p.exists();p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
