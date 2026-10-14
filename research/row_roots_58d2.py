"""Exact fixed-y-coefficient row Sturm experiment; not a proof."""
import json,pathlib,itertools,time
from ambient_transfer_probe_5c90 import transfer
from pell_roots_9a72 import sturm
o=pathlib.Path('evidence/markov-58d2f411')
t=time.monotonic();ct=0;failure=None
for n in range(10):
 for w in itertools.product([False,True],repeat=n):
  p=transfer(w)
  for j in range(n+sum(w)+3):
   row=[p.get((s,j),0) for s in range(n+2)]
   result=sturm(row);ct+=1
   if not result['real']:
    failure=dict(word=list(w),j=j,row=row,**result);break
  if failure:break
 rec=dict(status='Exact finite Sturm tests, not universal proof',max_word_length=n,tests=ct,first_failure=failure,seconds=time.monotonic()-t)
 (o/'row-roots.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
 if failure:break
