import MarkovMiddleValue1_0M722
import MarkovMiddleValue1_1M722
import MarkovMiddleValue1_2M722
import MarkovMiddleColumn1_0M722
import MarkovMiddleColumn1_1M722
import MarkovMiddleColumn1_2M722
import MarkovMiddleColumn1_3M722
import MarkovMiddleColumn1_4M722
import MarkovMiddleColumn1_5M722
import MarkovMiddleColumn1_6M722
import MarkovMiddleColumn1_7M722
import MarkovMiddleColumn1_8M722
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

attribute [local irreducible] midCol1_0_0M722 midCol1_0_1M722 midCol1_0_2M722 midCol1_0_3M722 midCol1_0_4M722 midCol1_1_0M722 midCol1_1_1M722 midCol1_1_2M722 midCol1_1_3M722 midCol1_1_4M722 midCol1_2_0M722 midCol1_2_1M722 midCol1_2_2M722 midCol1_2_3M722 midCol1_2_4M722

theorem middle_chart1M722 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) : middleShape0M722 (J+E+6) (C+5) (1) (2*(J+E+6)+J+6)*middleShape0M722 (J+E+6) (C+5) (1) (2*(J+E+6)+J+8)≤middleShape0M722 (J+E+6) (C+5) (1) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value1_0M722,middle_value1_1M722,middle_value1_2M722]
 have he : ((midCol1_1_0M722 J E R*C^0 + midCol1_1_1M722 J E R*C^1) + (midCol1_1_2M722 J E R*C^2 + (midCol1_1_3M722 J E R*C^3 + midCol1_1_4M722 J E R*C^4)))^2-((midCol1_0_0M722 J E R*C^0 + midCol1_0_1M722 J E R*C^1) + (midCol1_0_2M722 J E R*C^2 + (midCol1_0_3M722 J E R*C^3 + midCol1_0_4M722 J E R*C^4)))*((midCol1_2_0M722 J E R*C^0 + midCol1_2_1M722 J E R*C^1) + (midCol1_2_2M722 J E R*C^2 + (midCol1_2_3M722 J E R*C^3 + midCol1_2_4M722 J E R*C^4)))=(((midGapCol1_0M722 J E R*C^0 + midGapCol1_1M722 J E R*C^1) + (midGapCol1_2M722 J E R*C^2 + midGapCol1_3M722 J E R*C^3)) + ((midGapCol1_4M722 J E R*C^4 + midGapCol1_5M722 J E R*C^5) + (midGapCol1_6M722 J E R*C^6 + (midGapCol1_7M722 J E R*C^7 + midGapCol1_8M722 J E R*C^8)))) := by
  unfold midGapCol1_0M722 midGapCol1_1M722 midGapCol1_2M722 midGapCol1_3M722 midGapCol1_4M722 midGapCol1_5M722 midGapCol1_6M722 midGapCol1_7M722 midGapCol1_8M722
  ring
 rw [he]
 have hp0 := middle_column_nonneg1_0M722 J E R hJ hE hR
 have hp1 := middle_column_nonneg1_1M722 J E R hJ hE hR
 have hp2 := middle_column_nonneg1_2M722 J E R hJ hE hR
 have hp3 := middle_column_nonneg1_3M722 J E R hJ hE hR
 have hp4 := middle_column_nonneg1_4M722 J E R hJ hE hR
 have hp5 := middle_column_nonneg1_5M722 J E R hJ hE hR
 have hp6 := middle_column_nonneg1_6M722 J E R hJ hE hR
 have hp7 := middle_column_nonneg1_7M722 J E R hJ hE hR
 have hp8 := middle_column_nonneg1_8M722 J E R hJ hE hR
 positivity
end
end MathGKM.Markov
