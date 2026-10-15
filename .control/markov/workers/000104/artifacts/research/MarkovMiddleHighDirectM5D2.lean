import MarkovMiddleGaps3M5D2
import MarkovMiddleValue3_0M722
import MarkovMiddleValue3_1M722
import MarkovMiddleValue3_2M722
/-! Machine-authored request 5dc9c88d. Exact fourth-slice coefficient certificate; no root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false
attribute [local irreducible] midP3_0_0_0M722 midP3_0_1_0M722 midP3_0_2_0M722 midP3_0_3_0M722 midP3_0_4_0M722 midP3_1_0_0M722 midP3_1_1_0M722 midP3_1_2_0M722 midP3_1_3_0M722 midP3_1_4_0M722 midP3_2_0_0M722 midP3_2_1_0M722 midP3_2_2_0M722 midP3_2_3_0M722 midP3_2_4_0M722

theorem middle_high_directM5D2 (R J E : ℤ) (hR : 0 ≤ R) (hJ : 0 ≤ J) (hE : 0 ≤ E) : middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+6)*middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+8) ≤ middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value3_0M722 0 R J E,middle_value3_1M722 0 R J E,middle_value3_2M722 0 R J E]
 simp only [pow_zero,pow_succ,zero_mul,mul_zero,add_zero,mul_one]
 unfold midCol3_0_0M722 midCol3_1_0M722 midCol3_2_0M722
 have he : (midP3_1_0_0M722 J E*R^0 + midP3_1_1_0M722 J E*R^1 + midP3_1_2_0M722 J E*R^2 + midP3_1_3_0M722 J E*R^3 + midP3_1_4_0M722 J E*R^4)^2-(midP3_0_0_0M722 J E*R^0 + midP3_0_1_0M722 J E*R^1 + midP3_0_2_0M722 J E*R^2 + midP3_0_3_0M722 J E*R^3 + midP3_0_4_0M722 J E*R^4)*(midP3_2_0_0M722 J E*R^0 + midP3_2_1_0M722 J E*R^1 + midP3_2_2_0M722 J E*R^2 + midP3_2_3_0M722 J E*R^3 + midP3_2_4_0M722 J E*R^4)=midG3_0_0M5D2 J E*R^0 + midG3_1_0M5D2 J E*R^1 + midG3_2_0M5D2 J E*R^2 + midG3_3_0M5D2 J E*R^3 + midG3_4_0M5D2 J E*R^4 + midG3_5_0M5D2 J E*R^5 + midG3_6_0M5D2 J E*R^6 + midG3_7_0M5D2 J E*R^7 + midG3_8_0M5D2 J E*R^8 := by
  rw [←middle_gap_eq3_0_0M5D2,←middle_gap_eq3_1_0M5D2,←middle_gap_eq3_2_0M5D2,←middle_gap_eq3_3_0M5D2,←middle_gap_eq3_4_0M5D2,←middle_gap_eq3_5_0M5D2,←middle_gap_eq3_6_0M5D2,←middle_gap_eq3_7_0M5D2,←middle_gap_eq3_8_0M5D2]
  ring
 have h0 := middle_gap_nonneg3_0_0M5D2 J E hJ hE
 have h1 := middle_gap_nonneg3_1_0M5D2 J E hJ hE
 have h2 := middle_gap_nonneg3_2_0M5D2 J E hJ hE
 have h3 := middle_gap_nonneg3_3_0M5D2 J E hJ hE
 have h4 := middle_gap_nonneg3_4_0M5D2 J E hJ hE
 have h5 := middle_gap_nonneg3_5_0M5D2 J E hJ hE
 have h6 := middle_gap_nonneg3_6_0M5D2 J E hJ hE
 have h7 := middle_gap_nonneg3_7_0M5D2 J E hJ hE
 have h8 := middle_gap_nonneg3_8_0M5D2 J E hJ hE
 have hp : 0 ≤ midG3_0_0M5D2 J E*R^0 + midG3_1_0M5D2 J E*R^1 + midG3_2_0M5D2 J E*R^2 + midG3_3_0M5D2 J E*R^3 + midG3_4_0M5D2 J E*R^4 + midG3_5_0M5D2 J E*R^5 + midG3_6_0M5D2 J E*R^6 + midG3_7_0M5D2 J E*R^7 + midG3_8_0M5D2 J E*R^8 := by positivity
 nlinarith only [he,hp]
end
end MathGKM.Markov
