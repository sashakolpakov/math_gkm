"""Machine-authored report collection; no controller edits or external actions."""
from pathlib import Path
import json,hashlib,datetime,re
out=Path('evidence/markov-446bbcdc')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
records=[]
for p in out.glob('run-*.json'):
 d=json.loads(p.read_text());d['record']=str(p);records.append(d)
mods=[]
for p in sorted(Path('research').glob('Markov*446.lean')):
 h=sha(p);rs=[r for r in records if r['source']==str(p) and r['sha256']==h and r.get('returncode')==0]
 builds=[r for r in rs if r['command'][0].endswith('/lean')]
 replays=[r for r in rs if r['command'][0].endswith('/leanchecker')]
 m=dict(module=p.stem,source=str(p),sha256=h,compiled=bool(builds),replayed=bool(replays),build=builds[-1]['record'] if builds else None,replay=replays[-1]['record'] if replays else None,axiom_lines=[line for line in (builds[-1]['stdout'].splitlines() if builds else []) if 'axioms' in line])
 if builds:m['olean_sha256']=sha(out/(p.stem+'.olean'))
 mods.append(m)
contract=json.loads(Path('.control/markov/contract.json').read_text())
root=sha('MathGKM/Markov.lean');ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
v=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=mods,root_sha256=root,contract_canonical_sha256=ch,imports='Pinned inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None)
(out/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
failed=[dict(record=r['record'],returncode=r.get('returncode'),timeout=r.get('timeout',False),source=r['source']) for r in records if r.get('returncode')!=0]
oper=dict(rejected_attempts=failed,capabilities=json.loads((out/'capabilities.json').read_text()),additional=['Initial shell heredoc failed because temporary-file creation is denied; switched to apply_patch/Python -c.','One apply_patch call for upper_cubic_446b.py had a malformed hunk and made no edit; corrected patch succeeded.','Upper-shape expanded certificate hit default heartbeat limit; failed receipt retained. Increased bounded heartbeat limit, then factored the certificate and rebuilt current bytes.','Factoring happened while an earlier upper-shape compilation was pending. Its archived input remains preserved; validation of current bytes requires the separate current-hash build and replay.'],experimental_status='All numerical and symbolic experiment checks are evidence only; no source theorem is inferred from a finite scan.')
(out/'operational-observations.json').write_text(json.dumps(oper,indent=2)+'\n')
accepted=[m for m in mods if m['compiled'] and m['replayed']]
report=dict(request_id='446bbcdc58554542b733c6d1dac376bf',summary='Established exact source adjacency and second-slice count compression, plus raw second-lower-diagonal log-concavity for every source with 2a≤b. Full Conjecture63 remains unresolved.',actions=['Reconciled 50 predecessor artifacts and all six inherited-index hashes: evidence/markov-446bbcdc/reconciliation.json.','Compiled and kernel-replayed current-hash modules as listed in evidence/markov-446bbcdc/validation.json.','Executed exact symbolic and coefficient experiments: evidence/markov-446bbcdc/cubic-certificates.json, fixed-run-certificates.json, upper-cubic.json and lower-shape.json.','Saved mathematics and correspondence limits: research/markov-446bbcdc-mathematics.md and research/markov-446bbcdc-correspondence.md.'],observations=['Pinned root and contract hashes remain unchanged; no proof or refutation of Conjecture63 was obtained.','Proved the exact cyclic B-B adjacency count max(2a−b,0) for every source word and an exact count-compressed second-slice formula, including the two-run correction.','Proved raw diagonal log-concavity on i+j=a+2 for every source with 2a≤b, retaining zeros and polygon guards; root_iff_interior446 records the remaining universal obligations.','Upper/lower candidate coefficient formulas matched 62,491 and 52,877 exact evaluations. Their coefficient bridges remain unproved; validated shape inequalities are abstract algebraic results.','Validation reuses pinned inherited imports. Accepted printed axiom closures contain only permitted axioms. No fresh whole-source rebuild or independent completion audit was performed.','Failures and capability limits are preserved in evidence/markov-446bbcdc/operational-observations.json.'],agenda=['Prove the upper/lower interior coefficient-shape identities from the checked scalar recurrences and count-compressed polynomial.','Resolve the second-slice transition positions and arbitrary run length; preserve the c=2 correction.','Use root_iff_interior446 to pursue the remaining universal inequalities in all three directions, with raw coefficients, zeros, endpoints and source correspondence intact.'],completion=None)
(out/'report.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
files=[p for p in out.iterdir() if p.is_file() and p.name!='artifacts.json']+list(Path('research').glob('*446b*'))+list(Path('research').glob('Markov*446.lean'))
(out/'artifacts.json').write_text(json.dumps(dict(provenance='Live machine-authored 446bbcdc58554542b733c6d1dac376bf',hashes={str(p):sha(p) for p in files}),indent=2)+'\n')
print(json.dumps(dict(modules=[{k:m[k] for k in ['module','compiled','replayed']} for m in mods],failed_attempts=len(failed),root=root,contract=ch,stop_file_exists=Path('.control/markov/STOP.json').exists(),completion=None)))
