import MarkovMiddleTwoSumM80F
/-! Machine-authored d0292f14. Uniform Vandermonde collapse of the weighted
middle correction. No coefficient log-concavity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset Finset.Nat
set_option maxHeartbeats 7000000

def middleKernelMD02 (D k a b : ℕ) : ℤ :=
 ∑ l ∈ range (b+1), ((a+l).choose a:ℤ)*((D+a).choose (b-l):ℤ)*
   (k.choose (a+l+2):ℤ)

theorem choose_product_vandermondeMD02 (D s a b : ℕ) :
 (s.choose a:ℤ)*((s+D).choose b:ℤ)=
 ∑ l ∈ range (b+1), ((a+l).choose a:ℤ)*((D+a).choose (b-l):ℤ)*
   (s.choose (a+l):ℤ) := by
 by_cases ha : a ≤ s
 · have hv := Nat.add_choose_eq (s-a) (D+a) b
   rw [sum_antidiagonal_eq_sum_range_succ_mk] at hv
   have hv' := congrArg (fun z : ℕ => (z:ℤ)) hv
   push_cast at hv'
   rw [show s-a+(D+a)=s+D by omega] at hv'
   rw [hv',mul_sum]
   apply sum_congr rfl
   intro l hl
   have h := congrArg (fun z : ℕ => (z:ℤ))
     (Nat.choose_mul (n:=s) (k:=a+l) (s:=a) (by omega))
   rw [show a+l-a=l by omega] at h
   push_cast at h
   linear_combination -((D+a).choose (b-l):ℤ)*h
 · rw [Nat.choose_eq_zero_of_lt (by omega : s<a)]
   simp only [Nat.cast_zero,zero_mul]
   symm
   apply sum_eq_zero
   intro l hl
   rw [Nat.choose_eq_zero_of_lt (by omega : s<a+l)]
   simp

theorem choose_weight_predMD02 (k a : ℕ) :
 (∑ s ∈ range k, ((k:ℤ)-1-s)*(s.choose a:ℤ))=(k.choose (a+2):ℤ) := by
 cases k with
 | zero => simp [Nat.choose_eq_zero_of_lt (show 0<a+2 by omega)]
 | succ k =>
   rw [sum_range_succ]
   have h := top_choose_weightM55C k a
   push_cast
   convert h using 1 <;> ring_nf

theorem middle_kernel_sumMD02 (D k a b : ℕ) :
 (∑ s ∈ range k, ((k:ℤ)-1-s)*(s.choose a:ℤ)*((s+D).choose b:ℤ))=
 middleKernelMD02 D k a b := by
 simp_rw [mul_assoc,choose_product_vandermondeMD02,mul_sum]
 rw [sum_comm]
 unfold middleKernelMD02
 apply sum_congr rfl
 intro l hl
 have h := choose_weight_predMD02 k (a+l)
 calc
  _ = ((a+l).choose a:ℤ)*((D+a).choose (b-l):ℤ)*
    (∑ s ∈ range k, ((k:ℤ)-1-s)*(s.choose (a+l):ℤ)) := by
      rw [mul_sum]
      apply sum_congr rfl
      intro s hs
      ring
  _ = _ := by rw [h]

theorem middle_kernel_nonnegMD02 (D k a b : ℕ) : 0 ≤ middleKernelMD02 D k a b := by
 unfold middleKernelMD02
 positivity

theorem middle_kernel_zeroMD02 (D k a b : ℕ) (hk : k<a+2) :
 middleKernelMD02 D k a b=0 := by
 apply sum_eq_zero
 intro l hl
 rw [Nat.choose_eq_zero_of_lt (by omega : k<a+l+2)]
 simp

end
end MathGKM.Markov
