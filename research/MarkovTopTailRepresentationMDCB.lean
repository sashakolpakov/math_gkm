import MarkovTopTailKernelMEB6
/-! Machine-authored dcb64029. Uniform denominator-free tail representation.
All parameters and zero terms are retained. No positivity conjecture assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def tailNumMDCB (i d : ℤ) (k : ℕ) : ℤ :=
 ∏ j ∈ range k, (i+j+1)*(d+2*i+j+9)
def tailDenMDCB (i d : ℤ) (k : ℕ) : ℤ :=
 ∏ j ∈ range k, ((j:ℤ)+1)*(d+i+j+6)
def tailRestMDCB (i d : ℤ) (r k : ℕ) : ℤ :=
 ∏ j ∈ Ico k r, ((j:ℤ)+1)*(d+i+j+6)
def tailTermMDCB (i d : ℤ) (r k : ℕ) : ℤ :=
 tailNumMDCB i d k*tailRestMDCB i d r k
def tailAMDCB (i d : ℤ) (r : ℕ) : ℤ :=
 topLinearM55C r (tailTermMDCB i d r)
def tailEMDCB (i d : ℤ) (r : ℕ) : ℤ :=
 topLinearM55C r (fun k => (k:ℤ)*(d+2*i+k+9)*tailTermMDCB i d r k)
def tailCMDCB (i d : ℤ) (r : ℕ) : ℤ :=
 topLinearM55C r (fun k => (k:ℤ)*(k-1)*(d+2*i+k+9)*(d+2*i+k+10)*tailTermMDCB i d r k)
def tailGapMDCB (i d : ℤ) (r : ℕ) : ℤ :=
 (i+2)*(i+5)*tailEMDCB i d r^2-(i+1)*(i+4)*tailAMDCB i d r*tailCMDCB i d r

theorem tail_den_splitMDCB (i d : ℤ) (r k : ℕ) (hk : k ≤ r) :
 tailDenMDCB i d k*tailRestMDCB i d r k=tailDenMDCB i d r := by
 unfold tailDenMDCB tailRestMDCB
 exact prod_range_mul_prod_Ico _ hk

theorem tail_kernel_scaledMDCB (d i k : ℕ) :
 tailDenMDCB i d k*topKernelM55C d i (i+k)=tailNumMDCB i d k*topKernelM55C d i i := by
 induction k with
 | zero => simp [tailDenMDCB,tailNumMDCB]
 | succ k ih =>
   have h := top_kernel_row_stepMEB6 d i (i+k) (by omega)
   simp only [Nat.cast_add,Nat.cast_one] at h
   simp only [tailDenMDCB,tailNumMDCB,prod_range_succ] at *
   rw [show i+(k+1)=i+k+1 by omega]
   linear_combination (∏ j ∈ range k, ((j:ℤ)+1)*((d:ℤ)+i+j+6))*h+
     ((i:ℤ)+k+1)*((d:ℤ)+2*i+k+9)*ih

theorem tail_term_scaledMDCB (d i r k : ℕ) (hk : k ≤ r) :
 tailDenMDCB i d r*topKernelM55C d i (i+k)=tailTermMDCB i d r k*topKernelM55C d i i := by
 rw [←tail_den_splitMDCB (i:ℤ) d r k hk]
 unfold tailTermMDCB
 linear_combination tailRestMDCB i d r k*tail_kernel_scaledMDCB d i k

theorem top_linear_congrMDCB (r : ℕ) (f g : ℕ → ℤ) (h : ∀ k, k ≤ r → f k=g k) :
 topLinearM55C r f=topLinearM55C r g := by
 unfold topLinearM55C
 rw [h r le_rfl]
 congr 2
 apply sum_congr rfl
 intro k hk
 rw [h k (Nat.le_of_lt (mem_range.mp hk))]

theorem top_mass_column_shiftMDCB (d i r j : ℕ) :
 topMassM55C d (i+r) (i+j)=topLinearM55C r (fun k => topKernelM55C d (i+j) (i+k)) := by
 unfold topMassM55C topLinearM55C
 rw [sum_range_add]
 have hz : (∑ s ∈ range i, (((i+r:ℕ):ℤ)-s)*topKernelM55C d (i+j) s)=0 := by
   apply sum_eq_zero
   intro s hs
   rw [topKernelM55C,Nat.choose_eq_zero_of_lt (show s < i+j by have := mem_range.mp hs; omega)]
   simp
 rw [hz,zero_add]
 congr 2
 apply sum_congr rfl
 intro k hk
 push_cast
 ring

