import MarkovMiddleGap1_8M722
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

def midGapCol1_8M722 (J E R : ℤ) : ℤ := (midCol1_1_4M722 J E R*midCol1_1_4M722 J E R-midCol1_0_4M722 J E R*midCol1_2_4M722 J E R)

attribute [local irreducible] midP1_0_0_0M722 midP1_0_0_1M722 midP1_0_0_2M722 midP1_0_0_3M722 midP1_0_0_4M722 midP1_1_0_0M722 midP1_1_0_1M722 midP1_1_0_2M722 midP1_1_0_3M722 midP1_1_0_4M722 midP1_2_0_0M722 midP1_2_0_1M722 midP1_2_0_2M722 midP1_2_0_3M722 midP1_2_0_4M722

theorem middle_column_nonneg1_8M722 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol1_8M722 J E R := by
 have he : midGapCol1_8M722 J E R=midG1_0_8M722 J E*R^0 := by
  unfold midGapCol1_8M722 midCol1_0_0M722 midCol1_0_1M722 midCol1_0_2M722 midCol1_0_3M722 midCol1_0_4M722 midCol1_1_0M722 midCol1_1_1M722 midCol1_1_2M722 midCol1_1_3M722 midCol1_1_4M722 midCol1_2_0M722 midCol1_2_1M722 midCol1_2_2M722 midCol1_2_3M722 midCol1_2_4M722
  rw [←middle_gap_eq1_0_8M722]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg1_0_8M722 J E hJ hE
 positivity
end
end MathGKM.Markov
