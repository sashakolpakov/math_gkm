import MathGKM.Round84ReciprocalA
import MathGKM.Markov
def MathGKM.Targetb23cd32ff8757a882b3502b2.Interface :=
  (
    True
  )
def MathGKM.Targetb23cd32ff8757a882b3502b2.Transport (StudyInterface : MathGKM.Targetb23cd32ff8757a882b3502b2.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb23cd32ff8757a882b3502b2.Goal (StudyInterface : MathGKM.Targetb23cd32ff8757a882b3502b2.Interface) : Prop :=
  (
    ∀ (P : Polynomial ℝ) (L : ℕ), ReciprocalR84.Factors P L →
        (∀ r, r≤L → P.coeff r=P.coeff (L-r)) ∧
        (∀ r, 0≤P.coeff r) ∧
        (∀ i j k, i<j → j<k → 0<P.coeff i → 0<P.coeff k → 0<P.coeff j) ∧
        (∀ r, P.coeff r*P.coeff (r+2)≤P.coeff (r+1)^2) ∧
        (∀ r, 2*r<L → P.coeff r≤P.coeff (r+1)) ∧
        (∀ r, L<r → P.coeff r=0)
  )
