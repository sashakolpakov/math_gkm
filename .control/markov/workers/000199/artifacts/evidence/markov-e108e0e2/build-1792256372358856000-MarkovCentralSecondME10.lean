import MarkovCentralRationalME10
/-! Machine-authored e108e0e2. Exact physical-column-two coefficient at the
central rows. It retains the signed correction jet in the source identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem top_shift_secondME10 (h T : ℕ) :
 (topTemplateMB3E (2*T+h+2) (T+3)).coeff 2=4*((T:ℤ)+1)*((h+2).choose 2:ℤ) := by
 induction T using Nat.twoStepInduction with
 | zero =>
   have he := (top_five_formulaME87 (h+2) (by omega)).2.2.2.1
   simp only [Nat.mul_zero,zero_add,Nat.zero_add]
   rw [he]
   simp only [coeff_add,coeff_C_mul]
   norm_num [coeff_X,coeff_X_pow]
 | one =>
   have he := (top_five_formulaME87 (h+4) (by omega)).2.2.2.2
   rw [show 2*1+h+2=h+4 by omega,show 1+3=4 by rfl,he]
   simp only [coeff_add,coeff_C_mul]
   norm_num [coeff_X,coeff_X_pow,show h+4-2=h+2 by omega]
 | more T h0 h1 =>
   have he := congrArg (fun p : Polynomial ℤ => p.coeff 2)
     (top_diagonal_equationME10 (2*T+h+2) (T+3) (by omega))
   simp only [coeff_sub,coeff_add,coeff_ofNat_mul] at he
   rw [show 2*T+h+2+4=2*(T+2)+h+2 by omega,
     show 2*T+h+2+2=2*(T+1)+h+2 by omega,
     show T+3+2=(T+2)+3 by omega,show T+3+1=(T+1)+3 by omega,h0,h1] at he
   rw [top_delta_low_zeroMB3E _ _ _ (by omega) (by omega) (by omega),
     top_delta_low_zeroMB3E _ _ _ (by omega) (by omega) (by omega),
     top_delta_low_zeroMB3E _ _ _ (by omega) (by omega) (by omega)] at he
   push_cast at he ⊢
   linear_combination he

def centralSecondME10 (h k : ℚ) (r : Bool) : ℚ :=
 4*(3*k+h+(if r then 1 else 0)+1)*choosePolyM0D3 (h+2) 2+
 correctionJet2M80F (2*k+h+(if r then 1 else 0)) k r

theorem central_source_secondME10 (h k : ℕ) (r : Bool) (hq : 1 ≤ centralQME10 h k r) :
 (threeRawM9E2 (centralQME10 h k r) r 2
   (sourceNME9C (centralQME10 h k r) r+2-(centralQME10 h k r+3+k)):ℚ)=
 centralSecondME10 h k r := by
 have hk : k ≤ centralQME10 h k r := by unfold centralQME10; omega
 have he := congrArg (fun p : Polynomial ℤ => (p.coeff 2:ℚ))
   (source_middle_formulaM99A (centralQME10 h k r) k r hq hk)
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at he
 have ht : centralQME10 h k r+3+k=centralTME10 h k r+3 := by
   unfold centralQME10 centralTME10; omega
 have hn : sourceNME9C (centralQME10 h k r) r=2*centralTME10 h k r+h+2 := by
   cases r <;> simp [sourceNME9C,centralQME10,centralTME10] <;> omega
 rw [he,ht,hn,top_shift_secondME10,
   (middle_correction_jetsM80F _ k r hq hk).2.2.1]
 simp only [Int.cast_mul,Int.cast_natCast,Int.cast_add,Int.cast_one,Int.cast_ofNat,
   choose_poly_natM0D3,Nat.cast_add,Nat.cast_ofNat]
 cases r <;> simp [centralSecondME10,centralQME10,centralTME10]

end
end MathGKM.Markov
