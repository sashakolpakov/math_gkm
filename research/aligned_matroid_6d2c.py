"""Machine-authored diagnostic: are aligned count sublevels matroids?"""
from math import gcd
from pathlib import Path
import json,time
def degree(w,m):
 d=1;D=0;s=0
 for k,r in enumerate(w):
  if m>>k&1:D+=d+r;s+=1;d=1
  else:d=d+1 if r else 0
 return D-s
def main():
 start=time.monotonic();tested=0;failure=None;inputs=[]
 for b in range(3,16):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);N=len(w)
   es={m:degree(w,m) for m in range(1<<N)};inputs.append([a,b])
   for e in sorted(set(es.values())):
    F={m for m,v in es.items() if v<=e};tested+=1
    if 0 not in F:continue
    for m in F:
     bad=[m^(1<<k) for k in range(N) if m>>k&1 and (m^(1<<k)) not in F]
     if bad:failure=dict(a=a,b=b,word=w,e=e,kind='heredity',mask=m,removed=bad[0],scores=[es[m],es[bad[0]]]);break
    if failure:break
    for m in F:
     for n in F:
      if m.bit_count()>=n.bit_count():continue
      if not any((m|(1<<k)) in F for k in range(N) if n>>k&1 and not m>>k&1):
       failure=dict(a=a,b=b,word=w,e=e,kind='exchange',m=m,n=n,scores=[es[m],es[n]]);break
     if failure:break
    if failure:break
   if failure:break
  if failure:break
 rec=dict(status='exact finite structural probe; not a root refutation',inputs=inputs,tested=tested,failure=failure,seconds=time.monotonic()-start)
 Path('evidence/markov-6d2c5a67/aligned-matroid.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
