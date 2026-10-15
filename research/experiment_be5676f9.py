"""Machine-authored exact symbolic fourth-moment calculations. Experiments only."""
from pathlib import Path
from itertools import product
from math import gcd
from fractions import Fraction as F
import json,time
from fourth_probe_01f51d63 import P,C,R,Y,coerce,ser,sub,BOUNDS,ypoly,lc4
from experiment_8833 import backward,source,path_for,polyguard
OUT=Path('evidence/markov-be5676f9')
def mm(m,n):
 a,b,c,d=m;e,f,g,h=n
 return (a*e+b*g,a*f+b*h,c*e+d*g,c*f+d*h)
def gauge(n,p,q):
 x,y=C,Y
 a=(x*y,x,x*y,1+x)
 b=(y+x*y*(1+y),x*(1+y),2*y+x*y*(1+y),1+x*(1+y))
 for _ in range(n+q):a=mm(a,b)
 sp=2*sum((y**k for k in range(1,n+p+1)),coerce(0))
 sq=2*sum((y**k for k in range(1,n+q+1)),coerce(0))
 return mm(mm((coerce(1),coerce(0),sp,coerce(1)),a),(coerce(1),coerce(0),-sq,coerce(1)))
def jet(m,k):return P({(0,j,z):v for (i,j,z),v in m.items() if i==k})
def local4(n,p,q,r,s):
 a,b,c,d=gauge(n,p,q);e,f,g,h=gauge(n,q,r);aa,bb,cc,dd=gauge(n,r,s)
 v2=jet(f,2)+jet(e,1)-jet(h,1)
 v3=jet(f,3)+jet(e,1)*(jet(bb,2)+jet(aa,1)-jet(dd,1))+jet(e,2)-(jet(f,2)+jet(e,1))*jet(h,1)+jet(h,1)**2-jet(h,2)-jet(g,1)
 gs=[coerce(1),jet(d,1),jet(d,2)+jet(c,1),jet(d,3)+jet(c,1)*v2+jet(c,2),jet(d,4)+jet(c,1)*v3+jet(c,2)*v2+jet(c,3)]
 return lc4(gs)
def moment3(f,c,r,q,t,u):
 a=f(0,0,0);p=f(1,0,0)-a;qq=f(0,1,0)-a;rr=f(0,0,1)-a
 pq=f(1,1,0)-a-p-qq;pr=f(1,0,1)-a-p-rr;qr=f(0,1,1)-a-qq-rr
 pqr=f(1,1,1)-a-p-qq-rr-pq-pr-qr
 return c*a+r*(p+qq+rr)+q*(pq+qr)+t*pr+u*(pr+pqr)
def fourparts(table):
 def f(p,q,r,s):return table[p,q,r,s]
 def pot(p,q,r):return f(p,q,r,0)+f(q,r,0,0)+f(r,0,0,0)
 def canon(p,q,r,s):return f(p,q,r,s)-pot(p,q,r)+pot(q,r,s)
 def tri(q,r,s):return canon(0,q,r,s)-f(0,0,0,0)
 def quad(p,q,r,s):return canon(p,q,r,s)-canon(0,q,r,s)
 return f,tri,quad
def fourth_moment(table,c,r):
 f,tri,quad=fourparts(table)
 z=coerce(c)*f(0,0,0,0)+moment3(tri,c,r,max(2*r-c,0),min(c-r,max(3*r-c,0)),max(3*r-2*c,0))
 if 2*r<=c:z+=min(c-2*r,max(4*r-c,0))*quad(1,0,0,1)
 elif 3*r<=2*c:z+=(2*r-c)*(quad(1,1,0,1)+quad(1,0,1,1))
 elif 4*r<=3*c:z+=(c-r)*(quad(1,1,0,1)+quad(1,0,1,1))
 else:z+=(c-r)*(quad(1,1,0,1)+quad(1,0,1,1))+(4*r-3*c)*quad(1,1,1,1)
 return z
