"""Static saved-text/hash audit and input-index counts only. No project imports."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import json, hashlib, re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000158';A=W/'artifacts';E=A/'evidence/markov-ffd747f5'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
base={'worker':158,'request':'ffd747f5c7a147069d5bfcaffb3e60e8','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed / return 0 / delivered report. Full root open; worker156 historical timeout unchanged.',
 'scope':'Closed158 archive and explicit named inherited/current counterparts only. Static parsing, hashes and input-index counts; no project/proof/checker/replay/experiment/finalizer/generator execution or mathematical-value computation. No project edits, proposer contact or research help. Active159 excluded; earlier seals final.'}
before=js(E/'before.json');receipt=js(W/'receipt.json');v=js(E/'validation.json');manifest=js(E/'manifest.json');selection=js(E/'mathematical-modules.json')
assert receipt['outcome']=='completed' and receipt['report'] is not None
replay=js(A/v['replay_receipt']);axioms=js(A/v['axioms_receipt'])
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
counts=Counter();new=[];mods=[]
for module in selection:
 rel='research/'+module+'.lean';src=(A/rel).read_text();h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['sources'][module]==replay['modules'][module]==axioms['sources'][module]==manifest[rel]
 matched=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules'].get(module)==h]
 assert len(matched)==1
 bp,bd=matched[0];assert sha(bp.with_suffix('.lean'))==h and str(bp.relative_to(A)) in v['build_receipts']
 op='evidence/markov-ffd747f5/'+module+'.olean';oh=sha(A/op)
 assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]
 matches=list(re.finditer(r'(?m)^(theorem|def|abbrev)\s+(\w+)',src));decl=[];statements=[];defs=[]
 for k,x in enumerate(matches):
  kind,name=x.groups();counts[kind]+=1;decl.append({'kind':kind,'name':name})
  end=matches[k+1].start() if k+1<len(matches) else src.index('\nend',x.end());block=src[x.start():end].strip()
  if kind=='theorem':
   z=re.search(r':=\s*by\b|:=\s*\n',block);assert z,(module,name);statements.append(block[:z.start()].rstrip());assert name in axioms['declarations']
  else:defs.append(block)
 assert [x['name'] for x in decl]==replay['declared_names'][module]
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,
  'status':'compiled, joint replay passed, every theorem closure printed in worker158','declarations':decl,
  'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':statements,'definitions':defs,
  'forbidden_tokens':[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]})
assert len(new)==11 and counts=={'theorem':43,'def':14}
assert not any(x['forbidden_tokens'] for x in mods)
assert len(axioms['declarations'])==43 and replay['returncode']==0
prior=js(T/'markov_worker_000157_mathematical_source_hashes.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'before158_sha256':before[rel],
  'sealed157_sha256':d['sha256'],'historical_status':d.get('status',d.get('historical_status','inherited')),
  'selected_recovery_in158':False,'worker156_recovered_in157':d.get('selected_recovery_in157',False)})
assert len(older)==len({x['path'] for x in older})==242
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:
 assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature','resolvent']:
 rel=f'research/markov-ffd747f5-{tag}.md';h=sha(A/rel);assert h==sha(P/rel)
 docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['source_rows','row_shape','resolvent','generate_small_rows']:
 rel=f'research/{tag}_ffd747f5.py';h=sha(A/rel);assert h==sha(P/rel)
 scripts.append({'path':rel,'sha256':h,'current_match':True,'executed_by_auditor':False,
  'main_guarded':tag!='generate_small_rows','is_lean_generator':tag=='generate_small_rows'})
inherited_scripts=[]
for d in [x for x in prior['new_scripts'] if x['path']=='research/lower_rows_1bb0aa1e.py']+prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 inherited_scripts.append({'path':rel,'sha256':h,'sealed157_match':True,'main_guarded':True,'executed_by_auditor':False})
recordnames=['source-row-experiments.json','row-shape-experiments.json','resolvent-experiments.json']
data={n:js(E/n) for n in recordnames}
for n in recordnames:
 rel='evidence/markov-ffd747f5/'+n;h=sha(A/rel);assert h==sha(P/rel)
 records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(91,'row-shape-experiments.json'),(137,'source-row-experiments.json'),(188,'resolvent-experiments.json')]:
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n]
 bindings.append({'event':num,'record':n,'command':it['command'],'all_printed_fields_exact_match':True})
# Counts of input indices only; no coefficients, binomials, recurrences, signs or gaps.
source=Counter();source_domains=[]
for q in range(1,21):
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['sources']+=1;source['rows']+=q+1
  source['coefficient_checks']+=(q+1)*(n+6);source['horizontal_triples']+=n+6
  if q<=4:source['small_source_arrays']+=1;source['small_array_entries']+=12
  if q>=5:source['fifth_rows_also_in_factorization']+=1;source['fifth_coefficient_positions_overlap']+=n+6
  source_domains.append({'q':q,'r':r,'n':n,'row_max':q,'column_max':n+5})
for k in ['sources','rows','coefficient_checks','horizontal_triples']:assert source[k]==data['source-row-experiments.json'][k]
assert source['small_source_arrays']==len(data['source-row-experiments.json']['small_fifth_rows'])
assert source['small_array_entries']==sum(len(x['coefficients']) for x in data['source-row-experiments.json']['small_fifth_rows'])
shape=Counter();shape_domains=[]
for n in range(1,101):
 b=min((n-1)//2,25);shape['n_values']+=1
 for j in range(b+1):
  shape['rows']+=1;shape['residual_array_length_upper_bound']+=j+1
  shape['adjacent_positions_upper_bound']+=max(j-1,0)
  if n>=4 and n%3 and j<=n//3:shape['actual_source_lower_rows']+=1
 shape_domains.append({'n':n,'row_max':b})
assert shape['adjacent_positions_upper_bound']==data['row-shape-experiments.json']['adjacent_checks']==19600
assert len(data['row-shape-experiments.json']['H5_at_n_11_plus_d_coefficients'])==6
assert len(data['row-shape-experiments.json']['H5_adjacent_gap_polynomials'])==4
res=Counter();resdomains=[]
for n in range(1,91):
 b=min(n-1,25);res['n_values']+=1
 for j in range(b+1):
  res['rows']+=1;res['coefficients']+=j+4;res['positions_past_formal_degree']+=3
  if 2*j+1<=n:res['shape_domain_rows']+=1;res['shape_domain_positions']+=j+4
  if n>=4 and n%3 and j<=n//3:res['actual_source_lower_rows']+=1;res['actual_source_lower_positions']+=j+4
 resdomains.append({'n':n,'row_max':b,'each_row_column_max':'j+3'})
assert res['coefficients']==data['resolvent-experiments.json']['coefficients']==31785
neg=data['resolvent-experiments.json']['outside_shape_negative_examples']
assert len(neg)==5 and all(2*j+1>n for n,j,k,value in neg)
candidate_rel='evidence/markov-ffd747f5/unused-small-rows-candidate.lean';cand=(A/candidate_rel).read_text();ch=sha(A/candidate_rel)
assert ch==sha(P/candidate_rel)==manifest[candidate_rel]==receipt['changes'][candidate_rel]['after']
candidate={'path':candidate_rel,'sha256':ch,'bytes':len(cand.encode()),'physical_lines':len(cand.splitlines()),
 'declarations':re.findall(r'(?m)^theorem\s+(\w+)',cand),'status':'unused uncompiled generated candidate; not selected, replayed or axiom-printed',
 'generator_event':195,'rename_event':209,'original_path':'research/MarkovFifthSmallRowsMFFD.lean',
 'original_path_present_at_observation':(P/'research/MarkovFifthSmallRowsMFFD.lean').exists(),
 'generator_reported_list_items':106,'qualification':'Generator prints len(lines), not physical newline count: list items contain embedded newlines. No candidate proof or value recomputed.'}
assert len(candidate['declarations'])==16 and not candidate['original_path_present_at_observation']
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':[candidate],
 'named_older_comparisons':older,'worker156_recovery_status':'Completed in157 only;158 rechecks retained receipts and inherits compiled objects. No new recovery or historical upgrade.',
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'result_bindings':records,
 'imported_four_functions':four,'imported_libraries':libs,
 'residual_binding':{'path':'research/MarkovResidualMFFD.lean','sha256':sha(A/'research/MarkovResidualMFFD.lean'),
  'root_equivalence':'Conjecture63 iff ThreeRemainingMFFD and OtherFourM9E2','root_open':True,'both_residual_conjuncts_unproved':True,
  'new_region':'Actual numerator3, raw horizontal row j=5, all natural column starts, both q>=1 residue families, all zeros.',
  'uniform_lower_shape_unproved':True,'resolvent_coefficient_bridge_unproved':True},
 'all_named_new_match_current':True,'read_scope_notes':[
  'All11 selected math bodies,7 prose files,4 new mathematical scripts read. Named inherited lower-uniform/shape/raw/source/residual and helper bodies reread; other older bodies retain sealed review and exact named hashes.',
  'Closed158 archive enumerations only; named current counterparts and explicit inherited records checked. No active159 enumeration/read.',
  'Unused generated candidate16theorem statements inventoried only; no build/replay/print acceptance.',
  'Nine external source/object pairs retain inherited identity-only limitations. Named Nat.choose_mul/choose_symm_add statements read, no new library execution or literature retrieval.']}
struct={**base,'new_modules':mods,'accepted_counts':dict(counts),'unused_candidate':candidate,
 'source_scope':'Every actual numerator3 path is threePath(q-1,r), q>=1; true gives b=3q+1 and false b=3q+2. source_three_rawM9E2 identifies the literal integer coefficients for every natural i,j.',
 'factorization_scope':'For actual j<=q, raw coefficient equals [u^i] u^3(1+u)^(n-2j-1) H_j(n,u). All natural i; no unknown formula, positivity or shape premise. Generic lower-row equality requires 2q+1<=n and j<=q. Signed H recurrence is not a positivity theorem.',
 'binomial_scope':'Weighted coefficient identity unconditional in natural N,c,j,t, with all natural-zero binomial cases retained. rowJ factor uses2j+1<=n to justify exponent arithmetic. delta-row source forcing treats i0/1/2 separately and shifts i+3. Guarded row operators match bivariate shifts exactly; triangular uniqueness inherited.',
 'degree_scope':'natDegree(rowJ n j)<=j and natDegree(rowH n j)<=j for every natural n,j; coefficient k>j zero. No exact positive interval or general residual nonnegativity claimed. Integer-to-rational map requires j+1<=n.',
 'fifth_scope':'Generic H5 maps to explicit six-term polynomial for n>=11, d=n-11>=0. Rational identity holds all rational d; positivity/CrossLC only real d>=0. Positive coefficients at0..5, zero elsewhere,4 adjacent inequalities plus interval support yield CrossLC. Binomial smoothing and u^3 shift retain zeros. Actual source transfer needs q>=5, not merely n>=11.',
 'small_scope':'q1..4, both residues, i0..11 discharged with ordinary decide in Lean. All i>11 handled by inherited actual source total-degree zero theorem on first factor and square nonnegativity. Includes q1 and correction/upper rows; unused alternative source-polynomial candidate is not used.',
 'raw_scope':'For every path with a=3 and every natural i: coeff(i,5)*coeff(i+2,5)<=coeff(i+1,5)^2. No polygon, positive coefficient, run length, finite denominator bound, formula or shape premise. Integer coefficients and casts exact; no division/rescaling.',
 'root_scope':'Exact iff removes only j5 from the H clause of ThreeRemainingM1BB; retains every other H row, V outside((i=3 or i=4) and j+1<=q), all D, and OtherFour for paths a>=4. Original raw polygon/zero/endpoints inherited. Both residual conjuncts unproved. fifth_gain_polygon shows positions(3,5),(4,5),(5,5) valid for both unbounded q>=5. Gain beyond immediate157H residual; no assertion of exclusion from every earlier sufficient criterion.',
 'open_scope':'LowerRowShapeMFFD assumes CrossLC for all natural n,j with2j+1<=n; it is unproved. Conditional smoothing would cover only actual lower rows. Proposed rational/Euler resolvent and alternating six-monomial coefficient formula remain prose/finite only. Negative saved coefficients outside intended shape domain do not concern admissible lower source rows or refute raw LC.',
 'mathematical_values_recomputed':False}
finite={**base,'source_rows':{'counts':dict(source),'domains':source_domains,'saved_record':data['source-row-experiments.json'],
 'qualification':'q1..20 both residues,40 actual sources; lower rows j0..q, columns i0..n+5,460rows/21930positions. Separate j5 triples at all those starts1560, including zeros; not polygon-filtered. Saved5840zero coefficients/507zero-containing triples not independently recomputed.32j5 rows overlap lower-factorization domain.8small arrays contain96literal entries. No sum of disjoint evidence claimed.'},
 'row_shape':{'counts':dict(shape),'domains':shape_domains,'saved_record':data['row-shape-experiments.json'],
 'qualification':'n1..100,j0..min(floor((n-1)/2),25). Arrays from signed Hrows, not canonical source frame. Structurally length<=j+1 before trim;19600 is potential adjacent-position upper bound matching retained runtime count; trimming/positivity/signs not reevaluated. Includes non-source parameters and rows beyond actual j<=q.6x6 coefficient interpolation values and4x11 gap arrays are experimental candidates; final independent Lean identity/positivity proofs supply universal H5 result. Uniform CrossLC remains open.'},
 'resolvent':{'counts':dict(res),'domains':resdomains,'saved_record':data['resolvent-experiments.json'],
 'qualification':'n1..90,j0..min(n-1,25),k0..j+3:31785coefficient comparisons. Includes3positions past degree in every row, non-source n, and rows beyond shape/source lower domain. Saved first5negative examples all violate2j+1<=n (index check only); no coefficient/sign recomputation. Signed alternating formula and generating-function bridge unproved. Experimental zero/counterexample claims retained only.'},
 'candidate_generation':candidate,'event_bindings':bindings,'records':records,
 'runtime_limits':'All imported numerical helpers main-guarded; generator has top-level operations but is not imported by experiments. Commands use Python -B; no invocation-start transitive source/executable hash receipt. Final source/result/event identity only; no project helper executed by auditor.',
 'mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000158_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(suffix,p.stat().st_size,sha(p))
print('accepted',dict(counts),'older',len(older),'source',dict(source),'shape',dict(shape),'resolvent',dict(res))
