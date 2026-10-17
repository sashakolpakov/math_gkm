import MarkovMiddleKernelMD02
/-! Machine-authored d0292f14. Uniform short positive binomial expansion of
actual numerator-three middle coefficients, retaining zero terms. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000

theorem middle_fib_natMD02 (n t c : ℕ) (ht : t+1 ≤ n) :
 (middleFibM99A n (t+1)).coeff (c+1)=
 (t.choose c:ℤ)*((n-t+c).choose (c+1):ℤ) := by
 rw [middleFibM99A,fib_rows_coeffMC3E]
 simp only [fibRawM9E2,show c+1≠0 by omega,if_false]
 by_cases hc : c ≤ t
 · rw [if_pos (by omega : c+1+(n-(t+1)) ≤ n)]
   rw [show n-(n-(t+1))-1=t by omega]
   rw [←Nat.choose_symm (show n-(t+1) ≤ c+1+(n-(t+1)) by omega)]
   rw [show c+1+(n-(t+1))-(n-(t+1))=c+1 by omega,
     show c+1+(n-(t+1))=n-t+c by omega]
   simp
 · rw [if_neg (by omega : ¬c+1+(n-(t+1)) ≤ n),Nat.choose_eq_zero_of_lt (by omega : t<c)]
   simp

def gainPairMD02 (D s a b : ℕ) : ℤ := (s.choose a:ℤ)*((s+D).choose b:ℤ)

theorem middle_gain_pairsMD02 (d s c : ℕ) (r : Bool) :
 (middleGainM99A (d+2*s+4) (s+2) r).coeff (c+2)=
 if r then
 gainPairMD02 (d+c+4) s c (c+1)+
 2*gainPairMD02 (d+c+5) s (c+1) (c+2)+
 gainPairMD02 (d+c+4) s (c+1) (c+2)+
 gainPairMD02 (d+c+4) s c (c+2)+gainPairMD02 (d+c+5) s c (c+2)
 else
 2*gainPairMD02 (d+c+5) s (c+1) (c+2)+
 gainPairMD02 (d+c+5) s c (c+1)+
 gainPairMD02 (d+c+6) s (c+1) (c+2)+gainPairMD02 (d+c+5) s c (c+2) := by
 rw [middle_gain_succM99A (d+2*s+4) (s+1) r (by omega)]
 have h0 := middle_fib_natMD02 (d+2*s+4) s c (by omega)
 have h1 := middle_fib_natMD02 (d+2*s+4) s (c+1) (by omega)
 have h2 := middle_fib_natMD02 (d+2*s+4) (s+1) (c+1) (by omega)
 have h3 := middle_fib_natMD02 (d+2*s+4+1) (s+1) (c+1) (by omega)
 have h4 := middle_fib_natMD02 (d+2*s+4+1) s c (by omega)
 have h5 := middle_fib_natMD02 (d+2*s+4+1) s (c+1) (by omega)
 have e0 : d+2*s+4-s+c=s+(d+c+4) := by omega
 have e1 : d+2*s+4-s+(c+1)=s+(d+c+5) := by omega
 have e2 : d+2*s+4-(s+1)+(c+1)=s+(d+c+4) := by omega
 have e3 : d+2*s+4+1-(s+1)+(c+1)=s+(d+c+5) := by omega
 have e4 : d+2*s+4+1-s+c=s+(d+c+5) := by omega
 have e5 : d+2*s+4+1-s+(c+1)=s+(d+c+6) := by omega
 rw [e0] at h0
 rw [e1] at h1
 rw [e2,Nat.choose_succ_succ,Nat.cast_add,add_mul] at h2
 rw [e3,Nat.choose_succ_succ,Nat.cast_add,add_mul] at h3
 rw [e4] at h4
 rw [e5] at h5
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,add_mul,one_mul,
   coeff_add,coeff_X_mul] <;>
   simp only [h0,h1,h2,h3,h4,h5,gainPairMD02] <;> ring

