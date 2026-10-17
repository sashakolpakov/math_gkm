"""Machine-authored exact sparse polynomial computation. Produces candidates for Lean.
No symbolic calculation here is treated as a kernel proof or coefficient bridge.
"""
from pathlib import Path
from collections import defaultdict
import json,time
from three_probe_9e205206 import cube,seriesmul
from probe_9e205206 import one as one2,b as b2,s as s2,v as v2,add as add2,mul as mul2,neg as neg2
O=Path('evidence/markov-13e37040')
class P(dict):
 def __add__(self,o):
  o=pol(o); d=P(self)
  for m,c in o.items():d[m]=d.get(m,0)+c
  return P({m:c for m,c in d.items() if c})
 __radd__=__add__
 def __neg__(self):return P({m:-c for m,c in self.items()})
 def __sub__(self,o):return self+-pol(o)
 def __rsub__(self,o):return pol(o)+-self
 def __mul__(self,o):
  o=pol(o);d=defaultdict(int)
  for m,c in self.items():
   for n,e in o.items():d[tuple(a+b for a,b in zip(m,n))]+=c*e
  return P({m:c for m,c in d.items() if c})
 __rmul__=__mul__
 def __pow__(self,n):
  p=pol(1)
  for _ in range(n):p=p*self
  return p
def pol(x):return x if isinstance(x,P) else P({(0,0,0):x}) if x else P()
u=P({(1,0,0):1});v=P({(0,1,0):1});t=P({(0,0,1):1});s=u+v+1
def section(p,d):return P({(i,j,(k-d)//3):c for (i,j,k),c in p.items() if k%3==d})
def uc(p,n):return P({(0,j,k):c for (i,j,k),c in p.items() if i==n})
def lst(p):return [[*m,c] for m,c in sorted(p.items())]
def divide(p,d):
 out=P();p=P(p);m=max(d);c=d[m]
 while p:
  a=max(p);b=p[a]
  assert all(x>=y for x,y in zip(a,m)),(a,m)
  assert b%c==0
  t=P({tuple(x-y for x,y in zip(a,m)):b//c})
  out=out+t;p=p-t*d
 return out
def lean(p):
 terms=[]
 for m,c in sorted(p.items()):
  fs=[str(abs(c))] if abs(c)!=1 or not any(m) else []
  fs += [x if n==1 else f'{x}^{n}' for x,n in zip(('u','v','t'),m) if n]
  terms.append(('+' if c>=0 else '-')+'*'.join(fs))
 return ''.join(terms).lstrip('+') or '0'
def run():
 start=time.monotonic()
 # T_n is the conjectured all-column D template, n tracked by t.
 d=(1-v*t**2)**2*(1-v*t)**3*((1-t)*(1-v*t)-u*t)
 conj=(1+v*t**2+v**2*t**4)**2*(1+v*t+v**2*t**2)**3*(1+s*t+(s**2-v)*t**2+s*v*t**3+v**2*t**4)
 norm=d*conj
 assert all(k%3==0 for i,j,k in norm)
 dd=section(norm,0)
 cubeF=1-(s**3-3*v*s)*t+v**3*t**2
 smallF=(1-v*t)*(1-v**2*t)-u*v*t
 assert dd==(1-v**3*t**2)**2*(1-v**3*t)**3*cubeF
 ndall=u**3*t*(1+v*t**2)**2*conj
 de=(1-v*t)*(1-v**2*t)**2*(1-v**3*t**2)**2*smallF
 q=cubeF*smallF;q0=uc(q,0);q1=uc(q,1);q2=uc(q,2)
 F=[one2,b2]
 for _ in range(4):F.append(add2(mul2(s2,F[-1]),neg2(mul2(v2,F[-2]))))
 Q2=[{(i,j):c for (i,j,k),c in q.items() if k==z} for z in range(5)]
 results={}
 for r in (False,True):
  ns=seriesmul(Q2,[cube(F[k+1],F[k],r) for k in range(4)])[:4]
  n=P({(i,j,k):c for k,p in enumerate(ns) for (i,j),c in p.items()})
  n0,n1,n2=[uc(n,z) for z in range(3)]
  l0=n0*q0**2;l1=(n1*q0-n0*q1)*q0;l2=n2*q0**2-n1*q0*q1+n0*q1**2-n0*q0*q2
  low=l0+u*l1+u**2*l2
  delta=1 if r else 2
  nd=section(ndall,delta)
  ne=4*u**3*v**(4 if r else 3)*t**(3 if r else 2)*((2+v**3*t**2) if r else (1+2*v**3*t**2))
  diff=n*dd*de*q0**3-(nd*de+ne*dd)*q*q0**3-low*q*dd*de
  rr=(1-v**3*t**2)**2;aa=(1-v**3*t)**3;bb=(1-v*t)*(1-v**2*t)**2
  compactLow=divide(n*rr*aa*bb-nd*bb*smallF-ne*aa*cubeF,q*rr)
  assert all(i<=2 for i,j,k in compactLow)
  results[str(r)]={'identity_zero':not diff,'difference':lst(diff),'source_numerator':lst(n),'D_numerator':lst(nd),'low_numerators':[lst(x) for x in (l0,l1,l2)],'term_counts':{'source':len(n),'D':len(nd),'low':[len(l0),len(l1),len(l2)]}}
  results[str(r)]['compact_low']=lst(compactLow)
  results[str(r)]['term_counts']['compact_low']=len(compactLow)
  for name,p in [('source',n),('D',nd),('low0',l0),('low1',l1),('low2',l2),('compactLow',compactLow)]:
   (O/f'gf-{r}-{name}.txt').write_text(lean(p)+'\n')
 out={'results':results,'seconds':time.monotonic()-start,'status':'Exact symbolic polynomial identity checks only; formal source and coefficient extraction bridges separately required.'}
 (O/'gf-identity.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({'seconds':out['seconds'],'results':{k:{x:y for x,y in a.items() if x in ('identity_zero','term_counts')} for k,a in results.items()}}))
if __name__=='__main__':run()
