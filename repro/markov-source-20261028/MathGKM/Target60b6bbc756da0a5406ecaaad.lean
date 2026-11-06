import MathGKM.Round52RowA
import MathGKM.Markov
def MathGKM.Target60b6bbc756da0a5406ecaaad.Interface :=
  (
    True
  )
def MathGKM.Target60b6bbc756da0a5406ecaaad.Transport (StudyInterface : MathGKM.Target60b6bbc756da0a5406ecaaad.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target60b6bbc756da0a5406ecaaad.Goal (StudyInterface : MathGKM.Target60b6bbc756da0a5406ecaaad.Interface) : Prop :=
  (
    RealConeR52.Cone (RealPolynomialR52.seq
        (Polynomial.X^2+Polynomial.X+1 : Polynomial ℝ)) ∧
      ¬RealConeR52.Cone (RealPolynomialR52.seq (Polynomial.X^2+1 : Polynomial ℝ)) ∧
      (Polynomial.X^2+1 : Polynomial ℝ).coeff 0*(Polynomial.X^2+1 : Polynomial ℝ).coeff 2 >
        (Polynomial.X^2+1 : Polynomial ℝ).coeff 1^2
  )
