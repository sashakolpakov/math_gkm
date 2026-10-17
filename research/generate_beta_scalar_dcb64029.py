"""Machine-authored exact three-variable positive scalar certificate."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-dcb64029'
def add(*ps):
 out={}
 for p in ps:
  for k,v in p.items():out[k]=out.get(k,0)+v
 return {k:v for k,v in out.items() if v}
def scale(p,c):return {k:v*c for k,v in p.items() if v*c}
def mul(*ps):
 out={(0,0,0):1}
 for p in ps:
  q={}
  for a,v in out.items():
   for b,w in p.items():
    k=tuple(x+y for x,y in zip(a,b));q[k]=q.get(k,0)+v*w
  out={k:v for k,v in q.items() if v}
 return out
one={(0,0,0):1};x={(1,0,0):1};y={(0,1,0):1};z={(0,0,1):1}
a=add(x,one);m=add(y,scale(one,2));H=add(scale(a,3),scale(m,2),scale(one,5),z)
g=add(mul(add(scale(a,2),scale(one,2)),add(scale(a,2),scale(one,3)),add(mul(H,H),scale(mul(add(scale(a,3),scale(one,7)),H),-1),scale(a,-5),scale(one,-14))),scale(mul(add(m,scale(one,-2)),add(scale(a,2),scale(one,3)),add(H,mul(a,a),scale(a,5),scale(one,7))),-4),scale(mul(add(m,scale(one,-2)),add(m,scale(one,-3)),add(mul(a,a),scale(a,6),scale(one,7))),-2))
assert all(v>0 for v in g.values())
expr='+\n  '.join(str(v)+''.join(f'*{var}^{power}' for var,power in zip(['x','y','z'],k) if power) for k,v in sorted(g.items()))
src='''import MarkovTopTailRepresentationMDCB
/-! Machine-authored dcb64029. Scalar part of a proposed beta-binomial
comparison. Actual beta moments and likelihood attachment remain separate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000

def betaGapMDCB (a m H : ℤ) : ℤ :=
 (2*a+2)*(2*a+3)*(H^2-(3*a+7)*H-5*a-14)-
 4*(m-2)*(2*a+3)*(H+a^2+5*a+7)-
 2*(m-2)*(m-3)*(a^2+6*a+7)

theorem beta_gap_shift_positiveMDCB (x y z : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < betaGapMDCB (x+1) (y+2) (3*(x+1)+2*(y+2)+5+z) := by
 have he : betaGapMDCB (x+1) (y+2) (3*(x+1)+2*(y+2)+5+z)=
  EXPR := by unfold betaGapMDCB; ring
 rw [he]
 positivity

theorem beta_gap_positiveMDCB (a m H : ℤ)
 (ha : 1 ≤ a) (hm : 2 ≤ m) (hH : 3*a+2*m+5 ≤ H) :
 0 < betaGapMDCB a m H := by
 have h := beta_gap_shift_positiveMDCB (a-1) (m-2) (H-(3*a+2*m+5))
   (by omega) (by omega) (by omega)
 convert h using 1 <;> ring

theorem beta_gap_tail_regionMDCB (d i r m : ℕ)
 (hd : i+4*r ≤ d+1) (hm : 2 ≤ m) (hmr : m ≤ 2*r) :
 0 < betaGapMDCB ((i:ℤ)+1) m ((d:ℤ)+2*i+9) := by
 apply beta_gap_positiveMDCB
 · omega
 · exact_mod_cast hm
 · have hd' : (i:ℤ)+4*r ≤ d+1 := by exact_mod_cast hd
   have hm' : (m:ℤ) ≤ 2*r := by exact_mod_cast hmr
   omega

end
end MathGKM.Markov
'''.replace('EXPR',expr)
(R/'research/MarkovTopBetaScalarMDCB.lean').write_text(src)
(O/'beta-scalar-certificate.json').write_text(json.dumps(dict(terms=len(g),coefficients=[[list(k),v] for k,v in sorted(g.items())],status='generated identity, separate Lean validation required'),indent=2)+'\n')
print(json.dumps(dict(terms=len(g))))