def chamber_poly(n,z,table):
 left,right=BOUNDS[z:z+2];p,q=left;s,t=right;c0,r0=q+t,p+s
 Q=2*R-C if 2*r0>c0 else coerce(0)
 T=(C-R if c0-r0<3*r0-c0 else 3*R-C) if 3*r0>c0 else coerce(0)
 U=3*R-2*C if 3*r0>2*c0 else coerce(0)
 def k(p,q,r):
  a,b,c,d=gauge(n,q,r)
  return 2*jet(d,2)+2*jet(c,1)-jet(d,1)**2
 def l(p,q,r):
  a,b,c,d=gauge(n,p,q);aa,bb,cc,dd=gauge(n,q,r)
  return 6*jet(d,3)-6*jet(d,1)*jet(d,2)+2*jet(d,1)**3+6*(jet(c,1)*jet(bb,2)+jet(c,2))-6*jet(c,1)*(jet(d,1)+jet(dd,1))+6*jet(c,1)*jet(aa,1)
 D=C*(1+n+sum((3*Y+4*Y*sum((Y**k for k in range(1,j+1)),coerce(0)) for j in range(n)),coerce(0)))+R*(1+3*Y+4*Y*sum((Y**k for k in range(1,n+1)),coerce(0)))-1-Y
 K=moment3(k,C,R,Q,T,U)+(1+Y)**2
 L=moment3(l,C,R,Q,T,U)-2*(1+Y)**3
 f,tri,quad=fourparts(table)
 M=C*f(0,0,0,0)+moment3(tri,C,R,Q,T,U)
 if z==0:pass
 elif z==1:M+=(4*R-C)*quad(1,0,0,1)
 elif z==2:M+=(C-2*R)*quad(1,0,0,1)
 elif z==3:M+=(2*R-C)*(quad(1,1,0,1)+quad(1,0,1,1))
 elif z==4:M+=(C-R)*(quad(1,1,0,1)+quad(1,0,1,1))
 else:M+=(C-R)*(quad(1,1,0,1)+quad(1,0,1,1))+(4*R-3*C)*quad(1,1,1,1)
 fourth=D**4+6*D**2*K+3*K**2+4*D*L+M+6*(1+Y)**4
 return M,fourth
def run():
 start=time.monotonic();checks=raw=triples=0;fail=[];runs=[]
 for n in [0,1,2,3,4,7]:
  table={bits:local4(n,*bits) for bits in product(range(2),repeat=4)}
  chambers=[]
  if n<=3:
   for z in range(6):
    M,f=chamber_poly(n,z,table);deg=max(k[2] for k in f);cs=[P({(i,j,0):v for (i,j,k),v in f.items() if k==a}) for a in range(deg+1)]
    p,q=BOUNDS[z];s,t=BOUNDS[z+1]
    gaps=[sub(cs[j+1]**2-cs[j]*cs[j+2],q*(C+1)+t*(R+1),p*(C+1)+s*(R+1)) for j in range(deg-1)]
    chambers.append(dict(z=z,moment=ser(M),fourth=ser(f),gaps=[ser(g) for g in gaps],negative_terms=[sum(v<0 for v in g.values()) for g in gaps]))
  for c in range(5,21):
   for r in range(1,c):
    if gcd(c,r)!=1:continue
    a=c*n+r;b=c*(n+1)+r;w=[(k+1)*a//b-k*a//b for k in range(1,b)]
    fs=[ypoly(backward(w,k)) for k in range(5)]
    trueM=lc4([fs[0]]+[fs[k]+(1+Y)*fs[k-1] for k in range(1,5)])
    if fourth_moment(table,c,r)!=trueM:fail.append(['moment',n,c,r])
    if n<=3:
     z=next(z for z in range(6) if BOUNDS[z][0]*c<BOUNDS[z][1]*r and BOUNDS[z+1][1]*r<BOUNDS[z+1][0]*c)
     M,f=chamber_poly(n,z,table)
     if sub(f,c,r)!=24*fs[4]:fail.append(['fourth',n,c,r])
    checks+=1
    for j in range(a+3):
     i=a+2-j
     if all(polyguard(a,b,*pt) for pt in [(i,j+2),(i+1,j+1),(i+2,j)]):
      vals=[fs[4].get((0,0,k),0) for k in [j,j+1,j+2]]
      triples+=1
      if vals[0]*vals[2]>vals[1]**2:fail.append(['lc',n,c,r,j])
    if c<=7 and n<=3:
     aa,bb,pol=source(path_for(a,b));assert (aa,bb)==(a,b)
     for j in range(a+5):
      raw+=1
      if fs[4].get((0,0,j),0)!=pol.get((a+4-j,j),0):fail.append(['raw',n,c,r,j])
  runs.append(dict(n=n,local_table=[dict(bits=list(k),polynomial=ser(v)) for k,v in table.items()],chambers=chambers))
 rec=dict(status='Exact finite experiment and symbolic certificates; not a universal proof',checks=checks,raw_positions=raw,valid_triples=triples,failures=fail,runs=runs,seconds=time.monotonic()-start)
 (OUT/'experiments.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k!='runs'}));print([(r['n'],[c['negative_terms'] for c in r['chambers']]) for r in runs]);assert not fail
if __name__=='__main__':run()
