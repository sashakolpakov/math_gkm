"""Machine-authored finite next-step probe. No universal moment claim."""
from pathlib import Path
from math import gcd
from fractions import Fraction as F
import time,json
from fourth_probe_01f51d63 import P,C,R,Y,coerce,ypoly,lc4,ser,sub,BOUNDS
from experiment_8833 import backward,source,path_for,polyguard
OUT=Path('evidence/markov-897eabb3')
def values(n,c,r):
 a=c*n+r;b=c*(n+1)+r
 w=[(k+1)*a//b-k*a//b for k in range(1,b)]
 fs=[ypoly(backward(w,k)) for k in range(5)]
 return fs,lc4([fs[0]]+[fs[k]+(1+Y)*fs[k-1] for k in range(1,5)])
def run():
 start=time.monotonic();runs=[];fail=[];checks=rawchecks=0;examples=[]
 for n in [1,2,3]:
  chambers=[]
  for z,(left,right) in enumerate(zip(BOUNDS,BOUNDS[1:])):
   p,q=left;s,t=right
   (c1,r1),(c2,r2)=(q+t,p+s),(2*q+t,2*p+s)
   m1=values(n,c1,r1)[1];m2=values(n,c2,r2)[1];det=c1*r2-c2*r1
   kc=(r2*m1-r1*m2)*F(1,det);kr=(c1*m2-c2*m1)*F(1,det)
   cand=C*kc+R*kr;chambers.append(dict(chamber=z,left=left,right=right,moment=ser(cand),samples=[[c1,r1],[c2,r2]]))
   for c in range(5,31):
    for r in range(1,c):
     if gcd(c,r)!=1 or not p*c<q*r or not t*r<s*c:continue
     fs,m=values(n,c,r);checks+=1
     if m!=sub(cand,c,r):fail.append(['candidate-moment',n,c,r])
     a=c*n+r;b=c*(n+1)+r
     if c<=7:
      aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
      for j in range(a+5):
       if raw.get((a+4-j,j),0)!=fs[4].get((0,0,j),0):fail.append(['raw',n,c,r,j])
       rawchecks+=1
     if len(examples)<12:
      for j in range(a+3):
       i=a+2-j
       if a+2<=b and i+j+8<=a+b-1 and all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
        triple=[str(fs[4].get((0,0,k),0)) for k in [j,j+1,j+2]]
        examples.append(dict(n=n,c=c,r=r,a=a,b=b,i=i,j=j,coefficients_in_increasing_j=triple))
        if len(examples)>=12:break
  runs.append(dict(n=n,chambers=chambers))
 rec=dict(status='Finite candidate moments only. No new high-slope source moment or log-concavity theorem.',runs=runs,checks=checks,literal_raw_positions=rawchecks,remaining_core_examples=examples,failures=fail,seconds=time.monotonic()-start)
 (OUT/'high-fourth-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k!='runs'}));assert not fail
if __name__=='__main__':run()
