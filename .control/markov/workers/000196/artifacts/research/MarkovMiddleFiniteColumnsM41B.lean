import MarkovMiddleLargeColumnM41B
/-! Machine-authored 41b38611. All middle starting columns at least thirty
are closed, including the last supported triple and the entire zero tail. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2 topShortSumMEB6

theorem middle_gap_lastM41B (x k c : ℕ) (r : Bool)
 (hT : x+3*k+middleBaseMD02 r=c+2) : 0 ≤ middleGapMD02 r c x k := by
 have hk : k < c+2 := by cases r <;> simp [middleBaseMD02] at hT <;> omega
 unfold middleGapMD02 middleRawMD02
 rw [correction_short_zeroMD02 _ k c r hk,
   correction_short_zeroMD02 _ k (c+1) r (by omega),
   correction_short_zeroMD02 _ k (c+2) r (by omega)]
 simp only [add_zero,hT,←top_mass_short_sumMEB6]
 exact sub_nonneg.mpr (top_mass_last_strictMEB6 x c).le

theorem middle_gap_high_allM41B (x k c : ℕ) (r : Bool) (hc : 27 ≤ c) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hT : c+3 ≤ x+3*k+middleBaseMD02 r
 · exact middle_gap_largeM41B x k c r hc hT
 by_cases he : x+3*k+middleBaseMD02 r=c+2
 · exact middle_gap_lastM41B x k c r he
 · unfold middleGapMD02
   rw [middle_support_zeroM9DB x k (c+2) r (by omega),mul_zero,sub_zero]
   exact sq_nonneg _

theorem source_middle_high_allM41B (x k c : ℕ) (r : Bool) (hc : 27 ≤ c) :
 let q := x+2*k+middleBaseMD02 r
 let j := sourceNME9C q r+2-(q+3+k)
 threeRawM9E2 q r (c+3) j*threeRawM9E2 q r (c+5) j ≤
 threeRawM9E2 q r (c+4) j^2 :=
 (middle_gap_sourceMD02 x k c r).mp (middle_gap_high_allM41B x k c r hc)

theorem path_middle_high_allM41B (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k c, 2*(q+3+k) ≤ sourceNME9C q r → 27 ≤ c →
 let j := sourceNME9C q r+2-(q+3+k)
 coeff (frame path).mid.p (c+3) j*coeff (frame path).mid.p (c+5) j ≤
 coeff (frame path).mid.p (c+4) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k c hn hc
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
 dsimp only
 simp only [hp]
 exact source_middle_high_allM41B x k c r hc

def MiddleFiniteColumnsM41B : Prop := ∀ r c x k,
 5 ≤ c → c < 27 → 3 ≤ k → c < middleConeBoundM6C0 k r →
 0 ≤ middleGapMD02 r c x k

theorem middle_after_third_iff_finite_columnsM41B :
 MiddleAfterThirdM9DB ↔ MiddleFiniteColumnsM41B := by
 constructor
 · intro h r c x k hc _ hk hb
   exact h r c x k hc hk hb
 · intro h r c x k hc hk hb
   by_cases hc' : c < 27
   · exact h r c x k hc hc' hk hb
   · exact middle_gap_high_allM41B x k c r (by omega)

theorem root_iff_finite_middle_columnsM41B :
 Conjecture63 ↔ MiddleFiniteColumnsM41B ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_after_thirdM9DB,middle_after_third_iff_finite_columnsM41B]

end
end MathGKM.Markov
