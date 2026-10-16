import MarkovOffsetScalarMAF6
import MarkovOffsetMixedM58E
/-! Machine-authored af6200bf. Global shifted comparisons for supported core terms. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem lower_core_orderedMAF6 (j i h k : ℕ) (hk : k ≤ h)
 (hh : h+2 ≤ i) (hi : i ≤ j+k) :
 lowerCoreM58E j i h*lowerCoreM58E j (i+2) k ≤
 lowerCoreM58E j (i+1) h*lowerCoreM58E j (i+1) k := by
 have h0 := lower_core_stepMAF6 j i h hh (by omega)
 have h1 := lower_core_stepMAF6 j (i+1) k (by omega) (by omega)
 simp only [Nat.cast_add,Nat.cast_one,show i+1+1=i+2 by omega] at h1
 have hg : 0 ≤ horizontalGapMAF6 j i h k := by
   have ht := horizontal_gapMAF6 (k:ℤ) ((h:ℤ)-k) ((i:ℤ)-h-2) ((j:ℤ)-i+k)
     (by omega) (by omega) (by omega) (by omega)
   convert ht using 1 <;> congr 1 <;> ring
 have he := product_transferMAF6 _ _ _ _ _ _ _ _ h0 h1
 have hpos : 0 < horizontalDenMAF6 i h*horizontalDenMAF6 ((i:ℤ)+1) k := by
   unfold horizontalDenMAF6
   have hA : 0 < (i:ℤ)-1-h := by omega
   have hB : 0 < 2*(i:ℤ)+1-h := by omega
   have hC : 0 < (i:ℤ)+1-1-k := by omega
   have hD : 0 < 2*((i:ℤ)+1)+1-k := by omega
   positivity
 have hp := mul_nonneg (mul_nonneg hg (lower_core_nonnegM58E j i h))
   (lower_core_nonnegM58E j (i+1) k)
 change 0 ≤ (_-_)*_ * _ at hp
 rw [←he] at hp
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hpos).mp hp)

theorem lower_core_separatedMAF6 (j i h k : ℕ) (hk : h+2 ≤ k)
 (hh : k ≤ i) (hi : i ≤ j+h+2) :
 lowerCoreM58E j i h*lowerCoreM58E j (i+2) k ≤
 lowerCoreM58E j (i+1) (h+1)*lowerCoreM58E j (i+1) (k-1) := by
 have h0 := lower_core_diagonalMAF6 j i h (by omega) hi
 have h1 := lower_core_diagonalMAF6 j (i+1) (k-1) (by omega) (by omega)
 rw [show k-1+1=k by omega,show i+1+1=i+2 by omega] at h1
 push_cast at h1
 have hg : 0 ≤ diagonalGapMAF6 j i h (k-1:ℕ) := by
   have ht := diagonal_gapMAF6 (h:ℤ) ((k:ℤ)-h-2) ((i:ℤ)-k) ((j:ℤ)-i+h+2)
     (by omega) (by omega) (by omega) (by omega)
   have he : ((k-1:ℕ):ℤ)=(k:ℤ)-1 := by omega
   rw [he]
   convert ht using 1 <;> congr 1 <;> ring
 have he := product_transferMAF6 _ _ _ _ _ _ _ _ h0 h1
 have hpos : 0 < diagonalDenMAF6 j i h*diagonalDenMAF6 j ((i:ℤ)+1) (k-1:ℕ) := by
   unfold diagonalDenMAF6
   have hA : 0 < 2*(i:ℤ)-h := by omega
   have hB : 0 < 2*((i:ℤ)+1)-(k-1:ℕ) := by omega
   positivity
 have hp := mul_nonneg (mul_nonneg hg (lower_core_nonnegM58E j i h))
   (lower_core_nonnegM58E j (i+1) (k-1))
 change 0 ≤ (_-_)*_ * _ at hp
 rw [←he] at hp
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hpos).mp hp)

end
end MathGKM.Markov
