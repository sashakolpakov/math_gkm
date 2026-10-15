import MarkovBlockDDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockDValue0M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+1) (2*J+E+10)+shiftShapeCC (J+E+5) (C+5) 1 (J+5))=((blockDP000M042 J E*R^0*C^0 + blockDP001M042 J E*R^0*C^1) + (blockDP002M042 J E*R^0*C^2 + (blockDP003M042 J E*R^0*C^3 + blockDP004M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockDP000M042 blockDP001M042 blockDP002M042 blockDP003M042 blockDP004M042
 ring
end
end MathGKM.Markov
