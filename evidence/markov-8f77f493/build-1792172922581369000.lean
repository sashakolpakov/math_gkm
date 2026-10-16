import MarkovVerticalPolyM0D3
/-! Machine-authored 8f77f493. Raw small-column diagonal certificates. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

def smallGapupperM8F7 (x y : ℚ) : ℚ := (
   1048320 +
   1287360 * y +
   593460 * y^2 +
   121680 * y^3 +
   9360 * y^4 +
   1271184 * x +
   1460628 * x * y +
   629400 * x * y^2 +
   120480 * x * y^3 +
   8640 * x * y^4 +
   554885 * x^2 +
   557460 * x^2 * y +
   206400 * x^2 * y^2 +
   33120 * x^2 * y^3 +
   1920 * x^2 * y^4 +
   113250 * x^3 +
   87720 * x^3 * y +
   22560 * x^3 * y^2 +
   1920 * x^3 * y^3 +
   12545 * x^4 +
   6480 * x^4 * y +
   840 * x^4 * y^2 +
   756 * x^5 +
   192 * x^5 * y +
   20 * x^6
  ) / 180

theorem small_gap_upperM8F7 (x y : ℚ) :
 upperPolynomialM0D3 2 (x+2) (y+2)^2 - upperPolynomialM0D3 1 (x+1) (y+3)*upperPolynomialM0D3 3 (x+3) (y+1)=smallGapupperM8F7 x y := by
 unfold smallGapupperM8F7
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem small_gap_upper_nonnegM8F7 (x y : ℚ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 0 ≤ upperPolynomialM0D3 2 (x+2) (y+2)^2 - upperPolynomialM0D3 1 (x+1) (y+3)*upperPolynomialM0D3 3 (x+3) (y+1) := by
 rw [small_gap_upperM8F7]
 unfold smallGapupperM8F7
 positivity

def smallGapcross0M8F7 (x : ℚ) : ℚ := (
   242100 +
   328116 * x +
   172625 * x^2 +
   46170 * x^3 +
   6905 * x^4 +
   564 * x^5 +
   20 * x^6
  ) / 180

theorem small_gap_cross0M8F7 (x : ℚ) :
 upperPolynomialM0D3 2 (x+2) 1^2 - upperPolynomialM0D3 1 (x+1) 2*lowerPolynomialM0D3 3 (x+3) 0=smallGapcross0M8F7 x := by
 unfold smallGapcross0M8F7
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem small_gap_cross0_nonnegM8F7 (x : ℚ) (hx : 0 ≤ x) :
 0 ≤ upperPolynomialM0D3 2 (x+2) 1^2 - upperPolynomialM0D3 1 (x+1) 2*lowerPolynomialM0D3 3 (x+3) 0 := by
 rw [small_gap_cross0M8F7]
 unfold smallGapcross0M8F7
 positivity

def smallGapcross1M8F7 (x : ℚ) : ℚ := (
   23760 +
   41928 * x +
   31325 * x^2 +
   12690 * x^3 +
   2945 * x^4 +
   372 * x^5 +
   20 * x^6
  ) / 180

theorem small_gap_cross1M8F7 (x : ℚ) :
 lowerPolynomialM0D3 2 (x+2) 0^2 - upperPolynomialM0D3 1 (x+1) 1*lowerPolynomialM0D3 3 (x+1) 1=smallGapcross1M8F7 x := by
 unfold smallGapcross1M8F7
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem small_gap_cross1_nonnegM8F7 (x : ℚ) (hx : 0 ≤ x) :
 0 ≤ lowerPolynomialM0D3 2 (x+2) 0^2 - upperPolynomialM0D3 1 (x+1) 1*lowerPolynomialM0D3 3 (x+1) 1 := by
 rw [small_gap_cross1M8F7]
 unfold smallGapcross1M8F7
 positivity

end
end MathGKM.Markov
