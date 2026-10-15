import MarkovBlockLDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockLValue1M042 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+11)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+6))=(((blockLP100M042 J E*R^0*C^0 + (blockLP101M042 J E*R^0*C^1 + blockLP102M042 J E*R^0*C^2)) + ((blockLP103M042 J E*R^0*C^3 + blockLP104M042 J E*R^0*C^4) + (blockLP110M042 J E*R^1*C^0 + blockLP111M042 J E*R^1*C^1))) + (((blockLP112M042 J E*R^1*C^2 + blockLP113M042 J E*R^1*C^3) + (blockLP120M042 J E*R^2*C^0 + blockLP121M042 J E*R^2*C^1)) + ((blockLP122M042 J E*R^2*C^2 + blockLP130M042 J E*R^3*C^0) + (blockLP131M042 J E*R^3*C^1 + blockLP140M042 J E*R^4*C^0)))) := by
 unfold fourthShapeK0B shiftShapeCC blockLP100M042 blockLP101M042 blockLP102M042 blockLP103M042 blockLP104M042 blockLP110M042 blockLP111M042 blockLP112M042 blockLP113M042 blockLP120M042 blockLP121M042 blockLP122M042 blockLP130M042 blockLP131M042 blockLP140M042
 ring
end
end MathGKM.Markov
