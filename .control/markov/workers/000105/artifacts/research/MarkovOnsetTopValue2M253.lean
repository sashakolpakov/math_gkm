import MarkovOnsetTopDefsM253
/-! Machine-authored request 2532cf40. Exact onset chart certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

theorem onsetTop_value2M253 (N R : ℤ) :
 middleShape3M722 (N+7) (R+5) (R+4) (2*(N+7)+2) + h2Corr2M5DC (N+7) (R+5) (R+4) (R+3)=onsetTopV2M253 N R := by
 simp only [middleShape3M722,onsetTopV2M253,middleShapePart3_0_1M722,middleShapePart3_0_2M722,middleShapePart3_0_3M722,middleShapePart3_0_4M722,middleShapePart3_1_0M722,middleShapePart3_1_1M722,middleShapePart3_1_2M722,middleShapePart3_1_3M722,middleShapePart3_2_0M722,middleShapePart3_2_1M722,middleShapePart3_2_2M722,middleShapePart3_3_0M722,middleShapePart3_3_1M722,middleShapePart3_4_0M722,h2Corr2M5DC]
 ring
end
end MathGKM.Markov
