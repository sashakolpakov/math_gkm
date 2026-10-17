import MarkovCorrectionSumMED6
/-! Machine-authored ed6bdbeb. Global guarded correction extraction. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 4000000

theorem correction_rescale_coeffMED6 (q j : ℕ) (f : PowerSeries (Polynomial ℤ)) :
 ((PowerSeries.coeff q (4*C Polynomial.X*rescale Polynomial.X f)).coeff j:ℝ)=
 if q+1 ≤ j then 4*((PowerSeries.coeff q f).coeff (j-q-1):ℝ) else 0 := by
 have he : 4*C Polynomial.X*rescale Polynomial.X f=
   C (4:Polynomial ℤ)*(C Polynomial.X*rescale Polynomial.X f) := by simp only [map_ofNat]; ring
 rw [he,coeff_C_mul,coeff_C_mul,coeff_rescale]
 have hp : (4:Polynomial ℤ)*(Polynomial.X*(Polynomial.X^q*PowerSeries.coeff q f))=
   Polynomial.C 4*(Polynomial.X^(q+1)*PowerSeries.coeff q f) := by
   simp only [Polynomial.C_ofNat,pow_succ]; ring
 rw [hp,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul']
 split_ifs with h
 · push_cast
   rw [show j-(q+1)=j-q-1 by omega]
 · simp

theorem correction_formulaMED6 (q t j : ℕ) (r : Bool) :
 (coeff (PowerSeries.coeff q (gfESeriesM13E r)) (t+3) j:ℝ)=
 correctionValueM13E q r (t+3) j := by
 rw [correction_raw_columnM3AE,correction_column_rescaleMED6,correction_rescale_coeffMED6]
 unfold correctionValueM13E
 by_cases hj : q+1 ≤ j
 · simp only [if_pos hj]
   by_cases hk : t+3+j+q ≤ sourceNME9C q r
   · simp only [if_pos (And.intro hj hk)]
     have hd : t+2+(if r then 1 else 0)+(j-q-1) ≤ q := by
       cases r <;> simp [sourceNME9C] at hk ⊢ <;> omega
     rw [correction_core_kernelMED6 _ _ _ _ _ hd]
     have he : (Int.cast (if r then 2 else 1):ℝ)=correctionEpsilonM13E r := by
       cases r <;> norm_num [correctionEpsilonM13E]
     have hk' : q-(t+2+(if r then 1 else 0))-(j-q-1)=sourceNME9C q r-q-(t+3)-j := by
       cases r <;> simp [sourceNME9C] at hk ⊢ <;> omega
     rw [he,hk',show t+3-1=t+2 by omega,show t+3-2=t+1 by omega]
   · simp only [if_neg (show ¬(q+1 ≤ j ∧ t+3+j+q ≤ sourceNME9C q r) by tauto)]
     have hd : q<t+2+(if r then 1 else 0)+(j-q-1) := by
       cases r <;> simp [sourceNME9C] at hk ⊢ <;> omega
     rw [correction_core_zeroMED6 _ _ _ _ _ hd,mul_zero]
 · simp only [if_neg hj,if_neg (show ¬(q+1 ≤ j ∧ t+3+j+q ≤ sourceNME9C q r) by tauto)]

theorem correction_kernel_extractionMED6 : CorrectionKernelExtractionM13E := by
 intro q hq r i j hi
 simpa only [show i-3+3=i by omega] using correction_formulaMED6 q (i-3) j r

end
end MathGKM.Markov
