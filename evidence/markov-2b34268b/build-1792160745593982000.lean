import MarkovUpperPairM2B3
/-! Machine-authored 2b34268b. Zero-aware upper convolution boundaries. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

theorem upper_pair_stripM2B3 (N d l b : ℕ) (hl : 1≤l) (hb : 1≤b) :
 (∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) l t*
    coeff (fib6 (N+d+1)) b (N+2*d-t))=
 ∑ t∈range (N+1), coeff (fib6 (N+d+1)) l (t+d)*
    coeff (fib6 (N+d+1)) b (N+d-t) := by
 let F := fun t => coeff (fib6 (N+d+1)) l t*
    coeff (fib6 (N+d+1)) b (N+2*d-t)
 change (∑ t∈range (N+2*d+1), F t)=_
 rw [show N+2*d+1=d+(N+1)+d by omega,sum_range_add,sum_range_add]
 have hz : (∑ t∈range d, F t)=0 := by
   apply sum_eq_zero
   intro t ht
   dsimp [F]
   rw [(fib_degree6 _) b _ (by have := mem_range.mp ht; omega),mul_zero]
 have hz' : (∑ t∈range d, F (d+(N+1)+t))=0 := by
   apply sum_eq_zero
   intro t ht
   dsimp [F]
   rw [(fib_degree6 _) l _ (by omega),zero_mul]
 rw [hz,hz',zero_add,add_zero]
 apply sum_congr rfl
 intro t ht
 have ht' := mem_range.mp ht
 dsimp [F]
 rw [show N+2*d-(d+t)=N+d-t by omega,show d+t=t+d by omega]

theorem upper_edgeM2B3 (N d i : ℕ) (hd : 1≤d) (hi : 1≤i) :
 (∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) 0 t*
    coeff (fib6 (N+d+1)) i (N+2*d-t))=
 ((d+i-1).choose i:ℤ)*((N+1).choose (i-1):ℤ) := by
 have hs : (∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) 0 t*
    coeff (fib6 (N+d+1)) i (N+2*d-t))=
    coeff (fib6 (N+d+1)) i (d-1) := by
   rw [sum_eq_single (N+d+1)]
   · rw [fib_coeff_allMAF6]
     simp only [fibCoeffMAF6,ite_true,one_mul]
     congr 1
     omega
   · intro t ht hn
     rw [fib_coeff_allMAF6]
     simp [fibCoeffMAF6,hn]
   · intro hn
     exact False.elim (hn (mem_range.mpr (by omega)))
 rw [hs,fib_globalM6E1 _ _ _ hi (by omega),
   show N+d+1-(d-1)-1=N+1 by omega,show d-1+i=d+i-1 by omega]
 ring

theorem upper_edge_revM2B3 (N d i : ℕ) (hd : 1≤d) (hi : 1≤i) :
 (∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) i t*
    coeff (fib6 (N+d+1)) 0 (N+2*d-t))=
 ((d+i-1).choose i:ℤ)*((N+1).choose (i-1):ℤ) := by
 have hs := sum_range_reflect
   (fun t => coeff (fib6 (N+d+1)) 0 t*coeff (fib6 (N+d+1)) i (N+2*d-t))
   (N+2*d+1)
 have he : (∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) i t*
    coeff (fib6 (N+d+1)) 0 (N+2*d-t))=
    ∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) 0 t*
    coeff (fib6 (N+d+1)) i (N+2*d-t) := by
   rw [←hs]
   apply sum_congr rfl
   intro t ht
   have ht' := mem_range.mp ht
   rw [show N+2*d+1-1=N+2*d by omega,
     show N+2*d-(N+2*d-t)=t by omega]
   ring
 rw [he]
 exact upper_edgeM2B3 N d i hd hi

end
end MathGKM.Markov
