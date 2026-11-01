import MathGKM.TwoDenominatorPositiveR0001
import MathGKM.GaussianQuotient
def MathGKM.Targetf5aee8fbdefb5ce1d090f227.Interface :=
  (
    True
  )
def MathGKM.Targetf5aee8fbdefb5ce1d090f227.Transport (StudyInterface : MathGKM.Targetf5aee8fbdefb5ce1d090f227.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf5aee8fbdefb5ce1d090f227.Goal (StudyInterface : MathGKM.Targetf5aee8fbdefb5ce1d090f227.Interface) : Prop :=
  (
    (∀ (a b : ℕ) (H : Polynomial ℚ), MathGKM.GaussianQuotient.IntervalBridgeR0000.F a b 2 = MathGKM.GaussianQuotient.iota H → ∃ p : Polynomial ℕ, H = p.map (Nat.castRingHom ℚ)) ∧ (∀ (n k l : ℕ) (H : Polynomial ℚ), l ≤ k → k ≤ n → k-l=2 → MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → MathGKM.GaussianQuotient.NatCoeffs H)
  )
