import MarkovTemplateC5M673
import MarkovTemplateC6M673
import MarkovTemplateC7M673
import MarkovTemplateC8M673
import MarkovTemplateC9M673
/-! Machine-authored 6738b4ea. Independently usable residual after the
accepted fixed columns; no dependence on later pending certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] middleTemplateMD02
theorem middle_gap_small_fiveM673 (x k c : ℕ) (r : Bool) (hc : 5 ≤ c) (hc' : c ≤ 9) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hT : c+2 ≤ x+3*k+middleBaseMD02 r
 · apply middle_gap_of_template_strongM41B x k c r hc
   unfold middleTemplateMD02
   simp only [←top_mass_short_sumMEB6]
   interval_cases c
   · exact template_strong_5M673 _ _ hT
   · exact template_strong_6M673 _ _ hT
   · exact template_strong_7M673 _ _ hT
   · exact template_strong_8M673 _ _ hT
   · exact template_strong_9M673 _ _ hT
 · unfold middleGapMD02
   rw [middle_support_zeroM9DB x k (c+2) r (by omega),mul_zero,sub_zero]
   exact sq_nonneg _

def MiddleSixColumnsM673 : Prop := ∀ r c x k,
 10 ≤ c → c < 16 → 3 ≤ k → c < middleConeBoundM6C0 k r →
 0 ≤ middleGapMD02 r c x k

theorem middle_eleven_iff_sixM673 : MiddleElevenColumnsM673 ↔ MiddleSixColumnsM673 := by
 constructor
 · intro h r c x k hc hc' hk hb
   exact h r c x k (by omega) hc' hk hb
 · intro h r c x k hc hc' hk hb
   by_cases hl : c ≤ 9
   · exact middle_gap_small_fiveM673 x k c r hc hl
   · exact h r c x k (by omega) hc' hk hb

theorem root_iff_six_middle_columnsM673 :
 Conjecture63 ↔ MiddleSixColumnsM673 ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_eleven_middle_columnsM673,middle_eleven_iff_sixM673]
end
end MathGKM.Markov
