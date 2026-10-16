import MarkovThirdSparseM115
/-! Machine-authored 1152282d. Exact inverse-six coefficient arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def vFallM115 (j k : ℤ) : ℤ :=
 if k ≤ j then (j-k+5)*(j-k+4)*(j-k+3)*(j-k+2)*(j-k+1) else 0

theorem vFall_polyM115 (j k : ℤ) (h : k ≤ j+5) :
 vFallM115 j k=(j-k+5)*(j-k+4)*(j-k+3)*(j-k+2)*(j-k+1) := by
 by_cases hh : k ≤ j
 · simp [vFallM115,hh]
 · have he : k=j+1 ∨ k=j+2 ∨ k=j+3 ∨ k=j+4 ∨ k=j+5 := by omega
   rcases he with rfl|rfl|rfl|rfl|rfl <;> simp [vFallM115] <;> ring

theorem vFall_zeroM115 (j k : ℤ) (h : j < k) : vFallM115 j k=0 := by
 simp [vFallM115,show ¬k≤j by omega]

theorem vChoose_fiveM115 (z : ℕ) :
 120*((z+5).choose 5:ℤ)=((z:ℤ)+5)*(z+4)*(z+3)*(z+2)*(z+1) := by
 have h := congrArg (fun n : ℕ => (n:ℤ))
   (Nat.descFactorial_eq_factorial_mul_choose (z+5) 5)
 norm_num [Nat.descFactorial_succ,Nat.descFactorial_zero] at h
 linear_combination -h

def vInvM115 (P : ℤ[X]) (j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1), P.coeff k*((5+(j-k)).choose 5:ℤ)

theorem vInv_addM115 (P Q : ℤ[X]) (j : ℕ) :
 vInvM115 (P+Q) j=vInvM115 P j+vInvM115 Q j := by
 simp only [vInvM115,coeff_add,add_mul,Finset.sum_add_distrib]

theorem vInv_monomialM115 (c : ℤ) (m j : ℕ) :
 120*vInvM115 (C c*X^m) j=c*vFallM115 j m := by
 classical
 unfold vInvM115
 simp only [coeff_C_mul,coeff_X_pow]
 by_cases h : m ≤ j
 · rw [Finset.sum_eq_single m]
   · simp only [if_true,mul_one]
     have hh := vChoose_fiveM115 (j-m)
     rw [show 5+(j-m)=j-m+5 by omega] at *
     rw [Nat.cast_sub h] at hh
     rw [vFallM115,if_pos (by exact_mod_cast h)]
     linear_combination c*hh
   · intro b hb hbm; simp [hbm]
   · intro hm; exact (hm (Finset.mem_range.mpr (by omega))).elim
 · rw [Finset.sum_eq_zero]
   · rw [vFall_zeroM115 _ _ (by exact_mod_cast (show j < m by omega))]; ring
   · intro b hb
     have hb' := Finset.mem_range.mp hb
     simp [show b≠m by omega]
end
end MathGKM.Markov
