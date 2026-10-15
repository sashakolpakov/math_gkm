"""Find simple cut-activity horizontal obstruction on numerator-one sources."""
from activity_b485 import transfer
from itertools import combinations
from pathlib import Path
import json,time
O=Path('evidence/markov-b485717c')
start=time.monotonic();checked=0;failure=None
for N in range(3,16):
 w=(0,)*(N-1)+(1,)
 for count in range(1,N):
  for inds in combinations(range(N),count):
   weights=tuple(10000 if k in inds else 1 for k in range(N));F=transfer(w,weights)
   checked+=1
   for j in range(N+2):
    for s in range(N-1):
     v=[F.get((s+k,j),0) for k in range(3)]
     if v[1]**2<v[0]*v[2]:
      failure=dict(N=N,word=w,heavy=inds,t=10000,s=s,j=j,values=v,gap=v[1]**2-v[0]*v[2]);break
    if failure:break
   if failure:break
  if failure:break
 if failure or time.monotonic()-start>90:break
rec=dict(checked=checked,seconds=time.monotonic()-start,failure=failure)
(O/'activity-minimal.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
