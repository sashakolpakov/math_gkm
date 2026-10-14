"""Machine-authored exact repeated-B layer/interval formula validation."""
from pathlib import Path
from math import comb
from degree_transfer_07a7 import transfer
from cuts_fe01 import mul
import json,time
O=Path('evidence/markov-6d34d54a')
def layer(s,m):
 return mul([comb(2*s,k) for k in range(2*s+1)],
   [comb(j+s-1,s-1)*comb(m-j+s-1,s-1) for j in range(m+1)])
def interval(s,L,H):
 return mul([comb(2*s,k) for k in range(2*s+1)],
  [comb(j+s-1,s-1)*sum(comb(H-j-r+s-1,s-1) for r in range(H-L+1) if j+r<=H) for j in range(H+1)])
def main():
 start=time.monotonic();layer_tests=interval_tests=coeffs=0;inputs=[]
 for n in range(1,33):
  F=transfer((1,)*n);G={}
  for (s,d,j),c in F.items():G.setdefault((s,d),{})[j]=c
  for s in range(1,n+1):
   for m in range(n-s+1):
    got=G.get((s,2*s+m),{});expected=layer(s,m)
    assert got==dict(enumerate(expected)),(n,s,m,got,expected)
    coeffs+=len(expected);layer_tests+=1
   for L in range(n-s+1):
    accum={}
    for H in range(L,n-s+1):
     for j,c in G[s,2*s+H].items():accum[j]=accum.get(j,0)+c
     expected=interval(s,L,H)
     assert accum==dict(enumerate(expected)),(n,s,L,H)
     coeffs+=len(expected);interval_tests+=1
  inputs.append(n)
 rec=dict(status='finite exact identities only; not universal proof',word_lengths=inputs,layer_identities=layer_tests,interval_identities=interval_tests,coefficient_identities=coeffs,seconds=time.monotonic()-start)
 (O/'run-formula.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
