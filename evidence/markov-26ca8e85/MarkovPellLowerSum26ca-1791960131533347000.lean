import MarkovPellHorizontalSum9a72
/-! Machine-authored request 26ca8e85. Fixed-width exact sums near the
lower Pell polygon edge. No log-concavity of sums is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem right_lower_sum26ca (n i j s : ℕ)
 (hs : s ≤ n) (hij : i+j=n+s+2) (hi : s+1 ≤ i) (hj : 2*s+2 ≤ j) :
 coeff (frame (List.replicate n true)).mid.p i j =
 ∑ k ∈ Finset.range (2*s+3),
   (((i-(s+1)+k).choose (s+1) : ℤ)*((s+j-k).choose s : ℤ)*
     ((2*s+2).choose k : ℤ)) := by
 classical
 rw [right_horizontal_sum_fixed9a72 n i j s hs hij]
 have hjn : j ≤ n+1 := by omega
 have hshort : (∑ q ∈ Finset.range (n+2), horizontalTerm9a72 (n+1) j q s) =
     ∑ q ∈ Finset.range (j+1), horizontalTerm9a72 (n+1) j q s := by
   symm
   apply Finset.sum_subset (Finset.range_mono (by omega))
   intro q hq hnq
   have hqj : ¬ q ≤ j := by simpa using hnq
   simp [horizontalTerm9a72,hqj]
 rw [hshort,← Finset.sum_range_reflect _ (j+1)]
 have heq : (∑ k ∈ Finset.range (j+1), horizontalTerm9a72 (n+1) j (j+1-1-k) s) =
     ∑ k ∈ Finset.range (j+1),
       (((i-(s+1)+k).choose (s+1) : ℤ)*((s+j-k).choose s : ℤ)*
         ((2*s+2).choose k : ℤ)) := by
   apply Finset.sum_congr rfl
   intro k hk
   have hkj : k ≤ j := by have := Finset.mem_range.mp hk; omega
   have e0 : j+1-1-k=j-k := by omega
   have e1 : n+1-(j-k)=i-(s+1)+k := by omega
   have e2 : s+(j-k)=s+j-k := by omega
   have e3 : j-(j-k)=k := by omega
   simp only [e0,horizontalTerm9a72,if_pos (show j-k ≤ j by omega),e1,e2,e3]
   rw [← Nat.choose_symm (show j-k ≤ s+j-k by omega)]
   rw [show s+j-k-(j-k)=s by omega]
 rw [heq]
 symm
 apply Finset.sum_subset (Finset.range_mono (by omega))
 intro k hk hn
 have hkn : 2*s+3 ≤ k := by simpa using hn
 have hz : (2*s+2).choose k=0 := Nat.choose_eq_zero_of_lt (by omega)
 simp [hz]

#print axioms right_lower_sum26ca
end
end MathGKM.Markov
