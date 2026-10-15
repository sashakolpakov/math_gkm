import MarkovBlockADefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockAValue2M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+3) (2*J+E+12)+shiftShapeCC (J+E+5) (C+5) 3 (J+7))=((blockAP200M042 J E*R^0*C^0 + blockAP201M042 J E*R^0*C^1) + (blockAP202M042 J E*R^0*C^2 + (blockAP203M042 J E*R^0*C^3 + blockAP204M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockAP200M042 blockAP201M042 blockAP202M042 blockAP203M042 blockAP204M042
 ring
end
end MathGKM.Markov
