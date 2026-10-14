"""Machine-authored positive 3-state transfer for exact degree groups."""
from pathlib import Path
from itertools import product
from math import gcd
import time,json
from degree_groups_07a7 import grouped
O=Path('evidence/markov-07a7e5b7')
def add(*ps):
 q={}
 for p in ps:
  for ij,c in p.items():q[ij]=q.get(ij,0)+c
 return q
def shift(p,s=0,d=0,j=0,c=1):return {(a+s,b+d,k+j):v*c for (a,b,k),v in p.items()}
def smooth(p):return add(p,shift(p,j=1))
def transfer(w):
 W={(0,0,0):1};H={(0,1,0):1,(0,1,1):1};Z={(0,1,0):1}
 for r in w:
  if r:
   C=shift(smooth(H),s=1,d=1)
   W,H,Z=add(W,C),add(shift(H,d=1,j=1),shift(smooth(Z),d=1),shift(smooth(C),d=1)),add(shift(Z,d=1),shift(C,d=1))
  else:
   C=shift(H,s=1)
   W,H,Z=add(W,C),add(W,shift(smooth(C),d=1)),add(W,shift(C,d=1))
 return W
def main():
 t=time.monotonic();words=coeffs=0
 inputs=list(product([0,1],repeat=0))
 inputs=[w for n in range(10) for w in product([0,1],repeat=n)]
 inputs += [tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,) for b in range(2,26) for a in range(1,b) if gcd(a,b)==1]
 for w in inputs:
  T=transfer(w);G=grouped(w);D={(s,d,j):c for (s,d),p in G.items() for j,c in enumerate(p)}
  assert T==D,(w,T,D)
  words+=1;coeffs+=len(T)
 rec=dict(status='finite exact identity tests, not proof',words=words,coefficient_identities=coeffs,seconds=time.monotonic()-t)
 (O/'degree-transfer.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
