import MathGKM.MarkovHomogeneous
import MathGKM.Markov
def MathGKM.Target79a428e033d36adf5fa527fb.Interface :=
  (
    True
  )
def MathGKM.Target79a428e033d36adf5fa527fb.Transport (StudyInterface : MathGKM.Target79a428e033d36adf5fa527fb.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target79a428e033d36adf5fa527fb.Goal (StudyInterface : MathGKM.Target79a428e033d36adf5fa527fb.Interface) : Prop :=
  (
    ∀ (P : MathGKM.Markov.BiPoly) (d : ℕ), (∀ i j, d < i+j → MathGKM.Markov.coeff P i j = 0) → MathGKM.Markov.TriHomogeneous (MathGKM.Markov.homogeneousLift P d) d ∧ MathGKM.Markov.dehomogenize (MathGKM.Markov.homogeneousLift P d) = P ∧ (∀ k i j, MathGKM.Markov.triCoeff (MathGKM.Markov.homogeneousLift P d) k i j = if k+i+j = d then MathGKM.Markov.coeff P i j else 0) ∧ (∀ i j, MathGKM.Markov.triCoeff (MathGKM.Markov.homogeneousLift P d) (d-i-j) i j = MathGKM.Markov.coeff P i j) ∧ (∀ F : MathGKM.Markov.TriPoly, MathGKM.Markov.TriHomogeneous F d → MathGKM.Markov.dehomogenize F = P → F = MathGKM.Markov.homogeneousLift P d)
  )
