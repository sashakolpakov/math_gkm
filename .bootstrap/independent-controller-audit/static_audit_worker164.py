"""Audit-owned static parser/hash/domain counter. No project code or mathematical values executed."""
from pathlib import Path
from collections import Counter
from datetime import datetime,timezone
import ast,hashlib,json,re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000164';A=W/'artifacts';E=A/'evidence/markov-ad504da6'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p):return json.loads(p.read_text())
base={'worker':164,'request':'ad504da6c8b84f10b937c15cf985413e','created_at_utc':datetime.now(timezone.utc).isoformat(),'historical_status':'Completed / return0 / delivered report; full root remains open.','scope':'Closed164 archive and explicit named inherited/current counterparts only. Static parsing, hashes, literal inventories and index/domain counts. No project/Lean/compiler/checker/replay/generator/finalizer/experiment/Singular execution, mathematical-value recomputation, project edits, proposer contact or research assistance. All active/later workers unexamined. Earlier seals and observation windows remain final.'}
before=js(E/'before.json');receipt=js(W/'receipt.json');v=js(E/'validation.json');manifest=js(E/'manifest.json');sel=js(E/'mathematical-modules.json');rep=js(A/v['joint_replay']);axi=js(A/v['axiom_audit']);builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
def declarations(src):
 matches=list(re.finditer(r'(?m)^(theorem|def|abbrev)\s+(\w+)',src));decl=[];statements=[];defs=[]
 for k,x in enumerate(matches):
  kind,name=x.groups();decl.append({'kind':kind,'name':name});end=matches[k+1].start() if k+1<len(matches) else src.index('\nend',x.end());block=src[x.start():end].strip()
  if kind=='theorem':
   z=re.search(r':=\s*by\b|:=\s*\n',block);assert z;statements.append(block[:z.start()].rstrip())
  else:defs.append(block)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 return decl,statements,defs,[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]
new=[];mods=[];counts=Counter()
for m in sel:
 rel='research/'+m+'.lean';src=(A/rel).read_text();h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['source_sha256'][m]==rep['modules'][m]==axi['sources'][m]==manifest[rel]
 bs=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules']=={m:h}];assert len(bs)==1
 bp,bd=bs[0];assert sha(bp.with_suffix('.lean'))==h and str(bp.relative_to(A))==v['successful_builds'][m]
 op='evidence/markov-ad504da6/'+m+'.olean';oh=sha(A/op);assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]==v['compiled_sha256'][m]
 decl,st,defs,bad=declarations(src);counts.update(x['kind'] for x in decl);assert [x['name'] for x in decl]==rep['declared_names'][m]
 assert all(x['name'] in axi['declarations'] for x in decl if x['kind']=='theorem')
 row={'module':m,'path':rel,'bytes':len(src.encode()),'characters':len(src),'sha256':h,'current_sha256':h,'status':'Final source compiled, jointly replayed and all explicit theorem closures printed in164.','declarations':decl,'object_path':op,'object_sha256':oh,'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row);mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':st,'definitions':defs,'forbidden_tokens':bad})
