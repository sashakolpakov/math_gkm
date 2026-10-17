import MarkovTopMomentsM55C
import MarkovTopSecondSourceM55C
/-! Machine-authored 55cf20d2. Exact remaining condition for the entire
upper sector. Low columns and zero tails are discharged, not assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_mass_zeroM55C (d T i : ℕ) (hi : T < i) : topMassM55C d T i=0 := by
 unfold topMassM55C topLinearM55C topKernelM55C
 rw [Nat.choose_eq_zero_of_lt hi,Nat.cast_zero,zero_mul,zero_add]
 have hz : (∑ s ∈ range T, ((T:ℤ)-s)*((s.choose i:ℤ)*((d+s+i+8).choose (i+3):ℤ)))=0 := by
   apply sum_eq_zero
   intro s hs
   have hst := mem_range.mp hs
   rw [Nat.choose_eq_zero_of_lt (by omega : s < i)]
   simp
 rw [hz,mul_zero]

theorem top_mass_positiveM55C (d T i : ℕ) (hi : i ≤ T) : 0 < topMassM55C d T i := by
 unfold topMassM55C topLinearM55C
 apply add_pos_of_pos_of_nonneg
 · unfold topKernelM55C
   apply mul_pos
   · exact_mod_cast Nat.choose_pos hi
   · exact_mod_cast Nat.choose_pos (show i+3 ≤ d+T+i+8 by omega)
 · apply mul_nonneg (by norm_num)
   apply sum_nonneg
   intro s hs
   have hst : (s:ℤ) ≤ T := by have := mem_range.mp hs; omega
   exact mul_nonneg (sub_nonneg.mpr hst) (top_kernel_nonnegM55C d i s)

theorem top_drift_tailM55C (d T i : ℕ) (hi : T < i+2) : 0 ≤ topDriftM55C d T i := by
 apply (top_lc_iff_driftM55C d T i).mp
 rw [top_mass_zeroM55C d T (i+2) hi,mul_zero]
 exact sq_nonneg _

def TopSectorLCM55C : Prop := ∀ n t : ℕ, 2*t ≤ n → 5 ≤ t → 3*t ≤ n+5 →
 ∀ i, (topTemplateMB3E n t).coeff i*(topTemplateMB3E n t).coeff (i+2) ≤
   (topTemplateMB3E n t).coeff (i+1)^2

theorem top_sector_iff_momentM55C : TopSectorLCM55C ↔ TopMomentBoundM55C := by
 constructor
 · intro H d T i hT
   apply sub_nonneg.mp
   change 0 ≤ topDriftM55C d T i
   by_cases hsmall : T < 2
   · exact top_drift_tailM55C d T i (by omega)
   · have h := H (2*(T+3)+d) (T+3) (by omega) (by omega) (by omega) (i+3)
     rw [top_mass_coeffM55C,show i+3+2=(i+2)+3 by omega,
       show i+3+1=(i+1)+3 by omega,top_mass_coeffM55C,top_mass_coeffM55C] at h
     exact (top_lc_iff_driftM55C d T i).mp h
 · intro H n t hn ht hnt i
   rcases i with _|_|_|i
   · rw [(top_edge_coeffsMB3E n t hn (by omega)).1,zero_mul]
     exact sq_nonneg _
   · exact le_of_lt (top_template_first_strictMB3E n t hn (by omega) hnt)
   · exact le_of_lt (top_template_second_strictM55C n t hn ht hnt)
   · simpa only [Nat.add_assoc,Nat.reduceAdd] using top_high_of_momentM55C H n t i hn (by omega) hnt

def TopInteriorMomentM55C : Prop := ∀ d T i : ℕ, 2 ≤ T → T ≤ d+2 → i+2 ≤ T →
 0 ≤ topDriftM55C d T i

theorem top_moment_iff_interiorM55C : TopMomentBoundM55C ↔ TopInteriorMomentM55C := by
 constructor
 · intro H d T i h0 hT hi
   exact sub_nonneg.mpr (H d T i hT)
 · intro H d T i hT
   apply sub_nonneg.mp
   change 0 ≤ topDriftM55C d T i
   by_cases hi : i+2 ≤ T
   · exact H d T i (by omega) hT hi
   · exact top_drift_tailM55C d T i (by omega)

theorem source_top_sector_of_momentM55C (H : TopMomentBoundM55C)
 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q) (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t i r hq ht,source_top_coeffMB3E q t (i+2) r hq ht,
   source_top_coeffMB3E q t (i+1) r hq ht]
 apply top_sector_iff_momentM55C.mpr H
 · cases r <;> simp [sourceNME9C] <;> omega
 · exact ht0
 · cases r <;> simp [sourceNME9C] <;> omega

end
end MathGKM.Markov
