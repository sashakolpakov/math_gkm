import MarkovOnsetDefsM96
import MarkovEarlyBlockM042
/-! Machine-authored live request 96dea62b. Exact onset coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem onset_value1M96 (N c r : ℤ) :
 earlyBlockValueM042 N c r 1=onsetValue1M96 N c r := by
 unfold earlyBlockValueM042
 rw [shiftPoly_convolutionCC]
 norm_num [chooseShiftSevenK0B, Nat.choose]
 unfold fourthShapeK0B onsetValue1M96 shiftPart0CC shiftPart1CC
 ring
end
end MathGKM.Markov
