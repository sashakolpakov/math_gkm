import MarkovThreeCharge863a
/-! Machine-authored 863a7482. A uniformly moving initial coefficient of
every truncated charge gap; no claim about the remaining coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem truncated_three_boundary863 (n j s r : ℕ) :
 0 ≤ ((truncatedFiber65c4 n j (s+1) r)^2-
   truncatedFiber65c4 n j s r*truncatedFiber65c4 n j (s+2) r).coeff (2*r+2) := by
 classical
 rw [truncated_gap_coeff65c4]
 let f : ℕ → ℤ := fun q =>
   (truncatedFiber65c4 n j (s+1) r).coeff q *
     (truncatedFiber65c4 n j (s+1) r).coeff (2*r+2-q)-
   (truncatedFiber65c4 n j s r).coeff q *
     (truncatedFiber65c4 n j (s+2) r).coeff (2*r+2-q)
 change 0 ≤ ∑ q ∈ range (2*r+2+1), f q
 have hsub : ({r,r+1,r+2} : Finset ℕ) ⊆ range (2*r+2+1) := by
   intro q hq
   simp only [mem_insert,mem_singleton] at hq
   simp only [mem_range]
   rcases hq with hq|hq|hq <;> omega
 have hz : ∀ q ∈ range (2*r+2+1), q ∉ ({r,r+1,r+2} : Finset ℕ) → f q=0 := by
   intro q hq hnq
   simp only [mem_insert,mem_singleton,not_or] at hnq
   by_cases hrq : r ≤ q
   · have hqr : r+2<q := by omega
     have hb : ¬ r ≤ 2*r+2-q := by
       have := mem_range.mp hq
       omega
     simp [f,truncated_coeff_unbounded863,hb]
   · simp [f,truncated_coeff_unbounded863,hrq]
 rw [← Finset.sum_subset hsub hz]
 simp only [sum_insert (by simp : r ∉ ({r+1,r+2} : Finset ℕ)),
   sum_insert (by simp : r+1 ∉ ({r+2} : Finset ℕ)),sum_singleton]
 have e0 : 2*r+2-r=r+2 := by omega
 have e1 : 2*r+2-(r+1)=r+1 := by omega
 have e2 : 2*r+2-(r+2)=r := by omega
 simp only [f,truncated_coeff_unbounded863,e0,e1,e2,
   show r ≤ r by omega,show r ≤ r+1 by omega,show r ≤ r+2 by omega,if_true]
 have h := horizontal_three_mixed863 (n+1) j r s
 nlinarith

#print axioms truncated_three_boundary863
end
end MathGKM.Markov
