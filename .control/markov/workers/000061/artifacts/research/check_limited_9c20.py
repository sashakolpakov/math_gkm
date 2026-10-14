"""Machine-authored exact cross-check of bounded transfer against masks."""
from pathlib import Path
from itertools import product,combinations
from cuts_fe01 import cutterm
from degree_limited_9c20 import limited
import json,time
t=time.monotonic();words=masks=entries=0
for n in range(9):
 for w in product((0,1),repeat=n):
  F=limited(w);direct={}
  for s in range(min(5,n)+1):
   for S in combinations(range(n),s):
    p=cutterm(w,S);d=len(p)-1;masks+=1
    for j,c in enumerate(p):direct[s,d,j]=direct.get((s,d,j),0)+c
  assert F==direct,(w,F,direct)
  words+=1;entries+=len(F)
rec=dict(status='finite exact cross-check, not universal proof',words=words,masks=masks,coefficient_identities=entries,seconds=time.monotonic()-t)
Path('evidence/markov-9c20fccd/limited-validation.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
