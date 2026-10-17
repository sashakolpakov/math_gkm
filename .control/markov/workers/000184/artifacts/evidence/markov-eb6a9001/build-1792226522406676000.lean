import MarkovTopVandermondeMEB6
/-! Machine-authored eb6a9001. Exact complementary short sum near the last
nonzero column and a denominator-free kernel ratio. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

theorem top_mass_shiftedMEB6 (d i r : ℕ) :
 topMassM55C d (i+r) i=topKernelM55C d i (i+r)+
 4*∑ k ∈ range r, ((r:ℤ)-k)*topKernelM55C d i (i+k) := by
 unfold topMassM55C topLinearM55C
 rw [sum_range_add]
 have hz : (∑ s ∈ range i, (((i+r:ℕ):ℤ)-s)*topKernelM55C d i s)=0 := by
   apply sum_eq_zero
   intro s hs
   rw [topKernelM55C,Nat.choose_eq_zero_of_lt (mem_range.mp hs)]
   simp
 rw [hz,zero_add]
 congr 2
 apply sum_congr rfl
 intro k hk
 push_cast
 ring

theorem top_kernel_row_stepMEB6 (d i s : ℕ) (hi : i ≤ s) :
 ((s:ℤ)+1-i)*((d:ℤ)+s+6)*topKernelM55C d i (s+1)=
 ((s:ℤ)+1)*((d:ℤ)+s+i+9)*topKernelM55C d i s := by
 have h0 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_mul_succ_eq s i)
 have h1 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_mul_succ_eq (d+s+i+8) (i+3))
 simp only [Nat.cast_mul,Nat.cast_sub (show i ≤ s+1 by omega),Nat.cast_sub (show i+3 ≤ d+s+i+8+1 by omega)] at h0 h1
 push_cast at h0 h1
 unfold topKernelM55C
 rw [show d+(s+1)+i+8=d+s+i+8+1 by omega]
 calc
  _ = ((s.choose (i+1):ℤ)*0)+
    ((s+1).choose i:ℤ)*((s:ℤ)+1-i)*
    (((d+s+i+8+1).choose (i+3):ℤ)*((d:ℤ)+s+i+8+1-(i+3))) := by ring
  _ = _ := by rw [←h0,←h1]; ring

theorem top_tail_mass_expansionsMEB6 (d i : ℕ) :
 topMassM55C d (i+2) i=topKernelM55C d i (i+2)+
   8*topKernelM55C d i i+4*topKernelM55C d i (i+1) ∧
 topMassM55C d (i+2) (i+1)=topKernelM55C d (i+1) (i+2)+4*topKernelM55C d (i+1) (i+1) ∧
 topMassM55C d (i+2) (i+2)=topKernelM55C d (i+2) (i+2) := by
 have h0 := top_mass_shiftedMEB6 d i 2
 have h1 := top_mass_shiftedMEB6 d (i+1) 1
 have h2 := top_mass_shiftedMEB6 d (i+2) 0
 simp only [sum_range_succ,sum_range_zero,Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat,
   sub_zero,mul_zero,zero_add,Nat.add_zero,Nat.reduceAdd] at h0 h1 h2
 constructor
 · linear_combination h0
 constructor
 · simpa [Nat.add_assoc] using h1
 · simpa using h2

end
end MathGKM.Markov
