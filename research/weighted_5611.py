"""Exact nonnegative independently weighted C-site horizontal tests."""
import json,random,time
from aggregate_a3c5 import add,shift,core
from probe_5611 import OUT
def weighted(w,ts):
 f=g={(0,0):1};k=0
 for r in reversed(w):
  h=add(shift(f,0,1),shift(g,1,0))
  if r:f,g=add(h,{ij:ts[k]*c for ij,c in f.items()}),h;k+=1
  else:f,g=h,add(h,g)
 return add(shift(f,0,1),shift(g,1,0))
rng=random.Random(5611);ct=triples=0;found=None;start=time.monotonic()
for z in range(2000):
 a=rng.randrange(3,31);b=a+1;w=core(a,b)
 ts=[rng.choice([0,0,1,1,2,5,20,100]) for _ in range(a-1)]
 p=weighted(w,ts);ct+=1
 for (i,j),c in p.items():
  h=p.get((i+2,j),0)
  if not h:continue
  m=p.get((i+1,j),0);triples+=1
  if m*m<c*h:found=dict(a=a,b=b,weights=ts,position=[i,j],coefficients=[c,m,h]);break
 if found:break
 if z%100==0:print(z,triples,flush=True)
rec=dict(cases=ct,triples=triples,first_failure=found,seconds=time.monotonic()-start,status='finite experiment, independently weighted source deformation')
(OUT/'weighted.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
