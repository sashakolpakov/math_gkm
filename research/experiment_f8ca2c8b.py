"""Machine-authored f8ca2c8b. Exact finite comparison, explicitly not proof."""
from pathlib import Path
from math import comb
import time,json,hashlib
from explore_two_f8ca2c8b import corrected as two
from small_blocks_ae257c53 import blocks,divplus
from third_seed_ead8a96f import source3,path_for
O=Path('/Users/sasha/math_gkm/evidence/markov-f8ca2c8b')
def three(a,r):
 bs=blocks(a,r)
 for k in range(7):bs[0][0,k+3-r]=bs[0].get((0,k+3-r),0)+6*(-1)**k*comb(6,k)
 return [{k:v for k,v in d.items() if v} for d in bs]
def main():
 start=time.monotonic();records=[];ids=adj=zeros=0
 for a,r in [(2,1),(3,1),(3,2)]:
  bs=(two if a==2 else three)(a,r)
  for _ in range(7-a):bs=[divplus(d) for d in bs]
  for q in list(range(1,65))+[97,129,257]:
   b=a*q+r;aa,bb,p=source3(path_for(a,b));assert (aa,bb)==(a,b)
   raw=[p.get((3,j),0) for j in range(a+b+7)]
   shift=q+2 if a==2 else 3-r
   pred=[]
   for k in range(len(raw)):
    j=k+shift
    pred.append(sum(c*q**i*comb(j-band*q-off+5,5) for band,d in enumerate(bs) for (i,off),c in d.items() if j>=band*q+off))
   assert pred==[6*v for v in raw],(a,r,q)
   ids+=len(raw);zeros+=raw.count(0)
   for j in range(len(raw)-2):
    assert raw[j]*raw[j+2]<=raw[j+1]**2,(a,r,q,j)
    adj+=1
   records.append(dict(a=a,b=b,q=q,raw_sha256=hashlib.sha256(str(raw).encode()).hexdigest()))
  (O/'experiments-progress.json').write_text(json.dumps(dict(status='Finite experiment in progress, not proof',records=records,coefficient_comparisons=ids,adjacent_checks=adj,zeros=zeros),indent=2)+'\n')
 out=dict(status='Exact finite source recurrence comparisons, not proof',records=records,coefficient_comparisons=ids,adjacent_checks=adj,zeros=zeros,failures=[],seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='records'}))
if __name__=='__main__':main()
