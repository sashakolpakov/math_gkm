"""Static saved-text/hash audit and input-domain counts; never imports project code."""
from pathlib import Path
from collections import Counter
from datetime import datetime, timezone
import json, hashlib, re
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm')
W=P/'.control/markov/workers/000157';A=W/'artifacts';E=A/'evidence/markov-1bb0aa1e'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def js(p): return json.loads(p.read_text())
base={'worker':157,'request':'1bb0aa1ee066482294f620401d001bf2','created_at_utc':datetime.now(timezone.utc).isoformat(),
 'historical_status':'Completed/return0/delivered report; full root open. Worker156 historical timeout unchanged.',
 'scope':'Closed157 archive and explicit named inherited/current counterparts only. Static parsing, hashes and input-index counts, no project/proof/checker/replay/experiment/finalizer/generator execution or mathematical-value computation. No project edit, proposer contact or research help. Active158 excluded; earlier seals final.'}
before=js(E/'before.json');controller_before=js(W/'before.json');receipt=js(W/'receipt.json');v=js(E/'validation.json');selection=js(E/'mathematical-modules.json')
assert receipt['outcome']=='completed' and receipt['report'] is not None
new_replay=js(E/'replay-1792181929291520000.json');old_replay=js(E/'replay-1792180985973566000.json')
new_axioms=js(E/'axioms-1792181983580356000.json')
builds=[(p,js(p)) for p in sorted(E.glob('build-*.json'))]
counts=Counter();new=[];mods=[]
for module in selection:
 rel='research/'+module+'.lean';src=(A/rel).read_text();h=sha(A/rel)
 assert h==sha(P/rel)==receipt['changes'][rel]['after']==v['source_sha256'][module]==new_replay['modules'][module]==new_axioms['sources'][module]
 matched=[(p,d) for p,d in builds if d.get('returncode')==0 and d['modules'].get(module)==h]
 assert len(matched)==1
 bp,bd=matched[0];assert sha(bp.with_suffix('.lean'))==h
 op='evidence/markov-1bb0aa1e/'+module+'.olean';oh=sha(A/op)
 assert oh==sha(P/op)==receipt['changes'][op]['after']==v['compiled_hashes'][module][op]
 matches=list(re.finditer(r'(?m)^(theorem|def|abbrev)\s+(\w+)',src));decl=[];statements=[];defs=[]
 for k,x in enumerate(matches):
  kind,name=x.groups();counts[kind]+=1;decl.append({'kind':kind,'name':name})
  end=matches[k+1].start() if k+1<len(matches) else src.index('\nend',x.end());block=src[x.start():end].strip()
  if kind=='theorem':
   z=re.search(r':=\s*by\b|:=\s*\n',block);assert z,(module,name);statements.append(block[:z.start()].rstrip())
   assert name in new_axioms['declarations']
  else:defs.append(block)
 row={'module':module,'path':rel,'bytes':len(src.encode()),'sha256':h,'current_sha256':h,
      'status':'compiled, joint replay passed, all theorem closures printed in worker157',
      'declarations':decl,'object_path':op,'object_sha256':oh,
      'successful_final_build':bp.name,'successful_final_build_sha256':sha(bp)}
 new.append(row)
 clean=re.sub(r'/\-.*?\-/','',src,flags=re.S);clean=re.sub(r'--[^\n]*','',clean)
 mods.append({**row,'imports':re.findall(r'(?m)^import\s+(.+)$',src),'theorem_statements':statements,'definitions':defs,
  'forbidden_tokens':[w for w in ['sorry','admit','axiom','native_decide','unsafe','partial'] if re.search(r'\b'+w+r'\b',clean)]})
