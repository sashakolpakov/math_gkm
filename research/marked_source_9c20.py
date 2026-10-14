"""Machine-authored bounded challenge of shifted degree-marker gaps."""
from pathlib import Path
from math import comb,gcd
import time,json
from degree_limited_9c20 import limited
O=Path('evidence/markov-9c20fccd')
def conv(p,q):
 r={}
 for a,u in p.items():
  for b,v in q.items():r[a+b]=r.get(a+b,0)+u*v
 return r
def main():
 t=time.monotonic();tests=0;first=None;inputs=[]
 pairs=[(b-1,b) for b in range(19,61)]+[(a,b) for b in range(19,41) for a in range(1,b) if gcd(a,b)==1]
 for a,b in pairs:
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
  F=limited(w);G={}
  for (s,d,j),c in F.items():G.setdefault((s,j),{})[d]=c
  for s in range(1,min(6,b)):
   for j in range(1,a+s):
    if (b-a)*(j+1)>b*s:continue
    p=conv(G.get((s,j),{}),G.get((s,j),{}));q=conv(G.get((s,j-1),{}),G.get((s,j+1),{}))
    gap={d:p.get(d,0)-q.get(d,0) for d in p.keys()|q.keys()}
    shifted=[sum(c*comb(d,k) for d,c in gap.items() if d>=k) for k in range(max(gap,default=0)+1)]
    tests+=1
    if any(c<0 for c in shifted):
     first=dict(a=a,b=b,s=s,j=j,gap=gap,shifted=shifted);break
   if first:break
  inputs.append([a,b])
  if len(inputs)%25==0:print(json.dumps(dict(sources=len(inputs),tests=tests,seconds=time.monotonic()-t)),flush=True)
  if first or time.monotonic()-t>100:break
 rec=dict(status='finite exact source test, cut counts<=5; not proof',inputs=inputs,tests=tests,failure=first,seconds=time.monotonic()-t)
 (O/'marked-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(sources=len(inputs),tests=tests,failure=first,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
