"""Machine-authored exact integer polynomial probes; computation is not proof."""
from pathlib import Path
from math import comb,factorial
from functools import lru_cache
import time,json,sys
from correction_kernel_d0292f14 import raw
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9db2326d'
def add(a,b):
 z=[0]*max(len(a),len(b))
 for i,v in enumerate(a):z[i]+=v
 for i,v in enumerate(b):z[i]+=v
 return z
def mul(a,b):
 z=[0]*(len(a)+len(b)-1)
 for i,v in enumerate(a):
  for j,w in enumerate(b):z[i+j]+=v*w
 return z
def scale(a,c):return [v*c for v in a]
@lru_cache(None)
def fall(A,m):
 if m==0:return (1,)
 return tuple(mul(fall(A,m-1),[A-m+1,1]))
def ev(a,x):
 z=0
 for v in reversed(a):z=v+x*z
 return z
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def scaled_raw(k,c,r,off):
 B=5 if r else 4; D=factorial(2*c+5); out=[]
 for l in range(c+4):
  a=c+3-l
  f=fall(off+2*c+8,a)
  z=add(scale(mul(f,fall(off+3*k+B,c+l)),(2*c+5)*(2*c+4)*C(2*c+3,a)),
        scale(mul(f,fall(off+3*k+B+1,c+l+2)),4*C(2*c+5,a)))
  out=add(out,scale(z,C(c+l,c)))
 d=B-2
 terms=([(1,d+c+4,c,c+1),(2,d+c+5,c+1,c+2),(1,d+c+4,c+1,c+2),(1,d+c+4,c,c+2),(1,d+c+5,c,c+2)] if r else
        [(2,d+c+5,c+1,c+2),(1,d+c+5,c,c+1),(1,d+c+6,c+1,c+2),(1,d+c+5,c,c+2)])
 for w,A,a,b in terms:
  for l in range(b+1):
   z=4*w*C(a+l,a)*C(k,a+l+2)*(D//factorial(b-l))
   if z:out=add(out,scale(fall(off+A+a,b-l),z))
 return D,out
def run():
 start=time.monotonic();cases=[];checks=0
 maxk=int(sys.argv[1]) if len(sys.argv)>1 else 10
 for k in range(maxk+1):
  for r in [False,True]:
   for c in range(0,4*k+(9 if r else 7)):
    off=max(0,c+2-(3*k+(5 if r else 4)))
    (d,a),(e,b),(f,z)=[scaled_raw(k,j,r,off) for j in range(c,c+3)]
    g=add(scale(mul(b,b),d*f),scale(mul(a,z),-e*e))
    for x in [0,1,3]:
     for j,D,p in [(c,d,a),(c+1,e,b),(c+2,f,z)]:
      assert ev(p,x)==D*raw(x+off,k,r,j+3),(k,r,c,x,j)
      checks+=1
    bad=[(i,str(v)) for i,v in enumerate(g) if v<0]
    cases.append(dict(k=k,r=r,c=c,shift=off,degree=len(g)-1,negative=bad[:3],negative_count=len(bad)))
  out=dict(cases=cases,checks=checks,seconds=time.monotonic()-start,status='Exact finite integer polynomial computations; no uniform theorem inferred.')
  (O/'fixed-depth-probe.json').write_text(json.dumps(out,indent=2))
  print(json.dumps(dict(k=k,cases=len(cases),checks=checks,negative_cases=sum(bool(c['negative_count']) for c in cases),seconds=out['seconds'])),flush=True)
if __name__=='__main__':run()
