import MarkovCorrectionTailM418
import MarkovCorrectionGapsM418
import MarkovSmallHorizontalMAE9
/-! Machine-authored 418bcc64. Universal source strips and exact remaining
first-correction window. All natural columns, zero tails and q=1 retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem source_correction_prefixM418 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : i ≤ 6) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
   threeRawM9E2 q r (i+1) (q+1)^2 := by
 by_cases hq1 : q=1
 · subst q
   exact three_small_horizontalMAE9 1 i 2 r (by omega) (by omega)
 by_cases hi1 : i ≤ 1
 · rw [source_first_small_zeroM1BB q i r hq hi1,zero_mul]
   exact sq_nonneg _
 have he : q=(q-2)+2 := by omega
 rw [he,show q-2+2+1=q-2+3 by omega]
 interval_cases i
 · exact source_correction_horizontal2M418 (q-2) r
 · exact source_correction_horizontal3M418 (q-2) r
 · exact source_correction_horizontal4M418 (q-2) r
 · exact source_correction_horizontal5M418 (q-2) r
 · exact source_correction_horizontal6M418 (q-2) r

theorem source_correction_outside_windowM418 (q i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : i ≤ 6 ∨ correctionExponentMDB2 q r+2 < i) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
   threeRawM9E2 q r (i+1) (q+1)^2 := by
 by_cases hq1 : q=1
 · subst q
   exact three_small_horizontalMAE9 1 i 2 r (by omega) (by omega)
 rcases hi with hi|hi
 · exact source_correction_prefixM418 q i r hq hi
 · have he : i=(i-3)+3 := by omega
   rw [he]
   convert source_correction_tailM418 q (i-3) r (by omega) (by omega) using 1 <;>
     congr 2 <;> omega

def FirstCorrectionWindowM418 : Prop := ∀ q : ℕ, 2 ≤ q → ∀ r i,
 7 ≤ i → i ≤ correctionExponentMDB2 q r+2 →
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
   threeRawM9E2 q r (i+1) (q+1)^2

theorem first_correction_all_iff_windowM418 :
 (∀ q : ℕ, 1 ≤ q → ∀ r i,
   threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
     threeRawM9E2 q r (i+1) (q+1)^2) ↔ FirstCorrectionWindowM418 := by
 constructor
 · intro H q hq r i _ _
   exact H q (by omega) r i
 · intro H q hq r i
   by_cases hq1 : q=1
   · subst q
     exact three_small_horizontalMAE9 1 i 2 r (by omega) (by omega)
   by_cases hi : i ≤ 6 ∨ correctionExponentMDB2 q r+2 < i
   · exact source_correction_outside_windowM418 q i r hq hi
   · exact H q (by omega) r i (by omega) (by omega)

theorem source_correction_small_parametersM418 (q i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hq5 : q ≤ 5) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
   threeRawM9E2 q r (i+1) (q+1)^2 := by
 apply source_correction_outside_windowM418 q i r hq
 unfold correctionExponentMDB2
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> omega

theorem source_first_correction_pathM418 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i, (i ≤ 6 ∨ correctionExponentMDB2 q r+2 < i) →
   coeff (frame path).mid.p i (q+1)*coeff (frame path).mid.p (i+2) (q+1) ≤
     coeff (frame path).mid.p (i+1) (q+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i hi
 simp only [hp]
 exact source_correction_outside_windowM418 q i r hq hi

end
end MathGKM.Markov
