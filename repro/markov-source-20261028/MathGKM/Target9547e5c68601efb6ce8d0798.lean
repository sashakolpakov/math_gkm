import MathGKM.Round19ConvolutionA
import MathGKM.Markov
def MathGKM.Target9547e5c68601efb6ce8d0798.Interface :=
  (
    True
  )
def MathGKM.Target9547e5c68601efb6ce8d0798.Transport (StudyInterface : MathGKM.Target9547e5c68601efb6ce8d0798.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target9547e5c68601efb6ce8d0798.Goal (StudyInterface : MathGKM.Target9547e5c68601efb6ce8d0798.Interface) : Prop :=
  (
    ∀ P : Polynomial ℤ,
      (∀ k, 0≤P.coeff k) →
      (∀ i j k, i<j → j<k → 0<P.coeff i → 0<P.coeff k → 0<P.coeff j) →
      (∀ k, P.coeff k*P.coeff (k+2)≤P.coeff (k+1)^2) →
      ∀ n : ℕ,
        (∀ k, 0≤((1+Polynomial.X)^n*P).coeff k) ∧
        (∀ q : ℤ, ConvolutionR19.zcoeff ((1+Polynomial.X)^n*P) q*
          ConvolutionR19.zcoeff ((1+Polynomial.X)^n*P) (q+2)≤
          ConvolutionR19.zcoeff ((1+Polynomial.X)^n*P) (q+1)^2)
  )
