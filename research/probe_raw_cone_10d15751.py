"""Machine-authored test of raw horizontal closure cones; not a proof."""
from experiment_8833 import add,mul
from pathlib import Path
from itertools import product
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-10d15751')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(x,one)
def astep(q,p):return mul(y,add(q,mul(x,p))),add(q,mul(h,p))
def cstep(q,p):
 pp=add(q,mul(x,p));return add(q,mul(y,pp)),pp
def row(p,r):return {i:v for (i,j),v in p.items() if j==r}
def compare(p,q,kind,w,r):
 for i in range(max(max(p,default=0),max(q,default=0))+1):
  t=[p.get(i+k,0) for k in range(3)];s=[q.get(i+k,0) for k in range(3)]
  gap=2*t[1]*s[1]-t[0]*s[2]-s[0]*t[2]
  counts[kind]=counts.get(kind,0)+1
  if gap<0:
   failures[kind]=failures.get(kind,0)+1
   if kind not in examples:examples[kind]=dict(word=w,row=r,index=i,p=t,q=s,gap=gap)
start=time.monotonic();counts={};failures={};examples={}
words=[list(w) for n in range(1,9) for w in product([False,True],repeat=n)]
rng=random.Random(1015751)
words += [[rng.choice([False,True]) for _ in range(rng.randrange(9,31))] for t in range(120)]
for w in words:
 q,p=one,{}
 for bit in [False]+w:
  q,p=astep(q,p)
  if bit:q,p=cstep(q,p)
 xp=mul(x,p);hp=mul(h,p);nextq=add(q,xp);nextp=add(q,hp)
 for r in range(max(j for i,j in p)+2):
  meta=[False]+w
  compare(row(p,r),row(p,r),'P_horizontal',meta,r)
  compare(row(q,r),row(q,r),'Q_horizontal',meta,r)
  compare(row(q,r),row(p,r),'same_row',meta,r)
  compare(row(q,r),row(xp,r),'next_Q',meta,r)
  compare(row(q,r),row(hp,r),'next_P',meta,r)
  compare(row(nextq,r-1),row(mul(x,nextp),r),'B_P_group',meta,r)
out=dict(status='Finite exact strategy test, enlarged family',words=len(words),comparisons=counts,
 failures=failures,first_examples=examples,seconds=time.monotonic()-start)
(O/'raw-cone-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
