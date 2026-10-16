import MarkovVerticalPolyM0D3
/-! Machine-authored 8f77f493. Raw small-column diagonal certificates. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

def smallGapupperM8F7 (x y : ℚ) : ℚ := (
   360000 +
   453600 * y +
   214884 * y^2 +
   45360 * y^3 +
   3600 * y^4 +
   404400 * x +
   470772 * x * y +
   205320 * x * y^2 +
   39744 * x * y^3 +
   2880 * x * y^4 +
   167569 * x^2 +
   169740 * x^2 * y +
   63048 * x^2 * y^2 +
   10080 * x^2 * y^3 +
   576 * x^2 * y^4 +
   32730 * x^3 +
   25800 * x^3 * y +
   6720 * x^3 * y^2 +
   576 * x^3 * y^3 +
   3373 * x^4 +
   1800 * x^4 * y +
   240 * x^4 * y^2 +
   180 * x^5 +
   48 * x^5 * y +
   4 * x^6
  ) / 36

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
   79524 +
   102084 * x +
   51373 * x^2 +
   13074 * x^3 +
   1813 * x^4 +
   132 * x^5 +
   4 * x^6
  ) / 36

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
   7056 +
   12264 * x +
   8857 * x^2 +
   3402 * x^3 +
   733 * x^4 +
   84 * x^5 +
   4 * x^6
  ) / 36

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