assert len(new)==8 and counts=={'theorem':43,'def':12}
assert not any(x['forbidden_tokens'] for x in mods)
assert len(new_axioms['declarations'])==43 and new_replay['returncode']==old_replay['returncode']==0
prior=js(T/'markov_worker_000156_mathematical_source_hashes.json');older=[];recoveries=[]
for d in prior['new_sources']+prior['named_older_comparisons']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 oldstatus=d.get('status',d.get('prior_status','inherited'))
 older.append({'module':d['module'],'path':rel,'sha256':h,'before157_sha256':before[rel],
               'sealed156_sha256':d['sha256'],'historical_status':oldstatus,
               'selected_recovery_in157':d['module'] in old_replay['modules']})
 if d['module'] in old_replay['modules']:
  module=d['module'];op=d['object_path'];oh=sha(P/op)
  assert old_replay['modules'][module]==v['source_sha256'][module]==h
  assert oh==d['object_sha256']==v['compiled_hashes'][module][op]==controller_before[op]
  ao=P/'.control/markov/workers/000156/artifacts'/op
  assert sha(ao)==oh
  recoveries.append({'module':module,'source_sha256':h,'object_path':op,'object_sha256':oh,
                     'historical156_status':oldstatus,'recovery_status':'worker157 new12-module replay and42+2 theorem-print batches; no fresh module compilation',
                     'historical156_timeout_unchanged':True})
assert len(older)==len({x['path'] for x in older})==234 and len(recoveries)==12
libs=prior['imported_libraries'];four=prior['imported_four_functions']
for d in libs+[four]:
 assert sha(Path(d['source_path']))==d['source_sha256'] and sha(Path(d['object_path']))==d['object_sha256']
docs=[];scripts=[];records=[]
for tag in ['checkpoint','correspondence','mathematics','next','operational','literature','row-derivation','correction-band']:
 rel=f'research/markov-1bb0aa1e-{tag}.md';h=sha(A/rel);assert h==sha(P/rel)
 docs.append({'path':rel,'sha256':h,'current_match':True})
for tag in ['tail_experiments','generate_firsttail','crossing_certificate','lower_rows','correction_band','next_row_probe']:
 rel=f'research/{tag}_1bb0aa1e.py';h=sha(A/rel);assert h==sha(P/rel)
 scripts.append({'path':rel,'sha256':h,'current_match':True,'executed_by_auditor':False,
                 'main_guarded':tag!='generate_firsttail','is_lean_generator':tag in ['generate_firsttail','crossing_certificate']})
inherited_scripts=[]
for d in [x for x in prior['new_scripts'] if x['path'] in ['research/alternate_shape_e9cdd527.py','research/low_probe_e9cdd527.py','research/row_probe_e9cdd527.py']]+prior['inherited_scripts']:
 rel=d['path'];h=sha(P/rel);assert h==before[rel]==d['sha256']
 inherited_scripts.append({'path':rel,'sha256':h,'sealed156_match':True,'main_guarded':True,'executed_by_auditor':False})
recordnames=['tail-experiments.json','lower-row-experiments.json','correction-band-experiments.json','next-row-experiments.json','crossing-certificates.json']
data={n:js(E/n) for n in recordnames}
for n in recordnames:
 rel='evidence/markov-1bb0aa1e/'+n;h=sha(A/rel);assert h==sha(P/rel)
 records.append({'path':rel,'sha256':h,'bytes':(A/rel).stat().st_size,'current_match':True})
events=[json.loads(l) for l in (W/'events.jsonl').read_text().splitlines()];bindings=[]
for num,n in [(102,'tail-experiments.json'),(128,'lower-row-experiments.json'),(147,'correction-band-experiments.json'),(170,'next-row-experiments.json')]:
 it=events[num-1]['item'];out=json.loads(it['aggregated_output']);assert it['exit_code']==0
 expected={k:x for k,x in data[n].items() if not (n=='correction-band-experiments.json' and k=='examples')}
 assert out==expected
 bindings.append({'event':num,'record':n,'command':it['command'],'all_printed_fields_exact_match':True,
                  'unprinted_fields':['examples'] if n=='correction-band-experiments.json' else []})
assert json.loads(events[73]['item']['aggregated_output'])=={k:d['all_coefficients_positive'] for k,d in data['crossing-certificates.json'].items()}
# Input indices/counts only. Never compute coefficients, binomials, recurrences, signs or gaps.
tail=Counter()
for q in range(1,41):
 for r in [False,True]:
  n=3*q+(1 if r else 2);I=n+5
  tail['correction_entries']+=I+1;tail['correction_source_families']+=1
  if q<=12:tail['raw_source_comparisons']+=I+1;tail['direct_source_families']+=1
  if q==1 and r:tail['exceptional_printed_positions']+=I+1
