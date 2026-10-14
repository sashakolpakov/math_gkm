"""Sparse exact symbolic test of normalized layer monotonicity; no CAS dependency."""
from fractions import Fraction as F
from collections import defaultdict
import json,pathlib,time
N=5
def add(*ps):
 d=defaultdict(F)
 for p in ps:
  for m,c in p.items():d[m]+=c
 return {m:c for m,c in d.items() if c}
def scale(p,c):return {m:v*c for m,v in p.items() if v*c}
def mul(p,q):
 d=defaultdict(F)
 for a,x in p.items():
  for b,y in q.items():d[tuple(u+v for u,v in zip(a,b))]+=x*y
 return {m:c for m,c in d.items() if c}
def prod(*ps):
 p=const(1)
 for q in ps:p=mul(p,q)
 return p
def const(n):return {(0,)*N:F(n)} if n else {}
def var(i):return {tuple(int(j==i) for j in range(N)):F(1)}
def sub(p,q):return add(p,scale(q,-1))
def factors(a,j,s,q):
 A=prod(add(scale(s,2),scale(j,-1),q),add(scale(s,2),scale(j,-1),q,const(-1)))
 C=prod(add(a,scale(s,-1),scale(q,-1),const(1)),add(s,q,const(-1)))
 B=prod(add(a,scale(s,-1),scale(q,-1)),add(s,q))
 D=prod(add(scale(s,2),scale(j,-1),q,const(2)),add(scale(s,2),scale(j,-1),q,const(1)))
 return A,B,C,D
def pair(a,j,s,q,r):
 A,B,C,D=factors(a,j,s,q);E,F,G,H=factors(a,j,s,r)
 return add(prod(A,F,G,D),prod(E,B,C,H)),prod(C,D,G,H)
def main():
 start=time.monotonic();q,d,t,e,h=[var(i) for i in range(N)]
 # r=q+d+2, j=r+t, 2s=d+2+t+e, a=s+r+h.
 r=add(q,d,const(2));j=add(r,t);s=scale(add(d,t,e,const(2)),F(1,2));a=add(s,r,h)
 n0,d0=pair(a,j,s,q,r);n1,d1=pair(a,j,s,add(q,const(1)),add(r,const(-1)))
 numerator=sub(mul(n0,d1),mul(n1,d0))
 neg=[(m,str(c)) for m,c in numerator.items() if c<0]
 out=dict(status='exact symbolic experiment',variables=['q','d','t','e','h'],substitution='r=q+d+2,j=r+t,2s=d+t+e+2,a=s+r+h',terms=len(numerator),negative_terms=len(neg),negative_first=neg[:12],seconds=time.monotonic()-start)
 pathlib.Path('evidence/markov-6a40862b/layer-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
 pathlib.Path('evidence/markov-6a40862b/layer-numerator.json').write_text(json.dumps([[m,str(c)] for m,c in sorted(numerator.items())])+'\n')
 print(json.dumps(out),flush=True)
if __name__=='__main__':main()
