import MarkovWeakAttachmentM673
/-! Machine-authored 6738b4ea. Every middle starting column at least
nineteen, including support endpoints and zero tails. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2 middleTemplateMD02

theorem template_weak_largeM673 (d T c : ℕ) (hc : 16 ≤ c) (hT : c+3 ≤ T) :
 (8*((c:ℤ)+4)+1)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 8*((c:ℤ)+4)*topMassM55C d T (c+1)^2 := by
 apply (weak_gap_iffM673 d T c).mpr
 have h := weak_drift_large_columnM673 d c (T-c) hc (by omega)
 simpa only [Nat.add_sub_of_le (by omega : c ≤ T)] using h

theorem middle_gap_largeM673 (x k c : ℕ) (r : Bool)
 (hc : 16 ≤ c) (hT : c+3 ≤ x+3*k+middleBaseMD02 r) :
 0 ≤ middleGapMD02 r c x k := by
 apply middle_gap_of_weakM673 x k c r (by omega)
 unfold middleTemplateMD02
 simp only [←top_mass_short_sumMEB6]
 exact template_weak_largeM673 x (x+3*k+middleBaseMD02 r) c hc hT

theorem middle_gap_high_allM673 (x k c : ℕ) (r : Bool) (hc : 16 ≤ c) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hT : c+3 ≤ x+3*k+middleBaseMD02 r
 · exact middle_gap_largeM673 x k c r hc hT
 by_cases he : x+3*k+middleBaseMD02 r=c+2
 · exact middle_gap_lastM41B x k c r he
 · unfold middleGapMD02
   rw [middle_support_zeroM9DB x k (c+2) r (by omega),mul_zero,sub_zero]
   exact sq_nonneg _

theorem source_middle_high_allM673 (x k c : ℕ) (r : Bool) (hc : 16 ≤ c) :
 let q := x+2*k+middleBaseMD02 r
 let j := sourceNME9C q r+2-(q+3+k)
 threeRawM9E2 q r (c+3) j*threeRawM9E2 q r (c+5) j ≤
 threeRawM9E2 q r (c+4) j^2 :=
 (middle_gap_sourceMD02 x k c r).mp (middle_gap_high_allM673 x k c r hc)

theorem source_middle_polygonM673 (x k c : ℕ) (r : Bool)
 (hc : 16 ≤ c) (hT : c+2 ≤ x+3*k+middleBaseMD02 r) :
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
 exact source_middle_high_allM673 x k c r hc

theorem path_middle_high_allM673 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k c, 2*(q+3+k) ≤ sourceNME9C q r → 16 ≤ c →
 let j := sourceNME9C q r+2-(q+3+k)
 coeff (frame path).mid.p (c+3) j*coeff (frame path).mid.p (c+5) j ≤
 coeff (frame path).mid.p (c+4) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k c hn hc
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
 dsimp only
 simp only [hp]
 exact source_middle_high_allM673 x k c r hc

def MiddleElevenColumnsM673 : Prop := ∀ r c x k,
 5 ≤ c → c < 16 → 3 ≤ k → c < middleConeBoundM6C0 k r →
 0 ≤ middleGapMD02 r c x k

theorem middle_after_third_iff_elevenM673 :
 MiddleAfterThirdM9DB ↔ MiddleElevenColumnsM673 := by
 constructor
 · intro h r c x k hc _ hk hb
   exact h r c x k hc hk hb
 · intro h r c x k hc hk hb
   by_cases hc' : c < 16
   · exact h r c x k hc hc' hk hb
   · exact middle_gap_high_allM673 x k c r (by omega)

theorem root_iff_eleven_middle_columnsM673 :
 Conjecture63 ↔ MiddleElevenColumnsM673 ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_after_thirdM9DB,middle_after_third_iff_elevenM673]
end
end MathGKM.Markov
