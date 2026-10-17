import MarkovPerturbKernelMC3E
/-! Machine-authored c3e5369f. Robustness under arbitrary bounded last
coefficients, with complete and border margins kept explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem perturb_above_borderMC3E (j t h k : ℕ) (a b c u : ℝ)
 (htj : t ≤ j) (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hu : 0 ≤ u)
 (hau : a ≤ u) (hcu : c ≤ u)
 (hm : 2*u*(completeLiftMA64 j (t+2)).coeff 0+u^2 ≤ topGapMA64 j t)
 (hh : h ≤ t) (hk : t+h<k) : 0 ≤ (perturbGapMC3E j t h a b c).coeff k := by
 let H := j+h-t
 have hH : H+t=j+h := by dsimp [H]; omega
 have h0 := perturb_common_shiftMC3E j t h 0 H a hH hh
 have h1 := perturb_common_shiftMC3E j t h 1 H b hH hh
 have h2 := perturb_common_shiftMC3E j t h 2 H c hH hh
 simp only [Nat.add_zero,pow_zero,one_mul,pow_one] at h0 h1
 have he : X^(2*j)*perturbGapMC3E j t h a b c=
   X^(2*t)*((cutPolyMFEE H (X*perturbCompleteMC3E j (t+1) b))^2-
     cutPolyMFEE H (perturbCompleteMC3E j t a)*
       cutPolyMFEE H (X^2*perturbCompleteMC3E j (t+2) c)) := by
   rw [perturbGapMC3E,show 2*j=j+j by omega,show 2*t=t+t by omega,pow_add,pow_add]
   calc
    _ = (X^j*cutPolyMFEE h (perturbLiftMC3E j (t+1) b))^2-
      (X^j*cutPolyMFEE h (perturbLiftMC3E j t a))*
        (X^j*cutPolyMFEE h (perturbLiftMC3E j (t+2) c)) := by ring
    _ = _ := by rw [h0,h1,h2]; ring
 have hv := congrArg (fun P : ℝ[X] => P.coeff (2*j+k)) he
 rw [coeff_X_pow_mul',if_pos (by omega),show 2*j+k-2*j=k by omega,
   coeff_X_pow_mul',if_pos (by omega)] at hv
 rw [hv]
 apply le_trans _ (cut_gap_ge_fullMF8F _ _ _ (j+1) H (2*j+k-2*t)
   (perturb_complete_nonnegMC3E j t · a ha) ?_ ?_ (by dsimp [H]; omega))
 · have hx : (X*perturbCompleteMC3E j (t+1) b)^2-
     perturbCompleteMC3E j t a*(X^2*perturbCompleteMC3E j (t+2) c)=
     X^2*(perturbCompleteMC3E j (t+1) b^2-
       perturbCompleteMC3E j t a*perturbCompleteMC3E j (t+2) c) := by ring
   rw [hx,coeff_X_pow_mul']
   split_ifs
   · exact perturb_complete_gapMC3E j t _ a b c u ha hb hc hu hau hcu hm
   · exact le_rfl
 · intro i
   rw [coeff_X_pow_mul']
   split_ifs
   · exact perturb_complete_nonnegMC3E j (t+2) _ c hc
   · exact le_rfl
 · intro i hi
   cases i with
   | zero => omega
   | succ i => rw [coeff_X_mul]; exact perturb_complete_tailMC3E j (t+1) i b (by omega)

theorem perturb_border_marginMC3E (j t h : ℕ) (a u : ℝ)
 (htj : t+1 ≤ j) (hh : h ≤ t) (hu : 0 ≤ u) (hau : a ≤ u)
 (hm : u*borderRatioMA64 j t*kernelScaleMA64 j t ≤
   topGapMA64 j t*(liftTermMAE9 j (t+1) 1:ℝ)) :
 a*(liftTermMAE9 j (t+2) (t+2-h):ℝ) ≤ (liftCutGapM7E2 j t h).coeff (t+h) := by
 have hn : 1 ≤ t+1-h := by omega
 have hnj : t+1-h ≤ j := by omega
 have hC := lift_right_upperMA64 j t (t+1-h) hn hnj
 rw [show t+1-h+1=t+2-h by omega] at hC
 have hCn : (0:ℝ) ≤ liftTermMAE9 j (t+2) (t+2-h) := by
   unfold liftTermMAE9
   positivity
 have hBn : (0:ℝ) ≤ liftTermMAE9 j (t+1) (t+1-h) := by
   exact_mod_cast (lift_term_positiveMAD5 j (t+1) (t+1-h) hnj).le
 have hM : 0 < kernelScaleMA64 j t := by
   unfold kernelScaleMA64
   rw [complete_coeffMA64]
   have hp : (0:ℝ) < liftTermMAE9 j (t+1) 0 := by
     exact_mod_cast lift_term_positiveMAD5 j (t+1) 0 (by omega)
   positivity
 have hprod := mul_le_mul hau hC hCn hu
 have hprodM := mul_le_mul_of_nonneg_right hprod hM.le
 have hscalar := mul_le_mul_of_nonneg_right hm hBn
 have hgap := lift_border_lowerMA64 j t h hh htj
 apply (mul_le_mul_iff_of_pos_right hM).mp
 nlinarith only [hprodM,hscalar,hgap]

theorem perturb_all_cutsMC3E (j t h k : ℕ) (a b c u : ℝ)
 (htj : t+1 ≤ j) (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hu : 0 ≤ u)
 (hau : a ≤ u) (hcu : c ≤ u)
 (hm : 2*u*(completeLiftMA64 j (t+2)).coeff 0+u^2 ≤ topGapMA64 j t)
 (hmB : u*borderRatioMA64 j t*kernelScaleMA64 j t ≤
   topGapMA64 j t*(liftTermMAE9 j (t+1) 1:ℝ)) :
 0 ≤ (perturbGapMC3E j t h a b c).coeff k := by
 by_cases hh : h ≤ t
 · rcases lt_trichotomy k (t+h) with hk|hk|hk
   · rw [perturb_gap_lowMC3E j t h k a b c hh hk]
     exact lift_all_cutsM7A3 j t h k
   · subst k
     rw [perturb_gap_borderMC3E j t h a b c hh]
     exact sub_nonneg.mpr (perturb_border_marginMC3E j t h a u htj hh hu hau hmB)
   · exact perturb_above_borderMC3E j t h k a b c u (by omega) ha hb hc hu hau hcu hm hh hk
 · have hz : cutPolyMFEE h (perturbLiftMC3E j t a)=0 := by
     ext n
     rw [cut_poly_coeffMFEE,coeff_zero]
     split_ifs with hn
     · exact perturb_tailMC3E j t n a (by omega)
     · rfl
   rw [perturbGapMC3E,hz,zero_mul,sub_zero,pow_two,coeff_mul]
   apply sum_nonneg
   intro p hp
   have hn (n : ℕ) : 0 ≤ (cutPolyMFEE h (perturbLiftMC3E j (t+1) b)).coeff n := by
     rw [cut_poly_coeffMFEE]
     split_ifs
     · exact perturb_nonnegMC3E j (t+1) n b hb
     · exact le_rfl
   exact mul_nonneg (hn _) (hn _)

end
end MathGKM.Markov
