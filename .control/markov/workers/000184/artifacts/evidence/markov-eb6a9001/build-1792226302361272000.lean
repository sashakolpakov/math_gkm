import MarkovTopGapPolynomialMEB6
/-! Machine-authored eb6a9001. Universal short sum for high raw columns.
Its number of terms depends on the column, not the row depth. -/
namespace MathGKM.Markov
noncomputable section
open Finset Finset.Nat
set_option maxHeartbeats 5000000

theorem top_kernel_vandermondeMEB6 (d i s : ℕ) :
 topKernelM55C d i s = ∑ k ∈ range (i+4),
 ((i+k).choose i:ℤ)*((d+2*i+8).choose (i+3-k):ℤ)*(s.choose (i+k):ℤ) := by
 by_cases hi : i ≤ s
 · have hv := Nat.add_choose_eq (s-i) (d+2*i+8) (i+3)
   rw [sum_antidiagonal_eq_sum_range_succ_mk] at hv
   have hv' := congrArg (fun z : ℕ => (z:ℤ)) hv
   push_cast at hv'
   rw [show s-i+(d+2*i+8)=d+s+i+8 by omega] at hv'
   unfold topKernelM55C
   rw [hv',mul_sum]
   apply sum_congr (by congr 1; omega)
   intro k hk
   have h := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_mul (n:=s) (k:=i+k) (s:=i) (by omega))
   rw [show i+k-i=k by omega] at h
   push_cast at h
   linear_combination ((d+2*i+8).choose (i+3-k):ℤ)*h
 · unfold topKernelM55C
   rw [Nat.choose_eq_zero_of_lt (by omega : s < i)]
   simp only [Nat.cast_zero,zero_mul]
   symm
   apply sum_eq_zero
   intro k hk
   rw [Nat.choose_eq_zero_of_lt (by omega : s < i+k)]
   simp

theorem top_linear_sumMEB6 {α : Type*} (T : ℕ) (A : Finset α) (f : α → ℕ → ℤ) :
 topLinearM55C T (fun s => ∑ k ∈ A, f k s)=∑ k ∈ A, topLinearM55C T (f k) := by
 classical
 induction A using Finset.induction_on with
 | empty => simp [topLinearM55C]
 | @insert a A ha ih =>
   simp only [sum_insert ha]
   rw [top_linear_addM55C,ih]

theorem top_linear_chooseMEB6 (T i : ℕ) :
 topLinearM55C T (fun s => (s.choose i:ℤ))=
 (T.choose i:ℤ)+4*((T+1).choose (i+2):ℤ) := by
 rw [topLinearM55C,top_choose_weightM55C]

def topShortSumMEB6 (d T i : ℕ) : ℤ :=
 ∑ k ∈ range (i+4), ((i+k).choose i:ℤ)*((d+2*i+8).choose (i+3-k):ℤ)*
 ((T.choose (i+k):ℤ)+4*((T+1).choose (i+k+2):ℤ))

theorem top_mass_short_sumMEB6 (d T i : ℕ) :
 topMassM55C d T i=topShortSumMEB6 d T i := by
 unfold topMassM55C
 have h : topKernelM55C d i = fun s => ∑ k ∈ range (i+4),
   ((i+k).choose i:ℤ)*((d+2*i+8).choose (i+3-k):ℤ)*(s.choose (i+k):ℤ) := by
   funext s
   exact top_kernel_vandermondeMEB6 d i s
 rw [h,top_linear_sumMEB6]
 unfold topShortSumMEB6
 apply sum_congr rfl
 intro k hk
 rw [top_linear_smulM55C,top_linear_chooseMEB6]

end
end MathGKM.Markov
