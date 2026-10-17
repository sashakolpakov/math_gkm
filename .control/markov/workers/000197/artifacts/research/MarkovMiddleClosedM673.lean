import MarkovTemplateFastC5M673
import MarkovTemplateFastC6M673
import MarkovTemplateFastC7M673
import MarkovTemplateFastC8M673
import MarkovTemplateFastC9M673
import MarkovTemplateFastC10M673
import MarkovTemplateFastC11M673
import MarkovTemplateFastC12M673
import MarkovTemplateFastC13M673
import MarkovTemplateFastC14M673
import MarkovTemplateFastC15M673
/-! Machine-authored 6738b4ea. Closure of the numerator-three middle
horizontal strip. Every other root obligation remains explicit. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2 middleTemplateMD02

theorem template_small_strongM673 (d T c : ℕ) (hc : 5 ≤ c) (hc' : c < 16)
 (hT : c+2 ≤ T) :
 ((c:ℤ)+5)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 ((c:ℤ)+4)*topMassM55C d T (c+1)^2 := by
 interval_cases c
 · exact template_fast_strong_5M673 d T hT
 · exact template_fast_strong_6M673 d T hT
 · exact template_fast_strong_7M673 d T hT
 · exact template_fast_strong_8M673 d T hT
 · exact template_fast_strong_9M673 d T hT
 · exact template_fast_strong_10M673 d T hT
 · exact template_fast_strong_11M673 d T hT
 · exact template_fast_strong_12M673 d T hT
 · exact template_fast_strong_13M673 d T hT
 · exact template_fast_strong_14M673 d T hT
 · exact template_fast_strong_15M673 d T hT

theorem middle_eleven_closedM673 : MiddleElevenColumnsM673 := by
 intro r c x k hc hc' hk hb
 by_cases hT : c+2 ≤ x+3*k+middleBaseMD02 r
 · apply middle_gap_of_template_strongM41B x k c r hc
   unfold middleTemplateMD02
   simp only [←top_mass_short_sumMEB6]
   exact template_small_strongM673 x (x+3*k+middleBaseMD02 r) c hc hc' hT
 · unfold middleGapMD02
   rw [middle_support_zeroM9DB x k (c+2) r (by omega),mul_zero,sub_zero]
   exact sq_nonneg _

theorem middle_short_closedM673 : MiddleShortLCMD02 :=
 middle_short_iff_after_thirdM9DB.mpr
   (middle_after_third_iff_elevenM673.mpr middle_eleven_closedM673)

theorem source_middle_allM673 (q k i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-(q+3+k))^2 :=
 middle_short_sourceMD02 middle_short_closedM673 q k i r hq hk hn

theorem path_middle_allM673 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k i, k ≤ q → 2*(q+3+k) ≤ sourceNME9C q r →
 let j := sourceNME9C q r+2-(q+3+k)
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k i hk hn
 dsimp only
 simp only [hp]
 exact source_middle_allM673 q k i r hq hk hn

theorem root_iff_outside_middleM673 :
 Conjecture63 ↔ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02]
 exact and_iff_right middle_short_closedM673
end
end MathGKM.Markov
