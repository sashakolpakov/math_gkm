"""Machine-authored symbolic experiment; fixed columns are not universal coverage."""
from weighted_beta_symbolic_ca9709f2 import P,var,expr,co
from fractions import Fraction as F
from math import lcm,comb
from pathlib import Path
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-80fb7777'
q,k=var(0),var(1)
def choose(p,n):
 out=P(1)
 for i in range(n):out=out*(p-i)*F(1,i+1)
 return out
def fib(n,t,c):
 if c<0:return P()
 if c==0:return P(int(t==0))
 if t==0:return P()
 return choose(P(t-1),c-1)*choose(n-t+c,c)
def gain(q,k,r,c):
 if k==0:return P((2 if r else 1) if c==0 else 0)
 if r:return fib(q,k-1,c-1)+fib(q,k-1,c)+fib(q,k,c)+fib(q+1,k,c)
 return fib(q,k-1,c)+fib(q+1,k-1,c-1)+fib(q+1,k-1,c)+fib(q+1,k,c)
def interpolate(values):
 out=P();level=values[:];i=0
 while level:
  out=out+choose(k,i)*level[0]
  level=[b-a for a,b in zip(level,level[1:])];i+=1
 return out
def short(d,T,i):
 return sum(comb(i+j,i)*choose(d+2*i+8,i+3-j)*(choose(T,i+j)+4*choose(T+1,i+j+2)) for j in range(i+4))
def rat_expr(p,vs=['q','k','z','w']):
 den=lcm(*(v.denominator for v in p.d.values())) if p.d else 1
 e=expr(p*den,vs)
 return f'({e})/{den}' if den!=1 else '('+e+')'
def run(C=11):
 start=time.monotonic();out=[];data={}
 for r in [False,True]:
  rows=[]
  for j in range(2*C+3):
   prev=rows[-1] if j else [P()]*(C+1);prev2=rows[-2] if j>=2 else [P()]*(C+1)
   rows.append([P()]+[4*gain(q,j,r,c-1)+2*prev[c]-2*prev[c-1]-prev2[c]-2*prev2[c-1]-(prev2[c-2] if c>=2 else P()) for c in range(1,C+1)])
  js=[interpolate([v[c] for v in rows[:2*c]]) if c else P() for c in range(C+1)]
  for j in range(2*C+3):
   assert all(co(js[c].ev([q,P(j),P(),P()])).d==rows[j][c].d for c in range(C+1))
  raw=[P()]*3+[short(q,q+3*k+(5 if r else 4),c-3)+js[c].ev([q+2*k+(5 if r else 4),k,P(),P()]) for c in range(3,C+1)]
  for c in range(3,C-1):
   gap=raw[c+1]**2-raw[c]*raw[c+2]
   bad=[(z,str(v)) for z,v in gap.d.items() if v<0]
   row=dict(r=r,c=c,terms=len(gap.d),negative=bad[:8],negative_count=len(bad),raw_negative=[sum(v<0 for v in raw[z].d.values()) for z in range(c,c+3)])
   out.append(row);print(json.dumps(row),flush=True)
  data[r]=js
 (O/'extended-jets-probe.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-start,status='finite symbolic experiment only'),indent=2))
 (O/'extended-jets.json').write_text(json.dumps({str(r):[[[list(z),str(v)] for z,v in sorted(p.d.items())] for p in js] for r,js in data.items()},indent=2))
 return data
if __name__=='__main__':run()
