"""Machine-authored upper second-slice coefficient candidate and algebra."""
from pathlib import Path
import json,math
from second_envelope_bf38 import formula
class P(dict):
 def __add__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0):b});d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+(-b)
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0):b});d=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  b=P({(0,0,0):1})
  for _ in range(n):b=b*a
  return b
def F(c,r,t):return (t**3-t)*c*c+6*t*(t+1)*c*r+6*(t+1)*r*r-6*t*(t+2)*r-(t**3-4*t)*c
u=P({(1,0,0):1});v=P({(0,1,0):1});w=P({(0,0,1):1})
c=v+w+2;r=v+1;t=u+1
gap=F(c,r,t)**2-F(c,r,t-1)*F(c,r,t+1)
expression=' + '.join(str(a)+''.join('*'+x+('^'+str(i) if i>1 else '') for x,i in zip(['u','v','w'],k) if i) for k,a in sorted(gap.items()))
checks=0;fail=[]
for n in range(2,25):
 for c in range(3,22):
  for r in range(1,c):
   p=formula(n,c,r,max(2*r-c,0))
   for j in range(n+3,2*n+3):
    t=2*n+2-j;actual=2*p.get((0,j),0)
    checks+=1
    if 3*actual!=8*F(c,r,t):fail.append(dict(n=n,c=c,r=r,j=j,actual=actual))
rec=dict(status='Candidate coefficient formula checked finitely; algebra certificate is exact and separately submitted to Lean',formula='3*(2*F2_j)=8*((t^3-t)c^2+6t(t+1)cr+6(t+1)r^2-6t(t+2)r-(t^3-4t)c), t=2n+2-j, n+3<=j<=2n+2',checks=checks,failures=fail,nonnegative=all(x>=0 for x in gap.values()),gap_terms=[[list(k),a] for k,a in sorted(gap.items())],expression=expression)
Path('evidence/markov-446bbcdc/upper-cubic.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k not in ['gap_terms','expression']}))
if rec['nonnegative']:
 s='''import MarkovCubicBounds446
/-! Machine-authored 446bbcdc. Abstract upper-tail polynomial certificate.
The coefficient-to-expression bridge is not assumed or proved here. -/
namespace MathGKM.Markov
noncomputable section
def upperShape446 (c r t : ℤ) : ℤ :=
 (t^3-t)*c^2+6*t*(t+1)*c*r+6*(t+1)*r^2-6*t*(t+2)*r-(t^3-4*t)*c
theorem upperShape_lc446 (c r t : ℤ) (hr : 1≤r) (hc : r+1≤c) (ht : 1≤t) :
 upperShape446 c r (t-1)*upperShape446 c r (t+1)≤upperShape446 c r t^2 := by
 let u := t-1
 let v := r-1
 let w := c-r-1
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have hw : 0≤w := by dsimp [w]; omega
 have he : upperShape446 c r t^2-upperShape446 c r (t-1)*upperShape446 c r (t+1)=
  EXPR := by dsimp [upperShape446,u,v,w]; ring
 have hp : 0≤EXPR := by positivity
 omega
#print axioms upperShape_lc446
end
end MathGKM.Markov
'''.replace('EXPR',expression)
 Path('research/MarkovUpperShape446.lean').write_text(s)
