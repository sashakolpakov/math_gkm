"""Machine-authored live 75ad68f9. Exact rational Sturm experiments, not proofs."""
from pathlib import Path
import sys,json,time
from fractions import Fraction as F
from itertools import product
from math import gcd
sys.path.insert(0,str(Path(__file__).parent))
from activity_b485 import transfer
O=Path('evidence/markov-75ad68f9')
def trim(p):
 while p and p[-1]==0:p.pop()
 return p
def rem(p,q):
 p=p[:]
 while len(p)>=len(q) and p:
  c=p[-1]/q[-1];d=len(p)-len(q)
  for k,v in enumerate(q):p[k+d]-=c*v
  trim(p)
 return p
def realroots(p):
 p=trim([F(x) for x in p]); seq=[p,trim([k*p[k] for k in range(1,len(p))])]
 if not seq[-1]:return 0,0
 while seq[-1]:
  r=[-x for x in rem(seq[-2],seq[-1])]
  if not r:break
  r=[x/abs(r[-1]) for x in r];seq.append(r)
 def variations(signs):return sum(a!=b for a,b in zip(signs,signs[1:]))
 pos=[1 if q[-1]>0 else -1 for q in seq]
 neg=[x*(-1)**(len(q)-1) for x,q in zip(pos,seq)]
 return variations(neg)-variations(pos),len(p)-len(seq[-1])
def main():
 start=time.monotonic();checks=0;inputs=[];fail=None
 for b in range(3,35):
  for a in range(1,b):
   if gcd(a,b)>1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
   P=transfer(w,[1]*len(w));inputs.append([a,b])
   for j in range(a+b):
    p=trim([P.get((s,j),0) for s in range(b)])
    while p and p[0]==0:p.pop(0)
    if len(p)<3:continue
    nr,deg=realroots(p);checks+=1
    if nr!=deg:
     fail=dict(a=a,b=b,j=j,coefficients=p,distinct_real_roots=nr,squarefree_degree=deg);break
   if fail or time.monotonic()-start>35:break
  if fail or time.monotonic()-start>35:break
 rec=dict(status='finite exact Sturm experiment only',checks=checks,inputs=inputs,failure=fail,seconds=time.monotonic()-start)
 (O/'horizontal-sturm.json').write_text(json.dumps(rec,indent=2));print(json.dumps(rec))
if __name__=='__main__':main()
