"""Machine-authored exact third-column seed exploration, not a Lean identity.
The source moment theorem is checked separately; its explicit seed bridge is
not assumed merely because these finite comparisons pass.
"""
from pathlib import Path
import json,time,hashlib
from math import gcd,comb
import horizontal_third_13d40bd7 as sp
from experiment_8833 import path_for,add
sp.N=6
a,b,c,d,e,x=[sp.var(i) for i in range(6)]
zero=sp.poly(0);one=sp.poly(1);h=1+x
O=Path('/Users/sasha/math_gkm/evidence/markov-ead8a96f')
def plus(p,q):return [z+w for z,w in zip(p,q)]
def times(p,q):return [sum((p[k]*q[n-k] for k in range(n+1)),zero) for n in range(4)]
def const(z):return [sp.poly(z),zero,zero,zero]
def mm(m,n):return tuple(plus(times(m[i],n[j]),times(m[i+1],n[j+2])) for i in [0,2] for j in [0,1])
I=(const(1),const(0),const(0),const(1))
A=([x,x*h,zero,zero],[2*one,h,zero,zero],[zero,x*h,zero,zero],[one,h,zero,zero])
C=([one,x,zero,zero],[zero,one,zero,zero],[zero,x,zero,zero],[zero,one,zero,zero])
def block(q):
 m=I
 for _ in range(q):m=mm(A,m)
 m=mm(m,C)
 return tuple([x**(-q)*z for z in m[k]] for k in [3,2,1,0])
def moment(f):
 z=f(0,0,0);p=f(1,0,0)-z;r=f(0,1,0)-z;s=f(0,0,1)-z
 pr=f(1,1,0)-z-p-r;ps=f(1,0,1)-z-p-s;rs=f(0,1,1)-z-r-s
 prs=f(1,1,1)-z-p-r-s-pr-ps-rs
 return a*z+b*(p+r+s)+c*(pr+rs)+d*ps+e*(ps+prs)
def seed(q):
 g=[block(q+1),block(q)]
 D=moment(lambda p,r,s:g[p][3][1])
 K=moment(lambda p,r,s:2*g[p][3][2]-g[p][3][1]**2+2*g[p][2][1]*g[r][1][1])
 L=moment(lambda p,r,s:2*g[p][3][1]**3-6*g[p][3][1]*g[p][3][2]+6*g[p][3][3]
   +6*(g[p][2][1]*g[r][1][2]+g[p][2][2]*g[r][1][1])
   -6*g[p][2][1]*g[r][1][1]*(g[p][3][1]+g[r][3][1])
   +6*g[p][2][1]*g[r][0][1]*g[s][1][1])
 N=x**(3*q+3)*(D**3+3*D*K+L-3*h*(D**2+K)+6*h*h*D-6*h**3)
 assert all(min(k)>=0 for k in N),q
 return N
def source3(path):
 def mul(p,q):
  out={}
  for (i,j),u in p.items():
   for (k,l),v in q.items():
    if i+k<=3:out[i+k,j+l]=out.get((i+k,j+l),0)+u*v
  return {k:v for k,v in out.items() if v}
 S={(0,0):1,(1,0):1,(0,1):1};lo=(0,1,{(0,0):1});m=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for bit in path:
  z,t=(hi,lo) if bit else (lo,hi)
  p=add(mul(mul(S,z[2]),m[2]),{k:-v for k,v in mul({(z[0],z[1]):1},t[2]).items()})
  new=(m[0]+z[0],m[1]+z[1],p)
  if bit:lo,m=m,new
  else:hi,m=m,new
 return m
def evaluate(N,aa,r):
 params=[aa,aa-r,max(aa-2*r,0),min(r,max(2*aa-3*r,0)),max(aa-3*r,0)]
 cs=[0]*(max(k[5] for k in N)+1)
 for k,v in N.items():
  z=v
  for u,t in zip(params,k[:5]):z*=u**t
  assert z.denominator==1
  cs[k[5]]+=int(z)
 return cs
def main():
 start=time.monotonic();records=[];identities=lc=rawlc=zeros=0;seeds={}
 for q in range(1,13):
  N=seed(q);seeds[q]=[[list(k),str(v)] for k,v in sorted(N.items())]
  for aa in range(7,23):
   for r in range(1,aa):
    if gcd(aa,r)!=1:continue
    bb=aa*q+r;cs=evaluate(N,aa,r)
    assert min(cs)>=0,(aa,bb,cs)
    support=[j for j,c0 in enumerate(cs) if c0]
    assert support==list(range(min(support),max(support)+1)),(aa,bb)
    for j in range(len(cs)-2):
     assert cs[j]*cs[j+2]<=cs[j+1]**2,(aa,bb,j,cs)
     lc+=1
    a0,b0,p=source3(path_for(aa,bb));assert (a0,b0)==(aa,bb)
    raw=[p.get((3,j),0) for j in range(aa+bb+5)]
    pred=[0]*len(raw);off=bb-3*q-3
    for k,c0 in enumerate(cs):
     for z in range(aa-6):
      if off+k+z<len(pred):pred[off+k+z]+=c0*comb(aa-7,z)
    assert pred==[6*c0 for c0 in raw],(aa,bb)
    identities+=len(raw);zeros+=raw.count(0)
    for j in range(len(raw)-2):
     if aa*bb<=3*bb+aa*j and j+5<=aa+bb-1:
      assert raw[j]*raw[j+2]<=raw[j+1]**2
      rawlc+=1
    records.append([aa,bb,hashlib.sha256(str(raw).encode()).hexdigest()])
  print('q',q,'terms',len(N),flush=True)
 out=dict(status='Exact finite candidate experiment; not a universal explicit-seed bridge or LC proof',formula='q=n+1, b=a*q+r, a>=7: 6[u^3]P=x^(b-3*q-3)*(1+x)^(a-7)*N3. N3=x^(3*q+3)*(D^3+3DK+L-3h(D^2+K)+6h^2D-6h^3), evaluated at predecessor triple counts.',fractions=len(records),coefficient_comparisons=identities,seed_adjacent_checks=lc,raw_polygon_checks=rawlc,raw_zeros=zeros,failures=[],records=records,seeds=seeds,seconds=time.monotonic()-start)
 (O/'third-seed-candidate.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['records','seeds']}))
if __name__=='__main__':main()
