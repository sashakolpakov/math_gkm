"""Own closed167 static inventory, syntax comparison, hashes and domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import ast, hashlib, json, re

T=Path('/private/tmp/math_gkm_godel_20261013'); P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000167'; A=W/'artifacts'; E=A/'evidence/markov-7a344181'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
base={'worker':167,'request':'7a3441816890468e98c10c97d76927c6','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed / return0 / delivered report,1570.6689448356628 seconds. Thirteen selected modules compiled, replayed and theorem-printed. Root remains open.',
 'scope':'Closed167 archive and explicit named inherited/current counterparts only. Own operations are static parsing, hashes, literal syntax comparison and domain-index counts. No project/compiler/checker/replay/experiment/generator/finalizer execution, mathematical-value recomputation, source edits, proposer contact or research advice. Active168 and later excluded; prior seals/windows unchanged.'}
receipt=js(W/'receipt.json'); before=js(E/'before.json'); manifest=js(E/'manifest.json'); v=js(E/'validation.json')
selected=js(E/'mathematical-modules.json'); assert set(selected)==set(v['compiled'])==set(v['successfully_replayed'])
final_replay=js(E/'replay-1792199750943381000.json'); final_axioms=js(E/'axioms-1792199802004138000.json')
assert final_replay['returncode']==0 and set(final_replay['modules'])==set(selected)
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel]
 return h
pattern=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(source):
 matches=list(pattern.finditer(source));decls=[];theorems=[];defs=[]
 for index,match in enumerate(matches):
  kind,name=match.groups();end=matches[index+1].start() if index+1<len(matches) else source.rfind('\nend')
  block=source[match.start():end].strip();decls.append({'kind':kind,'name':name})
  header=block.split(':=',1)[0].rstrip() if kind!='inductive' else block.split('where',1)[0].rstrip()
  row={'name':name,'kind':kind,'header':header,'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)}
  (theorems if kind=='theorem' else defs).append(row)
 clean=re.sub(r'/\-.*?\-/','',source,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 forbidden=[word for word in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+word+r'\b',clean)]
 return decls,theorems,defs,forbidden
new=[];structures=[];extra=[];extra_struct=[];counts=Counter();extra_counts=Counter()
for module in selected+['MarkovExpressionDataM7A3']:
 rel='research/'+module+'.lean';src=(A/rel).read_text();hash_=binding(rel)
 decls,th,defs,bad=parse(src);assert not bad,(module,bad)
 attempts=[(p,d) for p,d in builds if module in d.get('modules',{})]
 successes=[(p,d) for p,d in attempts if d.get('returncode')==0 and d['modules']=={module:hash_}]
 assert len(successes)==1
 assert sha(successes[0][0].with_suffix('.lean'))==hash_
 op='evidence/markov-7a344181/'+module+'.olean';oh=binding(op)
 status='selected_replayed_printed' if module in selected else 'compiled_only_excluded_helper'
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':hash_,'declarations':decls,
  'object_path':op,'object_sha256':oh,'selected':module in selected,'replayed_in167':module in selected,
  'printed_in167':module in selected,'status':status,'successful_build':str(successes[0][0].relative_to(A)),
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],
    'matches_final_source':d['modules'][module]==hash_,'returncode':d.get('returncode'),'timeout':d.get('timeout',False)} for p,d in attempts]}
 structure={**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad}
 if module in selected:
  assert hash_==v['compiled'][module]['source_sha256']==final_replay['modules'][module]==final_axioms['sources'][module]
  assert oh==v['compiled'][module]['olean_sha256']
  assert row['successful_build']==v['compiled'][module]['receipt']
  assert all(x['name'] in final_axioms['declarations'] for x in th)
  counts.update(x['kind'] for x in decls);new.append(row);structures.append(structure)
 else:
  assert module not in final_replay['modules'] and module not in final_axioms['sources']
  extra_counts.update(x['kind'] for x in decls);extra.append(row);extra_struct.append(structure)
assert counts=={'theorem':96,'def':74,'inductive':1}
assert extra_counts=={'def':1} and len(final_axioms['declarations'])==96
prior=js(T/'markov_worker_000166_mathematical_source_hashes.json');older=[];old_pending=[];old_operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed166_sha256':h,'initial167_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'selected_recovery_in167':False})
assert len(older)==len({x['path'] for x in older})==375
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 old_pending.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],
   'selected_recovery_in167':False,'historical_absence_window_not_extended':True})
assert len(old_pending)==178
for row in prior['operational_sources']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 old_operational.append({'module':row['module'],'path':rel,'sha256':row['sha256'],
  'selected_recovery_in167':False,'scope':'Historical operational source identity only; prior positive/negative statuses unchanged.'})
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
new_libs=[]
for rel in ['Mathlib/Data/Finsupp/Basic','Mathlib/Algebra/BigOperators/Finsupp/Basic']:
 src=P/('.lake/packages/mathlib/'+rel+'.lean');obj=P/('.lake/packages/mathlib/.lake/build/lib/lean/'+rel+'.olean')
 observed=Path('/Users/sasha/collatz/Novikov_Collatz_Path_Complexes/formal/.lake/packages/mathlib')/(rel+'.lean')
 assert sha(src)==sha(observed)
 new_libs.append({'source_path':str(src),'source_sha256':sha(src),'object_path':str(obj),'object_sha256':sha(obj),
   'explicit_read_counterpart':str(observed),'scope':'Named external source/object identity only; no fresh library production or replay. Data/Finsupp mapDomain bodies read; BigOperators file import header/search only.'})
docs=[];scripts=[];inherited=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel='research/markov-7a344181-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel),'current_match':True})
for name in ['experiment_7a344181.py','correction_kernel_probe_7a344181.py','correction_lower_probe_7a344181.py',
 'weighted_correction_probe_7a344181.py','generate_expression_7a344181.py','generate_closure_7a344181.py']:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),
  'main_guarded':"if __name__=='__main__'" in src,'executed_by_auditor':False})
for row in prior['inherited_scripts']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 inherited.append({'path':rel,'sha256':h,'sealed166_match':True,'executed_by_auditor':False,
  'role':'Current finite helper import' if Path(rel).name in ['three_probe_9e205206.py','probe_9e205206.py'] else 'Historical comparison-only identity'})
record_names=['source-experiment.json','correction-kernel-probe.json','correction-lower-kernel-probe.json',
 'weighted-correction-probe.json','expression-generation.json']
data={name:js(E/name) for name in record_names}
for name in record_names:
 rel='evidence/markov-7a344181/'+name;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
old_sparse=next(row for row in prior['result_bindings'] if row['path']=='evidence/markov-db238071/sparse-original.json')
assert sha(P/old_sparse['path'])==old_sparse['sha256']
assert old_sparse['path'] not in before
old_sparse={**old_sparse,'initial167_contains_path':False,'binding_scope':'Exact current digest agrees with sealed166 result binding; not included in167 before.json. This is retained data provenance, not a proof premise.'}
sparse=js(P/old_sparse['path']);assert len(sparse['gap'])==data['expression-generation.json']['gap_terms']==20813
assert len(sparse['factors'])==data['expression-generation.json']['factors']==38
assert sparse['groups']==data['expression-generation.json']['groups']
assert [len(x) for x in sparse['groups']]==[22]*4
# Structural constructor parsing only: never evaluate the represented expressions or their coefficients.
tok=re.compile(r'\(|\)|\.(?:c|x|add|mul|pow)|[0-9]+|(?:ef|eg)[0-9]+M7A3')
def parse_expr(text):
 tokens=tok.findall(text);assert ''.join(tokens)==re.sub(r'\s','',text)
 cursor=0;counter=Counter();refs=[]
 def go():
  nonlocal cursor
  t=tokens[cursor];cursor+=1
  if t!='(':
   assert re.fullmatch(r'(?:ef|eg)[0-9]+M7A3',t);counter['reference']+=1;refs.append(t);return ('ref',t)
  op=tokens[cursor];cursor+=1;counter[op]+=1
  if op in ['.c','.x']:
   value=tokens[cursor];cursor+=1;assert value.isdecimal()
   if op=='.x':assert value in ['0','1','2','3']
   node=(op[1:],value)
  elif op in ['.add','.mul']:
   node=(op[1:],go(),go())
  else:
   assert op=='.pow';child=go();value=tokens[cursor];cursor+=1;assert value.isdecimal();node=('pow',child,value)
  assert tokens[cursor]==')';cursor+=1;return node
 tree=go();assert cursor==len(tokens)
 return tree,dict(counter),refs
factors=(A/'research/MarkovExpressionFactorsM7A3.lean').read_text()
old_factor=Path('/Users/sasha/math_gkm/.control/markov/workers/000164/artifacts/research/MarkovFactorBridgeMAD5.lean').read_text()
old_factor_pin=next(row for row in older if row['module']=='MarkovFactorBridgeMAD5')
assert hashlib.sha256(old_factor.encode()).hexdigest()==old_factor_pin['sha256']
def old_expr(node):
 if isinstance(node,ast.Constant):assert isinstance(node.value,int);return ('c',str(node.value))
 if isinstance(node,ast.Name):return ('x',{'x':'0','g':'1','z':'2','T':'3'}[node.id])
 assert isinstance(node,ast.BinOp)
 if isinstance(node.op,ast.Pow):assert isinstance(node.right,ast.Constant);return ('pow',old_expr(node.left),str(node.right.value))
 assert isinstance(node.op,(ast.Add,ast.Mult));return ('add' if isinstance(node.op,ast.Add) else 'mul',old_expr(node.left),old_expr(node.right))
old_factors=dict(re.findall(r'^def pf(\d+)MAD5 .*? := (.*)$',old_factor,re.M))
constructor_rows=[]
for index,body in re.findall(r'^def ef(\d+)M7A3 : NExprM7A3 := (.*)$',factors,re.M):
 tree,cs,refs=parse_expr(body);assert not refs
 assert tree==old_expr(ast.parse(old_factors[index].replace('^','**'),mode='eval').body)
 constructor_rows.append({'name':'ef'+index+'M7A3','syntax_counts':cs,'matches_inherited_factor_syntax':True,
  'body_sha256':hashlib.sha256(body.encode()).hexdigest()})
assert len(constructor_rows)==38
product_rows=[]
for index,body in re.findall(r'^def ep(\d+)M7A3 : NExprM7A3 := (.*)$',factors,re.M):
 tree,cs,refs=parse_expr(body);group=sparse['groups'][int(index)]
 assert refs==['ef'+str(k)+'M7A3' for k in group]
 assert cs=={'.mul':21,'reference':22}
 product_rows.append({'name':'ep'+index+'M7A3','factor_indices':group,'syntax_counts':cs,
  'body_sha256':hashlib.sha256(body.encode()).hexdigest()})
assert len(product_rows)==4
gap=(A/'research/MarkovExpressionGapM7A3.lean').read_text();gap_rows=[]
for name,body in re.findall(r'^def (\w+) : NExprM7A3 := (.*)$',gap,re.M):
 tree,cs,refs=parse_expr(body)
 if name=='gapExprM7A3':assert refs==['eg'+str(k)+'M7A3' for k in range(19)]
 else:assert not refs
 gap_rows.append({'name':name,'body_sha256':hashlib.sha256(body.encode()).hexdigest(),
  'body_characters':len(body),'syntax_counts':cs,'references':refs,'represented_values_evaluated':False})
assert len(gap_rows)==20
# Recount finite domains only; never call project functions or calculate coefficients, gaps or signs.
c=Counter()
for q in range(1,33):
 for r in [False,True]:
  n=3*q+(1 if r else 2);c['source_cases']+=1
  for j in range(q+1):
   c['source_rows']+=1
   for i in range(n+7):
    c['source_coefficients']+=1;c['known_zero_region_positions']+=i<3 or i+j>n+2
   for i in range(n+5):
    c['lower_triples']+=1
    c['polygon_triples']+=all(3*n<=n*k+3*j and k+j<=n+2 for k in [i,i+1,i+2])
assert {k:c[k] for k in ['source_coefficients','lower_triples','polygon_triples']}=={
 k:data['source-experiment.json'][k] for k in ['source_coefficients','lower_triples','polygon_triples']}
assert c['known_zero_region_positions']==data['source-experiment.json']['zero_coefficients']==19808
aux=Counter()
for _constant in [4,8]:
 for j in range(3,31):
  for t in range(36):
   aux['parameter_cases']+=1
   for h in range(t+4):
    aux['cuts']+=1
    lengths=[min(k+1,h+1) for k in [t,t+1,t+2]]
    aux['upper_cut_coefficient_slots']+=max(lengths[0]+lengths[2]-1,2*lengths[1]-1)
    aux['lower_cut_coefficient_slots']+=2*t+3
assert aux['upper_cut_coefficient_slots']==data['correction-kernel-probe.json']['cut_coefficients']==1137360
assert aux['lower_cut_coefficient_slots']==data['correction-lower-kernel-probe.json']['cut_coefficients']==2082192
weighted=Counter()
for d in range(51):
 for j in range(3,31):
  for _constant in [4,8]:
   weighted['parameter_cases']+=1
   for t in range(d+j+5):
    weighted['triples']+=1
    weighted['support_zero_containing_triples']+=any(k<2 or d+j+3<k for k in [t,t+1,t+2])
assert weighted['triples']==data['weighted-correction-probe.json']['triples']==132804
assert weighted['support_zero_containing_triples']==data['weighted-correction-probe.json']['zeros']==14280
# Bind retained finite stdout; the two cut probes intentionally print only the first three saved failures.
events=[json.loads(line) for line in (W/'events.jsonl').read_text().splitlines()];event_bindings=[]
for name in record_names[:4]:
 expected=dict(data[name]);truncated=name in ['correction-kernel-probe.json','correction-lower-kernel-probe.json']
 if truncated:expected['failures']=expected['failures'][:3]
 hits=[]
 for number,event in enumerate(events,1):
  item=event.get('item',{})
  if item.get('exit_code')!=0:continue
  try:parsed=json.loads(item.get('aggregated_output',''))
  except (ValueError,TypeError):continue
  if parsed==expected:hits.append({'event':number,'record':name,'first_three_failure_rows_only':truncated,'matches':True})
 assert len(hits)==1,(name,hits);event_bindings+=hits
residual={'root_open':True,'new_raw_LC_region':True,'LowerHorizontalMFEE_proved':True,
 'ReducedPairPositiveMAD5_proved':True,'ParametricPairPositiveMAD5_proved_via_inherited_equivalence':True,
 'RationalPairStepMAD5_proved':True,'actual_multivariate_packed_certificate_proved':True,
 'root_equivalence':'Conjecture63 iff ThreeOutsideLowerMFEE and OtherFourM9E2.',
 'root_equivalence_source':'research/MarkovLowerClosedM7A3.lean',
 'root_equivalence_source_sha256':next(row['sha256'] for row in new if row['module']=='MarkovLowerClosedM7A3'),
 'inherited_residual_source':'research/MarkovLiftRootMFEE.lean',
 'inherited_residual_source_sha256':next(row['sha256'] for row in older if row['module']=='MarkovLiftRootMFEE'),
 'both_residual_conjuncts_unproved':True,'LowerRowShapeMFFD_unproved':True,
 'first_correction_row_LC_unproved':True,'actual_raw_source_counterexample':False,
 'old166_prefix_recovery_claimed':False,'old212_recovery_claimed':False}
receipt_observations=[
 {'observed_utc':'2026-10-17T01:14:14.994963+00:00','status':'absent'},
 {'observed_utc':'2026-10-17T01:15:38.003497+00:00','status':'absent','since_prior_seconds':83.008534},
 {'observed_utc':'2026-10-17T01:17:06.430568+00:00','status':'absent','since_prior_seconds':88.427071},
 {'observed_utc':'2026-10-17T01:18:23.821091+00:00','status':'absent','since_prior_seconds':77.390523},
 {'observed_utc':'2026-10-17T01:19:47.565212+00:00','status':'final','since_prior_seconds':83.744121}]
waiting={'receipt_only_checks':receipt_observations,'requested_wait_ms':58000,
 'completed_wait_seconds':[58.0071,58.0297,58.0081,58.0073],
 'interrupted_wait_seconds':1.6093,'all_receipt_intervals_over60_seconds':True,
 'all_individual_waits_under59_seconds':True,'closure_before_cutoff':'2026-10-17T01:32:50+00:00',
 'correction':'Parent was initially told five absent checks, immediately corrected to four absent checks and the fifth observation final. No receipt was read early.'}
h={**base,'new_sources':new,'accepted_counts':dict(counts),'excluded_modules':extra,'excluded_counts':dict(extra_counts),
 'historical_pending_comparisons':old_pending,'historical_operational_comparisons':old_operational,
 'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited,
 'result_bindings':records,'inherited_sparse_binding':old_sparse,'imported_libraries':libs,
 'new_imported_libraries':new_libs,'imported_four_functions':four,'residual_binding':residual,
 'receipt_waiting':waiting,'all_named_new_match_current':True,
 'read_scope_notes':['Only the closed167 archive was enumerated; current counterparts are explicit named reads.',
 'All selected theorem bodies and the extra compiled data helper were read. Large gap constructor data are lexically parsed and hash-bound, not evaluated.',
 'Exact named archived KernelStepMAD5 and LowerLiftMAE9 were absent; correct names obtained from prior sealed inventory, with no broad project search.',
 'External search bounded to Mathlib/Data/Finsupp; returned only Basic.lean. BigOperators/Finsupp/Basic exact-name search had no match; its import header was read. Data/Finsupp/Basic contains the to_additive-generated sum theorem and support-injective mapDomain body.',
 'No old theorem is re-proved or old audit backdated. Source/byte identities retain compiled-import trust.']}
s={**base,'new_modules':structures,'excluded_modules':extra_struct,'accepted_counts':dict(counts),'excluded_counts':dict(extra_counts),
 'packed_scope':'For natural polynomials, base>1, both masses at1<base, and equality at base imply polynomial equality. Common max-degree+1 list padding keeps zeros, including zero polynomial. No nonzero-polynomial hypothesis.',
 'flatten_scope':'Generic arbitrary encoding requires injectivity on a common set containing both supports. Flattening sums collisions; evaluation/mass lemmas use additive mapDomain. Four weights[1,23,460,5980], bounds e0<23,e1<20,e2<13, no e3 bound. Explicit overflow obstruction outside box.',
 'expression_scope':'Positive expression language constants/natural powers/add/mul; rational interpretation and compositional degree bound proved. Degree and both mass checks and packed equality are explicit accepted decide+kernel theorems. Semantic equality for arbitrary rational valuations; nonnegativity only for nonnegative valuations.',
 'literal_syntax_audit':{'factors':constructor_rows,'products':product_rows,'gap_definitions':gap_rows,
   'scope':'Syntax only; numeric literals compared as tokens, factor references checked in order. No polynomial expansion, expression evaluation, degree/mass/packed arithmetic or sign recomputation.'},
 'source_scope':'All actual paths with mid.a=3, all natural i,j,3*j<=mid.b. Exact raw i,i+1,i+2 at fixed j; zeros kept. Classification q>=1,b=3q+1 or3q+2; j<=q. No ratio/denominator bound or remaining sign/formula premise. Rational normalization stays auxiliary; source coefficients remain literal integers.',
 'zero_boundary_scope':'Inherited source transfer splits i<3 before factor transport and handles leading zeros without division; i>=3 maps t=i-3. All d,j,t lift outputs have LC, including d0/j0 and tails. Support proof includes negative integer indices and exact upper tail.',
 'smoothed_cross_scope':'All n,j natural with2*j+1<=n: CrossLC of coefficient sequence of lowerRow=X^3(1+X)^(n-2*j-1)rowH. Output sequence positive on0..d+j, zero outside; shift3 exact. Does not establish CrossLC for unsmoothed rowH or LowerRowShapeMFFD.',
 'correction_scope':'For q>=2,source columnt+2,rowq+1 equals augmentedOutput(d,j,c)t; t0=c, successor=liftOutput(d,j,t)+c*choose(d,t+1). Iff is only adjacent source starts>=2; q1 excluded. Universal augmented-output LC unproved.',
 'obstruction_scope':'Augmented coefficientwise universal sign statement false atj3,t1,c4,coefficient3=-40. Associated actual path[false,true,false],3/8,rawH triple[108,412,636] atcolumns3,4,5,row3 has three polygon guards and positive gap101056. Auxiliary failure is not raw/root refutation.',
 'root_residual_scope':'ThreeOutsideLower: allq>=1,bothr; H q<j andj!=5; V outside((i3or4 andj+1<=q)or(5<=i<=8 andj+2<=q)); D outside(3<=i<=6 andj+2<=q), original natural indices/zeros. OtherFour:everypath witha>=4,GlobalLC. Full Conjecture63 endpoints and allthree polygon guards retained by inherited exact equivalences; two residuals remain open.',
 'extra_helper_scope':'ExpressionData compiled but not selected/replayed/printed or imported by final chain; final Gap uses ordinary constructor syntax. No helper proof credit.',
 'mathematical_values_recomputed':False}
f={**base,'source_experiment':{'counts':dict(c),'saved_record':data['source-experiment.json'],
 'domain':'64 cases:q1..32,bothr; rowsj0..q; columns0..n+6;triple starts0..n+4; separate original polygon guards.',
 'qualification':'Only index/domain counts. Known zero regions i<3 or i+j>n+2 counted without coefficient values. No source recurrence or formula evaluated.'},
 'cut_probes':{'counts':dict(aux),'upper_saved_record':data['correction-kernel-probe.json'],
 'lower_saved_record':data['correction-lower-kernel-probe.json'],
 'domain':'c4/8,j3..30,t0..35,h0..t+3. Upper truncates toindices<=h, lower zeroesindices<h while retaining lengths. All coefficient slots counted, even trailing zeros. Saved arrays cap first30 failures, stdoutfirst3; not total failure counts.'},
 'weighted_probe':{'counts':dict(weighted),'saved_record':data['weighted-correction-probe.json'],
 'domain':'d0..50,j3..30,c4/8;shifted list[0,0,c,...] lengthd+j+7; starts0..d+j+4. Zero-region count fromsupport2..d+j+3, not value computation.',
 'qualification':'Auxiliary finite parameter domain broader than actual correction-source parameters. It does not prove universal correction LC.'},
 'generation':{'saved_record':data['expression-generation.json'],'inherited_sparse_binding':old_sparse,
 'sparse_gap_literal_term_count':len(sparse['gap']),'factor_count':len(constructor_rows),'product_groups':product_rows,
 'gap_constructor_definition_count':len(gap_rows),'gap_constructor_counts':[{'name':row['name'],'syntax_counts':row['syntax_counts']} for row in gap_rows],
 'qualification':'Retained sparse term-list count20813 and syntax only. No recomputation of positivity, coefficients, Horner values, degree bounds, mass, packed integer or polynomial product.'},
 'event_bindings':event_bindings,'records':records,
 'runtime_limits':'Four experiments main-guarded; two generators perform top-level reads/writes and were never imported. Source experiment imports the previously audited frame helpers with inherited guarded-main limits. No project or CAS computation by auditor.',
 'mathematical_values_recomputed':False}
for suffix,obj in [('mathematical_source_hashes.json',h),('source_structure_audit.json',s),('finite_domain_audit.json',f)]:
 p=T/('markov_worker_000167_'+suffix);assert not p.exists();p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
