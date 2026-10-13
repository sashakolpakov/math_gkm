-- Actual Codex/gpt-6-astra, 2026-10-13. Quantifiers and examples.
import MathGKM.AgohMain
import Mathlib.FieldTheory.Separable
import Mathlib.FieldTheory.Perfect

namespace MathGKM.Agoh
open Polynomial Finset
set_option maxHeartbeats 800000

/-- The conjecture's alternatives, on its explicitly regular domain. -/
def PaperAlternatives (f : ℝ[X]) : Prop :=
  (∃ k c, f = monomial k c) ∨ (Squarefree f ∧ f.eval 1 ≠ 0)

/-- Exact connection between squarefreeness and simple real roots. -/
theorem simple_roots_iff_squarefree (f : ℝ[X]) (hf : f ≠ 0) (hs : f.Splits) :
    f.roots.Nodup ↔ Squarefree f :=
  (nodup_roots_iff_of_splits hf hs).trans PerfectField.separable_iff_squarefree

/-- Per-n reading, with the necessary f(1) ≠ 0 condition restored. -/
def ConjecturePerN (n : ℕ) : Prop :=
  ∀ f : ℝ[X], f ≠ 0 → f.Splits → f.eval 1 ≠ 0 →
    ((X - C (1 : ℝ))^n ∣ (rationalSum n f).num ↔ PaperAlternatives f)

/-- All-n reading; the universal quantifier is inside the equivalence. -/
def ConjectureAllN : Prop :=
  ∀ f : ℝ[X], f ≠ 0 → f.Splits → f.eval 1 ≠ 0 →
    ((∀ n : ℕ, (X - C (1 : ℝ))^n ∣ (rationalSum n f).num) ↔ PaperAlternatives f)

noncomputable def repeatedExample : ℝ[X] := (X + 1)^2

theorem repeatedExample_regular : repeatedExample.eval 1 ≠ 0 := by
  norm_num [repeatedExample]

theorem repeatedExample_nonzero : repeatedExample ≠ 0 := by
  intro h
  exact repeatedExample_regular (by rw [h, eval_zero])

theorem repeatedExample_splits : repeatedExample.Splits := by
  simpa [repeatedExample] using (Splits.X_add_C (1 : ℝ)).pow 2

theorem repeatedExample_not_monomial : ¬ ∃ k c, repeatedExample = monomial k c := by
  rintro ⟨k, c, h⟩
  have h0 := congrArg (Polynomial.eval 0) h
  have hm := congrArg (Polynomial.eval (-1)) h
  cases k with
  | zero => norm_num [repeatedExample] at h0 hm; linarith
  | succ k => simp [repeatedExample, eval_monomial] at h0

theorem repeatedExample_not_squarefree : ¬ Squarefree repeatedExample := by
  intro h
  have hu : IsUnit (X + 1 : ℝ[X]) := h _ (by simp [repeatedExample, pow_two])
  have hv := hu.map (Polynomial.evalRingHom (-1 : ℝ))
  simp at hv

theorem repeatedExample_not_alternatives : ¬ PaperAlternatives repeatedExample := by
  rintro (h | h)
  · exact repeatedExample_not_monomial h
  · exact repeatedExample_not_squarefree h.1

/-- A single nonsingular, nonmonomial polynomial with a double real root
    works simultaneously for every n, including every positive n. -/
theorem repeatedExample_all_n (n : ℕ) :
    (X - C (1 : ℝ))^n ∣ (rationalSum n repeatedExample).num :=
  reduced_numerator n _ repeatedExample_regular

theorem refutes_per_n (n : ℕ) : ¬ ConjecturePerN n := by
  intro h
  exact repeatedExample_not_alternatives
    ((h _ repeatedExample_nonzero repeatedExample_splits repeatedExample_regular).mp
      (repeatedExample_all_n n))

theorem refutes_all_n : ¬ ConjectureAllN := by
  intro h
  exact repeatedExample_not_alternatives
    ((h _ repeatedExample_nonzero repeatedExample_splits repeatedExample_regular).mp
      repeatedExample_all_n)

/-- The all-positive-n convention gives the same property: order zero is
    automatic and cannot change the verdict about the conjecture. -/
theorem all_n_iff_positive (f : ℝ[X]) :
    (∀ n : ℕ, (X - C (1 : ℝ))^n ∣ (rationalSum n f).num) ↔
      (∀ n : ℕ, 0 < n → (X - C (1 : ℝ))^n ∣ (rationalSum n f).num) := by
  constructor
  · exact fun h n _ => h n
  · intro h n
    cases n with
    | zero => simp
    | succ n => exact h _ (Nat.succ_pos _)

