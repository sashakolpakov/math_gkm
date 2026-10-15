import MarkovMiddleBase2M722
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

theorem middle_value2_1M722 (C R J E : ℤ) : middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+7)=((midCol2_1_0M722 J E R*C^0 + midCol2_1_1M722 J E R*C^1) + (midCol2_1_2M722 J E R*C^2 + (midCol2_1_3M722 J E R*C^3 + midCol2_1_4M722 J E R*C^4))) := by
 unfold middleShape3M722 midCol2_1_0M722 midCol2_1_1M722 midCol2_1_2M722 midCol2_1_3M722 midCol2_1_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 middleShapePart3_0_1M722 middleShapePart3_0_2M722 middleShapePart3_0_3M722 middleShapePart3_0_4M722 middleShapePart3_1_0M722 middleShapePart3_1_1M722 middleShapePart3_1_2M722 middleShapePart3_1_3M722 middleShapePart3_2_0M722 middleShapePart3_2_1M722 middleShapePart3_2_2M722 middleShapePart3_3_0M722 middleShapePart3_3_1M722 middleShapePart3_4_0M722
 ring
end
end MathGKM.Markov
