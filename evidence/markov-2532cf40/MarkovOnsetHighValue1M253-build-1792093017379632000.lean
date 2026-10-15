import MarkovOnsetHighDefsM253
/-! Machine-authored request 2532cf40. Exact onset chart certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

theorem onsetHigh_value1M253 (N C R : ℤ) :
 middleShape3M722 (N+7) (2*C+R+5) (C+R+3) (2*(N+7)+1) + h2Corr1M5DC (N+7) (2*C+R+5) (C+R+3) (R+1)=onsetHighV1M253 N C R := by
 simp only [middleShape3M722,onsetHighV1M253,middleShapePart3_0_1M722,middleShapePart3_0_2M722,middleShapePart3_0_3M722,middleShapePart3_0_4M722,middleShapePart3_1_0M722,middleShapePart3_1_1M722,middleShapePart3_1_2M722,middleShapePart3_1_3M722,middleShapePart3_2_0M722,middleShapePart3_2_1M722,middleShapePart3_2_2M722,middleShapePart3_3_0M722,middleShapePart3_3_1M722,middleShapePart3_4_0M722,h2Corr1M5DC]
 ring
end
end MathGKM.Markov
