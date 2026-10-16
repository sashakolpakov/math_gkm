import Mathlib.Algebra.Group.ForwardDiff
import MarkovBinomialPolyM0D3
/-! Machine-authored live request 29509309. Discrete Newton positivity.
No finite scan or real-offset positivity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def newtonCoeffM295 (f : ℕ → ℕ → ℤ) (r s : ℕ) : ℤ :=
 (fwdDiff 1)^[s] (fun y => (fwdDiff 1)^[r] (fun x => f x y) 0) 0

theorem newton_nonneg_oneM295 (f : ℕ → ℤ)
 (h : ∀ r, 0 ≤ (fwdDiff 1)^[r] f 0) (n : ℕ) : 0 ≤ f n := by
 have he := shift_eq_sum_fwdDiff_iter 1 f n 0
 simp only [nsmul_eq_mul, mul_one, zero_add] at he
 rw [he]
 exact sum_nonneg (fun r _ => mul_nonneg (by positivity) (h r))

theorem newton_expansionM295 (f : ℕ → ℕ → ℤ) (x y : ℕ) :
 f x y = ∑ r ∈ range (x+1), ∑ s ∈ range (y+1),
   (x.choose r:ℤ)*(y.choose s:ℤ)*newtonCoeffM295 f r s := by
 have hx := shift_eq_sum_fwdDiff_iter 1 (fun t => f t y) x 0
 simp only [nsmul_eq_mul, mul_one, zero_add] at hx
 rw [hx]
 apply sum_congr rfl
 intro r hr
 have hy := shift_eq_sum_fwdDiff_iter 1
   (fun t => (fwdDiff 1)^[r] (fun z => f z t) 0) y 0
 simp only [nsmul_eq_mul, mul_one, zero_add] at hy
 rw [hy, mul_sum]
 apply sum_congr rfl
 intro s hs
 rfl

theorem newton_nonnegM295 (f : ℕ → ℕ → ℤ)
 (h : ∀ r s, 0 ≤ newtonCoeffM295 f r s) (x y : ℕ) : 0 ≤ f x y := by
 rw [newton_expansionM295]
 exact sum_nonneg (fun r _ => sum_nonneg (fun s _ =>
   mul_nonneg (mul_nonneg (by positivity) (by positivity)) (h r s)))

theorem choose_poly_nat_nonnegM295 (n k : ℕ) : 0 ≤ choosePolyM0D3 n k := by
 rw [← choose_poly_natM0D3]
 positivity

end
end MathGKM.Markov
