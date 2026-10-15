import MarkovFourthGapPart0K0B
import MarkovFourthGapPart1K0B
import MarkovFourthGapPart2K0B
import MarkovFourthGapPart3K0B
import MarkovFourthGapPart4K0B
import MarkovFourthGapPart5K0B
import MarkovFourthGapPart6K0B
import MarkovFourthGapPart7K0B
import MarkovFourthGapPart8K0B
/-! Machine-authored request 0b212317. Quartic decomposition for exact gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem fourthGap_factoredK0B (C R J : ℤ) :
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+6)^2-
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+5)*
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+7)=fourthGapPart0K0B C J*R^0 + fourthGapPart1K0B C J*R^1 + fourthGapPart2K0B C J*R^2 + fourthGapPart3K0B C J*R^3 + fourthGapPart4K0B C J*R^4 + fourthGapPart5K0B C J*R^5 + fourthGapPart6K0B C J*R^6 + fourthGapPart7K0B C J*R^7 + fourthGapPart8K0B C J*R^8 := by
 rw [shapeParts0K0B,shapeParts1K0B,shapeParts2K0B]
 rw [fourthGapPart0_eqK0B,fourthGapPart1_eqK0B,fourthGapPart2_eqK0B,fourthGapPart3_eqK0B,fourthGapPart4_eqK0B,fourthGapPart5_eqK0B,fourthGapPart6_eqK0B,fourthGapPart7_eqK0B,fourthGapPart8_eqK0B]
 ring

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
 have hpos : 0≤fourthGapPart0K0B C J*R^0 + fourthGapPart1K0B C J*R^1 + fourthGapPart2K0B C J*R^2 + fourthGapPart3K0B C J*R^3 + fourthGapPart4K0B C J*R^4 + fourthGapPart5K0B C J*R^5 + fourthGapPart6K0B C J*R^6 + fourthGapPart7K0B C J*R^7 + fourthGapPart8K0B C J*R^8 := by positivity
 have ec : C+2=c := by dsimp [C]; ring
 have eh : (C+2)*(J+6)+R+1=h := by dsimp [C,J,R]; ring
 have ej0 : J+5=j-1 := by dsimp [J]; ring
 have ej1 : J+6=j := by dsimp [J]; ring
 have ej2 : J+7=j+1 := by dsimp [J]; ring
 rw [ec,eh,ej0,ej1,ej2] at he
 linarith only [he,hpos]

theorem fourthShape_logConcaveK0B (c h j : ℤ) (hc : 2≤c) (hj : 6≤j)
 (hh : c*(j+1)≤h) :
 fourthShapeK0B c h (j-1)*fourthShapeK0B c h (j+1)≤fourthShapeK0B c h j^2 :=
 fourthShape_logConcaveStrongK0B c h j hc hj (by nlinarith only [hc,hh])
end
end MathGKM.Markov
