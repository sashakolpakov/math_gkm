import MarkovOnsetLowDefsM253
/-! Machine-authored request 2532cf40. Exact onset chart certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

theorem onsetLow_value1M253 (N C R : ℤ) :
 middleShape0M722 (N+7) (2*R+C+5) (R+2) (2*(N+7)+1) + h2Corr1M5DC (N+7) (2*R+C+5) (R+2) (0)=onsetLowV1M253 N C R := by
 simp only [middleShape0M722,onsetLowV1M253,middleShapePart0_0_1M722,middleShapePart0_0_2M722,middleShapePart0_0_3M722,middleShapePart0_0_4M722,middleShapePart0_1_0M722,middleShapePart0_1_1M722,middleShapePart0_1_2M722,middleShapePart0_1_3M722,middleShapePart0_2_0M722,middleShapePart0_2_1M722,middleShapePart0_2_2M722,middleShapePart0_3_0M722,middleShapePart0_3_1M722,middleShapePart0_4_0M722,h2Corr1M5DC]
 ring
end
end MathGKM.Markov
