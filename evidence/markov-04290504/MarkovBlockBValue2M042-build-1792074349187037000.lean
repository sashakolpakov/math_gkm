import MarkovBlockBDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockBValue2M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+2) (2*J+E+12)+shiftShapeCC (J+E+5) (C+5) 2 (J+7))=((blockBP200M042 J E*R^0*C^0 + blockBP201M042 J E*R^0*C^1) + (blockBP202M042 J E*R^0*C^2 + (blockBP203M042 J E*R^0*C^3 + blockBP204M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockBP200M042 blockBP201M042 blockBP202M042 blockBP203M042 blockBP204M042
 ring
end
end MathGKM.Markov
