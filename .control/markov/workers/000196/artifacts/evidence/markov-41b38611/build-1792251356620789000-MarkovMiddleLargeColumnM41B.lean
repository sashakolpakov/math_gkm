import MarkovDeficitAttachmentM41B
import MarkovMiddleRelativeSourceM41B
/-! Machine-authored 41b38611. Uniform large-column middle inequalities and
an exact root residual. All other families and directions remain explicit. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2 middleTemplateMD02

theorem template_strong_largeM41B (d T c : ℕ) (hc : 27 ≤ c) (hT : c+3 ≤ T) :
 ((c:ℤ)+5)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 ((c:ℤ)+4)*topMassM55C d T (c+1)^2 := by
 apply (template_strong_iff_momentM41B d T c).mpr
 have h := strong_drift_large_columnM41B d c (T-c) hc (by omega)
 simpa only [Nat.add_sub_of_le (by omega : c ≤ T)] using h

theorem middle_gap_largeM41B (x k c : ℕ) (r : Bool)
 (hc : 27 ≤ c) (hT : c+3 ≤ x+3*k+middleBaseMD02 r) :
 0 ≤ middleGapMD02 r c x k := by
 apply middle_gap_of_template_strongM41B x k c r (by omega)
 unfold middleTemplateMD02
 simp only [←top_mass_short_sumMEB6]
 exact template_strong_largeM41B x (x+3*k+middleBaseMD02 r) c hc hT

theorem source_middle_largeM41B (x k c : ℕ) (r : Bool)
 (hc : 27 ≤ c) (hT : c+3 ≤ x+3*k+middleBaseMD02 r) :
 let q := x+2*k+middleBaseMD02 r
 let j := sourceNME9C q r+2-(q+3+k)
 InPolygon 3 (sourceNME9C q r) (c+3) j ∧
 InPolygon 3 (sourceNME9C q r) (c+4) j ∧
 InPolygon 3 (sourceNME9C q r) (c+5) j ∧
 threeRawM9E2 q r (c+3) j*threeRawM9E2 q r (c+5) j ≤
 threeRawM9E2 q r (c+4) j^2 := by
 dsimp only
 obtain ⟨hq,hk,hn⟩ := middle_parameter_domainMD02 x k r
 refine ⟨middle_polygonM99A _ _ _ r hq hk (by omega) (by omega),
   middle_polygonM99A _ _ _ r hq hk (by omega) (by omega),
   middle_polygonM99A _ _ _ r hq hk (by omega) (by omega),?_⟩
 exact (middle_gap_sourceMD02 x k c r).mp (middle_gap_largeM41B x k c r hc hT)

theorem path_middle_largeM41B (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ x k c, q=x+2*k+middleBaseMD02 r → 27 ≤ c →
 c+3 ≤ x+3*k+middleBaseMD02 r →
 let j := sourceNME9C q r+2-(q+3+k)
 coeff (frame path).mid.p (c+3) j*coeff (frame path).mid.p (c+5) j ≤
 coeff (frame path).mid.p (c+4) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro x k c hq' hc hT
 subst q
 dsimp only
 simp only [hp]
 exact (source_middle_largeM41B x k c r hc hT).2.2.2

def MiddleAfterLargeM41B : Prop := ∀ r c x k,
 5 ≤ c → 3 ≤ k → c < middleConeBoundM6C0 k r →
 (c < 27 ∨ x+3*k+middleBaseMD02 r=c+2) → 0 ≤ middleGapMD02 r c x k

theorem middle_after_third_iff_largeM41B : MiddleAfterThirdM9DB ↔ MiddleAfterLargeM41B := by
 constructor
 · intro h r c x k hc hk hb _
   exact h r c x k hc hk hb
 · intro h r c x k hc hk hb
   by_cases hc' : c < 27
   · exact h r c x k hc hk hb (Or.inl hc')
   by_cases hT : c+3 ≤ x+3*k+middleBaseMD02 r
   · exact middle_gap_largeM41B x k c r (by omega) hT
   by_cases he : x+3*k+middleBaseMD02 r=c+2
   · exact h r c x k hc hk hb (Or.inr he)
   · unfold middleGapMD02
     rw [middle_support_zeroM9DB x k (c+2) r (by omega),mul_zero,sub_zero]
     exact sq_nonneg _

theorem root_iff_after_largeM41B :
 Conjecture63 ↔ MiddleAfterLargeM41B ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_after_thirdM9DB,middle_after_third_iff_largeM41B]

end
end MathGKM.Markov
