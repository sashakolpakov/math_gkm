import MarkovMiddleValue0_0M722
import MarkovMiddleValue0_1M722
import MarkovMiddleValue0_2M722
import MarkovMiddleGap0_0_0M8AE
import MarkovMiddleTwoGap1M8AE
import MarkovMiddleTwoGap2M8AE
import MarkovMiddleTwoGap3M8AE
import MarkovMiddleTwoGap4M8AE
import MarkovMiddleGap0_5_0M8AE
import MarkovMiddleGap0_6_0M8AE
import MarkovMiddleGap0_7_0M8AE
import MarkovMiddleGap0_8_0M8AE
/-! Machine-authored 8ae35b59. Direct numerator-two middle inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] midP0_0_0_0M722 midP0_0_0_1M722 midP0_0_0_2M722 midP0_0_0_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_0_1M722 midP0_1_0_2M722 midP0_1_0_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_0_1M722 midP0_2_0_2M722 midP0_2_0_3M722 midP0_2_0_4M722 midG0_0_0M8AE midTwoG1M8AE midTwoG2M8AE midTwoG3M8AE midTwoG4M8AE midG0_0_5M8AE midG0_0_6M8AE midG0_0_7M8AE midG0_0_8M8AE
theorem middle_two_directM8AE (C J E : ℤ) (hC : 0≤C) (hJ : 0≤J) (hE : 0≤E) : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+6)*middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+8) ≤ middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+7)^2 := by
 have hv0 : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+6)=(midP0_0_0_0M722 J E*C^0 + midP0_0_0_1M722 J E*C^1 + midP0_0_0_2M722 J E*C^2 + midP0_0_0_3M722 J E*C^3 + midP0_0_0_4M722 J E*C^4) := by
  have h := middle_value0_0M722 C 0 J E
  simpa only [midCol0_0_0M722,midCol0_0_1M722,midCol0_0_2M722,midCol0_0_3M722,midCol0_0_4M722,pow_zero,pow_succ,zero_mul,mul_zero,add_zero,zero_add,mul_one,add_assoc] using h
 have hv1 : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+7)=(midP0_1_0_0M722 J E*C^0 + midP0_1_0_1M722 J E*C^1 + midP0_1_0_2M722 J E*C^2 + midP0_1_0_3M722 J E*C^3 + midP0_1_0_4M722 J E*C^4) := by
  have h := middle_value0_1M722 C 0 J E
  simpa only [midCol0_1_0M722,midCol0_1_1M722,midCol0_1_2M722,midCol0_1_3M722,midCol0_1_4M722,pow_zero,pow_succ,zero_mul,mul_zero,add_zero,zero_add,mul_one,add_assoc] using h
 have hv2 : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+8)=(midP0_2_0_0M722 J E*C^0 + midP0_2_0_1M722 J E*C^1 + midP0_2_0_2M722 J E*C^2 + midP0_2_0_3M722 J E*C^3 + midP0_2_0_4M722 J E*C^4) := by
  have h := middle_value0_2M722 C 0 J E
  simpa only [midCol0_2_0M722,midCol0_2_1M722,midCol0_2_2M722,midCol0_2_3M722,midCol0_2_4M722,pow_zero,pow_succ,zero_mul,mul_zero,add_zero,zero_add,mul_one,add_assoc] using h
 apply sub_nonneg.mp
 rw [hv0,hv1,hv2]
 have he : (midP0_1_0_0M722 J E*C^0 + midP0_1_0_1M722 J E*C^1 + midP0_1_0_2M722 J E*C^2 + midP0_1_0_3M722 J E*C^3 + midP0_1_0_4M722 J E*C^4)^2-(midP0_0_0_0M722 J E*C^0 + midP0_0_0_1M722 J E*C^1 + midP0_0_0_2M722 J E*C^2 + midP0_0_0_3M722 J E*C^3 + midP0_0_0_4M722 J E*C^4)*(midP0_2_0_0M722 J E*C^0 + midP0_2_0_1M722 J E*C^1 + midP0_2_0_2M722 J E*C^2 + midP0_2_0_3M722 J E*C^3 + midP0_2_0_4M722 J E*C^4)=(midG0_0_0M8AE J E*C^0 + midTwoG1M8AE J E*C^1 + midTwoG2M8AE J E*C^2 + midTwoG3M8AE J E*C^3 + midTwoG4M8AE J E*C^4 + midG0_0_5M8AE J E*C^5 + midG0_0_6M8AE J E*C^6 + midG0_0_7M8AE J E*C^7 + midG0_0_8M8AE J E*C^8) := by
  rw [←middle_gap_eq0_0_0M8AE,←middle_two_gap_eq1M8AE,←middle_two_gap_eq2M8AE,←middle_two_gap_eq3M8AE,←middle_two_gap_eq4M8AE,←middle_gap_eq0_0_5M8AE,←middle_gap_eq0_0_6M8AE,←middle_gap_eq0_0_7M8AE,←middle_gap_eq0_0_8M8AE]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_0M8AE J E hJ hE
 have hp1 := middle_two_gap_nonneg1M8AE J E hJ hE
 have hp2 := middle_two_gap_nonneg2M8AE J E hJ hE
 have hp3 := middle_two_gap_nonneg3M8AE J E hJ hE
 have hp4 := middle_two_gap_nonneg4M8AE J E hJ hE
 have hp5 := middle_gap_nonneg0_0_5M8AE J E hJ hE
 have hp6 := middle_gap_nonneg0_0_6M8AE J E hJ hE
 have hp7 := middle_gap_nonneg0_0_7M8AE J E hJ hE
 have hp8 := middle_gap_nonneg0_0_8M8AE J E hJ hE
 positivity
end
end MathGKM.Markov