tail['first_tail_low_formulas']=300*2*3;tail['crossing_triples']=300*2*2
for k in ['correction_entries','raw_source_comparisons','first_tail_low_formulas','crossing_triples']:
 assert tail[k]==data['tail-experiments.json'][k]
assert tail['exceptional_printed_positions']==len(data['tail-experiments.json']['exceptional_tail'])
lower=Counter();lower_domains=[]
for n in range(4,81):
 b=(n-1)//3;lower['parameter_values']+=1;lower['triangular_solver_positions']+=(n+3)*(b+1)
 if n%3:lower['actual_residue_parameter_values']+=1
 for j in range(b+1):
  lower['row_checks']+=1;lower['division_steps']+=n-2*j-1
  lower['structural_residual_length_bound']+=j+1;lower['adjacent_positions_upper_bound']+=max(j-1,0)
  if n%3:lower['actual_residue_rows']+=1
 lower_domains.append({'n':n,'row_max':b,'actual_numerator3_residue':bool(n%3)})
assert lower['row_checks']==data['lower-row-experiments.json']['row_checks']==1104
assert lower['adjacent_positions_upper_bound']==data['lower-row-experiments.json']['residual_lc_checks']==8450
band=Counter();banddomains=[]
for q in range(2,41):
 for r in [False,True]:
  b=(q-(2 if r else 1))//2;n=3*q+(1 if r else 2);I=n+5
  band['source_families']+=1;band['each_solver_positions']+=(I+1)*(q+2+b)
  for t in range(b+1):
   e=q-2*t-(2 if r else 1);assert e>=0
   band['rows']+=1;band['coefficients']+=I+1
   band['residual_length_upper_bound']+=t+1;band['adjacent_positions_upper_bound']+=max(t-1,0)
   if t==0:band['rows_overlapping_tail']+=1;band['coefficients_overlapping_tail']+=I+1
   if q in [6,10] and t<=3:band['example_rows']+=1
  banddomains.append({'q':q,'r':r,'n':n,'tail_offset_max':b,'column_max':I})
assert band['rows']==data['correction-band-experiments.json']['rows']==819
assert band['coefficients']==data['correction-band-experiments.json']['coefficients']==72569
assert band['adjacent_positions_upper_bound']==data['correction-band-experiments.json']['lc_tests']==4389
assert band['example_rows']==len(data['correction-band-experiments.json']['examples'])
nextcounts={'candidate_coefficients':199*2*3,'direct_source_comparisons':12*2*3,'strict_crossing_triples':200*2*2,'exceptional_q1_branches':2}
assert nextcounts['candidate_coefficients']==data['next-row-experiments.json']['checks']==1194
assert nextcounts['direct_source_comparisons']==data['next-row-experiments.json']['source_checks']==72
assert nextcounts['strict_crossing_triples']==data['next-row-experiments.json']['triples']==800
certsrc=(A/'research/MarkovCrossCertificateM1BB.lean').read_text();certs=[]
for name,d in data['crossing-certificates.json'].items():
 match=re.search(r'def '+name+r' \(x : ℚ\) : ℚ := (.+)',certsrc);assert match
 ex=match.group(1);powers=[int(k) for k in d['coefficients']]
 certs.append({'name':name,'json_term_count':len(powers),'json_powers':sorted(powers),
               'source_expression_literal':ex,'source_additive_term_count':len(ex.split(' + ')),
               'saved_all_coefficients_positive':d['all_coefficients_positive']})
 assert len(ex.split(' + '))==len(powers)
