import MathGKM.Markov

/-! Machine-authored round40. Generic finite-polynomial compensation interface. -/
namespace GroupedR40
open Polynomial
open scoped BigOperators
noncomputable section

def Defect (A₀ A₁ A₂ : Polynomial ℤ) : Polynomial ℤ := A₁^2-A₀*A₂

def Nonnegative (P : Polynomial ℤ) : Prop := ∀ l, 0 ≤ P.coeff l

theorem defect_coeff (A₀ A₁ A₂ : Polynomial ℤ) (l : ℕ) :
    (Defect A₀ A₁ A₂).coeff l =
      ∑ st ∈ Finset.HasAntidiagonal.antidiagonal l,
        (A₁.coeff st.1*A₁.coeff st.2-A₀.coeff st.1*A₂.coeff st.2) := by
  simp only [Defect, pow_two, coeff_sub, coeff_mul, Finset.sum_sub_distrib]

theorem eval_one_nonnegative (P : Polynomial ℤ) (h : Nonnegative P) :
    0 ≤ P.eval 1 := by
  rw [eval_eq_sum, Polynomial.sum]
  exact Finset.sum_nonneg (fun k _ => by simpa using h k)

theorem evaluation_bridge (A₀ A₁ A₂ : Polynomial ℤ)
    (h : Nonnegative (Defect A₀ A₁ A₂)) :
    A₀.eval 1*A₂.eval 1 ≤ (A₁.eval 1)^2 := by
  have hn := eval_one_nonnegative _ h
  simpa only [Defect, eval_sub, eval_pow, eval_mul, sub_nonneg] using hn

def encode (n : ℕ) (w : ℕ → ℤ) : Polynomial ℤ :=
  ∑ s ∈ Finset.range (n+1), monomial s (w s)

theorem encode_coeff (n : ℕ) (w : ℕ → ℤ) (s : ℕ) :
    (encode n w).coeff s = if s≤n then w s else 0 := by
  classical
  simp [encode, coeff_monomial, Finset.sum_ite_eq']

theorem encode_eval (n : ℕ) (w : ℕ → ℤ) :
    (encode n w).eval 1 = ∑ s ∈ Finset.range (n+1), w s := by
  simp only [encode, eval_finsetSum, eval_monomial, one_pow, mul_one]

theorem encode_mul_coeff (n : ℕ) (a b : ℕ → ℤ) (l : ℕ) :
    (encode n a*encode n b).coeff l =
      ∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
        if s+t=l then a s*b t else 0 := by
  classical
  simp only [encode, Finset.sum_mul, Finset.mul_sum, finsetSum_coeff,
    monomial_mul_monomial, coeff_monomial]
  rw [Finset.sum_comm]

theorem grouped_coeff (n : ℕ) (a b c : ℕ → ℤ) (l : ℕ) :
    (Defect (encode n a) (encode n b) (encode n c)).coeff l =
      ∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
        if s+t=l then b s*b t-a s*c t else 0 := by
  classical
  simp only [Defect, pow_two, coeff_sub, encode_mul_coeff]
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro s hs
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro t ht
  split_ifs <;> simp

theorem grouped_nonnegative (n : ℕ) (a b c : ℕ → ℤ)
    (h : ∀ l, l≤2*n → 0 ≤
      ∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
        if s+t=l then b s*b t-a s*c t else 0) :
    Nonnegative (Defect (encode n a) (encode n b) (encode n c)) := by
  classical
  intro l
  rw [grouped_coeff]
  by_cases hl : l≤2*n
  · exact h l hl
  · have hz : (∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
        if s+t=l then b s*b t-a s*c t else 0)=0 := by
      apply Finset.sum_eq_zero
      intro s hs
      apply Finset.sum_eq_zero
      intro t ht
      have hs' := Finset.mem_range.mp hs
      have ht' := Finset.mem_range.mp ht
      rw [if_neg (by omega)]
    rw [hz]

theorem finite_bridge (n : ℕ) (a b c : ℕ → ℤ)
    (h : Nonnegative (Defect (encode n a) (encode n b) (encode n c))) :
    (∑ s ∈ Finset.range (n+1), a s)*(∑ s ∈ Finset.range (n+1), c s) ≤
      (∑ s ∈ Finset.range (n+1), b s)^2 := by
  simpa only [encode_eval] using evaluation_bridge _ _ _ h

theorem grouped_finite_bridge (n : ℕ) (a b c : ℕ → ℤ)
    (h : ∀ l, l≤2*n → 0 ≤
      ∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
        if s+t=l then b s*b t-a s*c t else 0) :
    (∑ s ∈ Finset.range (n+1), a s)*(∑ s ∈ Finset.range (n+1), c s) ≤
      (∑ s ∈ Finset.range (n+1), b s)^2 :=
  finite_bridge n a b c (grouped_nonnegative n a b c h)

end
end GroupedR40
#print axioms GroupedR40.evaluation_bridge
#print axioms GroupedR40.finite_bridge