/-- An informative nonsplit example: real-rootedness is unnecessary too. -/
theorem complex_root_example (n : ℕ) :
    (X - C (1 : ℝ))^n ∣ (rationalSum n (X^2 + 1)).num := by
  apply reduced_numerator
  norm_num

theorem H_two (a : ℝ) :
    numerator 2 (X + C a) = (X - 1)^2 * (X - C a) := by
  have hr : range 3 = {0, 1, 2} := by decide
  have h1 : ({0, 1, 2} : Finset ℕ).erase 1 = {0, 2} := by decide
  have h2 : ({0, 1, 2} : Finset ℕ).erase 2 = {0, 1} := by decide
  norm_num [numerator, hr, h1, h2, add_comp]
  ring

theorem H_three (a : ℝ) :
    numerator 3 (X + C a) =
      (X - 1)^3 * (X^3 - C (2*a)*X^2 - C (2*a)*X + C (a^2)) := by
  have hr : range 4 = {0, 1, 2, 3} := by decide
  have h1 : ({0, 1, 2, 3} : Finset ℕ).erase 1 = {0, 2, 3} := by decide
  have h2 : ({0, 1, 2, 3} : Finset ℕ).erase 2 = {0, 1, 3} := by decide
  have h3 : ({0, 1, 2, 3} : Finset ℕ).erase 3 = {0, 1, 2} := by decide
  norm_num [numerator, hr, h1, h2, h3, add_comp, C_mul, C_pow, C_ofNat]
  ring

/-- The paper's exceptional-multiplicity condition, stated without radicals. -/
theorem extra_factor_three (a : ℝ) (ha : a^2 - 4*a + 1 = 0) :
    (X - C (1 : ℝ))^4 ∣ numerator 3 (X + C a) := by
  rw [H_three]
  have h : X - C (1 : ℝ) ∣
      X^3 - C (2*a)*X^2 - C (2*a)*X + C (a^2) := by
    rw [dvd_iff_isRoot]
    simp only [IsRoot, eval_add, eval_sub, eval_pow, eval_mul, eval_X, eval_C]
    convert ha using 1
    ring
  rw [show 4 = 3+1 from rfl, pow_succ]
  simpa only [C_1] using
    mul_dvd_mul (dvd_refl ((X - C (1 : ℝ))^3)) h

theorem extra_factor_radicals :
    (X - C (1 : ℝ))^4 ∣ (rationalSum 3 (X + C (2 + Real.sqrt 3))).num ∧
    (X - C (1 : ℝ))^4 ∣ (rationalSum 3 (X + C (2 - Real.sqrt 3))).num := by
  have hs : (Real.sqrt 3)^2 = (3 : ℝ) := Real.sq_sqrt (by norm_num)
  constructor
  · apply (cleared_iff_reduced 3 4 _ (by simp; nlinarith [Real.sqrt_nonneg 3])).mp
    apply extra_factor_three
    nlinarith
  · apply (cleared_iff_reduced 3 4 _ (by simp; nlinarith)).mp
    apply extra_factor_three
    nlinarith

/-- The Section 4 displayed degree n(n+1)/2 misses the multiplicity j.
    Here n=1, j=2, beta=-1, so its displayed polynomial has degree 2. -/
theorem section_four_polynomial :
    numerator 1 repeatedExample = X^2 + C (2 : ℝ)*X - C 3 := by
  have hr : range 2 = {0, 1} := by decide
  have h1 : ({0, 1} : Finset ℕ).erase 1 = {0} := by decide
  norm_num [numerator, repeatedExample, hr, h1, pow_comp, add_comp, C_ofNat]
  ring

theorem section_four_degree : (numerator 1 repeatedExample).natDegree = 2 := by
  rw [section_four_polynomial]
  compute_degree!

/-- Why nonvanishing at 1 matters for a general cleared/reduced bridge.
    This is a genuine rational function (nonzero polynomial denominator),
    with a removable singularity at 1, not an evaluation of 0/0. -/
theorem cancellation_without_regularity :
    (X - C (1 : ℝ)) ∣ (X - C (1 : ℝ)) ∧
    ¬ (X - C (1 : ℝ)) ∣
      (algebraMap ℝ[X] (RatFunc ℝ) (X - C (1 : ℝ)) /
        algebraMap ℝ[X] (RatFunc ℝ) (X - C (1 : ℝ))).num := by
  constructor
  · exact dvd_refl _
  · rw [div_self (RatFunc.algebraMap_ne_zero (X_sub_C_ne_zero (1 : ℝ)))]
    rw [RatFunc.num_one, dvd_iff_isRoot]
    simp [IsRoot]

end MathGKM.Agoh
