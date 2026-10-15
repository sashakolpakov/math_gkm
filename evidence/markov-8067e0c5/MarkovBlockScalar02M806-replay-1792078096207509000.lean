import MarkovBlockStageDefsM806
/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem block_scalar020M806 (J E : ℤ) :
 blockStageP20M806 (J+E+5) (J+5)=blockLP020M042 J E := by
 unfold blockStageP20M806 blockLP020M042
 ring

theorem block_scalar021M806 (J E : ℤ) :
 blockStageP21M806 (J+E+5) (J+5)=blockLP021M042 J E := by
 unfold blockStageP21M806 blockLP021M042
 ring

theorem block_scalar022M806 (J E : ℤ) :
 blockStageP22M806 (J+E+5) (J+5)=blockLP022M042 J E := by
 unfold blockStageP22M806 blockLP022M042
 ring
end
end MathGKM.Markov
