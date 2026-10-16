import MarkovVerticalPolyM0D3
/-! Machine-authored 0d346fa7. A failed strengthening of the integer-domain
gap statement. A fractional offset does not index a source polynomial. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 4096

theorem continuous_lower_gap_valueM0D3 :
 lowerPolynomialM0D3 8 1 (5/4)^2 -
 lowerPolynomialM0D3 8 0 (9/4)*lowerPolynomialM0D3 8 2 (1/4) = -19/131072 := by
 norm_num [lowerPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]

theorem continuous_lower_gap_negativeM0D3 :
 lowerPolynomialM0D3 8 1 (5/4)^2 <
 lowerPolynomialM0D3 8 0 (9/4)*lowerPolynomialM0D3 8 2 (1/4) := by
 have h := continuous_lower_gap_valueM0D3
 linarith

theorem continuous_lower_certificate_failsM0D3 :
 ¬ (∀ (i : ℕ) (x y : ℚ), 5 ≤ i → 0 ≤ x → 0 ≤ y →
   lowerPolynomialM0D3 i x (y+2)*lowerPolynomialM0D3 i (x+2) y ≤
   lowerPolynomialM0D3 i (x+1) (y+1)^2) := by
 intro h
 have hh := h 8 0 (1/4) (by omega) (by norm_num) (by norm_num)
 norm_num only at hh
 exact (not_le_of_gt continuous_lower_gap_negativeM0D3) hh

end
end MathGKM.Markov
