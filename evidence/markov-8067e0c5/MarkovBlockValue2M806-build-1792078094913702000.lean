import MarkovBlockStageM806
import MarkovBlockScalar20M806
import MarkovBlockScalar21M806
import MarkovBlockScalar22M806
import MarkovBlockScalar23M806
import MarkovBlockScalar24M806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_value2M806 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+12)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+7))=(((blockLP200M042 J E*R^0*C^0 + (blockLP201M042 J E*R^0*C^1 + blockLP202M042 J E*R^0*C^2)) + ((blockLP203M042 J E*R^0*C^3 + blockLP204M042 J E*R^0*C^4) + (blockLP210M042 J E*R^1*C^0 + blockLP211M042 J E*R^1*C^1))) + (((blockLP212M042 J E*R^1*C^2 + blockLP213M042 J E*R^1*C^3) + (blockLP220M042 J E*R^2*C^0 + blockLP221M042 J E*R^2*C^1)) + ((blockLP222M042 J E*R^2*C^2 + blockLP230M042 J E*R^3*C^0) + (blockLP231M042 J E*R^3*C^1 + blockLP240M042 J E*R^4*C^0)))) := by
 have he : 2*J+E+12=(J+E+5)+(J+7) := by ring
 rw [he,block_stageM806]
 rw [block_scalar200M806,block_scalar201M806,block_scalar202M806,block_scalar203M806,block_scalar204M806,block_scalar210M806,block_scalar211M806,block_scalar212M806,block_scalar213M806,block_scalar220M806,block_scalar221M806,block_scalar222M806,block_scalar230M806,block_scalar231M806,block_scalar240M806]
end
end MathGKM.Markov
