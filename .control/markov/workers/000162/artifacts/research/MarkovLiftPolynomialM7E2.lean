import MarkovExtendedShapeM7E2
import MarkovLiftSupportMAE9
/-! Machine-authored 7e2e958e. Exact triangular lift polynomial and its
untruncated tail shape. The low-parameter truncation remains explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def liftPolyM7E2 (j t : ℕ) : Polynomial ℝ :=
 ∑ r ∈ range (t+1), monomial r (liftTermMAE9 j t (t-r):ℝ)

theorem lift_poly_coeffM7E2 (j t r : ℕ) :
 (liftPolyM7E2 j t).coeff r=(reverseLiftMAE9 j t r:ℝ) := by
 classical
 simp [liftPolyM7E2,Polynomial.coeff_monomial,Finset.sum_ite_eq',Nat.lt_succ_iff,
   reverseLiftMAE9]

theorem lift_term_tailM7E2 (j t m : ℕ) (hm : j < m) : liftTermMAE9 j t m=0 := by
 simp [liftTermMAE9,Nat.choose_eq_zero_of_lt (by omega : t+j+3<t+m+3),
   Nat.choose_eq_zero_of_lt (by omega : t+j+4<t+m+5)]

theorem lift_poly_shiftM7E2 (j t : ℕ) (hjt : j ≤ t) :
 liftPolyM7E2 j t=X^(t-j)*ePolyM7E2 j t := by
 ext r
 rw [lift_poly_coeffM7E2,Polynomial.coeff_X_pow_mul']
 by_cases hrt : r ≤ t
 · simp only [reverseLiftMAE9,if_pos hrt]
   by_cases hlow : t-j ≤ r
   · rw [if_pos hlow,e_poly_coeffM7E2 j t (r-(t-j)) (by omega),
       show j-(r-(t-j))=t-r by omega]
   · rw [if_neg hlow,lift_term_tailM7E2 j t (t-r) (by omega)]
     simp
 · simp only [reverseLiftMAE9,if_neg hrt,Int.cast_zero]
   rw [if_pos (by omega : t-j ≤ r),e_poly_tailM7E2 j t (r-(t-j)) (by omega)]

theorem lift_poly_gap_identityM7E2 (j t : ℕ) (hjt : j ≤ t) :
 liftPolyM7E2 j (t+1)^2-liftPolyM7E2 j t*liftPolyM7E2 j (t+2)=
 X^(2*(t-j)+2)*(ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)) := by
 rw [lift_poly_shiftM7E2 j (t+1) (by omega),lift_poly_shiftM7E2 j t hjt,
   lift_poly_shiftM7E2 j (t+2) (by omega),
   show t+1-j=(t-j)+1 by omega,show t+2-j=(t-j)+2 by omega,
   show 2*(t-j)+2=(t-j)+(t-j)+2 by omega]
 simp only [pow_add,pow_one]
 ring

theorem lift_poly_gap_nonnegM7E2 (j t k : ℕ) (hjt : j ≤ t) :
 0 ≤ (liftPolyM7E2 j (t+1)^2-liftPolyM7E2 j t*liftPolyM7E2 j (t+2)).coeff k := by
 rw [lift_poly_gap_identityM7E2 j t hjt,Polynomial.coeff_X_pow_mul']
 split_ifs
 · exact e_gap_nonnegM7E2 j t _
 · exact le_rfl

theorem source_lift_polyM7E2 (q j t : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r (t+3) j:ℝ)=
 ∑ k ∈ range (t+1), ((sourceNME9C q r-2*j-1).choose k:ℝ)*
   (liftPolyM7E2 j t).coeff k := by
 simp only [lift_poly_coeffM7E2]
 exact_mod_cast source_lower_reverse_liftMAE9 q j t r hj

end
end MathGKM.Markov
