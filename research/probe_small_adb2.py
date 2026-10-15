"""Machine-authored finite small-cycle checks; not universal proofs."""
from probe_adb2 import candidate,source,path_for,backward
from pathlib import Path
import json,time
start=time.monotonic();records=[];positions=0
for n in range(13):
 for r in [1,2]:
  c=3;a=3*n+r;b=3*(n+1)+r
  C=candidate(n,c,r,max(2*r-c,0),min(c-r,max(3*r-c,0)),max(3*r-2*c,0))
  aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b))
  Q=backward(w,3)
  for j in range(a+b+2):
   v=(C[j] if j<len(C) else 0)+(6 if j==b else 0)
   assert 6*Q.get(j,0)==v,(n,r,j)
   i=a+3-j
   if i>=0:assert 6*raw.get((i,j),0)==v,(a,b,i,j)
   positions+=1
  records.append(dict(n=n,r=r,a=a,b=b,correction_degree=b,correction_scaled_coefficient=6))
out=dict(status='finite exact experiments only',source_cases=records,positions=positions,seconds=time.monotonic()-start)
Path('evidence/markov-adb2c7b0/small-cycle-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(cases=len(records),positions=positions,seconds=out['seconds'])))
