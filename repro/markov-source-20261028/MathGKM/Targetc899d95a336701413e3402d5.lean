import MathGKM.Round94CompleteA
import MathGKM.Markov
def MathGKM.Targetc899d95a336701413e3402d5.Interface :=
  (
    True
  )
def MathGKM.Targetc899d95a336701413e3402d5.Transport (StudyInterface : MathGKM.Targetc899d95a336701413e3402d5.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetc899d95a336701413e3402d5.Goal (StudyInterface : MathGKM.Targetc899d95a336701413e3402d5.Interface) : Prop :=
  (
    ∀ n j i b : ℕ, 3≤n →
      0 ≤ (n : ℤ)*(BoundaryPolarisationR92.bulk (n-3) j (2*i+2) b (i+1)-BoundaryPolarisationR92.bulk (n-3) j (2*i+2) b i)+
        2*(BoundaryPolarisationR92.endpoint (n-3) j (2*i+2) b (i+1)-BoundaryPolarisationR92.endpoint (n-3) j (2*i+2) b i)
  )
