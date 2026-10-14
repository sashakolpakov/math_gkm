"""Machine-authored live request fe01d46b; reconciliation only, no replay."""
from pathlib import Path
import json,hashlib,shutil
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-fe01d46b';o.mkdir(exist_ok=True)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
h=json.loads((r/'evidence/markov-34071a88/artifacts.json').read_text())['hashes']
checks=[dict(path=p,expected=s,actual=sha(r/p)) for p,s in h.items()]
idx=json.loads((r/'.control/markov/inherited.json').read_text())
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
ev=[json.loads(s) for s in (r/'.control/markov/workers/000058/events.jsonl').read_text().splitlines()]
rec=dict(request_id='fe01d46b39b940a4b22745b021f8d61c',checks=checks,inherited=ic,last_events=ev[-4:],root_sha256=sha(r/'MathGKM/Markov.lean'),contract_file_sha256=sha(r/'.control/markov/contract.json'),reconciliation='Predecessor saved final report and successful all-denominator replay before controller timeout. All recorded effects inspected; no prior side effect repeated.',capability_failures=['Here-document failed before execution because temporary storage is denied. Higher-priority policy denies .scratch; using durable research/evidence paths.'],tools={x:shutil.which(x) for x in ['sage','gap','lean','lake']})
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-34071a88')+':'+json.loads((r/'evidence/markov-34071a88/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-fe01d46b-checkpoint.md').write_text('Machine-authored fe01d46b. Mission/design and independent audits read completely. Latest interrupted effects reconciled from raw final events and manifest. No replay of mutations. Full root unresolved. Investigating global transfer rather than extending one more boundary strip.\n')
print(json.dumps(dict(checked=len(checks),mismatches=[x for x in checks+ic if x['actual']!=x['expected']],root=rec['root_sha256'],tools=rec['tools'],stop=(r/'.control/markov/STOP.json').exists())))
