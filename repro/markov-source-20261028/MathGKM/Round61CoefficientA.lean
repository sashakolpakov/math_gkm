import Mathlib
import MathGKM.ResearchSemantics

/- Machine-authored round61. Isolated successfully elaborated coefficient declarations from
Round61SpecializationA; neither rejected positivity proof is copied or replayed. -/
namespace MatchingSpecializationR61
noncomputable section
def specialize {σ : Type*} (w : σ → ℝ)
    (P : Polynomial (Polynomial (MvPolynomial σ ℤ))) :
    Polynomial (Polynomial ℝ) :=
  P.map (Polynomial.mapRingHom (MvPolynomial.eval₂Hom (Int.castRingHom ℝ) w))

theorem coefficient_commutation {σ : Type*} (w : σ → ℝ)
    (P : Polynomial (Polynomial (MvPolynomial σ ℤ))) (i j : ℕ) :
    ((specialize w P).coeff i).coeff j =
      MvPolynomial.eval₂ (Int.castRingHom ℝ) w ((P.coeff i).coeff j) := by
  simp [specialize,Polynomial.coeff_map]

theorem zero_tail {σ : Type*} (w : σ → ℝ)
    (P : Polynomial (Polynomial (MvPolynomial σ ℤ))) (i j : ℕ)
    (h : (P.coeff i).coeff j=0) :
    ((specialize w P).coeff i).coeff j=0 := by
  rw [coefficient_commutation,h]
  exact map_zero (MvPolynomial.eval₂Hom (Int.castRingHom ℝ) w)


end
end MatchingSpecializationR61
