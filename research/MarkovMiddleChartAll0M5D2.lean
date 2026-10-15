import MarkovMiddleGaps0M5D2
import MarkovMiddleValue0_0M722
import MarkovMiddleValue0_1M722
import MarkovMiddleValue0_2M722
/-! Machine-authored request 5dc9c88d. Grouped exact certificate layout. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
def midGapCol0_0M5D2 (J E R : ℤ) : ℤ := (midCol0_1_0M722 J E R*midCol0_1_0M722 J E R-midCol0_0_0M722 J E R*midCol0_2_0M722 J E R)

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_0M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_0M5D2 J E R := by
 have he : midGapCol0_0M5D2 J E R=(((midG0_0_0M5D2 J E*R^0 + midG0_1_0M5D2 J E*R^1) + (midG0_2_0M5D2 J E*R^2 + midG0_3_0M5D2 J E*R^3)) + ((midG0_4_0M5D2 J E*R^4 + midG0_5_0M5D2 J E*R^5) + (midG0_6_0M5D2 J E*R^6 + (midG0_7_0M5D2 J E*R^7 + midG0_8_0M5D2 J E*R^8)))) := by
  simp only [midGapCol0_0M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_0M5D2,←middle_gap_eq0_1_0M5D2,←middle_gap_eq0_2_0M5D2,←middle_gap_eq0_3_0M5D2,←middle_gap_eq0_4_0M5D2,←middle_gap_eq0_5_0M5D2,←middle_gap_eq0_6_0M5D2,←middle_gap_eq0_7_0M5D2,←middle_gap_eq0_8_0M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_0M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_0M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_0M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_0M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg0_4_0M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg0_5_0M5D2 J E hJ hE
 have hp6 := middle_gap_nonneg0_6_0M5D2 J E hJ hE
 have hp7 := middle_gap_nonneg0_7_0M5D2 J E hJ hE
 have hp8 := middle_gap_nonneg0_8_0M5D2 J E hJ hE
 positivity
def midGapCol0_1M5D2 (J E R : ℤ) : ℤ := ((midCol0_1_0M722 J E R*midCol0_1_1M722 J E R-midCol0_0_0M722 J E R*midCol0_2_1M722 J E R) + (midCol0_1_1M722 J E R*midCol0_1_0M722 J E R-midCol0_0_1M722 J E R*midCol0_2_0M722 J E R))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_1M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_1M5D2 J E R := by
 have he : midGapCol0_1M5D2 J E R=(((midG0_0_1M5D2 J E*R^0 + midG0_1_1M5D2 J E*R^1) + (midG0_2_1M5D2 J E*R^2 + midG0_3_1M5D2 J E*R^3)) + ((midG0_4_1M5D2 J E*R^4 + midG0_5_1M5D2 J E*R^5) + (midG0_6_1M5D2 J E*R^6 + midG0_7_1M5D2 J E*R^7))) := by
  simp only [midGapCol0_1M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_1M5D2,←middle_gap_eq0_1_1M5D2,←middle_gap_eq0_2_1M5D2,←middle_gap_eq0_3_1M5D2,←middle_gap_eq0_4_1M5D2,←middle_gap_eq0_5_1M5D2,←middle_gap_eq0_6_1M5D2,←middle_gap_eq0_7_1M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_1M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_1M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_1M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_1M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg0_4_1M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg0_5_1M5D2 J E hJ hE
 have hp6 := middle_gap_nonneg0_6_1M5D2 J E hJ hE
 have hp7 := middle_gap_nonneg0_7_1M5D2 J E hJ hE
 positivity
def midGapCol0_2M5D2 (J E R : ℤ) : ℤ := ((midCol0_1_0M722 J E R*midCol0_1_2M722 J E R-midCol0_0_0M722 J E R*midCol0_2_2M722 J E R) + ((midCol0_1_1M722 J E R*midCol0_1_1M722 J E R-midCol0_0_1M722 J E R*midCol0_2_1M722 J E R) + (midCol0_1_2M722 J E R*midCol0_1_0M722 J E R-midCol0_0_2M722 J E R*midCol0_2_0M722 J E R)))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_2M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_2M5D2 J E R := by
 have he : midGapCol0_2M5D2 J E R=((midG0_0_2M5D2 J E*R^0 + (midG0_1_2M5D2 J E*R^1 + midG0_2_2M5D2 J E*R^2)) + ((midG0_3_2M5D2 J E*R^3 + midG0_4_2M5D2 J E*R^4) + (midG0_5_2M5D2 J E*R^5 + midG0_6_2M5D2 J E*R^6))) := by
  simp only [midGapCol0_2M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_2M5D2,←middle_gap_eq0_1_2M5D2,←middle_gap_eq0_2_2M5D2,←middle_gap_eq0_3_2M5D2,←middle_gap_eq0_4_2M5D2,←middle_gap_eq0_5_2M5D2,←middle_gap_eq0_6_2M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_2M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_2M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_2M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_2M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg0_4_2M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg0_5_2M5D2 J E hJ hE
 have hp6 := middle_gap_nonneg0_6_2M5D2 J E hJ hE
 positivity
def midGapCol0_3M5D2 (J E R : ℤ) : ℤ := (((midCol0_1_0M722 J E R*midCol0_1_3M722 J E R-midCol0_0_0M722 J E R*midCol0_2_3M722 J E R) + (midCol0_1_1M722 J E R*midCol0_1_2M722 J E R-midCol0_0_1M722 J E R*midCol0_2_2M722 J E R)) + ((midCol0_1_2M722 J E R*midCol0_1_1M722 J E R-midCol0_0_2M722 J E R*midCol0_2_1M722 J E R) + (midCol0_1_3M722 J E R*midCol0_1_0M722 J E R-midCol0_0_3M722 J E R*midCol0_2_0M722 J E R)))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_3M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_3M5D2 J E R := by
 have he : midGapCol0_3M5D2 J E R=((midG0_0_3M5D2 J E*R^0 + (midG0_1_3M5D2 J E*R^1 + midG0_2_3M5D2 J E*R^2)) + (midG0_3_3M5D2 J E*R^3 + (midG0_4_3M5D2 J E*R^4 + midG0_5_3M5D2 J E*R^5))) := by
  simp only [midGapCol0_3M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_3M5D2,←middle_gap_eq0_1_3M5D2,←middle_gap_eq0_2_3M5D2,←middle_gap_eq0_3_3M5D2,←middle_gap_eq0_4_3M5D2,←middle_gap_eq0_5_3M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_3M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_3M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_3M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_3M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg0_4_3M5D2 J E hJ hE
 have hp5 := middle_gap_nonneg0_5_3M5D2 J E hJ hE
 positivity
def midGapCol0_4M5D2 (J E R : ℤ) : ℤ := (((midCol0_1_0M722 J E R*midCol0_1_4M722 J E R-midCol0_0_0M722 J E R*midCol0_2_4M722 J E R) + (midCol0_1_1M722 J E R*midCol0_1_3M722 J E R-midCol0_0_1M722 J E R*midCol0_2_3M722 J E R)) + ((midCol0_1_2M722 J E R*midCol0_1_2M722 J E R-midCol0_0_2M722 J E R*midCol0_2_2M722 J E R) + ((midCol0_1_3M722 J E R*midCol0_1_1M722 J E R-midCol0_0_3M722 J E R*midCol0_2_1M722 J E R) + (midCol0_1_4M722 J E R*midCol0_1_0M722 J E R-midCol0_0_4M722 J E R*midCol0_2_0M722 J E R))))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_4M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_4M5D2 J E R := by
 have he : midGapCol0_4M5D2 J E R=((midG0_0_4M5D2 J E*R^0 + midG0_1_4M5D2 J E*R^1) + (midG0_2_4M5D2 J E*R^2 + (midG0_3_4M5D2 J E*R^3 + midG0_4_4M5D2 J E*R^4))) := by
  simp only [midGapCol0_4M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_4M5D2,←middle_gap_eq0_1_4M5D2,←middle_gap_eq0_2_4M5D2,←middle_gap_eq0_3_4M5D2,←middle_gap_eq0_4_4M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_4M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_4M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_4M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_4M5D2 J E hJ hE
 have hp4 := middle_gap_nonneg0_4_4M5D2 J E hJ hE
 positivity
def midGapCol0_5M5D2 (J E R : ℤ) : ℤ := (((midCol0_1_1M722 J E R*midCol0_1_4M722 J E R-midCol0_0_1M722 J E R*midCol0_2_4M722 J E R) + (midCol0_1_2M722 J E R*midCol0_1_3M722 J E R-midCol0_0_2M722 J E R*midCol0_2_3M722 J E R)) + ((midCol0_1_3M722 J E R*midCol0_1_2M722 J E R-midCol0_0_3M722 J E R*midCol0_2_2M722 J E R) + (midCol0_1_4M722 J E R*midCol0_1_1M722 J E R-midCol0_0_4M722 J E R*midCol0_2_1M722 J E R)))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_5M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_5M5D2 J E R := by
 have he : midGapCol0_5M5D2 J E R=((midG0_0_5M5D2 J E*R^0 + midG0_1_5M5D2 J E*R^1) + (midG0_2_5M5D2 J E*R^2 + midG0_3_5M5D2 J E*R^3)) := by
  simp only [midGapCol0_5M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_5M5D2,←middle_gap_eq0_1_5M5D2,←middle_gap_eq0_2_5M5D2,←middle_gap_eq0_3_5M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_5M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_5M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_5M5D2 J E hJ hE
 have hp3 := middle_gap_nonneg0_3_5M5D2 J E hJ hE
 positivity
def midGapCol0_6M5D2 (J E R : ℤ) : ℤ := ((midCol0_1_2M722 J E R*midCol0_1_4M722 J E R-midCol0_0_2M722 J E R*midCol0_2_4M722 J E R) + ((midCol0_1_3M722 J E R*midCol0_1_3M722 J E R-midCol0_0_3M722 J E R*midCol0_2_3M722 J E R) + (midCol0_1_4M722 J E R*midCol0_1_2M722 J E R-midCol0_0_4M722 J E R*midCol0_2_2M722 J E R)))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_6M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_6M5D2 J E R := by
 have he : midGapCol0_6M5D2 J E R=(midG0_0_6M5D2 J E*R^0 + (midG0_1_6M5D2 J E*R^1 + midG0_2_6M5D2 J E*R^2)) := by
  simp only [midGapCol0_6M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_6M5D2,←middle_gap_eq0_1_6M5D2,←middle_gap_eq0_2_6M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_6M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_6M5D2 J E hJ hE
 have hp2 := middle_gap_nonneg0_2_6M5D2 J E hJ hE
 positivity
def midGapCol0_7M5D2 (J E R : ℤ) : ℤ := ((midCol0_1_3M722 J E R*midCol0_1_4M722 J E R-midCol0_0_3M722 J E R*midCol0_2_4M722 J E R) + (midCol0_1_4M722 J E R*midCol0_1_3M722 J E R-midCol0_0_4M722 J E R*midCol0_2_3M722 J E R))

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_7M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_7M5D2 J E R := by
 have he : midGapCol0_7M5D2 J E R=(midG0_0_7M5D2 J E*R^0 + midG0_1_7M5D2 J E*R^1) := by
  simp only [midGapCol0_7M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_7M5D2,←middle_gap_eq0_1_7M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_7M5D2 J E hJ hE
 have hp1 := middle_gap_nonneg0_1_7M5D2 J E hJ hE
 positivity
def midGapCol0_8M5D2 (J E R : ℤ) : ℤ := (midCol0_1_4M722 J E R*midCol0_1_4M722 J E R-midCol0_0_4M722 J E R*midCol0_2_4M722 J E R)

attribute [local irreducible] midP0_0_0_0M722 midP0_0_1_0M722 midP0_0_2_0M722 midP0_0_3_0M722 midP0_0_4_0M722 midP0_0_0_1M722 midP0_0_1_1M722 midP0_0_2_1M722 midP0_0_3_1M722 midP0_0_0_2M722 midP0_0_1_2M722 midP0_0_2_2M722 midP0_0_0_3M722 midP0_0_1_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_1_0M722 midP0_1_2_0M722 midP0_1_3_0M722 midP0_1_4_0M722 midP0_1_0_1M722 midP0_1_1_1M722 midP0_1_2_1M722 midP0_1_3_1M722 midP0_1_0_2M722 midP0_1_1_2M722 midP0_1_2_2M722 midP0_1_0_3M722 midP0_1_1_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_1_0M722 midP0_2_2_0M722 midP0_2_3_0M722 midP0_2_4_0M722 midP0_2_0_1M722 midP0_2_1_1M722 midP0_2_2_1M722 midP0_2_3_1M722 midP0_2_0_2M722 midP0_2_1_2M722 midP0_2_2_2M722 midP0_2_0_3M722 midP0_2_1_3M722 midP0_2_0_4M722

theorem middle_column_nonneg0_8M5D2 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ midGapCol0_8M5D2 J E R := by
 have he : midGapCol0_8M5D2 J E R=midG0_0_8M5D2 J E*R^0 := by
  simp only [midGapCol0_8M5D2, midCol0_0_0M722, midCol0_0_1M722, midCol0_0_2M722, midCol0_0_3M722, midCol0_0_4M722, midCol0_1_0M722, midCol0_1_1M722, midCol0_1_2M722, midCol0_1_3M722, midCol0_1_4M722, midCol0_2_0M722, midCol0_2_1M722, midCol0_2_2M722, midCol0_2_3M722, midCol0_2_4M722]
  rw [←middle_gap_eq0_0_8M5D2]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_8M5D2 J E hJ hE
 positivity
end
end MathGKM.Markov

/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false

attribute [local irreducible] midCol0_0_0M722 midCol0_0_1M722 midCol0_0_2M722 midCol0_0_3M722 midCol0_0_4M722 midCol0_1_0M722 midCol0_1_1M722 midCol0_1_2M722 midCol0_1_3M722 midCol0_1_4M722 midCol0_2_0M722 midCol0_2_1M722 midCol0_2_2M722 midCol0_2_3M722 midCol0_2_4M722

theorem middle_chart0M5D2 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) : middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+6)*middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+8) ≤ middleShape0M722 (J+E+6) (2*R+C+5) (R+2) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value0_0M722,middle_value0_1M722,middle_value0_2M722]
 have he : ((midCol0_1_0M722 J E R*C^0 + midCol0_1_1M722 J E R*C^1) + (midCol0_1_2M722 J E R*C^2 + (midCol0_1_3M722 J E R*C^3 + midCol0_1_4M722 J E R*C^4)))^2-((midCol0_0_0M722 J E R*C^0 + midCol0_0_1M722 J E R*C^1) + (midCol0_0_2M722 J E R*C^2 + (midCol0_0_3M722 J E R*C^3 + midCol0_0_4M722 J E R*C^4)))*((midCol0_2_0M722 J E R*C^0 + midCol0_2_1M722 J E R*C^1) + (midCol0_2_2M722 J E R*C^2 + (midCol0_2_3M722 J E R*C^3 + midCol0_2_4M722 J E R*C^4)))=(((midGapCol0_0M5D2 J E R*C^0 + midGapCol0_1M5D2 J E R*C^1) + (midGapCol0_2M5D2 J E R*C^2 + midGapCol0_3M5D2 J E R*C^3)) + ((midGapCol0_4M5D2 J E R*C^4 + midGapCol0_5M5D2 J E R*C^5) + (midGapCol0_6M5D2 J E R*C^6 + (midGapCol0_7M5D2 J E R*C^7 + midGapCol0_8M5D2 J E R*C^8)))) := by
  unfold midGapCol0_0M5D2 midGapCol0_1M5D2 midGapCol0_2M5D2 midGapCol0_3M5D2 midGapCol0_4M5D2 midGapCol0_5M5D2 midGapCol0_6M5D2 midGapCol0_7M5D2 midGapCol0_8M5D2
  ring
 rw [he]
 have hp0 := middle_column_nonneg0_0M5D2 J E R hJ hE hR
 have hp1 := middle_column_nonneg0_1M5D2 J E R hJ hE hR
 have hp2 := middle_column_nonneg0_2M5D2 J E R hJ hE hR
 have hp3 := middle_column_nonneg0_3M5D2 J E R hJ hE hR
 have hp4 := middle_column_nonneg0_4M5D2 J E R hJ hE hR
 have hp5 := middle_column_nonneg0_5M5D2 J E R hJ hE hR
 have hp6 := middle_column_nonneg0_6M5D2 J E R hJ hE hR
 have hp7 := middle_column_nonneg0_7M5D2 J E R hJ hE hR
 have hp8 := middle_column_nonneg0_8M5D2 J E R hJ hE hR
 positivity
end
end MathGKM.Markov
