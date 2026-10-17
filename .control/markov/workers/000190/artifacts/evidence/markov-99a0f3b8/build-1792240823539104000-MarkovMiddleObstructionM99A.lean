import MarkovTopIntegerResidualM731
import MarkovTopThirdGapMEB6
/-! Machine-authored 99a0f3b8. A false auxiliary unrestricted-group shortcut.
This is not a source-family refutation of Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

theorem middle_group_obstruction_valueM99A :
 betaIntegerGroupM731 0 0 20 2 = -238694400 := by
 norm_num [betaIntegerGroupM731,betaIntegerDensityM731,betaIntegerCutM731,
   betaScalarMCA9,sum_range_succ,Nat.choose]

theorem middle_unrestricted_groups_falseM99A :
 ¬(∀ d i r m : ℕ, 2 ≤ m → m ≤ 2*r → 0 ≤ betaGroupMCA9 d i r m) := by
 intro h
 have hh := (beta_integer_group_nonneg_iffM731 0 0 20 2).mpr (h 0 0 20 2 (by omega) (by omega))
 rw [middle_group_obstruction_valueM99A] at hh
 norm_num at hh

theorem middle_obstruction_total_positiveM99A :
 topMassM55C 0 20 0*topMassM55C 0 20 2 < topMassM55C 0 20 1^2 :=
 top_mass_first_strictMEB6 0 20 (by omega)

end
end MathGKM.Markov
