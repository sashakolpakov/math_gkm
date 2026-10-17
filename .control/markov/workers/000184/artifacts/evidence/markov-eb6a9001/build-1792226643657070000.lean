import MarkovTopTailScalarMEB6
/-! Machine-authored eb6a9001. The last high-column triple is strictly
log-concave for every natural parameter, without a row-depth bound. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem top_tail_kernel_ratiosMEB6 (d i : ℕ) :
 tailDenMEB6 i d*topKernelM55C d i (i+1)=tailOneMEB6 i d*topKernelM55C d i i ∧
 tailDenMEB6 i d*topKernelM55C d i (i+2)=tailTwoMEB6 i d*topKernelM55C d i i := by
 have h0 := top_kernel_row_stepMEB6 d i i (by omega)
 have h1 := top_kernel_row_stepMEB6 d i (i+1) (by omega)
 simp only [show i+1+1=i+2 by omega] at h1
 push_cast at h1
 constructor
 · unfold tailDenMEB6 tailOneMEB6
   linear_combination 2*((d:ℤ)+i+7)*h0
 · unfold tailDenMEB6 tailTwoMEB6
   linear_combination ((d:ℤ)+i+6)*h1+((i:ℤ)+2)*((d:ℤ)+2*i+10)*h0

theorem top_tail_mass_scaledMEB6 (d i : ℕ) :
 tailDenMEB6 i d*topMassM55C d (i+2) i=tailAMMEB6 i d*topKernelM55C d i i ∧
 tailDenMEB6 i d*topScaleM55C i*topMassM55C d (i+2) (i+1)=tailEMMEB6 i d*topKernelM55C d i i ∧
 tailDenMEB6 i d*topScaleM55C i*topScaleM55C (i+1)*topMassM55C d (i+2) (i+2)=
   tailCMMEB6 i d*topKernelM55C d i i := by
 obtain ⟨hA,hB,hC⟩ := top_tail_mass_expansionsMEB6 d i
 obtain ⟨hv1,hv2⟩ := top_tail_kernel_ratiosMEB6 d i
 have hs1 := top_kernel_stepM55C d i (i+1)
 have hs2 := top_kernel_stepM55C d i (i+2)
 have hs3 := top_kernel_stepM55C d (i+1) (i+2)
 simp only [show i+1+1=i+2 by omega] at hs3
 unfold topEigenM55C at hs1 hs2 hs3
 push_cast at hs1 hs2 hs3
 constructor
 · rw [hA]
   unfold tailAMMEB6
   linear_combination hv2+4*hv1
 constructor
 · rw [hB]
   unfold tailEMMEB6
   linear_combination tailDenMEB6 i d*hs2+4*tailDenMEB6 i d*hs1+
     2*((d:ℤ)+2*i+11)*hv2+4*((d:ℤ)+2*i+10)*hv1
 · rw [hC]
   unfold tailCMMEB6
   linear_combination tailDenMEB6 i d*topScaleM55C i*hs3+
     tailDenMEB6 i d*((d:ℤ)+2*i+12)*hs2+
     2*((d:ℤ)+2*i+11)*((d:ℤ)+2*i+12)*hv2

theorem top_mass_last_strictMEB6 (d i : ℕ) :
 topMassM55C d (i+2) i*topMassM55C d (i+2) (i+2) <
 topMassM55C d (i+2) (i+1)^2 := by
 obtain ⟨hA,hB,hC⟩ := top_tail_mass_scaledMEB6 d i
 have hK : 0 < topKernelM55C d i i := by
   unfold topKernelM55C
   rw [Nat.choose_self,Nat.cast_one,one_mul]
   exact_mod_cast Nat.choose_pos (show i+3 ≤ d+i+i+8 by omega)
 have hL : 0 < tailDenMEB6 i d := by unfold tailDenMEB6; positivity
 have ha := top_scale_positiveM55C i
 have hb := top_scale_positiveM55C (i+1)
 have hg := top_tail_scalar_positiveMEB6 i d (by positivity) (by positivity)
 have he : tailDenMEB6 i d^2*topScaleM55C i^2*topScaleM55C (i+1)*
   (topMassM55C d (i+2) (i+1)^2-topMassM55C d (i+2) i*topMassM55C d (i+2) (i+2))=
   topKernelM55C d i i^2*(topScaleM55C (i+1)*tailEMMEB6 i d^2-
     topScaleM55C i*tailAMMEB6 i d*tailCMMEB6 i d) := by
   calc
    _ = topScaleM55C (i+1)*(tailDenMEB6 i d*topScaleM55C i*topMassM55C d (i+2) (i+1))^2-
      topScaleM55C i*(tailDenMEB6 i d*topMassM55C d (i+2) i)*
        (tailDenMEB6 i d*topScaleM55C i*topScaleM55C (i+1)*topMassM55C d (i+2) (i+2)) := by ring
    _ = _ := by rw [hA,hB,hC]; ring
 have hg' : 0 < topScaleM55C (i+1)*tailEMMEB6 i d^2-
     topScaleM55C i*tailAMMEB6 i d*tailCMMEB6 i d := by
   simp only [topScaleM55C,Nat.cast_add,Nat.cast_one]
   convert sub_pos.mpr hg using 1 <;> ring
 have hp : 0 < tailDenMEB6 i d^2*topScaleM55C i^2*topScaleM55C (i+1) := by positivity
 have hh := mul_pos (sq_pos_of_pos hK) hg'
 rw [←he] at hh
 exact sub_pos.mp ((mul_pos_iff_of_pos_left hp).mp hh)

end
end MathGKM.Markov
