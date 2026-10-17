import MarkovMasterSumM3AE
/-! Machine-authored 3ae33435. Global master extraction, including the degree
guard. No conclusion about log-concavity of the full corrected source. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries Finset
set_option maxHeartbeats 4000000

theorem master_sum_kernelM3AE (n t j : ℕ) (h : t+1+j ≤ n) :
 ((PowerSeries.coeff n (masterColumnM3AE t)).coeff j:ℝ)=
 lowerDiagMF88 t j (n-t-1-j) := by
 rw [master_sum_realM3AE,lowerDiagMF88,
   diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _) _ _ (j+1) (by omega)]
 apply sum_congr rfl
 intro s hs
 unfold chooseSeqMDB9
 congr 2
 push_cast
 omega

theorem master_sum_zeroM3AE (n t j : ℕ) (h : n<t+1+j) :
 ((PowerSeries.coeff n (masterColumnM3AE t)).coeff j:ℝ)=0 := by
 rw [master_sum_realM3AE]
 apply sum_eq_zero
 intro s hs
 rw [nbSeq_zeroMDB9 t _ (by omega),mul_zero]

theorem master_formulaM3AE (n t j : ℕ) :
 (coeff (PowerSeries.coeff n gfMasterSeriesM13E) (t+3) j:ℝ)=
 if t+1+j ≤ n then lowerDiagMF88 t j (n-t-1-j) else 0 := by
 rw [master_raw_columnM3AE]
 split_ifs with h
 · exact master_sum_kernelM3AE n t j h
 · exact master_sum_zeroM3AE n t j (by omega)

theorem master_kernel_extractionM3AE : MasterKernelExtractionM13E := by
 intro q hq r i j hi
 have hh := master_formulaM3AE (3*q+(if r then 1 else 2)) (i-3) j
 rw [show i-3+3=i by omega] at hh
 rw [hh,baseValueM13E]
 have hn : sourceNME9C q r=3*q+(if r then 1 else 2) := rfl
 rw [hn]
 have hg : i-3+1+j ≤ 3*q+(if r then 1 else 2) ↔ i+j ≤ 3*q+(if r then 1 else 2)+2 := by omega
 simp only [hg]
 split_ifs <;> first | rfl | (congr 1; omega)

end
end MathGKM.Markov
