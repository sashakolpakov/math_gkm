"""Machine-authored exact experiments, not proofs."""
from math import comb
from fractions import Fraction as Q
from pathlib import Path
import json,time
O=Path('evidence/markov-9f234835'); start=time.monotonic()
def f(t,j,k,r):
 return comb(j-r+t+3,t+3)*comb(k-r+t,t) if r<=min(j,k) else 0
def D(t,j,k): return sum((1 if r==0 else 4*r)*f(t,j,k,r) for r in range(min(j,k)+1))
bad=[]; checks=0
for t in range(8):
 for j in range(12):
  for k in range(12):
   for r in range(min(j+2,k)+1):
    for s in range(r,min(j+2,k)+1):
     gap=2*f(t+1,j+1,k,r)*f(t+1,j+1,k,s)-f(t,j+2,k,r)*f(t+2,j,k,s)-f(t,j+2,k,s)*f(t+2,j,k,r);checks+=1
     if gap<0 and len(bad)<10:bad.append([t,j,k,r,s,gap])
ratios_bad=[]; nr=0
for b in range(1,12):
 for r in range(1,120):
  ff=lambda k:(1 if k==0 else 4*k)*comb(r-k+b,b) if k<=r else 0
  gg=lambda k:(1 if k==0 else 4*k)*comb(r-k+b+1,b+1) if k<=r else 0
  h=[Q(ff(0),gg(0))]+[Q(ff(k+1)-ff(k),gg(k+1)) for k in range(r)]
  for k in range(len(h)-1):
   nr+=1
   if h[k]<h[k+1]:ratios_bad.append([b,r,k,str(h[k]),str(h[k+1])])
total_bad=[];nt=0
for t in range(1,20):
 for j in range(25):
  for k in range(25):
   nt+=1
   gap=D(t+1,j+1,k)**2-D(t,j+2,k)*D(t+2,j,k)
   if gap<0:total_bad.append([t,j,k,gap])
d={'paired_summands':{'checks':checks,'first_negative':bad},'increment_ratio':{'checks':nr,'failures':ratios_bad,'domain':'1<=b<=11, 1<=r<=119; all adjacent ratios'},'diagonal_total':{'checks':nt,'failures':total_bad},'seconds':time.monotonic()-start,'status':'Finite exact experiments only; no root resolution'}
(O/'ramp-probe.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
