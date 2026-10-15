import MarkovMiddleValue0_0M722
import MarkovMiddleValue0_1M722
import MarkovMiddleValue0_2M722
import MarkovMiddleColumn0_0M8B8
import MarkovMiddleColumn0_1M8B8
import MarkovMiddleColumn0_2M8B8
import MarkovMiddleColumn0_3M8B8
import MarkovMiddleColumn0_4M8AE
import MarkovMiddleColumn0_5M8AE
import MarkovMiddleColumn0_6M8AE
import MarkovMiddleColumn0_7M8AE
import MarkovMiddleColumn0_8M8AE
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

attribute [local irreducible] midCol0_0_0M722 midCol0_0_1M722 midCol0_0_2M722 midCol0_0_3M722 midCol0_0_4M722 midCol0_1_0M722 midCol0_1_1M722 midCol0_1_2M722 midCol0_1_3M722 midCol0_1_4M722 midCol0_2_0M722 midCol0_2_1M722 midCol0_2_2M722 midCol0_2_3M722 midCol0_2_4M722

theorem middle_chart0M8B8 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) : middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+6)*middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+8) ≤ middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value0_0M722,middle_value0_1M722,middle_value0_2M722]
 have he : ((midCol0_1_0M722 J E R*C^0 + midCol0_1_1M722 J E R*C^1) + (midCol0_1_2M722 J E R*C^2 + (midCol0_1_3M722 J E R*C^3 + midCol0_1_4M722 J E R*C^4)))^2-((midCol0_0_0M722 J E R*C^0 + midCol0_0_1M722 J E R*C^1) + (midCol0_0_2M722 J E R*C^2 + (midCol0_0_3M722 J E R*C^3 + midCol0_0_4M722 J E R*C^4)))*((midCol0_2_0M722 J E R*C^0 + midCol0_2_1M722 J E R*C^1) + (midCol0_2_2M722 J E R*C^2 + (midCol0_2_3M722 J E R*C^3 + midCol0_2_4M722 J E R*C^4)))=(((midGapCol0_0M8B8 J E R*C^0 + midGapCol0_1M8B8 J E R*C^1) + (midGapCol0_2M8B8 J E R*C^2 + midGapCol0_3M8B8 J E R*C^3)) + ((midGapCol0_4M8AE J E R*C^4 + midGapCol0_5M8AE J E R*C^5) + (midGapCol0_6M8AE J E R*C^6 + (midGapCol0_7M8AE J E R*C^7 + midGapCol0_8M8AE J E R*C^8)))) := by
  unfold midGapCol0_0M8B8 midGapCol0_1M8B8 midGapCol0_2M8B8 midGapCol0_3M8B8 midGapCol0_4M8AE midGapCol0_5M8AE midGapCol0_6M8AE midGapCol0_7M8AE midGapCol0_8M8AE
  ring
 rw [he]
 have hp0 := middle_column_nonneg0_0M8B8 J E R hJ hE hR
 have hp1 := middle_column_nonneg0_1M8B8 J E R hJ hE hR
 have hp2 := middle_column_nonneg0_2M8B8 J E R hJ hE hR
 have hp3 := middle_column_nonneg0_3M8B8 J E R hJ hE hR
 have hp4 := middle_column_nonneg0_4M8AE J E R hJ hE hR
 have hp5 := middle_column_nonneg0_5M8AE J E R hJ hE hR
 have hp6 := middle_column_nonneg0_6M8AE J E R hJ hE hR
 have hp7 := middle_column_nonneg0_7M8AE J E R hJ hE hR
 have hp8 := middle_column_nonneg0_8M8AE J E R hJ hE hR
 positivity
end
end MathGKM.Markov
