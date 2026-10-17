"""Machine-authored exact certificate generator. Lean checks every identity."""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,F,serial
from math import comb,lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-eb6a9001'
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
results=[]
for i in range(7):
 a,b,c=[masspoly(k,i+2) for k in [i,i+1,i+2]]
 gap=add(mul(b,b),scale(mul(a,c),-1));den=lcm(*(v.denominator for v in gap.values()));g=scale(gap,den)
 results.append(dict(i=i,terms=len(g),negative=[[a,b,str(v)] for (a,b),v in g.items() if v<0]))
 if i:continue
 assert all(v>0 for v in g.values())
 src='''import MarkovTopVandermondeMEB6
/-! Machine-authored eb6a9001. Universal positive polynomial certificate
for the raw columns 3,4,5 in the upper template. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 15000000
set_option maxRecDepth 20000

def topShortQMEB6 (d T : ℚ) (i : ℕ) : ℚ :=
 ∑ k ∈ range (i+4), ((i+k).choose i:ℚ)*choosePolyM0D3 (d+2*i+8) (i+3-k)*
 (choosePolyM0D3 T (i+k)+4*choosePolyM0D3 (T+1) (i+k+2))

theorem top_short_castMEB6 (d T i : ℕ) :
 (topMassM55C d T i:ℚ)=topShortQMEB6 d T i := by
 rw [top_mass_short_sumMEB6]
 simp only [topShortSumMEB6,topShortQMEB6,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Int.cast_sum,Int.cast_add,Int.cast_mul,Int.cast_natCast,Int.cast_ofNat,choose_poly_natM0D3]
 push_cast
 rfl

theorem top_third_gap_positiveMEB6 (h d : ℚ) (hh : 0 ≤ h) (hd : 0 ≤ d) :
 topShortQMEB6 d (h+2) 0*topShortQMEB6 d (h+2) 2 < topShortQMEB6 d (h+2) 1^2 := by
 have he : DEN*(topShortQMEB6 d (h+2) 1^2-topShortQMEB6 d (h+2) 0*topShortQMEB6 d (h+2) 2)=
  EXPR := by
   norm_num [topShortQMEB6,sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<EXPR := by positivity
 linarith

theorem top_mass_first_strictMEB6 (d T : ℕ) (hT : 2 ≤ T) :
 topMassM55C d T 0*topMassM55C d T 2 < topMassM55C d T 1^2 := by
 have hT' : (2:ℚ) ≤ T := by exact_mod_cast hT
 have h := top_third_gap_positiveMEB6 ((T:ℚ)-2) d (by linarith) (by positivity)
 rw [sub_add_cancel,←top_short_castMEB6,←top_short_castMEB6,←top_short_castMEB6] at h
 exact_mod_cast h

end
end MathGKM.Markov
'''.replace('DEN',str(den)).replace('EXPR',expr(g))
 (R/'research/MarkovTopThirdGapMEB6.lean').write_text(src)
 (O/'top-third-certificate.json').write_text(json.dumps(dict(scale=den,coefficients=serial(g),all_positive=True,status='generated identity, Lean checking required'),indent=2)+'\n')
(O/'top-short-monomial-probe.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results))
