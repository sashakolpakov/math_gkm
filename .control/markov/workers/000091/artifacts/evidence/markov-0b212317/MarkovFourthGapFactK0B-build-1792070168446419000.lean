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
 simp only [shapeParts0K0B C R J,shapeParts1K0B C R J,shapeParts2K0B C R J]
 rw [fourthGapPart0_eqK0B,fourthGapPart1_eqK0B,fourthGapPart2_eqK0B,fourthGapPart3_eqK0B,fourthGapPart4_eqK0B,fourthGapPart5_eqK0B,fourthGapPart6_eqK0B,fourthGapPart7_eqK0B,fourthGapPart8_eqK0B]
 ring

end
end MathGKM.Markov
