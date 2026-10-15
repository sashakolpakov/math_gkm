"""Machine-authored exact low-slope fourth-slice experiment. No theorem premises."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for
ROOT=Path('/Users/sasha/math_gkm'); OUT=ROOT/'evidence/markov-01f51d63'
class P(dict):
 def __add__(a,b):
  b=coerce(b);d=dict(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-coerce(b)
 def __rsub__(a,b):return coerce(b)+-a
 def __mul__(a,b):
  b=coerce(b);d={}
  for k,v in a.items():
   for l,z in b.items():
    e=tuple(x+y for x,y in zip(k,l));d[e]=d.get(e,0)+v*z
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  p=coerce(1)
  for _ in range(n):p=p*a
  return p
def coerce(p):return p if isinstance(p,P) else P({(0,0,0):F(p)}) if p else P()
def var(i):return P({tuple(int(k==i) for k in range(3)):F(1)})
C,R,Y=map(var,range(3))
def ypoly(d):return P({(0,0,k):F(v) for k,v in d.items() if v})
def lc4(t):return 24*t[4]-24*t[1]*t[3]-12*t[2]**2+24*t[1]**2*t[2]-6*t[1]**4
def vals(c,r):
 a,b=r,c+r;w=[(k+1)*a//b-k*a//b for k in range(1,b)]
 fs=[ypoly(backward(w,k)) for k in range(5)]
 ts=[fs[0]]+[fs[k]+(1+Y)*fs[k-1] for k in range(1,5)]
 return fs,lc4(ts)
def sub(p,c,r):
 ans=coerce(0)
 for (i,j,k),v in p.items():ans+=v*coerce(c)**i*coerce(r)**j*Y**k
 return ans
def ser(p):return [[list(k),str(v)] for k,v in sorted(p.items())]
def deser(p):return P({tuple(k):F(v) for k,v in p})
BOUNDS=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
def main():
 start=time.monotonic();chambers=[];checks=rawchecks=0;failed=[]
 for left,right in zip(BOUNDS,BOUNDS[1:]):
  p,q=left;s,t=right
  samples=[(q+t,p+s),(2*q+t,2*p+s)]
  results=[vals(c,r)[1] for c,r in samples]
  c1,r1=samples[0];c2,r2=samples[1];det=c1*r2-c2*r1
  kc=(r2*results[0]-r1*results[1])*F(1,det)
  kr=(c1*results[1]-c2*results[0])*F(1,det)
  moment=C*kc+R*kr
  # Existing first-three-moment formulas in the strict chamber.
  c,r=samples[0]
  qv=2*R-C if 2*r>c else coerce(0)
  tv=(C-R if c-r<3*r-c else 3*R-C) if 3*r>c else coerce(0)
  uv=3*R-2*C if 3*r>2*c else coerce(0)
  D=C+R*(1+3*Y)
  K=-C+2*C*Y-R-8*R*Y+R*Y**2+8*qv*Y**3
  L=2*C-12*C*Y+6*C*Y**2+2*R+30*R*Y-30*R*Y**2+6*R*Y**3-144*qv*Y**3-96*qv*Y**4+24*tv*Y**4+24*uv*Y**5
  # Subtract log(1+x(1+y)); integer cumulants D',K',L',M'.
  DD=D-1-Y;KK=K+(1+Y)**2;LL=L-2*(1+Y)**3;MM=moment+6*(1+Y)**4
  fourth=DD**4+6*DD**2*KK+3*KK**2+4*DD*LL+MM
  coeff=[P({(i,j,0):v for (i,j,k),v in fourth.items() if k==z}) for z in range(8)]
  gaps=[]
  for j in range(6):
   gap=sub(coeff[j+1]**2-coeff[j]*coeff[j+2],q*(C+1)+t*(R+1),p*(C+1)+s*(R+1))
   gaps.append(dict(j=j,terms=len(gap),negative_terms=sum(v<0 for v in gap.values()),poly=ser(gap)))
  chambers.append(dict(left=left,right=right,samples=samples,moment=ser(moment),fourth=ser(fourth),gaps=gaps))
 for c in range(5,101):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   k=next(k for k,(l,u) in enumerate(zip(BOUNDS,BOUNDS[1:])) if l[0]*c<r*l[1] and r*u[1]<u[0]*c)
   fs,m=vals(c,r);ch=chambers[k]
   if m!=sub(deser(ch['moment']),c,r):failed.append(['moment',c,r])
   if 24*fs[4]!=sub(deser(ch['fourth']),c,r):failed.append(['slice',c,r])
   checks+=1
   if c<=20:
    a,b,raw=source(path_for(r,c+r))
    for j in range(r+5):
     if fs[4].get((0,0,j),0)!=raw.get((r+4-j,j),0):failed.append(['raw',c,r,j])
     rawchecks+=1
 report=dict(status='Exact finite inference and polynomial expansion, not universal proof',chambers=chambers,source_checks=checks,literal_raw_positions=rawchecks,failures=failed,seconds=time.monotonic()-start)
 (OUT/'fourth-low-probe.json').write_text(json.dumps(report,indent=2)+'\n')
 print(json.dumps(dict(checks=checks,rawchecks=rawchecks,failures=failed,gaps=[[(g['j'],g['terms'],g['negative_terms']) for g in c['gaps']] for c in chambers],seconds=report['seconds'])))
if __name__=='__main__':main()
