import MarkovThirdSmallCoeff31MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird31zeroMF8 (q j : ℤ) (hq : 1≤q) (hj : j≤0) : sThird31EMF8 q j=0 := by
 unfold sThird31EMF8
 rw [vFall_zeroM115 (j-0*q) 2 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 7 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 8 (by omega)]
 simp only [sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8]
 ring
theorem sThird31pastMF8 (q j : ℤ) (hq : 1≤q) (hj : 3*q+7≤j) : sThird31EMF8 q j=0 := by
 unfold sThird31EMF8
 rw [vFall_polyM115 (j-0*q) 2 (by omega)]
 rw [vFall_polyM115 (j-0*q) 3 (by omega)]
 rw [vFall_polyM115 (j-0*q) 4 (by omega)]
 rw [vFall_polyM115 (j-1*q) 3 (by omega)]
 rw [vFall_polyM115 (j-1*q) 4 (by omega)]
 rw [vFall_polyM115 (j-1*q) 5 (by omega)]
 rw [vFall_polyM115 (j-2*q) 3 (by omega)]
 rw [vFall_polyM115 (j-2*q) 4 (by omega)]
 rw [vFall_polyM115 (j-2*q) 5 (by omega)]
 rw [vFall_polyM115 (j-2*q) 6 (by omega)]
 rw [vFall_polyM115 (j-3*q) 3 (by omega)]
 rw [vFall_polyM115 (j-3*q) 4 (by omega)]
 rw [vFall_polyM115 (j-3*q) 5 (by omega)]
 rw [vFall_polyM115 (j-3*q) 6 (by omega)]
 rw [vFall_polyM115 (j-3*q) 7 (by omega)]
 rw [vFall_polyM115 (j-3*q) 8 (by omega)]
 simp only [sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8]
 ring
end
end MathGKM.Markov
