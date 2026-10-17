import MarkovCorrectionGainM80F
/-! Machine-authored 80fb7777. Four exact raw correction coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 30000

theorem middle_correction_jetsM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q) :
 (middleCorrectionM99A q r k).coeff 0=0 ∧
 ((middleCorrectionM99A q r k).coeff 1:ℚ)=correctionJet1M80F q k r ∧
 ((middleCorrectionM99A q r k).coeff 2:ℚ)=correctionJet2M80F q k r ∧
 ((middleCorrectionM99A q r k).coeff 3:ℚ)=correctionJet3M80F q k r ∧
 ((middleCorrectionM99A q r k).coeff 4:ℚ)=correctionJet4M80F q k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · simp only [middleCorrectionM99A,middle_gain_topM99A]
     cases r <;> norm_num [correctionJet1M80F,correctionJet2M80F,correctionJet3M80F,
       correctionJet4M80F,coeff_C_mul]
   · rw [middle_correction_oneM99A q r hq]
     cases r <;> simp [correctionJet1M80F,correctionJet2M80F,correctionJet3M80F,
       correctionJet4M80F,coeff_C_mul] <;> push_cast <;> ring
   · obtain ⟨z0,a0,b0,c0,d0⟩ := ih k (by omega) (by omega)
     obtain ⟨z1,a1,b1,c1,d1⟩ := ih (k+1) (by omega) (by omega)
     have he : middleCorrectionM99A q r (k+2)=
       4*(X*middleGainM99A q (k+2) r)+2*middleCorrectionM99A q r (k+1)-
       2*(X*middleCorrectionM99A q r (k+1))-middleCorrectionM99A q r k-
       2*(X*middleCorrectionM99A q r k)-X*(X*middleCorrectionM99A q r k) := by
       rw [middleCorrectionM99A]; ring
     have hz : (middleCorrectionM99A q r (k+2)).coeff 0=0 := by
       rw [he]
       simp [coeff_add,coeff_sub,coeff_ofNat_mul,z0,z1]
     refine ⟨hz,?_,?_,?_,?_⟩
     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 1:ℚ)) he
       have hg := middle_gain_coeffM80F q k 0 r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [z0,z1,Int.cast_zero,a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet1M80F,correctionJet2M80F,correctionJet3M80F,
         correctionJet4M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h
     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 2:ℚ)) he
       have hg := middle_gain_coeffM80F q k 1 r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [z0,z1,Int.cast_zero,a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet1M80F,correctionJet2M80F,correctionJet3M80F,
         correctionJet4M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h
     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 3:ℚ)) he
       have hg := middle_gain_coeffM80F q k 2 r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [z0,z1,Int.cast_zero,a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet1M80F,correctionJet2M80F,correctionJet3M80F,
         correctionJet4M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h
     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 4:ℚ)) he
       have hg := middle_gain_coeffM80F q k 3 r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [z0,z1,Int.cast_zero,a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet1M80F,correctionJet2M80F,correctionJet3M80F,
         correctionJet4M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h

end
end MathGKM.Markov