assert [r['json_term_count'] for r in certs]==[9,9,13,13]
# Compare generator formatting to the exact saved Lean expressions as opaque strings.
# This does not derive or compare rational coefficient values.
assert certsrc.count(' ring\n')==5 and certsrc.count('def ')==5
math={**base,'new_sources':new,'accepted_counts':dict(counts),'pending_modules':[],
 'named_older_comparisons':older,'worker156_recoveries':recoveries,'documents':docs,'new_scripts':scripts,
 'inherited_scripts':inherited_scripts,'result_bindings':records,'imported_four_functions':four,'imported_libraries':libs,
 'residual_binding':{'root_path':'research/MarkovResidualM1BB.lean','root_sha256':sha(A/'research/MarkovResidualM1BB.lean'),
  'root_equivalence':'Conjecture63 iff ThreeRemainingM1BB and OtherFourM9E2','root_open':True,
  'both_residual_conjuncts_unproved':True,'new_region':'Numerator3; columns3 or4; natural startsj+1<=q; bothq>=1 residuefamilies;strict rawV.',
  'no_general_lower_shape_proof':True,'no_band_or_next_row_source_bridge':True},
 'all_named_new_match_current':True,'read_scope_notes':[
  'Read all8newmath sources,8prose files,6new mathematical scripts. Prior156 source/root bodies retain sealedreview; exactnamedbytes are rehashed.',
  'Initial rg --files enumeration within closed157archive omitted ignored.olean names; regularobject inventory established separately. No missingobject inference.',
  'Generator sources changed aftertheir recorded execution at150/151; finalhashes are not invocationtime hashes. No generator executed byauditor.',
  'No active158 enumeration/read. Nine inherited externalpairs retain sealedprovenance; no new literature search or proof.']}
struct={**base,'new_modules':mods,'accepted_counts':dict(counts),
 'source_scope':'Everyactuala3source is true3/(3q+1) orfalse3/(3q+2),q>=1 by inheritedexhaustiveclassification. Completefirstcorrection identity allnaturali, lowerRaw+signedcorrection atj=q+1. No extraformulashape/support premise.',
 'first_force_scope':'FirstForce extends lowerforcing identities to anynaturalj<n. FirstGain is exact source-minuslowerforcing atrowq+1. Columns0zeroallq,1zeroq>=1; atcolumni+2 it is8C(q,i)true or4C(q+1,i)false. Positive-row shifts cancel by inheritedlowerregionidentity withguards; firstDiff recurrence f(i)+2f(i-1)+f(i-2)=gain retainsif1<=i/2<=i.',
 'correction_scope':'Foractualq>=1,correction0ati<2; trueq>=2 gives8C(q-2,i-2),falsegives4C(q-1,i-2). Trueq1 gives8(-1)^(i-2). Naturalsubtractions guardedbyi>=2 andqcases. Genericsecond-solver allowsarbitraryintegerc, allindices; binomialtailszero retained. Exceptionalalternatingauxiliarytail cancels lowerRaw beyondfiniteactualsupport, notnegative sourcecoefficients.',
 'low_column_scope':'Firstrowactuali<=1zero provedfromoriginalpolygon. i2=8/4,i3=lowThree(q+1)+8(q-2)/4(q-1),i4=lowFour(n,q+1)+4(q-2)(q-3)/2(q-1)(q-2),with rationalcasts. Proofthroughguardedrawdiscriminant usingq=k+1 includesq1. No negative-natural-power extension and no divisionbyrawcoefficient.',
 'strict_lc_scope':'Four exact rationalgapcertificates atx=q-1>=0 covercrossingcolumns3/4 andbothresidues; strictpositiveconstant plusnonnegativepowers. Separate lowThreegap yieldsstrictinnercolumn3. Innercolumn4 reuses156. Naturalcase split j+2<=q versusq=j+1 yieldsrawVstrict fori3/4,j+1<=q; casts exact, no rescaling orpositive-entrypremise.',
 'root_scope':'ThreeRemaining retains allH,D andVoutside((i=3 ori=4)ANDj+1<=q). Exactiff retains OtherFourunchanged,originalpolygon/zeros/endpoints throughinheritedrootbridge. Bothconjunctsunproved. No generalLowershape/band/nextrowproof. UnboundedpaththreePath(j,r) givesq=j+1 forallj andbothcolumns/residues,all3originalpolygonmembers; outsideimmediate156removedregion,notassertedoutsideeveryoldercriterion.',
 'auxiliary_scope':'Exceptionalcorrection1true3=-8 whileactual3/4rawVcolumn3[1,8,26]polygonvalidandstrictLC. Finitecubicresidual3/10row3[104,394,510,220]negative-discriminantclaim is auxiliary,unformalized andnotrecomputed; no rawrootrefutation.',
 'recovery_scope':'All12unchanged156modules newlyjointreplayed in157;42+2explicitprintscoverall44theorems. Former5compiledonly nowreplayed,all12formerlyunprinted nowprinted. No fresh156sourcecompile,backdating, orold212recovery.',
 'mathematical_values_recomputed':False}
