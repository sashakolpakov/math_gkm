import MarkovKernelProofMDB9
import MarkovVerticalTwoAllMEA
/-! Machine-authored db972d62. Every vertical raw triple of every numerator-two source. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_two_vertical_ge_threeMDB9 (path : List Bool) (ha : (frame path).mid.a=2)
 (i j : ℕ) (hi : 3 ≤ i) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2)≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hj : j+2≤2*q
 · rw [source_two_kernelM4F4 path q i j ha hb hi (by omega),
     source_two_kernelM4F4 path q i (j+2) ha hb hi hj,
     source_two_kernelM4F4 path q i (j+1) ha hb hi (by omega)]
   convert kernel_antidiagonal_of_shapeM4F4 i (kernel_shapeMDB9 i) j (2*q-j-2) using 1 <;>
     congr 2 <;> omega
 · rw [source_two_kernel_outsideM4F4 path q i (j+2) ha hb hi (by omega),mul_zero]
   exact sq_nonneg _

theorem source_two_vertical_allMDB9 (path : List Bool) (ha : (frame path).mid.a=2)
 (i j : ℕ) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2)≤
 coeff (frame path).mid.p i (j+1)^2 := by
 by_cases hi : i≤2
 · exact vertical_first_threeMEA path i j hi
 · exact source_two_vertical_ge_threeMDB9 path ha i j (by omega)

end
end MathGKM.Markov
