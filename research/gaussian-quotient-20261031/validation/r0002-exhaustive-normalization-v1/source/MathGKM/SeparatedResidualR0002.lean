import MathGKM.NormalizationR0002
import MathGKM.GapOneR0002
import MathGKM.Accepted4dd5c4447dab4758ed8897bd

noncomputable section
namespace MathGKM.GaussianQuotient.SeparatedResidualR0002
open Polynomial IntervalBridgeR0000 NormalizationR0002

/-- The remaining separated interval positivity problem, with arbitrary rational H. -/
def HigherSeparatedPositivity : Prop :=
  ∀ a b r : ℕ, ∀ H : Polynomial ℚ,
    a+r ≤ b → 3 ≤ r → F a b r = iota H → NatCoeffs H

theorem zero_gap (a b : ℕ) (H : Polynomial ℚ)
    (hsep : a ≤ b) (he : F a b 0 = iota H) : NatCoeffs H := by
  have hp := Accepted8d6330b3708d310a4b883202.obligation.2 a b 0 (by omega)
  have hd := B_ne_zero (a+b+0) a (by omega)
  have hq : B (a+b+0) (a+0) / B (a+b+0) a = iota H := hp.2.2.2.trans he
  have hb : B (a+b+0) (a+0) = B (a+b+0) a * iota H := by
    simpa [mul_comm] using (div_eq_iff hd).mp hq
  exact Accepted30cb1ba43f22bb0566e20763.obligation (a+b+0) (a+0) a H hd hb
    (Or.inr (Or.inl (by omega)))

theorem separated_iff_higher : SeparatedPositivity ↔ HigherSeparatedPositivity := by
  constructor
  · intro h a b r H hs _ he
    exact h a b r H hs he
  · intro h a b r H hs he
    by_cases h0 : r=0
    · subst r
      exact zero_gap a b H (by omega) he
    by_cases h1 : r=1
    · subst r
      exact GapOneR0002.universal_positivity a b H he
    by_cases h2 : r=2
    · subst r
      obtain ⟨p, rfl⟩ := Accepted4dd5c4447dab4758ed8897bd.obligation.1 a b H he
      exact TwoDenominatorPositiveR0001.natCoeffs_map p
    exact h a b r H hs (by omega) he

theorem full_iff_higher : FullPositivity ↔ HigherSeparatedPositivity :=
  full_iff_separated.trans separated_iff_higher

theorem root_reduction : HigherSeparatedPositivity → FullPositivity :=
  full_iff_higher.mpr

end MathGKM.GaussianQuotient.SeparatedResidualR0002
