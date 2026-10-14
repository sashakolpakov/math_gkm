import MarkovPellHorizontalSum9a72
import MarkovPellLowerFormula26ca
/-! Machine-authored 65c4dfb8. An unbounded denominator certificate for one
refined horizontal fiber. This is not a proof of the universal fiber goal. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def fiberOutside65c4 (m : ℕ) : ℤ :=
 2*horizontalTerm9a72 (m+3) 2 0 1*horizontalTerm9a72 (m+3) 2 2 1-
 horizontalTerm9a72 (m+3) 2 0 0*horizontalTerm9a72 (m+3) 2 2 2-
 horizontalTerm9a72 (m+3) 2 0 2*horizontalTerm9a72 (m+3) 2 2 0
def fiberCenter65c4 (m : ℕ) : ℤ :=
 horizontalTerm9a72 (m+3) 2 1 1^2-
 horizontalTerm9a72 (m+3) 2 1 0*horizontalTerm9a72 (m+3) 2 1 2

theorem fiber_total_formula65c4 (m : ℕ) :
 2*((fiberOutside65c4 m : ℚ)+(fiberCenter65c4 m : ℚ))=
 31*(m:ℚ)^4+199*m^3+435*m^2+365*m+98 := by
 norm_num [fiberOutside65c4,fiberCenter65c4,horizontalTerm9a72,Nat.choose_one_right]
 push_cast
 simp only [choose_two_rat26ca,choose_three_rat26ca]
 push_cast
 ring

theorem fiber_center_nonneg65c4 (m : ℕ) : 0 ≤ fiberCenter65c4 m := by
 unfold fiberCenter65c4
 have hh := horizontal_term_lc9a72 (m+3) 2 1 0
 norm_num at hh
 linarith

theorem fiber_total_nonneg65c4 (m : ℕ) :
 0 ≤ fiberOutside65c4 m+fiberCenter65c4 m := by
 have h := fiber_total_formula65c4 m
 have hp : (0:ℚ) ≤ 31*(m:ℚ)^4+199*m^3+435*m^2+365*m+98 := by positivity
 have he : (0:ℚ) ≤ (fiberOutside65c4 m : ℚ)+(fiberCenter65c4 m : ℚ) := by linarith
 exact_mod_cast he

/-- All nonnegative log-concave weights on these three q positions preserve
the refined comparison, for every m. No source-weight closure is asserted. -/
theorem fiber_weighted_nonneg65c4 (m : ℕ) (x y z : ℝ)
 (hx : 0 ≤ x) (hz : 0 ≤ z) (hlc : x*z ≤ y^2) :
 0 ≤ (fiberOutside65c4 m : ℝ)*x*z+(fiberCenter65c4 m : ℝ)*y^2 := by
 have hc : (0:ℝ) ≤ fiberCenter65c4 m := by exact_mod_cast fiber_center_nonneg65c4 m
 have ht : (0:ℝ) ≤ (fiberOutside65c4 m : ℝ)+(fiberCenter65c4 m : ℝ) := by
   exact_mod_cast fiber_total_nonneg65c4 m
 have h1 := mul_nonneg ht (mul_nonneg hx hz)
 have h2 := mul_nonneg hc (sub_nonneg.mpr hlc)
 nlinarith

#print axioms fiber_total_formula65c4
#print axioms fiber_total_nonneg65c4
#print axioms fiber_weighted_nonneg65c4
end
end MathGKM.Markov
