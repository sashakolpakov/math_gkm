"""Exact independent mask enumeration, preserving all mask multiplicities."""
from itertools import product
from math import comb
from pathlib import Path
import json
N=7;heavy={1,2,4,5};layers={};mask_count=0
for bits in product([0,1],repeat=N):
 s=sum(bits);h=sum(bits[k] for k in heavy)
 d=sum(bits[k]*bits[k+1] for k in range(N-1))+bits[0]+bits[-1]
 for j in range(d+1):layers[s,j,h]=layers.get((s,j,h),0)+comb(d,j)
 mask_count+=1
triples=[[layers.get((s,2,h),0) for h in range(5)] for s in [2,3,4]]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
A,B,C=triples;gap=[x-y for x,y in zip(mul(B,B),mul(A,C))]
while gap and not gap[-1]:gap.pop()
shift=[sum(c*comb(k,j)*86**(k-j) for k,c in enumerate(gap) if k>=j) for j in range(len(gap))]
rec=dict(status='exact finite enumeration, not a universal proof',N=N,heavy=sorted(heavy),mask_count=mask_count,triples_ascending_t=triples,gap_ascending_t=gap,gap_at_n_plus_86=shift)
Path('evidence/markov-b485717c/activity-symbolic.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
