"""Exact truncated-row experiments. Discard only rows above cutoff; no low-row effect."""
from pathlib import Path
from math import gcd
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-10d15751')
N=8
def lin(*terms):
 d={}
 for p,di,dj,c in terms:
  for (i,j),v in p.items():
   if j+dj<=N:d[i+di,j+dj]=d.get((i+di,j+dj),0)+c*v
 return d
def astep(f,g):return lin((f,0,1,1),(f,1,1,1),(g,1,1,1)),lin((f,0,0,1),(g,0,0,1))
def cstep(f,g):
 m=lin((f,0,0,1),(f,1,0,1),(g,1,0,1))
 return lin((f,0,0,1),(m,0,1,1),(m,1,1,1)),m
def lc(p,meta,kind):
 for j in range(N+1):
  row={i:v for (i,r),v in p.items() if r==j}
  if not row:continue
  lo=min(row);hi=max(row)
  for i in range(lo-2,hi+1):
   v=[row.get(i+t,0) for t in range(3)]
   counts[kind]=counts.get(kind,0)+1
   zeros[kind]=zeros.get(kind,0)+v.count(0)
   if v[1]**2<v[0]*v[2]:
    failures[kind]=failures.get(kind,0)+1
    if len(examples.get(kind,[]))<4:examples.setdefault(kind,[]).append(dict(**meta,row=j,index=i,triple=v,gap=v[1]**2-v[0]*v[2]))
start=time.monotonic();counts={};zeros={};failures={};examples={};seen=set()
cases=[(a,b) for b in range(2,71) for a in range(1,b) if gcd(a,b)==1]
rng=random.Random(10_157_51)
for _ in range(120):
 b=rng.randrange(71,401);a=rng.randrange(1,b)
 if gcd(a,b)==1:cases.append((a,b))
for num,(a,b) in enumerate(cases):
 w=[(k+1)*a//b-k*a//b for k in range(b)]
 f,g={(0,0):1},{}
 for t,bit in enumerate(w):
  f,g=astep(f,g)
  if bit:f,g=cstep(f,g)
  key=tuple(w[:t+1])
  if key not in seen:
   seen.add(key);lc(g,dict(source=[a,b],prefix=t+1),'prefix_H')
 lc(f,dict(source=[a,b],prefix=b),'source_F')
 lc(g,dict(source=[a,b],prefix=b),'source_H')
 if num%100==0:
  (O/'truncated-progress.json').write_text(json.dumps(dict(cases=num+1,seconds=time.monotonic()-start,counts=counts,failures=failures,examples=examples),indent=2)+'\n')
out=dict(status='Exact finite experiment only',row_cutoff=N,inputs=cases,unique_prefixes=len(seen),
 comparisons=counts,zero_entries_in_tested_triples=zeros,failures=failures,examples=examples,seconds=time.monotonic()-start)
(O/'truncated-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='inputs'}))
