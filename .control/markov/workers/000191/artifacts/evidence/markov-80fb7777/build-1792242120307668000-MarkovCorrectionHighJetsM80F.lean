import MarkovCorrectionHighDefsM80F
/-! Machine-authored 80fb7777. Exact fifth and sixth correction coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 15000000
set_option maxRecDepth 50000
set_option linter.unusedSimpArgs false
theorem middle_correction_high_jetsM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q) :
 ((middleCorrectionM99A q r k).coeff 5:ℚ)=correctionJet5M80F q k r ∧
 ((middleCorrectionM99A q r k).coeff 6:ℚ)=correctionJet6M80F q k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · simp only [middleCorrectionM99A,middle_gain_topM99A]
     cases r <;> norm_num [correctionJet5M80F,correctionJet6M80F,coeff_C_mul,coeff_X]
   · rw [middle_correction_oneM99A q r hq]
     cases r <;> simp only [Bool.false_eq_true,if_false,if_true,coeff_add,
       coeff_ofNat_mul,coeff_C_mul,coeff_X_pow,coeff_X]
       <;> norm_num [correctionJet5M80F,correctionJet6M80F] <;> push_cast <;> ring_nf <;> simp
   · obtain ⟨a0,b0⟩ := ih k (by omega) (by omega)
     obtain ⟨a1,b1⟩ := ih (k+1) (by omega) (by omega)
     obtain ⟨_,_,_,c0,d0⟩ := middle_correction_jetsM80F q k r hq (by omega)
     obtain ⟨_,_,_,c1,d1⟩ := middle_correction_jetsM80F q (k+1) r hq (by omega)
     have he : middleCorrectionM99A q r (k+2)=
       4*(X*middleGainM99A q (k+2) r)+2*middleCorrectionM99A q r (k+1)-
       2*(X*middleCorrectionM99A q r (k+1))-middleCorrectionM99A q r k-
       2*(X*middleCorrectionM99A q r k)-X*(X*middleCorrectionM99A q r k) := by
       rw [middleCorrectionM99A]; ring
     constructor
     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 5:ℚ)) he
       have hg := middle_gain_coeffM80F q k 4 r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet3M80F,correctionJet4M80F,correctionJet5M80F,
         correctionJet6M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h
     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 6:ℚ)) he
       have hg := middle_gain_coeffM80F q k 5 r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet3M80F,correctionJet4M80F,correctionJet5M80F,
         correctionJet6M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h
end
end MathGKM.Markov
