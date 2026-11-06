import MathGKM.Markov

/-! Machine-authored round38 conditional bridge. No reachability premise is
discharged here; individual and both cross inequalities remain explicit. -/
namespace StateCrossR38

def LC (a : ℤ → ℤ) : Prop := ∀ x, a x*a (x+2) ≤ a (x+1)^2
def Cross (a b : ℤ → ℤ) : Prop :=
  ∀ x, a x*b (x+2) ≤ a (x+1)*b (x+1) ∧
    b x*a (x+2) ≤ a (x+1)*b (x+1)

theorem mixture_local (a0 a1 a2 b0 b1 b2 α β : ℤ)
    (hα : 0 ≤ α) (hβ : 0 ≤ β)
    (ha : a0*a2 ≤ a1^2) (hb : b0*b2 ≤ b1^2)
    (hab : a0*b2 ≤ a1*b1) (hba : b0*a2 ≤ a1*b1) :
    (α*a0+β*b0)*(α*a2+β*b2) ≤ (α*a1+β*b1)^2 := by
  have h1 := mul_nonneg (sq_nonneg α) (sub_nonneg.mpr ha)
  have h2 := mul_nonneg (sq_nonneg β) (sub_nonneg.mpr hb)
  have h3 := mul_nonneg (mul_nonneg hα hβ) (sub_nonneg.mpr hab)
  have h4 := mul_nonneg (mul_nonneg hα hβ) (sub_nonneg.mpr hba)
  nlinarith only [h1,h2,h3,h4]

/-- The stronger unrestricted-sequence statement implies the committed
nonnegative finitely supported version without any support assumption. -/
theorem mixture (a b : ℤ → ℤ) (α β : ℤ)
    (hna : ∀ x, 0 ≤ a x) (hnb : ∀ x, 0 ≤ b x)
    (hα : 0 ≤ α) (hβ : 0 ≤ β) (ha : LC a) (hb : LC b)
    (hc : Cross a b) : LC (fun x => α*a x+β*b x) := by
  intro x
  exact mixture_local _ _ _ _ _ _ _ _ hα hβ (ha x) (hb x) (hc x).1 (hc x).2

theorem finite_mixture (a b : ℤ →₀ ℤ) (α β : ℕ)
    (hna : ∀ x, 0 ≤ a x) (hnb : ∀ x, 0 ≤ b x)
    (ha : ∀ x, a x*a (x+2) ≤ a (x+1)^2)
    (hb : ∀ x, b x*b (x+2) ≤ b (x+1)^2)
    (hc : ∀ x, a x*b (x+2) ≤ a (x+1)*b (x+1) ∧
      b x*a (x+2) ≤ a (x+1)*b (x+1)) :
    ∀ x, ((α : ℤ)*a x+(β : ℤ)*b x)*((α : ℤ)*a (x+2)+(β : ℤ)*b (x+2)) ≤
      ((α : ℤ)*a (x+1)+(β : ℤ)*b (x+1))^2 := by
  exact mixture a b α β hna hnb (Nat.cast_nonneg _) (Nat.cast_nonneg _) ha hb hc

end StateCrossR38
