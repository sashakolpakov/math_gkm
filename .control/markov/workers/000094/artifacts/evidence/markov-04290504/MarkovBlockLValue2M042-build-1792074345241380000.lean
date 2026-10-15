import MarkovBlockLDefsM042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockLValue2M042 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+12)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+7))=(((blockLP200M042 J E*R^0*C^0 + (blockLP201M042 J E*R^0*C^1 + blockLP202M042 J E*R^0*C^2)) + ((blockLP203M042 J E*R^0*C^3 + blockLP204M042 J E*R^0*C^4) + (blockLP210M042 J E*R^1*C^0 + blockLP211M042 J E*R^1*C^1))) + (((blockLP212M042 J E*R^1*C^2 + blockLP213M042 J E*R^1*C^3) + (blockLP220M042 J E*R^2*C^0 + blockLP221M042 J E*R^2*C^1)) + ((blockLP222M042 J E*R^2*C^2 + blockLP230M042 J E*R^3*C^0) + (blockLP231M042 J E*R^3*C^1 + blockLP240M042 J E*R^4*C^0)))) := by
 unfold fourthShapeK0B shiftShapeCC blockLP200M042 blockLP201M042 blockLP202M042 blockLP203M042 blockLP204M042 blockLP210M042 blockLP211M042 blockLP212M042 blockLP213M042 blockLP220M042 blockLP221M042 blockLP222M042 blockLP230M042 blockLP231M042 blockLP240M042
 ring
end
end MathGKM.Markov
