import MarkovBackwardExtractM94
/-! Machine-authored 94b1de05. Variable-degree backwards extraction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
theorem backward_coeff_generalM94 (P L H : ℤ[X]) (m s j : ℕ)
 (hj : j ≤ m + s) (hL : L.natDegree ≤ j + 7) (hH : H.natDegree ≤ s + 8)
 (h : (1-X)^8*P = L + X^m*H) :
 P.coeff j  =  ∑ k ∈ Finset.range (m + s-j + 1),
  (reflect (s + 8) H).coeff k * ((7 + (m + s-j-k)).choose 7 : ℤ) :=  by
 have hb : ((1-X)^8 : ℤ[X]).natDegree = 8 :=  by compute_degree!
 have hn : ((1-X)^8 : ℤ[X])≠0 :=  by
   intro hz
   rw [hz,natDegree_zero] at hb
   omega
 have hQ : (L + X^m*H).natDegree ≤ m + s + 8 :=  by compute_degree; omega
 have hP : P.natDegree ≤ m + s :=  by
   by_cases hp : P = 0
   · simp [hp]
   · have he :=  natDegree_mul hn hp
     rw [h,hb] at he
     omega
 have he :=  congrArg (reflect (m + s + 8)) h
 have hh : reflect (m + s + 8) (X^m*H) = reflect (s + 8) H :=  by
   rw [show m + s + 8 = m + (s + 8) by omega,reflect_mul _ _ (by compute_degree) hH]
   simp [reflect_monomial]
 have hd : reflect 8 ((1-X)^8 : ℤ[X]) = (1-X)^8 :=  by
   rw [reflect_one_sub_powM94]
   ring
 have hl : reflect (m + s + 8) ((1-X)^8*P) = (1-X)^8*reflect (m + s) P :=  by
   rw [show m + s + 8 = 8 + (m + s) by omega,reflect_mul _ _ (le_of_eq hb) hP,hd]
 rw [hl,reflect_add,hh] at he
 have hc :=  coeff_of_one_sub_mul_rangeBC (reflect (m + s) P)
   (reflect (m + s + 8) L + reflect (s + 8) H) 7 (m + s-j) he
 rw [coeff_reflect,revAt_le (by omega : m + s-j ≤ m + s),Nat.sub_sub_self hj] at hc
 rw [hc]
 apply Finset.sum_congr rfl
 intro k hk
 have hk' : k ≤ m + s-j :=  by simpa using Finset.mem_range.mp hk
 have hz : (reflect (m + s + 8) L).coeff k = 0 :=  by
   rw [coeff_reflect,revAt_le (by omega : k ≤ m + s + 8)]
   apply coeff_eq_zero_of_natDegree_lt
   omega
 rw [coeff_add,hz,zero_add]
end
end MathGKM.Markov
