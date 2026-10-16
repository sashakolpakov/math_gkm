"""Machine-authored gas-word enlargement probe; finite evidence only."""
from experiment_terminal_263d8c71 import A,C,add,sh
from pathlib import Path
from itertools import product
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-263d8c71')
st=time.monotonic();counts={};fail={};examples={};zeros=0
words=[(0,)+w for n in range(12) for w in product([0,1],repeat=n)]
rng=random.Random(2631122)
words += [tuple([0]+[rng.randrange(2) for _ in range(rng.randrange(13,60))]) for _ in range(150)]
done=0
for w in words:
 q,p={(0,0):1},{}
 for z in w:q,p=(C if z else A)(q,p)
 deg=max((i+j for i,j in p),default=0)
 for j in range(deg+2):
  for i in range(deg+2-j):
   t=[p.get((i+k,j),0) for k in range(3)]
   zeros+=int(0 in t)
   kind='row_'+str(min(j,4))
   counts[kind]=counts.get(kind,0)+1
   if t[1]**2<t[0]*t[2]:
    fail[kind]=fail.get(kind,0)+1
    if kind not in examples:examples[kind]={'word':w,'i':i,'j':j,'triple':t,'gap':t[1]**2-t[0]*t[2]}
 done+=1
 if done%200==0:(O/'atomic-progress.json').write_text(json.dumps({'done':done,'failures':fail,'examples':examples}))
 if time.monotonic()-st>90:break
out={'status':'Finite exact raw gas-word enlargement scan','words':done,'planned':len(words),'counts':counts,'failures':fail,'first_examples':examples,'zero_triples':zeros,'seconds':time.monotonic()-st}
(O/'atomic-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
