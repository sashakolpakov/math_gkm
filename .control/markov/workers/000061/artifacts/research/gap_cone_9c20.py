"""Machine-authored abstract factor-cone test; no source family enlargement claim."""
from pathlib import Path
from cuts_fe01 import mul
import json
layers=[{(1,):[]}];first=None;results=[]
for d in range(1,13):
 ps={}
 for n in range(1,d+1):
  for kind,p in [('reset',[1]+[2]*n),('pure',[1]+[2]*(n-1)+[1])]:
   for q,factors in layers[d-n].items():ps.setdefault(tuple(mul(p,q)),[(kind,n)]+factors)
 layers.append(ps);tests=0;failure=None
 for p,fp in ps.items():
  for q,fq in ps.items():
   for j in range(1,d):
    tests+=1;g=2*p[j]*q[j]-p[j-1]*q[j+1]-q[j-1]*p[j+1]
    if g<0:failure=dict(d=d,j=j,p=p,q=q,pfactors=fp,qfactors=fq,gap=g);break
   if failure:break
  if failure:break
 results.append(dict(d=d,shapes=len(ps),tests=tests,failure=failure))
 if failure:break
Path('evidence/markov-9c20fccd/gap-cone.json').write_text(json.dumps(dict(status='finite shape-cone exploration; no universal source result',results=results),indent=2)+'\n')
print(json.dumps(results))
