import MathGKM.Round32TransportA
import MathGKM.Markov
def MathGKM.Target1d67f485aa92a28e86f48e88.Interface :=
  (
    True
  )
def MathGKM.Target1d67f485aa92a28e86f48e88.Transport (StudyInterface : MathGKM.Target1d67f485aa92a28e86f48e88.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target1d67f485aa92a28e86f48e88.Goal (StudyInterface : MathGKM.Target1d67f485aa92a28e86f48e88.Interface) : Prop :=
  (
    ∀ (P R : MathGKM.Markov.BiPoly) (b r m : ℕ),
      m=b+r → SmoothingR32.Hom R r →
      (RightLayersR31.grade P).coeff m=RightR30.T^b*R →
      (∀ k, 0≤(SmoothingR32.spec R).coeff k) →
      (∀ i j k, i<j → j<k → 0<(SmoothingR32.spec R).coeff i → 0<(SmoothingR32.spec R).coeff k → 0<(SmoothingR32.spec R).coeff j) →
      (∀ k, (SmoothingR32.spec R).coeff k*(SmoothingR32.spec R).coeff (k+2)≤(SmoothingR32.spec R).coeff (k+1)^2) →
      (∀ i j, i+j=r → (SmoothingR32.spec R).coeff i=MathGKM.Markov.coeff R i j) ∧
      (∀ i j, i+j=m → ((1+Polynomial.X)^b*SmoothingR32.spec R).coeff i=MathGKM.Markov.coeff P i j) ∧
      (∀ i j, i+j+2=m → MathGKM.Markov.coeff P i (j+2)*MathGKM.Markov.coeff P (i+2) j≤MathGKM.Markov.coeff P (i+1) (j+1)^2)
  )
