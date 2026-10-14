"""Machine-authored exact cone challenge for at most two cut factors."""
from pathlib import Path
from cuts_fe01 import mul
import json,time
t=time.monotonic();results=[]
one=[{(1,):['reset',0,False]}]
for d in range(1,31):
 shapes={}
 for r in [False,True]:
  if d<int(r):continue
  n=d-int(r)
  for pure in [False,True]:
   if pure and n==0:continue
   p=[1]+[2]*n if not pure else [1]+[2]*(n-1)+[1]
   if r:p=mul(p,[1,1])
   shapes[tuple(p)]=['pure' if pure else 'reset',n,r]
 one.append(shapes)
for d in range(1,31):
 shapes={}
 for a in range(d+1):
  for p,fp in one[a].items():
   for q,fq in one[d-a].items():shapes.setdefault(tuple(mul(p,q)),[fp,fq])
 items=list(shapes.items());failure=None;tests=0
 for i,(p,fp) in enumerate(items):
  for q,fq in items[i:]:
   for j in range(1,d):
    tests+=1;g=2*p[j]*q[j]-p[j-1]*q[j+1]-q[j-1]*p[j+1]
    if g<0:failure=dict(d=d,j=j,p=p,q=q,pfactors=fp,qfactors=fq,gap=g);break
   if failure:break
  if failure:break
 results.append(dict(d=d,shapes=len(shapes),tests=tests,failure=failure))
 if failure or time.monotonic()-t>70:break
rec=dict(status='finite abstract cut-factor shapes only; no source assertion',results=results,seconds=time.monotonic()-t)
Path('evidence/markov-9c20fccd/two-cut-cone.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