assert len(new)==10 and counts=={'theorem':54,'def':58} and not any(x['forbidden_tokens'] for x in mods)
assert len(axi['declarations'])==54 and rep['returncode']==0
prior=js(T/'markov_worker_000163_mathematical_source_hashes.json');older=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];older.append({'module':d['module'],'path':rel,'sha256':h,'initial164_source_sha256':h,'sealed163_sha256':h,'historical_status':d.get('status',d.get('historical_status','inherited')),'selected_recovery_in164':False,'worker156_recovered_in157':d.get('worker156_recovered_in157',False)})
assert len(older)==len({x['path'] for x in older})==322
old_pending=[]
for d in prior['pending_modules']+prior['historical_pending_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==d['sha256']==before[rel];old_pending.append({'module':d['module'],'path':rel,'sha256':h,'status':d['status'],'selected_recovery_in164':False,'historical_absence_window_not_extended':True})
excluded=[];excluded_struct=[];ecount=Counter();groupcounts={}
for rel in sorted(receipt['changes']):
 m=Path(rel).stem
 if not (rel.startswith('research/Markov') and rel.endswith('MAD5.lean')) or m in sel or m.startswith('MarkovAudit'):continue
 src=(A/rel).read_text();h=sha(A/rel);assert h==sha(P/rel)==receipt['changes'][rel]['after']==manifest[rel]
 decl,st,defs,bad=declarations(src);ecount.update(x['kind'] for x in decl)
 bs=[(p,d) for p,d in builds if d.get('modules')=={m:h}]
 for bp,bd in bs:assert sha(bp.with_suffix('.lean'))==h
 success=[(p,d) for p,d in bs if d.get('returncode')==0]
 status='compiled_only_excluded' if success else ('timed_out_excluded' if bs else 'unattempted_excluded')
 if status=='timed_out_excluded':assert all(d.get('timeout') is True for p,d in bs)
 groupcounts.setdefault(status,Counter()).update(x['kind'] for x in decl)
 op='evidence/markov-ad504da6/'+m+'.olean';archive_object=(A/op).exists();current_object=(P/op).exists();assert archive_object==current_object==bool(success)
 oh=None
 if success:
  oh=sha(A/op);assert oh==sha(P/op)==receipt['changes'][op]['after']==manifest[op]
 row={'module':m,'path':rel,'bytes':len(src.encode()),'characters':len(src),'sha256':h,'status':status,'declarations':decl,'theorem_statements':st,'definition_count':len(defs),'definition_sha256':[hashlib.sha256(x.encode()).hexdigest() for x in defs],'forbidden_tokens':bad,'build_receipts':[{'path':p.name,'sha256':sha(p),'returncode':d.get('returncode'),'returncode_field_present':'returncode' in d,'timeout':d.get('timeout',False)} for p,d in bs],'object_path':op,'object_sha256':oh,'archive_object_present':archive_object,'current_object_present_at_initial_observation':current_object,'selected':False,'replayed_in164':False,'printed_in164':False}
 excluded.append(row);excluded_struct.append({**row,'imports':re.findall(r'(?m)^import\s+([A-Za-z0-9_.]+)',src),'candidate_literal_definitions_not_evaluated':True})
assert len(excluded)==32 and ecount=={'def':120,'theorem':33}
assert Counter(x['status'] for x in excluded)=={'compiled_only_excluded':6,'timed_out_excluded':2,'unattempted_excluded':24}
assert groupcounts=={'unattempted_excluded':{'def':24,'theorem':25},'compiled_only_excluded':{'def':70,'theorem':6},'timed_out_excluded':{'def':26,'theorem':2}}
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature']:
 rel=f'research/markov-ad504da6-{tag}.md';h=sha(A/rel);assert h==sha(P/rel)==manifest[rel];docs.append({'path':rel,'sha256':h,'current_match':True})
for name in ['centered_experiment_ad504da6.py','pair_split_ad504da6.py','factor_bridge_ad504da6.py','factor_pair_ad504da6.py','pair_factor_ad504da6.sing']:
 rel='research/'+name;h=sha(A/rel);assert h==sha(P/rel)==manifest[rel];scripts.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True,'main_guarded':"if __name__=='__main__'" in (A/rel).read_text(),'executed_by_auditor':False})
inherited=[]
for d in prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256'];inherited.append({'path':rel,'sha256':h,'sealed163_match':True,'role':'Historical comparison-only helper identity; no project helper is imported by current experiments/generators.','executed_by_auditor':False})
inputdata=[]
for name in ['pair-factors-extrep.txt','pair-factored-extrep.txt']:
 d=next(x for x in prior['result_bindings'] if x['path'].endswith('/'+name));rel=d['path'];h=sha(P/rel);assert h==d['sha256'];inputdata.append({'path':rel,'sha256':h,'bytes':(P/rel).stat().st_size,'sealed163_match':True,'role':'Serialized literal input data to new generators; old mathematical values not recomputed.'})
names=['centered-experiments.json','pair-generation.json','factor-bridge-generation.json','singular-factorization.json'];data={n:js(E/n) for n in names}
for n in names:
 rel='evidence/markov-ad504da6/'+n;h=sha(A/rel);assert h==sha(P/rel)==manifest[rel];records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(66,'pair-generation.json'),(112,'pair-generation.json'),(104,'centered-experiments.json')]:
 it=events[num-1]['item'];assert it['exit_code']==0 and json.loads(it['aggregated_output'])==data[n];bindings.append({'event':num,'record':n,'full_JSON_stdout_exact_match':True,'command':it['command']})
for num in [177,198]:
 it=events[num-1]['item'];out=ast.literal_eval(it['aggregated_output']);assert it['exit_code']==0 and out=={k:x for k,x in data['factor-bridge-generation.json'].items() if k!='status'};bindings.append({'event':num,'record':'factor-bridge-generation.json','printed_metadata_exact_match':True,'qualification':'FactorBridge proof-tactic unfold order corrected between executions; same character-count/metadata does not assert same earlier source bytes.'})
