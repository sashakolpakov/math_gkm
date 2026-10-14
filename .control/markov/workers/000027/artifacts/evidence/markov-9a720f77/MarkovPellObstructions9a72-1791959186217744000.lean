import MarkovPellSum9a72
import MarkovPellSummand9a72
/-! Machine-authored 9a720f77. Exact strategy obstructions, NOT refutations
of the pinned raw coefficient conjecture. -/
namespace MathGKM.Markov
noncomputable section

theorem source_three_four_slice9a72 :
 coeff (frame [true,true]).mid.p 3 0=1 ∧
 coeff (frame [true,true]).mid.p 3 1=8 ∧
 coeff (frame [true,true]).mid.p 3 2=26 ∧
 coeff (frame [true,true]).mid.p 3 3=20 := by
 change coeff (frame (List.replicate 2 true)).mid.p 3 0=1 ∧
   coeff (frame (List.replicate 2 true)).mid.p 3 1=8 ∧
   coeff (frame (List.replicate 2 true)).mid.p 3 2=26 ∧
   coeff (frame (List.replicate 2 true)).mid.p 3 3=20
 simp only [right_coeff_sum9a72]
 norm_num [pellSum9a72,Finset.sum_range_succ,Nat.choose]

/-- Failure after division by the cubic row binomial coefficients 1,3,3,1.
The literal raw inequalities 26<=64 and 160<=676 both hold. -/
theorem source_slice_binomial_failure9a72 :
 (coeff (frame [true,true]).mid.p 3 1 : ℚ)^2 <
  3*(coeff (frame [true,true]).mid.p 3 0 : ℚ)*
    (coeff (frame [true,true]).mid.p 3 2 : ℚ) := by
 rw [source_three_four_slice9a72.1,source_three_four_slice9a72.2.1,
   source_three_four_slice9a72.2.2.1]
 norm_num

theorem horizontal_midpoint_failure9a72 :
 horizontalTerm9a72 22 25 19 2*horizontalTerm9a72 22 25 16 4 >
 horizontalTerm9a72 22 25 17 3*horizontalTerm9a72 22 25 18 3 := by
 norm_num [horizontalTerm9a72,Nat.choose]

theorem horizontal_synchronization_failure9a72 :
 horizontalTerm9a72 3 2 0 0*horizontalTerm9a72 3 2 2 2+
 horizontalTerm9a72 3 2 2 0*horizontalTerm9a72 3 2 0 2 >
 2*horizontalTerm9a72 3 2 0 1*horizontalTerm9a72 3 2 2 1 := by
 norm_num [horizontalTerm9a72,Nat.choose]

#print axioms source_three_four_slice9a72
#print axioms source_slice_binomial_failure9a72
#print axioms horizontal_midpoint_failure9a72
#print axioms horizontal_synchronization_failure9a72
end
end MathGKM.Markov
