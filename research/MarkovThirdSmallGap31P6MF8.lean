import MarkovThirdSmallCoeff31MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird31cross1_2MF8 (u v : ℤ) (hu : 0≤u) (hv : 0≤v) :
 sThird31EMF8 (5+u) ((7+u)-1)*sThird31EMF8 (5+u) ((7+u)+1) ≤ sThird31EMF8 (5+u) (7+u)^2 := by
 unfold sThird31EMF8
 rw [vFall_polyM115 (((7+u)-1)-0*(5+u)) 2 (by omega)]
 rw [vFall_polyM115 (((7+u)-1)-0*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((7+u)-1)-0*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((7+u)-1)-1*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((7+u)-1)-1*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((7+u)-1)-1*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-2*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-2*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-2*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-2*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((7+u)-1)-3*(5+u)) 8 (by omega)]
 rw [vFall_polyM115 (((7+u)+1)-0*(5+u)) 2 (by omega)]
 rw [vFall_polyM115 (((7+u)+1)-0*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((7+u)+1)-0*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((7+u)+1)-1*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((7+u)+1)-1*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((7+u)+1)-1*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-2*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-2*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-2*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-2*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((7+u)+1)-3*(5+u)) 8 (by omega)]
 rw [vFall_polyM115 ((7+u)-0*(5+u)) 2 (by omega)]
 rw [vFall_polyM115 ((7+u)-0*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 ((7+u)-0*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 ((7+u)-1*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 ((7+u)-1*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 ((7+u)-1*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 ((7+u)-2*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((7+u)-2*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 ((7+u)-2*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 ((7+u)-2*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 ((7+u)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((7+u)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 ((7+u)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 ((7+u)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 ((7+u)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 ((7+u)-3*(5+u)) 8 (by omega)]
 apply sub_nonneg.mp
 simp only [sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8]
 ring_nf <;> positivity
end
end MathGKM.Markov
