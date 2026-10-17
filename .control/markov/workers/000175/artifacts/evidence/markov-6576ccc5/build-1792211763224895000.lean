import MarkovResidualFirstM657
/-! Machine-authored 6576ccc5. Transfer the first augmented-residual gap
to an actual raw-source triple in every nonnegative-exponent band row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def FirstLCM657 (P : Polynomial ℤ) : Prop :=
 0 ≤ P.coeff 0 ∧ 0 ≤ P.coeff 1 ∧ P.coeff 0*P.coeff 2 ≤ P.coeff 1^2

theorem first_lc_smoothM657 (P : Polynomial ℤ) (h : FirstLCM657 P) :
 FirstLCM657 ((X+1)*P) := by
 rcases h with ⟨h0,h1,hg⟩
 have e0 : ((X+1)*P).coeff 0=P.coeff 0 := by simp [add_mul]
 have e1 : ((X+1)*P).coeff 1=P.coeff 0+P.coeff 1 := by simp [add_mul,coeff_X_mul]
 have e2 : ((X+1)*P).coeff 2=P.coeff 1+P.coeff 2 := by simp [add_mul,coeff_X_mul]
 unfold FirstLCM657
 rw [e0,e1,e2]
 exact ⟨h0,add_nonneg h0 h1,by nlinarith [mul_nonneg h0 h1,sq_nonneg (P.coeff 0)]⟩

theorem first_lc_pascalM657 (P : Polynomial ℤ) (h : FirstLCM657 P) (n : ℕ) :
 FirstLCM657 ((X+1)^n*P) := by
 induction n with
 | zero => simpa using h
 | succ n ih => simpa only [pow_succ',mul_assoc] using first_lc_smoothM657 _ ih

theorem band_residual_firstM657 (d k : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 FirstLCM657 (bandResidualM831 (d+2*k+(if r then 2 else 1)) k r) := by
 let q := d+2*k+(if r then 2 else 1)
 let j := q+k+1
 have hn : 2*j+1 ≤ sourceNME9C q r := by
   dsimp [q,j]; cases r <;> simp [sourceNME9C] <;> omega
 have he : sourceNME9C q r=2*j+1+d := by
   dsimp [q,j]; cases r <;> simp [sourceNME9C] <;> omega
 have hj : (j:ℚ)=(d:ℚ)+3*k+(if r then 3 else 2) := by
   dsimp [j,q]; cases r <;> norm_num <;> ring
 have h0 : ((bandResidualM831 q k r).coeff 0:ℚ)=correctionZeroM657 k r := by
   simpa only [bandResidualM831,coeff_add,coeff_X_mul_zero,add_zero,q,bandAtM139] using correction_zeroM657 d k r
 have h1 : ((bandResidualM831 q k r).coeff 1:ℚ)=
     correctionOneM657 d k r+lowerZeroM657 j := by
   rw [bandResidualM831,coeff_add,show (1:ℕ)=0+1 by omega,coeff_X_mul]
   push_cast
   rw [show bandQM139 q r k=bandAtM139 d k r from rfl,correction_oneM657 d k r hq]
   rw [he]
   exact congrArg (correctionOneM657 d k r + ·) (diagonalH_zero_rationalM657 d j)
 have h2 : ((bandResidualM831 q k r).coeff 2:ℚ)=
     correctionTwoM657 d k r+lowerOneM657 d j := by
   rw [bandResidualM831,coeff_add,show (2:ℕ)=1+1 by omega,coeff_X_mul]
   push_cast
   rw [show bandQM139 q r k=bandAtM139 d k r from rfl,correction_twoM657 d k r hq]
   rw [he]
   exact congrArg (correctionTwoM657 d k r + ·) (diagonalH_one_rationalM657 d j)
 refine ⟨band_residual_nonnegM831 q k 0 r hn,band_residual_nonnegM831 q k 1 r hn,?_⟩
 have hh := residual_first_certificateM657 (d:ℚ) (k:ℚ) r (by positivity) (by positivity)
 rw [←hj,←h0,←h1,←h2] at hh
 exact_mod_cast hh

theorem source_band_firstM657 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r 2 (q+k+1)*threeRawM9E2 q r 4 (q+k+1) ≤
 threeRawM9E2 q r 3 (q+k+1)^2 := by
 have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 have hr := band_residual_firstM657 (bandExponentM139 q k r) k r (by omega)
 rw [he] at hr
 have hh := (first_lc_pascalM657 _ hr (bandExponentM139 q k r)).2.2
 simp only [source_band_residual_coeffM831 q k _ r hq hn,bandRowM831]
 simpa only [coeff_X_pow_mul',Nat.reduceLeDiff,ite_true,Nat.reduceSub] using hh

end
end MathGKM.Markov
