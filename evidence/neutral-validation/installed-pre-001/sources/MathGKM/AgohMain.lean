-- Actual Codex/gpt-6-astra, 2026-10-13. Uniform Agoh divisibility.
import MathGKM.AgohExercise
import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.RingTheory.Coprime.Lemmas
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.Algebra.Polynomial.Splits

namespace MathGKM.Agoh
open Polynomial Finset
set_option maxRecDepth 3000

/-- Alternating substitution operator on polynomials. -/
noncomputable def alternating (n : ℕ) (g : ℝ[X]) : ℝ[X] :=
  ∑ i ∈ range (n+1), C ((-1 : ℝ)^i * n.choose i) * g.comp (X^i)

theorem alternating_monomial (n k : ℕ) (c : ℝ) :
    alternating n (monomial k c) = C c * (1 - X^k)^n := by
  unfold alternating
  rw [sub_eq_add_neg, add_comm (1 : ℝ[X]), add_pow, mul_sum]
  apply sum_congr rfl
  intro i hi
  rw [show -(X^k : ℝ[X]) = (-1) * X^k by ring, mul_pow]
  simp only [monomial_comp, C_mul, C_pow, C_neg, C_1, C_eq_natCast,
    one_pow, mul_one]
  simp only [← pow_mul]
  rw [Nat.mul_comm k i]
  ring

theorem alternating_dvd (n : ℕ) (g : ℝ[X]) :
    (X - C (1 : ℝ))^n ∣ alternating n g := by
  induction g using Polynomial.induction_on' with
  | add p q hp hq =>
    simpa [alternating, add_comp, mul_add, sum_add_distrib] using dvd_add hp hq
  | monomial k c =>
    rw [alternating_monomial]
    apply dvd_mul_of_dvd_right
    apply pow_dvd_pow_of_dvd
    rw [dvd_iff_isRoot]
    simp [IsRoot]

