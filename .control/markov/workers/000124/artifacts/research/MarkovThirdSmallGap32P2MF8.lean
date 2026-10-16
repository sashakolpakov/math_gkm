import MarkovThirdSmallCoeff32MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird32first3MF8 (u v : ℤ) (hu : 0≤u) (hv : 0≤v) :
 sThird32EMF8 (5+u) ((3)-1)*sThird32EMF8 (5+u) ((3)+1) ≤ sThird32EMF8 (5+u) (3)^2 := by
 unfold sThird32EMF8
 rw [vFall_polyM115 (((3)-1)-0*(5+u)) 1 (by omega)]
 rw [vFall_polyM115 (((3)-1)-0*(5+u)) 2 (by omega)]
 rw [vFall_polyM115 (((3)-1)-0*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-1*(5+u)) 2 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-1*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-1*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-2*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-2*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-2*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-2*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((3)-1)-3*(5+u)) 8 (by omega)]
 rw [vFall_polyM115 (((3)+1)-0*(5+u)) 1 (by omega)]
 rw [vFall_polyM115 (((3)+1)-0*(5+u)) 2 (by omega)]
 rw [vFall_polyM115 (((3)+1)-0*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-1*(5+u)) 2 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-1*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-1*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-2*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-2*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-2*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-2*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((3)+1)-3*(5+u)) 8 (by omega)]
 rw [vFall_polyM115 ((3)-0*(5+u)) 1 (by omega)]
 rw [vFall_polyM115 ((3)-0*(5+u)) 2 (by omega)]
 rw [vFall_polyM115 ((3)-0*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((3)-1*(5+u)) 2 (by omega)]
 rw [vFall_zeroM115 ((3)-1*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((3)-1*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 ((3)-2*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((3)-2*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 ((3)-2*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 ((3)-2*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 ((3)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((3)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 ((3)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 ((3)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 ((3)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 ((3)-3*(5+u)) 8 (by omega)]
 apply sub_nonneg.mp
 simp only [sThird32c0_1MF8,sThird32c0_2MF8,sThird32c0_3MF8,sThird32c1_2MF8,sThird32c1_3MF8,sThird32c1_4MF8,sThird32c2_3MF8,sThird32c2_4MF8,sThird32c2_5MF8,sThird32c2_6MF8,sThird32c3_3MF8,sThird32c3_4MF8,sThird32c3_5MF8,sThird32c3_6MF8,sThird32c3_7MF8,sThird32c3_8MF8]
 ring_nf <;> positivity
end
end MathGKM.Markov
