import MarkovMasterExtractionM3AE
/-! Machine-authored 3ae33435. Exact attachment of the now-extracted master
kernel to every numerator-three source. The complete correction is retained. -/
namespace MathGKM.Markov
noncomputable section

theorem source_master_kernelM3AE (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 (threeRawM9E2 q r i j:ℝ)=baseValueM13E q r i j+
 (coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j:ℝ) := by
 rw [gf_source_masterM13E q i j r hi,Int.cast_add,
   master_kernel_extractionM3AE q hq r i j hi]

theorem source_two_kernel_of_correctionM3AE (hE : CorrectionKernelExtractionM13E)
 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 (threeRawM9E2 q r i j:ℝ)=baseValueM13E q r i j+correctionValueM13E q r i j := by
 rw [source_master_kernelM3AE q i j r hq hi,hE q hq r i j hi]

theorem source_path_master_kernelM3AE (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
 ∀ i j, 3 ≤ i → (coeff (frame path).mid.p i j:ℝ)=baseValueM13E q r i j+
   (coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j:ℝ) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hi
 rw [hp]
 exact source_master_kernelM3AE q i j r hq hi

end
end MathGKM.Markov
