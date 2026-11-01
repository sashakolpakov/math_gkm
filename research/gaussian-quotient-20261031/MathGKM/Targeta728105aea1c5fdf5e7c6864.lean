import MathGKM.GapOneR0002
import MathGKM.GaussianQuotient
def MathGKM.Targeta728105aea1c5fdf5e7c6864.Interface :=
  (
    True
  )
def MathGKM.Targeta728105aea1c5fdf5e7c6864.Transport (StudyInterface : MathGKM.Targeta728105aea1c5fdf5e7c6864.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta728105aea1c5fdf5e7c6864.Goal (StudyInterface : MathGKM.Targeta728105aea1c5fdf5e7c6864.Interface) : Prop :=
  (
    (∀ (a b : ℕ) (H : Polynomial ℚ), MathGKM.GaussianQuotient.IntervalBridgeR0000.F a b 1 = MathGKM.GaussianQuotient.iota H → ∃ p : Polynomial ℕ, H = p.map (Nat.castRingHom ℚ)) ∧ (∀ (n k l : ℕ) (H : Polynomial ℚ), l ≤ k → k ≤ n → k-l=1 → MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → MathGKM.GaussianQuotient.NatCoeffs H)
  )
