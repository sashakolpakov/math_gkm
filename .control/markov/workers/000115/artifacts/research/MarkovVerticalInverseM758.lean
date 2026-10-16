import MarkovVerticalSparseM758
/-! Machine-authored 7584c5d0. Exact inverse-four coefficient arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def vFallM758 (j k : ℤ) : ℤ :=
 if k ≤ j then (j-k+3)*(j-k+2)*(j-k+1) else 0

theorem vFall_polyM758 (j k : ℤ) (h : k ≤ j+3) :
 vFallM758 j k=(j-k+3)*(j-k+2)*(j-k+1) := by
 by_cases hh : k ≤ j
 · simp [vFallM758,hh]
 · have he : k=j+1 ∨ k=j+2 ∨ k=j+3 := by omega
   rcases he with rfl|rfl|rfl <;> simp [vFallM758] <;> ring

theorem vFall_zeroM758 (j k : ℤ) (h : j < k) : vFallM758 j k=0 := by
 simp [vFallM758,show ¬k≤j by omega]

theorem vChoose_threeM758 (z : ℕ) :
 6*((z+3).choose 3:ℤ)=((z:ℤ)+3)*(z+2)*(z+1) := by
 have h := congrArg (fun n : ℕ => (n:ℤ))
   (Nat.descFactorial_eq_factorial_mul_choose (z+3) 3)
 norm_num [Nat.descFactorial_succ,Nat.descFactorial_zero] at h
 linear_combination -h

def vInvM758 (P : ℤ[X]) (j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1), P.coeff k*((3+(j-k)).choose 3:ℤ)

theorem vInv_addM758 (P Q : ℤ[X]) (j : ℕ) :
 vInvM758 (P+Q) j=vInvM758 P j+vInvM758 Q j := by
 simp only [vInvM758,coeff_add,add_mul,Finset.sum_add_distrib]

theorem vInv_monomialM758 (c : ℤ) (m j : ℕ) :
 6*vInvM758 (C c*X^m) j=c*vFallM758 j m := by
 classical
 unfold vInvM758
 simp only [coeff_C_mul,coeff_X_pow]
 by_cases h : m ≤ j
 · rw [Finset.sum_eq_single m]
   · simp only [if_true,mul_one]
     have hh := vChoose_threeM758 (j-m)
     rw [show 3+(j-m)=j-m+3 by omega] at *
     rw [Nat.cast_sub h] at hh
     rw [vFallM758,if_pos (by exact_mod_cast h)]
     linear_combination c*hh
   · intro b hb hbm; simp [hbm]
   · intro hm; exact (hm (Finset.mem_range.mpr (by omega))).elim
 · rw [Finset.sum_eq_zero]
   · rw [vFall_zeroM758 _ _ (by exact_mod_cast (show j < m by omega))]; ring
   · intro b hb
     have hb' := Finset.mem_range.mp hb
     simp [show b≠m by omega]
end
end MathGKM.Markov
