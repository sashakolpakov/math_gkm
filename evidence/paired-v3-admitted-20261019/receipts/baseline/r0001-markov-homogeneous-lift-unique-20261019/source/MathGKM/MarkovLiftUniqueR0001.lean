import MathGKM.MarkovLiftR0001

/-! Machine-authored 2026-10-19. Uniqueness of the homogeneous lift.
No source numerator or source theorem is introduced as a premise constant. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def HomogeneousAt (T : TriPoly) (d : ℕ) : Prop :=
  ∀ i j k, triCoeff T i j k ≠ 0 → i+j+k = d

theorem homogeneous_slice (T : TriPoly) (d : ℕ) (h : HomogeneousAt T d) (i j : ℕ) :
    (T.coeff i).coeff j = monomial (d-i-j) (triCoeff T i j (d-i-j)) := by
  ext k
  rw [Polynomial.coeff_monomial]
  by_cases hk : d-i-j = k
  · subst k
    simp [triCoeff]
  · rw [if_neg hk]
    by_contra hn
    have hd := h i j k hn
    omega

theorem homogeneous_spec_coeff (T : TriPoly) (d : ℕ) (h : HomogeneousAt T d) (i j : ℕ) :
    coeff (specializeW T) i j = triCoeff T i j (d-i-j) := by
  simp only [coeff, specializeW, Polynomial.coeff_map, Polynomial.coe_mapRingHom]
  rw [homogeneous_slice T d h i j]
  simp [Polynomial.coe_evalRingHom]

theorem homogeneous_lift_unique (P : BiPoly) (d : ℕ) (T : TriPoly)
    (hT : HomogeneousAt T d) (hP : specializeW T = P) :
    T = liftHomogeneous P d := by
  ext i j
  rw [homogeneous_slice T d hT i j, lift_coeff_uv]
  congr 1
  rw [← homogeneous_spec_coeff T d hT i j, hP]

#print axioms homogeneous_lift_unique
end
end MathGKM.Markov
