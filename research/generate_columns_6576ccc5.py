"""Machine-authored 6576ccc5. Emit symbolic Lean proofs, not trusted certificates."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
for col in [3,4,5]:
    t=col-3
    table=','.join(f'binomial_poly_{n}M295' for n in range(2*t+10))
    text=f'''import MarkovBandPolynomialM657
/-! Machine-authored 6576ccc5. Universal raw correction-band inequality at
starting column {col}, checked by exact rational polynomial arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 16000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2

theorem band_column{col}_certificateM657 (d k : ℚ) (r : Bool) (hd : 0 ≤ d) (hk : 0 ≤ k) :
 bandColumnM657 d k {t} r*bandColumnM657 d k {t+2} r ≤ bandColumnM657 d k {t+1} r^2 := by
 apply sub_nonneg.mp
 cases r <;> simp only [bandColumnM657,lowColumnMAE9,correctionPolyM657,
   Bool.false_eq_true,if_false,if_true]
 all_goals
   simp only [sum_range_succ,sum_range_zero]
   norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
     Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
   simp only [{table}]
   ring_nf
   positivity

theorem source_band_column{col}_parameterM657 (d k : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r {col} ((d+2*k+(if r then 2 else 1))+k+1)*
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r {col+2} ((d+2*k+(if r then 2 else 1))+k+1) ≤
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r {col+1} ((d+2*k+(if r then 2 else 1))+k+1)^2 := by
 have h0 := source_band_polynomialM657 d k {t} r hq
 have h1 := source_band_polynomialM657 d k {t+1} r hq
 have h2 := source_band_polynomialM657 d k {t+2} r hq
 norm_num only [Nat.reduceAdd] at h0 h1 h2
 have h := band_column{col}_certificateM657 (d:ℚ) (k:ℚ) r (by positivity) (by positivity)
 rw [←h0,←h1,←h2] at h
 exact_mod_cast h

end
end MathGKM.Markov
'''
    p=R/f'MarkovBandColumn{col}M657.lean'
    assert not p.exists()
    p.write_text(text)
