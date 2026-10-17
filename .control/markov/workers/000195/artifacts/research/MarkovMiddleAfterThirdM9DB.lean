import MarkovMiddleThirdAllM9DB
import MarkovFixedDepthGeneralM9DB
/-! Machine-authored 9db2326d. Exact residual after closing the third
middle horizontal row. The three root conjuncts below remain open. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def MiddleAfterThirdM9DB : Prop := ∀ r c x k,
 5 ≤ c → 3 ≤ k → c < middleConeBoundM6C0 k r → 0 ≤ middleGapMD02 r c x k

theorem middle_short_iff_after_thirdM9DB : MiddleShortLCMD02 ↔ MiddleAfterThirdM9DB := by
 constructor
 · intro h r c x k _ _ _; exact h r c x k
 · intro h r c x k
   by_cases hc : c ≤ 4
   · exact middle_gap_through_fourM6C0 x k c r hc
   by_cases hk : k ≤ 1
   · exact middle_gap_first_two_baseMF8D x k c r hk
   by_cases hk2 : k=2
   · subst k; exact middle_gap_two_allM9DB x c r
   by_cases hb : middleConeBoundM6C0 k r ≤ c
   · exact middle_gap_above_coneM6C0 c x k r hb
   · exact h r c x k (by omega) (by omega) (by omega)

theorem root_iff_after_thirdM9DB :
 Conjecture63 ↔ MiddleAfterThirdM9DB ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02,middle_short_iff_after_thirdM9DB]

theorem middle_after_third_of_signsM9DB (h : FixedDepthSignsM9DB) : MiddleAfterThirdM9DB := by
 intro r c x k hc hk hb
 exact fixed_one_transferM9DB k c r (h k c r hc hk hb) x

theorem root_of_fixed_signsM9DB (hs : FixedDepthSignsM9DB)
 (ht : ThreeOutsideMiddleMD02) (ho : OtherFourM9E2) : Conjecture63 := by
 exact root_iff_after_thirdM9DB.mpr ⟨middle_after_third_of_signsM9DB hs,ht,ho⟩

end
end MathGKM.Markov
