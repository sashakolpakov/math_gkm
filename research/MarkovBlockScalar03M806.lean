import MarkovBlockStageDefsM806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_scalar030M806 (J E : ℤ) :
 blockStageP30M806 (J+E+5) (J+5)=blockLP030M042 J E := by
 unfold blockStageP30M806 blockLP030M042
 ring

theorem block_scalar031M806 (J E : ℤ) :
 blockStageP31M806 (J+E+5) (J+5)=blockLP031M042 J E := by
 unfold blockStageP31M806 blockLP031M042
 ring
end
end MathGKM.Markov
