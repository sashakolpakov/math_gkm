"""Machine-authored evidence checkpoint/finalizer; never edits prior artifacts."""
from pathlib import Path
import json,hashlib,re,datetime
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-34071a88';rid='34071a88f5e74d9bb6a7e4fa9173f2ff'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(name,x):(o/name).write_text(json.dumps(x,indent=2)+'\n')
mods=['MarkovPolarization340','MarkovPolarizationBridge340','MarkovSecondCertificate340','MarkovSecondNormalized340','MarkovSecondCoeff340','MarkovSecondSource340','MarkovSecondAll340']
receipts=[]
for p in sorted(o.glob('run-*.json')):
 x=json.loads(p.read_text());x['receipt']=str(p.relative_to(r));receipts.append(x)
validation=[];audit=[]
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p);rs=[x for x in receipts if x['source']==str(p.relative_to(r)) and x['sha256']==h]
 builds=[x for x in rs if x.get('returncode')==0 and x['command'][0].endswith('/lean')]
 replays=[x for x in rs if x.get('returncode')==0 and x['command'][0].endswith('/leanchecker')]
 axioms=[]
 for x in builds:
  for decl,a in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",x['stdout']):
   ax=[z.strip() for z in a.split(',') if z.strip()];axioms.append(dict(declaration=decl,axioms=ax,allowed=set(ax)<=set(['propext','Classical.choice','Quot.sound'])))
 row=dict(module=m,source_sha256=h,compiled=bool(builds),replayed=bool(replays),build_receipts=[x['receipt'] for x in builds],replay_receipts=[x['receipt'] for x in replays],axioms=axioms)
 validation.append(row)
 audit.append(dict(path=str(p.relative_to(r)),forbidden=re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',p.read_text())))
write('validation.json',dict(request_id=rid,modules=validation,scope='Current source compilation and individual replays; inherited compiled imports reused, not fresh whole-source rebuild or independent admission'))
write('source-scan.json',audit)
write('operational-observations.json',dict(rejected_or_timed_out=[x for x in receipts if x.get('returncode')!=0],capability_failures=['Shell here-document rejected before creation because its temporary directory is denied','Higher-priority filesystem policy denies .scratch; durable research/evidence paths used'],interpretation='Rejected elaborations and any error-generated placeholder axioms are excluded from accepted validation. Tool outcomes are operational evidence.'))
old=json.loads((o/'reconciliation.json').read_text());changed=[x['path'] for x in old['checks']+old['inherited'] if sha(r/x['path'])!=x['actual']]
write('preservation.json',dict(changed_since_reconciliation=changed,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),stop_file_exists=(r/'.control/markov/STOP.json').exists()))
exp=json.loads((o/'second-source-probe.json').read_text())
report=dict(request_id=rid,summary='Established a stronger second-horizontal-row inequality and an exact site-polarization obstruction; full published Markov Conjecture63 remains unresolved.',actions=['Reconciled 84 predecessor artifacts and interrupted-worker raw events: evidence/markov-34071a88/reconciliation.json.','Checked new Lean sources, axiom closures and individual kernel replays: evidence/markov-34071a88/validation.json.','Executed exact coefficient and polarization experiments: evidence/markov-34071a88/second-source-probe.json and polarization-source.json.','Recorded derivation and correspondence limits: research/markov-34071a88-mathematics.md and research/markov-34071a88-correspondence.md.'],observations=['Pinned root and contract unchanged; no root proof or refutation.',f"{sum(x['compiled'] for x in validation)} modules compiled; {sum(x['replayed'] for x in validation)} have successful direct kernel replay. Accepted printed axiom closures are recorded individually.",'source_second_ambient_all340 proves the ambient-binomial strengthened horizontal inequality on j=2 for every source path and all denominators. The inherited raw row was already known; no complete direction or root is closed.','The source 1/5 cut-site refinement has an explicit positive-orthant midpoint failure after differentiation. This auxiliary obstruction is not a pinned coefficient counterexample.',f"Finite exact scan: {exp['sources']} sources, {exp['formula_checks']} coefficient identities and {exp['scaled_triples']} strengthened triples; {len(exp['failures'])} failures. Experiments are not proofs.",'Inherited compiled imports were reused. No fresh whole-source rebuild or independent English/source completion audit occurred.'],agenda=['Seek a source-preserved global horizontal invariant consistent with the proved ambient second-row bound; site-by-site complete log-concavity is obstructed.','Investigate global summation or site averaging without assuming individual components or derivatives preserve log-concavity.','Continue the full three-direction goal through root_iff_interior7d80, retaining coverage, source-family, homogeneity, polygon, zero and endpoint obligations.'],completion=None)
write('report.json',report)
paths=list(o.iterdir())+list((r/'research').glob('*340*.lean'))+list((r/'research').glob('*34071*.py'))+list((r/'research').glob('markov-34071*.md'))
hashes={str(p.relative_to(r)):sha(p) for p in sorted(set(paths)) if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']}
write('artifacts.json',dict(request_id=rid,hashes=hashes))
write('artifact-verification.json',dict(utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),checked=len(hashes),mismatches=[p for p,h in hashes.items() if sha(r/p)!=h]))
print(json.dumps(dict(modules=[{k:v for k,v in x.items() if k in ['module','compiled','replayed']} for x in validation],preservation_changes=changed,artifacts=len(hashes),forbidden=audit)))
