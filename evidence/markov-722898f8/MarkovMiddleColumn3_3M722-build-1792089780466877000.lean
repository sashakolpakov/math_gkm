import MarkovMiddleGap3_3M722
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

def midGapCol3_3M722 (J E R : ℤ) : ℤ := (((midCol3_1_0M722 J E R*midCol3_1_3M722 J E R-midCol3_0_0M722 J E R*midCol3_2_3M722 J E R) + (midCol3_1_1M722 J E R*midCol3_1_2M722 J E R-midCol3_0_1M722 J E R*midCol3_2_2M722 J E R)) + ((midCol3_1_2M722 J E R*midCol3_1_1M722 J E R-midCol3_0_2M722 J E R*midCol3_2_1M722 J E R) + (midCol3_1_3M722 J E R*midCol3_1_0M722 J E R-midCol3_0_3M722 J E R*midCol3_2_0M722 J E R)))

attribute [local irreducible] midP3_0_0_0M722 midP3_0_1_0M722 midP3_0_2_0M722 midP3_0_3_0M722 midP3_0_4_0M722 midP3_1_0_0M722 midP3_1_1_0M722 midP3_1_2_0M722 midP3_1_3_0M722 midP3_1_4_0M722 midP3_2_0_0M722 midP3_2_1_0M722 midP3_2_2_0M722 midP3_2_3_0M722 midP3_2_4_0M722

theorem middle_column_nonneg3_3M722 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol3_3M722 J E R := by
 have he : midGapCol3_3M722 J E R=((midG3_0_3M722 J E*R^0 + (midG3_1_3M722 J E*R^1 + midG3_2_3M722 J E*R^2)) + (midG3_3_3M722 J E*R^3 + (midG3_4_3M722 J E*R^4 + midG3_5_3M722 J E*R^5))) := by
  unfold midGapCol3_3M722 midCol3_0_0M722 midCol3_0_1M722 midCol3_0_2M722 midCol3_0_3M722 midCol3_0_4M722 midCol3_1_0M722 midCol3_1_1M722 midCol3_1_2M722 midCol3_1_3M722 midCol3_1_4M722 midCol3_2_0M722 midCol3_2_1M722 midCol3_2_2M722 midCol3_2_3M722 midCol3_2_4M722
  rw [←middle_gap_eq3_0_3M722,←middle_gap_eq3_1_3M722,←middle_gap_eq3_2_3M722,←middle_gap_eq3_3_3M722,←middle_gap_eq3_4_3M722,←middle_gap_eq3_5_3M722]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg3_0_3M722 J E hJ hE
 have hp1 := middle_gap_nonneg3_1_3M722 J E hJ hE
 have hp2 := middle_gap_nonneg3_2_3M722 J E hJ hE
 have hp3 := middle_gap_nonneg3_3_3M722 J E hJ hE
 have hp4 := middle_gap_nonneg3_4_3M722 J E hJ hE
 have hp5 := middle_gap_nonneg3_5_3M722 J E hJ hE
 positivity
end
end MathGKM.Markov
