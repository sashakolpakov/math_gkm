import MarkovFirstCorrectionPolynomialMAE9
/-! Machine-authored c9f23b44. A failed sufficient mixed-gap criterion on
the actual first correction row. This does not refute source log-concavity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem first_correction_valuesMC9F :
 threeRawM9E2 2 false 2 3=4 ∧ threeRawM9E2 2 false 3 3=108 ∧
 threeRawM9E2 2 false 4 3=412 := by
 unfold threeRawM9E2
 decide +kernel

theorem correction_partsMC9F :
 lowerRawME9C 8 2 3=0 ∧ lowerRawME9C 8 3 3=104 ∧ lowerRawME9C 8 4 3=412 ∧
 firstCorrectionM1BB 2 false 2=4 ∧ firstCorrectionM1BB 2 false 3=4 ∧
 firstCorrectionM1BB 2 false 4=0 := by
 have h2 : threeRawM9E2 2 false 2 3=lowerRawME9C 8 2 3+4 :=
   first_row_sourceM1BB 2 2 false (by omega)
 have h3 : threeRawM9E2 2 false 3 3=lowerRawME9C 8 3 3+4 :=
   first_row_sourceM1BB 2 3 false (by omega)
 have h4 : threeRawM9E2 2 false 4 3=lowerRawME9C 8 4 3+0 :=
   first_row_sourceM1BB 2 4 false (by omega)
 rcases first_correction_valuesMC9F with ⟨v2,v3,v4⟩
 exact ⟨by omega,by omega,by omega,by decide,by decide,by decide⟩

theorem correction_mixed_negativeMC9F :
 2*lowerRawME9C 8 3 3*firstCorrectionM1BB 2 false 3-
 lowerRawME9C 8 2 3*firstCorrectionM1BB 2 false 4-
 firstCorrectionM1BB 2 false 2*lowerRawME9C 8 4 3 = -816 := by
 rcases correction_partsMC9F with ⟨h2,h3,h4,c2,c3,c4⟩
 rw [h2,h3,h4,c2,c3,c4]
 norm_num

theorem correction_source_not_refutedMC9F :
 (frame [false,true,false]).mid.a=3 ∧ (frame [false,true,false]).mid.b=8 ∧
 InPolygon 3 8 2 3 ∧ InPolygon 3 8 3 3 ∧ InPolygon 3 8 4 3 ∧
 coeff (frame [false,true,false]).mid.p 2 3=4 ∧
 coeff (frame [false,true,false]).mid.p 3 3=108 ∧
 coeff (frame [false,true,false]).mid.p 4 3=412 ∧
 coeff (frame [false,true,false]).mid.p 2 3*
   coeff (frame [false,true,false]).mid.p 4 3 <
   coeff (frame [false,true,false]).mid.p 3 3^2 := by
 have hp : (frame [false,true,false]).mid.p=threePolyM9E2 2 false :=
   three_path_polynomialM9E2 1 false
 rw [hp]
 simp only [three_raw_formulaM9E2]
 rcases first_correction_valuesMC9F with ⟨v2,v3,v4⟩
 rw [v2,v3,v4]
 norm_num [frame,initial,advance,InPolygon]

end
end MathGKM.Markov
