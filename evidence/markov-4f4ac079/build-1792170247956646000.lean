import MarkovTwoKernelM4F4
import MarkovUniformVerticalM0D3
/-! Machine-authored 4f4ac079. Exact sufficient shape conditions for the
common kernel. The row, column and minor sign premises remain unproved. -/
namespace MathGKM.Markov
noncomputable section

theorem minor_diagonal_glueM4F4 (a b c e f z : ℤ)
 (hb : 0 ≤ b) (hc : 0 < c) (he : 0 ≤ e) (hf : 0 ≤ f) (hz : 0 ≤ z)
 (hrow : a*c ≤ b^2) (hcol : z*c ≤ f^2) (hminor : b*f ≤ e*c) : a*z ≤ e^2 := by
 apply le_of_mul_le_mul_right (b := c^2) ?_ (sq_pos_of_pos hc)
 calc
  a*z*c^2=(a*c)*(z*c) := by ring
  _ ≤ b^2*f^2 := mul_le_mul hrow hcol (mul_nonneg hz hc.le) (sq_nonneg b)
  _ = (b*f)^2 := by ring
  _ ≤ (e*c)^2 := (sq_le_sq₀ (mul_nonneg hb hf) (mul_nonneg he hc.le)).mpr hminor
  _ = e^2*c^2 := by ring

def KernelShapeM4F4 (i : ℕ) : Prop :=
 (∀ j m, twoKernelM4F4 i j m*twoKernelM4F4 i (j+2) m ≤ twoKernelM4F4 i (j+1) m^2) ∧
 (∀ j m, twoKernelM4F4 i j m*twoKernelM4F4 i j (m+2) ≤ twoKernelM4F4 i j (m+1)^2) ∧
 (∀ j m, twoKernelM4F4 i (j+1) m*twoKernelM4F4 i j (m+1) ≤
   twoKernelM4F4 i j m*twoKernelM4F4 i (j+1) (m+1))

theorem kernel_antidiagonal_of_shapeM4F4 (i : ℕ) (h : KernelShapeM4F4 i) (j m : ℕ) :
 twoKernelM4F4 i j (m+2)*twoKernelM4F4 i (j+2) m ≤
 twoKernelM4F4 i (j+1) (m+1)^2 := by
 by_cases hm : m < i-2
 · rw [two_kernel_zeroM4F4 i (j+2) m hm,mul_zero]
   exact sq_nonneg _
 · apply minor_diagonal_glueM4F4
     (twoKernelM4F4 i j (m+2)) (twoKernelM4F4 i (j+1) (m+2))
     (twoKernelM4F4 i (j+2) (m+2)) (twoKernelM4F4 i (j+1) (m+1))
     (twoKernelM4F4 i (j+2) (m+1)) (twoKernelM4F4 i (j+2) m)
   · exact two_kernel_nonnegM4F4 _ _ _
   · exact two_kernel_posM4F4 _ _ _ (by omega)
   · exact two_kernel_nonnegM4F4 _ _ _
   · exact two_kernel_nonnegM4F4 _ _ _
   · exact two_kernel_nonnegM4F4 _ _ _
   · exact h.1 j (m+2)
   · exact h.2.1 (j+2) m
   · simpa [Nat.add_assoc,mul_comm] using h.2.2 (j+1) (m+1)

theorem source_two_vertical_of_shapeM4F4 (i : ℕ) (hi : 4 ≤ i)
 (h : KernelShapeM4F4 i) (path : List Bool) (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 :=
 source_two_vertical_of_kernelM4F4 i hi (kernel_antidiagonal_of_shapeM4F4 i h) path ha j

theorem root_of_uniform_kernel_shapeM4F4
 (hs : ∀ i : ℕ, 5 ≤ i → KernelShapeM4F4 i)
 (ho : OtherVerticalCoreM0D3) : Conjecture63 := by
 apply root_iff_uniform_verticalM0D3.mpr
 refine ⟨?_,ho⟩
 intro i hi
 apply (vertical_regions_iff_sourceM0D3 i (by omega)).mpr
 exact source_two_vertical_of_shapeM4F4 i (by omega) (hs i hi)
end
end MathGKM.Markov
