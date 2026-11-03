import MathGKM.TwoFactorBlocks
import MathGKM.GaussianQuotient
def MathGKM.Target464ed43026cafde021b56be2.Interface :=
  (
    True
  )
def MathGKM.Target464ed43026cafde021b56be2.Transport (StudyInterface : MathGKM.Target464ed43026cafde021b56be2.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target464ed43026cafde021b56be2.Goal (StudyInterface : MathGKM.Target464ed43026cafde021b56be2.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), l ≤ k → k ≤ n → ∀ (c : MathGKM.GaussianQuotient.Blocks.PositiveBlockCover n k l), MathGKM.GaussianQuotient.NatCoeffs (MathGKM.GaussianQuotient.Blocks.blockProduct c) ∧ MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota (MathGKM.GaussianQuotient.Blocks.blockProduct c) ∧ ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H = MathGKM.GaussianQuotient.Blocks.blockProduct c ∧ MathGKM.GaussianQuotient.NatCoeffs H
  )
