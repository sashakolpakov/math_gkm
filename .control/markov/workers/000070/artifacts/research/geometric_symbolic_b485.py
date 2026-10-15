"""Literal subset model, independent of scalar transfer implementation."""
from itertools import product
from math import comb
from pathlib import Path
import json
def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a):c[i]+=v
 for i,v in enumerate(b):c[i]+=v
 return c
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def mask(w,bits):
 p=[0,1];out=[1]
 for r,b in zip(w,bits):
  if b:
   out=mul(out,mul([1,1] if r else [1],add(p,[1])));p=[0,1]
  else:p=[0]+add(p,[2]) if r else [0]
 return out
w=(1,1,0,1,1,0,1,1,1);F={}
for bits in product([0,1],repeat=len(w)):
 s=sum(bits);e=sum((8-k)*b for k,b in enumerate(bits));p=mask(w,bits)
 for j,c in enumerate(p):F[s,j,e]=F.get((s,j,e),0)+c
triples=[[F.get((s,9,e),0) for e in range(37)] for s in [3,4,5]]
gap=[a-b for a,b in zip(mul(triples[1],triples[1]),mul(triples[0],triples[2]))]
while gap and gap[-1]==0:gap.pop()
v=next(k for k,c in enumerate(gap) if c);res=gap[v:]
shift=[sum(c*comb(k,j)*8**(k-j) for k,c in enumerate(res) if k>=j) for j in range(len(res))]
rec=dict(status='finite exact symbolic enumeration, not universal proof',word=w,triples=[[(e,c) for e,c in enumerate(p) if c] for p in triples],gap_valuation=v,residual_gap=res,residual_gap_shift8=shift)
Path('evidence/markov-b485717c/geometric-symbolic.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
