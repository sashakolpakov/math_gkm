import MarkovLowerUniformME9C
import MarkovKernelShapeM4F4
/-! Machine-authored e9cdd527. Conditional transfer of a proposed lower
kernel shape. Every domain bound is explicit; shape remains unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def LowerShapeME9C (i : ℕ) : Prop :=
 (∀ j k, 2*j+3 ≤ i+k → 0 < lowerKernelME9C i j k) ∧
 (∀ j k, 2*j+7 ≤ i+k → lowerKernelME9C i j k*lowerKernelME9C i (j+2) k ≤
   lowerKernelME9C i (j+1) k^2) ∧
 (∀ j k, 2*j+3 ≤ i+k → lowerKernelME9C i j k*lowerKernelME9C i j (k+2) ≤
   lowerKernelME9C i j (k+1)^2) ∧
 (∀ j k, 2*j+5 ≤ i+k → lowerKernelME9C i (j+1) k*lowerKernelME9C i j (k+1) ≤
   lowerKernelME9C i j k*lowerKernelME9C i (j+1) (k+1))

theorem lower_antidiagonal_of_shapeME9C (i j k : ℕ) (h : LowerShapeME9C i)
 (hk : 2*j+7 ≤ i+k) :
 lowerKernelME9C i j (k+2)*lowerKernelME9C i (j+2) k ≤
 lowerKernelME9C i (j+1) (k+1)^2 := by
 apply minor_diagonal_glueM4F4
   (lowerKernelME9C i j (k+2)) (lowerKernelME9C i (j+1) (k+2))
   (lowerKernelME9C i (j+2) (k+2)) (lowerKernelME9C i (j+1) (k+1))
   (lowerKernelME9C i (j+2) (k+1)) (lowerKernelME9C i (j+2) k)
 · exact (h.1 _ _ (by omega)).le
 · exact h.1 _ _ (by omega)
 · exact (h.1 _ _ (by omega)).le
 · exact (h.1 _ _ (by omega)).le
 · exact (h.1 _ _ (by omega)).le
 · exact h.2.1 j (k+2) (by omega)
 · exact h.2.2.1 (j+2) k (by omega)
 · simpa [Nat.add_assoc,mul_comm] using h.2.2.2 (j+1) (k+1) (by omega)

theorem three_raw_degreeME9C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hij : sourceNME9C q r+2 < i+j) : threeRawM9E2 q r i j=0 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2]
 apply raw_outside_polygon18
 rw [(three_path_labelsM9E2 n r).1,(three_path_labelsM9E2 n r).2]
 intro h
 have hh := h.2
 unfold sourceNME9C at hij
 omega

theorem source_lower_vertical_of_shapeME9C
 (hs : ∀ i : ℕ, 3 ≤ i → LowerShapeME9C i)
 (q i j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 have hq : 1 ≤ q := by omega
 by_cases hi : i ≤ 2
 · rw [source_three_low_zeroME9C q i j r hq hi (by omega),zero_mul]
   exact sq_nonneg _
 by_cases hn : i+j ≤ sourceNME9C q r
 · let k := sourceNME9C q r-i-j
   have he : i+j+k=sourceNME9C q r := by dsimp [k]; omega
   have hbound : 3*j+7 ≤ sourceNME9C q r := by
     cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] <;> omega
   rw [source_lower_kernelME9C q i j (k+2) r (by omega) (by omega),
     source_lower_kernelME9C q i (j+2) k r hj (by omega),
     source_lower_kernelME9C q i (j+1) (k+1) r (by omega) (by omega)]
   exact lower_antidiagonal_of_shapeME9C i j k (hs i (by omega)) (by omega)
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),mul_zero]
   exact sq_nonneg _

end
end MathGKM.Markov
