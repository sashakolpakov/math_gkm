import MarkovBlockStageDefsM806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_scalar040M806 (J E : ℤ) :
 blockStageP40M806 (J+E+5) (J+5)=blockLP040M042 J E := by
 unfold blockStageP40M806 blockLP040M042
 ring
end
end MathGKM.Markov
