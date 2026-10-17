import MarkovAbsorbedBoundaryBridgeM418
/-! Machine-authored f8f306c0. The absorbed perturbation changes only a finite
upper coefficient band. All statements retain the exact clamped correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def absorbedGapMF8F (d j t h : ℕ) (c : ℝ) : ℝ[X] :=
 (cutPolyMFEE h (absorbedLiftM418 d j c (t+1)))^2-
 cutPolyMFEE h (absorbedLiftM418 d j c t)*
 cutPolyMFEE h (absorbedLiftM418 d j c (t+2))

theorem absorbed_coeff_belowMF8F (d j t k : ℕ) (c : ℝ) (hk : k<t) :
 (absorbedLiftM418 d j c t).coeff k=(liftPolyM7E2 j t).coeff k := by
 simp [absorbedLiftM418,coeff_add,coeff_C_mul,coeff_X_pow,show k≠t by omega]

theorem absorbed_gap_low_identityMF8F (d j t h k : ℕ) (c : ℝ) (hk : k<t+h) :
 (absorbedGapMF8F d j t h c).coeff k=(liftCutGapM7E2 j t h).coeff k := by
 unfold absorbedGapMF8F liftCutGapM7E2
 rw [←cut_lift_identityMFEE,←cut_lift_identityMFEE,←cut_lift_identityMFEE]
 rw [cut_gap_coeffMFEE,cut_gap_coeffMFEE]
 apply sum_congr rfl
 intro p hp
 have hp' := mem_antidiagonal.mp hp
 by_cases hh : h ≤ min p.1 p.2
 · have h1 := (le_min_iff.mp hh).1
   have h2 := (le_min_iff.mp hh).2
   rw [if_pos hh,if_pos hh]
   rw [absorbed_coeff_belowMF8F d j (t+1) p.1 c (by omega),
     absorbed_coeff_belowMF8F d j (t+1) p.2 c (by omega),
     absorbed_coeff_belowMF8F d j t p.1 c (by omega),
     absorbed_coeff_belowMF8F d j (t+2) p.2 c (by omega)]
 · rw [if_neg hh,if_neg hh]

theorem absorbed_gap_low_nonnegMF8F (d j t h k : ℕ) (c : ℝ) (hk : k<t+h) :
 0 ≤ (absorbedGapMF8F d j t h c).coeff k := by
 rw [absorbed_gap_low_identityMF8F d j t h k c hk]
 exact lift_all_cutsM7A3 j t h k

theorem absorbed_gap_high_zeroMF8F (d j t h k : ℕ) (c : ℝ) (hk : 2*t+2<k) :
 (absorbedGapMF8F d j t h c).coeff k=0 := by
 unfold absorbedGapMF8F
 rw [cut_gap_coeffMFEE]
 apply sum_eq_zero
 intro p hp
 have hp' := mem_antidiagonal.mp hp
 split_ifs
 · have hb : (absorbedLiftM418 d j c (t+1)).coeff p.1 *
       (absorbedLiftM418 d j c (t+1)).coeff p.2=0 := by
     by_cases hi : t+1<p.1
     · rw [absorbed_coeff_tailM418 d j (t+1) p.1 c hi,zero_mul]
     · rw [absorbed_coeff_tailM418 d j (t+1) p.2 c (by omega),mul_zero]
   have ha : (absorbedLiftM418 d j c t).coeff p.1 *
       (absorbedLiftM418 d j c (t+2)).coeff p.2=0 := by
     by_cases hi : t<p.1
     · rw [absorbed_coeff_tailM418 d j t p.1 c hi,zero_mul]
     · rw [absorbed_coeff_tailM418 d j (t+2) p.2 c (by omega),mul_zero]
   rw [hb,ha,sub_self]
 · rfl

end
end MathGKM.Markov
