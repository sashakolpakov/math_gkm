import MarkovTopKernelM55C
/-! Machine-authored 55cf20d2. Exact moment characterization of every high
upper-template gap. Positivity of the drift is not assumed or asserted. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

def topMomentM55C (d T i k : ℕ) : ℤ :=
 topLinearM55C T (fun s => topEigenM55C d s^k*topKernelM55C d i s)

def topExcessM55C (d T i : ℕ) : ℤ :=
 topMomentM55C d T i 1-topEigenM55C d i*topMassM55C d T i

def topVarianceNumerM55C (d T i : ℕ) : ℤ :=
 topMassM55C d T i*topMomentM55C d T i 2-topMomentM55C d T i 1^2

def topDriftM55C (d T i : ℕ) : ℤ :=
 (2*(i:ℤ)+6)*topExcessM55C d T i^2+
 topScaleM55C i*(2*(i:ℤ)+d+10)*topMassM55C d T i*topExcessM55C d T i-
 topScaleM55C i*topVarianceNumerM55C d T i

theorem top_linear_subM55C (T : ℕ) (f g : ℕ → ℤ) :
 topLinearM55C T (fun s => f s-g s)=topLinearM55C T f-topLinearM55C T g := by
 simp only [topLinearM55C,mul_sub,sum_sub_distrib]
 ring

theorem top_moment_stepM55C (d T i k : ℕ) :
 topScaleM55C i*topMomentM55C d T (i+1) k=
 topMomentM55C d T i (k+1)-topEigenM55C d i*topMomentM55C d T i k := by
 unfold topMomentM55C
 rw [←top_linear_smulM55C,←top_linear_smulM55C,←top_linear_subM55C]
 congr 1
 funext s
 have h := top_kernel_stepM55C d i s
 rw [pow_succ]
 linear_combination topEigenM55C d s^k*h

theorem top_moment_zeroM55C (d T i : ℕ) : topMomentM55C d T i 0=topMassM55C d T i := by
 simp [topMomentM55C,topMassM55C]

theorem top_mass_stepM55C (d T i : ℕ) :
 topScaleM55C i*topMassM55C d T (i+1)=topExcessM55C d T i := by
 simpa [top_moment_zeroM55C,topExcessM55C] using top_moment_stepM55C d T i 0

theorem top_mass_two_stepM55C (d T i : ℕ) :
 topScaleM55C i*topScaleM55C (i+1)*topMassM55C d T (i+2)=
 topMomentM55C d T i 2-
 (topEigenM55C d i+topEigenM55C d (i+1))*topMomentM55C d T i 1+
 topEigenM55C d i*topEigenM55C d (i+1)*topMassM55C d T i := by
 have h0 := top_mass_stepM55C d T i
 have h1 := top_mass_stepM55C d T (i+1)
 have hm := top_moment_stepM55C d T i 1
 unfold topExcessM55C at h0 h1
 simp only [show i+1+1=i+2 by omega] at h1
 linear_combination topScaleM55C i*h1+hm-topEigenM55C d (i+1)*h0

theorem top_gap_driftM55C (d T i : ℕ) :
 topScaleM55C i^2*topScaleM55C (i+1)*
 (topMassM55C d T (i+1)^2-topMassM55C d T i*topMassM55C d T (i+2))=
 topDriftM55C d T i := by
 calc
  _ = topScaleM55C (i+1)*(topScaleM55C i*topMassM55C d T (i+1))^2-
    topScaleM55C i*topMassM55C d T i*
      (topScaleM55C i*topScaleM55C (i+1)*topMassM55C d T (i+2)) := by ring
  _ = _ := by
    rw [top_mass_stepM55C,top_mass_two_stepM55C]
    unfold topDriftM55C topExcessM55C topVarianceNumerM55C topScaleM55C topEigenM55C
    push_cast
    ring

theorem top_scale_positiveM55C (i : ℕ) : 0 < topScaleM55C i := by
 unfold topScaleM55C
 positivity

theorem top_lc_iff_driftM55C (d T i : ℕ) :
 topMassM55C d T i*topMassM55C d T (i+2) ≤ topMassM55C d T (i+1)^2 ↔
 0 ≤ topDriftM55C d T i := by
 rw [←top_gap_driftM55C]
 have hp : 0 < topScaleM55C i^2*topScaleM55C (i+1) := by
   exact mul_pos (sq_pos_of_pos (top_scale_positiveM55C i)) (top_scale_positiveM55C (i+1))
 rw [mul_nonneg_iff_of_pos_left hp,sub_nonneg]

theorem top_mass_nonnegM55C (d T i : ℕ) : 0 ≤ topMassM55C d T i :=
 top_linear_nonnegM55C T _ (top_kernel_nonnegM55C d i)

theorem top_excess_nonnegM55C (d T i : ℕ) : 0 ≤ topExcessM55C d T i := by
 rw [←top_mass_stepM55C]
 exact mul_nonneg (top_scale_positiveM55C i).le (top_mass_nonnegM55C d T (i+1))

def TopMomentBoundM55C : Prop := ∀ d T i : ℕ, T ≤ d+2 →
 topScaleM55C i*topVarianceNumerM55C d T i ≤
 (2*(i:ℤ)+6)*topExcessM55C d T i^2+
 topScaleM55C i*(2*(i:ℤ)+d+10)*topMassM55C d T i*topExcessM55C d T i

theorem top_high_of_momentM55C (H : TopMomentBoundM55C) (n t i : ℕ)
 (hn : 2*t ≤ n) (ht : 3 ≤ t) (hnt : 3*t ≤ n+5) :
 (topTemplateMB3E n t).coeff (i+3)*(topTemplateMB3E n t).coeff (i+5) ≤
 (topTemplateMB3E n t).coeff (i+4)^2 := by
 let T := t-3
 let d := n-2*t
 have hT : T+3=t := by dsimp [T]; omega
 have hn' : 2*(T+3)+d=n := by dsimp [d]; omega
 have h := (top_lc_iff_driftM55C d T i).mpr (sub_nonneg.mpr (H d T i (by dsimp [T,d]; omega)))
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,hn',hT] at h
 simpa only [Nat.add_assoc,Nat.reduceAdd] using h

end
end MathGKM.Markov
