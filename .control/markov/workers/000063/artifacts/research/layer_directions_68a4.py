"""Machine-authored fixed-degree, cross-cut experiments, exact integers."""
from pathlib import Path
from itertools import product
from random import Random
from math import gcd
import json,time,sys
from degree_limited_9c20 import limited
O=Path('evidence/markov-68a44d34')
def main():
 mode=sys.argv[1];start=time.monotonic();rng=Random(6844);counts=[0,0,0];fail=[None,None,None];inputs=[]
 if mode=='exhaustive':words=(w for n in range(15) for w in product([0,1],repeat=n))
 else:
  words=[tuple(int(rng.random()<p) for _ in range(n)) for n in [30,50,80,120] for p in [.05,.25,.5,.75,.95] for _ in range(5)]
  words += [(1,)*a+(0,)*b+(1,)*c for a in [1,3,10,30] for b in [1,3,10,30] for c in [1,3,10,30]]
 for w in words:
  F=limited(w)
  for (s,d,j),v in F.items():
   for h,(ds,dj) in enumerate([(1,0),(1,1),(0,1)]):
    if fail[h] is not None or s+2*ds>5:continue
    vals=[F.get((s+k*ds,d,j+k*dj),0) for k in range(3)]
    counts[h]+=1
    if vals[1]**2<vals[0]*vals[2]:fail[h]=dict(word=w,s=s,d=d,j=j,coefficients=vals,gap=vals[1]**2-vals[0]*vals[2])
  inputs.append(w)
  if len(inputs)%100==0:
   rec=dict(mode=mode,status='finite exact experiment; no universal claim',inputs=inputs,counts=counts,failures=fail,seconds=time.monotonic()-start)
   (O/f'layer-directions-{mode}.json').write_text(json.dumps(rec)+'\n')
   print(json.dumps(dict(mode=mode,inputs=len(inputs),counts=counts,failures=fail,seconds=rec['seconds'])),flush=True)
  if all(fail) or time.monotonic()-start>110:break
 rec=dict(mode=mode,status='finite exact experiment; cut counts at most 5',inputs=inputs,counts=counts,failures=fail,seconds=time.monotonic()-start)
 (O/f'layer-directions-{mode}.json').write_text(json.dumps(rec)+'\n');print(json.dumps(dict(mode=mode,inputs=len(inputs),counts=counts,failures=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
