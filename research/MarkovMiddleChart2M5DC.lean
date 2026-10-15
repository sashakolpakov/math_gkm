import MarkovMiddleValue2_0M722
import MarkovMiddleValue2_1M722
import MarkovMiddleValue2_2M722
import MarkovMiddleColumn2_0M5DC
import MarkovMiddleColumn2_1M5DC
import MarkovMiddleColumn2_2M5DC
import MarkovMiddleColumn2_3M5DC
import MarkovMiddleColumn2_4M5DC
import MarkovMiddleColumn2_5M5DC
import MarkovMiddleColumn2_6M5DC
import MarkovMiddleColumn2_7M5DC
import MarkovMiddleColumn2_8M5DC
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

attribute [local irreducible] midCol2_0_0M722 midCol2_0_1M722 midCol2_0_2M722 midCol2_0_3M722 midCol2_0_4M722 midCol2_1_0M722 midCol2_1_1M722 midCol2_1_2M722 midCol2_1_3M722 midCol2_1_4M722 midCol2_2_0M722 midCol2_2_1M722 midCol2_2_2M722 midCol2_2_3M722 midCol2_2_4M722

theorem middle_chart2M5DC (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) : middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+6)*middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+8) ≤ middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value2_0M722,middle_value2_1M722,middle_value2_2M722]
 have he : ((midCol2_1_0M722 J E R*C^0 + midCol2_1_1M722 J E R*C^1) + (midCol2_1_2M722 J E R*C^2 + (midCol2_1_3M722 J E R*C^3 + midCol2_1_4M722 J E R*C^4)))^2-((midCol2_0_0M722 J E R*C^0 + midCol2_0_1M722 J E R*C^1) + (midCol2_0_2M722 J E R*C^2 + (midCol2_0_3M722 J E R*C^3 + midCol2_0_4M722 J E R*C^4)))*((midCol2_2_0M722 J E R*C^0 + midCol2_2_1M722 J E R*C^1) + (midCol2_2_2M722 J E R*C^2 + (midCol2_2_3M722 J E R*C^3 + midCol2_2_4M722 J E R*C^4)))=(((midGapCol2_0M5DC J E R*C^0 + midGapCol2_1M5DC J E R*C^1) + (midGapCol2_2M5DC J E R*C^2 + midGapCol2_3M5DC J E R*C^3)) + ((midGapCol2_4M5DC J E R*C^4 + midGapCol2_5M5DC J E R*C^5) + (midGapCol2_6M5DC J E R*C^6 + (midGapCol2_7M5DC J E R*C^7 + midGapCol2_8M5DC J E R*C^8)))) := by
  unfold midGapCol2_0M5DC midGapCol2_1M5DC midGapCol2_2M5DC midGapCol2_3M5DC midGapCol2_4M5DC midGapCol2_5M5DC midGapCol2_6M5DC midGapCol2_7M5DC midGapCol2_8M5DC
  ring
 rw [he]
 have hp0 := middle_column_nonneg2_0M5DC J E R hJ hE hR
 have hp1 := middle_column_nonneg2_1M5DC J E R hJ hE hR
 have hp2 := middle_column_nonneg2_2M5DC J E R hJ hE hR
 have hp3 := middle_column_nonneg2_3M5DC J E R hJ hE hR
 have hp4 := middle_column_nonneg2_4M5DC J E R hJ hE hR
 have hp5 := middle_column_nonneg2_5M5DC J E R hJ hE hR
 have hp6 := middle_column_nonneg2_6M5DC J E R hJ hE hR
 have hp7 := middle_column_nonneg2_7M5DC J E R hJ hE hR
 have hp8 := middle_column_nonneg2_8M5DC J E R hJ hE hR
 positivity
end
end MathGKM.Markov
