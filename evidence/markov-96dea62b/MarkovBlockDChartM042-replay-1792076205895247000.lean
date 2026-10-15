import MarkovBlockDValue0M042
import MarkovBlockDValue1M042
import MarkovBlockDValue2M042
import MarkovBlockDGap0M042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockDChartM042 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :
 0≤(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+1) (2*J+E+11)+shiftShapeCC (J+E+5) (C+5) 1 (J+6))^2-(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+1) (2*J+E+10)+shiftShapeCC (J+E+5) (C+5) 1 (J+5))*(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+1) (2*J+E+12)+shiftShapeCC (J+E+5) (C+5) 1 (J+7)) := by
 rw [blockDValue0M042,blockDValue1M042,blockDValue2M042]
 have he : ((blockDP100M042 J E*R^0*C^0 + blockDP101M042 J E*R^0*C^1) + (blockDP102M042 J E*R^0*C^2 + (blockDP103M042 J E*R^0*C^3 + blockDP104M042 J E*R^0*C^4)))^2-((blockDP000M042 J E*R^0*C^0 + blockDP001M042 J E*R^0*C^1) + (blockDP002M042 J E*R^0*C^2 + (blockDP003M042 J E*R^0*C^3 + blockDP004M042 J E*R^0*C^4)))*((blockDP200M042 J E*R^0*C^0 + blockDP201M042 J E*R^0*C^1) + (blockDP202M042 J E*R^0*C^2 + (blockDP203M042 J E*R^0*C^3 + blockDP204M042 J E*R^0*C^4)))=
 (((blockDG00M042 J E*R^0*C^0 + blockDG01M042 J E*R^0*C^1) + (blockDG02M042 J E*R^0*C^2 + blockDG03M042 J E*R^0*C^3)) + ((blockDG04M042 J E*R^0*C^4 + blockDG05M042 J E*R^0*C^5) + (blockDG06M042 J E*R^0*C^6 + (blockDG07M042 J E*R^0*C^7 + blockDG08M042 J E*R^0*C^8)))) := by
  unfold blockDG00M042 blockDG01M042 blockDG02M042 blockDG03M042 blockDG04M042 blockDG05M042 blockDG06M042 blockDG07M042 blockDG08M042
  ring
 rw [he]
 have hp00 := blockDG00M042_nonneg J E hJ hE
 have hp01 := blockDG01M042_nonneg J E hJ hE
 have hp02 := blockDG02M042_nonneg J E hJ hE
 have hp03 := blockDG03M042_nonneg J E hJ hE
 have hp04 := blockDG04M042_nonneg J E hJ hE
 have hp05 := blockDG05M042_nonneg J E hJ hE
 have hp06 := blockDG06M042_nonneg J E hJ hE
 have hp07 := blockDG07M042_nonneg J E hJ hE
 have hp08 := blockDG08M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
