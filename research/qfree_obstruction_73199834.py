"""Machine-authored exact cut-base obstruction and actual-q comparison.
Exact integer experiment, not a Lean theorem or a source counterexample.
"""
from math import comb
from pathlib import Path
import json,sys,time,hashlib
sys.set_int_max_str_digits(100000)
start=time.monotonic()
a,r,m=800,4000,6400
H=3*a+r+4;Q=H-a-2
def scalar(k,l):
 return 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
def cut(k):return 1 if k==r else 4*(r-k) if k<r else 0
def next_choose(v,n,j):return v*(n+1)//(n+1-j)
lo=m-r;hi=r
base={lo:comb(a+lo-1,a-1)};qs={lo:comb(Q+lo+a+1,a+2)}
for k in range(lo+1,hi+1):
 base[k]=next_choose(base[k-1],a+k-2,a-1)
 qs[k]=next_choose(qs[k-1],Q+k+a,a+2)
v0=vq=mass0=massq=0
for k in range(lo,hi+1):
 l=m-k;w=base[k]*base[l]*cut(k)*cut(l);f=scalar(k,l)
 v0+=w*f;mass0+=w;vq+=w*qs[k]*qs[l]*f;massq+=w*qs[k]*qs[l]
assert v0<0 and vq>0
def describe(v):
 s=str(v);return dict(sign=(v>0)-(v<0),bits=abs(v).bit_length(),decimal=s,sha256=hashlib.sha256(s.encode()).hexdigest())
out=dict(status='exact integer experiment only',parameters=dict(a=a,r=r,m=m,H=H,Q=Q,i=a-1,d=H-2*(a-1)-9),qfree_sum=describe(v0),actual_scaled_sum=describe(vq),qfree_mass=describe(mass0),actual_scaled_mass=describe(massq),q_denominator=describe(comb(H-1,a+2)),terms=hi-lo+1,seconds=time.monotonic()-start,interpretation='The full cut q-free comparison is false. The actual q-weighted group at the same valid parameters is positive. Neither is a source coefficient triple.')
Path('evidence/markov-73199834/qfree-exact-obstruction.json').write_text(json.dumps(out,indent=2))
print(json.dumps(dict(parameters=out['parameters'],qfree_sign=-1,actual_sign=1,terms=hi-lo+1,seconds=out['seconds'])))
