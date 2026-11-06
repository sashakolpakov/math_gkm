import MathGKM.Round44TransportA
import MathGKM.Markov
def MathGKM.Target2de98a2a3c1b0c1e1bebc12a.Interface :=
  (
    True
  )
def MathGKM.Target2de98a2a3c1b0c1e1bebc12a.Transport (StudyInterface : MathGKM.Target2de98a2a3c1b0c1e1bebc12a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2de98a2a3c1b0c1e1bebc12a.Goal (StudyInterface : MathGKM.Target2de98a2a3c1b0c1e1bebc12a.Interface) : Prop :=
  (
    ∀ (N : ℕ) (e : ℕ → ℤ), DistanceTwoR44.Capacity N e → 0 ≤ Finset.sum (Finset.range (N+1)) e
  )
