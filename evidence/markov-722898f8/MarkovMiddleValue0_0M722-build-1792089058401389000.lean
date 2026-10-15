import MarkovMiddleBase0M722
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

theorem middle_value0_0M722 (C R J E : ℤ) : middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+6)=((midCol0_0_0M722 J E R*C^0 + midCol0_0_1M722 J E R*C^1) + (midCol0_0_2M722 J E R*C^2 + (midCol0_0_3M722 J E R*C^3 + midCol0_0_4M722 J E R*C^4))) := by
 unfold middleShape0M722 midCol0_0_0M722 midCol0_0_1M722 midCol0_0_2M722 midCol0_0_3M722 midCol0_0_4M722 midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 middleShapePart0_0_1M722 middleShapePart0_0_2M722 middleShapePart0_0_3M722 middleShapePart0_0_4M722 middleShapePart0_1_0M722 middleShapePart0_1_1M722 middleShapePart0_1_2M722 middleShapePart0_1_3M722 middleShapePart0_2_0M722 middleShapePart0_2_1M722 middleShapePart0_2_2M722 middleShapePart0_3_0M722 middleShapePart0_3_1M722 middleShapePart0_4_0M722
 ring
end
end MathGKM.Markov
