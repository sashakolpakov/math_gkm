import MarkovShiftMomentsME10
/-! Machine-authored e108e0e2. Shifted tail identities. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

theorem top_mass_shiftedME10 (d i r : ℕ) :
 topMassME10 d (i+r) i=topKernelME10 d i (i+r)+
 4*∑ k ∈ range r, ((r:ℤ)-k)*topKernelME10 d i (i+k) := by
 unfold topMassME10 topLinearM55C
 rw [sum_range_add]
 have hz : (∑ s ∈ range i, (((i+r:ℕ):ℤ)-s)*topKernelME10 d i s)=0 := by
   apply sum_eq_zero
   intro s hs
   rw [topKernelME10,Nat.choose_eq_zero_of_lt (mem_range.mp hs)]
   simp
 rw [hz,zero_add]
 congr 2
 apply sum_congr rfl
 intro k hk
 push_cast
 ring

theorem top_kernel_row_stepME10 (d i s : ℕ) (hi : i ≤ s) :
 ((s:ℤ)+1-i)*((d:ℤ)+s+2)*topKernelME10 d i (s+1)=
 ((s:ℤ)+1)*((d:ℤ)+s+i+5)*topKernelME10 d i s := by
 have h0 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_mul_succ_eq s i)
 have h1 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_mul_succ_eq (d+s+i+4) (i+3))
 simp only [Nat.cast_mul,Nat.cast_sub (show i ≤ s+1 by omega),Nat.cast_sub (show i+3 ≤ d+s+i+4+1 by omega)] at h0 h1
 push_cast at h0 h1
 unfold topKernelME10
 rw [show d+(s+1)+i+4=d+s+i+4+1 by omega]
 calc
  _ = ((s.choose (i+1):ℤ)*0)+
    ((s+1).choose i:ℤ)*((s:ℤ)+1-i)*
    (((d+s+i+4+1).choose (i+3):ℤ)*((d:ℤ)+s+i+4+1-(i+3))) := by ring
  _ = _ := by rw [←h0,←h1]; ring

theorem top_tail_mass_expansionsME10 (d i : ℕ) :
 topMassME10 d (i+2) i=topKernelME10 d i (i+2)+
   8*topKernelME10 d i i+4*topKernelME10 d i (i+1) ∧
 topMassME10 d (i+2) (i+1)=topKernelME10 d (i+1) (i+2)+4*topKernelME10 d (i+1) (i+1) ∧
 topMassME10 d (i+2) (i+2)=topKernelME10 d (i+2) (i+2) := by
 have h0 := top_mass_shiftedME10 d i 2
 have h1 := top_mass_shiftedME10 d (i+1) 1
 have h2 := top_mass_shiftedME10 d (i+2) 0
 simp only [sum_range_succ,sum_range_zero,Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat,
   sub_zero,mul_zero,zero_add,Nat.add_zero,Nat.reduceAdd] at h0 h1 h2
 constructor
 · linear_combination h0
 constructor
 · simpa [Nat.add_assoc] using h1
 · simpa using h2

end
end MathGKM.Markov
