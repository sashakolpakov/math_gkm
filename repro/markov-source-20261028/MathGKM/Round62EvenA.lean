import MathGKM.Round62DeletionA

/- Machine-authored round62: even recurrence of the actual finite matching sum. -/
namespace MatchingIdentificationR62
open FiniteMatchingR61
noncomputable section
variable {R : Type*} [CommRing R]

theorem even_step (t : R) (c : ℕ → R) (n : ℕ) :
    finiteSum t c (2*(n+2)) =
      (t^2+c (2*n+2)+c (2*n+1))*finiteSum t c (2*(n+1)) -
        c (2*n+1)*c (2*n)*finiteSum t c (2*n) := by
  have h₀ := finiteSum_step t c (2*n+2)
  have h₁ := finiteSum_step t c (2*n+1)
  have h₂ := finiteSum_step t c (2*n)
  have e₀ : 2*(n+2)=2*n+2+2 := by omega
  have e₁ : 2*(n+1)=2*n+2 := by omega
  rw [e₀,e₁]
  linear_combination h₀ + t*h₁ - c (2*n+1)*h₂
end
end MatchingIdentificationR62
