import MarkovOffsetPairM58E
/-! Machine-authored 58e57003. Finite rearrangement of the square coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def offsetKernelM58E (j d i e f l : ℕ) : ℤ :=
 (d.choose e:ℤ)*(d.choose f:ℤ)*
 ((i-1-f).choose l:ℤ)*((i-1-e).choose (i-l):ℤ)*
 ((j+i+1).choose (2*i-1-e-f):ℤ)

theorem offset_kernel_zeroM58E (j d i e f l : ℕ)
 (hl : l≤i) (he : e<i) (hf : f<i) (h : l≤e ∨ i-l≤f) :
 offsetKernelM58E j d i e f l=0 := by
 rcases h with h | h
 · unfold offsetKernelM58E
   rw [Nat.choose_eq_zero_of_lt (by omega : i-1-e<i-l)]
   simp
 · unfold offsetKernelM58E
   rw [Nat.choose_eq_zero_of_lt (by omega : i-1-f<l)]
   simp

theorem offset_pair_extendedM58E (j d i l : ℕ) (hi : 2≤i) (hl : l≤i) :
 (∑ t∈range (j+1), coeff (fib6 (j+d+1)) l t*coeff (fib6 (j+d+1)) (i-l) (j-t))=
 ∑ e∈range i, ∑ f∈range i, offsetKernelM58E j d i e f l := by
 by_cases hl0 : l=0
 · subst l
   have hz : (∑ t∈range (j+1), coeff (fib6 (j+d+1)) 0 t*
     coeff (fib6 (j+d+1)) (i-0) (j-t))=0 := by
     apply sum_eq_zero
     intro t ht
     rw [fib_low_zeroM3A1 _ _ (by have := mem_range.mp ht; omega),zero_mul]
   rw [hz]
   symm
   apply sum_eq_zero
   intro e he
   apply sum_eq_zero
   intro f hf
   exact offset_kernel_zeroM58E _ _ _ _ _ _ (by omega) (mem_range.mp he) (mem_range.mp hf) (Or.inl (by omega))
 by_cases hli : l=i
 · subst l
   have hz : (∑ t∈range (j+1), coeff (fib6 (j+d+1)) i t*
     coeff (fib6 (j+d+1)) (i-i) (j-t))=0 := by
     apply sum_eq_zero
     intro t ht
     rw [Nat.sub_self,fib_low_zeroM3A1 _ _ (by omega : j-t<j+d+1),mul_zero]
   rw [hz]
   symm
   apply sum_eq_zero
   intro e he
   apply sum_eq_zero
   intro f hf
   exact offset_kernel_zeroM58E _ _ _ _ _ _ (by omega) (mem_range.mp he) (mem_range.mp hf) (Or.inr (by omega))
 have hp := offset_pairM58E j d l (i-l) (by omega) (by omega)
 rw [show l+(i-l)=i by omega,show j+l+(i-l)=j+i by omega] at hp
 rw [hp]
 change (∑ e∈range l, ∑ f∈range (i-l), offsetKernelM58E j d i e f l)=_
 calc
  _ = ∑ e∈range l, ∑ f∈range i, offsetKernelM58E j d i e f l := by
    apply sum_congr rfl
    intro e he
    apply sum_subset (range_mono (by omega : i-l≤i))
    intro f hf hn
    exact offset_kernel_zeroM58E _ _ _ _ _ _ hl (by have := mem_range.mp he; omega)
      (mem_range.mp hf) (Or.inr (by simpa only [mem_range,not_lt] using hn))
  _ = _ := by
    apply sum_subset (range_mono hl)
    intro e he hn
    apply sum_eq_zero
    intro f hf
    exact offset_kernel_zeroM58E _ _ _ _ _ _ hl (mem_range.mp he)
      (mem_range.mp hf) (Or.inl (by simpa only [mem_range,not_lt] using hn))

theorem offset_kernel_sumM58E (j d i e f : ℕ) (hi : 2≤i) (he : e<i) (hf : f<i) :
 (∑ l∈range (i+1), offsetKernelM58E j d i e f l)=
 (d.choose e:ℤ)*(d.choose f:ℤ)*((2*i-2-e-f).choose i:ℤ)*
 ((j+i+1).choose (2*i-1-e-f):ℤ) := by
 have hv := Nat.add_choose_eq (i-1-f) (i-1-e) i
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at hv
 rw [show i-1-f+(i-1-e)=2*i-2-e-f by omega] at hv
 have hz := congrArg (fun x : ℕ => (x:ℤ)) hv
 push_cast at hz
 unfold offsetKernelM58E
 simp_rw [show ∀ l, (d.choose e:ℤ)*(d.choose f:ℤ)*
   ((i-1-f).choose l:ℤ)*((i-1-e).choose (i-l):ℤ)*
   ((j+i+1).choose (2*i-1-e-f):ℤ)=
   ((d.choose e:ℤ)*(d.choose f:ℤ)*((j+i+1).choose (2*i-1-e-f):ℤ))*
   (((i-1-f).choose l:ℤ)*((i-1-e).choose (i-l):ℤ)) by intro l; ring]
 rw [←mul_sum,←hz]
 ring

theorem offset_square_doubleM58E (j d i : ℕ) (hi : 2≤i) :
 coeff (fib6 (j+d+1)^2) i j=
 ∑ e∈range i, ∑ f∈range i,
 (d.choose e:ℤ)*(d.choose f:ℤ)*((2*i-2-e-f).choose i:ℤ)*
 ((j+i+1).choose (2*i-1-e-f):ℤ) := by
 rw [pow_two,bicoeff_mulM3A1,sum_comm]
 have he (l : ℕ) (hl : l∈range (i+1)) := offset_pair_extendedM58E j d i l hi
   (by have := mem_range.mp hl; omega)
 rw [sum_congr rfl he,sum_comm]
 apply sum_congr rfl
 intro e he
 rw [sum_comm]
 apply sum_congr rfl
 intro f hf
 exact offset_kernel_sumM58E j d i e f hi (mem_range.mp he) (mem_range.mp hf)

end
end MathGKM.Markov
