"""Static audit parsing/hashes and input-domain counts. Never imports project code."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import json,hashlib,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000156';A=W/'artifacts';E=A/'evidence/markov-e9cdd527'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
base={'worker':156,'request':'e9cdd527ea604fdcb514caecc8cc9944','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'TIMEOUT/return0/null report. Partial validation; full root open.',
 'scope':'Completed156 archive and explicit named inherited/current counterparts only. Static parsing, hashes and input-index counts. No project/proof/checker/replay/experiment/finalizer/generator execution, mathematical-value recomputation, project edit, proposer contact or research help. Active157 excluded. Earlier seals remain final.'}
before=js(E/'before.json');receipt=js(W/'receipt.json');selection=js(E/'mathematical-modules.json')
early=js(E/'replay-1792179675728967000.json');last=js(E/'replay-1792180597567945000.json')
assert receipt['outcome']=='timeout' and receipt['report'] is None
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
counts=Counter();rcounts=Counter();new=[];mods=[]
for module in selection:
 rel='research/'+module+'.lean';src=(A/rel).read_text();h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==last['modules'][module]
 matched=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules'].get(module)==h]
 assert len(matched)==1
 bp,bd=matched[0];assert sha(bp.with_suffix('.lean'))==h
 op='evidence/markov-e9cdd527/'+module+'.olean';oh=sha(A/op)
 assert oh==sha(P/op)==receipt['changes'][op]['after']
 replayed=module in early['modules'];assert not replayed or early['modules'][module]==h
 matches=list(re.finditer(r'(?m)^(theorem|def|abbrev)\s+(\w+)',src));decl=[];statements=[];defs=[]
 for k,x in enumerate(matches):
  kind,name=x.groups();counts[kind]+=1
  if replayed:rcounts[kind]+=1
  decl.append({'kind':kind,'name':name});end=matches[k+1].start() if k+1<len(matches) else src.index('\nend',x.end());block=src[x.start():end].strip()
  if kind=='theorem':
   z=re.search(r':=\s*by\b|:=\s*\n',block);assert z,(module,name);statements.append(block[:z.start()].rstrip())
  else:defs.append(block)
 status='compiled and early replay passed; no theorem-print coverage' if replayed else 'compiled only; no successful replay or theorem-print coverage'
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,'status':status,
  'declarations':decl,'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,
  'successful_final_build_sha256':sha(bp),'early_replay_selected':replayed,'full_validation_accepted':False}
 new.append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':statements,'definitions':defs,
  'forbidden_tokens':[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]})
assert len(new)==12 and counts=={'theorem':44,'def':16} and rcounts=={'theorem':30,'def':9}
assert not any(x['forbidden_tokens'] for x in mods)
prior=js(T/'markov_worker_000155_mathematical_source_hashes.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 older.append({'module':d['module'],'path':rel,'sha256':h,'before156_sha256':before[rel],
  'sealed155_sha256':d['sha256'],'new_replay_inferred':False,'prior_status':d.get('status','inherited')})
assert len(older)==len({x['path'] for x in older})==222
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:
 assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-e9cdd527-{tag}.md';h=sha(A/rel);assert h==sha(P/rel)
 docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['low_probe','row_probe','shape_probe','alternate_shape','boundary_probe','domain_certificate']:
 rel=f'research/{tag}_e9cdd527.py';h=sha(A/rel);assert h==sha(P/rel)
 scripts.append({'path':rel,'sha256':h,'current_match':True,'executed_by_auditor':False,
  'main_guarded':tag not in ['boundary_probe','domain_certificate'],'is_lean_generator':tag=='domain_certificate'})
inherited_scripts=[]
for d in [next(x for x in prior['new_scripts'] if x['path']=='research/sparse_probe_96ada19b.py')]+prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 inherited_scripts.append({'path':rel,'sha256':h,'sealed155_match':True,'main_guarded':True,'executed_by_auditor':False})
recordnames=['low-experiments.json','row-experiments.json','shape-experiments.json','alternate-shape-experiments.json','first-tail-experiments.json']
data={n:js(E/n) for n in recordnames}
for n in recordnames:
 rel='evidence/markov-e9cdd527/'+n;h=sha(A/rel);assert h==sha(P/rel)
 records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(72,'low-experiments.json'),(101,'row-experiments.json'),(114,'shape-experiments.json'),(126,'alternate-shape-experiments.json'),(167,'first-tail-experiments.json')]:
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n]
 bindings.append({'event':num,'record':n,'command':it['command'],'all_printed_fields_exact_match':True})
# Input-index counts only. No coefficient, binomial, recurrence, sign or gap evaluation.
low=Counter();domains=[]
for q in range(1,101):
 for r in [False,True]:
  n=3*q+(1 if r else 2);row={'q':q,'r':r,'n':n,'lower_rows':q+1,'full_triple_starts':n+3}
  if q<=16:low['source_comparisons']+=5*(n+5)
  low['lower_comparisons']+=2*(q+1);low['lower_triples']+=q-1;low['all_column4_triples']+=n+3
  low['outside_expression_positions']+=len(range(q+1,min(q+5,n+3)));domains.append(row)
for k in ['source_comparisons','lower_comparisons','lower_triples','all_column4_triples']:assert low[k]==data['low-experiments.json'][k]
assert dict(low)=={'source_comparisons':5120,'lower_comparisons':20600,'lower_triples':9900,'all_column4_triples':31200,'outside_expression_positions':800}
rows=Counter()
for q in range(1,21):
 for r in [False,True]:
  n=3*q+(1 if r else 2)
  rows['solve_positions']+=(n+3)*(q+1)
  for j in range(q+1):
   rows['factorization_rows']+=1;rows['division_steps']+=n-2*j-1
   rows['residual_coefficient_positions']+=j+1;rows['adjacent_triple_positions']+=max(j-1,0)
   if q in [3,5,10] and j<=5:rows['printed_sample_rows']+=1
assert rows['factorization_rows']==data['row-experiments.json']['checks']==460
assert rows['printed_sample_rows']==len(data['row-experiments.json']['rows'])==32
naive=2*22*(21*21-1);assert data['shape-experiments.json']['counts']==[naive]*3
alternate=Counter()
for i in range(3,25):
 for j in range(25):
  for k in range(25):
   alternate['unfiltered_base_points']+=1
   if 2*j+3<=i+k:alternate['nonnegative_test_positions']+=1
   for label,bound in [('row_lc',7),('column_lc',3),('minor',5)]:
    if 2*j+bound<=i+k:alternate[label]+=1
assert [alternate[k] for k in ['row_lc','column_lc','minor']]==data['alternate-shape-experiments.json']['counts']==[5503,6600,6050]
assert data['first-tail-experiments.json']['checks']==200*2*3 and data['first-tail-experiments.json']['crossing_triples']==200*2
# Literal generated proof-table validation: parse saved values, never derive them.
src=(A/'research/MarkovLowerDomainME9C.lean').read_text()
table=re.findall(r' have h(\d+)_(\d+) : lowerRawME9C 5 (\d+) (\d+)=\((-?\d+):ℤ\) := by',src)
assert len(table)==20 and [(int(a),int(b)) for a,b,_,_,_ in table]==[(i,j) for i in range(5) for j in range(4)]
assert all(a==c and b==d for a,b,c,d,_ in table)
prefix=src[:src.index('theorem lower_kernel_outside_negativeME9C')]
tail=src[src.index('theorem lower_kernel_outside_sourceME9C'):]
proof='theorem lower_kernel_outside_negativeME9C : lowerKernelME9C 4 3 0= -29 := by\n';names=[]
for a,b,_,_,val in table:
 name=f'h{a}_{b}'
 proof+=f' have {name} : lowerRawME9C 5 {a} {b}=({val}:ℤ) := by\n'
 proof+=f'   have h := lower_raw_equationME9C 5 {a} {b}\n'
 proof+='   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose'+(' ,'+','.join(names) if names else '')+'] at h\n'
 proof+='   linarith only [h]\n';names.append(name)
proof+=' exact h4_3\n\n';assert src==prefix+proof+tail
unbounded_header=next(x for row in mods for x in row['theorem_statements'] if x.startswith('theorem low_gain_unbounded'))
assert 'let path := threePathM9E2 (j+1) r' in unbounded_header
math={**base,'new_sources':new,'compiled_counts':dict(counts),'replayed_counts':dict(rcounts),'fully_accepted_counts':{},
 'printed_theorem_closures':0,'compiled_only_modules':[r['module'] for r in new if not r['early_replay_selected']],
 'unbuilt_modules':[],'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,
 'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,
 'residual_binding':{'root_path':'research/MarkovLowResidualME9C.lean','root_sha256':sha(A/'research/MarkovLowResidualME9C.lean'),
  'root_equivalence':'Conjecture63 iff ThreeRemainingME9C and OtherFourM9E2',
  'status':'compiled and seven-module replay passed; no printed axiom closure or finalization',
  'conditional_root_path':'research/MarkovLowerReductionME9C.lean','conditional_root_sha256':sha(A/'research/MarkovLowerReductionME9C.lean'),
  'conditional_status':'compiled only; combined replay/Audit timed out',
  'root_open':True,'both_main_residual_conjuncts_unproved':True,'all_shape_premises_unproved':True},
 'all_named_new_match_current':True,'read_scope_notes':[
  'Enumerated completed156 archive only; current reads use explicit names from completed records and sealed155 metadata. No active157 reads.',
  'Read all12 new mathematical sources,6 prose records and6 scripts. Selected inherited body reads: KernelShapeM4F4; BinomialPolyM0D3; first90 lines BinomialTableM295 containing used degree3/4 identities. Earlier source/root bridges retain155 audit provenance.',
  'No156 finalizer/index/axiom output is assumed from anticipatory prose. Ordinary compiled-import and old212/Window limitations remain.']}
struct={**base,'new_modules':mods,'compiled_counts':dict(counts),'replayed_counts':dict(rcounts),'fully_accepted_counts':{},'printed_theorem_closures':0,
 'source_scope':'Every actual numerator3 path has q>=1,b=3q+1 true or3q+2 false. LowSource equalities at i3/i4 hold for all naturalj<=q includingj=q; no extra formula/shape premise. Actualsource adapter maintains exactlabels. q0 is algebraic only.',
 'difference_scope':'For j<n, positive-column fibRaw formula is extended through zero upper tail via choose_eq_zero; no assumptioni+j<=n. Second n difference zero incolumns0,1,2; at i+3 equals C(n-j-1,i)C(i+3+j,i+3). Natural subtraction/casts guarded byj<n. Rational polynomial binomial substitutions are exact, not coefficient normalization.',
 'forcing_scope':'Atj<=q the shifted4U V^(q+1) correction vanishes byguard. S-shift expansion gives column3/4 forcing, separately treatingj0,j1 andj+2. Outsidepolygon givesi<=2 zeros at allj<=q foractualq>=1. Finiteinterval second-difference uniqueness withinitialj0 andj1 proves both sourceformulas.',
 'strict_lc_scope':'Inherited lowerCandidate is exactly rawcolumn4 inrange. Positive34-termgap andpositiveprefactor strengthen rational LC tostrict underx>=0,q>=x+2,c>=0. All3rawidentities apply atj,j+1,j+2 whenj+2<=q; exact rational-to-integer cast yieldsstrict rawV. q1 noadmissiblestart; q>=2 anynaturalj<=q-2, bothresidues,no denominatorbound. Sourcecoefficients retainzeros in allgeneral identities, no divisionby rawentry.',
 'root_scope':'ThreeRemaining retains every H/D and V wheneveri!=4 ORq<j+2; exactiff usesnewstrictLC onlyexcludedregion. OtherFour unchanged. Originalpolygon/zeros/endpoints inherited. Unboundedwitness q=j+2,paththreePath(j+1,r) proves all3polygonmembers andstrictgap for everyj; no theorem excludes allprevioussufficientcriteria.',
 'uniform_scope':'lowerForce(n)=Sshift twice fibDelta, lowerRaw solves signeddiscriminant, lowerKernel(i,j,k)=lowerRaw(i+j+k-2,i,j). Restricteduniqueness over allcolumns,j<=q yieldslowerRaw(sourceN)=threeRaw forallq/r,i,jinrange; no shapeassumption. Sourceadapterq>=1. Kernelidentity requiresi+j+k=sourceN+2 before natural subtraction.',
 'shape_scope':'LowerShape(i) requiresstrictpositivity at2j+3<=i+k; rowLC at2j+7<=i+k; columnLC at2j+3<=i+k; minor at2j+5<=i+k. These premises remainunproved. Importedminor_diagonal_glue usespositivepivot tocancel its square. SourceV mapped tokernelantidiagonal(j,k+2),(j+1,k+1),(j+2,k), withk=n-i-j onlywheni+j<=n. Smalli<=2 anddegree-taili+j>n handledbyactualzero before reparameterization. Uniformhs all i>=3 implieslowerV startsj+2<=q, notrootalone.',
 'conditional_residual_scope':'Exactrootiff LowerVerticalThree AND OutsideLowerThree AND OtherFour; all3unproved. OutsideLower retains allH/D andVq<j+2. Shape sufficient onlyforfirstconjunct, never claimed equivalent tofullroot or discharged.',
 'obstructions_scope':'Compiled+earlyreplayed actual3/4 coefficient(4,2)=15 versuscandidate7; rawV[3,14,15]polygonvalid andstrictLC. Compiled-onlynaiveminor=-42 forallnatural d>=1,bothr; fourentries span3sourcesq=d,d+1,d+2, noonesourceLCrefutation. Compiled-onlyoutsidewedgeK4(3,0)=-29 versusactual3/5raw(4,3)=35, polygonvalid; j3>q1 andwedgefails. These do not refute originalconjecture.',
 'domain_certificate_scope':'20savedliteral lowerRaw5i j values, i0..4,j0..3; generator template andeachordereddependencyblock matchfinalsource tokens. Noauditvaluecomputation. Finaltablecompiled afterrejections, but no successfulreplay/axiomcoverage.',
 'validation_scope':'12compiled44theorems16defs. Sevenfinalsources30theorems9defs successfullyreplayed; five14theorems7defs compiledonly. All44unprinted;0fullyaccepted. Final12replay andAudit timedout, nofinalizer/deliveredreport. Historicaltimeout preserved.',
 'mathematical_values_recomputed':False}
finite={**base,'low_probe':{'counts':dict(low),'domains':domains,'saved_record':data['low-experiments.json'],
  'qualification':'q1..100bothbranches;solvei0..4,j0..n+4. Directcanonicalframecomparison onlyq<=16 (32sources5120positions). Loweri3/4j0..q20600; nonstrict lowerV9900 subsetof31200fulli4Vstarts0..n+2. Saved1200zerotriples not recomputed.800outsideexpressionpositions evaluated butonlyfirst12mismatchesstored; no totalmismatchcount. No polygon/nonzero filter.'},
 'ad_hoc_boundary':{'event':79,'q_range':[1,11],'branches':2,'positions':sum(3*q+c+1 for q in range(1,12) for c in [1,2]),
  'printed_lines':len(events[78]['item']['aggregated_output'].splitlines()),'qualification':'Allj0..n compared; prints firsttwo mismatches perfamily afterlistcomprehension, no earlybreak. Values retained onlyin eventstdout, not re-evaluated; overlapslowprobe.'},
 'row_probe':{'counts':dict(rows),'saved_record':data['row-experiments.json'],
  'qualification':'q1..20bothr,j0..q. Rawrow i3..n+2-j; divide by(1+u) exactlyn-2j-1 times, expectedresiduallengthj+1.460division/factorizationrows; residualnonnegative andnon-strictLC tested finiteonly. Any shortcircuit any/min outcomes notindependentlyrecomputed; adjacent positions countpotentialtests, allpassrecorded.32samplerows, not460printedarrays. No universalfactorization/sourcebridge/LC theorem.'},
 'naive_shape':{'per_component':naive,'total':3*naive,'precomputed_sources':88,'saved_record':data['shape-experiments.json'],
  'qualification':'i3..24,j,d0..20,bothr,excludej+d0. Threecoordinatecomparisons per19360basepoints. Failures lists capped16 percomponent, notfailuretotals. Fourminorentries drawq=d,d+1,d+1,d+2; auxiliarycross-sourceconditionnotrawsingle-sourceLC.'},
 'alternate_shape':{'counts':dict(alternate),'precomputed_n':[1,76],'precomputed_array_positions':76*25*27,'saved_record':data['alternate-shape-experiments.json'],
  'qualification':'i3..24,j,k0..24; allsixvaluesqueriedbeforewedgefilters. Row5503,column6600,minor6050 checks underexact7/3/5guards.6600negative-entrytests check a<0 only: excludesnegative finiteentries but DOES NOT test strictpositive0<KrequiredbyLowerShape. No zero tallyretained. No uniformshapeproof.'},
 'first_tail':{'coefficient_positions':1200,'crossing_triples':400,'saved_record':data['first-tail-experiments.json'],
  'qualification':'q1..200bothr,j=q+1,i2/3/4 correctionchecks, 3perfamily. Strict crossingVcolumn4startsq-1, violateslowerj+2<=q andremainsunproved. q1true exception no formalinverseargument supplied. Domainoverlapslowprobeatq<=100. Top-level script imports main-guardedLowProbe; no imported scanrerun.'},
 'domain_certificate':{'literal_rows':[{'i':int(a),'j':int(b),'value_literal':val} for a,b,_,_,val in table],
  'count':20,'final_generated_block_matches_literal_template':True,'generator_events':[184,199],
  'qualification':'Finalgenerator addsNat.choose at197; earliergeneratedtablebuildfails. Bothprints explicitly saynotyetvalidated. Auditor reconstructs textfromstoredliterals/dependencynames, never deriveslower values or executesgenerator. Lasttablelocallycompiledonly.'},
 'event_bindings':bindings,'records':records,'runtime_limits':'Allhelperimports aremain-guarded exceptstandaloneBoundary/Domain generator scripts. Savedsource/result/eventbindings only; no invocation-start/runtime-transitivehashmap, fresh interpreterauthentication or numericreexecution. Finite passed signs/zero counts retained, not recomputed.',
 'mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000156_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
 print(suffix,p.stat().st_size,sha(p))
print('compiled',dict(counts),'replayed',dict(rcounts),'old',len(older),'low',dict(low),'rows',dict(rows),'alternate',dict(alternate))
