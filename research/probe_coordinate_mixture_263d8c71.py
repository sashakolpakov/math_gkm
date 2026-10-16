"""Machine-authored full-degree polygon-guarded equal-count stress probe."""
from experiment_terminal_263d8c71 import pair
from itertools import combinations
from math import gcd
from pathlib import Path
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-263d8c71')
rng=random.Random(26310991);start=time.monotonic();counts={'horizontal':0,'vertical':0,'diagonal':0};fails={};examples={};pairs=0;inputs=[];zeros=0
params=[(a,b) for b in [13,17,23,31,43,59] for a in range(1,b) if gcd(a,b)==1]
rng.shuffle(params)
for a,b in params:
 n=b-2;m=a-1
 cores={tuple([0]*(n-m)+[1]*m),tuple([1]*m+[0]*(n-m)),tuple((m*(i+1)//n-m*i//n) for i in range(n))}
 for _ in range(4):
  w=[0]*(n-m)+[1]*m;rng.shuffle(w);cores.add(tuple(w))
 ws=[(0,)+w+(1,) for w in sorted(cores)]
 inputs.append({'a':a,'b':b,'words':ws})
 ps=[pair(w)[1] for w in ws]
 for (u,p),(v,q) in combinations(list(enumerate(ps)),2):
  pairs+=1
  for j in range(a+b):
   for i in range(a+b-j):
    for name,pts in [('horizontal',[(i,j),(i+1,j),(i+2,j)]),('vertical',[(i,j),(i,j+1),(i,j+2)]),('diagonal',[(i,j+2),(i+1,j+1),(i+2,j)])]:
     if not all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):continue
     t=[p.get(z,0) for z in pts];s=[q.get(z,0) for z in pts]
     gap=2*t[1]*s[1]-t[0]*s[2]-t[2]*s[0]
     counts[name]+=1;zeros+=int(0 in t+s)
     if gap<0:
      fails[name]=fails.get(name,0)+1
      if name not in examples:examples[name]={'a':a,'b':b,'words':[ws[u],ws[v]],'points':pts,'triples':[t,s],'mixed_gap':gap}
 if len(inputs)%10==0:(O/'coordinate-mixture-progress.json').write_text(json.dumps({'fractions':len(inputs),'pairs':pairs,'counts':counts,'failures':fails,'examples':examples,'seconds':time.monotonic()-start}))
 if time.monotonic()-start>90:break
out={'status':'Finite exact enlarged-family pair experiment, not universal proof','inputs':inputs,'pairs':pairs,'comparisons':counts,'failures':fails,'first_examples':examples,'zero_comparisons':zeros,'seconds':time.monotonic()-start}
(O/'coordinate-mixture-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='inputs'}))
