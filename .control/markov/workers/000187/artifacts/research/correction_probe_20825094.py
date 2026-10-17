"""Machine-authored exact experiments on the endpoint correction identity."""
from pathlib import Path
from fractions import Fraction as F
from central_probe_20825094 import scalar
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-20825094')
polys=json.loads((O/'stein-bound-symbolic.json').read_text())
def ev(name,a,m,H):return sum(F(v)*a**k[0]*m**k[1]*H**k[2] for k,v in polys[name])
def case(a,r,m,dextra):
 H=3*a+r+4+dextra;Q=H-a-2;n=m-r
 den=[F(1)]
 for k in range(m):den.append(den[-1]*F((a+k)*(H+k),(k+1)*(Q+k)))
 mass=F(0);grp=F(0);energy=F(0);spread=F(0)
 for k in range(max(n,0),r+1):
  l=m-k
  if l<0 or l>r:continue
  cut=(1 if k==r else 4*(r-k))*(1 if l==r else 4*(r-l))
  w=den[k]*den[l]*cut;p=k*l
  B=(a+k)*(H+k)*l*(Q+l-1);D=k*(Q+k-1)*(a+l)*(H+l)
  mass+=w;grp+=w*scalar(a,H,k,l);spread+=w*p*(m*m-4*p)
  energy-=w*(B*(m-2*k-1)+D*(2*k-m-1))
 Dn=ev('den',a,m,H);Cp=ev('Cp',a,m,H);K=ev('num',a,m,H)
 C=2*(a+2)*Dn+4*Cp
 assert Dn*(4*a+7)*grp==K*mass+Cp*(8*a+14)*spread+C*energy
 assert energy>=0 and spread>=0
 return dict(a=a,r=r,m=m,extra=dextra,K=str(K),without_spread=str(K*mass+C*energy),group_positive=grp>0,ratio_without_spread=str((K*mass+C*energy)/(Dn*(4*a+7)*grp)))
if __name__=='__main__':
 t=time.monotonic();bad=[];cnt=0;examples=[]
 for a in [2,3,4,5,10,20,50]:
  for r in [5,10,20,40,80]:
   for m in sorted(set([r,r+1,3*r//2,2*r-2])):
    for extra in [0,r,3*r]:
     row=case(a,r,m,extra);cnt+=1
     if F(row['without_spread'])<0:
      if len(bad)<15:bad.append(row)
     if len(examples)<5:examples.append(row)
 out=dict(cases=cnt,first_failed_without_spread=bad,examples=examples,seconds=time.monotonic()-t,status='finite exact identity and shortcut experiments; not universal proof')
 (O/'correction-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
