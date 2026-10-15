import MarkovOnsetDefsM96
import MarkovEarlyBlockM042
/-! Machine-authored live request 96dea62b. Exact onset coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem onset_value5M96 (N c r : ℤ) :
 earlyBlockValueM042 N c r 5=onsetValue5M96 N c r := by
 unfold earlyBlockValueM042
 rw [shiftPoly_convolutionCC]
 norm_num [chooseShiftSevenK0B, Nat.choose]
 unfold fourthShapeK0B onsetValue5M96 shiftPart0CC shiftPart1CC shiftPart2CC shiftPart3CC shiftPart4CC shiftPart5CC
 ring
end
end MathGKM.Markov
