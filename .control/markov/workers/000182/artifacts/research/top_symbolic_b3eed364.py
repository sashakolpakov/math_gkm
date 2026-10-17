"""Machine-authored exact polynomial upper-template exploration.
Symbolic identities here are experiments until separately checked in Lean.
"""
from fractions import Fraction as F
from math import comb,factorial
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-b3eed364')
def add(a,b):
 c=a.copy()
 for k,v in b.items():c[k]=c.get(k,0)+v
 return {k:v for k,v in c.items() if v}
def scale(a,z):return {k:v*z for k,v in a.items() if v*z}
def mul(a,b):
 c={}
 for (i,j),v in a.items():
  for (k,l),w in b.items():c[i+k,j+l]=c.get((i+k,j+l),0)+v*w
 return {k:v for k,v in c.items() if v}
one={(0,0):F(1)};x={(1,0):F(1)};n={(0,1):F(1)}
def cp(offset,k):
 p=one
 for a in range(k):p=scale(mul(p,add(n,scale(one,offset-a))),F(1,a+1))
 return p
def bc(n,k):return comb(n,k) if 0<=k<=n else 0
def delta(t):
 p=scale(one,[1,-2,1][t]) if t<=2 else {}
 for i in range(1,t+1):
  z=bc(t-1,i-1)-2*bc(t-2,i-1)+bc(t-3,i-1)
  p=add(p,scale(mul({(i,0):F(1)},cp(2-t+i,i)),z))
 return p
def templates(bound):
 ds=[delta(t) for t in range(bound+1)];ts=[]
 for t in range(bound+1):
  p=ds[t]
  if t>=1:p=add(p,scale(add(mul(add(x,one),ds[t-1]),mul(add(one,scale(x,-1)),ts[t-1])),2))
  if t>=2:p=add(p,mul(mul(add(x,one),add(x,one)),add(ds[t-2],scale(ts[t-2],-1))))
  ts.append(p)
 return ts
def coeff(p,i):return {(0,k):v for (a,k),v in p.items() if a==i}
def shift(p,N):
 q={}
 for (i,j),v in p.items():
  for k in range(j+1):q=add(q,{(i,k):v*comb(j,k)*N**(j-k)})
 return q
def evalp(p,N):
 out={}
 for (i,j),v in p.items():out[i]=out.get(i,0)+v*N**j
 return {i:v for i,v in out.items() if v}
def serial(p):return [[i,j,str(v)] for (i,j),v in sorted(p.items())]
def run():
 t0=time.monotonic();ts=templates(22)
 out=dict(status='exact symbolic experiment; universal positivity in t not proved',checked_rows=0,gap_polynomials=0,negative_coefficients=[],rows=[])
 for t,p in enumerate(ts):
  if t<3:continue
  N=3*t-5;out['checked_rows']+=1
  row=dict(t=t,minimum_n=N,coefficients=serial(shift(p,N)),gaps=[])
  for i in range(t):
   gap=add(mul(coeff(p,i+1),coeff(p,i+1)),scale(mul(coeff(p,i),coeff(p,i+2)),-1))
   g=shift(gap,N);out['gap_polynomials']+=1
   if any(v<0 for v in g.values()):out['negative_coefficients'].append([t,i,serial(g)])
   if t<=10:row['gaps'].append([i,serial(g)])
  out['rows'].append(row)
 out['seconds']=time.monotonic()-t0
 (O/'top-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='rows'}))
if __name__=='__main__':run()
