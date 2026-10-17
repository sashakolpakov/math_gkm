import MarkovCorrectionParameterME10
import MarkovMiddleKernelSourceMD02
/-! Machine-authored e108e0e2. Exact positive correction with q=2k+e,
including e=0,1; no negative offset is truncated. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000

def correctionShiftME10 (e k : ℕ) (r : Bool) : Polynomial ℤ :=
 (if r then 8 else 4)*X+12*C (k:ℤ)*X+
 C (k:ℤ)*(if r then 8*C ((e:ℤ)+1) else 4*C ((e:ℤ)+2))*X^2+
 4*X*weightedCorrectionM80F (fun s => middleGainM99A (e+2*s+2) (s+2) r) k

theorem correction_shift_formulaME10 (e k : ℕ) (r : Bool) :
 middleCorrectionM99A (e+2*k) r k=correctionShiftME10 e k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · cases r <;> simp [middleCorrectionM99A,middle_gain_topM99A,
       correctionShiftME10,weightedCorrectionM80F] <;> ring
   · simp only [Nat.mul_one]
     rw [middle_correction_oneM99A (e+2) r (by omega)]
     cases r <;> simp [correctionShiftME10,weightedCorrectionM80F,sum_range_succ] <;> ring
   · have h := middle_correction_diagonalME10 (e+2*k) k r (by omega)
     rw [show e+2*k+4=e+2*(k+2) by omega,
       show e+2*k+2=e+2*(k+1) by omega,ih k (by omega),ih (k+1) (by omega)] at h
     have hs := weighted_correction_stepM80F
       (fun s => middleGainM99A (e+2*s+2) (s+2) r) k
     simp only [correctionShiftME10,Nat.cast_add,Nat.cast_ofNat,map_add,map_ofNat] at h ⊢
     rw [show e+2*(k+1)=e+2*k+2 by omega] at h
     linear_combination h-4*X*hs

theorem correction_shift_nonnegME10 (e k i : ℕ) (r : Bool) :
 0 ≤ (middleCorrectionM99A (e+2*k) r k).coeff i := by
 rw [correction_shift_formulaME10]
 have hg : 0 ≤ (X*weightedCorrectionM80F
     (fun s => middleGainM99A (e+2*s+2) (s+2) r) k).coeff i := by
   cases i with
   | zero => simp
   | succ i =>
     rw [coeff_X_mul,weightedCorrectionM80F]
     simp only [finsetSum_coeff,coeff_C_mul]
     apply sum_nonneg
     intro s hs
     apply mul_nonneg (by have := mem_range.mp hs; omega)
     exact gain_coeff_nonnegM99A _ _ _ r
 cases r <;> simp only [correctionShiftME10,Bool.false_eq_true,if_false,if_true,
   mul_assoc,coeff_add,coeff_ofNat_mul,coeff_C_mul,coeff_X,coeff_X_pow]
 all_goals
   have hgg : 0 ≤ (4*(X*weightedCorrectionM80F
       (fun s => middleGainM99A (e+2*s+2) (s+2) _) k)).coeff i := by
     rw [coeff_ofNat_mul]; positivity
   simp only [coeff_ofNat_mul] at hgg
   positivity

