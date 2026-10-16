import MarkovSmallSourceMEA
import MarkovTwoSourceMEA
import MarkovResidualM758
/-! Machine-authored ead8a96f. Every source second column, with raw zeros. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

theorem vertical_second_allMEA (path : List Bool) (j : ℕ) :
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 by_cases h5 : 5 ≤ (frame path).mid.a
 · exact vertical_second_largeM758 path h5 j
 by_cases h1 : (frame path).mid.a=1
 · exact (source_one_global6 path h1).2.1 2 j
 by_cases h2 : (frame path).mid.a=2
 · exact vertical_second_twoMEA path h2 j
 have h0 := (frame_reduced path).1
 exact vertical_second_three_fourMEA path (by omega) (by omega) j

theorem vertical_first_threeMEA (path : List Bool) (i j : ℕ) (hi : i ≤ 2) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 interval_cases i
 · exact vertical_boundary_raw46 path j
 · exact vertical_one_all274 path j
 · exact vertical_second_allMEA path j
end
end MathGKM.Markov
