import MarkovCenteredAttachmentME87
import MarkovMiddleSixColumnsM673
/-! Machine-authored e8743310. Close the complete numerator-three middle
horizontal strip. Other directions and source families remain explicit. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2 middleTemplateMD02

theorem middle_six_closedME87 : MiddleSixColumnsM673 := by
 intro r c x k hc _ _ _
 exact middle_gap_centeredME87 x k c r hc

theorem middle_short_closedME87 : MiddleShortLCMD02 :=
 middle_short_iff_after_thirdM9DB.mpr
   (middle_after_third_iff_elevenM673.mpr
     (middle_eleven_iff_sixM673.mpr middle_six_closedME87))

theorem source_middle_allME87 (q k i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-(q+3+k))^2 :=
 middle_short_sourceMD02 middle_short_closedME87 q k i r hq hk hn

theorem path_middle_allME87 (path : List Bool) (ha : (frame path).mid.a=3) :
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
 exact source_middle_allME87 q k i r hq hk hn

theorem source_middle_polygonME87 (q k i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r)
 (hi : 3 ≤ i) (hi' : i+2 ≤ q+3+k) :
 let j := sourceNME9C q r+2-(q+3+k)
 InPolygon 3 (sourceNME9C q r) i j ∧
 InPolygon 3 (sourceNME9C q r) (i+1) j ∧
 InPolygon 3 (sourceNME9C q r) (i+2) j ∧
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) j^2 := by
 dsimp only
 refine ⟨middle_polygonM99A q k i r hq hk hi (by omega),
   middle_polygonM99A q k (i+1) r hq hk (by omega) (by omega),
   middle_polygonM99A q k (i+2) r hq hk (by omega) hi',?_⟩
 exact source_middle_allME87 q k i r hq hk hn

theorem root_iff_outside_middleME87 :
 Conjecture63 ↔ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02]
 exact and_iff_right middle_short_closedME87
end
end MathGKM.Markov
