import MarkovBlockDDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockDValue2M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+1) (2*J+E+12)+shiftShapeCC (J+E+5) (C+5) 1 (J+7))=((blockDP200M042 J E*R^0*C^0 + blockDP201M042 J E*R^0*C^1) + (blockDP202M042 J E*R^0*C^2 + (blockDP203M042 J E*R^0*C^3 + blockDP204M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockDP200M042 blockDP201M042 blockDP202M042 blockDP203M042 blockDP204M042
 ring
end
end MathGKM.Markov
