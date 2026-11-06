import MathGKM.Round92LinearTransportA
import MathGKM.Markov
def MathGKM.Targetf7fbf4722d234fc874ce000f.Interface :=
  (
    True
  )
def MathGKM.Targetf7fbf4722d234fc874ce000f.Transport (StudyInterface : MathGKM.Targetf7fbf4722d234fc874ce000f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf7fbf4722d234fc874ce000f.Goal (StudyInterface : MathGKM.Targetf7fbf4722d234fc874ce000f.Interface) : Prop :=
  (
    (∀ (L : ℕ) (f g : ℕ → ℤ) (a d : ℤ),
      0≤a → 0≤d →
      (∀ r, r≤L → f r=f (L-r)) →
      (∀ r, r≤L → g r=g (L-r)) →
      (∀ r, 2*r<L → f r≤f (r+1)) →
      (∀ r, 2*r<L → g r≤g (r+1)) →
      (∀ r, r≤L → a*f r+d*g r=a*f (L-r)+d*g (L-r)) ∧
      (∀ r, 2*r<L → a*f r+d*g r≤a*f (r+1)+d*g (r+1))) ∧
    (∀ (P Q : SparseColorR88.Three) (j L b r : ℕ), r≤L →
      BoundaryPolarisationR92.polar P Q j L b r =
        BoundaryPolarisationR92.polar P Q j L b (L-r)) ∧
    (∀ m j i b : ℕ,
      BoundaryPolarisationR92.bulk m j (2*i+2) b i ≤
        BoundaryPolarisationR92.bulk m j (2*i+2) b (i+1) →
      BoundaryPolarisationR92.endpoint m j (2*i+2) b i ≤
        BoundaryPolarisationR92.endpoint m j (2*i+2) b (i+1) →
      (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b i).card ≤
        (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b (i+1)).card)
  )