theorem coprime_at_one (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    IsCoprime (X - C (1 : ℝ)) f := by
  apply ((irreducible_X_sub_C (1 : ℝ)).isCoprime_or_dvd f).resolve_right
  intro h
  exact hf ((dvd_iff_isRoot).mp h)

/-- Substitution by any natural power preserves the ideal (X-1)^n. -/
theorem power_dvd_comp (n i : ℕ) (q : ℝ[X])
    (h : (X - C (1 : ℝ))^n ∣ q) :
    (X - C (1 : ℝ))^n ∣ q.comp (X^i) := by
  obtain ⟨r, rfl⟩ := h
  rw [mul_comp, pow_comp, sub_comp, X_comp, C_comp]
  apply dvd_mul_of_dvd_left
  apply pow_dvd_pow_of_dvd
  rw [dvd_iff_isRoot]
  simp [IsRoot]

noncomputable def denominator (n : ℕ) (f : ℝ[X]) : ℝ[X] :=
  ∏ i ∈ range (n+1), f.comp (X^i)

/-- Uniform n-fold theorem for every polynomial regular at 1. -/
theorem main_regular (n : ℕ) (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    (X - C (1 : ℝ))^n ∣ numerator n f := by
  obtain ⟨a, g, hg⟩ := (coprime_at_one f hf).pow_left (m := n)
  have hinv : (X - C (1 : ℝ))^n ∣ 1 - g * f := by
    refine ⟨a, ?_⟩
    linear_combination -hg
  have hterm (i : ℕ) : (X - C (1 : ℝ))^n ∣
      1 - g.comp (X^i) * f.comp (X^i) := by
    simpa only [sub_comp, one_comp, mul_comp] using power_dvd_comp n i _ hinv
  have hdiff : (X - C (1 : ℝ))^n ∣
      numerator n f - denominator n f * alternating n g := by
    unfold numerator alternating
    rw [mul_sum, ← sum_sub_distrib]
    apply dvd_sum
    intro i hi
    have hprod := prod_erase_mul (range (n+1)) (fun k => f.comp (X^k)) hi
    change _ = denominator n f at hprod
    rw [← hprod]
    convert dvd_mul_of_dvd_right (hterm i)
      (C ((-1 : ℝ)^i * n.choose i) *
        ∏ k ∈ (range (n+1)).erase i, f.comp (X^k)) using 1
    ring
  have hbase := dvd_mul_of_dvd_right (alternating_dvd n g) (denominator n f)
  simpa only [sub_add_cancel] using dvd_add hdiff hbase

/-- The cleared polynomial statement even holds when f(1)=0, although Q is
    then outside its domain because its i=0 summand divides by zero. -/
theorem main (n : ℕ) (f : ℝ[X]) :
    (X - C (1 : ℝ))^n ∣ numerator n f := by
  by_cases hf : f.eval 1 = 0
  · unfold numerator
    apply dvd_sum
    intro i hi
    apply dvd_mul_of_dvd_right
    have hc : ((range (n+1)).erase i).card = n := by
      rw [card_erase_of_mem hi, card_range]
      omega
    have h := prod_dvd_prod_of_dvd
      (s := (range (n+1)).erase i)
      (fun _ => X - C (1 : ℝ)) (fun k => f.comp (X^k)) (by
        intro k hk
        rw [dvd_iff_isRoot]
        simpa [IsRoot] using hf)
    simpa only [prod_const, hc] using h
  · exact main_regular n f hf

theorem denominator_eval_one (n : ℕ) (f : ℝ[X]) :
    (denominator n f).eval 1 = (f.eval 1)^(n+1) := by
  simp [denominator, eval_prod, eval_comp]

theorem denominator_ne_zero (n : ℕ) (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    denominator n f ≠ 0 := by
  intro h
  have := denominator_eval_one n f
  rw [h, eval_zero] at this
  exact (pow_ne_zero (n+1) hf) this.symm

/-- Q_n as an actual rational function; domain conditions are stated in
    the linking theorems, not inferred from totalized field division. -/
noncomputable def rationalSum (n : ℕ) (f : ℝ[X]) : RatFunc ℝ :=
  ∑ i ∈ range (n+1),
    algebraMap ℝ[X] (RatFunc ℝ) (C ((-1 : ℝ)^i * n.choose i)) /
    algebraMap ℝ[X] (RatFunc ℝ) (f.comp (X^i))

theorem rationalSum_eq_fraction (n : ℕ) (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    rationalSum n f =
      algebraMap ℝ[X] (RatFunc ℝ) (numerator n f) /
      algebraMap ℝ[X] (RatFunc ℝ) (denominator n f) := by
  apply (eq_div_iff (RatFunc.algebraMap_ne_zero (denominator_ne_zero n f hf))).mpr
  simp only [rationalSum, numerator, map_sum, map_mul, map_prod, sum_mul]
  apply sum_congr rfl
  intro i hi
  have hne : f.comp (X^i) ≠ 0 := by
    intro h
    have he := congrArg (Polynomial.eval 1) h
    simp only [eval_comp, eval_pow, eval_X, one_pow, eval_zero] at he
    exact hf he
  have hprod := prod_erase_mul (range (n+1))
    (fun k => algebraMap ℝ[X] (RatFunc ℝ) (f.comp (X^k))) hi
  simp only [denominator, map_prod]
  rw [← hprod]
  field_simp [RatFunc.algebraMap_ne_zero hne]

/-- Cancellation cannot remove factors X-1: the common denominator is
    coprime to X-1. RatFunc.num is the canonical reduced numerator. -/
theorem reduced_numerator (n : ℕ) (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    (X - C (1 : ℝ))^n ∣ (rationalSum n f).num := by
  have hc : IsCoprime ((X - C (1 : ℝ))^n) (denominator n f) :=
    (coprime_at_one _ (by rw [denominator_eval_one]; exact pow_ne_zero _ hf)).pow_left
  apply hc.dvd_of_dvd_mul_right
  rw [(RatFunc.num_mul_eq_mul_denom_iff (denominator_ne_zero n f hf)).mpr
    (rationalSum_eq_fraction n f hf)]
  exact dvd_mul_of_dvd_left (main n f) _

/-- In fact the cleared and reduced numerators have exactly the same
    divisibility by every power of X-1 on the intended domain. -/
theorem cleared_iff_reduced (n m : ℕ) (f : ℝ[X]) (hf : f.eval 1 ≠ 0) :
    (X - C (1 : ℝ))^m ∣ numerator n f ↔
      (X - C (1 : ℝ))^m ∣ (rationalSum n f).num := by
  constructor
  · intro h
    have hc : IsCoprime ((X - C (1 : ℝ))^m) (denominator n f) :=
      (coprime_at_one _ (by rw [denominator_eval_one]; exact pow_ne_zero _ hf)).pow_left
    apply hc.dvd_of_dvd_mul_right
    rw [(RatFunc.num_mul_eq_mul_denom_iff (denominator_ne_zero n f hf)).mpr
      (rationalSum_eq_fraction n f hf)]
    exact dvd_mul_of_dvd_left h _
  · intro h
    apply h.trans
    rw [rationalSum_eq_fraction n f hf]
    exact RatFunc.num_div_dvd _ (denominator_ne_zero n f hf)

/-- The paper's Theorem 1.1, with its exact real-parameter restriction. -/
theorem theorem_1_1 (n : ℕ) (a : ℝ) (ha : a ≠ -1) :
    (X - C (1 : ℝ))^n ∣ (rationalSum n (X + C a)).num := by
  apply reduced_numerator
  simpa using (show (1 : ℝ) + a ≠ 0 by intro h; apply ha; linarith)

/-- Formula (1.3), including the excluded index and the constant i=0 factor. -/
theorem paper_H (n : ℕ) (a : ℝ) :
    numerator n (X + C a) =
      ∑ i ∈ range (n+1), C ((-1 : ℝ)^i * n.choose i) *
        ∏ k ∈ (range (n+1)).erase i, (X^k + C a) := by
  simp [numerator, add_comp]

/-- Formula (1.2) on precisely the nonsingular evaluation domain. -/
theorem paper_G (n : ℕ) (a x : ℝ)
    (hx : ∀ i ∈ range (n+1), x^i + a ≠ 0) :
    (numerator n (X + C a)).eval x =
      (∏ k ∈ range (n+1), (x^k + a)) *
      ∑ i ∈ range (n+1), ((-1 : ℝ)^i * n.choose i) / (x^i + a) := by
  have h := clears_denominators n (X + C a) x (by simpa using hx)
  simp_rw [eval_add, eval_X, eval_C] at h
  exact h

/-- Theorem 3.1 under the paper's stated hypotheses. Splits over ℝ means
    real-rooted; Squarefree means every root is simple in this setting.
    Monicity is only a normalization and is unnecessary. -/
theorem theorem_3_1 (n : ℕ) (f : ℝ[X]) (_hd : 0 < f.natDegree)
    (_hr : f.Splits) (_hs : Squarefree f) (hf : f.eval 1 ≠ 0) :
    (X - C (1 : ℝ))^n ∣ (rationalSum n f).num :=
  reduced_numerator n f hf

/-- All multiplicities, not merely simple roots, are permitted. -/
theorem repeated_root_family (n j : ℕ) (b : ℝ) (hb : b ≠ 1) :
    (X - C (1 : ℝ))^n ∣ (rationalSum n ((X - C b)^j)).num := by
  apply reduced_numerator
  simpa using pow_ne_zero j (sub_ne_zero.mpr hb.symm)

end MathGKM.Agoh
