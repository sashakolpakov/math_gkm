import MarkovMidpoint0c12
import MarkovTruncatedFiber65c4
/-! Machine-authored 0c12f51d. An unbounded family of complete truncated
fiber comparisons, including the family obstructing pointwise midpoint maps. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 2000000

theorem horizontal_support_zero0c12 (a j q s : ℕ)
 (h : a < q+s+1 ∨ q+2*s+2 < j) : horizontalTerm9a72 a j q s=0 := by
 unfold horizontalTerm9a72
 split_ifs with hq
 · rcases h with h | h
   · rw [Nat.choose_eq_zero_of_lt (show a-q<s+1 by omega)]
     simp
   · rw [Nat.choose_eq_zero_of_lt (show 2*s+2<j-q by omega)]
     simp
 · rfl

theorem moving_low_support0c12 (m r q : ℕ) (hq : q ≠ m+4) :
 (truncatedFiber65c4 (m+6) (m+10) 2 r).coeff q=0 := by
 rw [truncated_coeff65c4]
 split_ifs
 · apply horizontal_support_zero0c12
   omega
 · rfl

theorem moving_mid_support0c12 (m r q : ℕ)
 (h2 : q ≠ m+2) (h3 : q ≠ m+3) :
 (truncatedFiber65c4 (m+6) (m+10) 3 r).coeff q=0 := by
 rw [truncated_coeff65c4]
 split_ifs
 · apply horizontal_support_zero0c12
   omega
 · rfl

theorem moving_fiber_identity0c12 (m r : ℕ) :
 ((truncatedFiber65c4 (m+6) (m+10) 3 r)^2-
   truncatedFiber65c4 (m+6) (m+10) 2 r*
   truncatedFiber65c4 (m+6) (m+10) 4 r).coeff (2*m+5) =
 (if r ≤ m+2 then 2*midpointMiddle0c12 m else 0)-
 (if r ≤ m+1 then midpointEnd0c12 m else 0) := by
 rw [show (3:ℕ)=2+1 by rfl,show (4:ℕ)=2+2 by rfl,truncated_gap_coeff65c4]
 let f := fun q =>
   (truncatedFiber65c4 (m+6) (m+10) 3 r).coeff q *
     (truncatedFiber65c4 (m+6) (m+10) 3 r).coeff (2*m+5-q) -
   (truncatedFiber65c4 (m+6) (m+10) 2 r).coeff q *
     (truncatedFiber65c4 (m+6) (m+10) 4 r).coeff (2*m+5-q)
 change (∑ q ∈ range (2*m+5+1), f q)=_
 have he : (∑ q ∈ range (2*m+5+1), f q)=∑ q ∈ {m+2,m+3,m+4}, f q := by
   symm
   apply sum_subset
   · intro q hq
     simp only [mem_insert,mem_singleton] at hq
     simp only [mem_range]
     omega
   · intro q hq hn
     have hn' : q ≠ m+2 ∧ q ≠ m+3 ∧ q ≠ m+4 := by simpa using hn
     dsimp [f]
     rw [moving_mid_support0c12 m r q hn'.1 hn'.2.1,
       moving_low_support0c12 m r q hn'.2.2]
     ring
 rw [he]
 simp only [sum_insert,mem_insert,mem_singleton,show m+2 ≠ m+3 by omega,
   show m+2 ≠ m+4 by omega,show m+3 ≠ m+4 by omega,or_self,not_false_eq_true,
   sum_singleton]
 dsimp [f]
 rw [moving_low_support0c12 m r (m+2) (by omega),
   moving_low_support0c12 m r (m+3) (by omega),
   moving_mid_support0c12 m r (m+4) (by omega) (by omega)]
 simp only [zero_mul,sub_zero,zero_sub,
   show 2*m+5-(m+2)=m+3 by omega,show 2*m+5-(m+3)=m+2 by omega,
   show 2*m+5-(m+4)=m+1 by omega,truncated_coeff65c4,
   show m+2 < m+6+2 by omega,show m+3 < m+6+2 by omega,
   show m+4 < m+6+2 by omega,show m+1 < m+6+2 by omega,true_and,show m+6+1=m+7 by omega]
 by_cases h1 : r ≤ m+1
 · have h2 : r ≤ m+2 := by omega
   have h3 : r ≤ m+3 := by omega
   have h4 : r ≤ m+4 := by omega
   simp [h1,h2,h3,h4,midpointMiddle0c12,midpointEnd0c12]
   ring
 · by_cases h2 : r ≤ m+2
   · have h3 : r ≤ m+3 := by omega
     simp [h1,h2,h3,midpointMiddle0c12]
     ring
   · simp [h1,h2]

theorem moving_fiber_nonneg0c12 (m r : ℕ) :
 0 ≤ ((truncatedFiber65c4 (m+6) (m+10) 3 r)^2-
   truncatedFiber65c4 (m+6) (m+10) 2 r*
   truncatedFiber65c4 (m+6) (m+10) 4 r).coeff (2*m+5) := by
 rw [moving_fiber_identity0c12]
 have h := aggregate_positive0c12 m
 have hp : 0 ≤ midpointMiddle0c12 m := by
   obtain ⟨h0,h1,h2,h3⟩ := midpoint_values0c12 m
   simp only [midpointMiddle0c12,h2,h3]
   positivity
 split_ifs <;> omega

#print axioms moving_fiber_identity0c12
#print axioms moving_fiber_nonneg0c12
end
end MathGKM.Markov
