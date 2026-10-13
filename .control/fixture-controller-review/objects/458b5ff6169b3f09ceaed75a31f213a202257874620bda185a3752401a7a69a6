import MathGKM.Markov

namespace MathGKM.Markov
noncomputable section

/-- Cross inequalities include ordinary adjacent log-concavity, and keep zeros. -/
def CrossLC (f : ℤ → ℝ) : Prop :=
  ∀ i j, i ≤ j → f i * f (j+1) ≤ f (i+1) * f j

def Smooth (f : ℤ → ℝ) (k : ℤ) : ℝ := f k + f (k-1)

theorem crossLC_shift {f : ℤ → ℝ} (h : CrossLC f) (s : ℤ) :
    CrossLC (fun k => f (k+s)) := by
  intro i j hij
  simpa [add_assoc, add_comm, add_left_comm] using h (i+s) (j+s) (by omega)

theorem crossLC_forward {f : ℤ → ℝ} (h : CrossLC f) :
    CrossLC (fun k => f k + f (k+1)) := by
  intro i j hij
  by_cases he : i = j
  · subst j; simp [mul_comm]
  have h1 := h i j hij
  have h2 := h (i+1) (j+1) (by omega)
  have h3 := h i (j+1) (by omega)
  have h4 := h (i+1) j (by omega)
  dsimp only
  nlinarith

theorem crossLC_smooth {f : ℤ → ℝ} (h : CrossLC f) : CrossLC (Smooth f) := by
  have hs := crossLC_shift (crossLC_forward h) (-1)
  simpa [CrossLC, Smooth, sub_eq_add_neg, add_comm] using hs

def Pascal : ℕ → (ℤ → ℝ) → (ℤ → ℝ)
  | 0, f => f
  | n+1, f => Smooth (Pascal n f)

theorem crossLC_pascal {f : ℤ → ℝ} (h : CrossLC f) (n : ℕ) :
    CrossLC (Pascal n f) := by
  induction n with
  | zero => exact h
  | succ n ih => exact crossLC_smooth ih

theorem crossLC_adjacent {f : ℤ → ℝ} (h : CrossLC f) (k : ℤ) :
    f (k-1) * f (k+1) ≤ f k ^ 2 := by
  simpa [sq] using h (k-1) k (by omega)

def QuadSeq (A B C : ℝ) (k : ℤ) : ℝ :=
  if k=0 then A else if k=1 then B else if k=2 then C else 0

theorem quad_nonneg {A B C : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B) (hC : 0 ≤ C)
    (k : ℤ) : 0 ≤ QuadSeq A B C k := by
  unfold QuadSeq; split_ifs <;> first | assumption | exact le_rfl

theorem crossLC_quad {A B C : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hC : 0 ≤ C) (h : A*C ≤ B^2) : CrossLC (QuadSeq A B C) := by
  intro i j hij
  by_cases hi : 0 ≤ i ∧ i ≤ 2
  · by_cases hj : -1 ≤ j ∧ j ≤ 1
    · obtain ⟨hi0,hi2⟩ := hi
      obtain ⟨hj0,hj1⟩ := hj
      interval_cases i <;> interval_cases j <;> norm_num [QuadSeq] at * <;> nlinarith
    · have hz : QuadSeq A B C (j+1) = 0 := by
        simp only [QuadSeq]; split_ifs <;> first | omega | rfl
      rw [hz, mul_zero]
      exact mul_nonneg (quad_nonneg hA hB hC _) (quad_nonneg hA hB hC _)
  · have hz : QuadSeq A B C i = 0 := by
      simp only [QuadSeq]; split_ifs <;> first | omega | rfl
    rw [hz, zero_mul]
    exact mul_nonneg (quad_nonneg hA hB hC _) (quad_nonneg hA hB hC _)

theorem quadratic_pascal_logConcave {A B C : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hC : 0 ≤ C) (h : A*C ≤ B^2) (n : ℕ) (k : ℤ) :
    Pascal n (QuadSeq A B C) (k-1) * Pascal n (QuadSeq A B C) (k+1) ≤
      Pascal n (QuadSeq A B C) k ^ 2 :=
  crossLC_adjacent (crossLC_pascal (crossLC_quad hA hB hC h) n) k

open Polynomial

