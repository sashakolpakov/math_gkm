import MarkovMiddleValue3_0M722
import MarkovMiddleValue3_1M722
import MarkovMiddleValue3_2M722
import MarkovMiddleColumn3_0M722
import MarkovMiddleColumn3_1M722
import MarkovMiddleColumn3_2M722
import MarkovMiddleColumn3_3M722
import MarkovMiddleColumn3_4M722
import MarkovMiddleColumn3_5M722
import MarkovMiddleColumn3_6M722
import MarkovMiddleColumn3_7M722
import MarkovMiddleColumn3_8M722
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

attribute [local irreducible] midCol3_0_0M722 midCol3_0_1M722 midCol3_0_2M722 midCol3_0_3M722 midCol3_0_4M722 midCol3_1_0M722 midCol3_1_1M722 midCol3_1_2M722 midCol3_1_3M722 midCol3_1_4M722 midCol3_2_0M722 midCol3_2_1M722 midCol3_2_2M722 midCol3_2_3M722 midCol3_2_4M722

theorem middle_chart3M722 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) : middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+6)*middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+8)≤middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value3_0M722,middle_value3_1M722,middle_value3_2M722]
 have he : ((midCol3_1_0M722 J E R*C^0 + midCol3_1_1M722 J E R*C^1) + (midCol3_1_2M722 J E R*C^2 + (midCol3_1_3M722 J E R*C^3 + midCol3_1_4M722 J E R*C^4)))^2-((midCol3_0_0M722 J E R*C^0 + midCol3_0_1M722 J E R*C^1) + (midCol3_0_2M722 J E R*C^2 + (midCol3_0_3M722 J E R*C^3 + midCol3_0_4M722 J E R*C^4)))*((midCol3_2_0M722 J E R*C^0 + midCol3_2_1M722 J E R*C^1) + (midCol3_2_2M722 J E R*C^2 + (midCol3_2_3M722 J E R*C^3 + midCol3_2_4M722 J E R*C^4)))=(((midGapCol3_0M722 J E R*C^0 + midGapCol3_1M722 J E R*C^1) + (midGapCol3_2M722 J E R*C^2 + midGapCol3_3M722 J E R*C^3)) + ((midGapCol3_4M722 J E R*C^4 + midGapCol3_5M722 J E R*C^5) + (midGapCol3_6M722 J E R*C^6 + (midGapCol3_7M722 J E R*C^7 + midGapCol3_8M722 J E R*C^8)))) := by
  unfold midGapCol3_0M722 midGapCol3_1M722 midGapCol3_2M722 midGapCol3_3M722 midGapCol3_4M722 midGapCol3_5M722 midGapCol3_6M722 midGapCol3_7M722 midGapCol3_8M722
  ring
 rw [he]
 have hp0 := middle_column_nonneg3_0M722 J E R hJ hE hR
 have hp1 := middle_column_nonneg3_1M722 J E R hJ hE hR
 have hp2 := middle_column_nonneg3_2M722 J E R hJ hE hR
 have hp3 := middle_column_nonneg3_3M722 J E R hJ hE hR
 have hp4 := middle_column_nonneg3_4M722 J E R hJ hE hR
 have hp5 := middle_column_nonneg3_5M722 J E R hJ hE hR
 have hp6 := middle_column_nonneg3_6M722 J E R hJ hE hR
 have hp7 := middle_column_nonneg3_7M722 J E R hJ hE hR
 have hp8 := middle_column_nonneg3_8M722 J E R hJ hE hR
 positivity
end
end MathGKM.Markov
