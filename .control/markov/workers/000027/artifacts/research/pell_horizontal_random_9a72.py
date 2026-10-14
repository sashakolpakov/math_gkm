"""Deterministic larger horizontal-fiber checks. Finite evidence only."""
import random,json,time,pathlib
from pell_sum_probe_9a72 import f
from pell_fiber_probe_9a72 import conv
t=time.monotonic();rng=random.Random(972);checks=0;fail=[];trials=[]
for rep in range(1200):
 n=rng.randrange(2,251);j=rng.randrange(2*n+1);s=rng.randrange(1,n)
 rows=[{q:x for q in range(n+1) if (x:=f(n,j,z,q))} for z in [s-1,s,s+1]]
 lo=conv(rows[0],rows[2]);mid=conv(rows[1],rows[1]);trials.append([n,j,s])
 for k,v in lo.items():
  checks+=1
  if v>mid.get(k,0):fail.append(dict(n=n,j=j,s=s,fiber=k,left=v,right=mid.get(k,0)))
out=dict(status='finite deterministic experiment only',seed=972,trials=trials,nonzero_fibers=checks,failures=fail,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-9a720f77/pell-horizontal-larger.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v if k!='trials' else len(v) for k,v in out.items()}))
