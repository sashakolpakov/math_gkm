import MarkovPositiveRowsMDAB
import MarkovRowDifferenceM468
/-! Machine-authored daba8bcf. Exact support of the denominator difference.
These positivity assertions do not assume or prove its CrossLC property. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem rowH_difference_nonnegMDAB (n j k : ℕ) (hn : 2*j+1 ≤ n) :
 (rowHMFFD n j).coeff k ≤ (rowHMFFD (n+1) j).coeff k := by
 cases j with
 | zero => simp [rowHMFFD,rowJ_zeroM468]
 | succ j =>
   have h := congrArg (fun p : Polynomial ℤ => p.coeff k)
     (rowH_difference_sumM468 (n-j-2) j)
   rw [show n-j-2+j+3=n+1 by omega,show n-j-2+j+2=n by omega] at h
   simp only [Polynomial.coeff_sub] at h
   have hp : 0 ≤ (X*∑ s ∈ range (j+1), rowHMFFD (n-j-2+s+2) s).coeff k := by
     cases k with
     | zero => simp
     | succ k =>
       rw [Polynomial.coeff_X_mul,Polynomial.finsetSum_coeff]
       apply sum_nonneg
       intro s hs
       have hsj := mem_range.mp hs
       exact rowH_coeff_nonnegMDAB _ s k (by omega)
   linarith

theorem rowH_difference_posMDAB (n j k : ℕ) (hn : 2*j+1 ≤ n)
 (hk0 : 1 ≤ k) (hkj : k ≤ j) :
 (rowHMFFD n j).coeff k < (rowHMFFD (n+1) j).coeff k := by
 obtain ⟨j,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : j≠0)
 obtain ⟨k,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : k≠0)
 have h := congrArg (fun p : Polynomial ℤ => p.coeff (k+1))
   (rowH_difference_sumM468 (n-j-2) j)
 rw [show n-j-2+j+3=n+1 by omega,show n-j-2+j+2=n by omega] at h
 simp only [Polynomial.coeff_sub,Polynomial.coeff_X_mul,Polynomial.finsetSum_coeff] at h
 have hp : 0 < ∑ s ∈ range (j+1), (rowHMFFD (n-j-2+s+2) s).coeff k := by
   apply sum_pos'
   · intro s hs
     have hsj := mem_range.mp hs
     exact rowH_coeff_nonnegMDAB _ s k (by omega)
   · exact ⟨j,mem_range.mpr (by omega),rowH_coeff_posMDAB _ j k (by omega) (by omega)⟩
 linarith

theorem rowH_difference_constantMDAB (n j : ℕ) (hn : 2*j+1 ≤ n) :
 (rowHMFFD (n+1) j).coeff 0=(rowHMFFD n j).coeff 0 := by
 cases j with
 | zero => simp [rowHMFFD,rowJ_zeroM468]
 | succ j =>
   have h := congrArg (fun p : Polynomial ℤ => p.coeff 0)
     (rowH_difference_sumM468 (n-j-2) j)
   rw [show n-j-2+j+3=n+1 by omega,show n-j-2+j+2=n by omega] at h
   simpa using h

theorem rowDifference_nonnegMDAB (n j : ℕ) (hn : 2*j+1 ≤ n) (k : ℤ) :
 0 ≤ RowDifferenceM468 n j k := by
 unfold RowDifferenceM468 CoeffSeq
 by_cases hk : k<0
 · simp [hk]
 · simp only [hk,if_false,Polynomial.coeff_map,Int.coe_castRingHom]
   exact sub_nonneg.mpr (by exact_mod_cast rowH_difference_nonnegMDAB n j k.toNat hn)

end
end MathGKM.Markov
