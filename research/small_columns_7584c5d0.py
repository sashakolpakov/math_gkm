"""Machine-authored finite small-numerator correction diagnosis. No proof."""
from pathlib import Path
import json
from experiment_allrun_de6168c6 import jets,seed,mul,shift,scale,add
from vertical_second_9e104e0c import source2
from experiment_8833 import path_for
O=Path('/Users/sasha/math_gkm/evidence/markov-7584c5d0')
def main():
 A,B,F=jets(31);records=[]
 for a,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
  for q in range(1,31):
   b=a*q+r;aa,bb,p=source2(path_for(a,b));assert (aa,bb)==(a,b)
   raw=[p.get((2,j),0) for j in range(a+b+4)]
   h=[1]
   for _ in range(5-a):h=mul(h,[1,1])
   actual=scale(mul(raw,h),2)
   N=seed(q-1,a,r,A,B,F);off=b-2*q-2
   if off>=0:expected=shift(N,off)
   else:actual=shift(actual,-off);expected=N
   diff=add(actual,scale(expected,-1));terms=[[i,c] for i,c in enumerate(diff) if c]
   assert all(raw[j]*raw[j+2]<=raw[j+1]**2 for j in range(len(raw)-2))
   records.append(dict(a=a,r=r,q=q,b=b,cleared_correction=terms))
 out=dict(status='Finite exact correction diagnosis, not a source theorem',cases=len(records),records=records)
 (O/'small-column-corrections.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps([x for x in records if x['q']<=3]))
if __name__=='__main__':main()
