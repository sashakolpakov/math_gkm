import MarkovPairOrder89ce
import MarkovDegreeTail7d90
/-! Machine-authored 89ce11ad. Scalar graded suffix positivity does not
imply preservation under all increasing log-concave degree weights.
The arrays here are auxiliary, not an asserted Markov source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

def tailExample89 : ℝ[X] := 1-X^4+X^8

theorem tailExample_gap89 :
 ((1+X^4:ℝ[X]))^2-X^2*(3*X^2)=tailExample89 := by
 unfold tailExample89
 ring

theorem tailExample_degree89 : tailExample89.natDegree=8 := by
 unfold tailExample89
 compute_degree!

theorem tailExample_tails89 : CoeffTailNonneg7d tailExample89 := by
 intro r hr
 rw [tailExample_degree89] at hr ⊢
 interval_cases r <;>
  norm_num [tailExample89,Finset.sum_range_succ,Polynomial.coeff_add,
    Polynomial.coeff_sub,Polynomial.coeff_X_pow,Polynomial.coeff_one]

def cappedWeight89 (i : ℕ) : ℝ := if i=0 then 1 else if i=1 then 10 else 100

theorem cappedWeight_nonneg89 (i : ℕ) : 0≤cappedWeight89 i := by
 unfold cappedWeight89
 split_ifs <;> norm_num

theorem cappedWeight_monotone89 : Monotone cappedWeight89 := by
 intro i j hij
 unfold cappedWeight89
 split_ifs <;> norm_num <;> omega

theorem cappedWeight_lc89 (i : ℕ) :
 cappedWeight89 i*cappedWeight89 (i+2)≤cappedWeight89 (i+1)^2 := by
 rcases i with _|i
 · norm_num [cappedWeight89]
 rcases i with _|i
 · norm_num [cappedWeight89]
 · norm_num [cappedWeight89]

theorem tailExample_weighted_failure89 :
 (cappedWeight89 0+cappedWeight89 4)^2-
   cappedWeight89 2*(3*cappedWeight89 2)=(-19799:ℝ) := by
 norm_num [cappedWeight89]

#print axioms tailExample_tails89
#print axioms cappedWeight_monotone89
#print axioms cappedWeight_lc89
#print axioms tailExample_weighted_failure89
end
end MathGKM.Markov
