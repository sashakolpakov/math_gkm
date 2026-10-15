import MarkovBlockStageDefsM806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_stageM806 (N K C R : ℤ) :
 (fourthShapeK0B (R+C+5) (N*(R+C+5)+(R+4)) (N+K)+shiftShapeCC N (R+C+5) (R+4) K)=(((blockStageP00M806 N K*R^0*C^0 + (blockStageP01M806 N K*R^0*C^1 + blockStageP02M806 N K*R^0*C^2)) + ((blockStageP03M806 N K*R^0*C^3 + blockStageP04M806 N K*R^0*C^4) + (blockStageP10M806 N K*R^1*C^0 + blockStageP11M806 N K*R^1*C^1))) + (((blockStageP12M806 N K*R^1*C^2 + blockStageP13M806 N K*R^1*C^3) + (blockStageP20M806 N K*R^2*C^0 + blockStageP21M806 N K*R^2*C^1)) + ((blockStageP22M806 N K*R^2*C^2 + blockStageP30M806 N K*R^3*C^0) + (blockStageP31M806 N K*R^3*C^1 + blockStageP40M806 N K*R^4*C^0)))) := by
 unfold fourthShapeK0B shiftShapeCC blockStageP00M806 blockStageP01M806 blockStageP02M806 blockStageP03M806 blockStageP04M806 blockStageP10M806 blockStageP11M806 blockStageP12M806 blockStageP13M806 blockStageP20M806 blockStageP21M806 blockStageP22M806 blockStageP30M806 blockStageP31M806 blockStageP40M806
 ring
end
end MathGKM.Markov
