import MarkovUpperKernelM2B3
/-! Machine-authored 2b34268b. Finite guarded Vandermonde, retaining endpoints. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem guarded_chooseM2B3 (i e f : ℕ) (hi : 2 ≤ i) (hef : e+f ≤ i) :
 (∑ l∈range (i+1), if e ≤ l ∧ f ≤ i-l then
   ((i-1-e).choose (l-e):ℤ)*((i-1-f).choose (i-l-f):ℤ) else 0)=
 ((2*i-2-e-f).choose (i-e-f):ℤ) := by
 by_cases heq : e+f=i
 · rw [sum_eq_single e]
   · simp [show f=i-e by omega,show i-e-(i-e)=0 by omega]
   · intro l hl hne
     have hl' := mem_range.mp hl
     have hn : ¬(e ≤ l ∧ f ≤ i-l) := by omega
     simp [hn]
   · intro hn
     exact False.elim (hn (mem_range.mpr (by omega)))
 · have he : e < i := by omega
   have hf : f < i := by omega
   let F := fun l => if e ≤ l ∧ f ≤ i-l then
     ((i-1-e).choose (l-e):ℤ)*((i-1-f).choose (i-l-f):ℤ) else 0
   change (∑ l∈range (i+1), F l)=_
   rw [show i+1=e+(i-e+1) by omega,sum_range_add]
   have hz : (∑ l∈range e, F l)=0 := by
     apply sum_eq_zero
     intro l hl
     simp [F,show ¬e ≤ l by have := mem_range.mp hl; omega]
   rw [hz,zero_add]
   have hs : (∑ l∈range (i-e+1), F (e+l))=
     ∑ l∈range (i-e-f+1), F (e+l) := by
     symm
     apply sum_subset (range_mono (by omega : i-e-f+1 ≤ i-e+1))
     intro l hl hn
     have hl' := mem_range.mp hl
     simp only [mem_range,not_lt] at hn
     simp [F,show ¬f ≤ i-(e+l) by omega]
   rw [hs]
   have ht (l : ℕ) (hl : l∈range (i-e-f+1)) : F (e+l)=
     ((i-1-e).choose l:ℤ)*((i-1-f).choose (i-e-f-l):ℤ) := by
     have hl' := mem_range.mp hl
     simp [F,show f ≤ i-(e+l) by omega,show i-(e+l)-f=i-e-f-l by omega]
   rw [sum_congr rfl ht]
   have hv := Nat.add_choose_eq (i-1-e) (i-1-f) (i-e-f)
   rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
     show i-1-e+(i-1-f)=2*i-2-e-f by omega] at hv
   exact_mod_cast hv.symm

theorem upper_kernel_sumM2B3 (N d i e f : ℕ) (hi : 2 ≤ i) :
 (∑ l∈range (i+1), upperKernelM2B3 N d i l e f)=
 if e+f ≤ i then
 ((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
 ((2*i-2-e-f).choose (i-e-f):ℤ)*
 ((N+i-e-f+1).choose (2*i-1-e-f):ℤ) else 0 := by
 by_cases hef : e+f ≤ i
 · rw [if_pos hef]
   have hs := guarded_chooseM2B3 i e f hi hef
   have ht (l : ℕ) : upperKernelM2B3 N d i l e f=
     (((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
     ((N+i-e-f+1).choose (2*i-1-e-f):ℤ))*
     (if e ≤ l ∧ f ≤ i-l then
       ((i-1-e).choose (l-e):ℤ)*((i-1-f).choose (i-l-f):ℤ) else 0) := by
     unfold upperKernelM2B3
     split_ifs <;> ring
   simp_rw [ht]
   rw [←mul_sum,hs]
   ring
 · rw [if_neg hef]
   apply sum_eq_zero
   intro l hl
   have hl' := mem_range.mp hl
   simp [upperKernelM2B3,show ¬(e ≤ l ∧ f ≤ i-l) by omega]

theorem upper_square_formulaM2B3 (N d i : ℕ) (hd : 1 ≤ d) (hi : 2 ≤ i) :
 coeff (fib6 (N+d+1)^2) i (N+2*d)=
 ∑ h∈range (i+1), ((2*d+h-1).choose h:ℤ)*
 ((2*i-2-h).choose (i-h):ℤ)*((N+i-h+1).choose (2*i-1-h):ℤ) := by
 rw [upper_square_tripleM2B3 N d i hd hi]
 simp_rw [upper_kernel_sumM2B3 N d i _ _ hi]
 let F := fun e f => if e+f ≤ i then
   ((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
   ((2*i-2-e-f).choose (i-e-f):ℤ)*
   ((N+i-e-f+1).choose (2*i-1-e-f):ℤ) else 0
 change (∑ e∈range (i+1), ∑ f∈range (i+1), F e f)=_
 have hz (e f : ℕ) (he : e < i+1) (hf : f < i+1) (hh : i+1 ≤ e+f) : F e f=0 := by
   simp [F,show ¬e+f ≤ i by omega]
 rw [triangle_sumM58E F (i+1) hz]
 apply sum_congr rfl
 intro h hh
 have hh' := mem_range.mp hh
 have ht (e : ℕ) (he : e∈range (h+1)) : F e (h-e)=
   (((d+e-1).choose e:ℤ)*((d+(h-e)-1).choose (h-e):ℤ))*
   (((2*i-2-h).choose (i-h):ℤ)*((N+i-h+1).choose (2*i-1-h):ℤ)) := by
   have he' := mem_range.mp he
   dsimp [F]
   rw [if_pos (by omega : e+(h-e) ≤ i),
     show 2*i-2-e-(h-e)=2*i-2-h by omega,
     show i-e-(h-e)=i-h by omega,
     show N+i-e-(h-e)+1=N+i-h+1 by omega,
     show 2*i-1-e-(h-e)=2*i-1-h by omega]
   ring
 rw [sum_congr rfl ht,←sum_mul,rising_doubleM2B3 d h hd]
 ring

end
end MathGKM.Markov
