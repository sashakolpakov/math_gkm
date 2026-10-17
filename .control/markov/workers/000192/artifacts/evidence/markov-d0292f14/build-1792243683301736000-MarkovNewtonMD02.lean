import Mathlib.Algebra.Group.ForwardDiff
import MarkovBinomialPolyM0D3
/-! Machine-authored live request d0292f14; reuses the earlier generic Newton argument. Discrete Newton positivity.
No finite scan or real-offset positivity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def newtonCoeffMD02 (f : ℕ → ℕ → ℤ) (r s : ℕ) : ℤ :=
 (fwdDiff 1)^[s] (fun y => (fwdDiff 1)^[r] (fun x => f x y) 0) 0

theorem newton_nonneg_oneMD02 (f : ℕ → ℤ)
 (h : ∀ r, 0 ≤ (fwdDiff 1)^[r] f 0) (n : ℕ) : 0 ≤ f n := by
 have he := shift_eq_sum_fwdDiff_iter 1 f n 0
 simp only [nsmul_eq_mul, mul_one, zero_add, Nat.cast_id] at he
 rw [he]
 exact sum_nonneg (fun r _ => mul_nonneg (by positivity) (h r))

theorem newton_expansionMD02 (f : ℕ → ℕ → ℤ) (x y : ℕ) :
 f x y = ∑ r ∈ range (x+1), ∑ s ∈ range (y+1),
   (x.choose r:ℤ)*(y.choose s:ℤ)*newtonCoeffMD02 f r s := by
 have hx := shift_eq_sum_fwdDiff_iter 1 (fun t => f t y) x 0
 simp only [nsmul_eq_mul, mul_one, zero_add, Nat.cast_id] at hx
 rw [hx]
 apply sum_congr rfl
 intro r hr
 have hy := shift_eq_sum_fwdDiff_iter 1
   (fun t => (fwdDiff 1)^[r] (fun z => f z t) 0) y 0
 simp only [nsmul_eq_mul, mul_one, zero_add, Nat.cast_id] at hy
 rw [hy, mul_sum]
 apply sum_congr rfl
 intro s hs
 simp only [newtonCoeffMD02, mul_assoc]

theorem newton_nonnegMD02 (f : ℕ → ℕ → ℤ)
 (h : ∀ r s, 0 ≤ newtonCoeffMD02 f r s) (x y : ℕ) : 0 ≤ f x y := by
 rw [newton_expansionMD02 f x y]
 exact sum_nonneg (fun r _ => sum_nonneg (fun s _ =>
   mul_nonneg (mul_nonneg (by positivity) (by positivity)) (h r s)))

theorem choose_poly_nat_nonnegMD02 (n k : ℕ) : 0 ≤ choosePolyM0D3 n k := by
 rw [← choose_poly_natM0D3]
 positivity

end
end MathGKM.Markov
