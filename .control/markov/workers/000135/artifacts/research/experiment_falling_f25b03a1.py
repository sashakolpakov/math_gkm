"""Exact signed-seed experiment for the arbitrary-degree raw-gap identity.
No mathematical theorem follows from these finite checks.
"""
from pathlib import Path
from math import comb
import random,json,time
O=Path('evidence/markov-f25b03a1')
def F(x,d):
 z=1
 for r in range(d):z*=x-r
 return z
def coeff(c,n,d,k):
 return sum(a*comb(n-d,k-r) for r,a in enumerate(c) if 0<=k-r<=n-d)
def H(c,d,k,l):return sum(a*F(k,r)*F(l,d-r) for r,a in enumerate(c))
def run():
 start=time.monotonic();rng=random.Random(25250301);counts=dict(seeds=0,coefficient_identities=0,gap_identities=0,iff_checks=0,zero_triples=0,negative_seed_cases=0);fail=[]
 for d in range(13):
  for n in range(d,27):
   for sample in range(8):
    c=[rng.randrange(-7,12) for _ in range(d+1)] if sample else [0]*(d+1)
    counts['seeds']+=1;counts['negative_seed_cases']+=int(any(x<0 for x in c))
    q=[coeff(c,n,d,k) for k in range(n+4)]
    for k in range(n+1):
     counts['coefficient_identities']+=1
     if F(n,d)*q[k]!=comb(n,k)*H(c,d,k,n-k):fail.append(['coeff',d,n,c,k])
    for i in range(n-1):
     j=n-i-2;h0,h1,h2=H(c,d,i,j+2),H(c,d,i+1,j+1),H(c,d,i+2,j)
     G=(i+2)*(j+2)*h1*h1-(i+1)*(j+1)*h0*h2
     gap=q[i+1]**2-q[i]*q[i+2]
     counts['zero_triples']+=int(0 in q[i:i+3]);counts['gap_identities']+=1;counts['iff_checks']+=1
     if (i+2)*(j+2)*F(n,d)**2*gap!=comb(n,i+1)**2*G:fail.append(['gap',d,n,c,i])
     if (gap>=0)!=(G>=0):fail.append(['iff',d,n,c,i])
 out=dict(status='Finite exact signed-seed identity checks only.',counts=counts,failures=fail,seconds=time.monotonic()-start)
 (O/'falling-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
