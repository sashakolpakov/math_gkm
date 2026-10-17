"""Machine-authored exact symbolic fixed-s experiment. All coefficients rational.
Variables H,K,R encode h,j-h,r. No symbolic package or unproved identity imported.
"""
from fractions import Fraction as F
from math import comb,factorial
from collections import defaultdict
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-1c65a306')
def add(a,b,sgn=1):
 c=defaultdict(F,a)
 for e,v in b.items():c[e]+=sgn*v
 return {e:v for e,v in c.items() if v}
def scale(a,c):return {e:v*c for e,v in a.items() if v*c}
def mul(a,b):
 c=defaultdict(F)
 for e,v in a.items():
  for f,w in b.items():c[tuple(x+y for x,y in zip(e,f))]+=v*w
 return {e:v for e,v in c.items() if v}
def power(a,n):
 out={(0,0,0):F(1)}
 for _ in range(n):out=mul(out,a)
 return out
C=lambda c:{(0,0,0):F(c)} if c else {}
H={(1,0,0):F(1)};K={(0,1,0):F(1)};R={(0,0,1):F(1)}
def sub(a,vals):
 out={}
 for e,v in a.items():
  t=C(v)
  for x,n in zip(vals,e):t=mul(t,power(x,n))
  out=add(out,t)
 return out
def rising(x,n):
 out=C(1)
 for i in range(1,n+1):out=mul(out,add(x,C(i)))
 return out
# Exact Faulhaber polynomials S_m(H)=sum_(r=0)^h r^m, obtained by telescoping.
S=[add(H,C(1))]
for m in range(1,16):
 t=power(add(H,C(1)),m+1)
 for l in range(m):t=add(t,scale(S[l],comb(m+1,l)),-1)
 S.append(scale(t,F(1,m+1)))
def sumr(a):
 out={}
 for (h,k,r),v in a.items():out=add(out,mul({(h,k,0):v},S[r]))
 return out
def raw(s,t):
 left=rising(add(add(H,K),R,-1),s+3);right=rising(add(K,R),t+3)
 interior=scale(mul(mul(R,add(H,R,-1)),mul(left,right)),16)
 ends=scale(mul(H,add(mul(rising(add(H,K),s+3),rising(K,t+3)),mul(rising(K,s+3),rising(add(H,K),t+3)))),4)
 return add(sumr(interior),ends)
def serial(p):return [[list(e),str(v)] for e,v in sorted(p.items())]
def run():
 start=time.monotonic();out={'status':'exact symbolic experiment only','cases':[]}
 for s in [0,1,2]:
  A=raw(s,s+2);B=raw(s+1,s+1)
  prev=lambda p:sub(p,[add(H,C(-1)),add(K,C(1)),R])
  gap=add(mul(prev(B),A),mul(B,prev(A)),-1)
  # h>=2, j=h+k.
  shifted=sub(gap,[add(H,C(2)),K,R])
  row=dict(s=s,terms=len(gap),shifted_terms=len(shifted),negative=sum(v<0 for v in shifted.values()),degree=max(map(sum,gap)),A=serial(A),B=serial(B),gap=serial(gap),shifted=serial(shifted))
  (O/f'fixed-parameter-s{s}.json').write_text(json.dumps(row,indent=2)+'\n')
  out['cases'].append({k:v for k,v in row.items() if k not in ['A','B','gap','shifted']})
  print(json.dumps(out['cases'][-1]),flush=True)
 out['seconds']=time.monotonic()-start
 (O/'fixed-parameter-probe.json').write_text(json.dumps(out,indent=2)+'\n')
if __name__=='__main__':run()
