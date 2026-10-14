"""Machine-authored research evidence finalization; no controller writes."""
import pathlib,json,hashlib,re
r=pathlib.Path('/Users/sasha/math_gkm');out=r/'evidence/markov-7d80a785'
rid='7d80a785cc54418dbc60c87975360f76'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
names=['MarkovSwitchLower7d80','MarkovVerticalMixed7d80','MarkovVerticalCertificate7d80','MarkovVerticalSmall7d80','MarkovVerticalSource7d80','MarkovVerticalAlgebra7d80','MarkovNextVertical7d80','MarkovInterior7d80','MarkovOtherDirection7d80']
runs=[]
for p in sorted(out.glob('run-*.json')):
 x=json.loads(p.read_text());x['record']=str(p.relative_to(r));runs.append(x)
mods=[]
for m in names:
 p=r/'research'/f'{m}.lean';h=sha(p)
 matched=[x for x in runs if x['source']==str(p.relative_to(r)) and x['sha256']==h]
 builds=[x for x in matched if x['command'][0].endswith('/lean') and x.get('returncode')==0]
 replays=[x for x in matched if x['command'][0].endswith('/leanchecker') and x.get('returncode')==0]
 lines=[l for x in builds for l in x['stdout'].splitlines() if 'axioms' in l]
 mods.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,compiled=bool(builds),replayed=bool(replays),build_records=[x['record'] for x in builds],replay_records=[x['record'] for x in replays],axioms=lines))
(out/'validation.json').write_text(json.dumps(dict(request_id=rid,modules=mods,imports_status='Inherited compiled imports reused; not fresh whole-source rebuild',independent_completion_audit=False),indent=2)+'\n')
bad=[x for x in runs if x.get('returncode')!=0]
(out/'operational-observations.json').write_text(json.dumps(dict(rejected_attempts=[dict(record=x['record'],timeout=x.get('timeout',False),returncode=x.get('returncode'),source=x['source']) for x in bad],notes=['Developer denies .scratch; durable research/evidence used.','Symbolic predecessor code was loaded by selecting function AST definitions, avoiding predecessor top-level writes.','Two predecessor manifest discrepancies are post-manifest edits recorded in its raw event log. No mathematical artifact mismatch.','Compilation, separate kernel replay, experiments and source correspondence are distinct evidence classes.']),indent=2)+'\n')
(out/'source-scan.json').write_text(json.dumps({str((r/'research'/f'{m}.lean').relative_to(r)):re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',(r/'research'/f'{m}.lean').read_text()) for m in names},indent=2)+'\n')
prev=json.loads((out/'reconciliation.json').read_text())
pres=dict(predecessor_checks=len(prev['checks']),changed_since_reconciliation=[x['path'] for x in prev['checks'] if sha(r/x['path'])!=x['actual']],root_sha256=sha(r/'MathGKM/Markov.lean'))
contract=json.loads((r/'.control/markov/contract.json').read_text())
pres['contract_sha256']=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
(out/'final-preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
ok=next(x for x in mods if x['module']=='MarkovNextVertical7d80')['compiled']
observations=['Pinned root and contract unchanged; full Conjecture63 remains unresolved.',('Compiled' if ok else 'Drafted')+' the universal raw vertical next-upper-strip inequality, with literal source switch-count correction for small numerators. See validation.json for exact accepted scope.','The source central-word switch bound and corrected fourth-layer identity are separately tracked in validation.json.','Successful axiom closures use only permitted axioms; inherited compiled imports were reused. No fresh whole-source rebuild or independent completion audit occurred.',f'{len(bad)} rejected or timed-out validation attempts are preserved.']
observations.append('The compiled source_other_direction_failure7d80 gives source 1/9 raw coefficients [1,7,50] along (1,-3), obstructing a stronger all-direction claim. This direction is outside the pinned target; it is not a Conjecture63 refutation.')
observations.append('Separate kernel replays confirmed for '+str(sum(x['replayed'] for x in mods))+' of '+str(sum(x['compiled'] for x in mods))+' compiled modules; unconfirmed replay status is retained explicitly.')
if (out/'vertical-probe.json').exists():
 x=json.loads((out/'vertical-probe.json').read_text());observations.append('Exact finite experiment: '+json.dumps(x['counts'])+'; failures='+json.dumps(x['failures'])+'. Experiments are not proofs.')
report=dict(request_id=rid,summary=('Compiled a universal proof of a further vertical upper strip; ' if ok else 'Developed a source-specific proof of a further vertical upper strip; ')+'the full published Markov conjecture remains unresolved.',actions=['Reconciled interrupted-worker artifacts and raw events: evidence/markov-7d80a785/reconciliation.json.','Recorded compilation, axiom closures and separate kernel replay: evidence/markov-7d80a785/validation.json.','Recorded exact symbolic and coefficient experiments under evidence/markov-7d80a785/.','Audited a new literature route and formalized its stronger-scope obstruction: research/markov-7d80a785-literature.md.','Saved derivation and all correspondence limitations: research/markov-7d80a785-mathematics.md and research/markov-7d80a785-correspondence.md.'],observations=observations,agenda=['Use root_iff_interior7d80 if its final validation confirms compilation; retain all source/English correspondence obligations.','Seek a global source-preserved interior inequality; any unimodular-fiber route must be direction-specific because source_other_direction_failure7d80 obstructs the all-direction version.','Finish unconfirmed separate kernel replays before upgrading their validation status.'],completion=None)
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
paths=list(out.iterdir())+list((r/'research').glob('*7d80*'))
hashes={str(p.relative_to(r)):sha(p) for p in sorted(set(paths)) if p.is_file() and p.name!='artifacts.json'}
(out/'artifacts.json').write_text(json.dumps(dict(request_id=rid,hashes=hashes),indent=2)+'\n')
print(json.dumps(dict(modules=[{k:x[k] for k in ['module','compiled','replayed']} for x in mods],rejected_attempts=len(bad),hashes=len(hashes),preservation=pres)))
