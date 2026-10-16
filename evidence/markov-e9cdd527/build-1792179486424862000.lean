import MarkovLowSourceME9C
/-! Machine-authored e9cdd527. Actual source witness against extending the
lower expression without its row bound. The source still satisfies raw LC. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000

theorem lower_extension_failureME9C :
 coeff (frame [true,true]).mid.p 4 2=15 ∧ lowerCandidateM96A 1 2 0=7 ∧
 (coeff (frame [true,true]).mid.p 4 2:ℚ)≠lowerCandidateM96A 1 2 0 := by
 have hp : (frame [true,true]).mid.p=threePolyM9E2 1 true :=
   three_path_polynomialM9E2 0 true
 rw [hp,three_raw_formulaM9E2]
 norm_num [lowerCandidateM96A,lowerCoreM96A]
 decide

theorem lower_limit_valid_sourceME9C :
 (frame [true,true]).mid.a=3 ∧ (frame [true,true]).mid.b=4 ∧
 InPolygon 3 4 4 0 ∧ InPolygon 3 4 4 1 ∧ InPolygon 3 4 4 2 ∧
 coeff (frame [true,true]).mid.p 4 0=3 ∧
 coeff (frame [true,true]).mid.p 4 1=14 ∧
 coeff (frame [true,true]).mid.p 4 2=15 ∧
 coeff (frame [true,true]).mid.p 4 0*coeff (frame [true,true]).mid.p 4 2 <
 coeff (frame [true,true]).mid.p 4 1^2 := by
 have hp : (frame [true,true]).mid.p=threePolyM9E2 1 true :=
   three_path_polynomialM9E2 0 true
 rw [hp]
 simp only [three_raw_formulaM9E2,InPolygon,frame,initial,advance]
 decide

end
end MathGKM.Markov
