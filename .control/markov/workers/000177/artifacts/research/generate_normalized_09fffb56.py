"""Machine-authored Lean certificates, independently checked by ring/positivity."""
from normalized_probe_09fffb56 import *
t,m,z=[variable(i) for i in range(3)];j=m+z
ns=[num(j,t+h,m) for h in range(3)];ds=[den(j,t+h,m) for h in range(3)]
gap=ns[1]**2*ds[0]*ds[2]-ns[0]*ns[2]*ds[1]**2
step=ns[1]*ds[0]-ns[0]*ds[1]
src='''import MarkovSharpMarginMBE3
/-! Machine-authored 09fffb56. Exact rational normalized coefficient geometry.
No full convolution inequality is assumed or concluded. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
def normNumerM09F (j t m : ℚ) : ℚ :=
 (t+4)*(t+5)*liftWeightMAE9 j t m
def normDenomM09F (j t m : ℚ) : ℚ :=
 (t+m+4)*(t+m+5)*liftWeightMAE9 j t 0
def normKernelM09F (j t m : ℚ) : ℚ := normNumerM09F j t m / normDenomM09F j t m

theorem norm_den_posM09F (j t m : ℚ) (hj : 0 ≤ j) (ht : 0 ≤ t) (hm : 0 ≤ m) :
 0 < normDenomM09F j t m := by
 have h := lift_weight_positiveMAE9 j t 0 ht (by norm_num) hj
 unfold normDenomM09F
 positivity

theorem norm_num_nonnegM09F (j t m : ℚ) (ht : 0 ≤ t) (hm : 0 ≤ m) (hmj : m ≤ j) :
 0 ≤ normNumerM09F j t m := by
 have h := lift_weight_positiveMAE9 j t m ht hm hmj
 unfold normNumerM09F
 positivity
'''
for name,p,lhs in [
 ('norm_step_clearedM09F',step,'normNumerM09F (m+z) (t+1) m*normDenomM09F (m+z) t m-\n+ normNumerM09F (m+z) t m*normDenomM09F (m+z) (t+1) m'),
 ('norm_gap_clearedM09F',gap,'normNumerM09F (m+z) (t+1) m^2*normDenomM09F (m+z) t m*normDenomM09F (m+z) (t+2) m-\n+ normNumerM09F (m+z) t m*normNumerM09F (m+z) (t+2) m*normDenomM09F (m+z) (t+1) m^2')]:
 lhs=lhs.replace('\n+ ','\n ')
 src+=f'''\ntheorem {name} (t m z : ℚ) (ht : 0 ≤ t) (hm : 0 ≤ m) (hz : 0 ≤ z) :
 0 ≤ {lhs} := by
 let p : ℚ := {horner(p)}
 have he : {lhs} = p := by
   dsimp [normNumerM09F,normDenomM09F,liftWeightMAE9,liftDenMAE9,p]
   ring
 rw [he]
 dsimp [p]
 positivity
'''
src+='''
theorem norm_stepM09F (j t m : ℚ) (ht : 0 ≤ t) (hm : 0 ≤ m) (hmj : m ≤ j) :
 normKernelM09F j t m ≤ normKernelM09F j (t+1) m := by
 have hj : 0 ≤ j := hm.trans hmj
 have h := norm_step_clearedM09F t m (j-m) ht hm (sub_nonneg.mpr hmj)
 rw [show m+(j-m)=j by ring] at h
 unfold normKernelM09F
 apply (div_le_div_iff₀ (norm_den_posM09F j t m hj ht hm)
   (norm_den_posM09F j (t+1) m hj (by linarith) hm)).mpr
 linarith

theorem norm_lcM09F (j t m : ℚ) (ht : 0 ≤ t) (hm : 0 ≤ m) (hmj : m ≤ j) :
 normKernelM09F j t m*normKernelM09F j (t+2) m ≤ normKernelM09F j (t+1) m^2 := by
 have hj : 0 ≤ j := hm.trans hmj
 have h := norm_gap_clearedM09F t m (j-m) ht hm (sub_nonneg.mpr hmj)
 rw [show m+(j-m)=j by ring] at h
 unfold normKernelM09F
 rw [div_mul_div_comm,div_pow]
 apply (div_le_div_iff₀
   (mul_pos (norm_den_posM09F j t m hj ht hm) (norm_den_posM09F j (t+2) m hj (by linarith) hm))
   (sq_pos_of_pos (norm_den_posM09F j (t+1) m hj (by linarith) hm))).mpr
 nlinarith only [h]

end
end MathGKM.Markov
'''
(R/'research/MarkovNormalizedKernelM09F.lean').write_text(src)
