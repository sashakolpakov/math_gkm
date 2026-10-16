import MarkovRowRecurrenceMFFD
/-! Machine-authored ffd747f5. Uniform residual degree bound; no tail is dropped. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

theorem rowJ_degreeMFFD (n j : ℕ) : (rowJMFFD n j).natDegree ≤ j := by
 unfold rowJMFFD
 apply Polynomial.natDegree_sum_le_of_forall_le
 intro s hs
 have hsj : s ≤ j := by have := Finset.mem_range.mp hs; omega
 compute_degree
 omega

theorem rowH_degreeMFFD (n j : ℕ) : (rowHMFFD n j).natDegree ≤ j := by
 induction j using Nat.strong_induction_on with
 | h j ih =>
   rcases j with _|_|j
   · exact rowJ_degreeMFFD n 0
   · rw [rowHMFFD]
     have h0 := rowJ_degreeMFFD n 0
     have h1 := rowJ_degreeMFFD n 1
     have hh : (rowHMFFD n 0).natDegree ≤ 0 := ih 0 (by omega)
     compute_degree
   · rw [rowHMFFD]
     have h0 := rowJ_degreeMFFD n j
     have h1 := rowJ_degreeMFFD n (j+1)
     have h2 := rowJ_degreeMFFD n (j+2)
     have ha := ih j (by omega)
     have hb := ih (j+1) (by omega)
     compute_degree
     omega

theorem rowH_tailMFFD (n j k : ℕ) (hk : j<k) : (rowHMFFD n j).coeff k=0 :=
 Polynomial.coeff_eq_zero_of_natDegree_lt ((rowH_degreeMFFD n j).trans_lt hk)

end
end MathGKM.Markov
