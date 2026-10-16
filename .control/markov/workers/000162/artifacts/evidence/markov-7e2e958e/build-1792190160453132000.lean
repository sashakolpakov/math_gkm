import MarkovQSourceM7E2
/-! Machine-authored 7e2e958e. Coefficientwise LC of the complete reversed
kernel polynomial. The varying positive-part truncation is not assumed to
preserve this property. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem comp_positiveM7E2 (p : Polynomial ℝ) (hp : ∀ k, 0 ≤ p.coeff k) (k : ℕ) :
 0 ≤ (p.comp (X+1)).coeff k := by
 conv in p.comp _ => rw [p.as_sum_support]
 simp only [Polynomial.sum_comp,Polynomial.monomial_comp,
   Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_X_add_one_pow]
 apply sum_nonneg
 intro s hs
 exact mul_nonneg (hp s) (by positivity)

theorem e_gap_identityM7E2 (j t : ℕ) :
 ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)=
 Polynomial.reflect (j+j)
   ((qPolyM7E2 j (t+1)^2-qPolyM7E2 j t*qPolyM7E2 j (t+2)).comp (X+1)) := by
 rw [Polynomial.sub_comp,Polynomial.pow_comp,Polynomial.mul_comp,
   Polynomial.reflect_sub,pow_two,pow_two]
 rw [Polynomial.reflect_mul _ _ (q_comp_degreeM7E2 j (t+1)) (q_comp_degreeM7E2 j (t+1)),
   Polynomial.reflect_mul _ _ (q_comp_degreeM7E2 j t) (q_comp_degreeM7E2 j (t+2))]
 rfl

theorem e_gap_nonnegM7E2 (j t k : ℕ) :
 0 ≤ (ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)).coeff k := by
 rw [e_gap_identityM7E2,Polynomial.coeff_reflect]
 exact comp_positiveM7E2 _ (q_gap_nonnegM7E2 j t) _

end
end MathGKM.Markov
