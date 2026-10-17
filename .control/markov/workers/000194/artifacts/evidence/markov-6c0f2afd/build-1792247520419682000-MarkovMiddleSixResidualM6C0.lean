import MarkovMiddleDenseC6M6C0
import MarkovMiddleFiveResidualMF8D
/-! Machine-authored 6c0f2afd. Exact source transport of the sixth-column
total gap and a bounded-column-per-depth residual; the full root stays open. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem source_middle_sixM6C0 (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 6 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 8 (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r 7 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
 exact (middle_gap_sourceMD02 x k 3 r).mp (middle_gap_3_nonnegM6C0 x k r)

theorem source_middle_six_pathM6C0 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k, k ≤ q → 2*(q+3+k) ≤ sourceNME9C q r →
 coeff (frame path).mid.p 6 (sourceNME9C q r+2-(q+3+k))*
 coeff (frame path).mid.p 8 (sourceNME9C q r+2-(q+3+k)) ≤
 coeff (frame path).mid.p 7 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k hk hn
 simp only [hp]
 exact source_middle_sixM6C0 q k r hq hk hn

theorem source_middle_six_polygonM6C0 (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hs : 8 ≤ q+3+k) :
 InPolygon 3 (sourceNME9C q r) 6 (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) 7 (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) 8 (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r 6 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 8 (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r 7 (sourceNME9C q r+2-(q+3+k))^2 := by
 exact ⟨middle_polygonM99A q k 6 r hq hk (by omega) (by omega),
   middle_polygonM99A q k 7 r hq hk (by omega) (by omega),
   middle_polygonM99A q k 8 r hq hk (by omega) hs,source_middle_sixM6C0 q k r hq hk hn⟩

def middleConeBoundM6C0 (k : ℕ) (r : Bool) : ℕ := 4*k+(if r then 9 else 7)

theorem middle_gap_above_coneM6C0 (c x k : ℕ) (r : Bool)
 (hc : middleConeBoundM6C0 k r ≤ c) : 0 ≤ middleGapMD02 r c x k := by
 rw [middle_gap_sourceMD02]
 obtain ⟨hq,hk,hn⟩ := middle_parameter_domainMD02 x k r
 have hc6 : 6 ≤ c := by cases r <;> simp [middleConeBoundM6C0] at hc <;> omega
 have hlocal : k+1 < c+3 := by cases r <;> simp [middleConeBoundM6C0] at hc <;> omega
 apply source_middle_wideM99A _ _ _ r hq hk hn (by omega) hlocal
 cases r <;> simp [sourceNME9C,middleBaseMD02,middleConeBoundM6C0] at hc ⊢ <;> omega

def MiddleConeM6C0 : Prop := ∀ r c x k,
 4 ≤ c → 2 ≤ k → c < middleConeBoundM6C0 k r → 0 ≤ middleGapMD02 r c x k

theorem middle_short_iff_coneM6C0 : MiddleShortLCMD02 ↔ MiddleConeM6C0 := by
 constructor
 · intro h r c x k _ _ _; exact h r c x k
 · intro h r c x k
   by_cases hc : c ≤ 2
   · exact middle_gap_first_threeMF8D x k c r hc
   by_cases hc3 : c=3
   · subst c; exact middle_gap_3_nonnegM6C0 x k r
   by_cases hk : k ≤ 1
   · exact middle_gap_first_two_baseMF8D x k c r hk
   by_cases hb : middleConeBoundM6C0 k r ≤ c
   · exact middle_gap_above_coneM6C0 c x k r hb
   · exact h r c x k (by omega) (by omega) (by omega)

theorem root_iff_middle_coneM6C0 :
 Conjecture63 ↔ MiddleConeM6C0 ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02,middle_short_iff_coneM6C0]

end
end MathGKM.Markov
