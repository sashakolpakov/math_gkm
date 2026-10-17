"""Machine-authored large-scale floating stress of the energy shortcut."""
from pathlib import Path
from fractions import Fraction as F
import math,json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-20825094')
polys=json.loads((O/'stein-bound-symbolic.json').read_text())
def ev(name,a,m,H):return sum(int(F(v))*a**k[0]*m**k[1]*H**k[2] for k,v in polys[name])
def run(a,r,m,extra):
 H=3*a+r+4+extra;Q=H-a-2;n=m-r;c=m//2;v=1.;vals=[]
 w=lambda k:1 if k==r else 4*(r-k)
 for k in range(c,n-1,-1):
  l=m-k;B=(a+k)*(H+k)*l*(Q+l-1);D=k*(Q+k-1)*(a+l)*(H+l)
  L=B*(m-2*k-1)+D*(2*k-m-1);weight=v*(1 if k==l else 2)
  vals.append((weight,L))
  if k>n:
   v*=k/(a+k-1)*(a+l)/(l+1)*(Q+k-1)/(H+k-1)*(H+l)/(Q+l)*w(k-1)/w(k)*w(l+1)/w(l)
   if v<1e-250:break
 mass=math.fsum(w for w,L in vals);energy=-math.fsum(w*L for w,L in vals)/mass
 den=ev('den',a,m,H);Cp=ev('Cp',a,m,H);K=ev('num',a,m,H);C=2*(a+2)*den+4*Cp
 return (K+C*energy)/(abs(K)+abs(C*energy)),len(vals)
t=time.monotonic();bad=[];worst=None;count=0
for a in [2,3,5,10,20,50,100,500,1000,10000]:
 for r in sorted(set([5,10,30,100,300,1000,3000,10000,10*a,100*a])):
  for f in [0,.1,.25,.5,.75,.9,.99]:
   m=r+int(f*r)
   if m+2>2*r:continue
   for extra in [0,r,3*r]:
    value,terms=run(a,r,m,extra);row=[a,r,m,extra,value,terms];count+=1
    if worst is None or value<worst[4]:worst=row
    if value<0:bad.append(row)
out=dict(cases=count,failures=bad,worst=worst,seconds=time.monotonic()-t,status='floating stress only; no universal conclusion')
(O/'correction-stress.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
