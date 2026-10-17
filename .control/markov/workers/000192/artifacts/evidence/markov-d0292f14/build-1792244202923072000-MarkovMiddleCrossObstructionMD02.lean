import MarkovMiddleKernelShapeMD02
import MarkovMiddleDiscreteMD02
/-! Machine-authored d0292f14. A universal obstruction to componentwise
cross-gap positivity, not to the source's total raw inequality. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 7000000

def middleTemplateMD02 (x k : ℕ) (r : Bool) (c : ℕ) : ℤ :=
 topShortSumMEB6 x (x+3*k+middleBaseMD02 r) c
def middleCorrMD02 (x k : ℕ) (r : Bool) (c : ℕ) : ℤ :=
 correctionShortMD02 (x+middleBaseMD02 r-2) k c r
def middleCrossGapMD02 (x k : ℕ) (r : Bool) (c : ℕ) : ℤ :=
 2*middleTemplateMD02 x k r (c+1)*middleCorrMD02 x k r (c+1)-
 middleTemplateMD02 x k r c*middleCorrMD02 x k r (c+2)-
 middleCorrMD02 x k r c*middleTemplateMD02 x k r (c+2)

theorem middle_gap_decompositionMD02 (x k c : ℕ) (r : Bool) :
 middleGapMD02 r c x k=
 (middleTemplateMD02 x k r (c+1)^2-
   middleTemplateMD02 x k r c*middleTemplateMD02 x k r (c+2))+
 middleCrossGapMD02 x k r c+
 (middleCorrMD02 x k r (c+1)^2-middleCorrMD02 x k r c*middleCorrMD02 x k r (c+2)) := by
 unfold middleGapMD02 middleRawMD02 middleCrossGapMD02 middleTemplateMD02 middleCorrMD02
 ring

theorem middle_cross_zero_beforeMD02 (x k c : ℕ) (r : Bool) (hk : k<c+2) :
 middleCrossGapMD02 x k r c=0 := by
 unfold middleCrossGapMD02 middleCorrMD02
 rw [correction_short_zeroMD02 _ k c r hk,
   correction_short_zeroMD02 _ k (c+1) r (by omega),
   correction_short_zeroMD02 _ k (c+2) r (by omega)]
 ring

theorem middle_cross_onsetMD02 (x c : ℕ) (r : Bool) :
 middleCrossGapMD02 x (c+2) r c=
 -middleCorrMD02 x (c+2) r c*middleTemplateMD02 x (c+2) r (c+2) := by
 unfold middleCrossGapMD02 middleCorrMD02
 rw [correction_short_zeroMD02 _ (c+2) (c+1) r (by omega),
   correction_short_zeroMD02 _ (c+2) (c+2) r (by omega)]
 ring

theorem middle_cross_onset_negativeMD02 (x c : ℕ) (r : Bool) :
 middleCrossGapMD02 x (c+2) r c<0 := by
 rw [middle_cross_onsetMD02]
 have hc : 0 < middleCorrMD02 x (c+2) r c :=
   correction_short_positiveMD02 _ _ _ r (by omega)
 have ht : 0 < middleTemplateMD02 x (c+2) r (c+2) := by
   unfold middleTemplateMD02
   rw [←top_mass_short_sumMEB6]
   exact top_mass_positiveM55C _ _ _ (by omega)
 exact mul_neg_of_neg_of_pos (neg_neg_of_pos hc) ht

theorem first_difference_at_onsetMD02 (f : ℕ → ℤ) (n : ℕ)
 (hz : ∀ k, k<n → f k=0) : (fwdDiff 1)^[n] f 0=f n := by
 rw [fwdDiff_iter_eq_sum_shift]
 simp only [nsmul_eq_mul,mul_one,zero_add,zsmul_eq_mul,Nat.cast_id,Int.cast_id]
 rw [sum_range_succ]
 have h : (∑ k ∈ range n, ((-1:ℤ)^(n-k)*(n.choose k:ℤ))*f k)=0 := by
   apply sum_eq_zero
   intro k hk
   rw [hz k (mem_range.mp hk),mul_zero]
 rw [h]
 simp

theorem middle_cross_newton_negativeMD02 (x c : ℕ) (r : Bool) :
 (fwdDiff 1)^[c+2] (fun k => middleCrossGapMD02 x k r c) 0<0 := by
 rw [first_difference_at_onsetMD02 _ (c+2) (fun k hk => middle_cross_zero_beforeMD02 x k c r hk)]
 exact middle_cross_onset_negativeMD02 x c r

theorem middle_cross_mixed_negativeMD02 (c : ℕ) (r : Bool) :
 newtonCoeffMD02 (fun x k => middleCrossGapMD02 x k r c) 0 (c+2)<0 := by
 simpa only [newtonCoeffMD02,Function.iterate_zero,id_eq] using
   middle_cross_newton_negativeMD02 0 c r

theorem middle_onset_polygonMD02 (x c : ℕ) (r : Bool) :
 let q := x+2*(c+2)+middleBaseMD02 r
 let j := sourceNME9C q r+2-(q+3+(c+2))
 InPolygon 3 (sourceNME9C q r) (c+3) j ∧
 InPolygon 3 (sourceNME9C q r) (c+4) j ∧
 InPolygon 3 (sourceNME9C q r) (c+5) j := by
 dsimp
 obtain ⟨hq,hk,hn⟩ := middle_parameter_domainMD02 x (c+2) r
 exact ⟨middle_polygonM99A _ _ _ r hq hk (by omega) (by omega),
   middle_polygonM99A _ _ _ r hq hk (by omega) (by omega),
   middle_polygonM99A _ _ _ r hq hk (by omega) (by omega)⟩

end
end MathGKM.Markov
