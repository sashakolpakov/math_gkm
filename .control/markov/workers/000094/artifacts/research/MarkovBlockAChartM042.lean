import MarkovBlockAGap0M042
import MarkovBlockAValue0M042
import MarkovBlockAValue1M042
import MarkovBlockAValue2M042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockAChartM042 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :
 0≤(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+3) (2*J+E+11)+shiftShapeCC (J+E+5) (C+5) 3 (J+6))^2-(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+3) (2*J+E+10)+shiftShapeCC (J+E+5) (C+5) 3 (J+5))*(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+3) (2*J+E+12)+shiftShapeCC (J+E+5) (C+5) 3 (J+7)) := by
 rw [blockAValue0M042,blockAValue1M042,blockAValue2M042]
 have he : ((blockAP100M042 J E*R^0*C^0 + blockAP101M042 J E*R^0*C^1) + (blockAP102M042 J E*R^0*C^2 + (blockAP103M042 J E*R^0*C^3 + blockAP104M042 J E*R^0*C^4)))^2-((blockAP000M042 J E*R^0*C^0 + blockAP001M042 J E*R^0*C^1) + (blockAP002M042 J E*R^0*C^2 + (blockAP003M042 J E*R^0*C^3 + blockAP004M042 J E*R^0*C^4)))*((blockAP200M042 J E*R^0*C^0 + blockAP201M042 J E*R^0*C^1) + (blockAP202M042 J E*R^0*C^2 + (blockAP203M042 J E*R^0*C^3 + blockAP204M042 J E*R^0*C^4)))=
 (((blockAG00M042 J E*R^0*C^0 + blockAG01M042 J E*R^0*C^1) + (blockAG02M042 J E*R^0*C^2 + blockAG03M042 J E*R^0*C^3)) + ((blockAG04M042 J E*R^0*C^4 + blockAG05M042 J E*R^0*C^5) + (blockAG06M042 J E*R^0*C^6 + (blockAG07M042 J E*R^0*C^7 + blockAG08M042 J E*R^0*C^8)))) := by
  unfold blockAG00M042 blockAG01M042 blockAG02M042 blockAG03M042 blockAG04M042 blockAG05M042 blockAG06M042 blockAG07M042 blockAG08M042
  ring
 rw [he]
 have hp00 := blockAG00M042_nonneg J E hJ hE
 have hp01 := blockAG01M042_nonneg J E hJ hE
 have hp02 := blockAG02M042_nonneg J E hJ hE
 have hp03 := blockAG03M042_nonneg J E hJ hE
 have hp04 := blockAG04M042_nonneg J E hJ hE
 have hp05 := blockAG05M042_nonneg J E hJ hE
 have hp06 := blockAG06M042_nonneg J E hJ hE
 have hp07 := blockAG07M042_nonneg J E hJ hE
 have hp08 := blockAG08M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
