import MarkovMiddleGaps2M5D2
import MarkovMiddleValue2_0M722
import MarkovMiddleValue2_1M722
import MarkovMiddleValue2_2M722
/-! Machine-authored request 5dc9c88d. Grouped exact certificate layout. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
def midGapCol2_0M5D2 (J E R : ℤ) : ℤ := (midCol2_1_0M722 J E R*midCol2_1_0M722 J E R-midCol2_0_0M722 J E R*midCol2_2_0M722 J E R)

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_0M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_0M5D2 J E R := by
 have he : midGapCol2_0M5D2 J E R=(((midG2_0_0M5D2 J E*R^0 + midG2_1_0M5D2 J E*R^1) + (midG2_2_0M5D2 J E*R^2 + midG2_3_0M5D2 J E*R^3)) + ((midG2_4_0M5D2 J E*R^4 + midG2_5_0M5D2 J E*R^5) + (midG2_6_0M5D2 J E*R^6 + (midG2_7_0M5D2 J E*R^7 + midG2_8_0M5D2 J E*R^8)))) := by
  simp only [midGapCol2_0M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_0M5D2,←middle_gap_eq2_1_0M5D2,←middle_gap_eq2_2_0M5D2,←middle_gap_eq2_3_0M5D2,←middle_gap_eq2_4_0M5D2,←middle_gap_eq2_5_0M5D2,←middle_gap_eq2_6_0M5D2,←middle_gap_eq2_7_0M5D2,←middle_gap_eq2_8_0M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_0M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_0M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_0M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg2_3_0M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg2_4_0M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg2_5_0M5D2 J E hJ hE
 have hp6 := middle_gap_nonneg2_6_0M5D2 J E hJ hE
 have hp7 := middle_gap_nonneg2_7_0M5D2 J E hJ hE
 have hp8 := middle_gap_nonneg2_8_0M5D2 J E hJ hE
 positivity
def midGapCol2_1M5D2 (J E R : ℤ) : ℤ := ((midCol2_1_0M722 J E R*midCol2_1_1M722 J E R-midCol2_0_0M722 J E R*midCol2_2_1M722 J E R) + (midCol2_1_1M722 J E R*midCol2_1_0M722 J E R-midCol2_0_1M722 J E R*midCol2_2_0M722 J E R))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_1M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_1M5D2 J E R := by
 have he : midGapCol2_1M5D2 J E R=(((midG2_0_1M5D2 J E*R^0 + midG2_1_1M5D2 J E*R^1) + (midG2_2_1M5D2 J E*R^2 + midG2_3_1M5D2 J E*R^3)) + ((midG2_4_1M5D2 J E*R^4 + midG2_5_1M5D2 J E*R^5) + (midG2_6_1M5D2 J E*R^6 + midG2_7_1M5D2 J E*R^7))) := by
  simp only [midGapCol2_1M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_1M5D2,←middle_gap_eq2_1_1M5D2,←middle_gap_eq2_2_1M5D2,←middle_gap_eq2_3_1M5D2,←middle_gap_eq2_4_1M5D2,←middle_gap_eq2_5_1M5D2,←middle_gap_eq2_6_1M5D2,←middle_gap_eq2_7_1M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_1M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_1M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_1M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg2_3_1M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg2_4_1M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg2_5_1M5D2 J E hJ hE
 have hp6 := middle_gap_nonneg2_6_1M5D2 J E hJ hE
 have hp7 := middle_gap_nonneg2_7_1M5D2 J E hJ hE
 positivity
def midGapCol2_2M5D2 (J E R : ℤ) : ℤ := ((midCol2_1_0M722 J E R*midCol2_1_2M722 J E R-midCol2_0_0M722 J E R*midCol2_2_2M722 J E R) + ((midCol2_1_1M722 J E R*midCol2_1_1M722 J E R-midCol2_0_1M722 J E R*midCol2_2_1M722 J E R) + (midCol2_1_2M722 J E R*midCol2_1_0M722 J E R-midCol2_0_2M722 J E R*midCol2_2_0M722 J E R)))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_2M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_2M5D2 J E R := by
 have he : midGapCol2_2M5D2 J E R=((midG2_0_2M5D2 J E*R^0 + (midG2_1_2M5D2 J E*R^1 + midG2_2_2M5D2 J E*R^2)) + ((midG2_3_2M5D2 J E*R^3 + midG2_4_2M5D2 J E*R^4) + (midG2_5_2M5D2 J E*R^5 + midG2_6_2M5D2 J E*R^6))) := by
  simp only [midGapCol2_2M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_2M5D2,←middle_gap_eq2_1_2M5D2,←middle_gap_eq2_2_2M5D2,←middle_gap_eq2_3_2M5D2,←middle_gap_eq2_4_2M5D2,←middle_gap_eq2_5_2M5D2,←middle_gap_eq2_6_2M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_2M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_2M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_2M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg2_3_2M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg2_4_2M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg2_5_2M5D2 J E hJ hE
 have hp6 := middle_gap_nonneg2_6_2M5D2 J E hJ hE
 positivity
def midGapCol2_3M5D2 (J E R : ℤ) : ℤ := (((midCol2_1_0M722 J E R*midCol2_1_3M722 J E R-midCol2_0_0M722 J E R*midCol2_2_3M722 J E R) + (midCol2_1_1M722 J E R*midCol2_1_2M722 J E R-midCol2_0_1M722 J E R*midCol2_2_2M722 J E R)) + ((midCol2_1_2M722 J E R*midCol2_1_1M722 J E R-midCol2_0_2M722 J E R*midCol2_2_1M722 J E R) + (midCol2_1_3M722 J E R*midCol2_1_0M722 J E R-midCol2_0_3M722 J E R*midCol2_2_0M722 J E R)))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_3M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_3M5D2 J E R := by
 have he : midGapCol2_3M5D2 J E R=((midG2_0_3M5D2 J E*R^0 + (midG2_1_3M5D2 J E*R^1 + midG2_2_3M5D2 J E*R^2)) + (midG2_3_3M5D2 J E*R^3 + (midG2_4_3M5D2 J E*R^4 + midG2_5_3M5D2 J E*R^5))) := by
  simp only [midGapCol2_3M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_3M5D2,←middle_gap_eq2_1_3M5D2,←middle_gap_eq2_2_3M5D2,←middle_gap_eq2_3_3M5D2,←middle_gap_eq2_4_3M5D2,←middle_gap_eq2_5_3M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_3M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_3M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_3M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg2_3_3M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg2_4_3M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg2_5_3M5D2 J E hJ hE
 positivity
def midGapCol2_4M5D2 (J E R : ℤ) : ℤ := (((midCol2_1_0M722 J E R*midCol2_1_4M722 J E R-midCol2_0_0M722 J E R*midCol2_2_4M722 J E R) + (midCol2_1_1M722 J E R*midCol2_1_3M722 J E R-midCol2_0_1M722 J E R*midCol2_2_3M722 J E R)) + ((midCol2_1_2M722 J E R*midCol2_1_2M722 J E R-midCol2_0_2M722 J E R*midCol2_2_2M722 J E R) + ((midCol2_1_3M722 J E R*midCol2_1_1M722 J E R-midCol2_0_3M722 J E R*midCol2_2_1M722 J E R) + (midCol2_1_4M722 J E R*midCol2_1_0M722 J E R-midCol2_0_4M722 J E R*midCol2_2_0M722 J E R))))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_4M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_4M5D2 J E R := by
 have he : midGapCol2_4M5D2 J E R=((midG2_0_4M5D2 J E*R^0 + midG2_1_4M5D2 J E*R^1) + (midG2_2_4M5D2 J E*R^2 + (midG2_3_4M5D2 J E*R^3 + midG2_4_4M5D2 J E*R^4))) := by
  simp only [midGapCol2_4M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_4M5D2,←middle_gap_eq2_1_4M5D2,←middle_gap_eq2_2_4M5D2,←middle_gap_eq2_3_4M5D2,←middle_gap_eq2_4_4M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_4M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_4M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_4M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg2_3_4M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg2_4_4M5D2 J E hJ hE
 positivity
def midGapCol2_5M5D2 (J E R : ℤ) : ℤ := (((midCol2_1_1M722 J E R*midCol2_1_4M722 J E R-midCol2_0_1M722 J E R*midCol2_2_4M722 J E R) + (midCol2_1_2M722 J E R*midCol2_1_3M722 J E R-midCol2_0_2M722 J E R*midCol2_2_3M722 J E R)) + ((midCol2_1_3M722 J E R*midCol2_1_2M722 J E R-midCol2_0_3M722 J E R*midCol2_2_2M722 J E R) + (midCol2_1_4M722 J E R*midCol2_1_1M722 J E R-midCol2_0_4M722 J E R*midCol2_2_1M722 J E R)))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_5M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_5M5D2 J E R := by
 have he : midGapCol2_5M5D2 J E R=((midG2_0_5M5D2 J E*R^0 + midG2_1_5M5D2 J E*R^1) + (midG2_2_5M5D2 J E*R^2 + midG2_3_5M5D2 J E*R^3)) := by
  simp only [midGapCol2_5M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_5M5D2,←middle_gap_eq2_1_5M5D2,←middle_gap_eq2_2_5M5D2,←middle_gap_eq2_3_5M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_5M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_5M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_5M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg2_3_5M5D2 J E hJ hE
 positivity
def midGapCol2_6M5D2 (J E R : ℤ) : ℤ := ((midCol2_1_2M722 J E R*midCol2_1_4M722 J E R-midCol2_0_2M722 J E R*midCol2_2_4M722 J E R) + ((midCol2_1_3M722 J E R*midCol2_1_3M722 J E R-midCol2_0_3M722 J E R*midCol2_2_3M722 J E R) + (midCol2_1_4M722 J E R*midCol2_1_2M722 J E R-midCol2_0_4M722 J E R*midCol2_2_2M722 J E R)))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_6M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_6M5D2 J E R := by
 have he : midGapCol2_6M5D2 J E R=(midG2_0_6M5D2 J E*R^0 + (midG2_1_6M5D2 J E*R^1 + midG2_2_6M5D2 J E*R^2)) := by
  simp only [midGapCol2_6M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_6M5D2,←middle_gap_eq2_1_6M5D2,←middle_gap_eq2_2_6M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_6M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_6M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg2_2_6M5D2 J E hJ hE
 positivity
def midGapCol2_7M5D2 (J E R : ℤ) : ℤ := ((midCol2_1_3M722 J E R*midCol2_1_4M722 J E R-midCol2_0_3M722 J E R*midCol2_2_4M722 J E R) + (midCol2_1_4M722 J E R*midCol2_1_3M722 J E R-midCol2_0_4M722 J E R*midCol2_2_3M722 J E R))

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_7M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_7M5D2 J E R := by
 have he : midGapCol2_7M5D2 J E R=(midG2_0_7M5D2 J E*R^0 + midG2_1_7M5D2 J E*R^1) := by
  simp only [midGapCol2_7M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_7M5D2,←middle_gap_eq2_1_7M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_7M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg2_1_7M5D2 J E hJ hE
 positivity
def midGapCol2_8M5D2 (J E R : ℤ) : ℤ := (midCol2_1_4M722 J E R*midCol2_1_4M722 J E R-midCol2_0_4M722 J E R*midCol2_2_4M722 J E R)

attribute [local irreducible] midP2_0_0_0M722 midP2_0_1_0M722 midP2_0_2_0M722 midP2_0_3_0M722 midP2_0_4_0M722 midP2_0_0_1M722 midP2_0_1_1M722 midP2_0_2_1M722 midP2_0_3_1M722 midP2_0_0_2M722 midP2_0_1_2M722 midP2_0_2_2M722 midP2_0_0_3M722 midP2_0_1_3M722 midP2_0_0_4M722 midP2_1_0_0M722 midP2_1_1_0M722 midP2_1_2_0M722 midP2_1_3_0M722 midP2_1_4_0M722 midP2_1_0_1M722 midP2_1_1_1M722 midP2_1_2_1M722 midP2_1_3_1M722 midP2_1_0_2M722 midP2_1_1_2M722 midP2_1_2_2M722 midP2_1_0_3M722 midP2_1_1_3M722 midP2_1_0_4M722 midP2_2_0_0M722 midP2_2_1_0M722 midP2_2_2_0M722 midP2_2_3_0M722 midP2_2_4_0M722 midP2_2_0_1M722 midP2_2_1_1M722 midP2_2_2_1M722 midP2_2_3_1M722 midP2_2_0_2M722 midP2_2_1_2M722 midP2_2_2_2M722 midP2_2_0_3M722 midP2_2_1_3M722 midP2_2_0_4M722

theorem middle_column_nonneg2_8M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol2_8M5D2 J E R := by
 have he : midGapCol2_8M5D2 J E R=midG2_0_8M5D2 J E*R^0 := by
  simp only [midGapCol2_8M5D2, midCol2_0_0M722, midCol2_0_1M722, midCol2_0_2M722, midCol2_0_3M722, midCol2_0_4M722, midCol2_1_0M722, midCol2_1_1M722, midCol2_1_2M722, midCol2_1_3M722, midCol2_1_4M722, midCol2_2_0M722, midCol2_2_1M722, midCol2_2_2M722, midCol2_2_3M722, midCol2_2_4M722]
  rw [←middle_gap_eq2_0_8M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg2_0_8M5D2 J E hJ hE
 positivity
end
end MathGKM.Markov

/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

attribute [local irreducible] midCol2_0_0M722 midCol2_0_1M722 midCol2_0_2M722 midCol2_0_3M722 midCol2_0_4M722 midCol2_1_0M722 midCol2_1_1M722 midCol2_1_2M722 midCol2_1_3M722 midCol2_1_4M722 midCol2_2_0M722 midCol2_2_1M722 midCol2_2_2M722 midCol2_2_3M722 midCol2_2_4M722

theorem middle_chart2M5D2 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) : middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+6)*middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+8) ≤ middleShape3M722 (J+E+6) (2*C+R+5) (C+R+3) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value2_0M722,middle_value2_1M722,middle_value2_2M722]
 have he : ((midCol2_1_0M722 J E R*C^0 + midCol2_1_1M722 J E R*C^1) + (midCol2_1_2M722 J E R*C^2 + (midCol2_1_3M722 J E R*C^3 + midCol2_1_4M722 J E R*C^4)))^2-((midCol2_0_0M722 J E R*C^0 + midCol2_0_1M722 J E R*C^1) + (midCol2_0_2M722 J E R*C^2 + (midCol2_0_3M722 J E R*C^3 + midCol2_0_4M722 J E R*C^4)))*((midCol2_2_0M722 J E R*C^0 + midCol2_2_1M722 J E R*C^1) + (midCol2_2_2M722 J E R*C^2 + (midCol2_2_3M722 J E R*C^3 + midCol2_2_4M722 J E R*C^4)))=(((midGapCol2_0M5D2 J E R*C^0 + midGapCol2_1M5D2 J E R*C^1) + (midGapCol2_2M5D2 J E R*C^2 + midGapCol2_3M5D2 J E R*C^3)) + ((midGapCol2_4M5D2 J E R*C^4 + midGapCol2_5M5D2 J E R*C^5) + (midGapCol2_6M5D2 J E R*C^6 + (midGapCol2_7M5D2 J E R*C^7 + midGapCol2_8M5D2 J E R*C^8)))) := by
  unfold midGapCol2_0M5D2 midGapCol2_1M5D2 midGapCol2_2M5D2 midGapCol2_3M5D2 midGapCol2_4M5D2 midGapCol2_5M5D2 midGapCol2_6M5D2 midGapCol2_7M5D2 midGapCol2_8M5D2
  ring
 rw [he]
 have hp0 := middle_column_nonneg2_0M5D2 J E R hJ hE hR
 have hp1 := middle_column_nonneg2_1M5D2 J E R hJ hE hR
 have hp2 := middle_column_nonneg2_2M5D2 J E R hJ hE hR
 have hp3 := middle_column_nonneg2_3M5D2 J E R hJ hE hR
 have hp4 := middle_column_nonneg2_4M5D2 J E R hJ hE hR
 have hp5 := middle_column_nonneg2_5M5D2 J E R hJ hE hR
 have hp6 := middle_column_nonneg2_6M5D2 J E R hJ hE hR
 have hp7 := middle_column_nonneg2_7M5D2 J E R hJ hE hR
 have hp8 := middle_column_nonneg2_8M5D2 J E R hJ hE hR
 positivity
end
end MathGKM.Markov
