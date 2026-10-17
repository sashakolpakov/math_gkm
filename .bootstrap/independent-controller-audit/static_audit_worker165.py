"""Audit-owned static source/hash/literal/domain inspection; no project code or mathematical values executed."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import ast, hashlib, json, re

T=Path('/private/tmp/math_gkm_godel_20261013'); P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000165'; A=W/'artifacts'; E=A/'evidence/markov-c9f23b44'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
base={'worker':165,'request':'c9f23b44907d4f9aa7cfc15e4a2c4b47','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed / return0 / delivered report; host elapsed1858.195433139801 seconds; full root unresolved.',
 'scope':'Closed165 archive and explicitly named inherited/current counterparts only. Static parsing, hashes, literal list inventories and index/domain counts. No project/compiler/proof/checker/replay/generator/experiment/finalizer execution, mathematical-value recomputation, source edits, proposer contact or research assistance. Active/later workers unexamined; earlier seals/windows unchanged.'}
before=js(E/'before.json'); receipt=js(W/'receipt.json'); v=js(E/'validation.json'); manifest=js(E/'manifest.json')
sel=v['modules']; rep=js(A/v['joint_replay']); axi=js(A/v['axiom_audit'])
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
decl_re=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance)\s+(\w+)')
def parse(src):
 matches=list(decl_re.finditer(src)); ds=[]; statements=[]; definitions=[]
 for k,x in enumerate(matches):
  kind,name=x.groups(); end=matches[k+1].start() if k+1<len(matches) else src.rfind('\nend')
  block=src[x.start():end].strip(); ds.append({'kind':kind,'name':name})
  if kind=='theorem':
   statement=block.split(':=',1)[0].rstrip(); assert ':=' in block
   statements.append({'name':name,'statement':statement,'block_sha256':hashlib.sha256(block.encode()).hexdigest()})
  else:
   definitions.append({'name':name,'kind':kind,'header':block.split(':=',1)[0].rstrip(),
    'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)})
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S); clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return ds,statements,definitions,bad
def named_sources():
 for rel in sorted(receipt['changes']):
  if rel.startswith('research/Markov') and rel.endswith('MC9F.lean') and not Path(rel).stem.startswith('MarkovAudit'):
   yield rel
new=[]; mods=[]; excluded=[]; excluded_struct=[]; counts=Counter(); ec=Counter(); groups={}; omissions={}
for rel in named_sources():
 m=Path(rel).stem; src=(A/rel).read_text(); h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel]
 ds,statements,definitions,bad=parse(src); assert not bad,(m,bad)
 attempts=[(p,d) for p,d in builds if m in d.get('modules',{})]
 matching=[(p,d) for p,d in attempts if d['modules']=={m:h}]
 successful=[(p,d) for p,d in matching if d.get('returncode')==0]
 for p,d in matching: assert sha(p.with_suffix('.lean'))==h
 op='evidence/markov-c9f23b44/'+m+'.olean'; ao=(A/op).exists(); co=(P/op).exists(); assert ao==co
 oh=sha(A/op) if ao else None
 if ao: assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]
 row={'module':m,'path':rel,'bytes':len(src.encode()),'characters':len(src),'sha256':h,
  'declarations':ds,'object_path':op,'object_sha256':oh,'archive_object_present':ao,
  'current_object_present_at_initial_observation':co,'selected':m in sel,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][m],'matches_final_source':d['modules'][m]==h,
    'returncode':d.get('returncode'),'timeout':d.get('timeout',False)} for p,d in attempts]}
 structure={**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':statements,'definition_bindings':definitions,'forbidden_tokens':bad,
  'large_literal_data_preserved_by_hash_not_evaluated':True}
 if m in sel:
  assert h==v['source_sha256'][m]==rep['modules'][m]==axi['sources'][m]
  assert successful and ao and oh==v['compiled_sha256'][m]
  assert any(str(p.relative_to(A))==v['successful_builds'][m] for p,d in successful)
  named=[d['name'] for d in ds]; explicit=rep['declared_names'][m]
  assert set(explicit)<=set(named)
  if set(named)!=set(explicit): omissions[m]=sorted(set(named)-set(explicit))
  assert all(d['name'] in axi['declarations'] for d in ds if d['kind']=='theorem')
  row['status']='Final source compiled, jointly replayed and all theorem closures printed in165.'
  structure['status']=row['status']; counts.update(d['kind'] for d in ds); new.append(row); mods.append(structure)
 else:
  if successful: status='compiled_only_excluded'
  elif attempts and all(d.get('timeout',False) for p,d in attempts): status='timed_out_excluded'
  elif attempts: status='rejected_only_excluded'
  else: status='unattempted_excluded'
  assert ao==bool(successful),(m,status,ao)
  row['status']=structure['status']=status; row['replayed_in165']=False; row['printed_in165']=False
  ec.update(d['kind'] for d in ds); groups.setdefault(status,Counter()).update(d['kind'] for d in ds)
  excluded.append(row); excluded_struct.append(structure)
assert len(new)==31 and counts=={'theorem':180,'def':116,'instance':1}
assert len(excluded)==91 and Counter(x['status'] for x in excluded)=={
 'compiled_only_excluded':2,'timed_out_excluded':8,'rejected_only_excluded':1,'unattempted_excluded':80}
assert len(axi['declarations'])==180 and rep['returncode']==0 and v['joint_replay_passed'] is True
assert sum(len(x) for x in omissions.values())==6
prior=js(T/'markov_worker_000164_mathematical_source_hashes.json'); older=[]; old_pending=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path']; h=sha(P/rel); assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'sealed164_sha256':h,'initial165_sha256':h,
  'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in165':False})
assert len(older)==len({x['path'] for x in older})==332
for d in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=d['path']; h=sha(P/rel); assert h==before[rel]==d['sha256']
 old_pending.append({'module':d['module'],'path':rel,'sha256':h,'status':d['status'],
  'selected_recovery_in165':False,'historical_absence_window_not_extended':True})
assert len(old_pending)==35
libs=prior['imported_libraries']; four=prior['imported_four_functions']
for d in libs+[four]: assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[]; scripts=[]; inherited=[]; records=[]
for tag in ['checkpoint','correspondence','method','next','operational']:
 rel=f'research/markov-c9f23b44-{tag}.md'; h=sha(A/rel); assert h==sha(P/rel)==manifest[rel]
 docs.append({'path':rel,'sha256':h,'current_match':True})
for name in ['source_experiment_c9f23b44.py','correction_probe_c9f23b44.py','generate_dense_c9f23b44.py',
             'batch_dense_c9f23b44.py','boolean_batches_c9f23b44.py','data_batches_c9f23b44.py']:
 rel='research/'+name; h=sha(A/rel); assert h==sha(P/rel)==manifest[rel]
 scripts.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,
  'main_guarded':"if __name__=='__main__'" in (A/rel).read_text(),'executed_by_auditor':False})
for d in prior['inherited_scripts']:
 rel=d['path']; h=sha(P/rel); assert h==before[rel]==d['sha256']
 inherited.append({'path':rel,'sha256':h,'sealed164_match':True,'executed_by_auditor':False,
  'role':'Current finite helper import' if Path(rel).name in ['three_probe_9e205206.py','probe_9e205206.py'] else 'Historical comparison-only identity'})
record_names=['source-experiments.json','correction-probe.json','dense-generation.json','scope-freeze.json']
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-c9f23b44/'+n; h=sha(A/rel); assert h==sha(P/rel)==manifest[rel]
 records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(line) for line in (W/'events.jsonl').read_text().splitlines()]; bindings=[]
for number,name in [(83,'source-experiments.json'),(112,'correction-probe.json')]:
 item=events[number-1]['item']; assert item['exit_code']==0 and json.loads(item['aggregated_output'])==data[name]
 bindings.append({'event':number,'record':name,'full_JSON_stdout_matches':True,'command':item['command']})
# Index enumeration only. Zero positions use inherited leading-column/total-degree bounds,
# not computed coefficient values, candidate formulas or binomial evaluation.
c=Counter()
for q in range(1,46):
 for r in [False,True]:
  n=3*q+(1 if r else 2); c['sources']+=1
  for j in range(q+1):
   for i in range(n+6):
    c['coefficients']+=1; c['horizontal_triples']+=1
    c['polygon_triples']+=3*n<=n*i+3*j and i+2+j<=n+2
    c['known_zero_region_positions']+=i<3 or i+j>n+2
c['mixed_triples']=sum(3*q+(1 if r else 2)+5 for q in range(2,101) for r in [False,True])
for k in ['sources','coefficients','horizontal_triples','polygon_triples']: assert c[k]==data['source-experiments.json'][k]
assert c['known_zero_region_positions']==data['source-experiments.json']['zeros']==45390
assert c['mixed_triples']==data['correction-probe.json']['mixed_triples']==31581
# Compare literal factor index chains only; never multiply/evaluate factors or data.
factor_rel='research/MarkovFactorBridgeMAD5.lean'; factor_src=(P/factor_rel).read_text()
assert sha(P/factor_rel)==next(d['sha256'] for d in older if d['path']==factor_rel)
body=factor_src.split('def pairReducedMAD5',1)[1].split('def pairPrefactorMAD5',1)[0]
factor_groups=[[int(x) for x in re.findall(r'pf(\d+)MAD5',z)] for z in re.findall(r'\((pf[^()]*)\)',body)]
assert factor_groups==data['dense-generation.json']['groups'] and [len(g) for g in factor_groups]==[22]*4
prefix=[]
for m in sel:
 src=(A/'research'/f'{m}.lean').read_text()
 for g,k,left,right in re.findall(r'theorem dp(\d+)s(\d+)MC9F_eqMC9F : dmulMC9F 4 (\w+) df(\d+)MC9F',src):
  g=int(g); k=int(k); right=int(right)
  assert right==factor_groups[g][k]
  assert left==(f'df{factor_groups[g][0]}MC9F' if k==1 else f'dp{g}s{k-1}MC9F')
  prefix.append({'module':m,'group':g,'multiplication':k,'left':left,'factor_index':right})
assert len(prefix)==64
assert {g:sorted(x['multiplication'] for x in prefix if x['group']==g) for g in range(4)}=={
 0:list(range(1,19)),1:list(range(1,19)),2:list(range(1,15)),3:list(range(1,15))}
# Literal nested-list leaf counts only: no leaf arithmetic, sign test or equality computation.
def leaves(x):
 if isinstance(x,int): return 1
 assert isinstance(x,list)
 return sum(leaves(y) for y in x)
literal_sizes=[]
for row in data['dense-generation.json']['steps']:
 src=(A/'research'/(row['module']+'.lean')).read_text()
 match=re.search(r'(?:noncomputable )?def dp\w+ : DenseMC9F 4 := (\[.*\])',src); assert match
 literal=ast.literal_eval(match[1]); count=leaves(literal); assert count==row['leaves']
 normalized=src.replace('noncomputable def ','def '); assert normalized.endswith('end MathGKM.Markov\n')
 assert len(normalized[:-len('end MathGKM.Markov\n')])==row['bytes']
 literal_sizes.append({'module':row['module'],'literal_leaf_count':count,'generation_characters_without_footer':row['bytes'],
  'final_characters':len(src),'final_UTF8_bytes':len(src.encode()),'noncomputable_modifier_present':'noncomputable def ' in src})
assert len(literal_sizes)==84
gap_src=(A/'research/MarkovDenseGapMC9F.lean').read_text()
gap_rhs=re.search(r'noncomputable def denseGapMC9F : DenseMC9F 4 := (.+)',gap_src)[1]
if gap_rhs.startswith('dense_data% 4 '): gap_rhs=json.loads(gap_rhs[len('dense_data% 4 '):])
gap_leaves=leaves(ast.literal_eval(gap_rhs)); assert gap_leaves==data['dense-generation.json']['gap_leaves']==23043
for number in [48,64]:
 item=events[number-1]['item']; out=json.loads(item['aggregated_output']); assert item['exit_code']==0
 assert out=={'steps':84,'max_leaves':max(x['literal_leaf_count'] for x in literal_sizes),'gap_leaves':gap_leaves,
              'max_bytes':max(x['generation_characters_without_footer'] for x in literal_sizes)}
 bindings.append({'event':number,'record':'dense-generation.json','printed_metadata_matches':True,
  'qualification':'Two generation invocations have matching literal metadata; this does not assert identical first-generation mathematical values or successful checks.'})
residual={'root_source_path':'research/MarkovLiftRootMFEE.lean',
 'root_source_sha256':next(x['sha256'] for x in older if x['module']=='MarkovLiftRootMFEE'),
 'root_equivalence':'Conjecture63 iff LowerHorizontalMFEE and ThreeOutsideLowerMFEE and OtherFourM9E2, unchanged.',
 'root_open':True,'all_three_residual_conjuncts_unproved':True,'new_raw_LC_region':False,
 'ReducedPairPositive_unproved':True,'ParametricPairPositive_unproved':True,'RationalPairStep_unproved':True,
 'new_general_dense_evaluator_and_Boolean_soundness':True,'full_products_unvalidated':True,
 'signed_aggregate_and_sign_test_unvalidated':True,'LowerClosed_source_and_root_candidates_unvalidated':True,
 'actual_source_auxiliary_mixed_gap_obstruction_proved':True,'actual_raw_source_counterexample':False}
math={**base,'new_sources':new,'accepted_counts':dict(counts),'excluded_modules':excluded,'excluded_counts':dict(ec),
 'excluded_group_counts':{k:dict(x) for k,x in groups.items()},'historical_pending_comparisons':old_pending,
 'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited,
 'result_bindings':records,'imported_libraries':libs,'imported_four_functions':four,'residual_binding':residual,
 'replay_regex_omissions':omissions,'all_named_new_match_current':True,
 'read_scope_notes':[
  'All selected generic bodies and every selected product theorem/proof template read; large literal coefficient lists hash-bound and only list structure counted, not evaluated.',
  'All archived candidate declaration inventories/imports/status bindings inspected; DenseGap, LowerClosed, profiler and rfl diagnostic text read. No pending candidate promoted.',
  'Five worker prose notes, six new finite/generator scripts and two explicitly named inherited finite helper bodies read as text, never imported.',
  'Explicit inherited FirstCorrectionPolynomialMAE9, FirstRowM1BB, ThreeSourceM9E2, ThreeRawM9E2 source correspondence bodies read; inherited FactorBridge literal factor-index groups compared.',
  'Before closure only the exact receipt was read:13 absent checks and final14th at00:20:47.963291 UTC. All receipt intervals at least60 seconds. Requested waits at most60 seconds; one60000ms wait returned60.0082 seconds scheduler overhead, then59000ms waits used.',
  'Parent storage2350 operation concerns closed154–163 copies only, content preserved; local record e6e9269c9b6f36478c2b13871190a5ba7cb7f302. No165 source/artifact mutation or validation upgrade inferred.']}
structure={**base,'new_modules':mods,'excluded_modules':excluded_struct,'accepted_counts':dict(counts),'excluded_counts':dict(ec),
 'dense_evaluator_scope':'Recursive Dense(n): integer leaves at0, finite ascending-power lists at successors. Horner evaluation into rationals, arbitrary valuation. Addition preserves unequal lengths; multiplication has empty/singleton/general branches; zeros and trailing zeros retained. Eight general evaluation/nonnegativity laws. Nonnegativity requires every variable nonnegative and Boolean leaf test true; no sign conclusion from definitions alone.',
 'boolean_scope':'Generic list Boolean comparator soundness assumes sound element comparator; recursive Dense comparator soundness proved for every dimension. Concrete equalities still require a true kernel computation. Not a positivity oracle.',
 'data_elaboration_scope':'Two functions recursively construct ordinary Int/List Expr from parsed JSON and a term elaborator invokes them. Data construction itself proves no equality/sign theorem. Generic soundness and ordinary compiler/kernel trust retained; generated/private elaborator constants not separately inventoried as explicit mathematical closures.',
 'factor_scope':'38 all-rational evaluation identities identify four-variable integer coefficient lists with inherited pf0..pf37. Variable order x,g,z,T is explicit. No source normalization or reduced-sign assertion.',
 'prefix_scope':{'literal_factor_groups':factor_groups,'selected_steps':prefix,'multiplication_counts':[18,18,14,14],
  'factors_including_initial':[19,19,15,15],'complete_products_need_factors':[22,22,22,22],
  'qualification':'64 exact multiplication equalities and64 evaluator identities. No complete product or signed aggregate follows merely from these prefixes. Data/Boolean alternatives and duplicate standalone versions remain separately classified.'},
 'obstruction_scope':'Actual q2,rfalse source3/8, path[false,true,false], first correction rowj3, literal horizontal columns2,3,4. Raw[4,108,412], lower[0,104,412], correction[4,4,0], mixed gap -816. Four accepted closures establish exact values, decomposition, negative auxiliary mixed gap, all three polygon memberships and strict raw LC. No source or root counterexample; q1 exceptional correction not generalized away.',
 'candidate_scope':'DenseGap contains five unvalidated theorem texts: signed aggregate equality, Boolean sign test, evaluation identity, nonnegative rational expression, natural ReducedPairPositive. LowerClosed contains ten unvalidated theorem texts including unconditional all-natural lower-row source inequalities and smaller root iff. The q0 family extension in its source statement is only candidate text; actual path classification requires q>=1. Current root remains inherited MFEE.',
 'source_scope':'Inherited classification covers every a3 path as q>=1 and denominator3q+(1 if r else2); coefficient representation includes all natural i,j and outside-support zeros. Accepted obstruction is one actual path. Conditional lower-row transport from164 retains raw(i,j),(i+1,j),(i+2,j), all natural starts and both residues; its positivity premise is still open.',
 'mathematical_values_recomputed':False}
finite={**base,'source_experiments':{'counts':dict(c),'saved_record':data['source-experiments.json'],
 'domain':'q1..45, both residues, rowsj0..q, starts i0..n+5 withn=3q+(1 if r else2). One coefficient comparison and one rawH triple per start; polygon subset uses exact original linear guards.',
 'qualification':'210780 coefficient comparisons and210780 horizontal triples are separate counts, not one combined total.45390 positions in inherited leading/total-degree zero regions match reported zeros; no coefficient/nonzero/sign evaluation. No universal-source inference is made.',
 'rational_domain':'10000 seeded draws: j2..1000,t1..1000,n0..j-2,mn+2..j before endpoint overrides; everyfourth draw setsn0 or m=j. Reported5158 endpoint pairs is retained only: RNG and rational expressions not rerun; uniqueness/exhaustiveness not established.'},
 'correction_probe':{'domain':'q2..100,bothresidues,j=q+1,starts i0..n+4. No polygon filter and no q1 exceptional-source scan.',
 'domain_count':c['mixed_triples'],'saved_record':data['correction-probe.json'],
 'qualification':'9999 negative mixed gaps and empty sum-LC failure list are saved finite values only, not recomputed. First witness separately formally source-bound. binomial_ratio_failures is initialized but never populated or tested by this script, so its empty list is not ratio evidence.'},
 'generation':{'saved_metadata':data['dense-generation.json'],'literal_leaf_bindings':literal_sizes,'gap_literal_leaf_count':gap_leaves,
 'qualification':'Only literal nested-list leaves, index chains and string lengths counted. Generation bytes field is Python string length excluding end footer; final UTF8 bytes/modifier edits are separate. No polynomial multiplication, factorization, coefficient sign test or gap evaluation performed.'},
 'event_bindings':bindings,'records':records,
 'runtime_limits':'Source experiment main is guarded; correction probe and four generator programs run at top-level if imported and were not imported. Source experiment imports three_probe_9e205206, which imports probe_9e205206; inherited helper constants perform worker-side arithmetic on import. No project module was imported by auditor. No RNG reproduction or CAS use by auditor.',
 'mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',structure),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000165_'+suffix); assert not p.exists(); p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
 print(suffix,p.stat().st_size,sha(p))
print('accepted',dict(counts),'excluded',dict(ec),'groups',{k:dict(x) for k,x in groups.items()},'domaincounts',dict(c))
