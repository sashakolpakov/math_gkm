"""Machine-authored exact stress tests of horizontal type refinement."""
import random,json,time,pathlib
from probe_5611 import check,OUT
from aggregate_a3c5 import poly
rng=random.Random(56112359);start=time.monotonic();ct=triples=0;bad=None
for z in range(250):
 n=rng.randrange(5,55)
 # Alternating C sites separated by variable positive A blocks.
 w=[False]
 for k in range(n):
  w.extend([True]+[False]*rng.choice([1,1,1,2,2,4,8]))
 if len(w)>100:w=w[:100]
 if w[-1]:w.append(False)
 bad,num=check(w);ct+=1;triples+=num
 if bad:break
 if z%10==0:print(z,len(w),triples,flush=True)
rec=dict(seed=56112359,objects=ct,triples=triples,first_failure=bad,seconds=time.monotonic()-start,status='finite experiment only')
(OUT/'random.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
