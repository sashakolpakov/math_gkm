"""Machine-authored 831d426f. Propose exact bivariate polynomial certificates."""
from pathlib import Path
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-831d426f')
def add(*ps):
 a={}
 for p in ps:
  for k,v in p.items():a[k]=a.get(k,0)+v
 return {k:v for k,v in a.items() if v}
def sc(p,c):return {k:v*c for k,v in p.items() if v*c}
def mul(*ps):
 a={(0,0):1}
 for p in ps:
  b={}
  for (i,j),v in a.items():
   for (k,l),w in p.items():b[i+k,j+l]=b.get((i+k,j+l),0)+v*w
  a=b
 return {k:v for k,v in a.items() if v}
def c(a):return {(0,0):a}
m={(1,0):1};t={(0,1):1};k=add(m,t,c(2))
def L(m,r):return add(sc(k,3),sc(m,1 if r else -1),c(6 if r else 3))
def N(m,r):return mul(add(sc(m,2),c(3)),add(k,sc(m,-1)),add(k,m,c(3)),L(add(m,c(1)),r))
def D(m,r):return mul(add(sc(m,2),c(5)),add(m,c(2)),add(m,c(2)),L(m,r))
def lean(p):
 return '+'.join(str(v)+(' * m' + (f'^{i}' if i>1 else '') if i else '')+
                 (' * t'+(f'^{j}' if j>1 else '') if j else '') for (i,j),v in sorted(p.items()))
out=[]
for r in [False,True]:
 p=add(mul(N(m,r),D(add(m,c(1)),r)),sc(mul(N(add(m,c(1)),r),D(m,r)),-1))
 out.append({'r':r,'terms':[[i,j,v] for (i,j),v in sorted(p.items())],
             'negative':sum(v<0 for v in p.values()),'lean':lean(p)})
(O/'boundary-ratio-candidate.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([{k:v for k,v in x.items() if k not in ['terms','lean']} for x in out]))
