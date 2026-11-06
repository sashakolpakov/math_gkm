import MathGKM.Round40SubmissionA
import MathGKM.Markov
def MathGKM.Targetc65d137a45de47a2ad178a03.Interface :=
  (
    True
  )
def MathGKM.Targetc65d137a45de47a2ad178a03.Transport (StudyInterface : MathGKM.Targetc65d137a45de47a2ad178a03.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetc65d137a45de47a2ad178a03.Goal (StudyInterface : MathGKM.Targetc65d137a45de47a2ad178a03.Interface) : Prop :=
  (
    (GroupedR40.Defect (1 : Polynomial ℤ) (1+Polynomial.X) (2*Polynomial.X) = 1+Polynomial.X^2 ∧
        GroupedR40.Nonnegative (GroupedR40.Defect (1 : Polynomial ℤ) (1+Polynomial.X) (2*Polynomial.X)) ∧
        (1 : Polynomial ℤ).coeff 0*(2*Polynomial.X : Polynomial ℤ).coeff 1 >
          (1+Polynomial.X : Polynomial ℤ).coeff ((0+1)/2)*
            (1+Polynomial.X : Polynomial ℤ).coeff ((0+1+1)/2)) ∧ (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1 = -1+2*Polynomial.X+Polynomial.X^2 ∧
        (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1).coeff 0 = -1 ∧
        (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1).eval 1 = 2 ∧
        ¬ GroupedR40.Nonnegative (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1))
  )
