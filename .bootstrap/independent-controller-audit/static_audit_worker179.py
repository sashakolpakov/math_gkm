"""Closed worker179: audit-owned static hashes, syntax and index-domain counts only."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000179';A=W/'artifacts';E=A/'evidence/markov-beca0ad5'
REQUEST='beca0ad5893a498d8ecc9af0fd97b9f0'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
receipt=js(W/'receipt.json');before=js(E/'input-hashes.json');manifest=js(E/'manifest.json');validation=js(E/'validation.json')
selected=js(E/'mathematical-modules.json');replay=js(E/'replay-1792218863987625000.json');axiom_records=[(p,js(p)) for p in sorted(E.glob('axioms-*.json'))]; axioms={'sources':{},'declarations':{}}
for p,d in axiom_records:
 for group in ['sources','declarations']:
  for key,value in d[group].items():
   if key in axioms[group]:assert axioms[group][key]==value
   axioms[group][key]=value
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
assert receipt['request_id']==REQUEST and receipt['outcome']=='completed' and receipt['returncode']==0 and receipt['report']['request_id']==REQUEST
assert set(selected)==set(validation['compiled'])==set(validation['successfully_replayed'])==set(replay['modules'])
base={'worker':179,'request':REQUEST,'created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed host outcome / return0 / structured report present / elapsed1504.6151270866394. Ten final mathematical modules compiled and jointly replayed,56 distinct theorem closures printed;18 rejected compiler attempts retained. Full root open.',
 'scope':'Archive-first closed179 and explicit named inherited/current counterparts only. Static hashes, source/record parsing, literal comparison and finite index-domain counts. No mathematical-value recomputation, project/proof/checker/replay/experiment/generator/finalizer execution/import, project edit or proposer help/contact. Active180 and later excluded. Earlier seals/windows unchanged.'}
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
 op='evidence/markov-beca0ad5/'+module+'.olean';oh=binding(op)
 assert sh==validation['compiled'][module]['source_sha256']==replay['modules'][module]==axioms['sources'][module]
 assert oh==validation['compiled'][module]['olean_sha256']
 assert all(x['name'] in axioms['declarations'] for x in th)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':sh,'declarations':decls,
  'attempts':[{'path':p.name,'sha256':sha(p),'source_sha256':d['modules'][module],'final_identical':d['modules'][module]==sh,'returncode':d.get('returncode'),'timeout':d.get('timeout',False),'snapshot_sha256':sha(p.with_suffix('.lean'))} for p,d in attempts],
  'status':'selected_replayed_printed','selected':True,'replayed_in179':True,'printed_in179':True,
  'object_path':op,'object_sha256':oh,'successful_final_build':str(success[0][0].relative_to(A)),
  'historical_successful_source_versions':sorted(set(d['modules'][module] for p,d in attempts if d.get('returncode')==0)),
  'earlier_successful_differing_source_versions':any(d['modules'][module]!=sh for p,d in attempts if d.get('returncode')==0)}
 counts.update(x['kind'] for x in decls);new.append(row)
 structure.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'theorem_statements':th,'definition_bindings':defs,'forbidden_tokens':bad})
assert counts=={'theorem':56,'def':20} and len(axioms['declarations'])==56

prior=js(T/'markov_worker_000178_mathematical_source_hashes.json')
older=[];oldexcluded=[];operational=[]
for row in prior['new_sources']+prior['named_older_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256'],rel
 older.append({'module':row['module'],'path':rel,'sha256':h,'sealed178_sha256':h,'initial179_sha256':h,
  'historical_status':row.get('status',row.get('historical_status','inherited')),'whole_old_module_recovery_in179':False})
assert len(older)==len({x['path'] for x in older})==546
for row in prior['excluded_modules']+prior['historical_pending_comparisons']:
 rel=row['path'];h=sha(P/rel);assert h==before[rel]==row['sha256']
 oldexcluded.append({'module':row['module'],'path':rel,'sha256':h,'status':row['status'],'whole_old_module_recovery_in179':False,'historical_absence_window_not_extended':True})
assert len(oldexcluded)==181
for row in prior['historical_operational_comparisons']:
 rel=row['path'];assert sha(P/rel)==before[rel]==row['sha256'];operational.append(row)
libs=prior['imported_libraries']+prior['new_imported_libraries'];four=prior['imported_four_functions']
for row in libs+[four]:assert sha(Path(row['source_path']))==row['source_sha256'] and sha(Path(row['object_path']))==row['object_sha256']
newlibs=[]
docs=[];scripts=[];inherited_scripts=[];records=[]
for tag in ['checkpoint','checkpoint-2','correspondence','mathematics','next','operational']:
 rel='research/markov-beca0ad5-'+tag+'.md';docs.append({'path':rel,'sha256':binding(rel)})
py_names=['probe_beca0ad5.py','reverse_certificate_beca0ad5.py','factor_reverse_beca0ad5.py','source_experiment_beca0ad5.py','stress_certificate_beca0ad5.py','validate_experiments_beca0ad5.py']
for name in py_names:
 rel='research/'+name;src=(A/rel).read_text();ast.parse(src)
 scripts.append({'path':rel,'sha256':binding(rel),'bytes':len(src.encode()),'main_guarded':"if __name__=='__main__'" in src,'executed_or_imported_by_auditor':False})
for row in prior['inherited_scripts']+prior['new_scripts']:
 rel=row['path'];assert sha(P/rel)==row['sha256']
 if rel in before:assert before[rel]==row['sha256']
 else:assert manifest[rel]==row['sha256']
 inherited_scripts.append({'path':rel,'sha256':row['sha256'],'in_initial_suffix_filtered_map':rel in before,'manifest_only_when_not_initial':rel not in before,'executed_by_auditor':False,'scope':'Historical identity only. Explicit source experiment dependencies are three_probe_9e205206,source_experiment_6576ccc5,source_experiment_9647c1ba; no imports or execution.'})
assert len(inherited_scripts)==92
record_names=['source-experiment.json','representation-experiment.json','reverse-certificate-probe.json','factored-reverse-certificates.json','certificate-stress.json','logconcave-weight-probe.json','increasing-lc-probe.json','increasing-lc-reproduced.json','small-weight-obstruction.json','small-increasing-obstruction.json','small-increasing-upper-obstruction.json','gap-experiment.json','source-visit.json']+[f'reverse-certificate-h{h}.json' for h in range(2,13)]
data={n:js(E/n) for n in record_names}
for n in record_names:
 rel='evidence/markov-beca0ad5/'+n;records.append({'path':rel,'sha256':binding(rel),'bytes':(A/rel).stat().st_size})
events=[json.loads(x) for x in (W/'events.jsonl').read_text().splitlines() if x.strip()]
event_bindings=[];decoder=json.JSONDecoder()
for n,value in data.items():
 if n=='source-visit.json' or value is None or n.startswith('reverse-certificate-h'):continue
 matches=[];projection_matches=[]
 for event_no,event in enumerate(events,1):
  item=event.get('item',{});out=item.get('aggregated_output','')
  for pos,ch in enumerate(out):
   if ch not in '[{':continue
   try:obj,end=decoder.raw_decode(out,pos)
   except (ValueError,TypeError):continue
   row={'event':event_no,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'start_character':pos,'end_character':end,'whole_stdout':out.strip()==out[pos:end]}
   if obj==value:matches.append(row)
   if isinstance(value,dict) and 'cases' in value and isinstance(value['cases'],list) and obj in value['cases']:projection_matches.append(row)
   if isinstance(value,list) and any(isinstance(z,dict) and obj=={k:v for k,v in z.items() if k!='polynomial'} for z in value):projection_matches.append(row)
 event_bindings.append({'record':n,'complete_saved_json_matches':matches,'projection_without_samples_matches':projection_matches,'scope':'Literal saved JSON binding only; no regeneration or command-time imported-version inference.'})
# Diagnostic module has duplicate names and is never selected/replayed/printed.
name='MarkovDetTestMBEC';rel='research/'+name+'.lean';src=(A/rel).read_text();dh=binding(rel);dd,dt,df,db=parse(src);assert not db
att=[(p,d) for p,d in builds if name in d.get('modules',{})];good=[(p,d) for p,d in att if d.get('returncode')==0 and d['modules'][name]==dh]
assert len(good)==1 and len(dt)==3 and len(df)==1 and name not in selected and name not in replay['modules'] and name not in axioms['sources']
dop='evidence/markov-beca0ad5/'+name+'.olean'
excluded=[{'module':name,'path':rel,'sha256':dh,'object_path':dop,'object_sha256':binding(dop),'status':'compiled_only_diagnostic_not_selected_not_replayed_not_printed','selected':False,'replayed_in179':False,'printed_in179':False,'declarations':dd,'theorem_statements':dt,'definition_bindings':df,'successful_final_build':str(good[0][0].relative_to(A)),'scope':'Shares weightDet/weight_positive_index/weight_det_forbidden names with selected WeightDeterminants; replay/print of that module does not validate this diagnostic module.'}]
gaprel='research/top_gap_beca0ad5.g';scripts.append({'path':gaprel,'sha256':binding(gaprel),'bytes':(A/gaprel).stat().st_size,'executed_by_auditor':False,'scope':'Retained GAP input read only; no CAS invocation.'})
# Index-domain counting only, no coefficients, signs, factorials, binomials, products or RNG.
qs=list(range(2,25))+[31,40];sc=Counter();tc=[0,0,0]
for q in qs:
 for r in [False,True]:
  a=3;b=3*q+(1 if r else 2);sc['fractions']+=1
  for k in range((q-(2 if r else 1))//2+1):
   d=q-2*k-(2 if r else 1);j=q+k+1;assert d>=0 and 2*j+1<=b
   sc['rows']+=1;sc['coefficients']+=b+6
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for z,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):tc[z]+=all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
assert all(sc[k]==data['source-experiment.json'][k] for k in sc) and tc==data['source-experiment.json']['raw_triples']
rc=Counter()
for j in range(1,41):
 for s in [0,1,4,10]:
  for h in range(j+1):
   for t in [s,s+2]:rc['reverse_formulas']+=1;rc['cleared_formulas']+=1
for h in range(2,13):
 for k in [0,1,3,10,50]:
  for s in [0,1,4,20]:rc['polynomial_identities']+=1
for a in range(17):
 for b in range(a+1):
  for c in range(b+1):
   for d in range(c+1):rc['determinants']+=1;rc['forbidden_zeros']+=c>=3
for j in range(3,121):
 for s in range(21):rc['top_gaps']+=1
assert all(rc[k]==data['representation-experiment.json'][k] for k in rc)
pc=[]
for case in data['reverse-certificate-probe.json']['cases']:
 h=case['h'];rows=data[f'reverse-certificate-h{h}.json'];assert len(rows)==case['terms']
 assert len({tuple(z[0]) for z in rows})==len(rows)
 pc.append({'h':h,'saved_sparse_row_count':len(rows),'saved_negative_count':case['negative'],'values_or_signs_recomputed':False})
assert sum(x['saved_sparse_row_count'] for x in pc)==3817
stress=data['certificate-stress.json']['cases'];assert [x['h'] for x in stress]==[13,14,16,18,20]
assert sum(x['terms'] for x in stress)==7989
factorrows=data['factored-reverse-certificates.json'];assert [x['h'] for x in factorrows]==list(range(2,13))
assert all(len(x['polynomial'])==x['terms'] for x in factorrows)
# Bind executed literal experiment stdout and command templates, never execute them.
commands=[]
for n,e in enumerate(events,1):
 item=e.get('item',{});c=item.get('command','')
 if item.get('type')=='command_execution' and e.get('type')=='item.completed' and any(z in c for z in ['increasing-lc','small-weight-obstruction','small-increasing','gap-experiment']):
  commands.append({'event':n,'item_id':item.get('id'),'exit_code':item.get('exit_code'),'command':c,'executed_by_auditor':False})
assert len(commands)==5
reads=[];oldmap={x['module']:x for x in older}
for name in ['MarkovUpperReductionMA45','MarkovWeightRepresentationMA45','MarkovAdjacentConvolutionM09F','MarkovOrderedConvolutionM09F','MarkovQKernelM7E2','MarkovTransposedKernelM657','MarkovThreeSourceM9E2']:
 row=oldmap[name];reads.append({'path':str(P/row['path']),'sha256':row['sha256'],'scope':'Sealed inherited proof/source audit reused; present179 identity comparison only. No fresh body replay or historical-window extension.'})
residual={'root_open':True,'new_unconditional_raw_LC_region':False,'new_unconditional_source_estimate':False,
 'root_equivalence':'Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2','remaining_predicates_unproved':['ThreeBeyondBandM657','OtherFourM9E2'],
 'UpperAdjacentMA45_proved':False,'ReverseCoreMBEC_proved':False,'ClearedCoreMBEC_proved':False,'CertificatePositiveMBEC_proved':False,'SharpCompleteMargin_proved':False,
 'closed_auxiliary_ranges':'New reversed h=2 for allj>=2,s and h=3 for allj>=3,s; inherited n<j and final n=2j-1. Hence all auxiliaryadjacency for j<=3. This j is auxiliary degree, not actualsource numerator.',
 'remaining_auxiliary_range':'ReverseCoreMBEC forallnaturalj,s,h,4<=h<=j reversed adjacent comparison; exactly equivalent to UpperAdjacentMA45 and ClearedCoreMBEC. h=2j-n for original upper j<=n,n+1<2j.',
 'sufficient_not_equivalent':'CertificatePositiveMBEC forallh>=4 alli,j nonnegativecoeff certificateGap h implies ClearedCore. Converse notproved and no rootiff claimed.',
 'conditional_source_LC':'Global ReverseCore or ClearedCore or CertificatePositive implies rawH for q,k,i natural,rBool,q>=2,2*(q+k+1)+1<=sourceNME9C q r; literal(i,j),(i+1,j),(i+2,j),j=q+k+1,allnaturalstarts/zeros.',
 'source_residues':'r=false:N=3q+2;r=true:N=3q+1;actualpath false^(q-1)++[true,r];q1excludedfromadapter.',
 'determinants':'All naturally ordered four-row partitions; determinantzeroiffthirdpart>=3,positiveotherwise. No generalSchur expansion or surviving coefficientpositivity theorem.',
 'auxiliary_obstruction':'Formal arbitrary nonnegative CrossLC weight shortcut false using[1,3,9,1],j3,s0,n3,gap-28620. No source-family identification/counterexample.',
 'actual_raw_source_counterexample':False,'old212_recovery_claimed':False,'old166_prefix_recovery_claimed':False,
 'prior_source_scope_unchanged':'Allactuala2 all3directions152;a3H3j<=N+9 inherited172;175band q>=2,q<j,2j+1<=N and(i<=5 orN<i+j+q). No clause removed179.'}
proof_details={
 'weight_determinants':'Integer shifted indices preserve negative-zero weight. Forbidden thirdpart>=3 follows affine firstthree rows independentlyof fourthrow. Rectangle b>=2,c<=2,d<=c and b<=a;hook a>=1,b<=1,c<=b,d<=c;empty0000 separate. Positivity/zeroiff assumes full partitionorder.',
 'second_top':'Scalar identity x>1,j>=1 gap128*j^2*(j-1)*(2*x+1)/(x^2*(x-1)*(x+1)^2*(x+2)). qsecondtop j=k+2,exact choose ratios/positive denominators; multiply nonnegative topbinomial products, no zero coefficient division.',
 'reverse_bridge':'K(j,s,r)=w(r)*fall(j,r)/fall(s+j+3,r),r<=h<=j. Fixedbound polynomialreflection degree<=j and choose identity convert productcoeff2j-h to positive topbinomials*reverseConv. h>=1 gives n+1=2j-(h-1). Cancel only strictly positive topbinomials.',
 'third_top':'j=k+3; gap=(k+2)(k+3)^2*explicit12term positivecertificate/[(k+s+4)(k+s+5)^2(k+s+6)^2(k+s+7)^3(k+s+8)]. Coefficients/signcertificate read from proof, no audit recomputation. Kernelthree formula requiresj>=2.',
 'core_glue':'h2andh3 exhausted by exact Nat inequalities;remaining4<=h<=j. qsmall allj<=3 uses lower/final/h2/h3. No actualsource j<=3 reduction or rootcompletion inferred.',
 'clearing':'clearedKernel integerWeight(r)*fall(j,r)*fall(s+j+3-r,h-r). h<=j,r<=h ensures factors/casts and positive falling denominators. ClearedConv uses SAME fixed h for coefficient m<=h,including h-1. ClearedGap sign exact via positive scale fall(s+j+3,h)*fall(s+j+4,h)^2*fall(s+j+5,h). No division by a coefficient.',
 'polynomial':'BiPoly ringeval outerU=k,innerV=s. Factors U+(h-i) andU+V+(h+3+t-r-i) use Nat subtractions, justified by i<r<=h andi<h-r. kernel eval requiresr<=h,convolutionm<=h; gap eval holds allnaturalh,k,sincludingh0. Coefficientwise nonnegative gives evalnonnegative fornaturalvariables using finitecoeffsum, no general hsign theorem.',
 'source_bridge':'Calls inheritedsource_band_of_upper with explicitglobalcore/certificate hypothesis. Nonsource auxiliaryweights never substitutedfor actualQ; root coefficients/polygon/zeros/endpoints unchanged.'}
S={**base,'new_modules':structure,'excluded_modules':excluded,'accepted_counts':dict(counts),'excluded_counts':{'theorem':3,'def':1},'mathematical_values_recomputed':False,'source_level_scope':residual,'proof_chain_details':proof_details,
 'literal_raw_indices':{'horizontal':['(i,q+k+1)','(i+1,q+k+1)','(i+2,q+k+1)']},'zero_and_endpoint_handling':'Reverseindices guardh<=j;positive factorial/binomial normalization only;finite sums include endpoints;h0allowedin cleared/gap eval notmistakenfor adjacency;actualraw naturalzeros and rootpolygon/endpoints retained.'}
F={**base,'mathematical_values_recomputed':False,'random_samples_regenerated':False,
 'source_experiment':{'q_values':qs,'residues':[False,True],'counts':dict(sc),'polygon_triple_counts':tc,'polygon_triples_total':sum(tc),'saved':data['source-experiment.json'],'zeros_saved_only':11363,'scope':'50actuala3fractions;370bandrows,indices0..N+5 for formula;entire naturaltriangle/all3originalpolygonmemberships forH/V/D208455triples,notjust370rows.'},
 'representation':{'domain_counts':dict(rc),'saved':data['representation-experiment.json'],'reverse_domain':'j1..40,s0,1,4,10,h0..j,t=s or s+2;6880eachreverseandclearance;includes h0 andh1,notremainingcoreonly.','polynomial_domain':'h2..12,k0,1,3,10,50,s0,1,4,20;220identities. h2/3nowclosed,remainingfiniteh4..12.','determinant_domain':'0<=d<=c<=b<=a<=16;4845quadruples,4060withc>=3;countonly,nodeterminantcalculation.','second_gap_domain':'j3..120,s0..20,2478identitypositions;omits formallycoveredj2.'},
 'fixed_polynomial_certificates':{'h_values':list(range(2,13)),'stored_sparse_counts':pc,'stored_total':3817,'probe_saved':data['reverse-certificate-probe.json'],'stress_saved':data['certificate-stress.json'],'stress_total_saved':7989,'combined_saved_total':11806,'combined_fixed_h_cases':16,'scope':'Sparsearrayslenchecked for h2..12;stressreports h13,14,16,18,20 onlywithcounts,notfullarrays. Coefficient signs,positivity,minima,degrees and factors remain savedobservations,norecomputation/universalproof.','factored_saved':factorrows,'no_universal_coefficient_positive_theorem':True},
 'auxiliary_searches':{n:data[n] for n in ['logconcave-weight-probe.json','increasing-lc-probe.json','increasing-lc-reproduced.json','small-weight-obstruction.json','small-increasing-obstruction.json','small-increasing-upper-obstruction.json']},
 'auxiliary_search_scope':'RandomLC2000planned,j2..15,s0/1/5,earlyfailureat31savedcases. Increasing1000planned,j2..17,s0/2/9,seed983,earlyfailureat7savedcases,j9;reproduction sameinputsnotindependentnewcases. Smallinteger tailsrange1..12,j2..6withLCfilterandearlystop;increasingtail1..24,j2..7withLCfilter,earlystop;upperonlysearchsamefamilycompleteswithnull,noattemptcount. NoRNG/LCfilter/sign recalculated;finite nullnotuniversalproof. Allauxiliarynonsource.',
 'saved_gap_experiment':data['gap-experiment.json'],'retained_inline_commands':commands,'output_event_bindings':event_bindings,'result_bindings':records,
 'source_visit':{'path':'evidence/markov-beca0ad5/source-visit.json','sha256':binding('evidence/markov-beca0ad5/source-visit.json'),'scope':'Retainedworkerweb record only;noauditorwebvisit/newresearch ornoveltyclaim.'},
 'invocation_limits':'SixPython sources+GAPinput read only/ASTparsePython only;neverimported/executed. No frame recurrence/binomial/kernel/determinant/polynomial/rationalvalue/sign orRNG regeneration. Counts are indexdomains/recordlengths only.'}
H={**base,'new_sources':new,'excluded_modules':excluded,'accepted_counts':dict(counts),'excluded_counts':{'theorem':3,'def':1},'named_older_comparisons':older,'historical_pending_comparisons':oldexcluded,'historical_operational_comparisons':operational,
 'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited_scripts,'saved_script_versions':[],'result_bindings':records,'imported_libraries':libs,'new_imported_libraries':newlibs,'imported_four_functions':four,'residual_binding':residual,'receipt_waiting':js(T/'markov_worker_000179_receipt_watch.json'),'all_named_new_match_current':True,'explicit_inherited_body_reads':reads,
 'audit_helper_corrections':['First audit-owned attempt stopped before writing any supports on a misspelled inherited module name MarkovUpperResidualMA45. An unexecuted intermediate edit used UpperCore; corrected from sealed178 inventory to UpperReduction. No project checks or mathematical computations occurred.'],
 'read_scope_notes':['All10selectedbodies+diagnosticDetTest and6newPythonprograms+GAPinput readinfull;finalmathematics/correspondence/operational/next read;earlycheckpoints hashonly.',
 'Initialcatattempt used nonexistent closed179 artifacts/MathGKM paths (three files); nofilesread. Corrected via closed179archive-only rg enumeration;noactive180reads.',
 'Inheritedsourceproofaudits reused;presentexplicitnamedidentitychecks only,no wholeoldmodule recovery. Libraries inheritedcompiledtrust;no freshsourcebuild.',
 'Current bindings and before/index checks are presentobservations;older seals/windows remain final. Storage0630 changes only identical retained177/178copies metadata,notresearchcontent.']}
for label,value in [('mathematical_source_hashes',H),('source_structure_audit',S),('finite_domain_audit',F)]:
 path=T/f'markov_worker_000179_{label}.json';assert not path.exists();path.write_text(json.dumps(value,indent=2,ensure_ascii=False)+'\n');print(path.name,path.stat().st_size,sha(path))
print(json.dumps({'source':dict(sc),'triples':tc,'representation':dict(rc),'event_bindings':{x['record']:{'full':[z['event'] for z in x['complete_saved_json_matches']],'case':[z['event'] for z in x['projection_without_samples_matches']]} for x in event_bindings}},indent=2))
