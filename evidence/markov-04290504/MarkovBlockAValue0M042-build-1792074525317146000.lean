import MarkovShiftShapeCC
import MarkovBlockADefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockAValue0M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+3) (2*J+E+10)+shiftShapeCC (J+E+5) (C+5) 3 (J+5))=((blockAP000M042 J E*R^0*C^0 + blockAP001M042 J E*R^0*C^1) + (blockAP002M042 J E*R^0*C^2 + (blockAP003M042 J E*R^0*C^3 + blockAP004M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockAP000M042 blockAP001M042 blockAP002M042 blockAP003M042 blockAP004M042
 ring
end
end MathGKM.Markov
