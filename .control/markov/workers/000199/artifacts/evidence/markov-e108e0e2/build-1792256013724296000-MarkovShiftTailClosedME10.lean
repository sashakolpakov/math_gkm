import MarkovShiftTailScalarME10
/-! Machine-authored e108e0e2. Shifted final-triple inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem top_tail_kernel_ratiosME10 (d i : ℕ) :
 tailDenME10 i d*topKernelME10 d i (i+1)=tailOneME10 i d*topKernelME10 d i i ∧
 tailDenME10 i d*topKernelME10 d i (i+2)=tailTwoME10 i d*topKernelME10 d i i := by
 have h0 := top_kernel_row_stepME10 d i i (by omega)
 have h1 := top_kernel_row_stepME10 d i (i+1) (by omega)
 simp only [show i+1+1=i+2 by omega] at h1
 push_cast at h1
 constructor
 · unfold tailDenME10 tailOneME10
   linear_combination 2*((d:ℤ)+i+3)*h0
 · unfold tailDenME10 tailTwoME10
   linear_combination ((d:ℤ)+i+2)*h1+((i:ℤ)+2)*((d:ℤ)+2*i+6)*h0

theorem top_tail_mass_scaledME10 (d i : ℕ) :
 tailDenME10 i d*topMassME10 d (i+2) i=tailAMME10 i d*topKernelME10 d i i ∧
 tailDenME10 i d*topScaleM55C i*topMassME10 d (i+2) (i+1)=tailEMME10 i d*topKernelME10 d i i ∧
 tailDenME10 i d*topScaleM55C i*topScaleM55C (i+1)*topMassME10 d (i+2) (i+2)=
   tailCMME10 i d*topKernelME10 d i i := by
 obtain ⟨hA,hB,hC⟩ := top_tail_mass_expansionsME10 d i
 obtain ⟨hv1,hv2⟩ := top_tail_kernel_ratiosME10 d i
 have hs1 := top_kernel_stepME10 d i (i+1)
 have hs2 := top_kernel_stepME10 d i (i+2)
 have hs3 := top_kernel_stepME10 d (i+1) (i+2)
 simp only [show i+1+1=i+2 by omega] at hs3
 unfold topEigenME10 at hs1 hs2 hs3
 push_cast at hs1 hs2 hs3
 constructor
 · rw [hA]
   unfold tailAMME10
   linear_combination hv2+4*hv1
 constructor
 · rw [hB]
   unfold tailEMME10
   linear_combination tailDenME10 i d*hs2+4*tailDenME10 i d*hs1+
     2*((d:ℤ)+2*i+7)*hv2+4*((d:ℤ)+2*i+6)*hv1
 · rw [hC]
   unfold tailCMME10
   linear_combination tailDenME10 i d*topScaleM55C i*hs3+
     tailDenME10 i d*((d:ℤ)+2*i+8)*hs2+
     2*((d:ℤ)+2*i+7)*((d:ℤ)+2*i+8)*hv2

theorem top_mass_last_strictME10 (d i : ℕ) :
 topMassME10 d (i+2) i*topMassME10 d (i+2) (i+2) <
 topMassME10 d (i+2) (i+1)^2 := by
 obtain ⟨hA,hB,hC⟩ := top_tail_mass_scaledME10 d i
 have hK : 0 < topKernelME10 d i i := by
   unfold topKernelME10
   rw [Nat.choose_self,Nat.cast_one,one_mul]
   exact_mod_cast Nat.choose_pos (show i+3 ≤ d+i+i+4 by omega)
 have hL : 0 < tailDenME10 i d := by unfold tailDenME10; positivity
 have ha := top_scale_positiveM55C i
 have hb := top_scale_positiveM55C (i+1)
 have hg := top_tail_scalar_positiveME10 i d (by positivity) (by positivity)
 have he : tailDenME10 i d^2*topScaleM55C i^2*topScaleM55C (i+1)*
   (topMassME10 d (i+2) (i+1)^2-topMassME10 d (i+2) i*topMassME10 d (i+2) (i+2))=
   topKernelME10 d i i^2*(topScaleM55C (i+1)*tailEMME10 i d^2-
     topScaleM55C i*tailAMME10 i d*tailCMME10 i d) := by
   calc
    _ = topScaleM55C (i+1)*(tailDenME10 i d*topScaleM55C i*topMassME10 d (i+2) (i+1))^2-
      topScaleM55C i*(tailDenME10 i d*topMassME10 d (i+2) i)*
        (tailDenME10 i d*topScaleM55C i*topScaleM55C (i+1)*topMassME10 d (i+2) (i+2)) := by ring
    _ = _ := by rw [hA,hB,hC]; ring
 have hg' : 0 < topScaleM55C (i+1)*tailEMME10 i d^2-
     topScaleM55C i*tailAMME10 i d*tailCMME10 i d := by
   simp only [topScaleM55C,Nat.cast_add,Nat.cast_one]
   convert sub_pos.mpr hg using 1 <;> ring
 have hp : 0 < tailDenME10 i d^2*topScaleM55C i^2*topScaleM55C (i+1) := by positivity
 have hh := mul_pos (sq_pos_of_pos hK) hg'
 rw [←he] at hh
 exact sub_pos.mp ((mul_pos_iff_of_pos_left hp).mp hh)

end
end MathGKM.Markov
