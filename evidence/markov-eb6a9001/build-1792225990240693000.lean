import MarkovTopLeadingM55C
import MarkovPolynomialBoundMEB6
/-! Machine-authored eb6a9001. Exact raw high-column gap polynomial,
positive leading coefficient, and an explicit eventual bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def topGapPolyMEB6 (T i : ℕ) : Polynomial ℚ :=
 topMassPolyM55C T (i+1)*topMassPolyM55C T (i+1)-
 topMassPolyM55C T i*topMassPolyM55C T (i+2)

theorem top_gap_poly_evalMEB6 (d T i : ℕ) :
 (topGapPolyMEB6 T i).eval (d:ℚ)=
 (topMassM55C d T (i+1)^2-topMassM55C d T i*topMassM55C d T (i+2):ℤ) := by
 simp [topGapPolyMEB6,top_mass_poly_evalM55C,pow_two]

theorem top_gap_poly_degree_leMEB6 (T i : ℕ) :
 (topGapPolyMEB6 T i).natDegree ≤ 2*i+8 := by
 apply natDegree_sub_le_of_le
 · exact natDegree_mul_le.trans (by have := top_mass_poly_degreeM55C T (i+1); omega)
 · exact natDegree_mul_le.trans (by
     have := top_mass_poly_degreeM55C T i
     have := top_mass_poly_degreeM55C T (i+2)
     omega)

theorem top_gap_poly_topMEB6 (T i : ℕ) :
 (topGapPolyMEB6 T i).coeff (2*i+8)=
 topLeadingM55C T (i+1)^2-topLeadingM55C T i*topLeadingM55C T (i+2) := by
 unfold topGapPolyMEB6
 rw [coeff_sub]
 have h0 := coeff_mul_add_eq_of_natDegree_le
   (top_mass_poly_degreeM55C T (i+1)) (top_mass_poly_degreeM55C T (i+1))
 have h1 := coeff_mul_add_eq_of_natDegree_le
   (top_mass_poly_degreeM55C T i) (top_mass_poly_degreeM55C T (i+2))
 rw [show i+1+3+(i+1+3)=2*i+8 by omega,top_mass_poly_topM55C] at h0
 rw [show i+3+(i+2+3)=2*i+8 by omega,top_mass_poly_topM55C,top_mass_poly_topM55C] at h1
 rw [h0,h1,pow_two]

theorem top_gap_poly_degreeMEB6 (T i : ℕ) (hi : i+1 ≤ T) :
 (topGapPolyMEB6 T i).natDegree=2*i+8 := by
 apply natDegree_eq_of_le_of_coeff_ne_zero (top_gap_poly_degree_leMEB6 T i)
 rw [top_gap_poly_topMEB6]
 exact ne_of_gt (sub_pos.mpr (top_leading_strictM55C T i hi))

theorem top_gap_poly_leading_positiveMEB6 (T i : ℕ) (hi : i+1 ≤ T) :
 0 < (topGapPolyMEB6 T i).leadingCoeff := by
 rw [leadingCoeff,top_gap_poly_degreeMEB6 T i hi,top_gap_poly_topMEB6]
 exact sub_pos.mpr (top_leading_strictM55C T i hi)

def topGapThresholdMEB6 (T i : ℕ) : ℕ := positiveThresholdMEB6 (topGapPolyMEB6 T i)

theorem top_mass_strict_afterMEB6 (d T i : ℕ) (hi : i+1 ≤ T)
 (hd : topGapThresholdMEB6 T i ≤ d) :
 topMassM55C d T i*topMassM55C d T (i+2) < topMassM55C d T (i+1)^2 := by
 have h := polynomial_positive_afterMEB6 (topGapPolyMEB6 T i)
   (top_gap_poly_leading_positiveMEB6 T i hi) d hd
 rw [top_gap_poly_evalMEB6] at h
 exact sub_pos.mp (by exact_mod_cast h)

def topRowThresholdMEB6 (T : ℕ) : ℕ :=
 (range T).sup (topGapThresholdMEB6 T)

theorem top_mass_all_afterMEB6 (d T : ℕ) (hd : topRowThresholdMEB6 T ≤ d) (i : ℕ) :
 topMassM55C d T i*topMassM55C d T (i+2) ≤ topMassM55C d T (i+1)^2 := by
 by_cases hi : i < T
 · exact (top_mass_strict_afterMEB6 d T i (by omega)
     ((le_sup (f:=topGapThresholdMEB6 T) (mem_range.mpr hi)).trans hd)).le
 · rw [top_mass_zeroM55C d T (i+2) (by omega),mul_zero]
   exact sq_nonneg _

end
end MathGKM.Markov
