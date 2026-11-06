import MathGKM.Round92SeparatorA
import MathGKM.Markov
def MathGKM.Target33dcf094ff62315c18f4eef1.Interface :=
  (
    True
  )
def MathGKM.Target33dcf094ff62315c18f4eef1.Transport (StudyInterface : MathGKM.Target33dcf094ff62315c18f4eef1.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target33dcf094ff62315c18f4eef1.Goal (StudyInterface : MathGKM.Target33dcf094ff62315c18f4eef1.Interface) : Prop :=
  (
    (∀ r : ℕ,
      BoundaryPolarisationR92.bulk 0 1 8 1 r = (if r=4 then 16 else 0) ∧
      BoundaryPolarisationR92.endpoint 0 1 8 1 r =
        (if r=3 then 6 else if r=5 then 6 else 0)) ∧
    (∀ r : ℕ, (PairConvolutionR78.P 6 0 1 8 1 1 r).card =
      if r=3 then 12 else if r=4 then 48 else if r=5 then 12 else 0) ∧
    (2*(3:ℕ)<8 ∧ 8=2*(3:ℕ)+2 ∧
      BoundaryPolarisationR92.endpoint 0 1 8 1 4 < BoundaryPolarisationR92.endpoint 0 1 8 1 3) ∧
    ((PairConvolutionR78.P 6 0 1 8 1 1 3).card <
      (PairConvolutionR78.P 6 0 1 8 1 1 4).card) ∧
    (((PairConvolutionR78.P 6 0 1 8 1 1 4).card : ℤ)-
      ((PairConvolutionR78.P 6 0 1 8 1 1 3).card : ℤ)=36) ∧
    ¬(∀ m j L b r : ℕ, 2*r<L →
      BoundaryPolarisationR92.endpoint m j L b r ≤ BoundaryPolarisationR92.endpoint m j L b (r+1))
  )
