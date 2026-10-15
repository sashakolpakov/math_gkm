import MarkovBlockStageM806
import MarkovBlockScalar00M806
import MarkovBlockScalar01M806
import MarkovBlockScalar02M806
import MarkovBlockScalar03M806
import MarkovBlockScalar04M806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_value0M806 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+10)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+5))=(((blockLP000M042 J E*R^0*C^0 + (blockLP001M042 J E*R^0*C^1 + blockLP002M042 J E*R^0*C^2)) + ((blockLP003M042 J E*R^0*C^3 + blockLP004M042 J E*R^0*C^4) + (blockLP010M042 J E*R^1*C^0 + blockLP011M042 J E*R^1*C^1))) + (((blockLP012M042 J E*R^1*C^2 + blockLP013M042 J E*R^1*C^3) + (blockLP020M042 J E*R^2*C^0 + blockLP021M042 J E*R^2*C^1)) + ((blockLP022M042 J E*R^2*C^2 + blockLP030M042 J E*R^3*C^0) + (blockLP031M042 J E*R^3*C^1 + blockLP040M042 J E*R^4*C^0)))) := by
 have he : 2*J+E+10=(J+E+5)+(J+5) := by ring
 rw [he,block_stageM806]
 rw [block_scalar000M806,block_scalar001M806,block_scalar002M806,block_scalar003M806,block_scalar004M806,block_scalar010M806,block_scalar011M806,block_scalar012M806,block_scalar013M806,block_scalar020M806,block_scalar021M806,block_scalar022M806,block_scalar030M806,block_scalar031M806,block_scalar040M806]
end
end MathGKM.Markov