it=events[152]['item'];sdata=data['singular-factorization.json'];lines=it['aggregated_output'].splitlines();meta=json.loads(lines[0]);assert it['exit_code']==0 and meta=={k:x for k,x in sdata.items() if k not in ['stdout','stderr']}
assert it['aggregated_output']=='\n'.join([json.dumps(meta),sdata['stdout'][:1500],sdata['stderr'][:1000]])+'\n'
bindings.append({'event':153,'record':'singular-factorization.json','printed_metadata_and_truncated_stdout_match':True,'stdout_prefix_characters':1500,'saved_full_stdout_characters':len(sdata['stdout']),'qualification':'Full saved stdout retained separately; event prints only prefix, not full factorization. Source and executable bytes are not invocation-time authenticated by this result.'})
# Static input-index domains and already proved interval-support membership only.
c=Counter();domain=[]
for j in range(21):
 for t in range(21):
  c['j_t_pairs']+=1
  for m in range(j+1):
   c['ratio_comparisons']+=2;c['ratio_endpoint_comparisons']+=2*(m in [0,j])
  for n in range(j+1):
   for m in range(n+2,j+1):c['local_pair_comparisons']+=1
  for n in range(2*j+5):
   size=n//2+1;c['antidiagonals']+=1;c['symmetric_pair_positions']+=size;c['global_order_comparisons']+=size-1
   for i in range(size):
    k=n-i;c['zero_denominator_pairs']+=not(1<=i<=j+1 and 1<=k<=j+1)
  for h in range(t+3):
   if j+h<t:continue
   c['cut_parameters']+=1;c['cut_coefficients']+=2*j+3
   for s in range(3):c['shift_coefficients']+=max(j+t+s+1,t+s+j+1)
for k in data['centered-experiments.json']:
 if k not in ['status','failures','seconds']:assert c[k]==data['centered-experiments.json'][k],(k,c[k])
# Literal serialization lengths and declaration/index lists only; no evaluation or polynomial rendering.
arrays={d['path']:ast.literal_eval((P/d['path']).read_text().replace('\\\n','')) for d in inputdata}
factors=arrays['evidence/markov-fee405c8/pair-factors-extrep.txt'];terms=arrays['evidence/markov-fee405c8/pair-factored-extrep.txt']
assert len(factors)==4 and [len(x) for x in factors]==[22]*4 and len(terms)//2==20813
sing=(A/'research/pair_factor_ad504da6.sing').read_text();expression=sing.split('poly p=',1)[1].split(';',1)[0];literal_term_count=expression.count('+')+1;assert literal_term_count==20813
factor_src=(A/'research/MarkovFactorBridgeMAD5.lean').read_text();reduced=factor_src.split('def pairReducedMAD5',1)[1].split('def pairPrefactorMAD5',1)[0];groups=re.split(r'\)\+\(|\)-\(',reduced.split(':=\n',1)[1]);group_lengths=[len(re.findall(r'pf\d+MAD5 T x g z',x)) for x in groups];assert group_lengths==[22]*4
pref=factor_src.split('def pairPrefactorMAD5',1)[1].split('theorem',1)[0];assert len(re.findall(r'pf\d+MAD5 T x g z',pref))==10
assert len(re.findall(r'(?m)^def pf\d+MAD5',factor_src))==38
assert data['factor-bridge-generation.json']['source_bytes']==len(factor_src)==9753 and len(factor_src.encode())==9967
sizes=[]
for d in data['pair-generation.json']:
 source=(A/'research'/(d['module']+'.lean')).read_text();assert d['bytes']==len(source);sizes.append({'module':d['module'],'reported_bytes_is_characters':d['bytes'],'UTF8_bytes':len(source.encode()),'terms_reported_only':d['terms'],'degree_reported':d.get('degree')})
