"""Machine-authored block-balanced enlargement tests; all zeros retained."""
from experiment_terminal_263d8c71 import pair
from itertools import product
from math import gcd
from pathlib import Path
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-aa6c518b')
def main():
 st=time.monotonic();rng=random.Random(129066)
 inputs=[(n,z) for n in range(4) for m in range(2,10) for z in product((0,1),repeat=m) if z[0]==1 and z[-1]==0]
 inputs += [(rng.randrange(6),tuple([1]+[rng.randrange(2) for _ in range(rng.randrange(10,35))]+[0])) for _ in range(160)]
 counts={k:0 for k in ['horizontal','vertical','diagonal']};fails={};examples={};zeros=0;done=0
 for n,z in inputs:
  w=tuple(x for r in z for x in ([0]*(n+r)+[1])); a=sum(w);b=len(w)
  if gcd(a,b)!=1:continue
  p=pair(w)[1];d=a+b-1
  for j in range(d+1):
   for i in range(d-j+1):
    for name,pts in [('horizontal',[(i,j),(i+1,j),(i+2,j)]),('vertical',[(i,j),(i,j+1),(i,j+2)]),('diagonal',[(i,j+2),(i+1,j+1),(i+2,j)])]:
     if not all(a*b<=b*x+a*y and x+y<=d for x,y in pts):continue
     cs=[p.get(pt,0) for pt in pts];gap=cs[1]**2-cs[0]*cs[2]
     counts[name]+=1;zeros+=int(0 in cs)
     if gap<0:
      fails[name]=fails.get(name,0)+1
      examples.setdefault(name,dict(n=n,z=z,a=a,b=b,word=w,points=pts,triple=cs,gap=gap))
  done+=1
  if time.monotonic()-st>65:break
 out=dict(status='Finite exact block-balanced enlarged-word test; polygon guards retained',words=done,counts=counts,failures=fails,examples=examples,zeros=zeros,last_input=[n,z],seconds=time.monotonic()-st)
 (O/'block-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
