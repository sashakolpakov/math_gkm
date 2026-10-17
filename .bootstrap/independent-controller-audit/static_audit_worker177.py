"""Closed worker177: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000177';A=W/'artifacts';E=A/'evidence/markov-09fffb56'
REQUEST='09fffb56626d410db28e496da5a3241c'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792215714137517000.json');axioms=js(E/'axioms-1792215746999933000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':177,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1606.1280918121338. Twelve final mathematical modules compiled and jointly replayed,59 distinct theorem closures printed;12 rejected compiler attempts retained. Full root open.',
 'scope':'Archive-first closed177 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active178 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-09fffb56/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in177':True,'printed_in177':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':59,'def':9} and len(axioms['declarations'])==59

prior=js(T/'markov_worker_000176_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed176_sha256':h,'initial177_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in177':False})
assert len(older)==len({x['path'] for x in older})==524
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in177':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','correspondence','mathematics','next','operational']:
 rel='research/markov-09fffb56-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['experiment_09fffb56.py','convolution_probe_09fffb56.py','normalized_probe_09fffb56.py','generate_normalized_09fffb56.py','q_ratio_probe_09fffb56.py','q_low_formula_09fffb56.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 else:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,
  'manifest_only_when_not_initial':rel not in before,'executed_by_auditor':False,
  'scope':'Historical identity only. Explicit current experiment dependencies are transposed_stress_be355177,source_experiment_6576ccc5,source_experiment_9647c1ba and three_probe_9e205206. No import or execution.'})
assert len(inherited_scripts)==82
record_names=['normalized-symbolic.json','gap-polynomial.json','step-polynomial.json','gap-horner.txt','step-horner.txt',
 'concavity-probe.json','source-experiment.json','source-progress.json','budget-experiment.json','convolution-probe.json','q-ratio-probe.json','q-low-formula.json','source-visit.json']
data={n:js(E/n) for n in record_names if n.endswith('.json')}
for n in record_names:
 rel='evidence/markov-09fffb56/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
assert len(records)==13
# Exact saved expression text is compared; no polynomial is evaluated or expanded.
horner=[]
normalized=(A/'research/MarkovNormalizedKernelM09F.lean').read_text()
for tag in ['step','gap']:
 theorem='norm_'+tag+'_clearedM09F';block=normalized[normalized.index('theorem '+theorem):]
 literal=block.split('let p : ℚ := ',1)[1].split('\n have he',1)[0]
 saved=(E/(tag+'-horner.txt')).read_text().strip()
 assert re.sub(r'\s+','',literal)==re.sub(r'\s+','',saved)
 rows=data[tag+'-polynomial.json'];assert len(rows)==data['normalized-symbolic.json'][tag]['terms']
 assert len({tuple(x[0]) for x in rows})==len(rows)
 horner.append({'tag':tag,'saved_literal_terms':len(rows),'horner_literal_matches_final_source':True,
  'saved_summary':data['normalized-symbolic.json'][tag],'values_signs_minima_or_polynomial_identity_recomputed':False})
# Read saved closed-worker events, never execute their commands.
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines() if x.strip()]
event_bindings=[]
decoder=json.JSONDecoder()
for n,value in data.items():
 if n in ['gap-polynomial.json','step-polynomial.json','source-visit.json']:continue
 matches=[]
 for event_no,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output','')
  for pos,ch in enumerate(out):
   if ch not in '[{':continue
   try:obj,end=decoder.raw_decode(out,pos)
   except (ValueError,TypeError):continue
   if obj==value:matches.append({'event':event_no,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'start_character':pos,'end_character':end,'whole_stdout':out.strip()==out[pos:end]})
 event_bindings.append({'record':n,'complete_saved_json_matches':matches,
  'scope':'Literal saved JSON binding only. No regeneration or inference about command-time imported source versions.'})
oneoff_numbers=[59,61,66,68,73,75,77,114,116,151,199,203,205]
oneoffs=[]
for n in oneoff_numbers:
 item=events[n-1]['item'];assert item['type']=='command_execution' and item['status']=='completed' and item['exit_code']==0
 oneoffs.append({'event':n,'item_id':item['id'],'command':item['command'],'output':item['aggregated_output'],
  'command_sha256':hashlib.sha256(item['command'].encode()).hexdigest(),
  'stdout_sha256':hashlib.sha256(item['aggregated_output'].encode()).hexdigest(),'exit_code':0,'executed_by_auditor':False})
# Domain-index enumeration only; no frame, coefficient, kernel, choose, product, sign, or RNG computations.
source_counts=Counter()
qs=list(range(2,26))+[30,40,55]
for q in qs:
 for r in [False,True]:
  b=3*q+(1 if r else 2);source_counts['source_cases']+=1
  for k in range((q-(2 if r else 1))//2+1):
   d=q-2*k-(2 if r else 1);j=q+k+1;assert 2*j+1<=b and d>=0
   source_counts['rows']+=1;source_counts['coefficients']+=b+6
   source_counts['raw_triples']+=b+4;source_counts['bounds']+=b
   for i in range(b+4):
    source_counts['polygon_triples']+=all(3*b<=b*x+3*j and x+j<=3+b-1 for x in range(i,i+3))
for target,record in [('rows','rows'),('coefficients','coefficients'),('raw_triples','triples'),('polygon_triples','polygon_triples'),('bounds','bounds')]:
 assert source_counts[target]==data['source-experiment.json'][record]
assert {k:v for k,v in data['source-experiment.json'].items() if k!='seconds'}==data['source-progress.json']
budget_grid=Counter()
for d in list(range(15))+[30,100,1000]:
 for k in list(range(15))+[30,100,1000]:
  for r in [False,True]:
   for s in list(range(3,21))+[30,50,100]:
    j=d+3*k+2+int(r);budget_grid['cases']+=1
    budget_grid['clamp_zero' if d<=s else 'clamp_positive']+=1
    budget_grid['top_scalar_eligible']+=s<=j
    budget_grid['q1_auxiliary']+=d+2*k+(2 if r else 1)==1
assert budget_grid['cases']+1000==data['budget-experiment.json']['budget_checks']
random_saved={key:data['budget-experiment.json'][out]-budget_grid[grid] for key,out,grid in [
 ('clamp_zero','clamp_zero','clamp_zero'),('clamp_positive','clamp_positive','clamp_positive'),
 ('top_scalar_eligible','top_scalar_checks','top_scalar_eligible')]}
assert random_saved['clamp_zero']+random_saved['clamp_positive']==1000
assert all(0<=x<=1000 for x in random_saved.values())
conv_counts=Counter()
for j in list(range(1,71))+[100,150]:
 for s in list(range(16))+[20,50,100]:
  conv_counts['parameter_pairs']+=1;conv_counts['individual_concavity_positions']+=j+1
  for n in range(2*j+1):
   conv_counts['margin_checks']+=1;conv_counts['ratio_steps']+=n<2*j
   conv_counts['positive_pair_sum_checks']+=len(range(max(0,n-j),n//2+1))
for k in ['margin_checks','ratio_steps','positive_pair_sum_checks']:assert conv_counts[k]==data['convolution-probe.json'][k]
ratio_count=sum(2*j for j in list(range(1,101))+[150,200] for s in list(range(21))+[50,100,1000])
assert ratio_count==data['q-ratio-probe.json']['q_ratio_checks']
early_ratio_count=sum(2*j for j in range(1,70) for s in range(15))
low_counts={'interior_coefficients':sum(2*j for j in range(1,101) for s in list(range(16))+[30,100]),
 'boundary_coefficients':sum(2 for j in range(1,101) for s in list(range(16))+[30,100])}
for k,v in low_counts.items():assert v==data['q-low-formula.json'][k]
budget_oneoff_count=sum(s<=d+3*k+2+r for d in range(51) for k in range(31) for r in [0,1] for s in range(3,21))
assert "72450" in events[198]['item']['aggregated_output'] and early_ratio_count==72450
# Historical source fragments were read explicitly and hashed against sealed176.
reads=[]
all_old={r['module']:r for r in older}
for name in ['MarkovQKernelM7E2','MarkovLiftPolynomialM7E2','MarkovBinomialLiftMAE9','MarkovTransposedKernelM657','MarkovThreeSourceM9E2']:
 row=all_old[name];reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'full_body_read':False,
  'scope':'Explicit named inherited definitions and selected source-bridge statements only; old proof bodies/check windows not reaudited.'})
for name in ['MarkovSharpMarginMBE3','MarkovSharpTransportMBE3','MarkovTransposedSharpMBE3']:
 p=P/'.control/markov/workers/000176/artifacts/research'/f'{name}.lean';assert sha(p)==all_old[name]['sha256']
 reads.append({'path':str(p),'sha256':sha(p),'full_body_read':False,'scope':'Definitions and theorem headers only; earlier full proof audit reused.'})
p=P/'.control/markov/workers/000176/artifacts/research/transposed_stress_be355177.py'
assert sha(p)==next(x['sha256'] for x in inherited_scripts if x['path'].endswith('/transposed_stress_be355177.py'))
reads.append({'path':str(p),'sha256':sha(p),'full_body_read':True,'scope':'Read-only experiment scaling correspondence; no execution/import.'})
residual={
 'root_open':True,'new_unconditional_raw_LC_region':False,'new_unconditional_source_estimate':True,
 'root_equivalence':'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2',
 'remaining_predicates_unproved':['ThreeBeyondBandM657','OtherFourM9E2'],
 'SharpTopScalars_proved':True,'SharpCompleteMargin_proved':False,'UnshiftedRatio_proved':False,'UnshiftedAdjacent_proved':False,
 'SharpTopScalars_scope':'All natural d,k,s and Boolean r,3<=s<=bandJ(d,k,r), both clamp regimes/k=0 included. No denominator/run bound.',
 'SharpCompleteMargin_scope':'All natural j,s,n, without s<=j guard; full complete-lift convolution inequality remains an unproved proposition.',
 'source_estimate_guard':'All natural q,k,s; r Boolean; q>=2; j=q+k+1;2*j+1<=sourceN(q,r);s>=3. Column i=s+3>=6; d=bandExponent(q,k,r). No d<=s guard.',
 'source_estimate':'choose(s+9,4)*raw(s+3,j) <= (choose(s+9,4)+(s+3))*liftOutput(d,j,s). Integral raw coefficients, all zero tails.',
 'old_estimate_comparison':'Factor3 on the additive budget replaced by1; clamp restriction removed, but new estimate requires s>=3. Old176 estimate remains separately applicable to smaller s under d<=s; no scope erasure.',
 'conditional_source_LC':'SharpCompleteMargin alone now implies raw horizontal(i,j),(i+1,j),(i+2,j) LC for all natural starts i in the actual q>=2 correction band; inherited prefix/tail assembly retained.',
 'conditional_is_root_equivalence':False,
 'unshifted_equivalence':'UnshiftedAdjacent iff UnshiftedRatio universally. Either is sufficient for SharpCompleteMargin and hence guarded source-band LC; no converse from SharpCompleteMargin or root asserted.',
 'normalization_scope':'Rational auxiliary complete coefficient divided by positive full B_s. Monotone/log-concave in s, fixed j,m; m>j zero tails. Does not change raw root coefficients.',
 'actual_raw_source_counterexample':False,
 'obstructions':'Formal additive normalized-coefficient concavity failure j6,s0,m6, gap-4/35035. Arbitrary log-concave weights failure is finite-only and not identified with source family.',
 'proposed_low_degree_formulas_proved':False,'q1_new_source_gain':False,'new_vertical_or_diagonal_region':False,
 'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,'older_failed_versions_retroactively_recovered':False,
 'prior175_scope_unchanged':'Raw band prefix i<=5 or strict tail N<i+j+q remains latest unconditional LC region gain; no clause removed in176/177.'
}
proof_details={
 'scalar_assembly':'Weighted paired binomials with a1/2, induction k>=1,s>=3; positive-k absorbed budget from zero-d base growth; k0 separate clamp/choose argument; exact positive B_s and binomial factors permit cancellation. Top scalar uses s3/4 separately, s>=5 via positive polynomial, j<5 via clamped k0.',
 'normalized_geometry':'j,m,t rational with0<=m<=j,0<=t; j=m+z. Final Lean ring/positivity checks saved75/498-term certificates; auditor compares literal expressions only. Formula attaches natural coefficients using inherited lift_normalizedMFEE and positive denominators, then handles m>j by natural binomial zeros.',
 'finite_covariance':'Finite cross-ratio ordering and monotone weights imply ordered weighted-sum inequality; no implicit positivity of a,b needed. Translation weights choose(i,n) monotone, arbitrary finite polynomial cutoff max degree+1. Only implication to margin proved.',
 'adjacent_support':'q coefficient positive for0<=i<=j with endpoint weight1; product positive for0<=n<=2j by min(n,j) term and nonnegative summands; zero beyond2j by degree bound. Positive denominator product enables adjacent chaining, with zero tails explicit and j0 included.',
 'clamp_and_indices':'absorbed term uses natural d-s=max(d-s,0), divided by positive s+1. New raw estimate is at column s+3,rowq+k+1. Python kernel is integer-scaled bys+1, which its weighting check accounts for; Lean K is rational/real coefficient kernel.',
 'statement_precision':'Correspondence prose saying bounds cover every natural column must be read with its explicit s>=3 restriction. Formal source bound covers columns>=6; conditional LC theorem covers every natural starting column.'
}
S={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'mathematical_values_recomputed':False,'source_level_scope':residual,
 'literal_raw_indices':{'bound':['(s+3,q+k+1)'],'horizontal':['(i,q+k+1)','(i+1,q+k+1)','(i+2,q+k+1)']},
 'residue_map':{'false':'N=3q+2,q=d+2k+1,j=d+3k+2','true':'N=3q+1,q=d+2k+2,j=d+3k+3'},
 'zero_and_endpoint_handling':'Positive bases/binomial denominators only canceled. Source zeros not divided out; kernel h>s, normalized m>j and q-product n>2j zero tails explicit. Original root0/1,1/1/polygon clauses unchanged.',
 'proof_chain_details':proof_details}
F={**base,'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'source_experiment':{'q_values':qs,'residues':[False,True],'counts':dict(source_counts),'saved':data['source-experiment.json'],
  'scope':'Actual3/(3q+1 or2),q>=2, all permittedk, rowq+k+1. Columns0..b+5 including zero tails; bounds/weighting onlyi>=6. Raw starts0..b+3; original polygon applied at all3 positions.',
  'zeros_saved_only':16284,'signs_coefficients_and_failures_recomputed':False,'progress_equals_final_except_seconds':True,
  'python_kernel_scaling':'Inherited kernel returns(s+1)*LeanK; weighting check equals(s+1)*raw, and raw bound uses unscaled source.'},
 'budget':{'deterministic_grid_counts':dict(budget_grid),'random_planned_cases':1000,'random_seed_literal':'0x09fffb56',
  'random_parameter_domain':'d,k in0..100000;s in3..100;both residues','random_counts_inferred_from_saved_totals_only':random_saved,
  'saved':data['budget-experiment.json'],'random_samples_regenerated':False,'saved_ratio_not_recomputed':True},
 'convolution':{'counts':dict(conv_counts),'j_values':list(range(1,71))+[100,150],'s_values':list(range(16))+[20,50,100],
  'saved':data['convolution-probe.json'],'failures_capped_at':12,'negative_value_counts_recomputed':False,
  'scope':'Complete normalized-margin/allcoefficient ratios and balanced partial-pair sums are finite candidates, not universal proofs; individual additive failures distinct from multiplicative LC.'},
 'q_ratio':{'count':ratio_count,'early_event199_count':early_ratio_count,'early_scan_included_in_later_domain':True,
  'saved':data['q-ratio-probe.json'],'counterexample_values_recomputed':False,
  'random_search_event205':'At most1000 planned attempts, exits onfirstfailure; actual iteration count not recorded. No RNG regeneration. Saved13weights/s3/n6 match final literal diagnostic.',
  'generic_scope':'No formal source-family identification; positive/logconcave weight and negative ratio-gap assertions are saved experiment outputs only.'},
 'q_low_formula':{'counts':low_counts,'saved':data['q-low-formula.json'],
  'scope':'j1..100,s0..15 plus30,100;two identities pern<j andtwo boundaryn=j. Integer n-2 negative meanszero, not truncatednatural subtraction. No universal Lean formula or n>j claim.'},
 'polynomial_proposals':{'literal_bindings':horner,'concavity_saved':data['concavity-probe.json'],
  'concavity_scope':'Record209terms/0negative is only last t=m+x substitution inevent59. Initialunrestricted208terms/39negative is separate; neither coefficient-sign output is a source/root refutation. No polynomial regeneration.',
  'oneoff_budget_event73_eligible_domain_count':budget_oneoff_count,'oneoff_records':oneoffs},
 'output_event_bindings':event_bindings,'result_bindings':records,
 'source_visit':{'path':'evidence/markov-09fffb56/source-visit.json','sha256':binding('evidence/markov-09fffb56/source-visit.json'),
  'scope':'Worker-retained source retrieval, not an auditor browse or novelty check.'},
 'invocation_limits':'All new scripts read/ASTparsed only. Generator has top-level polynomial work/write and was never imported. Oneoffs parsed as text; no code/math/RNG execution. Current final script identity does not by itself authenticate every earlier import version.'}
H={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],
 'result_bindings':records,'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'residual_binding':residual,'receipt_waiting':js(T/'markov_worker_000177_receipt_watch.json'),'all_named_new_match_current':True,
 'explicit_inherited_body_reads':reads,'read_scope_notes':[
  'All12 new mathematical bodies and6 new mathematical experiment/generator scripts read in full. Three final mathematical/correspondence/operational reports read; checkpoint/next docs identity-only.',
  'Only explicit named inherited/current counterparts read; no active178+ sources/events or broad current research enumeration.',
  'All previous sealed observation windows unchanged. Prior storage COW operations affect inode metadata only; content hashes remain binding.',
  'No fresh whole-source rebuild, project program/Lean/checker/replay/finalizer/CAS execution or mathematical-value/RNG recomputation.',
  'Finite source/guard counts use already-formal source labels and index domains only, never recurrence/coefficients/binomial values.'
 ]}
for label,value in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 path=T/f'markov_worker_000177_{label}.json';assert not path.exists();path.write_text(json.dumps(value,indent=2,ensure_ascii=False)+'\n')
 print(path.name,path.stat().st_size,sha(path))
print(json.dumps({'source_counts':dict(source_counts),'budget_grid':dict(budget_grid),'saved_random_count_inferences':random_saved,
 'convolution_counts':dict(conv_counts),'ratio_count':ratio_count,'early_ratio_count':early_ratio_count,'low_counts':low_counts,
 'oneoff_budget_count':budget_oneoff_count,'complete_json_bindings':{r['record']:[x['event'] for x in r['complete_saved_json_matches']] for r in event_bindings}},indent=2))

