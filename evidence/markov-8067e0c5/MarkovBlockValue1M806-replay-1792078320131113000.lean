import MarkovBlockStageM806
import MarkovBlockScalar10M806
import MarkovBlockScalar11M806
import MarkovBlockScalar12M806
import MarkovBlockScalar13M806
import MarkovBlockScalar14M806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_value1M806 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+11)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+6))=(((blockLP100M042 J E*R^0*C^0 + (blockLP101M042 J E*R^0*C^1 + blockLP102M042 J E*R^0*C^2)) + ((blockLP103M042 J E*R^0*C^3 + blockLP104M042 J E*R^0*C^4) + (blockLP110M042 J E*R^1*C^0 + blockLP111M042 J E*R^1*C^1))) + (((blockLP112M042 J E*R^1*C^2 + blockLP113M042 J E*R^1*C^3) + (blockLP120M042 J E*R^2*C^0 + blockLP121M042 J E*R^2*C^1)) + ((blockLP122M042 J E*R^2*C^2 + blockLP130M042 J E*R^3*C^0) + (blockLP131M042 J E*R^3*C^1 + blockLP140M042 J E*R^4*C^0)))) := by
 have he : 2*J+E+11=(J+E+5)+(J+6) := by ring
 rw [he,block_stageM806]
 rw [block_scalar100M806,block_scalar101M806,block_scalar102M806,block_scalar103M806,block_scalar104M806,block_scalar110M806,block_scalar111M806,block_scalar112M806,block_scalar113M806,block_scalar120M806,block_scalar121M806,block_scalar122M806,block_scalar130M806,block_scalar131M806,block_scalar140M806]
end
end MathGKM.Markov
