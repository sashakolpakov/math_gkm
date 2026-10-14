"""Find a small exact nonuniform-weight obstruction, not a source refutation."""
import itertools,json,time
from aggregate_a3c5 import add,shift,core
from probe_5611 import OUT
def weighted(w,ts):
 f=g={(0,0):1};k=0
 for r in reversed(w):
  h=add(shift(f,0,1),shift(g,1,0))
  if r:f,g=add(h,{ij:ts[k]*c for ij,c in f.items()}),h;k+=1
  else:f,g=h,add(h,g)
 return add(shift(f,0,1),shift(g,1,0))
found=None;ct=0;start=time.monotonic()
for a in range(3,15):
 for bg in [0,1]:
  for mask in itertools.product([bg,1000],repeat=a-1):
   p=weighted(core(a,a+1),mask);ct+=1
   for i,j in p:
    cs=[p.get((i+h,j),0) for h in range(3)]
    if cs[1]**2<cs[0]*cs[2]:found=dict(a=a,b=a+1,weights=mask,position=[i,j],coefficients=cs);break
   if found:break
  if found:break
 if found:break
 print(a,ct,flush=True)
rec=dict(cases=ct,first_failure=found,seconds=time.monotonic()-start,status='auxiliary deformation only')
(OUT/'minweight.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
