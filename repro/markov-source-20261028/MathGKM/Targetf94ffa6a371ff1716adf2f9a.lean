import MathGKM.Round92PolarisationA
import MathGKM.Markov
def MathGKM.Targetf94ffa6a371ff1716adf2f9a.Interface :=
  (
    True
  )
def MathGKM.Targetf94ffa6a371ff1716adf2f9a.Transport (StudyInterface : MathGKM.Targetf94ffa6a371ff1716adf2f9a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf94ffa6a371ff1716adf2f9a.Goal (StudyInterface : MathGKM.Targetf94ffa6a371ff1716adf2f9a.Interface) : Prop :=
  (
    (∀ m r j a : ℕ,
      BoundaryPolarisationR92.c (BoundaryPolarisationR92.P m) r j a =
        SparseRankR89.count 2 (m+2) r j a) ∧
    (∀ m r j a : ℕ,
      BoundaryPolarisationR92.c (BoundaryPolarisationR92.Qbulk m) r j a =
        SparseCoupledR90.shifted 4 m r j a) ∧
    (∀ m r j a : ℕ,
      BoundaryPolarisationR92.c (BoundaryPolarisationR92.Qend m) r j a =
        SparseCoupledR90.punctured 2 m r j a) ∧
    (∀ m j L b r : ℕ,
      (FullFiberRankR80.rankPoly (2*(m+3)) 0 j L 1 b).coeff r =
        (m+3 : ℤ)*BoundaryPolarisationR92.bulk m j L b r +
          2*BoundaryPolarisationR92.endpoint m j L b r) ∧
    (∀ m j L b r : ℕ,
      ((PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card : ℤ) =
        (m+3 : ℤ)*BoundaryPolarisationR92.bulk m j L b r +
          2*BoundaryPolarisationR92.endpoint m j L b r)
  )
