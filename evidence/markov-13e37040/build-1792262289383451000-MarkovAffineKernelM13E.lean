import MarkovLowerParameterM9F23
/-! Machine-authored request 13e3704044384ce789e16ba0f49af882.
The affine correction kernel has nonnegative coefficients and transverse shape.
This module does not assert its global identification with source coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

def affineWeightM13E (e : ℝ) (k : ℤ) : ℝ := if k<0 then 0 else 3*k+e

theorem affine_nonnegM13E (e : ℝ) (he : 0 ≤ e) (k : ℤ) :
 0 ≤ affineWeightM13E e k := by
 unfold affineWeightM13E
 split_ifs with hk
 · exact le_rfl
 · have h : (0:ℝ) ≤ k := by exact_mod_cast (by omega : 0 ≤ k)
   positivity

theorem affine_zeroM13E (e : ℝ) (k : ℤ) (hk : k<0) :
 affineWeightM13E e k=0 := by simp [affineWeightM13E,hk]

theorem affine_crossM13E (e : ℝ) (he : 0 ≤ e) : CrossLC (affineWeightM13E e) := by
 intro i j hij
 by_cases hi : i<0
 · rw [affine_zeroM13E e i hi,zero_mul]
   exact mul_nonneg (affine_nonnegM13E e he _) (affine_nonnegM13E e he _)
 · simp only [affineWeightM13E,if_neg hi,if_neg (show ¬j<0 by omega),
     if_neg (show ¬i+1<0 by omega),if_neg (show ¬j+1<0 by omega)]
   have h : (i:ℝ) ≤ j := by exact_mod_cast hij
   push_cast
   nlinarith

def affineKernelM13E (e : ℝ) (a b j k : ℕ) : ℝ :=
 diagSumMDB9 (nbSeqMDB9 a) (nbSeqMDB9 b) (affineWeightM13E e) j k

theorem affine_kernel_nonnegM13E (e : ℝ) (he : 0 ≤ e) (a b j k : ℕ) :
 0 ≤ affineKernelM13E e a b j k := by
 unfold affineKernelM13E diagSumMDB9
 apply sum_nonneg
 intro s hs
 exact mul_nonneg (mul_nonneg (affine_nonnegM13E e he _) (nbSeq_nonnegMDB9 _ _))
   (nbSeq_nonnegMDB9 _ _)

theorem affine_kernel_positiveM13E (e : ℝ) (he : 0 < e) (a b j k : ℕ) :
 0 < affineKernelM13E e a b j k := by
 unfold affineKernelM13E diagSumMDB9
 apply lt_of_lt_of_le (b:=affineWeightM13E e 0*nbSeqMDB9 a j*nbSeqMDB9 b k)
 · simp only [affineWeightM13E,lt_self_iff_false,if_false,Int.cast_zero,mul_zero,zero_add,
     nbSeq_natMDB9]
   exact mul_pos (mul_pos he (by exact_mod_cast Nat.choose_pos (by omega : a≤j+a)))
     (by exact_mod_cast Nat.choose_pos (by omega : b≤k+b))
 · simpa using single_le_sum (f:=fun s : ℕ => affineWeightM13E e s*
       nbSeqMDB9 a ((j:ℤ)-s)*nbSeqMDB9 b ((k:ℤ)-s))
       (s:=range (min j k+1))
       (fun s hs => mul_nonneg (mul_nonneg (affine_nonnegM13E e he.le _)
         (nbSeq_nonnegMDB9 _ _)) (nbSeq_nonnegMDB9 _ _))
       (a:=0) (by simp)

theorem affine_kernel_swapM13E (e : ℝ) (a b j k : ℕ) :
 affineKernelM13E e a b j k=affineKernelM13E e b a k j :=
 diagSum_swapMDB9 _ _ _ _ _

theorem affine_kernel_rowM13E (e : ℝ) (he : 0 ≤ e) (a b j k : ℕ) :
 affineKernelM13E e a b j k*affineKernelM13E e a b (j+2) k ≤
 affineKernelM13E e a b (j+1) k^2 :=
 diagSum_rowMDB9 _ _ _ (nbSeq_crossMDB9 _) (nbSeq_crossMDB9 _) (affine_crossM13E e he)
   (nbSeq_nonnegMDB9 _) (nbSeq_nonnegMDB9 _) (affine_nonnegM13E e he)
   (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _) (affine_zeroM13E e) _ _

theorem affine_kernel_columnM13E (e : ℝ) (he : 0 ≤ e) (a b j k : ℕ) :
 affineKernelM13E e a b j k*affineKernelM13E e a b j (k+2) ≤
 affineKernelM13E e a b j (k+1)^2 := by
 simp only [affine_kernel_swapM13E e a b]
 exact affine_kernel_rowM13E e he b a k j

theorem affine_kernel_minorM13E (e : ℝ) (he : 0 ≤ e) (a b j k : ℕ) :
 affineKernelM13E e a b (j+1) k*affineKernelM13E e a b j (k+1) ≤
 affineKernelM13E e a b j k*affineKernelM13E e a b (j+1) (k+1) :=
 diagSum_minorMDB9 _ _ _ (nbSeq_crossMDB9 _) (nbSeq_crossMDB9 _)
   (affine_nonnegM13E e he) (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _) _ _

theorem affine_kernel_antidiagonalM13E (e : ℝ) (he : 0 < e) (a b j k : ℕ) :
 affineKernelM13E e a b j (k+2)*affineKernelM13E e a b (j+2) k ≤
 affineKernelM13E e a b (j+1) (k+1)^2 := by
 apply real_minor_glueM9F23
   (affineKernelM13E e a b j (k+2)) (affineKernelM13E e a b (j+1) (k+2))
   (affineKernelM13E e a b (j+2) (k+2)) (affineKernelM13E e a b (j+1) (k+1))
   (affineKernelM13E e a b (j+2) (k+1)) (affineKernelM13E e a b (j+2) k)
 · exact affine_kernel_nonnegM13E e he.le _ _ _ _
 · exact affine_kernel_positiveM13E e he _ _ _ _
 · exact affine_kernel_nonnegM13E e he.le _ _ _ _
 · exact affine_kernel_nonnegM13E e he.le _ _ _ _
 · exact affine_kernel_nonnegM13E e he.le _ _ _ _
 · exact affine_kernel_rowM13E e he.le _ _ _ _
 · exact affine_kernel_columnM13E e he.le _ _ _ _
 · simpa only [Nat.add_assoc,mul_comm] using affine_kernel_minorM13E e he.le a b (j+1) (k+1)

theorem affine_kernel_axisM13E (e : ℝ) (a b k : ℕ) :
 affineKernelM13E e a b 0 k=e*((k+b).choose b:ℝ) := by
 simp [affineKernelM13E,diagSumMDB9,affineWeightM13E,nbSeqMDB9]

end
end MathGKM.Markov
