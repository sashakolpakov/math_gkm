import MarkovBinomialExtractBC
/-! Machine-authored 94b1de05. Backwards extraction from the highest shifted block. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
open scoped BigOperators

theorem reflect_one_sub_powM94 (d : ℕ) :
 reflect d ((1-X)^d : ℤ[X]) = (X-1)^d := by
 induction d with
 | zero => simp [reflect_one]
 | succ d ih =>
   rw [pow_succ, reflect_mul _ _ (by compute_degree) (by compute_degree)]
   rw [ih, reflect_sub, reflect_one, reflect_one_X, pow_one, pow_succ]

theorem backward_coeffM94 (P L H : ℤ[X]) (m j : ℕ)
 (hj : j≤m+7) (hL : L.natDegree≤j+7) (hH : H.natDegree≤15)
 (h : (1-X)^8*P=L+X^m*H) :
 P.coeff j = ∑ k ∈ Finset.range (m+7-j+1),
  (reflect 15 H).coeff k * ((7+(m+7-j-k)).choose 7 : ℤ) := by
 have hb : ((1-X)^8 : ℤ[X]).natDegree=8 := by compute_degree!
 have hn : ((1-X)^8 : ℤ[X])≠0 := by
   intro hz
   rw [hz,natDegree_zero] at hb
   omega
 have hQ : (L+X^m*H).natDegree≤m+15 := by compute_degree; omega
 have hP : P.natDegree≤m+7 := by
   by_cases hp : P=0
   · simp [hp]
   · have he := natDegree_mul hn hp
     rw [h,hb] at he
     omega
 have he := congrArg (reflect (m+15)) h
 have hh : reflect (m+15) (X^m*H)=reflect 15 H := by
   rw [show m+15=m+15 from rfl,reflect_mul _ _ (by compute_degree) hH]
   simp [reflect_monomial]
 have hd : reflect 8 ((1-X)^8 : ℤ[X])=(1-X)^8 := by
   rw [reflect_one_sub_powM94]
   ring
 have hl : reflect (m+15) ((1-X)^8*P)=(1-X)^8*reflect (m+7) P := by
   rw [show m+15=8+(m+7) by omega,reflect_mul _ _ (le_of_eq hb) hP,hd]
 rw [hl,reflect_add,hh] at he
 have hc := coeff_of_one_sub_mul_rangeBC (reflect (m+7) P)
   (reflect (m+15) L+reflect 15 H) 7 (m+7-j) he
 rw [coeff_reflect,revAt_le (by omega : m+7-j≤m+7),Nat.sub_sub_self hj] at hc
 rw [hc]
 apply Finset.sum_congr rfl
 intro k hk
 have hk' : k≤m+7-j := by simpa using Finset.mem_range.mp hk
 have hz : (reflect (m+15) L).coeff k=0 := by
   rw [coeff_reflect,revAt_le (by omega : k≤m+15)]
   apply coeff_eq_zero_of_natDegree_lt
   omega
 rw [coeff_add,hz,zero_add]
end
end MathGKM.Markov
