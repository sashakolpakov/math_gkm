"""Machine-authored exact rational normalization experiment. Not a Lean proof."""
from pathlib import Path
from fractions import Fraction as F
from itertools import product
from functools import cache
from math import comb
import json,time
import rational_third_bdee as z
from rational_third_bdee import P,Rat,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from experiment_8833 import backward
from fourth_probe_01f51d63 import BOUNDS
O=Path('evidence/markov-6604cff8');start=time.monotonic()
four=json.loads((O/'fourth-jet-candidates.json').read_text())['formulas']
z.jet=cache(z.jet);z.gauge=cache(z.gauge)
jet=z.jet;gauge=z.gauge
@cache
def jet4(e,q):
 f=four[str(e)]
 return Rat((z.exprval(f['P'],N+q)+Z*X**q*z.exprval(f['Q'],N+q))*F(1,24),9)
def d4(p,q):return jet4(3,q)+jet(2,0,p)*jet4(1,q)
def local4(p,q,r,s):
 a,b,c,d=gauge(p,q,1);a2,b2,c2,d2=gauge(p,q,2);a3,b3,c3,d3=gauge(p,q,3)
 ka,kb,kc,kd=gauge(q,r,1);ka2,kb2,kc2,kd2=gauge(q,r,2);kb3=gauge(q,r,3)[1]
 la,lb,lc,ld=gauge(r,s,1);lb2=gauge(r,s,2)[1]
 v2=kb2+ka-kd
 v3=kb3+ka*(lb2+la-ld)+ka2-(kb2+ka)*kd+kd**2-kd2-kc
 g2=d2+c;g3=d3+c*v2+c2;g4=d4(p,q)+c*v3+c2*v2+c3
 return 24*g4-24*d*g3-12*g2**2+24*d**2*g2-6*d**4
loc={bits:local4(*bits) for bits in product((0,1),repeat=4)}
print('local fourth expressions computed',flush=True)
def pot(p,q,r):return loc[p,q,r,0]+loc[q,r,0,0]+loc[r,0,0,0]
def canon(p,q,r,s):return loc[p,q,r,s]-pot(p,q,r)+pot(q,r,s)
def quad(p,q,r,s):return canon(p,q,r,s)-canon(0,q,r,s)
tri={bits:canon(0,*bits)-loc[0,0,0,0] for bits in product((0,1),repeat=3)}
M=loc[0,0,0,0]*C+z.moment(tri)
h0=jet(3,1)+jet(2,0);h1=jet(3,1,1)+jet(2,0,1)
k0=jet(3,2)+jet(2,1);k1=jet(3,2,1)+jet(2,1,1)
b=jet(2,0);d=Rat(2*Z*X)
f=h0*(C-Rr)+h1*Rr-(1+X)
second=2*(k0*(C-Rr)+k1*Rr)+(h0*(C-Rr)+h1*Rr)**2-(h0**2*(C-Rr)+h1**2*Rr)+2*((b*C+d*Rr)*(X-1)+(b**2*C+2*b*d*Rr+d**2*Q)*X)-2*(h0*(C-Rr)+h1*Rr-1-X)*(1+X)
third=3*f*second-2*f**3-2*(1+X)**3+z.moment({a:z.local(*a) for a in product((0,1),repeat=3)})
base=M+6*(1+X)**4+4*f*third+3*second**2-12*f**2*second+6*f**4
def substitute(p,vals):
 out=coerce(0)
 for ks,v in p.items():
  mon=coerce(v)
  for i,k in enumerate(ks):
   if k:mon=mon*vals[i]**k
  out=out+mon
 return out
def specialize(a,ch):
 p,q=BOUNDS[ch];s,t=BOUNDS[ch+1];c0,r0=q+t,p+s
 qv=2*Rr-C if 2*r0>c0 else coerce(0)
 tv=(C-Rr if c0-r0<3*r0-c0 else 3*Rr-C) if 3*r0>c0 else coerce(0)
 uv=3*Rr-2*C if 3*r0>2*c0 else coerce(0)
 return Rat(substitute(a.p,[N,Z,C,Rr,qv,tv,uv,X]),a.d)
rows=[];checks=0
for ch in range(6):
 correction=Rat(0)
 if ch==1:correction=quad(1,0,0,1)*(4*Rr-C)
 if ch==2:correction=quad(1,0,0,1)*(C-2*Rr)
 if ch==3:correction=(quad(1,1,0,1)+quad(1,0,1,1))*(2*Rr-C)
 if ch>=4:correction=(quad(1,1,0,1)+quad(1,0,1,1))*(C-Rr)
 if ch==5:correction=correction+quad(1,1,1,1)*(4*Rr-3*C)
 ans=specialize(base+correction,ch)
 low=P({k:v for k,v in ans.p.items() if k[1]==0})
 for n in [0,1,2,3,4,7,12]:
  p,q=BOUNDS[ch];s,t=BOUNDS[ch+1];c,r=q+t,p+s
  a=c*n+r;bb=c*(n+1)+r;w=[(k+1)*a//bb-k*a//bb for k in range(1,bb)]
  raw=backward(w,4)
  for j in range(4*n+10):
   v=F(0)
   for ks,bv in ans.p.items():
    nn,zz,cc,rr,qq,tt,uu,xx=ks;assert not (qq or tt or uu)
    sh=zz*n+xx
    if j>=sh:v+=bv*n**nn*c**cc*r**rr*comb(j-sh+ans.d-1,ans.d-1)
   assert v==24*raw.get(j,0),(ch,n,c,r,j,v,raw.get(j,0))
   checks+=1
 rows.append(dict(chamber=ch,denominator_power=ans.d,numerator=serialize(ans.p),numerator_terms=len(ans.p),z_degrees=sorted({k[1] for k in ans.p}),low_numerator=serialize(low),low_terms=len(low),low_X_degree=max(k[-1] for k in low)))
 (O/'fourth-rational-normalization.json').write_text(json.dumps(dict(status='Exact symbolic Python normalization of component formulas; not a universal Lean normalization or log-concavity proof',variables=['n','z=X^n','c','r','q','t','u','X'],checks=checks,rows=rows,seconds=time.monotonic()-start),indent=2)+'\n')
 print(json.dumps({k:v for k,v in rows[-1].items() if k not in ['numerator','low_numerator']}),flush=True)
