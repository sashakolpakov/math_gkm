import MarkovLowerUniformME9C
/-! Machine-authored e9cdd527. The auxiliary lower kernel must not be
extended beyond its proved source region or positivity wedge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

theorem lower_kernel_outside_negativeME9C : lowerKernelME9C 4 3 0= -29 := by
 norm_num [lowerKernelME9C,lowerRawME9C,solve_disc_stepM96A,lowerForceME9C,
   addSRawM9E2,shiftRawM9E2,fibDeltaME9C,fibRawM9E2]

theorem lower_kernel_outside_sourceME9C :
 InPolygon 3 5 4 3 ∧ coeff (frame [true,false]).mid.p 4 3=35 ∧
 lowerKernelME9C 4 3 0= -29 ∧ ¬(2*3+3 ≤ 4+0) := by
 have hp : (frame [true,false]).mid.p=threePolyM9E2 1 false :=
   three_path_polynomialM9E2 0 false
 rw [hp,three_raw_formulaM9E2,lower_kernel_outside_negativeME9C]
 simp only [InPolygon]
 decide

end
end MathGKM.Markov
