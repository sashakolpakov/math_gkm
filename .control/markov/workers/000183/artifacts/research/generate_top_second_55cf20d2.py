"""Machine-authored 55cf20d2. Exact algebra; generated identity checked by Lean."""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,F,serial
from pathlib import Path
from math import lcm
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-55cf20d2'
def cp(p,k):
 a=one
 for z in range(k):a=scale(mul(a,add(p,scale(one,-z))),F(1,z+1))
 return a
def lin(s,d,c):return add(add(scale(x,s),scale(n,d)),scale(one,c))
def weighted(a,k,m):return add(add(cp(add(add(a,m),one),k+2),scale(cp(add(a,one),k+2),-1)),scale(mul(m,cp(a,k+1)),-1))
# s=t-5, d=n+5-3t. Thus t=s+5, n=3s+d+10.
t=lin(1,0,5);N=lin(3,1,10);m=lin(1,0,2);a=lin(1,1,9)
A=scale(mul(lin(1,0,3),cp(lin(1,1,6),2)),4)
B=add(cp(lin(2,1,10),3),scale(weighted(lin(1,1,8),3,m),4))
C=add(mul(m,cp(lin(2,1,11),4)),scale(add(scale(weighted(a,5,m),5),mul(lin(-1,-1,-5),weighted(a,4,m))),4))
gap=add(mul(B,B),scale(mul(A,C),-1));den=lcm(*(v.denominator for v in gap.values()));g=scale(gap,den)
assert all(v>0 for v in g.values()),g
def expr(p):return '+\n  '.join(str(v.numerator)+(f'*s^{a}' if a else '')+(f'*d^{b}' if b else '') for (a,b),v in sorted(p.items())) or '0'
src='''import MarkovTopFourthM55C
/-! Machine-authored 55cf20d2. Positive certificate for columns 2,3,4.
The generated identity is checked by ring normalization. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 10000
def weightedChooseQM55C (a m : ℚ) (k : ℕ) : ℚ :=
 choosePolyM0D3 (a+m+1) (k+2)-choosePolyM0D3 (a+1) (k+2)-m*choosePolyM0D3 a (k+1)
def topSecondQM55C (s d : ℚ) : ℚ := 4*(s+3)*choosePolyM0D3 (s+d+6) 2
def topThirdQM55C (s d : ℚ) : ℚ :=
 choosePolyM0D3 (2*s+d+10) 3+4*weightedChooseQM55C (s+d+8) (s+2) 3
def topFourthQM55C (s d : ℚ) : ℚ :=
 (s+2)*choosePolyM0D3 (2*s+d+11) 4+
 4*(5*weightedChooseQM55C (s+d+9) (s+2) 5+(-s-d-5)*weightedChooseQM55C (s+d+9) (s+2) 4)
theorem top_second_gap_positiveM55C (s d : ℚ) (hs : 0 ≤ s) (hd : 0 ≤ d) :
 topSecondQM55C s d*topFourthQM55C s d < topThirdQM55C s d^2 := by
 have he : DEN*(topThirdQM55C s d^2-topSecondQM55C s d*topFourthQM55C s d)=
  EXPR := by
   unfold topSecondQM55C topThirdQM55C topFourthQM55C weightedChooseQM55C
   simp only [Nat.reduceAdd]
   simp only [binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,
     binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295]
   ring
 have hp : (0:ℚ)<EXPR := by positivity
 linarith
end
end MathGKM.Markov
'''.replace('DEN',str(den)).replace('EXPR',expr(g))
(R/'research/MarkovTopSecondGapM55C.lean').write_text(src)
(O/'top-second-certificate.json').write_text(json.dumps(dict(scale=den,coefficients=serial(g),all_positive=True,status='generated exact identity; Lean checking required'),indent=2)+'\n')
print(dict(scale=den,terms=len(g)))
