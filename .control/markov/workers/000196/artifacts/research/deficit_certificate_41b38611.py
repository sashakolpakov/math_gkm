"""Machine-authored symbolic scalar certificate exploration and generation."""
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
def data(B):
 i=add(X(0),C(B));r=add(X(1),C(3));H=add(r,scale(i,2),X(2),C(9))
 ip1=add(i,C(1));ip3=add(i,C(3));ip4=add(i,C(4))
 L=add(mul(ip1,add(r,C(-1)),H),scale(mul(r,add(scale(r,2),ip1)),-1))
 S=add(mul(i,ip1),scale(mul(r,ip1),6),scale(mul(r,r),6))
 P=add(mul(L,L,ip4),mul(add(H,scale(r,-1),C(1)),L,ip1,ip3,ip4),
       scale(mul(add(H,r),add(H,r),S,ip1,ip3),-1))
 return L,P
out=[]
for B in range(20,41):
 L,P=data(B);bad=[(k,v) for k,v in P.items() if v<0]
 out.append(dict(base=B,terms=len(P),negative=bad))
Path('evidence/markov-41b38611/deficit-scalar-probe.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out))
def expr(P):
 terms=[]
 for mon,v in sorted(P.items(),reverse=True):
  factors=[str(v)]+[f'{x}^{n}' if n>1 else x for x,n in zip(['x','y','z'],mon) if n]
  terms.append('*'.join(factors))
 return '+'.join(terms) or '0'
L,P=data(27)
assert all(v>0 for v in P.values()) and all(v>0 for v in L.values())
src='''import MarkovTemplateStrongMomentM41B
/-! Machine-authored 41b38611. Scalar certificate for a proposed deficit
moment route. Its actual-weight moment attachment is a separate obligation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
def deficitLowerM41B (i r H : ℝ) : ℝ := (i+1)*(r-1)*H-r*(2*r+i+1)
def deficitSecondM41B (i r : ℝ) : ℝ := i*(i+1)+6*r*(i+1)+6*r^2
def deficitScalarM41B (i r H : ℝ) : ℝ :=
 deficitLowerM41B i r H^2*(i+4)+
 (H-r+1)*deficitLowerM41B i r H*(i+1)*(i+3)*(i+4)-
 (H+r)^2*deficitSecondM41B i r*(i+1)*(i+3)
theorem deficit_scalar_shiftM41B (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < deficitScalarM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) := by
 have he : deficitScalarM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) = EXPR := by
   unfold deficitScalarM41B deficitLowerM41B deficitSecondM41B
   ring
 rw [he]
 positivity
theorem deficit_lower_shiftM41B (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < deficitLowerM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) := by
 have he : deficitLowerM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) = LOWER := by
   unfold deficitLowerM41B
   ring
 rw [he]
 positivity
theorem deficit_scalar_positiveM41B (i r H : ℝ) (hi : 27 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < deficitScalarM41B i r H := by
 have h := deficit_scalar_shiftM41B (i-27) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
theorem deficit_lower_positiveM41B (i r H : ℝ) (hi : 27 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < deficitLowerM41B i r H := by
 have h := deficit_lower_shiftM41B (i-27) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
'''.replace('EXPR',expr(P)).replace('LOWER',expr(L))
Path('research/MarkovDeficitScalarM41B.lean').write_text(src)
