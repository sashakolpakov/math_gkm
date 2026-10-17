import MarkovCorrectionPositiveSumM80F
import MarkovMiddleHighSourceM80F
/-! Machine-authored 80fb7777. Uniform two-sum formula for actual raw middle
coefficients, with no fixed-column bound. No LC inference from addition. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 9000000

theorem correction_high_sumM80F (d k c : ℕ) (r : Bool) :
 ((middleAtM99A d k r).coeff (c+3):ℚ)=
 4*∑ s ∈ range k, ((k:ℚ)-1-s)*gainJetM80F (d+2*s+4) s r (c+2) := by
 rw [positive_correction_formulaM80F]
 have hpoly : (positiveCorrectionM80F d k r).coeff (c+3)=
   4*(weightedCorrectionM80F (fun s => middleGainM99A (d+2*s+4) (s+2) r) k).coeff (c+2) := by
   cases r <;> simp [positiveCorrectionM80F,mul_assoc,coeff_C_mul,coeff_ofNat_mul,
     coeff_X,coeff_X_pow,show c+3≠1 by omega,show c+3≠2 by omega,coeff_X_mul]
 rw [hpoly,weightedCorrectionM80F]
 simp only [finsetSum_coeff,coeff_C_mul,Int.cast_mul,Int.cast_ofNat,Int.cast_sum,
   Int.cast_sub,Int.cast_natCast,Int.cast_one]
 congr 1
 apply sum_congr rfl
 intro s hs
 rw [middle_gain_coeffM80F (d+2*s+4) s (c+2) r (by omega)]
 push_cast
 rfl

theorem source_middle_two_sumM80F (q k c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 (threeRawM9E2 q r (c+3) (sourceNME9C q r+2-(q+3+k)):ℚ)=
 topShortQMEB6 ((sourceNME9C q r:ℚ)-2*(q+3+k)) (q+k) c+
 4*∑ s ∈ range k, ((k:ℚ)-1-s)*
   gainJetM80F (((q-(2*k+2):ℕ):ℚ)+2*s+4) s r (c+2) := by
 have hq2 : 2*k+2 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have he := congrArg (fun p : Polynomial ℤ => (p.coeff (c+3):ℚ))
   (source_middle_formulaM99A q k r hq hk)
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at he
 have hd := correction_high_sumM80F (q-(2*k+2)) k c r
 simp only [middleAtM99A,show q-(2*k+2)+2*k+2=q by omega] at hd
 rw [he,top_template_shortM80F _ _ _ hn (by omega),hd]
 push_cast
 congr 2 <;> ring

end
end MathGKM.Markov
