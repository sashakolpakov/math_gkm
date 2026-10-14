"""Machine-authored reconciliation of writes after predecessor manifest."""
from pathlib import Path
import json,hashlib
r=Path('.');o=r/'evidence/markov-9c20fccd'
p=r/'evidence/markov-07a7e5b7/replay-progress.json';d=json.loads(p.read_text())
checks=[]
for row in d:
 x=json.loads(row['stdout']);record=json.loads((r/x['record']).read_text())
 checks.append(dict(module=row['module'],matches_raw_receipt=all(x[k]==record[k] for k in record),returncode=record.get('returncode'),timeout=record.get('timeout')))
rec=dict(status='reconciled partial effects; no replay of prior side effects',manifest_mismatches=['evidence/markov-07a7e5b7/replay-progress.json','evidence/markov-07a7e5b7/replays.log'],explanation='These files gained the final prefix timeout and completion line after artifacts.json was written. Individual raw receipts agree with final progress entries. Four modules replayed successfully; prefix replay timed out twice. Earlier claim of absent final receipt is corrected here.',checks=checks)
(o/'tail-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
