"""Machine-authored request 07f1d410: reconcile effects, never replay finalizers."""
from pathlib import Path
import json, hashlib, re
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-07f1d410'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for prev in ['8bbb934e','bdee9a64']:
 for p,h in json.loads((R/f'evidence/markov-{prev}/artifacts.json').read_text())['hashes'].items():
  checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(d['expected']==d['actual'] for d in checks)
events=[]
for n in ['000077','000078','000079']:
 p=R/'.control/markov/workers'/n/'events.jsonl'
 ev=[json.loads(l) for l in p.read_text().splitlines()]
 starts={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.started'}
 ends={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.completed'}
 events.append(dict(worker=n,sha256=sha(p),events=len(ev),pending={k:v for k,v in starts.items() if k not in ends},last_events=ev[-4:]))
(O/'predecessor-events-summary.json').write_text(json.dumps(events,indent=2)+'\n')
P=R/'evidence/markov-fddabb33'
runs=[]
for p in sorted(P.glob('run-*.json')):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));runs.append(d)
inv=json.loads((P/'audit-inventory.json').read_text()); accepted=[]
for m in inv['modules']+['MarkovAuditFDDA']:
 if m=='MarkovImportProbeFDDA':continue
 p=R/'research'/f'{m}.lean';h=sha(p);rec=dict(module=m,source=str(p.relative_to(R)),sha256=h)
 for mode in ['build','replay']:
  ds=[d for d in runs if d.get('source')==rec['source'] and d.get('sha256')==h and d.get('mode')==mode and d.get('returncode')==0]
  assert ds,(m,mode)
  rec[mode]=ds[-1]['receipt']
 accepted.append(rec)
audit=json.loads((R/accepted[-1]['build']).read_text())
axs={n:set(x.strip() for x in a.split(',') if x.strip()) for n,a in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",audit['stdout'])}
axs.update({n:set() for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",audit['stdout'])})
assert set(axs)=={n for _,n in inv['theorems']}
assert all(a<={'propext','Classical.choice','Quot.sound'} for a in axs.values())
(O/'inherited-fdda-validation.json').write_text(json.dumps(dict(modules=accepted,axioms={n:sorted(a) for n,a in axs.items()},excluded='Import-only diagnostic MarkovImportProbeFDDA: no replay receipt, no mathematical declarations',finalizer_failure='Predecessor finalizer aborted before writing validation because it demanded replay of the import-only diagnostic. No predecessor file modified; accepted mathematical receipts reconciled here.',limits='Existing receipt/hash reconciliation only, not fresh rebuild or independent audit.'),indent=2)+'\n')
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
inherited={str(p.relative_to(R)):sha(p) for p in list(P.glob('*'))+list((R/'research').glob('*FDDA*'))+list((R/'research').glob('*fdda*')) if p.is_file()}
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='07f1d4107cd9444f9e7c04207d4f33d9',checks=checks,pins=pins,inherited_fdda=inherited,stop_file_present=(R/'.control/markov/STOP.json').exists(),limitations=['Sandbox denies .scratch; persistent unique research/evidence files used.','Shell here-document failed on temporary-file creation; no side effects.'],new_action='Extend exact third-lower-slice inequalities to the low-index boundary and first delayed-band boundary.'),indent=2)+'\n')
lp=str(P)+':'+json.loads((P/'inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_07f1.py').write_text((R/'research/validate_fdda.py').read_text().replace('markov-fddabb33','markov-07f1d410'))
(R/'research/markov-07f1d410-checkpoint.md').write_text('# Live checkpoint 07f1d410\n\nRead mission/design, pinned contract, inheritance index, independent audits, latest full reports and raw worker logs. Workers 77/78 finalized; worker 79 finalizer failed only because its import-only probe lacked a replay. All 23 mathematical modules plus its audit have matching build/replay receipts and 68 permitted theorem axiom closures. No prior side effect replayed. Full pinned root remains open. New action: first-band boundary coefficient inequalities.\n')
print(json.dumps(dict(inherited_checks=len(checks),fdda_mathematical_modules=len(accepted)-1,fdda_theorems=len(axs),events=[dict(worker=d['worker'],events=d['events'],pending=list(d['pending'])) for d in events])))
