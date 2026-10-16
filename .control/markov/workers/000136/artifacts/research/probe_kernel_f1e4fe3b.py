"""Exact symbolic and finite probes. No theorem claims from this computation."""
from collections import defaultdict
from pathlib import Path
import json,math,itertools
O=Path('evidence/markov-f1e4fe3b')
def const(n):return {(0,0,0):n} if n else {}
def var(i):return {tuple(int(j==i) for j in range(3)):1}
def add(*ps):
 d=defaultdict(int)
 for p in ps:
  for k,v in p.items():d[k]+=v
 return {k:v for k,v in d.items() if v}
def scale(p,n):return {k:v*n for k,v in p.items() if v*n}
def mul(*ps):
 d=const(1)
 for p in ps:
  e=defaultdict(int)
  for k,v in d.items():
   for l,w in p.items():e[tuple(x+y for x,y in zip(k,l))]+=v*w
  d=dict(e)
 return {k:v for k,v in d.items() if v}
def gap(a,b,t):
 a2=add(a,const(2));b2=add(b,const(2));at2=add(a,t,const(2));bt2=add(b,t,const(2))
 return add(scale(mul(a2,b2,at2,bt2),2),scale(mul(add(a,t,const(1)),add(b,t,const(1)),at2,bt2),-1),scale(mul(add(a,const(1)),add(b,const(1)),a2,b2),-1))
def show(p):return [{'powers':k,'coefficient':v} for k,v in sorted(p.items())]
a,b,t=map(var,range(3));p=gap(a,b,t)
results={'unshifted':show(p),'translated':{}}
for c in [0,1,2]:
 T=add(mul(t,t),scale(t,c))
 q=gap(add(a,T),add(b,T),t)
 results['translated'][str(c)]={'terms':show(q),'negative_terms':[x for x in show(q) if x['coefficient']<0]}
tests=0;bad=[]
for d in range(12):
 for aa in range(d*d,d*d+8):
  for bb in range(d*d,d*d+8):
   m=aa+bb+d+2
   cs=[math.comb(m,aa+r) for r in range(d+3)]
   x,y,z=cs[d:d+3];u,v,w=cs[:3]
   tests+=1
   if x*w+u*z>2*y*v:bad.append([aa,bb,d])
results.update(tests=tests,failures=bad,status='Exact finite computation and symbolic expansion, not Lean proof')
(O/'kernel-probe.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps({'unshifted':show(p),'negative_translations':{k:v['negative_terms'] for k,v in results['translated'].items()},'tests':tests,'failures':bad}))
