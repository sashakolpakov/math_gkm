import MarkovMiddleValue1_0M722
import MarkovMiddleValue1_1M722
import MarkovMiddleValue1_2M722
import MarkovMiddleGap1_0M722
import MarkovMiddleGap1_1M722
import MarkovMiddleGap1_2M722
import MarkovMiddleGap1_3M722
import MarkovMiddleGap1_4M722
import MarkovMiddleGap1_5M722
import MarkovMiddleGap1_6M722
import MarkovMiddleGap1_7M722
import MarkovMiddleGap1_8M722
/-! Machine-authored 722898f8. Direct low extreme chart, all degree columns retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
attribute [local irreducible] midP1_0_0_0M722 midP1_0_0_1M722 midP1_0_0_2M722 midP1_0_0_3M722 midP1_0_0_4M722 midP1_1_0_0M722 midP1_1_0_1M722 midP1_1_0_2M722 midP1_1_0_3M722 midP1_1_0_4M722 midP1_2_0_0M722 midP1_2_0_1M722 midP1_2_0_2M722 midP1_2_0_3M722 midP1_2_0_4M722

theorem middle_low_directM722 (C J E : ℤ) (hC : 0  ≤  C) (hJ : 0  ≤  J) (hE : 0  ≤  E) : middleShape0M722 (J+E+6) (C+5) 1 (2*(J+E+6)+J+6)*middleShape0M722 (J+E+6) (C+5) 1 (2*(J+E+6)+J+8) ≤ middleShape0M722 (J+E+6) (C+5) 1 (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value1_0M722 C 0 J E,middle_value1_1M722 C 0 J E,middle_value1_2M722 C 0 J E]
 unfold midCol1_0_0M722 midCol1_0_1M722 midCol1_0_2M722 midCol1_0_3M722 midCol1_0_4M722 midCol1_1_0M722 midCol1_1_1M722 midCol1_1_2M722 midCol1_1_3M722 midCol1_1_4M722 midCol1_2_0M722 midCol1_2_1M722 midCol1_2_2M722 midCol1_2_3M722 midCol1_2_4M722
 simp only [pow_zero,mul_one]
 have he : (midP1_1_0_0M722 J E*C^0 + midP1_1_0_1M722 J E*C^1 + midP1_1_0_2M722 J E*C^2 + midP1_1_0_3M722 J E*C^3 + midP1_1_0_4M722 J E*C^4)^2-(midP1_0_0_0M722 J E*C^0 + midP1_0_0_1M722 J E*C^1 + midP1_0_0_2M722 J E*C^2 + midP1_0_0_3M722 J E*C^3 + midP1_0_0_4M722 J E*C^4)*(midP1_2_0_0M722 J E*C^0 + midP1_2_0_1M722 J E*C^1 + midP1_2_0_2M722 J E*C^2 + midP1_2_0_3M722 J E*C^3 + midP1_2_0_4M722 J E*C^4)=midG1_0_0M722 J E*C^0 + midG1_0_1M722 J E*C^1 + midG1_0_2M722 J E*C^2 + midG1_0_3M722 J E*C^3 + midG1_0_4M722 J E*C^4 + midG1_0_5M722 J E*C^5 + midG1_0_6M722 J E*C^6 + midG1_0_7M722 J E*C^7 + midG1_0_8M722 J E*C^8 := by
  rw [←middle_gap_eq1_0_0M722,←middle_gap_eq1_0_1M722,←middle_gap_eq1_0_2M722,←middle_gap_eq1_0_3M722,←middle_gap_eq1_0_4M722,←middle_gap_eq1_0_5M722,←middle_gap_eq1_0_6M722,←middle_gap_eq1_0_7M722,←middle_gap_eq1_0_8M722]
  ring
 have h0 := middle_gap_nonneg1_0_0M722 J E hJ hE
 have h1 := middle_gap_nonneg1_0_1M722 J E hJ hE
 have h2 := middle_gap_nonneg1_0_2M722 J E hJ hE
 have h3 := middle_gap_nonneg1_0_3M722 J E hJ hE
 have h4 := middle_gap_nonneg1_0_4M722 J E hJ hE
 have h5 := middle_gap_nonneg1_0_5M722 J E hJ hE
 have h6 := middle_gap_nonneg1_0_6M722 J E hJ hE
 have h7 := middle_gap_nonneg1_0_7M722 J E hJ hE
 have h8 := middle_gap_nonneg1_0_8M722 J E hJ hE
 have hp : 0  ≤  midG1_0_0M722 J E*C^0 + midG1_0_1M722 J E*C^1 + midG1_0_2M722 J E*C^2 + midG1_0_3M722 J E*C^3 + midG1_0_4M722 J E*C^4 + midG1_0_5M722 J E*C^5 + midG1_0_6M722 J E*C^6 + midG1_0_7M722 J E*C^7 + midG1_0_8M722 J E*C^8 := by positivity
 nlinarith only [he,hp]
end
end MathGKM.Markov
