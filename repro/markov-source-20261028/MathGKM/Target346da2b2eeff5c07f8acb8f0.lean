import MathGKM.Round61CoefficientA
import MathGKM.Markov
def MathGKM.Target346da2b2eeff5c07f8acb8f0.Interface :=
  (
    True
  )
def MathGKM.Target346da2b2eeff5c07f8acb8f0.Transport (StudyInterface : MathGKM.Target346da2b2eeff5c07f8acb8f0.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target346da2b2eeff5c07f8acb8f0.Goal (StudyInterface : MathGKM.Target346da2b2eeff5c07f8acb8f0.Interface) : Prop :=
  (
    (∀ (σ : Type) (w : σ → ℝ)
      (P : Polynomial (Polynomial (MvPolynomial σ ℤ))) (i j : ℕ),
      ((MatchingSpecializationR61.specialize w P).coeff i).coeff j =
        MvPolynomial.eval₂ (Int.castRingHom ℝ) w ((P.coeff i).coeff j)) ∧
    (∀ (σ : Type) (w : σ → ℝ)
      (P : Polynomial (Polynomial (MvPolynomial σ ℤ))) (i j : ℕ),
      (P.coeff i).coeff j=0 →
      ((MatchingSpecializationR61.specialize w P).coeff i).coeff j=0)
  )
