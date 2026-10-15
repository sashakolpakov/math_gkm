import MarkovBlockBDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockBValue0M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+2) (2*J+E+10)+shiftShapeCC (J+E+5) (C+5) 2 (J+5))=((blockBP000M042 J E*R^0*C^0 + blockBP001M042 J E*R^0*C^1) + (blockBP002M042 J E*R^0*C^2 + (blockBP003M042 J E*R^0*C^3 + blockBP004M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockBP000M042 blockBP001M042 blockBP002M042 blockBP003M042 blockBP004M042
 ring
end
end MathGKM.Markov
