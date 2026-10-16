import MarkovOffsetTermM58E
/-! Machine-authored 4f4ac079. A forward difference collapses the complete
lower-row sum to two binomial products. All natural zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

def lowerBaseM4F4 (i j d : ℕ) : ℤ :=
 ((j+i).choose i:ℤ)*((j+2*d).choose (i-2):ℤ)

theorem lower_core_differenceM4F4 (i j h : ℕ) (hh : h+2 ≤ i) :
 lowerCoreM58E (j+1) i h-lowerCoreM58E j i h=
 ((j+i+1).choose i:ℤ)*((j+1).choose (i-2-h):ℤ)+
 ((j+i).choose i:ℤ)*(j.choose (i-2-h):ℤ) := by
 let k := 2*i-2-h
 have hk : i ≤ k := by dsimp [k]; omega
 have he : k+1=2*i-1-h := by dsimp [k]; omega
 have h0 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_succ_succ (j+i) k)
 have h1 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_succ_succ (j+i+1) k)
 have hm0 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_mul (n:=j+i) hk)
 have hm1 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_mul (n:=j+i+1) hk)
 simp only [Nat.succ_eq_add_one] at h0 h1
 push_cast at h0 h1 hm0 hm1
 rw [show j+i-i=j by omega,show k-i=i-2-h by dsimp [k]; omega] at hm0
 rw [show j+i+1-i=j+1 by omega,show k-i=i-2-h by dsimp [k]; omega] at hm1
 unfold lowerCoreM58E
 change (k.choose i:ℤ)*_-(k.choose i:ℤ)*_=_
 rw [←he]
 rw [show j+1+i+1=j+i+1+1 by omega,show j+1+i=j+i+1 by omega]
 linear_combination (k.choose i:ℤ)*(h1+h0)+hm1+hm0

theorem lower_differenceM4F4 (i j d : ℕ) (hi : 2 ≤ i) :
 lowerValM58E (j+1) d i-lowerValM58E j d i=
 lowerBaseM4F4 i (j+1) d+lowerBaseM4F4 i j d := by
 have hf (j : ℕ) : lowerValM58E j d i=
   ∑ h∈range (i-1), ((2*d).choose h:ℤ)*lowerCoreM58E j i h := by
   unfold lowerValM58E lowerCoreM58E
   apply sum_congr rfl
   intro h hh
   ring
 rw [hf,hf,←sum_sub_distrib]
 have ht (h : ℕ) (hh : h∈range (i-1)) :
   ((2*d).choose h:ℤ)*lowerCoreM58E (j+1) i h-
   ((2*d).choose h:ℤ)*lowerCoreM58E j i h=
   ((j+i+1).choose i:ℤ)*(((2*d).choose h:ℤ)*((j+1).choose (i-2-h):ℤ))+
   ((j+i).choose i:ℤ)*(((2*d).choose h:ℤ)*(j.choose (i-2-h):ℤ)) := by
   rw [←mul_sub,lower_core_differenceM4F4 i j h (by have := mem_range.mp hh; omega)]
   ring
 rw [sum_congr rfl ht,sum_add_distrib,←mul_sum,←mul_sum]
 rw [show i-1=i-2+1 by omega,←choose_add_sumM58E (j+1) (2*d) (i-2),
   ←choose_add_sumM58E j (2*d) (i-2)]
 simp only [lowerBaseM4F4,show j+1+i=j+i+1 by omega]

theorem lower_initialM4F4 (i d : ℕ) (hi : 2 ≤ i) :
 lowerValM58E 0 d i=lowerBaseM4F4 i 0 d := by
 unfold lowerValM58E lowerBaseM4F4
 rw [sum_eq_single (i-2)]
 · simp [show 2*i-2-(i-2)=i by omega,show 2*i-1-(i-2)=i+1 by omega]
 · intro h hh hn
   have hh' := mem_range.mp hh
   rw [Nat.choose_eq_zero_of_lt (by omega : 0+i+1 < 2*i-1-h),
     Nat.choose_eq_zero_of_lt (by omega : 0+i < 2*i-1-h)]
   ring
 · intro hn
   exact False.elim (hn (mem_range.mpr (by omega)))

theorem lower_prefixM4F4 (i j d : ℕ) (hi : 2 ≤ i) :
 lowerValM58E j d i=lowerBaseM4F4 i j d+2*∑ t∈range j, lowerBaseM4F4 i t d := by
 induction j with
 | zero => simpa using lower_initialM4F4 i d hi
 | succ j ih =>
   have h := lower_differenceM4F4 i j d hi
   rw [sum_range_succ]
   linear_combination h+ih

theorem source_two_lower_prefixM4F4 (path : List Bool) (i j d : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*(j+d)+1) (hi : 2 ≤ i) :
 coeff (frame path).mid.p i j=
 lowerBaseM4F4 i j d+2*∑ t∈range j, lowerBaseM4F4 i t d := by
 rw [source_two_lower_formulaM58E path j d i ha hb]
 exact lower_prefixM4F4 i j d hi
end
end MathGKM.Markov
