"""Machine-authored 831d426f. Exact rational Sturm diagnostic, finite only."""
from fractions import Fraction as F
from band_experiment_139fed75 import Q
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-831d426f')
def trim(p):
 while p and not p[-1]:p.pop()
 return p
def rem(p,q):
 p=p[:]
 while len(p)>=len(q) and p:
  s=len(p)-len(q);c=p[-1]/q[-1]
  for i in range(len(q)):p[s+i]-=c*q[i]
  trim(p)
 return p
def variation(signs):return sum(a!=b for a,b in zip(signs,signs[1:]))
def sturm(p):
 a=list(map(F,p));b=[i*a[i] for i in range(1,len(a))];seq=[a,b]
 while b:
  c=trim([-v for v in rem(a,b)])
  if not c:break
  c=[v/abs(c[-1]) for v in c]
  seq.append(c);a,b=b,c
 plus=[1 if p[-1]>0 else -1 for p in seq]
 minus=[s*(-1 if (len(p)-1)%2 else 1) for s,p in zip(plus,seq)]
 return variation(minus)-variation(plus),len(seq[-1])-1
t=time.monotonic();out={'status':'finite exact rational Sturm diagnostic','tests':0,'nonreal':[],'repeated':[]}
for k in range(1,17):
 for d in [0,1,2,5,20]:
  for r in [False,True]:
   p=Q(d+2*k+(2 if r else 1),r,k)
   count,gcddeg=sturm(p);out['tests']+=1
   if count<k:out['nonreal'].append([d,k,r,count,p])
   if gcddeg:out['repeated'].append([d,k,r,gcddeg])
out['seconds']=time.monotonic()-t
(O/'roots-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
