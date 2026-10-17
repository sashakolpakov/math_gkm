"""Machine-authored exact symbolic certificate generator, checked by Lean."""
from top_symbolic_b3eed364 import *
from math import lcm
R=Path('/Users/sasha/math_gkm')
def cpoly(p,k):
 a=one
 for z in range(k):a=scale(mul(a,add(p,scale(one,-z))),F(1,z+1))
 return a
def lin(s,d,c):return add(add(scale(x,s),scale(n,d)),scale(one,c))
A=scale(lin(0,1,1),4)
B=scale(mul(lin(1,0,1),cpoly(lin(1,1,4),2)),4)
C=add(cpoly(lin(2,1,6),3),scale(add(add(cpoly(lin(2,1,7),5),scale(cpoly(lin(1,1,7),5),-1)),scale(mul(x,cpoly(lin(1,1,6),4)),-1)),4))
gap=add(mul(B,B),scale(mul(A,C),-1));den=lcm(*(v.denominator for v in gap.values()));g=scale(gap,den)
assert all(v>=0 for v in g.values()),g
def expr(p):
 return '+\n  '.join(str(v.numerator)+(f'*s^{a}' if a else '')+(f'*d^{b}' if b else '') for (a,b),v in sorted(p.items())) or '0'
source='''import MarkovTopEdgesMB3E
/-! Machine-authored b3eed364. Exact positive certificate for the first
upper-sector horizontal triple. Generated algebra is checked by ring. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
def topEdgeThirdMB3E (s d : ℚ) : ℚ :=
 choosePolyM0D3 (2*s+d+6) 3+4*(choosePolyM0D3 (2*s+d+7) 5-
 choosePolyM0D3 (s+d+7) 5-s*choosePolyM0D3 (s+d+6) 4)
def topEdgeSecondMB3E (s d : ℚ) : ℚ := 4*(s+1)*choosePolyM0D3 (s+d+4) 2
theorem top_edge_gap_positiveMB3E (s d : ℚ) (hs : 0 ≤ s) (hd : 0 ≤ d) :
 4*(d+1)*topEdgeThirdMB3E s d < topEdgeSecondMB3E s d^2 := by
 have he : DEN*(topEdgeSecondMB3E s d^2-4*(d+1)*topEdgeThirdMB3E s d)=
  EXPR := by
   unfold topEdgeSecondMB3E topEdgeThirdMB3E
   rw [binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295]
   simp only [binomial_poly_5M295]
   ring
 have hp : (0:ℚ)<EXPR := by positivity
 linarith
end
end MathGKM.Markov
'''.replace('DEN',str(den)).replace('EXPR',expr(g))
(R/'research/MarkovTopEdgeGapMB3E.lean').write_text(source)
(O/'top-edge-certificate.json').write_text(json.dumps(dict(scale=den,coefficients=serial(g),all_nonnegative=True),indent=2)+'\n')
print(dict(scale=den,terms=len(g)))
