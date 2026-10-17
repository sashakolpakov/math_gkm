"""Machine-authored exact integer polynomial probe; no universal proof."""
from math import comb
from pathlib import Path
import json,time,hashlib
O=Path('/Users/sasha/math_gkm/evidence/markov-eb6a9001')
def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a):c[i]+=v
 for i,v in enumerate(b):c[i]+=v
 return c
def scale(a,s):return [s*v for v in a]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,v in enumerate(a):
  for j,w in enumerate(b):c[i+j]+=v*w
 return c
def mass(T,i):
 p=[0]
 for s in range(i,T+1):
  z=[comb(s,i)*(1 if s==T else 4*(T-s))]
  for h in range(i+3):z=mul(z,[s+6+h,1])
  p=add(p,z)
 return p
def ev(p,d):return sum(v*d**i for i,v in enumerate(p))
def run():
 start=time.monotonic();count=0;coeffs=0;fail=[];samples=[]
 for T in range(2,51):
  a=[mass(T,i) for i in range(T+1)]
  for i in range(T-1):
   g=add(scale(mul(a[i+1],a[i+1]),i+5),scale(mul(a[i],a[i+2]),-(i+4)))
   count+=1;coeffs+=len(g)
   if min(g)<0:fail.append([T,i,[(k,v) for k,v in enumerate(g) if v<0]])
   if T<=5:samples.append(dict(T=T,i=i,coefficients=g))
 out=dict(status='exact finite integer polynomial experiment only',range='2<=T<=50; 0<=i<=T-2; parameter d unshifted',clearing='B_i=(i+3)! M_i; G=(i+5)B_(i+1)^2-(i+4)B_i B_(i+2)',gap_polynomials=count,coefficients=coeffs,negative=fail,samples=samples,seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
 (O/'top-gap-polynomial-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['samples','negative']}));print('negative polynomials',len(fail))
if __name__=='__main__':run()
