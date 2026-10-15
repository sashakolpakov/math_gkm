import MarkovBlockBDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockBValue1M042 (C R J E : ℤ) :
 (fourthShapeK0B (C+5) ((J+E+5)*(C+5)+2) (2*J+E+11)+shiftShapeCC (J+E+5) (C+5) 2 (J+6))=((blockBP100M042 J E*R^0*C^0 + blockBP101M042 J E*R^0*C^1) + (blockBP102M042 J E*R^0*C^2 + (blockBP103M042 J E*R^0*C^3 + blockBP104M042 J E*R^0*C^4))) := by
 unfold fourthShapeK0B shiftShapeCC blockBP100M042 blockBP101M042 blockBP102M042 blockBP103M042 blockBP104M042
 ring
end
end MathGKM.Markov
