import MarkovAugmentedSourceM7A3
/-! Machine-authored 418bcc64. A different coefficient representation:
absorb the binomial correction into the existing last coefficient. Natural
subtraction clamps its tail to zero. No shape premise is asserted as a theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def absorbedExtraM418 (d t : ℕ) (c : ℝ) : ℝ := c*((d-t:ℕ):ℝ)/(t+1)
def absorbedLiftM418 (d j : ℕ) (c : ℝ) (t : ℕ) : ℝ[X] :=
 liftPolyM7E2 j t+C (absorbedExtraM418 d t c)*X^t

theorem weight_addM418 (w : ℕ → ℝ) (P Q : ℝ[X]) :
 weightPolyMFEE w (P+Q)=weightPolyMFEE w P+weightPolyMFEE w Q := by
 ext k
 simp only [weight_poly_coeffMFEE,coeff_add]
 ring

theorem weight_monomialM418 (w : ℕ → ℝ) (a : ℝ) (t : ℕ) :
 weightPolyMFEE w (C a*X^t)=C (w t*a)*X^t := by
 ext k
 simp only [weight_poly_coeffMFEE,coeff_C_mul,coeff_X_pow]
 split_ifs with h
 · subst k; ring
 · ring

theorem absorbed_chooseM418 (d t : ℕ) (c : ℝ) :
 (d.choose t:ℝ)*absorbedExtraM418 d t c=c*(d.choose (t+1):ℝ) := by
 have ht : (t:ℝ)+1≠0 := by positivity
 have hb := congrArg (fun n : ℕ => (n:ℝ)) (Nat.choose_succ_right_eq d t)
 push_cast at hb
 unfold absorbedExtraM418
 apply (eq_div_iff ht).mp
 field_simp
 nlinarith only [hb]

theorem absorbed_weighted_outputM418 (d j t : ℕ) (c : ℤ) :
 (weightPolyMFEE (fun k => zchooseM37B d k) (absorbedLiftM418 d j c t)).eval 1=
 (augmentedOutputM7A3 d j c (t+1):ℝ) := by
 rw [absorbedLiftM418,weight_addM418,eval_add,weighted_lift_outputMFEE,
   weight_monomialM418]
 simp only [eval_mul,eval_C,eval_pow,eval_X,one_pow,mul_one,zchoose_natM37B]
 rw [absorbed_chooseM418]
 simp [augmentedOutputM7A3]

theorem absorbed_nonnegM418 (d j t k : ℕ) (c : ℝ) (hc : 0 ≤ c) :
 0 ≤ (absorbedLiftM418 d j c t).coeff k := by
 rw [absorbedLiftM418,coeff_add,lift_poly_coeffM7E2,coeff_C_mul,coeff_X_pow]
 have hl : 0 ≤ (reverseLiftMAE9 j t k:ℝ) := by
   unfold reverseLiftMAE9 liftTermMAE9
   split_ifs <;> positivity
 have he : 0 ≤ absorbedExtraM418 d t c := by unfold absorbedExtraM418; positivity
 split_ifs <;> positivity

theorem absorbed_tailM418 (d j t : ℕ) (c : ℝ) (ht : d ≤ t) :
 absorbedLiftM418 d j c t=liftPolyM7E2 j t := by
 simp [absorbedLiftM418,absorbedExtraM418,Nat.sub_eq_zero_of_le ht]

theorem absorbed_output_lc_of_cutsM418 (d j t : ℕ) (c : ℤ)
 (H : ∀ h n, 0 ≤ ((cutPolyMFEE h (absorbedLiftM418 d j c (t+1)))^2-
   cutPolyMFEE h (absorbedLiftM418 d j c t)*
     cutPolyMFEE h (absorbedLiftM418 d j c (t+2))).coeff n) :
 augmentedOutputM7A3 d j c (t+1)*augmentedOutputM7A3 d j c (t+3) ≤
   augmentedOutputM7A3 d j c (t+2)^2 := by
 have hf : CrossLC (zchooseM37B d) := by
   have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext k; exact zchoose_coeffM37B d k
   rw [he]
   exact crossLC_binomial d
 have hp (k : ℤ) : 0 ≤ zchooseM37B d k := by
   unfold zchooseM37B
   split_ifs <;> positivity
 have hh := weighted_value_lcMFEE _ _ _ H (zchooseM37B d) hf hp
 simp only [absorbed_weighted_outputM418] at hh
 exact_mod_cast hh

end
end MathGKM.Markov
