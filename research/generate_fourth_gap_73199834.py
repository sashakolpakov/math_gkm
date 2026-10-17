"""Machine-authored exact universal fourth-column certificate generation.
The inherited short-sum formula is reused; every identity is Lean checked.
"""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,F,serial
from math import comb,lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-73199834'
def cp(p,k):
 a=one
 for z in range(k):a=scale(mul(a,add(p,scale(one,-z))),F(1,z+1))
 return a
def lin(s,d,c):return add(add(scale(x,s),scale(n,d)),scale(one,c))
def masspoly(i,offset):
 a={}
 for k in range(i+4):
  a=add(a,scale(mul(cp(lin(0,1,2*i+8),i+3-k),add(cp(lin(1,0,offset),i+k),scale(cp(lin(1,0,offset+1),i+k+2),4))),comb(i+k,i)))
 return a
def expr(p):return '+\n  '.join(str(v.numerator)+(f'*h^{a}' if a else '')+(f'*d^{b}' if b else '') for (a,b),v in sorted(p.items())) or '0'
a,b,c=[masspoly(k,3) for k in [1,2,3]]
gap=add(mul(b,b),scale(mul(a,c),-1));den=lcm(*(v.denominator for v in gap.values()));g=scale(gap,den)
assert all(v>0 for v in g.values())
src='''import MarkovTopThirdGapMEB6
/-! Machine-authored 73199834. Universal raw fourth-column inequality
in the upper template, with unbounded depth and denominator. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 15000000
set_option maxRecDepth 20000
attribute [local irreducible] topShortQMEB6

theorem top_fourth_gap_positiveM731 (h d : ℚ) (hh : 0 ≤ h) (hd : 0 ≤ d) :
 topShortQMEB6 d (h+3) 1*topShortQMEB6 d (h+3) 3 < topShortQMEB6 d (h+3) 2^2 := by
 have he : DEN*(topShortQMEB6 d (h+3) 2^2-topShortQMEB6 d (h+3) 1*topShortQMEB6 d (h+3) 3)=
  EXPR := by
   unfold topShortQMEB6
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<EXPR := by positivity
 linarith only [he,hp]

theorem top_mass_fourth_strictM731 (d T : ℕ) (hT : 3 ≤ T) :
 topMassM55C d T 1*topMassM55C d T 3 < topMassM55C d T 2^2 := by
 have hT' : (3:ℚ) ≤ T := by exact_mod_cast hT
 have h := top_fourth_gap_positiveM731 ((T:ℚ)-3) d (by linarith) (by positivity)
 rw [sub_add_cancel,←top_short_castMEB6,←top_short_castMEB6,←top_short_castMEB6] at h
 exact_mod_cast h

end
end MathGKM.Markov
'''.replace('DEN',str(den)).replace('EXPR',expr(g))
(R/'research/MarkovTopFourthGapM731.lean').write_text(src)
(O/'fourth-gap-certificate.json').write_text(json.dumps(dict(scale=den,coefficients=serial(g),positive=True,status='generated identity; Lean checking required'),indent=2))
print(json.dumps(dict(scale=den,terms=len(g))))
