import MarkovOffsetCoreMAF6
import MarkovOffsetWeightsMAF6
/-! Machine-authored af6200bf. Global shifted min/max bound, retaining all zeros. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem lower_term_shiftedMAF6 (j d i h k : ℕ) (hj : 2 ≤ j) :
 lowerTermM58E j d i h*lowerTermM58E j d (i+2) k ≤
 lowerTermM58E j d (i+1) (min (h+1) k)*
 lowerTermM58E j d (i+1) (max (h+1) k-1) := by
 by_cases hz0 : lowerTermM58E j d i h=0
 · rw [hz0,zero_mul]
   exact mul_nonneg (lower_term_nonnegM58E _ _ _ _) (lower_term_nonnegM58E _ _ _ _)
 by_cases hz2 : lowerTermM58E j d (i+2) k=0
 · rw [hz2,mul_zero]
   exact mul_nonneg (lower_term_nonnegM58E _ _ _ _) (lower_term_nonnegM58E _ _ _ _)
 obtain ⟨hh,hi,hd⟩ := lower_term_supportMAF6 j d i h hz0
 obtain ⟨hk,hj',kd⟩ := lower_term_supportMAF6 j d (i+2) k hz2
 by_cases hkh : k ≤ h
 · rw [min_eq_right (by omega : k ≤ h+1),max_eq_left (by omega : k ≤ h+1),
     Nat.add_sub_cancel]
   have hc := lower_core_orderedMAF6 j i h k hkh hh (by omega)
   simp only [lowerTermM58E,if_pos (by omega : h < i-1),
     if_pos (by omega : k < i+2-1),if_pos (by omega : k < i+1-1),
     if_pos (by omega : h < i+1-1)]
   have hw : 0 ≤ ((2*d).choose h:ℤ)*((2*d).choose k:ℤ) := by positivity
   calc
    _ = (((2*d).choose h:ℤ)*((2*d).choose k:ℤ))*
      (lowerCoreM58E j i h*lowerCoreM58E j (i+2) k) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hc hw
    _ = _ := by ring
 · rw [min_eq_left (by omega : h+1 ≤ k),max_eq_right (by omega : h+1 ≤ k)]
   by_cases he : k=h+1
   · subst k
     simpa [mul_comm] using lower_term_localM58E j d i h hj
   have hc := lower_core_separatedMAF6 j i h k (by omega) (by omega) hi
   have hw := choose_inwardMAF6 (2*d) h k (by omega)
   simp only [lowerTermM58E,if_pos (by omega : h < i-1),
     if_pos (by omega : k < i+2-1),if_pos (by omega : h+1 < i+1-1),
     if_pos (by omega : k-1 < i+1-1)]
   have hwp : 0 ≤ ((2*d).choose h:ℤ)*((2*d).choose k:ℤ) := by positivity
   have hcp : 0 ≤ lowerCoreM58E j (i+1) (h+1)*lowerCoreM58E j (i+1) (k-1) :=
     mul_nonneg (lower_core_nonnegM58E _ _ _) (lower_core_nonnegM58E _ _ _)
   calc
    _ = (((2*d).choose h:ℤ)*((2*d).choose k:ℤ))*
      (lowerCoreM58E j i h*lowerCoreM58E j (i+2) k) := by ring
    _ ≤ (((2*d).choose h:ℤ)*((2*d).choose k:ℤ))*
      (lowerCoreM58E j (i+1) (h+1)*lowerCoreM58E j (i+1) (k-1)) :=
        mul_le_mul_of_nonneg_left hc hwp
    _ ≤ _ := mul_le_mul_of_nonneg_right hw hcp
    _ = _ := by ring

end
end MathGKM.Markov
