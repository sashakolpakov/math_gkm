"""Machine-authored exact polynomial tests, not Lean proof evidence."""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,F,serial
from math import comb,lcm
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-f8d0715b')
def L(a,b,c):return add(add(scale(x,a),scale(n,b)),scale(one,c))
def cp(p,k):
 a=one
 for z in range(k):a=scale(mul(a,add(p,scale(one,-z))),F(1,z+1))
 return a
def top(i,B,K=0):
 a={}
 for l in range(i+4):
  a=add(a,scale(mul(cp(L(1,0,2*i+8),i+3-l),add(cp(L(1,3,B+3*K),i+l),scale(cp(L(1,3,B+3*K+1),i+l+2),4))),comb(i+l,i)))
 return a
def H(D,a,b,K=0):
 out={}
 for l in range(b+1):out=add(out,scale(mul(cp(L(1,0,D+a),b-l),cp(L(0,1,K),a+l+2)),comb(a+l,a)))
 return out
def corr(i,r,K=0):
 d=3 if r else 2
 if r:terms=[(1,d+i+4,i,i+1),(2,d+i+5,i+1,i+2),(1,d+i+4,i+1,i+2),(1,d+i+4,i,i+2),(1,d+i+5,i,i+2)]
 else:terms=[(2,d+i+5,i+1,i+2),(1,d+i+5,i,i+1),(1,d+i+6,i+1,i+2),(1,d+i+5,i,i+2)]
 out={}
 for w,D,a,b in terms:out=add(out,scale(H(D,a,b,K),4*w))
 return out
def raw(i,r,K=0):return add(top(i,5 if r else 4,K),corr(i,r,K))
def run():
 t=time.monotonic();rows=[]
 for i in range(2,7):
  for r in [False,True]:
   for K in [0,1,2,3,5,10]:
    a,b,c=[raw(j,r,K) for j in range(i,i+3)];g=add(mul(b,b),scale(mul(a,c),-1));bad=[(a,b,str(v)) for (a,b),v in g.items() if v<0]
    row=dict(i=i,r=r,K=K,terms=len(g),negative=len(bad),first=bad[:3]);rows.append(row)
    if not bad:
     den=lcm(*(v.denominator for v in g.values()))
     (O/f'middle-polynomial-{i}-{int(r)}-{K}.json').write_text(json.dumps(dict(i=i,r=r,K=K,scale=den,coefficients=serial(scale(g,den))),indent=2))
     break
 (O/'middle-polynomial-probe.json').write_text(json.dumps(dict(rows=rows,seconds=time.monotonic()-t,status='Exact symbolic evidence, no universal Lean result yet.'),indent=2))
 print(json.dumps(rows))
if __name__=='__main__':run()
