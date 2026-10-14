"""Exact C-site multiaffine refinement; finite research probe."""
import json,itertools,pathlib,time,math
from collections import defaultdict
from aggregate_a3c5 import core
from probe_5611 import OUT
def add(*ps):
 d=defaultdict(int)
 for p in ps:
  for k,v in p.items():d[k]+=v
 return dict(d)
def shift(p,x,y,k):return {(i+x,j+y,m+k):v for (i,j,m),v in p.items()}
def sites(w):
 f=g={(0,0,0):1};k=0
 for r in reversed(w):
  h=add(shift(f,0,1,0),shift(g,1,0,0))
  if r:f,g=add(h,shift(f,0,0,1<<(2*k))),h;k+=1
  else:f,g=h,add(h,g)
 return add(shift(f,0,1,0),shift(g,1,0,0))
def conv(p,q):
 d=defaultdict(int)
 for k,v in p.items():
  for l,w in q.items():d[k+l]+=v*w
 return d
start=time.monotonic();ct=triples=0;found=None
for b in range(2,17):
 for a in range(1,b):
  if math.gcd(a,b)!=1:continue
  if a>8:continue
  rows={}
  for (i,j,k),v in sites(core(a,b)).items():rows.setdefault((i,j),{})[k]=v
  ct+=1
  for i,j in rows:
   if (i+2,j) not in rows:continue
   low,mid,hi=[rows.get((i+h,j),{}) for h in range(3)]
   x,y=conv(mid,mid),conv(low,hi);gap={k:x[k]-y[k] for k in x.keys()|y.keys()};triples+=1
   neg={k:v for k,v in gap.items() if v<0}
   if neg:found=dict(a=a,b=b,word=core(a,b),position=[i,j],negative=neg,raw_gap=sum(gap.values()),coefficients=[low,mid,hi]);break
  if found:break
 if found:break
 print(b,ct,triples,flush=True)
rec=dict(sources=ct,triples=triples,first_failure=found,seconds=time.monotonic()-start,status='finite experiment, auxiliary refinement only')
(OUT/'sites.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
