import MarkovOffsetSquareM58E
/-! Machine-authored 58e57003. Single-sum lower-row formula with zero tails. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem triangle_sumM58E (F : ℕ → ℕ → ℤ) (n : ℕ)
 (hz : ∀ e f, e < n → f < n → n ≤ e+f → F e f=0) :
 (∑ e∈range n, ∑ f∈range n, F e f)=
 ∑ h∈range n, ∑ e∈range (h+1), F e (h-e) := by
 rw [sum_range_diag_flip]
 apply sum_congr rfl
 intro e he
 symm
 apply sum_subset (range_mono (Nat.sub_le n e))
 intro f hf hn
 exact hz e f (mem_range.mp he) (mem_range.mp hf)
   (by simp only [mem_range,not_lt] at hn; omega)

theorem offset_square_formulaM58E (j d i : ℕ) (hi : 2 ≤ i) :
 coeff (fib6 (j+d+1)^2) i j=
 ∑ h∈range (i-1), ((2*d).choose h:ℤ)*((2*i-2-h).choose i:ℤ)*
 ((j+i+1).choose (2*i-1-h):ℤ) := by
 rw [offset_square_doubleM58E j d i hi]
 let F := fun e f : ℕ => (d.choose e:ℤ)*(d.choose f:ℤ)*
   ((2*i-2-e-f).choose i:ℤ)*((j+i+1).choose (2*i-1-e-f):ℤ)
 change (∑ e∈range i, ∑ f∈range i, F e f)=_
 have hz (e f : ℕ) (he : e < i) (hf : f < i) (h : i ≤ e+f) : F e f=0 := by
   dsimp [F]
   rw [Nat.choose_eq_zero_of_lt (by omega : 2*i-2-e-f < i)]
   simp
 rw [triangle_sumM58E F i hz]
 have he (h : ℕ) (hh : h∈range i) :
   (∑ e∈range (h+1), F e (h-e))=
   ((2*d).choose h:ℤ)*((2*i-2-h).choose i:ℤ)*
   ((j+i+1).choose (2*i-1-h):ℤ) := by
   have hh' := mem_range.mp hh
   have hterm (e : ℕ) (he : e∈range (h+1)) : F e (h-e)=
     ((d.choose e:ℤ)*(d.choose (h-e):ℤ))*
     (((2*i-2-h).choose i:ℤ)*((j+i+1).choose (2*i-1-h):ℤ)) := by
     have he' := mem_range.mp he
     dsimp [F]
     rw [show 2*i-2-e-(h-e)=2*i-2-h by omega,
       show 2*i-1-e-(h-e)=2*i-1-h by omega]
     ring
   rw [sum_congr rfl hterm,←sum_mul,←choose_add_sumM58E d d h,
     show d+d=2*d by omega]
   ring
 rw [sum_congr rfl he]
 conv_lhs => rw [show i=(i-1)+1 by omega,sum_range_succ]
 rw [show 2*i-2-(i-1)=i-1 by omega,
   Nat.choose_eq_zero_of_lt (by omega : i-1 < i)]
 simp

theorem offset_square_lowM58E (j d i : ℕ) (hi : i ≤ 1) :
 coeff (fib6 (j+d+1)^2) i j=0 := by
 rw [pow_two,bicoeff_mulM3A1]
 apply sum_eq_zero
 intro t ht
 have ht0 : t < j+d+1 := by have := mem_range.mp ht; omega
 have ht1 : j-t < j+d+1 := by omega
 interval_cases i  <;>
   simp [sum_range_succ,fib_low_zeroM3A1 _ _ ht0,fib_low_zeroM3A1 _ _ ht1]

end
end MathGKM.Markov