finite={**base,'tail_probe':{'counts':dict(tail),'saved_record':data['tail-experiments.json'],
  'qualification':'q1..40bothresidues,columns0..n+5:5520signedcorrections. Directprotectedframeonlyq<=12:24sources648positions. Separateq1..300bothresidues:1800i2/3/4firstrowformulas and1200strictVtriplesi3/4startq-1. Savedzerotriples0 notindependentlyrecomputed.10exceptionaltrueq1entries includezeroactualtail; nozero/polyfilter. Overlappingdomains, notsumofindependentcases.'},
 'lower_rows':{'counts':dict(lower),'domains':lower_domains,'saved_record':data['lower-row-experiments.json'],
  'qualification':'n4..80,j0..floor((n-1)/3),1104rows. Includesn divisibleby3, notallactualnumerator3sources. Triangularlower solver andsignedcandidate recurrence, notadditionalcanonicalframechecks. H_jstructuralarraylength<=j+1 beforetrim;8450 ispotentialadjacentpositionupperbound, equalsretainedruntimecount, buttrim/signs notreevaluated. Universalcoefficientfactorization andCrossLC remainunproved; adjacentLC doesnotprovideCrossLC/nogaps. Cubicdiscriminant recordretainedonly.'},
 'correction_band':{'counts':dict(band),'domains':banddomains,'saved_record':data['correction-band-experiments.json'],
  'qualification':'q2..40bothresidues,t0..floor((q-c)/2),c2true/c1false; exponentq-2t-c>=0.819rows72569coefficientpositions,twotriangularsolvers notcanonicalframe. Residualarraylength<=t+1 yields4389potentialadjacentpositionsmatchingretainedcount; trim/positivitynotreevaluated. t0overlapstailprobe; q1exceptionexcluded. Proposedt>0bridgeandLCunproved.'},
 'next_row':{'counts':nextcounts,'saved_record':data['next-row-experiments.json'],
  'qualification':'q1..200bothr;candidateformulasatrowq+2onlyq>=2,i2/3/4=1194. q1twoexceptionalarrays separatelyprinted. Directframeq<=12,i2/3/4=72positions atdifferentrowfromtailprobe.800strictVcrossingi3/4startq, beyondnewformalstartj+1<=q; universalbridgeandinequalitiesremainunproved.'},
 'certificate_generation':{'certificates':certs,'json_polynomials':4,'json_terms':44,'source_polynomials':5,'source_terms':53,
  'generator_event':74,'generator_final_edit_events':[150,151],
  'qualification':'FourJSONrationalcoefficientmaps have9/9/13/13terms andsavedpositivityflags; fifthlowThree polynomial isonlyinLean. Literal/sourceexpressionsboundbyhashes; noauditorrationalreduction/multiplication/evaluation orpolynomialrecomputation. ExactLeanring/positivityproofs compiled/replayed. Finalgeneratorprooftemplateeditedafterexecution, notretroactiveinvocationhash.'},
 'firstforce_generation':{'generation_and_failed_build_event':56,'generator_final_edit_events':[150,151],
  'qualification':'Textualretag/specializationofsealed156LowForce,then lower-force-twoheader. InitialgeneratedFirstForcefails; latertry-simpfixaccepted. Finalgeneratorupdatedafterrun; noauditorprojectgenerator execution.'},
 'event_bindings':bindings,'records':records,
 'runtime_limits':'All imported numerical helpers main-guarded, including newlower_rows; standaloneFirstForcegenerator isnot importedbyexperiments. Finalsource/result/eventbinding only, no invocation-starttransitivehashmap orfreshinterpreterauthentication. No mathematicalvalues orstoredoutcomesrecomputed.',
 'mathematical_values_recomputed':False}
for suffix,d in [('mathematical_source_hashes.json',math),('source_structure_audit.json',struct),('finite_domain_audit.json',finite)]:
 p=T/('markov_worker_000157_'+suffix);assert not p.exists();p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
 print(suffix,p.stat().st_size,sha(p))
print('new',dict(counts),'older',len(older),'recovered',len(recoveries),'tail',dict(tail),'lower',dict(lower),'band',dict(band))
