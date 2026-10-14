import MarkovMovingFiber0c12
/-! Machine-authored 0c12f51d. No single charge-preserving term pair can
dominate the exhibited endpoint product. Aggregation remains possible. -/
namespace MathGKM.Markov
noncomputable section

theorem moving_pair_bound0c12 (m q : ℕ) :
 horizontalTerm9a72 (m+7) (m+10) q 3 *
 horizontalTerm9a72 (m+7) (m+10) (2*m+5-q) 3 ≤ midpointMiddle0c12 m := by
 by_cases h2 : q=m+2
 · subst q
   rw [show 2*m+5-(m+2)=m+3 by omega]
   exact le_refl _
 by_cases h3 : q=m+3
 · subst q
   rw [show 2*m+5-(m+3)=m+2 by omega]
   unfold midpointMiddle0c12
   rw [mul_comm]
 have hz : horizontalTerm9a72 (m+7) (m+10) q 3=0 := by
   apply horizontal_support_zero0c12
   omega
 rw [hz,zero_mul]
 obtain ⟨_,_,h2,h3⟩ := midpoint_values0c12 m
 simp only [midpointMiddle0c12,h2,h3]
 positivity

theorem no_single_pair_domination0c12 (m : ℕ) (hm : 15 ≤ m) (q : ℕ) :
 horizontalTerm9a72 (m+7) (m+10) q 3 *
 horizontalTerm9a72 (m+7) (m+10) (2*m+5-q) 3 < midpointEnd0c12 m :=
 lt_of_le_of_lt (moving_pair_bound0c12 m q) (midpoint_fails_uniform0c12 m hm)

#print axioms moving_pair_bound0c12
#print axioms no_single_pair_domination0c12
end
end MathGKM.Markov
