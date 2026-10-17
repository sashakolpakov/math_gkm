"""Machine-authored exact symbolic exploration; not a proof."""
from pathlib import Path
import json
def C(n):return {(0,0,0):n} if n else {}
def X(j):return {tuple(int(k==j) for k in range(3)):1}
def add(*ps):
 q={}
 for p in ps:
  for k,v in p.items():q[k]=q.get(k,0)+v
 return {k:v for k,v in q.items() if v}
def scale(p,n):return {k:v*n for k,v in p.items() if v*n}
def mul(*ps):
 q=C(1)
 for p in ps:
  z={}
  for a,v in q.items():
   for b,w in p.items():
    key=tuple(x+y for x,y in zip(a,b));z[key]=z.get(key,0)+v*w
  q={k:v for k,v in z.items() if v}
 return q
def data(B,N,R=3):
 i=add(X(0),C(B));r=add(X(1),C(R));H=add(r,scale(i,2),X(2),C(9))
 ip1=add(i,C(1));ip3=add(i,C(3));ip4=add(i,C(4));n=scale(ip4,N)
 L=add(mul(ip1,add(r,C(-1)),H),scale(mul(r,add(scale(r,2),ip1)),-1))
 S=add(mul(i,ip1),scale(mul(r,ip1),6),scale(mul(r,r),6))
 # n B -(n+1) A = (i+4)*((2N-1)i+(6N-1))
 J=add(scale(i,2*N-1),C(6*N-1)); A=mul(ip1,add(n,C(1)))
 P=add(mul(J,L,L,ip4),mul(add(H,scale(r,-1),C(1)),L,A,ip3,ip4),scale(mul(add(H,r),add(H,r),S,A,ip3),-1))
 return L,P
def expr(P):
 return '+'.join('*'.join([str(v)]+[f'{x}^{n}' if n>1 else x for x,n in zip(['x','y','z'],mon) if n]) for mon,v in sorted(P.items(),reverse=True)) or '0'
if __name__=='__main__':
 out=[]
 for N in [1,2,4,8,16,32,64,128,256]:
  for B in range(5,28):
   L,P=data(B,N)
   if min(P.values())>0 and min(L.values())>0:
    out.append(dict(multiplier=N,cutoff=B,terms=len(P),minimum=min(P.values())));break
 Path('evidence/markov-6738b4ea/weak-margin-probe.json').write_text(json.dumps(out,indent=2))
 print(json.dumps(out))