/-- Polynomial coefficients extended by zero at negative integer indices. -/
def CoeffSeq (p : ℝ[X]) (k : ℤ) : ℝ := if k < 0 then 0 else p.coeff k.toNat

theorem coeffSeq_smooth (p : ℝ[X]) :
    CoeffSeq ((1+X)*p) = Smooth (CoeffSeq p) := by
  funext k
  by_cases hk : k < 0
  · have hk' : k-1 < 0 := by omega
    simp [CoeffSeq, Smooth, hk, hk']
  · have hk0 : 0 ≤ k := by omega
    lift k to ℕ using hk0
    cases k with
    | zero => simp [CoeffSeq, Smooth, add_mul]
    | succ n =>
      simp [CoeffSeq, Smooth, add_mul,
        show ¬ (↑n + 1 : ℤ) < 0 by omega,
        show ¬ (↑n : ℤ) < 0 by omega]

def Quadratic (A B D : ℝ) : ℝ[X] := C A + C B * X + C D * X^2

theorem coeffSeq_quadratic (A B D : ℝ) :
    CoeffSeq (Quadratic A B D) = QuadSeq A B D := by
  funext k
  by_cases hk : k < 0
  · simp [CoeffSeq, QuadSeq, hk, show k ≠ 0 by omega,
      show k ≠ 1 by omega, show k ≠ 2 by omega]
  · lift k to ℕ using (show 0 ≤ k by omega)
    by_cases h0 : k = 0
    · subst k; norm_num [CoeffSeq, Quadratic, QuadSeq]
    by_cases h1 : k = 1
    · subst k; norm_num [CoeffSeq, Quadratic, QuadSeq]
    by_cases h2 : k = 2
    · subst k
      change (Quadratic A B D).coeff 2 = D
      simp [Quadratic]
    simp [CoeffSeq, Quadratic, QuadSeq, coeff_X, coeff_C, h0, h1, h2, Ne.symm h1,
      show ¬ (↑k : ℤ) < 0 by omega, show (↑k : ℤ) ≠ 2 by omega]

theorem coeffSeq_binomial_mul (p : ℝ[X]) (n : ℕ) :
    CoeffSeq ((1+X)^n*p) = Pascal n (CoeffSeq p) := by
  induction n with
  | zero => simp [Pascal]
  | succ n ih =>
    rw [pow_succ', mul_assoc, coeffSeq_smooth, ih]
    rfl

theorem quadratic_binomial_logConcave {A B D : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hD : 0 ≤ D) (h : A*D ≤ B^2) (n : ℕ) (k : ℤ) :
    let f := CoeffSeq ((1+X)^n * Quadratic A B D)
    f (k-1) * f (k+1) ≤ f k ^ 2 := by
  dsimp only
  rw [coeffSeq_binomial_mul, coeffSeq_quadratic]
  exact quadratic_pascal_logConcave hA hB hD h n k

def ThirdA (a : ℝ) := (a-1)*(a-2)/2
def ThirdB (a b : ℝ) := a*b-4*a+2
def ThirdC (b : ℝ) := (b-1)*(b-2)/2

/-- Certificate selected after the exact experiment, not a sampled inequality. -/
theorem third_gap_certificate (t s : ℝ) :
    4 * (ThirdB (t+3) (t+s+4)^2 - ThirdA (t+3) * ThirdC (t+s+4)) =
      4 + 38*s + 34*s^2 + 20*t + 69*t*s + 21*t*s^2 +
      29*t^2 + 37*t^2*s + 3*t^2*s^2 + 16*t^3 + 6*t^3*s + 3*t^4 := by
  unfold ThirdA ThirdB ThirdC
  ring

theorem third_parameters {a b : ℝ} (ha : 3 ≤ a) (hb : a+1 ≤ b) :
    0 ≤ ThirdA a ∧ 0 ≤ ThirdB a b ∧ 0 ≤ ThirdC b ∧
      ThirdA a * ThirdC b ≤ ThirdB a b ^ 2 := by
  have ht : 0 ≤ a-3 := by linarith
  have hs : 0 ≤ b-a-1 := by linarith
  have he := third_gap_certificate (a-3) (b-a-1)
  have ea : a-3+3 = a := by ring
  have eb : a-3+(b-a-1)+4 = b := by ring
  rw [ea, eb] at he
  have hp : 0 ≤ 4 + 38*(b-a-1) + 34*(b-a-1)^2 + 20*(a-3) +
      69*(a-3)*(b-a-1) + 21*(a-3)*(b-a-1)^2 + 29*(a-3)^2 +
      37*(a-3)^2*(b-a-1) + 3*(a-3)^2*(b-a-1)^2 + 16*(a-3)^3 +
      6*(a-3)^3*(b-a-1) + 3*(a-3)^4 := by positivity
  have hA : 0 ≤ ThirdA a := by
    unfold ThirdA
    exact div_nonneg (mul_nonneg (by linarith) (by linarith)) (by norm_num)
  have hC : 0 ≤ ThirdC b := by
    have : 3 ≤ b := by linarith
    unfold ThirdC
    exact div_nonneg (mul_nonneg (by linarith) (by linarith)) (by norm_num)
  have hB : 0 ≤ ThirdB a b := by
    have hprod : 0 ≤ a*(b-a-1) := mul_nonneg (by linarith) hs
    have hprod2 : 0 ≤ (a-1)*(a-2) := mul_nonneg (by linarith) (by linarith)
    unfold ThirdB
    nlinarith
  exact ⟨hA,hB,hC,by nlinarith⟩

/-- All coefficients of the published third-diagonal expression, with no
restriction a/b<=3/5. This theorem is about the explicit polynomial;
the recurrence-to-expression identity is a separate formal obligation. -/
theorem third_diagonal_expression_logConcave (a b : ℕ) (ha : 3 ≤ a) (hab : a < b)
    (k : ℤ) :
    let f := CoeffSeq ((1+X)^(a+b-5) *
      Quadratic (ThirdA a) (ThirdB a b) (ThirdC b))
    f (k-1) * f (k+1) ≤ f k ^ 2 := by
  have h := third_parameters (a := (a:ℝ)) (b := (b:ℝ))
    (by exact_mod_cast ha) (by exact_mod_cast hab)
  exact quadratic_binomial_logConcave h.1 h.2.1 h.2.2.1 h.2.2.2 _ _

/-- Literal algebraic form of the source's T₂ at v=1, with n=a+b-5. -/
def SourceThird (a b : ℝ) (n : ℕ) : ℝ[X] :=
  C (ThirdA a)*(1+X)^(n+2) + C (a*(b-a)-a)*X*(1+X)^(n+1) +
    C (((b-a)^2+5*a-3*b)/2)*X^2*(1+X)^n

theorem sourceThird_factor (a b : ℝ) (n : ℕ) :
    SourceThird a b n = (1+X)^n * Quadratic (ThirdA a) (ThirdB a b) (ThirdC b) := by
  have hB : ThirdB a b = 2*ThirdA a+(a*(b-a)-a) := by
    unfold ThirdB ThirdA; ring
  have hC : ThirdC b = ThirdA a+(a*(b-a)-a)+((b-a)^2+5*a-3*b)/2 := by
    unfold ThirdC ThirdA; ring
  rw [hB,hC]
  simp only [SourceThird, Quadratic, pow_add, pow_one, map_add, map_mul, map_ofNat]
  ring

def DiagonalSeq (P : BiPoly) (d : ℕ) (k : ℤ) : ℝ :=
  if 0 ≤ k ∧ k ≤ d then (coeff P k.toNat (d-k.toNat) : ℝ) else 0

/-- Explicit remaining formula bridge. This is a proposition, not an axiom. -/
def ThirdDiagonalFormula (l : Label) : Prop :=
  DiagonalSeq l.p (l.a+l.b-3) = CoeffSeq (SourceThird l.a l.b (l.a+l.b-5))

/-- Honest conditional transfer to the actual raw Markov diagonal. -/
theorem third_diagonal_of_formula (l : Label) (ha : 3 ≤ l.a) (hab : l.a < l.b)
    (hf : ThirdDiagonalFormula l) (k : ℤ) :
    DiagonalSeq l.p (l.a+l.b-3) (k-1) * DiagonalSeq l.p (l.a+l.b-3) (k+1) ≤
      DiagonalSeq l.p (l.a+l.b-3) k ^ 2 := by
  unfold ThirdDiagonalFormula at hf
  rw [hf, sourceThird_factor]
  exact third_diagonal_expression_logConcave l.a l.b ha hab k

end
end MathGKM.Markov
