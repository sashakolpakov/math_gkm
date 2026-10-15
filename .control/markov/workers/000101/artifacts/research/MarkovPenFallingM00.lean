import MarkovPenultimateM1B
/-! Machine-authored live request 00a02b28. Exact middle-slice extraction, not LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768

def penFallingM00 (n c r q t u e : ℤ) : ℤ :=
 penPart0M1B n c r q t u*fallingSevenK0B (e+7-0) + penPart1M1B n c r q t u*fallingSevenK0B (e+7-1) + penPart2M1B n c r q t u*fallingSevenK0B (e+7-2) + penPart3M1B n c r q t u*fallingSevenK0B (e+7-3) + penPart4M1B n c r q t u*fallingSevenK0B (e+7-4) + penPart5M1B n c r q t u*fallingSevenK0B (e+7-5) + penPart6M1B n c r q t u*fallingSevenK0B (e+7-6) + penPart7M1B n c r q t u*fallingSevenK0B (e+7-7) + penPart8M1B n c r q t u*fallingSevenK0B (e+7-8) + penPart9M1B n c r q t u*fallingSevenK0B (e+7-9) + penPart10M1B n c r q t u*fallingSevenK0B (e+7-10)

theorem pen_convolutionM00 (n c r q t u : ℤ) (j : ℕ) (hj : 3≤j) :
 5040*convSevenK0B (penPolyM1B n c r q t u) j=penFallingM00 n c r q t u j := by
 unfold penPolyM1B penFallingM00
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 have h0 := chooseShiftSeven_fallingK0B j 0 (by omega)
 norm_num only [Nat.cast_ofNat] at h0
 have h1 := chooseShiftSeven_fallingK0B j 1 (by omega)
 norm_num only [Nat.cast_ofNat] at h1
 have h2 := chooseShiftSeven_fallingK0B j 2 (by omega)
 norm_num only [Nat.cast_ofNat] at h2
 have h3 := chooseShiftSeven_fallingK0B j 3 (by omega)
 norm_num only [Nat.cast_ofNat] at h3
 have h4 := chooseShiftSeven_fallingK0B j 4 (by omega)
 norm_num only [Nat.cast_ofNat] at h4
 have h5 := chooseShiftSeven_fallingK0B j 5 (by omega)
 norm_num only [Nat.cast_ofNat] at h5
 have h6 := chooseShiftSeven_fallingK0B j 6 (by omega)
 norm_num only [Nat.cast_ofNat] at h6
 have h7 := chooseShiftSeven_fallingK0B j 7 (by omega)
 norm_num only [Nat.cast_ofNat] at h7
 have h8 := chooseShiftSeven_fallingK0B j 8 (by omega)
 norm_num only [Nat.cast_ofNat] at h8
 have h9 := chooseShiftSeven_fallingK0B j 9 (by omega)
 norm_num only [Nat.cast_ofNat] at h9
 have h10 := chooseShiftSeven_fallingK0B j 10 (by omega)
 norm_num only [Nat.cast_ofNat] at h10
 linear_combination penPart0M1B n c r q t u*h0+penPart1M1B n c r q t u*h1+penPart2M1B n c r q t u*h2+penPart3M1B n c r q t u*h3+penPart4M1B n c r q t u*h4+penPart5M1B n c r q t u*h5+penPart6M1B n c r q t u*h6+penPart7M1B n c r q t u*h7+penPart8M1B n c r q t u*h8+penPart9M1B n c r q t u*h9+penPart10M1B n c r q t u*h10
end
end MathGKM.Markov
