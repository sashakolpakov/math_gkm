import MarkovTwoKernelSourceMED6
/-! Machine-authored ed6bdbeb. Exact root reduction with explicit high-column
kernels. Columns zero through two retain the actual source coefficients. -/
namespace MathGKM.Markov
noncomputable section

def kernelRawMED6 (q : ℕ) (r : Bool) (i j : ℕ) : ℝ :=
 if 3≤i then baseValueM13E q r i j+correctionValueM13E q r i j
 else (threeRawM9E2 q r i j:ℝ)

theorem kernel_raw_eqMED6 (q : ℕ) (r : Bool) (i j : ℕ) (hq : 1≤q) :
 kernelRawMED6 q r i j=(threeRawM9E2 q r i j:ℝ) := by
 unfold kernelRawMED6
 split_ifs with hi
 · exact (source_two_kernelMED6 q i j r hq hi).symm
 · rfl

def ThreeKernelTriangleMED6 : Prop := ∀ q : ℕ, 1≤q → ∀ r,
 (∀ i j, 4≤i → q<j+2 → j+q<sourceNME9C q r → ¬(i=4 ∧ j+1≤q) →
   ¬(sourceNME9C q r<i+j+q ∧ sourceNME9C q r+2≤i+2*j) →
   kernelRawMED6 q r i j*kernelRawMED6 q r i (j+2)≤kernelRawMED6 q r i (j+1)^2) ∧
 (∀ i j, 1≤i → q<j+2 → j+q<sourceNME9C q r →
   ¬(4≤i ∧ sourceNME9C q r<i+j+q+2 ∧ sourceNME9C q r≤i+2*j) →
   ¬(i=3 ∧ sourceNME9C q r≤2*j ∧ sourceNME9C q r<i+j+q+2) →
   kernelRawMED6 q r i (j+2)*kernelRawMED6 q r (i+2) j≤
     kernelRawMED6 q r (i+1) (j+1)^2)

theorem kernel_triangle_iffMED6 : ThreeKernelTriangleMED6 ↔ ThreeTriangleResidualM50C := by
 constructor
 · intro h q hq r
   have hh := h q hq r
   simp only [kernel_raw_eqMED6 q r _ _ hq] at hh
   constructor
   · intro i j hi hj ht he hc
     exact_mod_cast hh.1 i j hi hj ht he hc
   · intro i j hi hj ht hc he
     exact_mod_cast hh.2 i j hi hj ht hc he
 · intro h q hq r
   simp only [kernel_raw_eqMED6 q r _ _ hq]
   constructor
   · intro i j hi hj ht he hc
     exact_mod_cast (h q hq r).1 i j hi hj ht he hc
   · intro i j hi hj ht hc he
     exact_mod_cast (h q hq r).2 i j hi hj ht hc he

theorem root_iff_kernel_triangleMED6 :
 Conjecture63 ↔ ThreeKernelTriangleMED6 ∧ OtherFourM9E2 := by
 rw [kernel_triangle_iffMED6,root_iff_triangleM50C]

end
end MathGKM.Markov
