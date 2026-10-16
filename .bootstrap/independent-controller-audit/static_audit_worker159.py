"""Static saved-text/hash audit and input-index counts only; no project imports."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import json,hashlib,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000159';A=W/'artifacts';E=A/'evidence/markov-4687d03f'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
base={'worker':159,'request':'4687d03ffe8948abad1b235a519bed69','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed / return0 / delivered report; full root open; prior timeout and recovery history unchanged.',
 'scope':'Closed159 archive and explicit named inherited/current counterparts only. Static parsing, hashes, literal comparisons and input-index counts; no project/proof/checker/replay/experiment/finalizer/generator execution or mathematical-value computation. No project edits, deletion, proposer contact or research assistance. Active160 excluded; prior seals final.'}
before=js(E/'before.json');receipt=js(W/'receipt.json');v=js(E/'validation.json');manifest=js(E/'manifest.json');selection=js(E/'mathematical-modules.json')
assert receipt['outcome']=='completed' and receipt['report'] is not None
replay=js(A/v['replay_receipt']);axioms=js(A/v['axioms_receipt'])
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
counts=Counter();new=[];mods=[]
for module in selection:
 rel='research/'+module+'.lean';src=(A/rel).read_text();h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['sources'][module]==replay['modules'][module]==axioms['sources'][module]==manifest[rel]
 matched=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules']=={module:h}];assert len(matched)==1
 bp,bd=matched[0];assert sha(bp.with_suffix('.lean'))==h and str(bp.relative_to(A)) in v['build_receipts']
 op='evidence/markov-4687d03f/'+module+'.olean';oh=sha(A/op)
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
  'status':'compiled, joint replay passed, every theorem closure printed in159','declarations':decl,'object_path':op,'object_sha256':oh,
  'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row);clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':statements,'definitions':defs,
  'forbidden_tokens':[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]})
assert len(new)==12 and counts=={'theorem':43,'def':16} and not any(x['forbidden_tokens'] for x in mods)
assert len(axioms['declarations'])==43 and replay['returncode']==0
prior=js(T/'markov_worker_000158_mathematical_source_hashes.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'before159_sha256':before[rel],'sealed158_sha256':d['sha256'],
  'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in159':False,
  'worker156_recovered_in157':d.get('worker156_recovered_in157',False)})
assert len(older)==len({x['path'] for x in older})==253
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-4687d03f-{tag}.md';h=sha(A/rel);assert h==sha(P/rel)
 docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['explore','shape_routes','column_five','column_shapes','source_checks','difference_shape']:
 rel=f'research/{tag}_4687d03f.py';h=sha(A/rel);assert h==sha(P/rel)
 scripts.append({'path':rel,'sha256':h,'current_match':True,'executed_by_auditor':False,'main_guarded':True,
  'is_lean_generator':tag in ['column_five','column_shapes']})
inherited_scripts=[]
for d in prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 inherited_scripts.append({'path':rel,'sha256':h,'sealed158_match':True,'main_guarded':True,'executed_by_auditor':False})
recordnames=['shape-experiments.json','shape-routes.json','column-five-candidate.json','column-shapes-candidate.json','source-experiments.json','difference-shape.json']
data={n:js(E/n) for n in recordnames}
for n in recordnames:
 rel='evidence/markov-4687d03f/'+n;h=sha(A/rel);assert h==sha(P/rel)
 records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in zip([56,117,133,156,172,200],recordnames):
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n]
 bindings.append({'event':num,'record':n,'command':it['command'],'all_printed_fields_exact_match':True})
# Input indices only. Never evaluate binomials, coefficients, differences, gaps, or signs.
explore=Counter();exploredom=[]
for j in range(1,151):
 ds=[0,1,2,j,2*j,5*j,10*j];uniq=set(ds)
 explore['parameter_occurrences']+=len(ds);explore['unique_parameters']+=len(uniq)
 explore['positivity_checks']+=len(ds)*(j+1);explore['lc_checks']+=len(ds)*(j-1)
 explore['unique_coefficient_positions']+=len(uniq)*(j+1);explore['unique_adjacent_positions']+=len(uniq)*(j-1)
 exploredom.append({'j':j,'slack_occurrences':ds,'unique_slacks':sorted(uniq)})
for n in range(4,45):
 explore['parameter_difference_checks']+=(n-1)//2
for k in ['positivity_checks','lc_checks','parameter_difference_checks']:assert explore[k]==data['shape-experiments.json'][k]
routes=Counter();routedom=[]
for n in range(3,91):
 J=min((n-1)//2,25)
 for j in range(2,J+1):
  routes['rows']+=1;routes['ulc_checks']+=j-1;routes['synchronized_checks']+=2*(j-1);routes['interlacing_ratio_checks']+=j
 routedom.append({'n':n,'row_min':2,'row_max':J})
for k in ['ulc_checks','synchronized_checks','interlacing_ratio_checks']:assert routes[k]==data['shape-routes.json'][k]
diff=Counter();diffdom=[]
for n in range(3,101):
 J=min((n-1)//2,30)
 for j in range(1,J+1):
  diff['differences']+=1;diff['difference_lc_checks']+=j-1;diff['synchronization_checks']+=2*(j-1);diff['sum_gap_checks']+=j-1
 diffdom.append({'n':n,'row_min':1,'row_max':J})
for k in ['differences','difference_lc_checks','synchronization_checks']:assert diff[k]==data['difference-shape.json'][k]
source=Counter();sourcedom=[]
for q in range(1,31):
 for r in [False,True]:
  n=3*q+(1 if r else 2);source['sources']+=1;source['column_formula_checks']+=3*(q+1)
  source['horizontal_triples']+=q+1;source['vertical_triples']+=q-1;source['diagonal_triples']+=q-1
  source['polygon_memberships']+=3*((q+1)+2*(q-1))
  if q>=5:source['horizontal_overlap_with_prior_j5']+=1
  sourcedom.append({'q':q,'r':r,'n':n,'H_row_max':q,'VD_row_max':q-2,'columns':[3,4,5]})
for k in ['sources','column_formula_checks','horizontal_triples','vertical_triples','diagonal_triples','polygon_memberships']:assert source[k]==data['source-experiments.json'][k]
source['triple_total']=source['horizontal_triples']+source['vertical_triples']+source['diagonal_triples']
# Literal certificate formatting comparison; no rational operations or polynomial algebra.
poly=(A/'research/MarkovFivePolynomialM468.lean').read_text();shape=(A/'research/MarkovFiveShapeM468.lean').read_text()
cf=data['column-five-candidate.json'];cg=data['column-shapes-candidate.json']
assert cf['low_five_core'] in poly and cf['horizontal_gap_shift_n_3x_1_d'] in poly
assert len(cf['horizontal_gap_shift_n_3x_1_d'].split('+'))==cf['gap_terms']==41
certs=[]
for name,d in cg.items():
 literal='*'.join('(x+'+str(k)+')' for k in d['factors'])+'*'+d['core']
 assert literal in shape
 assert len(d['core'].split('+'))==d['terms']
 certs.append({'name':name,'factors':d['factors'],'terms':d['terms'],'saved_core_literal':d['core'],'source_literal_equal':True})
assert [x['terms'] for x in certs]==[35,21]
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':[],
 'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,
 'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,
 'residual_binding':{'path':'research/MarkovResidualM468.lean','sha256':sha(A/'research/MarkovResidualM468.lean'),
  'root_equivalence':'Conjecture63 iff ThreeRemainingM468 and OtherFourM9E2','root_open':True,'both_residual_conjuncts_unproved':True,
  'new_regions':['a3: H start i3,j<=q','a3: strict V i5,j+2<=q','a3: strict D start i3,j+2<=q'],
  'uniform_shape_unproved':True,'Euler_substituted_coefficient_bridge_unproved':True,'denominator_induction_two_premises_unproved':True},
 'all_named_new_match_current':True,'read_scope_notes':[
  'Read all12 new math bodies,6 prose files,6 mathematical scripts and6 retained result JSONs. Prior source/root bodies retain sealed158 review;253 exact named older sources rehashed.',
  'Named PowerSeries.WellKnown mk_add_choose_mul_one_sub_pow_eq_one and PowerSeries.Inverse invOfUnit_mul statements read, with existing external source/object identity pins. No library execution or new research search.',
  'Closed159 artifact enumeration only; current counterparts and inherited paths explicitly named. No active160 inspection.',
  'Generator final proof templates edited after events133/156 at146/185; final helper hashes are not invocation-start hashes. Generated formal statements are credited only through their own final build/replay/print records.']}
struct={**base,'new_modules':mods,'accepted_counts':dict(counts),
 'source_scope':'Actual a3 paths are exhaustively q>=1,true3/(3q+1),false3/(3q+2); inherited source_three_raw identifies all literal integer coefficients. No upper q bound, arbitrary-word replacement or normalization.',
 'forcing_scope':'rowJ_coeff_all for every natural n,j,k uses C(j+3,k+3) C(n-j-1+k+3,k), retaining natural subtraction and k>j zeros. n unrestricted here. Parameter recurrence for J and H requires j+1<=n.',
 'series_scope':'Formal power series in t over coefficient ring Z[u], F_N=sum_j H_j(N+j+1,u)t^j. Parameter identities all natural N; J base uses d3 binomial generating series/rescale. Signed row recurrence gives exact cleared resolvent (1-(1+u)t)^(N+4)*(1-2t+(1+u)t²)^2*F_N=(1-t)^N*(1-(1+u)t²)^2. Zero/one/successor coefficients explicit.',
 'resolvent_scope':'Denominator has constant coefficient1 in Z[u]; invOfUnit with unit1 gives unique formal series. No analytic convergence/evaluation or division by source coefficient. [t^j] resolvent(n-j-1)=H_j(n) only j+1<=n. Actual source lower bridge j<=q gives all natural i, with exact u³(1+u)^(n-2j-1) multiplier and zeros. Euler-substitution six-term coefficient formula remains unproved.',
 'shape_scope':'LowerRowShapeMFFD iff ResolventShapeM468, latter all natural N,j with j<=N and zero-extended CrossLC. Both are unproved. Conditional source smoothing remains lower-row H only, not a complete direction.',
 'column_scope':'lowFive rational polynomial equals raw column5 every actual q>=1,j<=q. Exact source forcing atcolumn5 uses fib_delta_high n2j withj<n; j0/1/2+ split handles guarded negative-shift boundaries. Exact discriminant source identities and inherited columns3/4 plus second-difference uniqueness prove formula, not interpolation.',
 'inequality_scope':'H across(3,j),(4,j),(5,j),q>=1,j<=q, nonstrict. V at(5,j),(5,j+1),(5,j+2) and D at(3,j+2),(4,j+1),(5,j),j+2<=q, strict. Rationalgap certificates use nonnegative x=j and d=n-3j-1 forH, d=n-3j-7 forVD. Source substitutions and exact casts remove auxiliary hypotheses. No zero removal/cancellation by coefficients. All polygon memberships proved separately.',
 'difference_scope':'All natural N,j: H_(j+1)(N+j+3)-H_(j+1)(N+j+2)=u*sum_s0..j H_s(N+s+2). Positive multipliers do not prove positivity of signed residual summands. Conditional shape induction assumes all minimal-denominator H_j(2j+1) CrossLC and RowDifferenceShape, which includes difference CrossLC and mixed-cross inequalities for every pair of integer indices i<=k in2j+1<=n. No nonnegativity conjunct in CrossLC and no hidden adjacent-only replacement; both premises unproved.',
 'root_scope':'Exact residual removes H atj5 or(i3 andj<=q), V at(i3/4 andj+1<=q) or(i5 andj+2<=q), D at(i3 andj+2<=q); retains all remaining natural starts, original polygon/zeros/endpoints via inherited equivalence, and OtherFour a>=4. Both unproved. Unbounded polygon-valid source families; H j5 overlaps old result, no claim every triple evades all older criteria.',
 'obstruction_scope':'Saved H2(7)=[34,68,36] gives failure after binomial normalization [34,34,36]; even when residual belongs toactual3/7lowerrow, normalized residual is not raw source. No source/root counterexample or formally checked obstruction theorem claimed.',
 'mathematical_values_recomputed':False}
finite={**base,'large_shape':{'counts':dict(explore),'domains':exploredom,'saved_record':data['shape-experiments.json'],
 'qualification':'j1..150 and seven listed slack occurrences; repeatedslacks atj1/2 counted repeatedly. Larger scan evaluates the still-unproved Euler alternating coefficient formula, not direct H/source.80325sign positions78225adjacent occurrences; distinct domains counted separately. Parameter identity scan n4..44,j1..floor((n-1)/2):461polynomial-array equality tests using Hrows. Saved no failures, no values recomputed.'},
 'shape_routes':{'counts':dict(routes),'domains':routedom,'saved_record':data['shape-routes.json'],
 'qualification':'n3..90,j2..min(floor((n-1)/2),25);16600binomial-normalized adjacent tests,33200directed synchronization tests,18112denominator-ratio tests. First5failures retained only, not exhaustive failure count. Adjacent and ratio tests are not all-index CrossLC. Not all parameters/rows are actual source lower rows. Saved normalized failure remains auxiliary.'},
 'difference_shape':{'counts':dict(diff),'domains':diffdom,'saved_record':data['difference-shape.json'],
 'qualification':'n3..100,j1..min(floor((n-1)/2),30):2070row differences,25520adjacent difference inequalities,51040directed synchronization tests and25520sum-gap comparisons. zip/index lengths and positivity outcomes not reevaluated; retained successful execution supplies observed array safety. Formal mixed premise is all integer i<=k, not only adjacent tests. All failure lists capped at5.'},
 'source_checks':{'counts':dict(source),'domains':sourcedom,'saved_record':data['source-experiments.json'],
 'qualification':'q1..30bothresidues:60canonical source polynomials,2970column3/4/5comparisons;990H triples,870V and870D=2730;8190point-membership assertions including repeats. V/Dstrict additionallytested,Hnonstrict. Nozero-containingcounter/nozero-basedfilter; no inferred zero count.52Htriplesoverlapoldj5coverage. Formula helper is recurrence-derived vals, not interpolation alone. Saved outcomes not recomputed.'},
 'certificate_generation':{'column5_event':133,'column5_final_template_edit_event':146,'VD_event':156,'VD_final_template_edit_event':185,
  'H_terms':41,'VD_certificates':certs,'generation_domains':{'column5_sample_denominators':[30,31,32],'column5_sample_rows':list(range(10)),
  'column3_sample_rows':list(range(6)),'column4_sample_denominators':[30,31],'column4_sample_rows':list(range(8))},
  'qualification':'Opaque literal formulas in saved candidate JSONs match accepted Lean definitions.35/21VD core terms and41H terms counted lexically, no polynomial multiplication or rational evaluation. H stricttemplate corrected before first compile; final generator editedafterits run. VD proof-template simp correctionafterrun. Universal source/identity/positivity conclusions depend on independent final Lean records, not interpolation.'},
 'event_bindings':bindings,'records':records,'runtime_limits':'Saved commands disable Python bytecode writes. Main-guarded helper/generator bodies; inherited probe constant dictionary initialization remains. Current/final helper hashes do not establish invocation-start transitive hashes or executable authenticity. No experimental or generated mathematical value recomputed.',
 'mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000159_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(suffix,p.stat().st_size,sha(p))
print('accepted',dict(counts),'older',len(older),'explore',dict(explore),'routes',dict(routes),'difference',dict(diff),'source',dict(source))