assert len(sizes)==31
residual={'root_source_path':'research/MarkovLiftRootMFEE.lean','root_source_sha256':next(d['sha256'] for d in older if d['module']=='MarkovLiftRootMFEE'),'root_equivalence':'Conjecture63 iff LowerHorizontalMFEE and ThreeOutsideLowerMFEE and OtherFourM9E2, unchanged inherited statement.','root_open':True,'all_three_residual_conjuncts_unproved':True,'new_raw_LC_region':False,'new_general_zero_factor_and_centered_transport':True,'RationalPairStep_unproved':True,'ParametricPairPositive_unproved':True,'ReducedPairPositive_unproved':True,'rational_parametric_reduced_equivalent':True,'these_auxiliary_premises_only_sufficient_for_lowerH_not_root_iff':True,'previous_zero_factor_source_ratio_cut_weighting_bridges_now_formal':True}
math={**base,'new_sources':new,'accepted_counts':dict(counts),'excluded_modules':excluded,'excluded_counts':dict(ecount),'excluded_group_counts':{k:dict(x) for k,x in groupcounts.items()},'historical_pending_comparisons':old_pending,'named_older_comparisons':older,'documents':docs,'new_scripts':scripts,'inherited_scripts':inherited,'inherited_serialized_inputs':inputdata,'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,'residual_binding':residual,'all_named_new_match_current':True,'read_scope_notes':['All ten selected mathematical bodies fully read. All32 excluded candidate headers, imports, literal declaration inventories and proof templates statically inspected; large literal expressions preserved/hash-bound and not algebraically evaluated.','Six source/correspondence/operational/literature notes, four new Python programs and generated Singular input read as text/data; no program imported or executed. Recorded source-page browsing only, no fresh auditor literature search.','Explicit inherited KernelStepM7E2 and LiftRootMFEE bodies read.322 named older comparisons,12 exact external source/object pairs and10 historical helper pins. Current programs use standard library only and two inherited serialized datasets.','Before closure only receipt read: absent23:39:32.783338,23:40:42.975169,23:41:54.515209 UTC; final fourthcheck23:43:04.925033. Every interval>=60sec; waits18.9913,14.0037,59.0060,5.0088,42.0713sec. Active/later material never read.','Storage-only COW consolidation old154..162 changed no bytes/hashes/mode/owner/mtime and no163/164 files; separate parent record d7c687a592eafbe9f94db60c725a1a2a69044c58, no mathematical validation upgrade.']}
struct={**base,'new_modules':mods,'excluded_modules':excluded_struct,'accepted_counts':dict(counts),'excluded_counts':dict(ecount),
 'zero_factor_scope':'Arbitrary finite signed a, b>=0, a<=0 wherever b=0, total a>=0 and cross-product order across complement/subset. Positive total b branch clears only after proving positivity; total b=0 branch retains nonpositive terms and uses total. No zero term deletion.',
 'symmetric_scope':'Nonnegative coefficients A,B,C, full coefficientwise gap>=0, and PairOrder on all antidiagonal pairs ordered by min rank imply every high-index cut gap>=0. Signed symmetric sum equals twice literal cut gap; b=0 gives a<=0. Full antidiagonal, including swapped and diagonal pairs, no normalization of source coefficients.',
 'centered_scope':'X^j liftCut(j,t+s,h)=X^t cut_H(X^s E(j,t+s)) for all naturalj,t,h,s,H withH+t=j+h. All leading/tail branches and natural subtractions explicit. Middle usesH=j+h-t and coefficient2j+k; if shifted coefficient outside support zero retained. ShiftedPairOrder impliesLiftMiddle, not assertedproved.',
 'adjacent_scope':'General real A/B/C nonnegative and Bstrictsupport exactly[l,u]. Sorting bymin/max preservespairGap/pairDen. Zero outerdenominator yields nonpositiveleftgap; otherwise entire inward interval strictlypositive permitsratio comparison and induction. Stepdomain l<=i,k<=u,i+2<=k, no unchecked gap in positive support.',
 'kernel_scope':'Naturalj,t,m withm<=j kernelstrictpositive. Ecoeffpositive iff k<=j; XEmiddleexactpositive1<=k<=j+1. Fullgap inherited withX^2factor. KernelPairStep remainspremise, implyShiftedPairOrder thenLiftLCPositive.',
 'ratio_scope':'Auxiliaryrational A/B exact as source. Naturalendpointm0 leftTerm=0, endpointm=j rightkernelzero. Diagonalstep inherited KernelStepM7E2, actualm<=j andpositiveW/linear denominators. Identity multiplieskernelvalues, neverdividesbythem. Shiftedkernelvaluesmapm=j+1-i andhandlesi1/i=j+1.',
 'rational_scope':'RationalPairStep quantifiesnaturalj,t,m,n witht>=1,n+2<=m<=j. Scalarstep multiplies bynonnegativefour-kernelproduct andpositiveglobalratios. Inwardi,k correspondm=j+1-i,n=j+1-k withnaturalminusguards. GivesallnaturalcolumnsrawH foractualnumerator3lowerrowsj<=q, q>=1,both3q1/2; premiseunproved.',
 'clearing_scope':'Fourfraction sign iff requiresfourstrictpositivedenominators. Generalrational domaint>=0,n>=0,n+2<=m<=j sufficient. NaturalreparameterT=t-1,x=n,g=m-n-2,z=j-m exact, allNat.cast_sub obligationsproved. RationalPairStep iffParametricPairPositive onallnaturalT,x,g,z; no missingendpointcase.',
 'factor_scope':'38literalpolynomialatoms;16exactsmallfactoridentities; four signed22-factorproducts. Arbitraryrationalparameter identity numerator=prefactor*reduced. Prefactor10factors:6commonpositive linear and4W, strictpositivefornonnegative rationalT,x,g,z. ReducedPairPositive quantifiesnaturals only, iffParametricPairPositive. Positivityofreduceddifference itselfunproved. Extraexperimental g+1factorisnotLeanproved.',
 'root_scope':'Inherited exactrootMFEEunchanged; lowerHnewconditionaltransportraw(i,j),(i+1,j),(i+2,j) withallzeros. Explicitpathadaptera3 yieldsq>=1anddenomfamily. Rootconditionalrational/polynomialtheoremsretainThreeOutsideLowerMFEEandOtherFourM9E2; noiffbetweenreducedandroot, no newunconditionalrawregion. Originalpolygon/endpoints/HVDguardsremaininherited.',
 'excluded_scope':'Sixhalfexpansions compiledonly,6theorems70defs, no selectedreplay/prints. Twohalves2theorems26defs timedout3times total.23coefficientmodules plusaggregateunattempted25theorems24defs. No partialexpansionprovesfullsignedsumpositive; aggregateuniversalrationalnonnegativeclaimunvalidated.',
 'mathematical_values_recomputed':False}
finite={**base,'centered_experiments':{'counts':dict(c),'saved_record':data['centered-experiments.json'],'domain':'j,t=0..20; ratiosm0..j; localn0..j,mn+2..j; antidiagonaln0..2j+4, sortedpairi0..floor(n/2); cutsh0..t+2 withj+h>=t; shiftss0..2 allarraypositions.','qualification':'All counts fromloopindices/previouslyprovedexactpositiveBsupport1..j+1. Reported global_order meansadjacentinwardcomparisons, notallorderedpairs. No actualsourceq/path grid orrawsourcepolynomial scanned. Ratioendpoints overlapatj0membershipcounts once. Cut/shiftcoefficients includezeroextensions; no coefficient/ratio/gap/sign evaluated.'},'generation':{'pair_generation_saved':data['pair-generation.json'],'source_character_bindings':sizes,'factor_generation_saved':data['factor-bridge-generation.json'],'factor_bridge_characters':9753,'factor_bridge_UTF8_bytes':9967,'factor_product_lengths':group_lengths,'prefactor_literal_factors':10,'distinct_literal_atoms':38,'qualification':'Reported terms/degree metadata retained, not recomputedpolynomials. Allbytes fields Pythonlen(str)character counts. Fourfactor-multiset checks areworkercomputations; acceptedfinalLeanidentitiesprovideformalbridgeindependently. Twoinvocationsof eachgenerator retainedwithversionqualifications.'},'Singular':{'saved_record_metadata':{k:x for k,x in sdata.items() if k not in ['stdout','stderr']},'stdout_characters':len(sdata['stdout']),'stderr_characters':len(sdata['stderr']),'stdout_sha256':hashlib.sha256(sdata['stdout'].encode()).hexdigest(),'literal_input_terms':literal_term_count,'observed_factor_line':'_[2]=g+1','factor_line_present':'_[2]=g+1' in sdata['stdout'],'qualification':'120sectimeoutbound; recordedreturn0 in3.059516sec, fullstdoutretained, onlyfirst1500charactersprintedinevent. g+1factor/remainingpositivityexperimentalonly. No CASrerun, factorverification, signcountorpolynomial expansionperformed.'},'inherited_serialized_inputs':inputdata,'literal_serialization_counts':{'factor_lists':4,'factor_list_lengths':[22]*4,'factored_extrep_terms':20813},'event_bindings':bindings,'records':records,'runtime_limits':'Onlycenteredexperimentguardedmain. Split/factorbridge/factorpairprogramsexecutetop-levelifimported; noneimported/executed. No inheritedPythonhelper imports; two inherited literaldatafiles only. Singularbinary/environmentnotindependentlyauthenticated.','mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000164_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n');print(suffix,p.stat().st_size,sha(p))
print('accepted',dict(counts),'excluded',dict(ecount),'groupcounts',{k:dict(x) for k,x in groupcounts.items()},'older',len(older),'finite',dict(c))
