import MarkovBlockBValue0M042
import MarkovBlockBValue1M042
import MarkovBlockBValue2M042
import MarkovBlockBGap0M042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockBChartM042 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :
 0≤(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+2) (2*J+E+11)+shiftShapeCC (J+E+5) (C+5) 2 (J+6))^2-(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+2) (2*J+E+10)+shiftShapeCC (J+E+5) (C+5) 2 (J+5))*(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+2) (2*J+E+12)+shiftShapeCC (J+E+5) (C+5) 2 (J+7)) := by
 rw [blockBValue0M042,blockBValue1M042,blockBValue2M042]
 have he : ((blockBP100M042 J E*R^0*C^0 + blockBP101M042 J E*R^0*C^1) + (blockBP102M042 J E*R^0*C^2 + (blockBP103M042 J E*R^0*C^3 + blockBP104M042 J E*R^0*C^4)))^2-((blockBP000M042 J E*R^0*C^0 + blockBP001M042 J E*R^0*C^1) + (blockBP002M042 J E*R^0*C^2 + (blockBP003M042 J E*R^0*C^3 + blockBP004M042 J E*R^0*C^4)))*((blockBP200M042 J E*R^0*C^0 + blockBP201M042 J E*R^0*C^1) + (blockBP202M042 J E*R^0*C^2 + (blockBP203M042 J E*R^0*C^3 + blockBP204M042 J E*R^0*C^4)))=
 (((blockBG00M042 J E*R^0*C^0 + blockBG01M042 J E*R^0*C^1) + (blockBG02M042 J E*R^0*C^2 + blockBG03M042 J E*R^0*C^3)) + ((blockBG04M042 J E*R^0*C^4 + blockBG05M042 J E*R^0*C^5) + (blockBG06M042 J E*R^0*C^6 + (blockBG07M042 J E*R^0*C^7 + blockBG08M042 J E*R^0*C^8)))) := by
  unfold blockBG00M042 blockBG01M042 blockBG02M042 blockBG03M042 blockBG04M042 blockBG05M042 blockBG06M042 blockBG07M042 blockBG08M042
  ring
 rw [he]
 have hp00 := blockBG00M042_nonneg J E hJ hE
 have hp01 := blockBG01M042_nonneg J E hJ hE
 have hp02 := blockBG02M042_nonneg J E hJ hE
 have hp03 := blockBG03M042_nonneg J E hJ hE
 have hp04 := blockBG04M042_nonneg J E hJ hE
 have hp05 := blockBG05M042_nonneg J E hJ hE
 have hp06 := blockBG06M042_nonneg J E hJ hE
 have hp07 := blockBG07M042_nonneg J E hJ hE
 have hp08 := blockBG08M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
