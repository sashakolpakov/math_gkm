"""Machine-authored independent exact checks of the smoothed cubic and word bridge."""
from pathlib import Path
from math import comb,gcd
from itertools import product
import json,time,random
from probe_full_aggregate_f52ba141 import A,C
from experiment_8833 import source,path_for
O=Path('/Users/sasha/math_gkm/evidence/markov-f52ba141')
def choose(n,k):return comb(n,k) if 0<=k<=n else 0
def qcoeff(n,m,t):return [4*t,9*m*m+13*m+6,6*m*m+6*m*n+8*m+6*n+6,(m+n+2)*(m+n+1)]
def smooth(n,q,i):return sum(c*choose(n-3,i-j) for j,c in enumerate(q))
def raw(w):
 p={};q={(0,0):1}
 for bit in w:
  q,p=A(q,p)
  if bit:q,p=C(q,p)
 return p
def main():
 start=time.monotonic();envelope=words=identities=triples=zeros=source_ids=0;bad=[]
 for n in range(3,41):
  for m in range(0,2*n+1):
   for t in sorted(set([0,1,2*m//3,m,2*m-1,2*m])):
    if not 0<=t<=2*m:continue
    q=qcoeff(n,m,t);cs=[smooth(n,q,i) for i in range(n+3)]
    for i in range(n+1):
     assert cs[i+1]**2>=cs[i]*cs[i+2],(n,m,t,i)
     envelope+=1;zeros+=int(cs[i+1]==0)
 rng=random.Random(52521412)
 cores=[w for n in range(3,11) for w in product([False,True],repeat=n)]
 cores += [tuple(rng.choice([False,True]) for _ in range(rng.randrange(11,65))) for _ in range(100)]
 for w in cores:
  n=len(w);m=sum(w);t=int(w[0])+int(w[-1])+2*sum(a and b for a,b in zip(w,w[1:]));q=qcoeff(n,m,t)
  p=raw((False,)+w+(True,));words+=1
  for i in range(n+m+4):
   v=smooth(n,q,i-m)
   assert 2*p.get((i,2),0)==v,(w,i,v,p.get((i,2),0));identities+=1
   assert p.get((i+1,2),0)**2>=p.get((i,2),0)*p.get((i+2,2),0);triples+=1
 for b in range(2,31):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple(bool((k+1)*a//b-k*a//b) for k in range(b));p=raw(w)
   aa,bb,s=source(path_for(a,b));assert (aa,bb)==(a,b)
   for i in range(a+b+2):assert p.get((i,2),0)==s.get((i,2),0);source_ids+=1
 for n in range(14,501):
  q=qcoeff(n+1,1,1);assert q[1]**2<q[0]*q[2]
  cs=[smooth(n+1,q,i)//2 for i in range(3)]
  assert cs==[2,2*n+10,n*n+15*n-6]
  assert cs[1]**2-cs[0]*cs[2]==2*n*n+10*n+112
 out={'status':'Finite exact experiments only; Lean proofs are separate','envelope_comparisons':envelope,'envelope_zero_centers':zeros,'arbitrary_cores':words,'word_coefficient_identities':identities,'word_adjacent_comparisons':triples,'source_coefficient_identities':source_ids,'rescue_parameters_checked':[14,500],'rescue_n16_triple':[2,42,490],'failures':bad,'seconds':time.monotonic()-start}
 (O/'second-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
