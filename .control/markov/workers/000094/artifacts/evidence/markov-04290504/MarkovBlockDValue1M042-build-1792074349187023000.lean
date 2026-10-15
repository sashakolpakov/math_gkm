import MarkovBlockDDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockDValue1M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+1) (2*J+E+11)+shiftShapeCC (J+E+5) (C+5) 1 (J+6))=((blockDP100M042 J E*R^0*C^0 + blockDP101M042 J E*R^0*C^1) + (blockDP102M042 J E*R^0*C^2 + (blockDP103M042 J E*R^0*C^3 + blockDP104M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockDP100M042 blockDP101M042 blockDP102M042 blockDP103M042 blockDP104M042
 ring
end
end MathGKM.Markov
