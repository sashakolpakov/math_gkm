"""Machine-authored 6576ccc5. Exact rational bivariate polynomial exploration.
The coefficients here are candidates until independently checked by Lean.
"""
from fractions import Fraction as F
from math import comb,factorial
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-6576ccc5')
class P:
 def __init__(self,x=0):self.p=x.p.copy() if isinstance(x,P) else (x if isinstance(x,dict) else ({(0,0):F(x)} if x else {}))
 def __add__(self,y):
  y=P(y);p=self.p.copy()
  for a,c in y.p.items():p[a]=p.get(a,0)+c
  return P({a:c for a,c in p.items() if c})
 __radd__=__add__
 def __neg__(self):return P({a:-c for a,c in self.p.items()})
 def __sub__(self,y):return self+-P(y)
 def __rsub__(self,y):return P(y)+-self
 def __mul__(self,y):
  y=P(y);p={}
  for a,c in self.p.items():
   for b,e in y.p.items():
    ab=(a[0]+b[0],a[1]+b[1]);p[ab]=p.get(ab,0)+c*e
  return P({a:c for a,c in p.items() if c})
 __rmul__=__mul__
 def __truediv__(self,n):return self*F(1,n)
 def __pow__(self,n):
  p=P(1)
  for _ in range(n):p=p*self
  return p
 def evaluate(self,d,k):return sum(c*d**a*k**b for (a,b),c in self.p.items())
def cp(x,n):
 p=P(1)
 for i in range(n):p=p*(x-i)
 return p/factorial(n)
d=P({(1,0):F(1)});k=P({(0,1):F(1)})
def correction(d,k,t,r):
 a=2 if r else 1;b=3-a
 return 4*sum((cp(d,t-m)*comb(t+m+1,m)*(a*cp(k+t+3,t+m+3)+b*cp(k+t+2,t+m+3)) for m in range(t+1)),P())
def lower(d,j,t):
 return sum((cp(d,t-m)*comb(t+m+3,m)*(cp(j+t+3,t+m+3)+4*cp(j+t+4,t+m+5)) for m in range(t+1)),P())
def column(d,k,t,r):
 j=d+3*k+(3 if r else 2)
 return lower(d,j,t)+correction(d,k,t+1,r)
def run():
 start=time.monotonic();out=dict(status='exact candidate coefficient calculations, not Lean proofs',columns=[],failures=[])
 for r in [False,True]:
  vals=[column(d,k,t,r) for t in range(7)]
  for t in range(5):
   gap=vals[t+1]**2-vals[t]*vals[t+2]
   neg=[(a,str(c)) for a,c in gap.p.items() if c<0]
   out['columns'].append(dict(r=r,start_column=t+3,terms=len(gap.p),degree_d=max(a[0] for a in gap.p),degree_k=max(a[1] for a in gap.p),negative_count=len(neg),negative_examples=neg[:6]))
   (O/f'column-gap-{t+3}-{int(r)}.json').write_text(json.dumps([[a,b,str(c)] for (a,b),c in sorted(gap.p.items())],indent=2)+'\n')
   if neg:out['failures'].append([r,t+3])
 out['seconds']=time.monotonic()-start
 (O/'column-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':run()
