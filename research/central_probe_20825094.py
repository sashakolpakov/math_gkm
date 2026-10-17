"""Machine-authored exploratory normalized floating sums; never proof evidence."""
from pathlib import Path
import math,json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-20825094')
def scalar(a,H,k,l):
 return 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
def group(a,r,m,extra=0,q=True):
 H=3*a+r+4+extra;Q=H-a-2;n=m-r
 w=lambda k:1 if k==r else 4*(r-k)
 c=m//2;weights=[(c,1.)];v=1.
 for k in range(c,n,-1):
  l=m-k
  v*=k/(a+k-1)*(a+l)/(l+1)*w(k-1)/w(k)*w(l+1)/w(l)
  if q:v*=(Q+k-1)/(H+k-1)*(H+l)/(Q+l)
  weights.append((k-1,v))
  if v<1e-250:break
 vals=[((1 if 2*k==m else 2)*v,scalar(a,H,k,m-k)) for k,v in weights]
 mass=math.fsum(v for v,s in vals)
 mean=math.fsum(v*s for v,s in vals)/mass
 return mean/(a*a*r*r*H*H),len(vals)
def run():
 start=time.monotonic();rows=[];bad=[];worst=None
 for a in [2,3,5,10,20,50,100,200,500,1000,10000]:
  for r in sorted(set([5,10,30,100,300,1000,3000,10000,10*a,100*a])):
   for f in [0,0.1,0.25,0.5,0.75,0.9,0.99]:
    m=r+int(f*r)
    if m>2*r-2:continue
    for extra in [0,r,3*r]:
     value,count=group(a,r,m,extra)
     row=[a,r,m,extra,value,count];rows.append(row)
     if worst is None or value<worst[4]:worst=row
     if value<=0:bad.append(row)
 out=dict(status='floating exploration only',cases=len(rows),failures=bad,worst=worst,seconds=time.monotonic()-start,rows=rows)
 (O/'central-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps({k:v for k,v in out.items() if k!='rows'}))
if __name__=='__main__':run()
