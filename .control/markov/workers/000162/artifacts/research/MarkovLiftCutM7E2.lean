import MarkovLiftPolynomialM7E2
/-! Machine-authored 7e2e958e. The exact unresolved truncation domain of the
LC-positive triangle route. This is an auxiliary criterion, not the root. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def liftCutM7E2 (j t h : ℕ) : Polynomial ℝ :=
 ∑ r ∈ range (t+1), monomial r (if h ≤ r then (reverseLiftMAE9 j t r:ℝ) else 0)

theorem lift_cut_coeffM7E2 (j t h k : ℕ) :
 (liftCutM7E2 j t h).coeff k=if h ≤ k then (liftPolyM7E2 j t).coeff k else 0 := by
 classical
 simp only [liftCutM7E2,Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
 rw [sum_ite_eq']
 rw [lift_poly_coeffM7E2]
 by_cases hk : k ≤ t
 · simp [show k<t+1 by omega]
 · simp [show ¬k<t+1 by omega,reverseLiftMAE9,hk]

theorem lift_cut_noneM7E2 (j t h : ℕ) (ht : j+h ≤ t) :
 liftCutM7E2 j t h=liftPolyM7E2 j t := by
 ext k
 rw [lift_cut_coeffM7E2]
 by_cases hk : h ≤ k
 · rw [if_pos hk]
 · rw [if_neg hk,lift_poly_coeffM7E2]
   have hkt : k ≤ t := by omega
   rw [reverseLiftMAE9,if_pos hkt,lift_term_tailM7E2 j t (t-k) (by omega)]
   simp

theorem lift_cut_zeroM7E2 (j t h : ℕ) (ht : t<h) : liftCutM7E2 j t h=0 := by
 ext k
 rw [Polynomial.coeff_zero,lift_cut_coeffM7E2]
 split_ifs with hk
 · rw [lift_poly_coeffM7E2,reverseLiftMAE9,if_neg (by omega)]
   simp
 · rfl

def liftCutGapM7E2 (j t h : ℕ) : Polynomial ℝ :=
 liftCutM7E2 j (t+1) h^2-liftCutM7E2 j t h*liftCutM7E2 j (t+2) h

theorem lift_cut_highM7E2 (j t h k : ℕ) (ht : t<h) :
 0 ≤ (liftCutGapM7E2 j t h).coeff k := by
 rw [liftCutGapM7E2,lift_cut_zeroM7E2 j t h ht,zero_mul,sub_zero,pow_two,Polynomial.coeff_mul]
 apply sum_nonneg
 intro p hp
 have hn (s : ℕ) : 0 ≤ (liftCutM7E2 j (t+1) h).coeff s := by
   rw [lift_cut_coeffM7E2,lift_poly_coeffM7E2]
   unfold reverseLiftMAE9
   split_ifs
   all_goals try unfold liftTermMAE9
   all_goals positivity
 exact mul_nonneg (hn p.1) (hn p.2)

theorem lift_cut_tailM7E2 (j t h k : ℕ) (ht : j+h ≤ t) :
 0 ≤ (liftCutGapM7E2 j t h).coeff k := by
 rw [liftCutGapM7E2,lift_cut_noneM7E2 j (t+1) h (by omega),
   lift_cut_noneM7E2 j t h ht,lift_cut_noneM7E2 j (t+2) h (by omega)]
 exact lift_poly_gap_nonnegM7E2 j t k (by omega)

def LiftLCPositiveM7E2 : Prop := ∀ j t h k, 0 ≤ (liftCutGapM7E2 j t h).coeff k
def LiftBoundaryM7E2 : Prop := ∀ j t h k, h ≤ t → t<j+h →
 0 ≤ (liftCutGapM7E2 j t h).coeff k

theorem lift_positive_iff_boundaryM7E2 : LiftLCPositiveM7E2 ↔ LiftBoundaryM7E2 := by
 constructor
 · intro H j t h k _ _
   exact H j t h k
 · intro H j t h k
   by_cases ht : t<h
   · exact lift_cut_highM7E2 j t h k ht
   by_cases hj : j+h ≤ t
   · exact lift_cut_tailM7E2 j t h k hj
   exact H j t h k (by omega) (by omega)

end
end MathGKM.Markov
