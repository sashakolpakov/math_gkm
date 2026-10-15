import MarkovMiddleGap3_0M8AE
/-! Machine-authored request 8ae35b59. Raw central fourth-slice certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536

def midGapCol3_0M8AE (J E R : ℤ) : ℤ := (midCol3_1_0M722 J E R*midCol3_1_0M722 J E R-midCol3_0_0M722 J E R*midCol3_2_0M722 J E R)

attribute [local irreducible] midP3_0_0_0M722 midP3_0_1_0M722 midP3_0_2_0M722 midP3_0_3_0M722 midP3_0_4_0M722 midP3_1_0_0M722 midP3_1_1_0M722 midP3_1_2_0M722 midP3_1_3_0M722 midP3_1_4_0M722 midP3_2_0_0M722 midP3_2_1_0M722 midP3_2_2_0M722 midP3_2_3_0M722 midP3_2_4_0M722

attribute [local irreducible] midG3_0_0M8AE midG3_1_0M8AE midG3_2_0M8AE midG3_3_0M8AE midG3_4_0M8AE midG3_5_0M8AE midG3_6_0M8AE midG3_7_0M8AE midG3_8_0M8AE

theorem middle_column_nonneg3_0M8AE (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) : 0≤ midGapCol3_0M8AE J E R := by
 have he : midGapCol3_0M8AE J E R=(((midG3_0_0M8AE J E*R^0 + midG3_1_0M8AE J E*R^1) + (midG3_2_0M8AE J E*R^2 + midG3_3_0M8AE J E*R^3)) + ((midG3_4_0M8AE J E*R^4 + midG3_5_0M8AE J E*R^5) + (midG3_6_0M8AE J E*R^6 + (midG3_7_0M8AE J E*R^7 + midG3_8_0M8AE J E*R^8)))) := by
  simp only [midGapCol3_0M8AE, midCol3_0_0M722, midCol3_0_1M722, midCol3_0_2M722, midCol3_0_3M722, midCol3_0_4M722, midCol3_1_0M722, midCol3_1_1M722, midCol3_1_2M722, midCol3_1_3M722, midCol3_1_4M722, midCol3_2_0M722, midCol3_2_1M722, midCol3_2_2M722, midCol3_2_3M722, midCol3_2_4M722]
  rw [←middle_gap_eq3_0_0M8AE,←middle_gap_eq3_1_0M8AE,←middle_gap_eq3_2_0M8AE,←middle_gap_eq3_3_0M8AE,←middle_gap_eq3_4_0M8AE,←middle_gap_eq3_5_0M8AE,←middle_gap_eq3_6_0M8AE,←middle_gap_eq3_7_0M8AE,←middle_gap_eq3_8_0M8AE]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg3_0_0M8AE J E hJ hE
 have hp1 := middle_gap_nonneg3_1_0M8AE J E hJ hE
 have hp2 := middle_gap_nonneg3_2_0M8AE J E hJ hE
 have hp3 := middle_gap_nonneg3_3_0M8AE J E hJ hE
 have hp4 := middle_gap_nonneg3_4_0M8AE J E hJ hE
 have hp5 := middle_gap_nonneg3_5_0M8AE J E hJ hE
 have hp6 := middle_gap_nonneg3_6_0M8AE J E hJ hE
 have hp7 := middle_gap_nonneg3_7_0M8AE J E hJ hE
 have hp8 := middle_gap_nonneg3_8_0M8AE J E hJ hE
 positivity
end
end MathGKM.Markov
