"""Machine-authored exact exploratory predicates; not universal proof."""
from experiment_terminal_263d8c71 import pair
from itertools import product
from math import comb
from pathlib import Path
import json, time, random
O=Path('/Users/sasha/math_gkm/evidence/markov-aa6c518b')
def main():
 st=time.monotonic(); rng=random.Random(129063)
 words=[(0,)+w for n in range(10) for w in product((0,1),repeat=n)]
 words += [(0,)+tuple(rng.randrange(2) for _ in range(rng.randrange(10,55))) for _ in range(200)]
 counts={k:0 for k in ['lc','ulc_support','ulc_degree']}; failures={}; examples={}
 for w in words:
  p=pair(w)[1]; d=len(w)+sum(w)-1
  for j in range(d+1):
   cs=[p.get((i,j),0) for i in range(d-j+1)]
   inds=[i for i,x in enumerate(cs) if x]
   if not inds:continue
   lo,hi=inds[0],inds[-1]
   for i in range(len(cs)-2):
    x,y,z=cs[i:i+3]
    tests={'lc':y*y-x*z}
    N=d-j;k=i+1
    tests['ulc_degree']=y*y*k*(N-k)-x*z*(k+1)*(N-k+1)
    if lo<=i and i+2<=hi:
     N=hi-lo;k=i+1-lo
     tests['ulc_support']=y*y*k*(N-k)-x*z*(k+1)*(N-k+1)
    for key,g in tests.items():
     counts[key]+=1
     if g<0:
      failures[key]=failures.get(key,0)+1
      examples.setdefault(key,dict(word=w,j=j,i=i,triple=[x,y,z],gap=g,support=[lo,hi]))
 out=dict(status='Finite exact enlarged-word test, not proof',words=len(words),counts=counts,failures=failures,examples=examples,seconds=time.monotonic()-st)
 (O/'horizontal-experiments.json').write_text(json.dumps(out,indent=2)+'\n'); print(json.dumps(out))
if __name__=='__main__':main()
