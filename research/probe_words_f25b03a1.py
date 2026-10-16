"""Machine-authored all-direction enlarged-word probe; experiments are not proofs.
Exact positive raw Cohn multiplication, no normalization and zeros retained.
"""
from pathlib import Path
from itertools import product
import json,time,random,sys
sys.path.insert(0,'evidence/markov')
from scan import add
O=Path('evidence/markov-f25b03a1')
def sh(p,a=0,b=0):return {(i+a,j+b):c for (i,j),c in p.items()}
def step(q,p,z):
 q,p=sh(add(q,sh(p,1)),b=1),add(q,add(p,sh(p,1)))
 if z:
  r=add(q,sh(p,1));q,p=add(q,sh(r,b=1)),r
 return q,p
def run():
 start=time.monotonic();counts={};fail={};first={};done=0
 words=[(False,)+w+(True,) for n in range(11) for w in product([False,True],repeat=n)]
 rng=random.Random(25250301)
 words += [tuple([False]+[rng.choice([False,True]) for _ in range(rng.randrange(12,55))]+[True]) for _ in range(160)]
 for w in words:
  q,p={(0,0):1},{}
  for z in w:q,p=step(q,p,z)
  degree=max(i+j for i,j in p)
  for di,dj in [(1,0),(0,1),(1,-1)]:
   key=f'{di},{dj}'
   for i in range(degree+2):
    for j in range(max(0,-2*dj),degree+2-i):
     pts=[(i+r*di,j+r*dj) for r in range(3)]
     x,y,z=[p.get(pt,0) for pt in pts]
     counts[key]=counts.get(key,0)+1
     if y*y<x*z:
      fail[key]=fail.get(key,0)+1
      if key not in first:
       a=sum(w);b=len(w)
       first[key]={'word':''.join('B' if z else 'A' for z in w),'a':a,'b':b,'points':pts,'coefficients':[x,y,z],'reversed_gap':x*z-y*y,'mechanical_word':all(sum(w[:k])==k*a//b for k in range(b+1))}
  done+=1
  if done%100==0:
   (O/'word-direction-progress.json').write_text(json.dumps(dict(words=done,counts=counts,failures=fail,first=first,seconds=time.monotonic()-start),indent=2)+'\n')
  if time.monotonic()-start>150:break
 out=dict(status='Finite exact enlarged-family experiment; a non-source failure is not a root refutation.',words=done,planned=len(words),counts=counts,failures=fail,first=first,seconds=time.monotonic()-start)
 (O/'word-directions.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
