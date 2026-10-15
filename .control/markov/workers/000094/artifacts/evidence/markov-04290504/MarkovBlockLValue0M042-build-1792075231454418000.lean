import MarkovShiftShapeCC
import MarkovBlockLDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockLValue0M042 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+10)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+5))=(((blockLP000M042 J E*R^0*C^0 + (blockLP001M042 J E*R^0*C^1 + blockLP002M042 J E*R^0*C^2)) + ((blockLP003M042 J E*R^0*C^3 + blockLP004M042 J E*R^0*C^4) + (blockLP010M042 J E*R^1*C^0 + blockLP011M042 J E*R^1*C^1))) + (((blockLP012M042 J E*R^1*C^2 + blockLP013M042 J E*R^1*C^3) + (blockLP020M042 J E*R^2*C^0 + blockLP021M042 J E*R^2*C^1)) + ((blockLP022M042 J E*R^2*C^2 + blockLP030M042 J E*R^3*C^0) + (blockLP031M042 J E*R^3*C^1 + blockLP040M042 J E*R^4*C^0)))) := by
 unfold fourthShapeK0B shiftShapeCC blockLP000M042 blockLP001M042 blockLP002M042 blockLP003M042 blockLP004M042 blockLP010M042 blockLP011M042 blockLP012M042 blockLP013M042 blockLP020M042 blockLP021M042 blockLP022M042 blockLP030M042 blockLP031M042 blockLP040M042
 ring
end
end MathGKM.Markov
