import MarkovTopCoefficientsMB3E
/-! Machine-authored 55cf20d2. A positive kernel for all high columns.
The index shift and the singleton endpoint are exact. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 5000000

def topKernelM55C (d i s : ℕ) : ℤ :=
 (s.choose i:ℤ)*((d+s+i+8).choose (i+3):ℤ)

def topLinearM55C (T : ℕ) (f : ℕ → ℤ) : ℤ :=
 f T+4*∑ s ∈ range T, ((T:ℤ)-s)*f s

def topMassM55C (d T i : ℕ) : ℤ := topLinearM55C T (topKernelM55C d i)

def topEigenM55C (d s : ℕ) : ℤ := (s:ℤ)*(s+d+9)

def topScaleM55C (i : ℕ) : ℤ := ((i:ℤ)+1)*(i+4)

theorem top_kernel_nonnegM55C (d i s : ℕ) : 0 ≤ topKernelM55C d i s := by
 unfold topKernelM55C
 positivity

theorem top_linear_nonnegM55C (T : ℕ) (f : ℕ → ℤ) (hf : ∀ s, 0 ≤ f s) :
 0 ≤ topLinearM55C T f := by
 unfold topLinearM55C
 apply add_nonneg (hf T)
 apply mul_nonneg (by norm_num)
 apply sum_nonneg
 intro s hs
 have hst : (s:ℤ) ≤ T := by have := mem_range.mp hs; omega
 exact mul_nonneg (sub_nonneg.mpr hst) (hf s)

theorem top_linear_addM55C (T : ℕ) (f g : ℕ → ℤ) :
 topLinearM55C T (fun s => f s+g s)=topLinearM55C T f+topLinearM55C T g := by
 simp only [topLinearM55C,mul_add,sum_add_distrib]
 ring

theorem top_linear_smulM55C (T : ℕ) (a : ℤ) (f : ℕ → ℤ) :
 topLinearM55C T (fun s => a*f s)=a*topLinearM55C T f := by
 unfold topLinearM55C
 rw [mul_add,←mul_assoc, mul_sum]
 congr 1
 rw [mul_sum]
 apply sum_congr rfl
 intro s hs
 ring

theorem top_mass_coeffM55C (d T i : ℕ) :
 (topTemplateMB3E (2*(T+3)+d) (T+3)).coeff (i+3)=topMassM55C d T i := by
 rw [top_positive_formulaMB3E _ _ _ (by omega)]
 unfold topPositiveMB3E topMassM55C topLinearM55C topKernelM55C
 rw [if_pos (by omega : 3 ≤ T+3),show T+3-3=T by omega,
   show 2*(T+3)+d+5-(T+3)+i=d+T+i+8 by omega]
 congr 1
 congr 1
 let f : ℕ → ℤ := fun s => (((T+3:ℕ):ℤ)-s)*
   (if 3 ≤ s then ((s-3).choose i:ℤ)*((d+s+i+5).choose (i+3):ℤ) else 0)
 have hs := sum_range_add f 3 T
 rw [show 3+T=T+3 by omega] at hs
 have hz : (∑ s ∈ range 3, f s)=0 := by norm_num [f,sum_range_succ]
 rw [hz,zero_add] at hs
 rw [show 2*(T+3)+d-2*(T+3)=d by omega]
 change (∑ s ∈ range (T+3), f s)=_
 rw [hs]
 apply sum_congr rfl
 intro s hs
 dsimp [f]
 rw [if_pos (by omega : 3 ≤ 3+s),show 3+s-3=s by omega,
   show d+(3+s)+i+5=d+s+i+8 by omega]
 push_cast
 ring

theorem top_kernel_stepM55C (d i s : ℕ) :
 topScaleM55C i*topKernelM55C d (i+1) s=
 (topEigenM55C d s-topEigenM55C d i)*topKernelM55C d i s := by
 unfold topScaleM55C topKernelM55C topEigenM55C
 by_cases hi : i ≤ s
 · have h0 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_succ_right_eq s i)
   have h1 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.add_one_mul_choose_eq (d+s+i+8) (i+3))
   simp only [Nat.cast_mul,Nat.cast_sub hi,Nat.cast_add,Nat.cast_ofNat,Nat.cast_one,Nat.succ_eq_add_one] at h0 h1
   rw [show d+s+(i+1)+8=d+s+i+8+1 by omega,
     show i+1+3=i+3+1 by omega]
   calc
    ((i:ℤ)+1)*(i+4)*((s.choose (i+1):ℤ)*((d+s+i+8+1).choose (i+3+1):ℤ))=
      ((s.choose (i+1):ℤ)*(i+1))*(((d+s+i+8+1).choose (i+3+1):ℤ)*(i+3+1)) := by ring
    _ = ((s.choose i:ℤ)*(s-i))*(((d:ℤ)+s+i+8+1)*((d+s+i+8).choose (i+3):ℤ)) := by rw [h0,←h1]
    _ = _ := by ring
 · have h0 : s < i := by omega
   rw [Nat.choose_eq_zero_of_lt h0,Nat.choose_eq_zero_of_lt (by omega : s < i+1)]
   simp

end
end MathGKM.Markov
