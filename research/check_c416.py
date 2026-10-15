"""Machine-authored independent literal source and weighted-layer checks."""
from pathlib import Path
from math import comb
from fractions import Fraction
import json,time
from aligned_probe_6d2c import transfer
O=Path('evidence/markov-c4169865');start=time.monotonic()
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,c in q.items():r[k]=r.get(k,0)-c
 return {k:c for k,c in r.items() if c}
def source(path):
 S={(0,0):1,(1,0):1,(0,1):1}
 lo=(0,1,{(0,0):1});mid=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for right in path:
  if right:
   nxt=(mid[0]+hi[0],mid[1]+hi[1],sub(mul(mul(S,hi[2]),mid[2]),mul({(hi[0],hi[1]):1},lo[2])))
   lo,mid=mid,nxt
  else:
   nxt=(lo[0]+mid[0],lo[1]+mid[1],sub(mul(mul(S,lo[2]),mid[2]),mul({(lo[0],lo[1]):1},hi[2])))
   hi,mid=mid,nxt
 return mid
raw=[]
for n in range(3,19):
 a,b,p=source([True]*n+[False]);pts=[(n+3,n-1),(n+2,n),(n+1,n+1)];vals=[p.get(t,0) for t in pts]
 guards=[a*b<=b*i+a*j and i+j<=a+b-1 for i,j in pts]
 assert (a,b)==(2*n+1,2*n+3) and vals==[20,12,4] and all(guards)
 F=transfer((1,)*n+(0,)+(1,)*(n+1),1)
 for z in [Fraction(1,100),Fraction(1),Fraction(2)]:
  got=[sum(v*z**d for (s,d,j),v in F.items() if s==1 and j==jj) for jj in range(n-1,n+2)]
  expected=[z**(n-1)*(3+7*z+10*z*z),z**n*(3+9*z),4*z**(n+1)]
  assert got==expected
  assert got[1]**2-got[0]*got[2]==z**(2*n)*(-3+26*z+41*z*z)
 raw.append(dict(n=n,a=a,b=b,points=pts,values=vals,guards=guards,gap=64))
checks=0;triples=0
for n in range(1,15):
 F=transfer((1,)*n,n)
 for s in range(n):
  for N in range(n-s):
   weights=[[1]*(N+1),[comb(N,r) for r in range(N+1)],[100**r for r in range(N+1)],[comb(r+2,2) for r in range(N+1)]]
   for q in weights:
    vals=[sum(q[r]*F.get((s+1,2*s+2+N-r,j),0) for r in range(N+1)) for j in range(2*n+3)]
    R=[comb(j+s,s)*sum(q[r]*comb(N-j-r+s,s) for r in range(N-j+1)) if j<=N else 0 for j in range(2*n+3)]
    expected=[sum(comb(2*s+2,t)*R[j-t] for t in range(min(j,2*s+2)+1)) for j in range(2*n+3)]
    assert vals==expected;checks+=len(vals)
    for j in range(len(vals)-2):assert vals[j+1]**2>=vals[j]*vals[j+2];triples+=1
rec=dict(status='finite exact independent computations, not universal proofs',raw_sources=raw,weighted_formula_positions=checks,weighted_inequalities=triples,seconds=time.monotonic()-start)
(O/'independent-checks.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(raw_sources=len(raw),weighted_formula_positions=checks,weighted_inequalities=triples,seconds=rec['seconds'])))
