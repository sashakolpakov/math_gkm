import MarkovMiddleGap0_1M8B8
/-! Machine-authored request 8b851864; adapted from 8ae35b59. Raw central fourth-slice certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536

def midGapCol0_1M8B8 (J E R : ℤ) : ℤ := ((midCol0_1_0M722 J E R*midCol0_1_1M722 J E R-midCol0_0_0M722 J E R*midCol0_2_1M722 J E R) + (midCol0_1_1M722 J E R*midCol0_1_0M722 J E R-midCol0_0_1M722 J E R*midCol0_2_0M722 J E R))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

attribute [local irreducible] midG0_0_1M8B8 midG0_1_1M8B8 midG0_2_1M8B8 midG0_3_1M8B8 midG0_4_1M8B8 midG0_5_1M8B8 midG0_6_1M8B8 midG0_7_1M8B8

theorem middle_column_nonneg0_1M8B8 (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) : 0≤ midGapCol0_1M8B8 J E R := by
 have he : midGapCol0_1M8B8 J E R=(((midG0_0_1M8B8 J E*R^0 + midG0_1_1M8B8 J E*R^1) + (midG0_2_1M8B8 J E*R^2 + midG0_3_1M8B8 J E*R^3)) + ((midG0_4_1M8B8 J E*R^4 + midG0_5_1M8B8 J E*R^5) + (midG0_6_1M8B8 J E*R^6 + midG0_7_1M8B8 J E*R^7))) := by
  simp only [midGapCol0_1M8B8, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_1M8B8,←middle_gap_eq0_1_1M8B8,←middle_gap_eq0_2_1M8B8,←middle_gap_eq0_3_1M8B8,←middle_gap_eq0_4_1M8B8,←middle_gap_eq0_5_1M8B8,←middle_gap_eq0_6_1M8B8,←middle_gap_eq0_7_1M8B8]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_1M8B8 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_1M8B8 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_1M8B8 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_1M8B8 J E hJ hE
 have hp4 := middle_gap_nonneg0_4_1M8B8 J E hJ hE
 have hp5 := middle_gap_nonneg0_5_1M8B8 J E hJ hE
 have hp6 := middle_gap_nonneg0_6_1M8B8 J E hJ hE
 have hp7 := middle_gap_nonneg0_7_1M8B8 J E hJ hE
 positivity
end
end MathGKM.Markov