theorem shifted_gain_pairsME10 (e s c : ℕ) (r : Bool) :
 (middleGainM99A (e+2*s+2) (s+2) r).coeff (c+2)=
 if r then
 gainPairMD02 (e+c+2) s c (c+1)+
 2*gainPairMD02 (e+c+3) s (c+1) (c+2)+
 gainPairMD02 (e+c+2) s (c+1) (c+2)+
 gainPairMD02 (e+c+2) s c (c+2)+gainPairMD02 (e+c+3) s c (c+2)
 else
 2*gainPairMD02 (e+c+3) s (c+1) (c+2)+
 gainPairMD02 (e+c+3) s c (c+1)+
 gainPairMD02 (e+c+4) s (c+1) (c+2)+gainPairMD02 (e+c+3) s c (c+2) := by
 rw [middle_gain_succM99A (e+2*s+2) (s+1) r (by omega)]
 have h0 := middle_fib_natMD02 (e+2*s+2) s c (by omega)
 have h1 := middle_fib_natMD02 (e+2*s+2) s (c+1) (by omega)
 have h2 := middle_fib_natMD02 (e+2*s+2) (s+1) (c+1) (by omega)
 have h3 := middle_fib_natMD02 (e+2*s+2+1) (s+1) (c+1) (by omega)
 have h4 := middle_fib_natMD02 (e+2*s+2+1) s c (by omega)
 have h5 := middle_fib_natMD02 (e+2*s+2+1) s (c+1) (by omega)
 rw [show e+2*s+2-s+c=s+(e+c+2) by omega] at h0
 rw [show e+2*s+2-s+(c+1)=s+(e+c+3) by omega] at h1
 rw [show e+2*s+2-(s+1)+(c+1)=s+(e+c+2) by omega,
   Nat.choose_succ_succ,Nat.cast_add,add_mul] at h2
 rw [show e+2*s+2+1-(s+1)+(c+1)=s+(e+c+3) by omega,
   Nat.choose_succ_succ,Nat.cast_add,add_mul] at h3
 rw [show e+2*s+2+1-s+c=s+(e+c+3) by omega] at h4
 rw [show e+2*s+2+1-s+(c+1)=s+(e+c+4) by omega] at h5
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,add_mul,one_mul,
   coeff_add,coeff_X_mul] <;>
   simp only [h0,h1,h2,h3,h4,h5,gainPairMD02] <;> ring

def correctionShortME10 (e k c : ℕ) (r : Bool) : ℤ :=
 4*(if r then
 middleKernelMD02 (e+c+2) k c (c+1)+
 2*middleKernelMD02 (e+c+3) k (c+1) (c+2)+
 middleKernelMD02 (e+c+2) k (c+1) (c+2)+
 middleKernelMD02 (e+c+2) k c (c+2)+middleKernelMD02 (e+c+3) k c (c+2)
 else
 2*middleKernelMD02 (e+c+3) k (c+1) (c+2)+
 middleKernelMD02 (e+c+3) k c (c+1)+
 middleKernelMD02 (e+c+4) k (c+1) (c+2)+middleKernelMD02 (e+c+3) k c (c+2))

theorem correction_short_shiftME10 (e k c : ℕ) (r : Bool) :
 (middleCorrectionM99A (e+2*k) r k).coeff (c+3)=correctionShortME10 e k c r := by
 rw [correction_shift_formulaME10]
 have hpoly : (correctionShiftME10 e k r).coeff (c+3)=
   4*(weightedCorrectionM80F (fun s => middleGainM99A (e+2*s+2) (s+2) r) k).coeff (c+2) := by
   cases r <;> simp [correctionShiftME10,mul_assoc,coeff_C_mul,coeff_ofNat_mul,
     coeff_X,coeff_X_pow,show c+3≠1 by omega,show c+3≠2 by omega,coeff_X_mul]
 rw [hpoly,weightedCorrectionM80F]
 simp only [finsetSum_coeff,coeff_C_mul]
 have hp (D a b : ℕ) :
   (∑ s ∈ range k, ((k:ℤ)-1-s)*gainPairMD02 D s a b)=middleKernelMD02 D k a b := by
   simp only [gainPairMD02,←mul_assoc]
   exact middle_kernel_sumMD02 D k a b
 simp_rw [shifted_gain_pairsME10]
 cases r <;> simp only [correctionShortME10,Bool.false_eq_true,if_false,if_true,
   mul_add,sum_add_distrib]
 all_goals
   simp_rw [show ∀ w z : ℤ, w*(2*z)=2*(w*z) by intros; ring]
   simp only [←mul_sum,hp]
   ring

end
end MathGKM.Markov
