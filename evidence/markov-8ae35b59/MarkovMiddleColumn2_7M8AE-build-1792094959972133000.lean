import MarkovMiddleGap2_7M8AE
/-! Machine-authored request 8ae35b59. Raw central fourth-slice certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536

def midGapCol2_7M8AE (J E R : ℤ) : ℤ := ((midCol2_1_3M722 J E R*midCol2_1_4M722 J E R-midCol2_0_3M722 J E R*midCol2_2_4M722 J E R) + (midCol2_1_4M722 J E R*midCol2_1_3M722 J E R-midCol2_0_4M722 J E R*midCol2_2_3M722 J E R))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

attribute [local irreducible] midG2_0_7M8AE midG2_1_7M8AE

theorem middle_column_nonneg2_7M8AE (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) : 0≤ midGapCol2_7M8AE J E R := by
 have he : midGapCol2_7M8AE J E R=(midG2_0_7M8AE J E*R^0 + midG2_1_7M8AE J E*R^1) := by
  simp only [midGapCol2_7M8AE, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_7M8AE,←middle_gap_eq2_1_7M8AE]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_7M8AE J E hJ hE
 have hp1 := middle_gap_nonneg2_1_7M8AE J E hJ hE
 positivity
end
end MathGKM.Markov
