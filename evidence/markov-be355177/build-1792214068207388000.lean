import MarkovSharpTransportMBE3
/-! Machine-authored be355177. Under the explicit complete-margin premise,
the stronger tail-cut condition is equivalent to its single top scalar.
This is an auxiliary equivalence, not an equivalence with the full root. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem band_cut_degreeMBE3 (d k s h : ℕ) (r : Bool) :
 (cutPolyMFEE h (bandKernelM657 d k s r)).natDegree ≤ s := by
 apply natDegree_le_iff_coeff_eq_zero.mpr
 intro n hn
 rw [cut_poly_coeffMFEE]
 split_ifs; exact band_kernel_tailMBE3 _ _ _ _ _ hn; rfl

theorem lower_cut_degreeMBE3 (j s h : ℕ) :
 (cutPolyMFEE h (liftPolyM7E2 j s)).natDegree ≤ s := by
 apply natDegree_le_iff_coeff_eq_zero.mpr
 intro n hn
 rw [cut_poly_coeffMFEE]
 split_ifs
 · rw [lift_poly_coeffM7E2]
   simp [reverseLiftMAE9,show ¬n ≤ s by omega]
 · rfl

theorem robust_cut_top_identityMBE3 (d k s h : ℕ) (r : Bool) (hh : h ≤ s) :
 ((cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+1)))^2-
   cutPolyMFEE h (bandKernelM657 d k s r)*cutPolyMFEE h (bandKernelM657 d k (s+2) r)).coeff (2*s+2)=
 bandBaseMBE3 d k (s+1) r^2-bandTopMBE3 d k s r*bandTopMBE3 d k (s+2) r := by
 have hB := coeff_mul_add_eq_of_natDegree_le
   (lower_cut_degreeMBE3 (bandJMBE3 d k r) (s+1) h)
   (lower_cut_degreeMBE3 (bandJMBE3 d k r) (s+1) h)
 have hAC := coeff_mul_add_eq_of_natDegree_le
   (band_cut_degreeMBE3 d k s h r) (band_cut_degreeMBE3 d k (s+2) h r)
 rw [show s+1+(s+1)=2*s+2 by omega] at hB
 rw [show s+(s+2)=2*s+2 by omega] at hAC
 rw [coeff_sub,pow_two,hB,hAC]
 simp only [cut_poly_coeffMFEE,if_pos (show h ≤ s+1 by omega),if_pos hh,
   if_pos (show h ≤ s+2 by omega),band_kernel_topMBE3,lift_poly_coeffM7E2,
   reverseLiftMAE9,le_refl,ite_true,Nat.sub_self]
 simp only [bandBaseMBE3,pow_two]

theorem robust_cuts_iff_scalarMBE3 (HM : SharpCompleteMarginMBE3)
 (d k s : ℕ) (r : Bool) (hs : s ≤ bandJMBE3 d k r) :
 (∀ h n, 0 ≤ ((cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+1)))^2-
   cutPolyMFEE h (bandKernelM657 d k s r)*cutPolyMFEE h (bandKernelM657 d k (s+2) r)).coeff n) ↔
 bandTopMBE3 d k s r*bandTopMBE3 d k (s+2) r ≤ bandBaseMBE3 d k (s+1) r^2 := by
 constructor
 · intro H
   have h := H s (2*s+2)
   rw [robust_cut_top_identityMBE3 d k s s r (le_refl s)] at h
   exact sub_nonneg.mp h
 · intro H h n
   exact band_robust_cutMBE3 HM d k s r hs H h n

end
end MathGKM.Markov
