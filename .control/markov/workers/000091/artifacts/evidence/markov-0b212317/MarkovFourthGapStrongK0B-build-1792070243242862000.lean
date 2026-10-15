import MarkovFourthGapFactK0B
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 16384
theorem fourthShape_logConcaveStrongK0B (c h j : ℤ) (hc : 2≤c) (hj : 6≤j)
 (hh : c*j+1≤h) :
 fourthShapeK0B c h (j-1)*fourthShapeK0B c h (j+1)≤fourthShapeK0B c h j^2 := by
 let C:=c-2
 let R:=h-c*j-1
 let J:=j-6
 have hC : 0≤C := by dsimp [C]; omega
 have hR : 0≤R := by dsimp [R]; omega
 have hJ : 0≤J := by dsimp [J]; omega
 have he := fourthGap_factoredK0B C R J
 have h0 := fourthGapPart0_nonnegK0B C J hC hJ
 have h1 := fourthGapPart1_nonnegK0B C J hC hJ
 have h2 := fourthGapPart2_nonnegK0B C J hC hJ
 have h3 := fourthGapPart3_nonnegK0B C J hC hJ
 have h4 := fourthGapPart4_nonnegK0B C J hC hJ
 have h5 := fourthGapPart5_nonnegK0B C J hC hJ
 have h6 := fourthGapPart6_nonnegK0B C J hC hJ
 have h7 := fourthGapPart7_nonnegK0B C J hC hJ
 have h8 := fourthGapPart8_nonnegK0B C J hC hJ
 have hpos : 0≤fourthGapPart0K0B C J*R^0 + fourthGapPart1K0B C J*R^1 + fourthGapPart2K0B C J*R^2 + fourthGapPart3K0B C J*R^3 + fourthGapPart4K0B C J*R^4 + fourthGapPart5K0B C J*R^5 + fourthGapPart6K0B C J*R^6 + fourthGapPart7K0B C J*R^7 + fourthGapPart8K0B C J*R^8 := add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (mul_nonneg h0 (pow_nonneg hR 0)) (mul_nonneg h1 (pow_nonneg hR 1))) (mul_nonneg h2 (pow_nonneg hR 2))) (mul_nonneg h3 (pow_nonneg hR 3))) (mul_nonneg h4 (pow_nonneg hR 4))) (mul_nonneg h5 (pow_nonneg hR 5))) (mul_nonneg h6 (pow_nonneg hR 6))) (mul_nonneg h7 (pow_nonneg hR 7))) (mul_nonneg h8 (pow_nonneg hR 8))
 have ec : C+2=c := by dsimp [C]; ring
 have eh : (C+2)*(J+6)+R+1=h := by dsimp [C,J,R]; ring
 have ej0 : J+5=j-1 := by dsimp [J]; ring
 have ej1 : J+6=j := by dsimp [J]; ring
 have ej2 : J+7=j+1 := by dsimp [J]; ring
 rw [eh,ec,ej0,ej1,ej2] at he
 exact sub_nonneg.mp (he.symm ▸ hpos)

theorem fourthShape_logConcaveK0B (c h j : ℤ) (hc : 2≤c) (hj : 6≤j)
 (hh : c*(j+1)≤h) :
 fourthShapeK0B c h (j-1)*fourthShapeK0B c h (j+1)≤fourthShapeK0B c h j^2 :=
 fourthShape_logConcaveStrongK0B c h j hc hj (by nlinarith only [hc,hh])
end
end MathGKM.Markov
