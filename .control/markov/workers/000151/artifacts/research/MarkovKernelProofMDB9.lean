import MarkovKernelSequencesMDB9
import MarkovKernelShapeM4F4
/-! Machine-authored db972d62. Unconditional shape of the source-linked kernel. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem two_kernel_diagSumMDB9 (i j m : ℕ) :
 (twoKernelM4F4 i j m:ℝ)=diagSumMDB9 (nbSeqMDB9 i) (chooseSeqMDB9 (i-2)) weightSeqMDB9 j m := by
 unfold twoKernelM4F4 diagSumMDB9
 push_cast
 rw [Finset.sum_range_succ']
 simp only [Nat.cast_zero,sub_zero,weightSeqMDB9,lt_self_iff_false,if_false,
   if_true,one_mul,nbSeq_natMDB9,chooseSeq_natMDB9]
 rw [add_comm]
 congr 1
 rw [Finset.mul_sum]
 apply sum_congr rfl
 intro k hk
 have hk' : k < min j m := mem_range.mp hk
 have hj : ((j-(k+1):ℕ):ℤ)=(j:ℤ)-(k+1) := by omega
 have hm : ((m-(k+1):ℕ):ℤ)=(m:ℤ)-(k+1) := by omega
 simp only [Nat.cast_add,Nat.cast_one]
 rw [if_neg (by omega : ¬(k:ℤ)+1<0),if_neg (by omega : (k:ℤ)+1≠0),
   ←hj,←hm,nbSeq_natMDB9,chooseSeq_natMDB9]
 ring

theorem kernel_shapeMDB9 (i : ℕ) : KernelShapeM4F4 i := by
 have hr := diagSum_rowMDB9 (nbSeqMDB9 i) (chooseSeqMDB9 (i-2)) weightSeqMDB9
   (nbSeq_crossMDB9 i) (chooseSeq_crossMDB9 (i-2)) weight_crossMDB9
   (nbSeq_nonnegMDB9 i) (chooseSeq_nonnegMDB9 (i-2)) weight_nonnegMDB9
   (nbSeq_zeroMDB9 i) (chooseSeq_zeroMDB9 (i-2)) weight_zeroMDB9
 have hc := diagSum_rowMDB9 (chooseSeqMDB9 (i-2)) (nbSeqMDB9 i) weightSeqMDB9
   (chooseSeq_crossMDB9 (i-2)) (nbSeq_crossMDB9 i) weight_crossMDB9
   (chooseSeq_nonnegMDB9 (i-2)) (nbSeq_nonnegMDB9 i) weight_nonnegMDB9
   (chooseSeq_zeroMDB9 (i-2)) (nbSeq_zeroMDB9 i) weight_zeroMDB9
 have hm := diagSum_minorMDB9 (nbSeqMDB9 i) (chooseSeqMDB9 (i-2)) weightSeqMDB9
   (nbSeq_crossMDB9 i) (chooseSeq_crossMDB9 (i-2)) weight_nonnegMDB9
   (nbSeq_zeroMDB9 i) (chooseSeq_zeroMDB9 (i-2))
 refine ⟨?_,?_,?_⟩
 · intro j m
   have h := hr j m
   simp only [←two_kernel_diagSumMDB9] at h
   exact_mod_cast h
 · intro j m
   have h := hc m j
   simp only [diagSum_swapMDB9 (chooseSeqMDB9 (i-2)) (nbSeqMDB9 i),
     ←two_kernel_diagSumMDB9] at h
   exact_mod_cast h
 · intro j m
   have h := hm j m
   simp only [←two_kernel_diagSumMDB9] at h
   exact_mod_cast h

theorem source_two_vertical_ge_fourMDB9 (path : List Bool) (ha : (frame path).mid.a=2)
 (i j : ℕ) (hi : 4 ≤ i) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2)≤
 coeff (frame path).mid.p i (j+1)^2 :=
 source_two_vertical_of_shapeM4F4 i hi (kernel_shapeMDB9 i) path ha j

theorem root_iff_other_verticalMDB9 : Conjecture63 ↔ OtherVerticalCoreM0D3 := by
 constructor
 · intro h; exact (root_iff_uniform_verticalM0D3.mp h).2
 · exact root_of_uniform_kernel_shapeM4F4 (fun i _ => kernel_shapeMDB9 i)
end
end MathGKM.Markov
