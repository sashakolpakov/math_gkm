import MathGKM.TwoDenominatorPositiveR0001
import MathGKM.GaussianQuotient
def MathGKM.Target5b345df286a0870d64c4d671.Interface :=
  (
    True
  )
def MathGKM.Target5b345df286a0870d64c4d671.Transport (StudyInterface : MathGKM.Target5b345df286a0870d64c4d671.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5b345df286a0870d64c4d671.Goal (StudyInterface : MathGKM.Target5b345df286a0870d64c4d671.Interface) : Prop :=
  (
    ∀ a b : ℕ, (∃ H : Polynomial ℚ, MathGKM.GaussianQuotient.IntervalBridgeR0000.F a b 2 = MathGKM.GaussianQuotient.iota H) ↔ (((a+1) ∣ (b+1) ∨ (a+1) ∣ (b+2)) ∧ ((a+2) ∣ (b+1) ∨ (a+2) ∣ (b+2)))
  )
