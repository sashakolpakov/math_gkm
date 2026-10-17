import MarkovMiddleSixResidualM6C0
import MarkovMiddleCachedC7M6C0
import MarkovMiddleThirdPartialM6C0
/-! Machine-authored 6c0f2afd. Exact final remaining root. No unaccepted
larger-column certificate is imported. All three conjuncts remain open. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem middle_gap_through_fourM6C0 (x k c : ℕ) (r : Bool) (hc : c ≤ 4) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hc2 : c ≤ 2
 · exact middle_gap_first_threeMF8D x k c r hc2
 interval_cases c
 · exact middle_gap_3_nonnegM6C0 x k r
 · exact middle_cached_4_nonnegM6C0 x k r

theorem source_middle_columnsM6C0 (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 6 ≤ c) (hc7 : c ≤ 7) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
 have h := (middle_gap_sourceMD02 x k (c-3) r).mp
   (middle_gap_through_fourM6C0 x k (c-3) r (by omega))
 simpa only [show c-3+3=c by omega,show c-3+5=c+2 by omega,
   show c-3+4=c+1 by omega] using h

theorem source_middle_columns_pathM6C0 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k c, k ≤ q → 2*(q+3+k) ≤ sourceNME9C q r → 6 ≤ c → c ≤ 7 →
 coeff (frame path).mid.p c (sourceNME9C q r+2-(q+3+k))*
 coeff (frame path).mid.p (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 coeff (frame path).mid.p (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k c hk hn hc hc7
 simp only [hp]
 exact source_middle_columnsM6C0 q k c r hq hk hn hc hc7

theorem source_middle_columns_polygonM6C0 (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r)
 (hc : 6 ≤ c) (hc7 : c ≤ 7) (hs : c+2 ≤ q+3+k) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 exact ⟨middle_polygonM99A q k c r hq hk (by omega) (by omega),
   middle_polygonM99A q k (c+1) r hq hk (by omega) (by omega),
   middle_polygonM99A q k (c+2) r hq hk (by omega) hs,
   source_middle_columnsM6C0 q k c r hq hk hn hc hc7⟩

def MiddleRemainingM6C0 : Prop := ∀ r c x k,
 5 ≤ c → 2 ≤ k → c < middleConeBoundM6C0 k r → (k=2 → 10 ≤ c) →
 0 ≤ middleGapMD02 r c x k

theorem middle_short_iff_remainingM6C0 : MiddleShortLCMD02 ↔ MiddleRemainingM6C0 := by
 constructor
 · intro h r c x k _ _ _ _; exact h r c x k
 · intro h r c x k
   by_cases hc : c ≤ 4
   · exact middle_gap_through_fourM6C0 x k c r hc
   by_cases hk : k ≤ 1
   · exact middle_gap_first_two_baseMF8D x k c r hk
   by_cases hb : middleConeBoundM6C0 k r ≤ c
   · exact middle_gap_above_coneM6C0 c x k r hb
   by_cases htwo : k=2 ∧ c ≤ 9
   · obtain ⟨rfl,hc9⟩ := htwo
     exact middle_gap_two_nineM6C0 x c r hc9
   · exact h r c x k (by omega) (by omega) (by omega) (by omega)

theorem root_iff_remainingM6C0 :
 Conjecture63 ↔ MiddleRemainingM6C0 ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02,middle_short_iff_remainingM6C0]

end
end MathGKM.Markov
