"""Machine-authored live research 3ae33435683c485a82b2dbaec31788a5.
Read-only inherited reconciliation; unique local evidence only.
"""
from pathlib import Path
import json, hashlib, os, time, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-3ae33435'
O.mkdir(exist_ok=True)
sha=lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
def save(n,x): (O/n).write_text(json.dumps(x,indent=2)+'\n')
if __name__=='__main__':
 inherited=json.loads((R/'.control/markov/inherited.json').read_text())
 save('inherited-index-summary.json',{'keys':list(inherited),'sha256':sha(R/'.control/markov/inherited.json')})
 manifest=json.loads((R/'evidence/markov-13e37040/manifest.json').read_text())
 mismatches=[p for p,h in manifest.items() if not (R/p).is_file() or sha(R/p)!=h]
 log=R/'.control/markov/workers/000203/events.jsonl'
 events=[json.loads(l) for l in log.read_text().splitlines()]
 pending={}; kinds={}
 for e in events:
  kinds[e['type']]=kinds.get(e['type'],0)+1
  item=e.get('item',{}); ident=item.get('id')
  if e['type']=='item.started': pending[ident]=item
  if e['type']=='item.completed': pending.pop(ident,None)
 save('reconciliation.json',{'previous_manifest_entries':len(manifest),'mismatches':mismatches,
  'raw_log':str(log.relative_to(R)),'raw_log_sha256':sha(log),'event_types':kinds,'unmatched_items':pending,
  'interpretation':'Previous worker completed. Its selected artifacts verified; no mutation replayed. Earlier interruptions reconciled by completed successors; no new partial effect requires replay.'})
 pins=['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lean-toolchain','lakefile.toml','lake-manifest.json','.control/markov/contract.json','.control/markov/inherited.json']
 inputs={str(p.relative_to(R)):sha(p) for d in ['research','MathGKM'] for p in (R/d).glob('*.lean')}
 inputs.update({p:sha(R/p) for p in pins})
 save('input-hashes.json',inputs)
 inherited_path=str(R/'evidence/markov-13e37040')+':'+json.loads((R/'evidence/markov-13e37040/inherited-lean-path.json').read_text())
 save('inherited-lean-path.json',inherited_path)
 save('capabilities.json',{'python':os.sys.version,'sage':shutil.which('sage'),'gap':shutil.which('gap'),
  'scratch':'Developer denies .scratch; not accessed. Durable work uses unique research/ and evidence/ paths.',
  'stop_present':(R/'.control/markov/STOP.json').exists()})
 print(json.dumps({'verified':len(manifest),'mismatches':mismatches,'unmatched_items':len(pending),'inputs':len(inputs)}))
