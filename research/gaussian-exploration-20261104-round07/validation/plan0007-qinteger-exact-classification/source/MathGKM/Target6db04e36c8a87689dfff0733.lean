import MathGKM.Plan0007QIntegerClassification
import MathGKM.GaussianQuotient
def MathGKM.Target6db04e36c8a87689dfff0733.Interface :=
  (
    True
  )
def MathGKM.Target6db04e36c8a87689dfff0733.Transport (StudyInterface : MathGKM.Target6db04e36c8a87689dfff0733.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target6db04e36c8a87689dfff0733.Goal (StudyInterface : MathGKM.Target6db04e36c8a87689dfff0733.Interface) : Prop :=
  (
    ∀ (a b : ℕ) (H : Polynomial ℚ), 0 < b → (∑ j ∈ Finset.range a, (Polynomial.X : Polynomial ℚ) ^ j) = (∑ j ∈ Finset.range b, (Polynomial.X : Polynomial ℚ) ^ j) * H → b ∣ a ∧ H = ∑ j ∈ Finset.range (a / b), (Polynomial.X : Polynomial ℚ) ^ (b * j)
  )
