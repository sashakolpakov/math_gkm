-- Codex/Astra. Primary source: Agoh INTEGERS 26 A9 (2026), Section 4.
-- Scope: the denominator-cleared numerator, uniformly for all positive n.
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Tactic

namespace MathGKM.Agoh
open Polynomial Finset

/-- Denominator-cleared numerator of sum (-1)^i choose(n,i)/f(x^i).
    The rational expression itself requires all f(x^i) ≠ 0. -/
noncomputable def numerator (n : ℕ) (f : ℝ[X]) : ℝ[X] :=
  ∑ i ∈ range (n+1), C ((-1 : ℝ)^i * n.choose i) *
    ∏ k ∈ (range (n+1)).erase i, f.comp (X^k)

theorem eval_one (n : ℕ) (f : ℝ[X]) :
    (numerator n f).eval 1 =
      (f.eval 1)^n * ∑ i ∈ range (n+1), (-1 : ℝ)^i * n.choose i := by
  unfold numerator
  simp only [eval_finsetSum, eval_mul, eval_C, eval_prod, eval_comp,
    eval_pow, eval_X, one_pow]
  rw [mul_sum]
  apply sum_congr rfl
  intro i hi
  have hc : ((range (n+1)).erase i).card = n := by
    rw [card_erase_of_mem hi, card_range]
    omega
  simp only [prod_const, hc]
  ring

theorem first_order_factor (n : ℕ) (hn : n ≠ 0) (f : ℝ[X]) :
    X - C (1 : ℝ) ∣ numerator n f := by
  rw [dvd_iff_isRoot, IsRoot, eval_one]
  have h : (∑ i ∈ range (n+1), (-1 : ℝ)^i * (n.choose i : ℝ)) = 0 := by
    have hZ := Int.alternating_sum_range_choose_of_ne hn
    exact_mod_cast hZ
  rw [h, mul_zero]

/-- Exact pointwise link to the rational sum; no totalized division shortcut. -/
theorem clears_denominators (n : ℕ) (f : ℝ[X]) (x : ℝ)
    (h : ∀ i ∈ range (n+1), f.eval (x^i) ≠ 0) :
    (numerator n f).eval x =
      (∏ k ∈ range (n+1), f.eval (x^k)) *
      (∑ i ∈ range (n+1), ((-1 : ℝ)^i * n.choose i) / f.eval (x^i)) := by
  simp only [numerator, eval_finsetSum, eval_mul, eval_C, eval_prod,
    eval_comp, eval_pow, eval_X]
  rw [mul_sum]
  apply sum_congr rfl
  intro i hi
  rw [← prod_erase_mul (range (n+1)) (fun k => f.eval (x^k)) hi]
  field_simp [h i hi]

/-- At x=1 the common denominator is nonzero exactly under the paper's local condition. -/
theorem denominator_at_one (n : ℕ) (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    (∏ k ∈ range (n+1), f.eval ((1 : ℝ)^k)) ≠ 0 := by
  simp [hf]

/-- Missing positive-n condition: the cleared numerator at n=0 is one. -/
theorem zero_order (f : ℝ[X]) : numerator 0 f = 1 := by
  simp [numerator]

/-- The region stated in the third proof does not imply a geometric ratio <1. -/
theorem geometric_region_counterexample :
    (2 : ℝ) < 3 ∧ |(7/5 : ℝ)-1| < 1/2 ∧
    ¬ |(7/5 : ℝ)^4 / 3| < 1 := by
  norm_num

theorem missing_positive_n : ¬ (X - C (1 : ℝ) ∣ numerator 0 (X + 1)) := by
  rw [zero_order, dvd_iff_isRoot]
  simp [IsRoot]

/-- Dropping denominator nonvanishing can make the cleared identity false. -/
theorem singular_counterexample :
    (numerator 1 (X - 1)).eval (2 : ℝ) = 1 ∧
      (∏ k ∈ range 2, (X - 1 : ℝ[X]).eval (2^k)) = 0 := by
  have hr : range 2 = {0, 1} := by decide
  have he : ({0, 1} : Finset ℕ).erase 1 = {0} := by decide
  norm_num [numerator, hr, he, eval_comp]

end MathGKM.Agoh
