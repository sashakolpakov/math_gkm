import MarkovThirdSmallCoeff41M762
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird41cross2_5M762 (u v : ℤ) (hu : 0≤u) (hv : 0≤v) :
 sThird41EM762 (5+u) ((15+2*u)-1)*sThird41EM762 (5+u) ((15+2*u)+1) ≤ sThird41EM762 (5+u) (15+2*u)^2 := by
 unfold sThird41EM762
 rw [vFall_polyM115 (((15+2*u)-1)-0*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-0*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-0*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-1*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-1*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-1*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-1*(5+u)) 6 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-2*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-2*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-2*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-2*(5+u)) 6 (by omega)]
 rw [vFall_polyM115 (((15+2*u)-1)-2*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 8 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)-1)-3*(5+u)) 9 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-0*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-0*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-0*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-1*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-1*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-1*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-1*(5+u)) 6 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-2*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-2*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-2*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-2*(5+u)) 6 (by omega)]
 rw [vFall_polyM115 (((15+2*u)+1)-2*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 8 (by omega)]
 rw [vFall_zeroM115 (((15+2*u)+1)-3*(5+u)) 9 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-0*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-0*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-0*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-1*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-1*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-1*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-1*(5+u)) 6 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-2*(5+u)) 3 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-2*(5+u)) 4 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-2*(5+u)) 5 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-2*(5+u)) 6 (by omega)]
 rw [vFall_polyM115 ((15+2*u)-2*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 3 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 4 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 5 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 6 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 7 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 8 (by omega)]
 rw [vFall_zeroM115 ((15+2*u)-3*(5+u)) 9 (by omega)]
 apply sub_nonneg.mp
 simp only [sThird41c0_3M762,sThird41c0_4M762,sThird41c0_5M762,sThird41c1_3M762,sThird41c1_4M762,sThird41c1_5M762,sThird41c1_6M762,sThird41c2_3M762,sThird41c2_4M762,sThird41c2_5M762,sThird41c2_6M762,sThird41c2_7M762,sThird41c3_3M762,sThird41c3_4M762,sThird41c3_5M762,sThird41c3_6M762,sThird41c3_7M762,sThird41c3_8M762,sThird41c3_9M762]
 ring_nf <;> positivity
end
end MathGKM.Markov
