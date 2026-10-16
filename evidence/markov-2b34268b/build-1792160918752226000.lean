import MarkovUpperStripM2B3
/-! Machine-authored 2b34268b. Guarded outer coefficient allocation. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def upperKernelM2B3 (N d i l e f : ℕ) : ℤ :=
 if e ≤ l ∧ f ≤ i-l then
 ((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
 ((i-1-e).choose (l-e):ℤ)*((i-1-f).choose (i-l-f):ℤ)*
 ((N+i-e-f+1).choose (2*i-1-e-f):ℤ)
 else 0

theorem upper_kernel_extendM2B3 (N d i l : ℕ) (hl : l ≤ i) :
 (∑ e∈range (l+1), ∑ f∈range (i-l+1), upperKernelM2B3 N d i l e f)=
 ∑ e∈range (i+1), ∑ f∈range (i+1), upperKernelM2B3 N d i l e f := by
 calc
  _ = ∑ e∈range (l+1), ∑ f∈range (i+1), upperKernelM2B3 N d i l e f := by
   apply sum_congr rfl
   intro e he
   apply sum_subset (range_mono (by omega : i-l+1 ≤ i+1))
   intro f hf hn
   simp only [mem_range,not_lt] at hn
   simp [upperKernelM2B3,show ¬f ≤ i-l by omega]
  _ = _ := by
   apply sum_subset (range_mono (by omega : l+1 ≤ i+1))
   intro e he hn
   simp only [mem_range,not_lt] at hn
   apply sum_eq_zero
   intro f hf
   simp [upperKernelM2B3,show ¬e ≤ l by omega]

theorem upper_kernel_edgeM2B3 (N d i : ℕ) (hi : 2 ≤ i) :
 (∑ e∈range (0+1), ∑ f∈range (i-0+1), upperKernelM2B3 N d i 0 e f)=
 ((d+i-1).choose i:ℤ)*((N+1).choose (i-1):ℤ) := by
 simp only [zero_add,range_one,sum_singleton,Nat.sub_zero]
 rw [sum_eq_single i]
 · simp [upperKernelM2B3,show i-1-i=0 by omega,show 2*i-1-i=i-1 by omega]
 · intro f hf hn
   have hf' := mem_range.mp hf
   simp [upperKernelM2B3,show f ≤ i by omega,
     Nat.choose_eq_zero_of_lt (by omega : i-1-f<i-f)]
 · intro hn
   exact False.elim (hn (mem_range.mpr (by omega)))

theorem upper_kernel_edge_revM2B3 (N d i : ℕ) (hi : 2 ≤ i) :
 (∑ e∈range (i+1), ∑ f∈range (i-i+1), upperKernelM2B3 N d i i e f)=
 ((d+i-1).choose i:ℤ)*((N+1).choose (i-1):ℤ) := by
 simp only [Nat.sub_self,zero_add,range_one,sum_singleton]
 rw [sum_eq_single i]
 · simp [upperKernelM2B3,show i-1-i=0 by omega,show 2*i-1-i=i-1 by omega]
 · intro e he hn
   have he' := mem_range.mp he
   simp [upperKernelM2B3,show e ≤ i by omega,
     Nat.choose_eq_zero_of_lt (by omega : i-1-e<i-e)]
 · intro hn
   exact False.elim (hn (mem_range.mpr (by omega)))

theorem upper_pair_fullM2B3 (N d i l : ℕ) (hd : 1 ≤ d) (hi : 2 ≤ i) (hl : l ≤ i) :
 (∑ t∈range (N+2*d+1), coeff (fib6 (N+d+1)) l t*
    coeff (fib6 (N+d+1)) (i-l) (N+2*d-t))=
 ∑ e∈range (i+1), ∑ f∈range (i+1), upperKernelM2B3 N d i l e f := by
 rw [←upper_kernel_extendM2B3 N d i l hl]
 by_cases h0 : l=0
 · subst l
   simp only [Nat.sub_zero]
   rw [upper_edgeM2B3 N d i hd (by omega)]
   exact (upper_kernel_edgeM2B3 N d i hi).symm
 by_cases h1 : l=i
 · subst l
   rw [Nat.sub_self,upper_edge_revM2B3 N d i hd (by omega)]
   exact (upper_kernel_edge_revM2B3 N d i hi).symm
 rw [upper_pair_stripM2B3 N d l (i-l) (by omega) (by omega),
   upper_pair_shiftedM2B3 N d l (i-l) hd (by omega) (by omega)]
 apply sum_congr rfl
 intro e he
 apply sum_congr rfl
 intro f hf
 have he' := mem_range.mp he
 have hf' := mem_range.mp hf
 simp only [upperKernelM2B3,if_pos (by omega : e ≤ l ∧ f ≤ i-l)]
 rw [show l+(i-l)=i by omega,show N+l+(i-l)=N+i by omega,
   show i-l-1-f=i-1-f by omega]

theorem upper_square_tripleM2B3 (N d i : ℕ) (hd : 1 ≤ d) (hi : 2 ≤ i) :
 coeff (fib6 (N+d+1)^2) i (N+2*d)=
 ∑ e∈range (i+1), ∑ f∈range (i+1), ∑ l∈range (i+1),
 upperKernelM2B3 N d i l e f := by
 rw [pow_two,bicoeff_mulM3A1,sum_comm]
 have he (l : ℕ) (hl : l∈range (i+1)) :=
   upper_pair_fullM2B3 N d i l hd hi (by have := mem_range.mp hl; omega)
 rw [sum_congr rfl he,sum_comm]
 apply sum_congr rfl
 intro e he
 rw [sum_comm]

end
end MathGKM.Markov
