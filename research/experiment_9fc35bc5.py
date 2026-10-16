"""Machine-authored exact finite source comparisons for the new remainder region.
Experiments, never universal proofs. Literal coefficients and zeros retained.
"""
from pathlib import Path
from math import comb,gcd
import json,time,hashlib
from third_seed_ead8a96f import source3,path_for
from experiment_1152282d import numerator
O=Path('/Users/sasha/math_gkm/evidence/markov-9fc35bc5')
def main():
 start=time.monotonic();records=[];ids=checks=zeros=0
 for q in [5,8,17,41,97]:
  for a in range(7,24):
   for r in range(1,a):
    if gcd(a,r)!=1 or not (a<3*r and 2*r<a):continue
    b=a*q+r
    aa,bb,p=source3(path_for(a,b));assert (aa,bb)==(a,b)
    raw=[p.get((3,j),0) for j in range(a+b+5)]
    num=numerator(a,r,q)
    seed=[sum(v*comb(j-k+5,5) for k,v in enumerate(num) if k<=j) for j in range(3*q+13)]
    assert min(seed)>=0 and all(z==0 for z in seed[3*q+7:])
    pred=[0]*len(raw);off=b-3*q-3
    for k,c in enumerate(seed):
     for h in range(a-6):
      if off+k+h<len(pred):pred[off+k+h]+=c*comb(a-7,h)
    assert pred==[6*c for c in raw]
    ids+=len(raw);zeros+=raw.count(0)
    for j in range(len(raw)-2):
     assert raw[j]*raw[j+2]<=raw[j+1]**2
     checks+=1
    records.append(dict(a=a,b=b,q=q,r=r,sha256=hashlib.sha256(str(raw).encode()).hexdigest()))
  print(q,len(records),flush=True)
 out=dict(status='Exact finite experiment only',fractions=len(records),raw_coefficient_comparisons=ids,raw_adjacent_checks=checks,raw_zeros=zeros,failures=[],records=records,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='records'}))
if __name__=='__main__':main()
