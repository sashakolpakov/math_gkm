"""Machine-authored exact experiments; no finite scan is a proof."""
import json,pathlib,random,time
from balanced_f80 import A,B,mm
out=pathlib.Path('evidence/markov-8934af17');out.mkdir(exist_ok=True)
start=time.monotonic(); fail={};checks=0
def test(w,m):
 global checks
 checks+=1
 p,q=m[0],m[1]
 maxj=max(j for x in m for i,j in x)
 maxi=max(i for x in m for i,j in x)
 for j in range(maxj+1):
  for i in range(maxi+1):
   for k,r in enumerate(m):
    c=[r.get((i+t,j),0) for t in range(3)]
    key='entry'+str(k)
    if c[1]**2<c[0]*c[2] and key not in fail:fail[key]=dict(word=w,i=i,j=j,c=c)
   for sh in [-1,0,1]:
    x=[p.get((i+t,j),0) for t in range(3)]
    y=[q.get((i+t-sh,j),0) for t in range(3)]
    key='sync'+str(sh)
    if x[0]*y[2]+y[0]*x[2]>2*x[1]*y[1] and key not in fail:
     fail[key]=dict(word=w,i=i,j=j,p=x,q=y)
stack=[('A',A)]
while stack:
 w,m=stack.pop();test(w,m)
 if len(w)<10:stack.extend([(w+'B',mm(m,B)),(w+'A',mm(m,A))])
result=dict(status='finite only',checks=checks,fail=fail,seconds=time.monotonic()-start)
(out/'matrix-invariants.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
