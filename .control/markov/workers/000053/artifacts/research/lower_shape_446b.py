"""Machine-authored exact lower-interior formula exploration; not source proof."""
from pathlib import Path
import json
from second_envelope_bf38 import formula
class P(dict):
 def __add__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0,0):b});d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+(-b)
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0,0):b});d=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  b=P({(0,0,0,0):1})
  for _ in range(n):b=b*a
  return b
def K(n,j):return 8*(j-1)*(n-j+1)**2+8*(j-2)*(n-j+1)+4*(j-1)
def H3(n,m,j):
 return 12*((n+1)*(m+1-j)+(m+1)*(n+1-j))+36*(n*(m+2-j)+m*(n+2-j))+48*(n+1)*(m+1-j)*(j-3)+24*(n-m+j)*((j-2)*(j-1)-2)-8*((j-2)*(j-1)*(2*j-3)-6)
def L(n,c,r,j):
 return 6*(c-r)*K(n,j)+6*r*K(n+1,j)+(c-r)*(c-r-1)*H3(n,n,j)+2*(c-r)*r*H3(n,n+1,j)+r*(r-1)*H3(n+1,n+1,j)+24*c*(j-2)-24*(2*(c*n+r)-c*(2*j-3))
t=P({(1,0,0,0):1});s=P({(0,1,0,0):1});u=P({(0,0,1,0):1});v=P({(0,0,0,1):1})
n=t+s+5;j=t+4;r=u+1;c=u+v+2
gap=L(n,c,r,j)**2-L(n,c,r,j-1)*L(n,c,r,j+1)
expression=' + '.join(str(a)+''.join('*'+x+('^'+str(i) if i>1 else '') for x,i in zip(['t','s','u','v'],k) if i) for k,a in sorted(gap.items()))
checks=0;fail=[]
for n in range(3,25):
 for c in range(3,22):
  for r in range(1,c):
   p=formula(n,c,r,max(2*r-c,0))
   for j in range(3,n+1):
    checks+=1
    if 6*p.get((0,j),0)!=L(n,c,r,j):fail.append(dict(n=n,c=c,r=r,j=j))
rec=dict(status='Finite coefficient validation, exact symbolic candidate gap; no source identity proof',checks=checks,failures=fail,terms=len(gap),nonnegative=all(x>=0 for x in gap.values()),negative_terms=[[list(k),a] for k,a in gap.items() if a<0],expression=expression)
Path('evidence/markov-446bbcdc/lower-shape.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='expression'}))
if rec['nonnegative']:
 s='''import MarkovUpperShape446
/-! Machine-authored 446bbcdc. Abstract lower-interior certificate only.
The raw source coefficient formula remains a separate unproved bridge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
def lowerKShape446 (n j : ℤ) := 8*(j-1)*(n-j+1)^2+8*(j-2)*(n-j+1)+4*(j-1)
def lowerHShape446 (n m j : ℤ) :=
 12*((n+1)*(m+1-j)+(m+1)*(n+1-j))+36*(n*(m+2-j)+m*(n+2-j))+
 48*(n+1)*(m+1-j)*(j-3)+24*(n-m+j)*((j-2)*(j-1)-2)-
 8*((j-2)*(j-1)*(2*j-3)-6)
def lowerShape446 (n c r j : ℤ) :=
 6*(c-r)*lowerKShape446 n j+6*r*lowerKShape446 (n+1) j+
 (c-r)*(c-r-1)*lowerHShape446 n n j+2*(c-r)*r*lowerHShape446 n (n+1) j+
 r*(r-1)*lowerHShape446 (n+1) (n+1) j+24*c*(j-2)-24*(2*(c*n+r)-c*(2*j-3))
theorem lowerShape_lc446 (n c r j : ℤ) (hr : 1≤r) (hc : r+1≤c)
 (hj : 4≤j) (hn : j+1≤n) :
 lowerShape446 n c r (j-1)*lowerShape446 n c r (j+1)≤lowerShape446 n c r j^2 := by
 let t := j-4
 let s := n-j-1
 let u := r-1
 let v := c-r-1
 have ht : 0≤t := by dsimp [t]; omega
 have hs : 0≤s := by dsimp [s]; omega
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : lowerShape446 n c r j^2-lowerShape446 n c r (j-1)*lowerShape446 n c r (j+1)=
  EXPR := by dsimp [lowerShape446,lowerHShape446,lowerKShape446,t,s,u,v]; ring
 have hp : 0≤EXPR := by positivity
 omega
#print axioms lowerShape_lc446
end
end MathGKM.Markov
'''.replace('EXPR',expression)
 Path('research/MarkovLowerShape446.lean').write_text(s)
