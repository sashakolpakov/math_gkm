import MarkovMiddleHighDefsM80F
import MarkovCorrectionHighJetsM80F
import MarkovMiddleLowSourceM80F
/-! Machine-authored 80fb7777. Exact raw higher-jet attachment. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 9000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_template_shortM80F (n t i : ℕ) (hn : 2*t ≤ n) (ht : 3 ≤ t) :
 ((topTemplateMB3E n t).coeff (i+3):ℚ)=topShortQMEB6 ((n:ℚ)-2*t) ((t:ℚ)-3) i := by
 have h := top_mass_coeffM55C (n-2*t) (t-3) i
 rw [show t-3+3=t by omega,show 2*t+(n-2*t)=n by omega] at h
 rw [h,top_short_castMEB6]
 congr 1 <;> push_cast [Nat.cast_sub hn,Nat.cast_sub ht] <;> ring

theorem source_middle_high_jetsM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q)
 (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 (threeRawM9E2 q r 5 (sourceNME9C q r+2-(q+3+k)):ℚ)=sourceJet5M80F q k r ∧
 (threeRawM9E2 q r 6 (sourceNME9C q r+2-(q+3+k)):ℚ)=sourceJet6M80F q k r := by
 have he := source_middle_formulaM99A q k r hq hk
 have h5 := top_template_shortM80F (sourceNME9C q r) (q+3+k) 2 hn (by omega)
 have h6 := top_template_shortM80F (sourceNME9C q r) (q+3+k) 3 hn (by omega)
 obtain ⟨d5,d6⟩ := middle_correction_high_jetsM80F q k r hq hk
 constructor
 · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 5:ℚ)) he
   simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at h
   rw [h5,d5] at h
   rw [h]
   unfold sourceJet5M80F
   congr 2 <;> cases r <;> simp [sourceNME9C] <;> ring
 · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 6:ℚ)) he
   simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at h
   rw [h6,d6] at h
   rw [h]
   unfold sourceJet6M80F
   congr 2 <;> cases r <;> simp [sourceNME9C] <;> ring

end
end MathGKM.Markov
