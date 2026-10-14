import MarkovPellLowerLC654a
import MarkovSecondHorizontal8934
/-! Machine-authored 654a72ea. Boundary completion for the first lower band. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem right_sum_j654a (n i j s : ℕ) (hs : s ≤ n)
 (hij : i+j=n+s+2) (hj : j ≤ n+1) :
 coeff (frame (List.replicate n true)).mid.p i j =
 ∑ q ∈ Finset.range (j+1),
   (((n+1-q).choose (s+1) : ℤ)*((s+q).choose q : ℤ)*
     ((2*s+2).choose (j-q) : ℤ)) := by
 rw [right_horizontal_sum_fixed9a72 n i j s hs hij]
 have he : (∑ q ∈ Finset.range (n+2), horizontalTerm9a72 (n+1) j q s) =
     ∑ q ∈ Finset.range (j+1), horizontalTerm9a72 (n+1) j q s := by
   symm
   apply Finset.sum_subset (Finset.range_mono (by omega))
   intro q hq hnq
   have hqj : ¬ q ≤ j := by simpa using hnq
   simp [horizontalTerm9a72,hqj]
 rw [he]
 apply Finset.sum_congr rfl
 intro q hq
 simp [horizontalTerm9a72,show q ≤ j by have := Finset.mem_range.mp hq; omega]

end
end MathGKM.Markov
