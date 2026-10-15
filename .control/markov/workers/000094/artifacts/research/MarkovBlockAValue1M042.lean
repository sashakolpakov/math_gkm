import MarkovShiftShapeCC
import MarkovBlockADefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockAValue1M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+3) (2*J+E+11)+shiftShapeCC (J+E+5) (C+5) 3 (J+6))=((blockAP100M042 J E*R^0*C^0 + blockAP101M042 J E*R^0*C^1) + (blockAP102M042 J E*R^0*C^2 + (blockAP103M042 J E*R^0*C^3 + blockAP104M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockAP100M042 blockAP101M042 blockAP102M042 blockAP103M042 blockAP104M042
 ring
end
end MathGKM.Markov
