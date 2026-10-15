import MarkovMiddleGap0_4_0M8AE
/-! Machine-authored request 8ae35b59. Raw central fourth-slice certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] midH0_0_0_0M8AE midH0_0_0_1M8AE midH0_0_0_2M8AE midH0_0_0_3M8AE midH0_0_0_4M8AE midH0_0_1_0M8AE midH0_0_1_1M8AE midH0_0_1_2M8AE midH0_0_1_3M8AE midH0_0_2_0M8AE midH0_0_2_1M8AE midH0_0_2_2M8AE midH0_0_3_0M8AE midH0_0_3_1M8AE midH0_0_4_0M8AE midH0_1_0_0M8AE midH0_1_0_1M8AE midH0_1_0_2M8AE midH0_1_0_3M8AE midH0_1_0_4M8AE midH0_1_1_0M8AE midH0_1_1_1M8AE midH0_1_1_2M8AE midH0_1_1_3M8AE midH0_1_2_0M8AE midH0_1_2_1M8AE midH0_1_2_2M8AE midH0_1_3_0M8AE midH0_1_3_1M8AE midH0_1_4_0M8AE midH0_2_0_0M8AE midH0_2_0_1M8AE midH0_2_0_2M8AE midH0_2_0_3M8AE midH0_2_0_4M8AE midH0_2_1_0M8AE midH0_2_1_1M8AE midH0_2_1_2M8AE midH0_2_1_3M8AE midH0_2_2_0M8AE midH0_2_2_1M8AE midH0_2_2_2M8AE midH0_2_3_0M8AE midH0_2_3_1M8AE midH0_2_4_0M8AE midP0_0_0_0M722 midP0_0_0_1M722 midP0_0_0_2M722 midP0_0_0_3M722 midP0_0_0_4M722 midP0_0_1_0M722 midP0_0_1_1M722 midP0_0_1_2M722 midP0_0_1_3M722 midP0_0_2_0M722 midP0_0_2_1M722 midP0_0_2_2M722 midP0_0_3_0M722 midP0_0_3_1M722 midP0_0_4_0M722 midP0_1_0_0M722 midP0_1_0_1M722 midP0_1_0_2M722 midP0_1_0_3M722 midP0_1_0_4M722 midP0_1_1_0M722 midP0_1_1_1M722 midP0_1_1_2M722 midP0_1_1_3M722 midP0_1_2_0M722 midP0_1_2_1M722 midP0_1_2_2M722 midP0_1_3_0M722 midP0_1_3_1M722 midP0_1_4_0M722 midP0_2_0_0M722 midP0_2_0_1M722 midP0_2_0_2M722 midP0_2_0_3M722 midP0_2_0_4M722 midP0_2_1_0M722 midP0_2_1_1M722 midP0_2_1_2M722 midP0_2_1_3M722 midP0_2_2_0M722 midP0_2_2_1M722 midP0_2_2_2M722 midP0_2_3_0M722 midP0_2_3_1M722 midP0_2_4_0M722

def midTwoG4M8AE (J E : ℤ) : ℤ :=
 midG0_0_4M8AE J E

theorem middle_two_gap_eq4M8AE (J E : ℤ) : (((midP0_1_0_0M722 J E*midP0_1_0_4M722 J E + midP0_1_0_1M722 J E*midP0_1_0_3M722 J E) + (midP0_1_0_2M722 J E*midP0_1_0_2M722 J E + (midP0_1_0_3M722 J E*midP0_1_0_1M722 J E + midP0_1_0_4M722 J E*midP0_1_0_0M722 J E))))-(((midP0_0_0_0M722 J E*midP0_2_0_4M722 J E + midP0_0_0_1M722 J E*midP0_2_0_3M722 J E) + (midP0_0_0_2M722 J E*midP0_2_0_2M722 J E + (midP0_0_0_3M722 J E*midP0_2_0_1M722 J E + midP0_0_0_4M722 J E*midP0_2_0_0M722 J E))))=midTwoG4M8AE J E := by
 exact middle_gap_eq0_0_4M8AE J E

theorem middle_two_gap_nonneg4M8AE (J E : ℤ) (hJ : 0≤J) (hE : 0≤E) : 0≤ midTwoG4M8AE J E := by
 exact middle_gap_nonneg0_0_4M8AE J E hJ hE
end
end MathGKM.Markov