theorem tail_mass_scaledMDCB (d i r : ℕ) :
 tailDenMDCB i d r*topMassM55C d (i+r) i=tailAMDCB i d r*topKernelM55C d i i ∧
 tailDenMDCB i d r*topScaleM55C i*topMassM55C d (i+r) (i+1)=tailEMDCB i d r*topKernelM55C d i i ∧
 tailDenMDCB i d r*topScaleM55C i*topScaleM55C (i+1)*topMassM55C d (i+r) (i+2)=
   tailCMDCB i d r*topKernelM55C d i i := by
 have h0 := top_mass_column_shiftMDCB d i r 0
 simp only [Nat.add_zero] at h0
 constructor
 · rw [h0,←top_linear_smulM55C]
   unfold tailAMDCB
   rw [mul_comm _ (topKernelM55C d i i),←top_linear_smulM55C]
   apply top_linear_congrMDCB
   intro k hk
   rw [tail_term_scaledMDCB d i r k hk,mul_comm]
 constructor
 · rw [top_mass_column_shiftMDCB d i r 1,←top_linear_smulM55C]
   unfold tailEMDCB
   rw [mul_comm _ (topKernelM55C d i i),←top_linear_smulM55C]
   apply top_linear_congrMDCB
   intro k hk
   have hs := top_kernel_stepM55C d i (i+k)
   have ht := tail_term_scaledMDCB d i r k hk
   unfold topEigenM55C at hs
   push_cast at hs
   linear_combination tailDenMDCB i d r*hs+(k:ℤ)*((d:ℤ)+2*i+k+9)*ht
 · rw [top_mass_column_shiftMDCB d i r 2,←top_linear_smulM55C]
   unfold tailCMDCB
   rw [mul_comm _ (topKernelM55C d i i),←top_linear_smulM55C]
   apply top_linear_congrMDCB
   intro k hk
   have hs0 := top_kernel_stepM55C d i (i+k)
   have hs1 := top_kernel_stepM55C d (i+1) (i+k)
   have ht := tail_term_scaledMDCB d i r k hk
   rw [show i+1+1=i+2 by omega] at hs1
   unfold topEigenM55C at hs0 hs1
   push_cast at hs0 hs1
   linear_combination tailDenMDCB i d r*topScaleM55C i*hs1+
     tailDenMDCB i d r*((k:ℤ)-1)*((d:ℤ)+2*i+k+10)*hs0+
     (k:ℤ)*(k-1)*((d:ℤ)+2*i+k+9)*((d:ℤ)+2*i+k+10)*ht

theorem tail_den_positiveMDCB (i d r : ℕ) : 0 < tailDenMDCB i d r := by
 unfold tailDenMDCB
 apply prod_pos
 intro k hk
 positivity

theorem tail_base_positiveMDCB (d i : ℕ) : 0 < topKernelM55C d i i := by
 unfold topKernelM55C
 rw [Nat.choose_self,Nat.cast_one,one_mul]
 exact_mod_cast Nat.choose_pos (show i+3 ≤ d+i+i+8 by omega)

theorem tail_gap_identityMDCB (d i r : ℕ) :
 tailDenMDCB i d r^2*topScaleM55C i^2*topScaleM55C (i+1)*
   (topMassM55C d (i+r) (i+1)^2-topMassM55C d (i+r) i*topMassM55C d (i+r) (i+2))=
   topKernelM55C d i i^2*tailGapMDCB i d r := by
 obtain ⟨hA,hE,hC⟩ := tail_mass_scaledMDCB d i r
 calc
  _ = topScaleM55C (i+1)*(tailDenMDCB i d r*topScaleM55C i*topMassM55C d (i+r) (i+1))^2-
     topScaleM55C i*(tailDenMDCB i d r*topMassM55C d (i+r) i)*
     (tailDenMDCB i d r*topScaleM55C i*topScaleM55C (i+1)*topMassM55C d (i+r) (i+2)) := by ring
  _ = _ := by
   rw [hA,hE,hC]
   unfold tailGapMDCB topScaleM55C
   push_cast
   ring

theorem tail_lc_iffMDCB (d i r : ℕ) :
 topMassM55C d (i+r) i*topMassM55C d (i+r) (i+2) ≤ topMassM55C d (i+r) (i+1)^2 ↔
 0 ≤ tailGapMDCB i d r := by
 have h := tail_gap_identityMDCB d i r
 have hL : 0 < tailDenMDCB i d r^2*topScaleM55C i^2*topScaleM55C (i+1) := by
   have := tail_den_positiveMDCB i d r
   have := top_scale_positiveM55C i
   have := top_scale_positiveM55C (i+1)
   positivity
 have hK := sq_pos_of_pos (tail_base_positiveMDCB d i)
 rw [←sub_nonneg,←mul_nonneg_iff_of_pos_left hL,h,mul_nonneg_iff_of_pos_left hK]

theorem tail_strict_iffMDCB (d i r : ℕ) :
 topMassM55C d (i+r) i*topMassM55C d (i+r) (i+2) < topMassM55C d (i+r) (i+1)^2 ↔
 0 < tailGapMDCB i d r := by
 have h := tail_gap_identityMDCB d i r
 have hL : 0 < tailDenMDCB i d r^2*topScaleM55C i^2*topScaleM55C (i+1) := by
   have := tail_den_positiveMDCB i d r
   have := top_scale_positiveM55C i
   have := top_scale_positiveM55C (i+1)
   positivity
 have hK := sq_pos_of_pos (tail_base_positiveMDCB d i)
 rw [←sub_pos,←mul_pos_iff_of_pos_left hL,h,mul_pos_iff_of_pos_left hK]

end
end MathGKM.Markov
