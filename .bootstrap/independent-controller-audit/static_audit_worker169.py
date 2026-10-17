"""Closed169 audit-owned hashes, literal syntax and finite index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000169';A=W/'artifacts';E=A/'evidence/markov-f8f306c0'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'before.json');manifest=js(E/'manifest.json');v=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792202912288595000.json');axioms=js(E/'axioms-1792202932278481000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert set(selected)==set(v['compiled'])==set(v['successfully_replayed'])==set(replay['modules'])
base={'worker':169,'request':'f8f306c0701a4692b57e05ac3c809fa5','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed/return0/report,1432.6816172599792 stored seconds. Twenty-one selected modules compiled/replayed and38 theorem closures printed. Auxiliary boundary closed; root and both new sign predicates open.',
 'scope':'Closed169 archive and explicitly named inherited/current counterparts only. Static parsing, hashes, literal syntax comparison and domain-index counts. No project/compiler/checker/proof/replay/experiment/CAS/generator/finalizer execution or mathematical-value recomputation. No source edits/proposer contact/research help. Active170 and later excluded; prior seals/windows unchanged.'}
def binding(rel):
 h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel];return h
pat=re.compile(r'(?m)^(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|protected|private|unsafe|partial)\s+)*(theorem|def|abbrev|instance|inductive)\s+(\w+)')
def parse(src):
 matches=list(pat.finditer(src));decls=[];th=[];defs=[]
 for i,m in enumerate(matches):
  kind,name=m.groups();end=matches[i+1].start() if i+1<len(matches) else src.rfind('\nend')
  block=src[m.start():end].strip();decls.append({'kind':kind,'name':name})
  row={'kind':kind,'name':name,'header':block.split(':=',1)[0].rstrip(),
   'block_sha256':hashlib.sha256(block.encode()).hexdigest(),'block_characters':len(block)}
  (th if kind=='theorem' else defs).append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 bad=[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
 return decls,th,defs,bad
new=[];structure=[];counts=Counter()
for module in selected:
 rel='research/'+module+'.lean';src=(A/rel).read_text();sh=binding(rel);decls,th,defs,bad=parse(src);assert not bad
 attempts=[(p,d) for p,d in builds if module in d.get('modules',{})]
 successes=[(p,d) for p,d in attempts if d.get('returncode')==0 and d['modules']=={module:sh}]
 assert len(successes)==1 and sha(successes[0][0].with_suffix('.lean'))==sh
 op='evidence/markov-f8f306c0/'+module+'.olean';oh=binding(op)
 assert sh==v['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==v['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],
   'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),
   'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in169':True,'printed_in169':True,
  'object_path':op,'object_sha256':oh,'successful_build':str(successes[0][0].relative_to(A))}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),
  'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':38,'def':18} and len(axioms['declarations'])==38
prior=js(T/'markov_worker_000168_mathematical_source_hashes.json');older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed168_sha256':h,'initial169_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in169':False})
assert len(older)==len({x['path'] for x in older})==398
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],
  'whole_old_module_recovery_in169':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational']:
 rel='research/markov-f8f306c0-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['source_experiment_f8f306c0.py','absorbed_structure_f8f306c0.py','relaxed_edge_probe_f8f306c0.py',
 'generate_boundary_f8f306c0.py','run_pair_edge_f8f306c0.py','run_pair_edge_reduced_f8f306c0.py','run_source_experiment_f8f306c0.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,
  'executed_or_imported_by_auditor':False})
for name in ['pair_edge_f8f306c0.g','pair_edge_reduced_f8f306c0.g']:
 rel='research/'+name;scripts.append({'path':rel,'sha256':binding(rel),'language':'GAP','executed_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'executed_by_auditor':False,
  'scope':'Historical script identity. Named frame helper remains a current experiment import. No inherited script imported/executed by auditor.'})
assert len(inherited_scripts)==32
record_names=['absorbed-structure.json','source-experiment.json','source-progress.json','source-run-1792202911103514000.json',
 'source-interruption.json','relaxed-edge-probe.json','certificate-generation.json',
 'absorbed-boundary-linear-1792202563104857000.json','absorbed-boundary-linear-1792202717095464000.json',
 'absorbed-boundary-linear-1792202806357748000.json']
data={name:js(E/name) for name in record_names}
for name in record_names:
 rel='evidence/markov-f8f306c0/'+name;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
interrupted='evidence/markov-f8f306c0/interrupted-source-experiment.py'
ast.parse((A/interrupted).read_text());records.append({'path':interrupted,'sha256':binding(interrupted),'bytes':(A/interrupted).stat().st_size})
assert sha(A/interrupted)==data['source-interruption.json']['source_sha256']
assert data['source-run-1792202911103514000.json']['source_sha256']==sha(A/'research/source_experiment_f8f306c0.py')
# Literal renamed definitions and syntactic certificate shapes only; no generated polynomial is evaluated.
oldcert=P/'.control/markov/workers/000168/artifacts/research/MarkovAbsorbedBoundaryCertificateM418.lean'
assert sha(oldcert)==next(x['sha256'] for x in oldexcluded if x['module']=='MarkovAbsorbedBoundaryCertificateM418')
old=oldcert.read_text();certificate_shapes=[];generation=data['certificate-generation.json']
for entry in generation:
 module=entry['module'];tag=module.removeprefix('MarkovBoundary').removesuffix('MF8F');name='absorbedBoundary'+tag+'MF8F'
 src=(A/('research/'+module+'.lean')).read_text()
 oldblock='def absorbedBoundary'+tag+'M418'+old.split('def absorbedBoundary'+tag+'M418',1)[1].split('\ntheorem ',1)[0]
 newblock='def '+name+src.split('def '+name,1)[1].split('\ntheorem ',1)[0]
 assert re.sub(r'\s','',oldblock.replace('M418','MF8F'))==re.sub(r'\s','',newblock)
 numline=next(x for x in src.splitlines() if x.startswith(' let num : ℚ := '));num=numline.split(':=',1)[1].strip()
 denline=next(x for x in src.splitlines() if x.startswith(' let den : ℚ := '));den=denline.split(':=',1)[1].strip()
 assert den==entry['denominator']
 assert re.fullmatch(r'[0-9xgz()+*/\s]+',num)
 tree=ast.parse(num,mode='eval');allowed=(ast.Expression,ast.BinOp,ast.Add,ast.Mult,ast.Div,ast.Name,ast.Load,ast.Constant)
 assert all(isinstance(node,allowed) for node in ast.walk(tree))
 assert all(node.id in ['x','g','z'] for node in ast.walk(tree) if isinstance(node,ast.Name))
 for node in ast.walk(tree):
  if isinstance(node,ast.BinOp) and isinstance(node.op,ast.Div):
   assert isinstance(node.left,ast.Constant) and isinstance(node.right,ast.Constant)
   assert re.fullmatch(r'\d+',ast.get_source_segment(num,node.left))
   assert ast.get_source_segment(num,node.right)=='2'
 rational_literals=re.findall(r'\(\d+/2\)',num)
 plain_num=re.sub(r'\(\d+/2\)','R',num)
 numeral_tokens=re.findall(r'\d+',plain_num);nonzero_tokens=[x for x in numeral_tokens if x!='0']
 coefficient_literal_count=len(nonzero_tokens)+len(rational_literals)
 assert coefficient_literal_count==entry['terms']
 assert 'have hn : 0 ≤ num := by dsimp [num]; positivity' in src
 assert 'have hd : 0 < den := by dsimp [den]; positivity' in src
 assert all(f'have h{i} : x+{i}≠0 := by positivity' in src for i in range(5,14))
 assert 'field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]' in src and 'ring' in src
 certificate_shapes.append({'module':module,'renamed_old_definition_text_identical':True,
  'old_definition_status':'Historical timeout-only source, not an imported accepted module; old theorem not replayed.',
  'numerator_line_sha256':hashlib.sha256(numline.encode()).hexdigest(),'numerator_characters':len(num),
  'numerator_grammar':'Unsigned numeral tokens, literal fractions with denominator token2,x,g,z,+,*,parentheses; AST parsed, never evaluated.',
  'integer_literal_count':len(nonzero_tokens),'rational_literal_count':len(rational_literals),
  'nonzero_coefficient_literal_count':coefficient_literal_count,'saved_term_count':entry['terms'],
  'saved_degree_only':entry['degree'],'denominator_text':den,'positive_numerator_denominator_and_identity_proof_steps_present':True,
  'long_literal_omitted_from_display':len(numline)>900,'mathematical_values_recomputed':False})
assert len(certificate_shapes)==12
# Finite domain indices only. No program functions, binomials, coefficients, ratios or signs evaluated.
source=Counter();qs=data['source-experiment.json']['q_values'];assert qs==[1,2,5,6,10,20,40,64,80,96]
for q in qs:
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+1;d=q-(2 if r else 1);source['source_cases']+=1
  if q>=2:
   source['formula_source_cases']+=1
   for i in range(n+7):source['coefficients']+=1;source['index_zero_region_positions']+=i<2 or i+j>n+2
  for i in range(n+5):
   source['triples']+=1
   source['polygon_triples']+=all(3*n<=n*k+3*j and k+j<=n+2 for k in [i,i+1,i+2])
   source['window_triples']+=q>=2 and 7<=i<=d+2
for key in ['coefficients','triples','polygon_triples','window_triples']:assert source[key]==data['source-experiment.json'][key]
assert source['index_zero_region_positions']==data['source-experiment.json']['zeros']==772
structure_counts=Counter()
for d in range(5,41):
 for j in [d+2,d+3]:
  for t in range(4,d):
   structure_counts['parameter_cases']+=1;structure_counts['full_extended_checks']+=2*j+1
   structure_counts['border_ratios']+=t+1;structure_counts['successive_border_comparisons']+=t
   for m in range(2,j+1):structure_counts['normalized_steps']+=m-1
for key in ['full_extended_checks','border_ratios','normalized_steps']:assert structure_counts[key]==data['absorbed-structure.json'][key]
relaxed=sum(j-1 for t in range(4,21) for j in range(2,31));assert relaxed==data['relaxed-edge-probe.json']['checks']==7395
progress=data['source-progress.json'];assert progress=={k:value for k,value in data['source-experiment.json'].items() if k!='seconds'}
source_run=data['source-run-1792202911103514000.json'];lines=source_run['stdout'].splitlines()
assert lines[:-1]==['completed q '+str(q) for q in qs] and json.loads(lines[-1])==data['source-experiment.json']
gap=data['absorbed-boundary-linear-1792202563104857000.json'];out=gap['stdout']
assert gap['returncode']==0 and gap['stderr']=='' and gap['source_sha256']==sha(A/'research/pair_edge_f8f306c0.g')
assert out.startswith('numerator terms=24434 negative=0\ndenominator terms=22589 negative=0\n')
literal_num=out.split('numerator=',1)[1].split('\ndenominator=',1)[0]
literal_den=out.split('\ndenominator=',1)[1]
# JSON parsing and alternating-list lengths only; no coefficient arithmetic or sign evaluation.
num_list=json.loads(literal_num);den_list=json.loads(literal_den)
assert len(num_list)==24434*2 and len(den_list)==22589*2
assert all(isinstance(x,list) for x in num_list[::2]+den_list[::2])
gap_counts={'numerator_literal_term_pairs':len(num_list)//2,'denominator_literal_term_pairs':len(den_list)//2,
 'reported_negative_counts_only':[0,0],'mathematical_values_recomputed':False,
 'scope':'Alternating exponent-list/coefficient-literal count; full polynomial meaning, signs, factorization and denominators not recomputed. No Lean certificate/source transport.'}
failed=data['absorbed-boundary-linear-1792202717095464000.json'];timeout=data['absorbed-boundary-linear-1792202806357748000.json']
assert failed['returncode']==0 and "Variable: 'dPrint' must have a value" in failed['stderr']
assert timeout['timeout'] is True and timeout['source_sha256']==sha(A/'research/pair_edge_reduced_f8f306c0.g')
assert failed['source_sha256']!=timeout['source_sha256']
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines()];event_bindings=[]
for name in ['absorbed-structure.json','relaxed-edge-probe.json','certificate-generation.json']:
 expected=data[name];hits=[]
 for n,event in enumerate(events,1):
  item=event.get('item',{})
  if item.get('exit_code')!=0:continue
  raw=item.get('aggregated_output','')
  for candidate in [raw]+raw.splitlines():
   try:parsed=json.loads(candidate)
   except (ValueError,TypeError):continue
   if parsed==expected:hits.append(n);break
 assert hits,(name,hits)
 event_bindings.append({'record':name,'events':hits,'complete_JSON_matches':True})
for name in ['source-run-1792202911103514000.json','absorbed-boundary-linear-1792202563104857000.json',
 'absorbed-boundary-linear-1792202717095464000.json','absorbed-boundary-linear-1792202806357748000.json']:
 record=data[name];matches=[]
 for n,event in enumerate(events,1):
  item=event.get('item',{})
  if item.get('exit_code')!=0:continue
  if name=='absorbed-boundary-linear-1792202563104857000.json' and n==145:
   rendered=json.dumps(record)+'\n';omitted=len(rendered.encode())-1048576
   expected=rendered[:524288]+f'\n... {omitted} bytes omitted ...\n'+rendered[-524288:]
   assert item.get('aggregated_output','')==expected and omitted==1482519
   matches.append({'event':n,'stdout_scope':'Retained event JSON middle-truncated; exact first/last524288 characters match saved receipt serialization.',
    'omitted_bytes':omitted,'full_event_JSON_equality_claimed':False})
   continue
  try:parsed=json.loads(item.get('aggregated_output',''))
  except (ValueError,TypeError):continue
  small={k:(value[:200] if k=='stdout' else value) for k,value in record.items()}
  if parsed==record:matches.append({'event':n,'stdout_scope':'full'})
  elif parsed==small:matches.append({'event':n,'stdout_scope':'first200characters; full stored receipt separately hash-bound'})
 assert matches,(name,'no binding')
 event_bindings.append({'record':name,'matches':matches})
interruption_hits=[n for n,event in enumerate(events,1) if event.get('item',{}).get('exit_code')==130 and
 'KeyboardInterrupt' in event.get('item',{}).get('aggregated_output','')]
assert interruption_hits==[191]
waiting={'receipt_only_checks':[{'observed_epoch':1792203144.071289,'observed_utc':'2026-10-17T02:12:24.071289+00:00','status':'final',
 'bytes':23007,'sha256':'1e97729361a5a2b95ac281c1531ef2288b597103a0dc48da2e2c3dcb5224d989'}],
 'waits':[],'absent_checks':0,'deadline_utc':'2026-10-17T02:18:18.728263+00:00','cutoff_utc':'2026-10-17T02:28:18.728263+00:00',
 'scope':'First exact receipt-only check was already final; no waits, repeated checks or active169 math reads.'}
assert sha(W/'receipt.json')==waiting['receipt_only_checks'][0]['sha256']
residual={'root_open':True,'new_unconditional_raw_LC_region':False,'absorbed_h_equals_t_boundary_proved':True,
 'boundary_range':'All natural d,t,k,bothr,4<=t<d; j=d+2,c4 false orj=d+3,c8 true. Clamp d=t+1 included.',
 'root_equivalence_unchanged':'Conjecture63 iff FirstCorrectionWindowM418 and ThreeBeyondCorrectionM418 and OtherFourM9E2.',
 'all_three_root_residual_conjuncts_unproved':True,'AbsorbedUncutMF8F_unproved':True,
 'AbsorbedBorderMF8F_unproved':True,'AbsorbedBorderMarginMF8F_unproved':True,'BorderDominanceMF8F_unproved':True,
 'exact_auxiliary_equivalence':'AbsorbedMiddleM418 iff AbsorbedInteriorBandMF8F iff (AbsorbedUncutMF8F and AbsorbedBorderMF8F); Border iff BorderMargin.',
 'BorderDominance_only_sufficient':True,'GAP_relaxed_edge_candidate_unvalidated':True,
 'actual_raw_source_counterexample':False,'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,
 'old168_failed_modules_retroactively_recovered':False}
h={**base,'new_sources':new,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'result_bindings':records,
 'imported_libraries':libs,'new_imported_libraries':[],'imported_four_functions':four,
 'certificate_literal_comparisons':certificate_shapes,'residual_binding':residual,'receipt_waiting':waiting,'all_named_new_match_current':True,
 'read_scope_notes':['Only closed169 archive enumerated; exact named inherited/current files read.',
 'All21 mathematical sources read; six long generated numerator lines omitted from display, hash-bound and AST-checked for syntactic shape only. All other theorem bodies read.',
 'Old168 failed certificate read as definition template only and unchanged hash-bound; no old compiler/replay/print upgrade.',
 'All7current numerical/generator/wrapper Python sources,2GAP scripts andinterrupted source snapshot read statically; none imported/executed.',
 'Large GAP output only first/tail displayed then literal-list parsed/count-bound; no polynomial/sign evaluation. Failed GAP source not separately retained; receipt hash differs from final.',
 'No fresh source literature review or inherited-proof redo. Older sealed mathematical correspondence retained.']}
s={**base,'new_modules':structure,'excluded_modules':[],'accepted_counts':dict(counts),'excluded_counts':{},
 'source_scope':'No new unconditional raw inequality region; auxiliary h=t positivity for actual first-correction parameter relations. Conditional raw H remainsallq>=1,bothr,allnaturali inclzeros.',
 'boundary_scope':residual['boundary_range'],
 'certificate_scope':'12rationalnonnegativity certificates: s2/3, mode0 d=t+2+g/mode1d=t+1,3gaps, t=x+4,B=z+j+1, x,g,z>=0. Old168 definition text retagged exactly; newproofs ordinary positivity+denominator nonzero+field_simp/ring. Natural clamp used inactualsourcebridge, no negative a2 substitution.',
 'parameter_bridge_scope':'Four universal naturalv,g,k bridges; t=v+4, d=t+2+g ort+1,j=d+s. BinomialB=choose(t+j+3,j), z=B-j-1>=0 fromaccepted base_choose_lowerM418. Mode1g parameter unused, no missingcase. Source summary splits d=t+1 versusd>=t+2 exhaustively.',
 'localization_scope':'All naturald,j,t,h,k,arbitraryrealc: k<t+h gap equalsoldliftcutgap and is nonnegative; k>2t+2 zero. Noh<=t assumption needed forlow/hightheorems. Natural degree support andallzeros retained.',
 'band_scope':'AbsorbedMiddle iff Bandforall d,t,h,k,r with4<=t<d,h<t,t+h<=k<=2t+2. Acceptedh=t closesboundary; lower/highcoefficients handled bylocalization. Bandunproved.',
 'two_tests_scope':'Generic cut-gap comparison requires nonnegativeA,C and Bcoeffzeroabove n, withn+h<=k; no Bnonnegative premise or division. Sourceappliesn=t+1,c>=0,k>t+h. ExactMiddle iff UncutandBorder, withUncut t<=k<=2t+2 andBorderh<t,k=t+h,all4<=t<d bothr.',
 'margin_scope':'For arbitraryrealc,h<=t exactperturbationidentity; border coeff=t+h equalsoldliftgap minus absorbedExtra(d,t,c)*liftTerm(j,t+2,t+2-h). Border iff quantitativeMargin; nonnegativeoldgapalone doesnotdischarge it.',
 'dominance_scope':'Unproved genericj,t,h condition4<=t,t+3<=j,h<=t comparesoldboundarygap*L(j,t+2,t+2-h) witholdhgap*L(j,t+2,2). Sourceimplication usesproved strictpositiveL(j,t+2,2) andnonnegativeotherfactor; conditionalHU+HD yieldsallfirstcorrectionH,rootalsohb+h4.',
 'root_scope':'Inherited168 exactthree-conjunct rootiffunchanged. Originalrawintegerindices i,i+1,i+2,rowq+1; q1handledinheritedall-rowtransport, notq>=2factorization. Originalpolygon/zeros/endpoints remainviaunchangedroot; previouslyprovedendpoint/a<=2families are notnewlyopen.',
 'pending_scope':'No additional currentLean mathematical candidate outside21selected. Unprovedpredicates are definitions withconditionaltheorems. Relaxededge/GAP expressionhasnoLeanvalidation orsourcebridge; failedCASreductionconfersnone.',
 'certificate_literal_comparisons':certificate_shapes,'mathematical_values_recomputed':False}
f={**base,'source_experiment':{'counts':dict(source),'saved_record':data['source-experiment.json'],
 'domain':'Tenqvalues[1,2,5,6,10,20,40,64,80,96],bothr:20sourcecases/triples,18formula/zerocasesexcludingq1. i0..n+6,triples0..n+4. Indexzeroregioni<2 ori+j>n+2. No coefficient evaluated.',
 'progress':progress,'full_run_receipt':source_run,'completed_q_sequence':qs},
 'structure_probe':{'counts':dict(structure_counts),'saved_record':data['absorbed-structure.json'],
 'domain':'d5..40,j=d+2/c4 ord+3/c8,t4..d-1. Threeextended Larrays m0..j; gapcoeff m0..2j. Borderratiosm2..t+2; successivecomparisoncount excludesfirstvalue perparameter. Pairtestm2..j,n0..m-2.',
 'scope':'Complete extended kernelarrays include indicesbeyond the source reversedkernel degree; auxiliary finite experiment, not directsource/uncut theorem. Failurelistscapped12. Ratios and signs not recomputed.'},
 'relaxed_probe':{'checks':relaxed,'saved_record':data['relaxed-edge-probe.json'],
 'domain':'t4..20,j2..30,m2..j; Brelaxedtoj+1 andbothcorrections replacedby8j/(t+1). Auxiliaryparameterrange not restrictedtoactualsource. Interactiveandlaterfileexecutionseparate.'},
 'generation':{'saved_report':generation,'literal_certificate_shapes':certificate_shapes,
 'scope':'Savedterm/degree/denominatorcandidate report. Nonzero coefficient-literal token counts anddenominatorstringschecked; numerator divisions are literal fractions with denominator token2. Degrees/signs/algebra not recomputed. Actualfinalbuild/replay/prints governformalcredit.'},
 'gap_records':{'successful_summary':{k:value for k,value in gap.items() if k!='stdout'},'literal_counts':gap_counts,
 'failed':failed,'timeout':timeout,
 'scope':'Initial24,434/22,589 literalterm lists countedonly; reportednegative0notrecomputed. dPrint errorreturns0 butfails, oldsourcehashnotfinalandnosnapshotretained. Correctedgcdtimesout60seconds. No Lean/sourcepositivityclaim.'},
 'interrupted_source_scan':{'record':data['source-interruption.json'],'snapshot':records[-1],
 'exit130_events':interruption_hits,'domain':'Plannedq1..96cumulative butinterrupted; no completedcasecount credited or extrapolated. Laterselectedqscan separate.'},
 'event_bindings':event_bindings,'records':records,
 'runtime_limits':'Sourceandstructure programs main-guarded. Relaxedprobe,generatorandthreewrappers top-level. Inheritedframe/helpermain guards retained. None imported/executed by auditor.',
 'mathematical_values_recomputed':False}
for suffix,obj in [('mathematical_source_hashes.json',h),('source_structure_audit.json',s),('finite_domain_audit.json',f)]:
 p=T/('markov_worker_000169_'+suffix);assert not p.exists();p.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
 print(json.dumps({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}))
