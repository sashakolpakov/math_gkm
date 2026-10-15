"""Machine-authored independent exact raw recurrence comparisons, finite only."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from rational_third_bdee import P,coefficient
from verify_third_75ad import source,path_for,backward
O=Path('evidence/markov-bdee9a64');start=time.monotonic()
d=json.loads((O/'rational-normalization.json').read_text())
p=P({tuple(k):F(v) for k,v in d['numerator']})
def h(n,j):return n+1 if j==0 else 3*n if j==1 else 4*max(n-j+1,0) if j>=2 else 0
def first(n,c,r,j):return (c-r)*h(n,j)+r*h(n+1,j)-(int(j==0)+int(j==1))
def value(n,c,r,j):
 q=max(2*r-c,0);t=min(c-r,max(3*r-c,0));u=max(3*r-2*c,0)
 z=coefficient(p,n,c,r,q,t,u,j)
 b=c*(n+1)+r
 if c==2:z-=6*first(n,c,r,j-b)+12*(int(j==b)+int(j==b+1))
 if c==3:z+=6*int(j==b)
 assert z.denominator==1
 return int(z)
raw_positions=back_positions=triples=fractions=0;examples=[]
for b in range(3,37):
 for a in range(1,b-1):
  if gcd(a,b)!=1:continue
  c=b-a;n=a//c;r=a%c
  if not r:continue
  aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
  word=tuple((k+1)*a//b-k*a//b for k in range(1,b))
  back=backward(word,3);fractions+=1
  for j in range(a+b+4):
   v=value(n,c,r,j)
   assert v==6*back.get(j,0),(a,b,j,v,back.get(j,0))
   back_positions+=1
   if j<=a+3:
    i=a+3-j
    assert v==6*raw.get((i,j),0),(a,b,i,j,v)
    raw_positions+=1
  for j in range(a+2):
   i=a+1-j;pts=[(i,j+2),(i+1,j+1),(i+2,j)]
   if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):
    vals=[raw.get(pt,0) for pt in pts]
    assert vals[1]**2>=vals[0]*vals[2]
    triples+=1
  if c<=3 and n>=3:examples.append(dict(a=a,b=b,n=n,c=c,r=r))
result=dict(status='Finite exact experiments, not universal proof',denominator_bound=36,sources=fractions,raw_positions=raw_positions,backward_positions=back_positions,polygon_triples=triples,small_cycle_examples=examples,seconds=time.monotonic()-start)
(O/'source-experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result),flush=True)
