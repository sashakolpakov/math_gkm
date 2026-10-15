"""Machine-authored live research b485717c0c2e4ae9b5526ee78a83dc99."""
from pathlib import Path
import json, hashlib, shutil
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-b485717c';o.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-e45ef6ac/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
rec=dict(request_id='b485717c0c2e4ae9b5526ee78a83dc99',artifact_checks=checks,inherited_checks=ic,reconciliation='Immediate predecessor completed; its three rejected builds and finalizer failure were repaired in its final validation. The earlier c416 interruption was reconciled by 320fe46f. No predecessor mutation replayed.',root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['Higher-priority policy prohibits .scratch; unique research/evidence files used.'],capabilities={x:shutil.which(x,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for x in ['sage','gap','lean','lake']})
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-e45ef6ac')+':'+json.loads((r/'evidence/markov-e45ef6ac/inherited-lean-path.json').read_text()))+'\n')
(r/'research/validate_b485.py').write_text((r/'research/validate_e45e.py').read_text().replace('markov-e45ef6ac','markov-b485717c'))
(r/'research/markov-b485717c-checkpoint.md').write_text('Machine-authored b485717c. Mission/design, pinned root, independent audits and latest reports read. Full root open. Investigating horizontal cut-activity robustness as a possible route to general aggregation. No previous side effect replayed.\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],capabilities=rec['capabilities'])))
print(json.dumps({k:dict(sha256=v['sha256'],bytes=len(v['content'])) for k,v in idx.items()}))
