import MarkovMiddleGap2_0_8M5DC
/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

def midGapCol2_8M5DC (J E R : ℤ) : ℤ := (midCol2_1_4M722 J E R*midCol2_1_4M722 J E R-midCol2_0_4M722 J E R*midCol2_2_4M722 J E R)

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_8M5DC (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_8M5DC J E R := by
 have he : midGapCol2_8M5DC J E R=midG2_0_8M5DC J E*R^0 := by
  simp only [midGapCol2_8M5DC, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_8M5DC]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_8M5DC J E hJ hE
 positivity
end
end MathGKM.Markov
