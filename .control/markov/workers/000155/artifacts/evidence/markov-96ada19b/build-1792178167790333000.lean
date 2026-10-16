import MarkovThreeForceM96A
/-! Machine-authored 96ada19b. Signed forcing is not a source refutation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000

theorem sparse_forcing_negativeM96A : threeForceM96A 1 false 0 7 = -2 := by
 decide

theorem sparse_negative_at_sourceM96A :
 InPolygon 3 5 0 7 ∧ coeff (frame [true,false]).mid.p 0 7=1 ∧
 coeff ((S^2-4*V)*(frame [true,false]).mid.p) 0 7 = -2 := by
 have hp : (frame [true,false]).mid.p=threePolyM9E2 1 false :=
   three_path_polynomialM9E2 0 false
 rw [hp,three_sparse_identityM96A,three_force_coeffM96A,sparse_forcing_negativeM96A,
   three_raw_formulaM9E2]
 constructor
 · norm_num [InPolygon]
 constructor
 · decide
 · rfl

theorem sparse_source_vertical_boundaryM96A :
 InPolygon 3 5 0 5 ∧ InPolygon 3 5 0 6 ∧ InPolygon 3 5 0 7 ∧
 coeff (frame [true,false]).mid.p 0 5=1 ∧
 coeff (frame [true,false]).mid.p 0 6=2 ∧
 coeff (frame [true,false]).mid.p 0 7=1 ∧
 coeff (frame [true,false]).mid.p 0 5*coeff (frame [true,false]).mid.p 0 7 ≤
 coeff (frame [true,false]).mid.p 0 6^2 := by
 have hp : (frame [true,false]).mid.p=threePolyM9E2 1 false :=
   three_path_polynomialM9E2 0 false
 rw [hp]
 simp only [three_raw_formulaM9E2]
 decide

end
end MathGKM.Markov
