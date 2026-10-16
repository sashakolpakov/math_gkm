import MarkovEightLowerPolyM295
import MarkovBinomialTableM295
import MarkovNewtonM295
/-! Machine-authored 29509309. Alternative split at the natural offset zero. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 64000000
set_option maxRecDepth 8192

def lowerZeroGapM295 (x : ℚ) : ℚ :=
 245025 * choosePolyM0D3 x 3 +
 50171121 * choosePolyM0D3 x 4 +
 3317976981 * choosePolyM0D3 x 5 +
 108608854959 * choosePolyM0D3 x 6 +
 2127494495016 * choosePolyM0D3 x 7 +
 27755866573974 * choosePolyM0D3 x 8 +
 258090564416454 * choosePolyM0D3 x 9 +
 1791141440477202 * choosePolyM0D3 x 10 +
 9586054128637503 * choosePolyM0D3 x 11 +
 40520464354437507 * choosePolyM0D3 x 12 +
 137690276463241623 * choosePolyM0D3 x 13 +
 381055607885173221 * choosePolyM0D3 x 14 +
 867001294167730722 * choosePolyM0D3 x 15 +
 1632256099696638108 * choosePolyM0D3 x 16 +
 2552380862153822172 * choosePolyM0D3 x 17 +
 3319524281640335868 * choosePolyM0D3 x 18 +
 3586667103025796790 * choosePolyM0D3 x 19 +
 3207299532596861526 * choosePolyM0D3 x 20 +
 2357262716597968014 * choosePolyM0D3 x 21 +
 1408520228887262106 * choosePolyM0D3 x 22 +
 673169239575345744 * choosePolyM0D3 x 23 +
 251150949409649652 * choosePolyM0D3 x 24 +
 70465384355483700 * choosePolyM0D3 x 25 +
 13982465974821300 * choosePolyM0D3 x 26 +
 1749226575096000 * choosePolyM0D3 x 27 +
 103742008999200 * choosePolyM0D3 x 28
theorem lower_zero_gapM295 (x : ℚ) :
 lowerPolynomialM0D3 8 (x+1) 1^2 -
 lowerPolynomialM0D3 8 x 2*lowerPolynomialM0D3 8 (x+2) 0 = lowerZeroGapM295 x := by
 simp_rw [lower_eight_polyM295]
 unfold lowerEightPolyM295 lowerZeroGapM295
 simp only [binomial_poly_3M295, binomial_poly_4M295, binomial_poly_5M295, binomial_poly_6M295, binomial_poly_7M295, binomial_poly_8M295, binomial_poly_9M295, binomial_poly_10M295, binomial_poly_11M295, binomial_poly_12M295, binomial_poly_13M295, binomial_poly_14M295, binomial_poly_15M295, binomial_poly_16M295, binomial_poly_17M295, binomial_poly_18M295, binomial_poly_19M295, binomial_poly_20M295, binomial_poly_21M295, binomial_poly_22M295, binomial_poly_23M295, binomial_poly_24M295, binomial_poly_25M295, binomial_poly_26M295, binomial_poly_27M295, binomial_poly_28M295]
 ring

theorem lower_zero_gap_nonnegM295 (x : ℕ) :
 0 ≤ lowerPolynomialM0D3 8 ((x:ℚ)+1) 1^2 -
 lowerPolynomialM0D3 8 x 2*lowerPolynomialM0D3 8 ((x:ℚ)+2) 0 := by
 rw [lower_zero_gapM295]
 unfold lowerZeroGapM295
 have hx3 := choose_poly_nat_nonnegM295 x 3
 have hx4 := choose_poly_nat_nonnegM295 x 4
 have hx5 := choose_poly_nat_nonnegM295 x 5
 have hx6 := choose_poly_nat_nonnegM295 x 6
 have hx7 := choose_poly_nat_nonnegM295 x 7
 have hx8 := choose_poly_nat_nonnegM295 x 8
 have hx9 := choose_poly_nat_nonnegM295 x 9
 have hx10 := choose_poly_nat_nonnegM295 x 10
 have hx11 := choose_poly_nat_nonnegM295 x 11
 have hx12 := choose_poly_nat_nonnegM295 x 12
 have hx13 := choose_poly_nat_nonnegM295 x 13
 have hx14 := choose_poly_nat_nonnegM295 x 14
 have hx15 := choose_poly_nat_nonnegM295 x 15
 have hx16 := choose_poly_nat_nonnegM295 x 16
 have hx17 := choose_poly_nat_nonnegM295 x 17
 have hx18 := choose_poly_nat_nonnegM295 x 18
 have hx19 := choose_poly_nat_nonnegM295 x 19
 have hx20 := choose_poly_nat_nonnegM295 x 20
 have hx21 := choose_poly_nat_nonnegM295 x 21
 have hx22 := choose_poly_nat_nonnegM295 x 22
 have hx23 := choose_poly_nat_nonnegM295 x 23
 have hx24 := choose_poly_nat_nonnegM295 x 24
 have hx25 := choose_poly_nat_nonnegM295 x 25
 have hx26 := choose_poly_nat_nonnegM295 x 26
 have hx27 := choose_poly_nat_nonnegM295 x 27
 have hx28 := choose_poly_nat_nonnegM295 x 28
 positivity
end
end MathGKM.Markov