def correctionShortMD02 (d k c : ℕ) (r : Bool) : ℤ :=
 4*(if r then
 middleKernelMD02 (d+c+4) k c (c+1)+
 2*middleKernelMD02 (d+c+5) k (c+1) (c+2)+
 middleKernelMD02 (d+c+4) k (c+1) (c+2)+
 middleKernelMD02 (d+c+4) k c (c+2)+middleKernelMD02 (d+c+5) k c (c+2)
 else
 2*middleKernelMD02 (d+c+5) k (c+1) (c+2)+
 middleKernelMD02 (d+c+5) k c (c+1)+
 middleKernelMD02 (d+c+6) k (c+1) (c+2)+middleKernelMD02 (d+c+5) k c (c+2))

theorem correction_short_nonnegMD02 (d k c : ℕ) (r : Bool) :
 0 ≤ correctionShortMD02 d k c r := by
 cases r <;> simp only [correctionShortMD02,middleKernelMD02,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem correction_short_weightedMD02 (d k c : ℕ) (r : Bool) :
 4*(∑ s ∈ range k, ((k:ℤ)-1-s)*
   (middleGainM99A (d+2*s+4) (s+2) r).coeff (c+2))=
 correctionShortMD02 d k c r := by
 have hp (D a b : ℕ) :
   (∑ s ∈ range k, ((k:ℤ)-1-s)*gainPairMD02 D s a b)=middleKernelMD02 D k a b := by
   simp only [gainPairMD02,←mul_assoc]
   exact middle_kernel_sumMD02 D k a b
 simp_rw [middle_gain_pairsMD02]
 cases r <;> simp only [correctionShortMD02,Bool.false_eq_true,if_false,if_true,
   mul_add,sum_add_distrib]
 all_goals
   simp_rw [show ∀ w z : ℤ, w*(2*z)=2*(w*z) by intros; ring]
   simp only [←mul_sum,hp]
   ring

theorem correction_short_formulaMD02 (d k c : ℕ) (r : Bool) :
 (middleAtM99A d k r).coeff (c+3)=correctionShortMD02 d k c r := by
 rw [positive_correction_formulaM80F]
 have hpoly : (positiveCorrectionM80F d k r).coeff (c+3)=
   4*(weightedCorrectionM80F (fun s => middleGainM99A (d+2*s+4) (s+2) r) k).coeff (c+2) := by
   cases r <;> simp [positiveCorrectionM80F,mul_assoc,coeff_C_mul,coeff_ofNat_mul,
     coeff_X,coeff_X_pow,show c+3≠1 by omega,show c+3≠2 by omega,coeff_X_mul]
 rw [hpoly,weightedCorrectionM80F]
 simp only [finsetSum_coeff,coeff_C_mul]
 exact correction_short_weightedMD02 d k c r

theorem source_middle_shortMD02 (q k c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r (c+3) (sourceNME9C q r+2-(q+3+k))=
 topShortSumMEB6 (sourceNME9C q r-2*(q+3+k)) (q+k) c+
 correctionShortMD02 (q-(2*k+2)) k c r := by
 have hq2 : 2*k+2 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have he := congrArg (fun p : Polynomial ℤ => p.coeff (c+3))
   (source_middle_formulaM99A q k r hq hk)
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add] at he
 have hd := correction_short_formulaMD02 (q-(2*k+2)) k c r
 simp only [middleAtM99A,show q-(2*k+2)+2*k+2=q by omega] at hd
 have ht := top_mass_coeffM55C (sourceNME9C q r-2*(q+3+k)) (q+k) c
 rw [show q+k+3=q+3+k by omega,
   show 2*(q+3+k)+(sourceNME9C q r-2*(q+3+k))=sourceNME9C q r by omega,
   top_mass_short_sumMEB6] at ht
 rw [he,ht,hd]

end
end MathGKM.Markov
