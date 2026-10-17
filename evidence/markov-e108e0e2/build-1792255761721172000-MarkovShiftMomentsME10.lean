import MarkovTopShiftME10
import MarkovCenteredAttachmentME87
/-! Machine-authored e108e0e2. Shifted actual-weight identities. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
def topEigenME10 (d s : ℕ) : ℤ := (s:ℤ)*(s+d+5)


theorem top_kernel_nonnegME10 (d i s : ℕ) : 0 ≤ topKernelME10 d i s := by
 unfold topKernelME10
 positivity


theorem top_kernel_stepME10 (d i s : ℕ) :
 topScaleM55C i*topKernelME10 d (i+1) s=
 (topEigenME10 d s-topEigenME10 d i)*topKernelME10 d i s := by
 unfold topScaleM55C topKernelME10 topEigenME10
 by_cases hi : i ≤ s
 · have h0 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.choose_succ_right_eq s i)
   have h1 := congrArg (fun z : ℕ => (z:ℤ)) (Nat.add_one_mul_choose_eq (d+s+i+4) (i+3))
   simp only [Nat.cast_mul,Nat.cast_sub hi,Nat.cast_add,Nat.cast_ofNat,Nat.cast_one,Nat.succ_eq_add_one] at h0 h1
   rw [show d+s+(i+1)+4=d+s+i+4+1 by omega,
     show i+1+3=i+3+1 by omega]
   calc
    ((i:ℤ)+1)*(i+4)*((s.choose (i+1):ℤ)*((d+s+i+4+1).choose (i+3+1):ℤ))=
      ((s.choose (i+1):ℤ)*(i+1))*(((d+s+i+4+1).choose (i+3+1):ℤ)*(i+3+1)) := by ring
    _ = ((s.choose i:ℤ)*(s-i))*(((d:ℤ)+s+i+4+1)*((d+s+i+4).choose (i+3):ℤ)) := by rw [h0,←h1]
    _ = _ := by ring
 · have h0 : s < i := by omega
   rw [Nat.choose_eq_zero_of_lt h0,Nat.choose_eq_zero_of_lt (by omega : s < i+1)]
   simp


def topMomentME10 (d T i k : ℕ) : ℤ :=
 topLinearM55C T (fun s => topEigenME10 d s^k*topKernelME10 d i s)


def topExcessME10 (d T i : ℕ) : ℤ :=
 topMomentME10 d T i 1-topEigenME10 d i*topMassME10 d T i


def topVarianceNumerME10 (d T i : ℕ) : ℤ :=
 topMassME10 d T i*topMomentME10 d T i 2-topMomentME10 d T i 1^2


theorem top_moment_stepME10 (d T i k : ℕ) :
 topScaleM55C i*topMomentME10 d T (i+1) k=
 topMomentME10 d T i (k+1)-topEigenME10 d i*topMomentME10 d T i k := by
 unfold topMomentME10
 rw [←top_linear_smulM55C,←top_linear_smulM55C,←top_linear_subM55C]
 congr 1
 funext s
 have h := top_kernel_stepME10 d i s
 rw [pow_succ]
 linear_combination topEigenME10 d s^k*h


theorem top_moment_zeroME10 (d T i : ℕ) : topMomentME10 d T i 0=topMassME10 d T i := by
 simp [topMomentME10,topMassME10]


theorem top_mass_stepME10 (d T i : ℕ) :
 topScaleM55C i*topMassME10 d T (i+1)=topExcessME10 d T i := by
 simpa [top_moment_zeroME10,topExcessME10] using top_moment_stepME10 d T i 0


theorem top_mass_two_stepME10 (d T i : ℕ) :
 topScaleM55C i*topScaleM55C (i+1)*topMassME10 d T (i+2)=
 topMomentME10 d T i 2-
 (topEigenME10 d i+topEigenME10 d (i+1))*topMomentME10 d T i 1+
 topEigenME10 d i*topEigenME10 d (i+1)*topMassME10 d T i := by
 have h0 := top_mass_stepME10 d T i
 have h1 := top_mass_stepME10 d T (i+1)
 have hm := top_moment_stepME10 d T i 1
 unfold topExcessME10 at h0 h1
 simp only [show i+1+1=i+2 by omega] at h1
 linear_combination topScaleM55C i*h1+hm-topEigenME10 d (i+1)*h0



end
end MathGKM.Markov
