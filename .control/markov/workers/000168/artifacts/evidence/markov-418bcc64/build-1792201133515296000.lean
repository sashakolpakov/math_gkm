import MarkovAbsorbedReductionM418
/-! Machine-authored 418bcc64. Exact three-coefficient boundary identity
and a lower bound for its binomial normalization; no new positivity premise
is silently discharged. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem base_choose_lowerM418 (j t : ℕ) : j+1 ≤ (t+j+3).choose j := by
 have h := Nat.choose_le_choose j (by omega : j+1 ≤ t+j+3)
 simpa only [Nat.choose_succ_self_right] using h

theorem cut_addM418 (h : ℕ) (P Q : ℝ[X]) :
 cutPolyMFEE h (P+Q)=cutPolyMFEE h P+cutPolyMFEE h Q := by
 exact weight_addM418 _ P Q

theorem cut_monomialM418 (h t : ℕ) (c : ℝ) (ht : h ≤ t) :
 cutPolyMFEE h (C c*X^t)=C c*X^t := by
 have hh := weight_monomialM418 (fun k => if h ≤ k then (1:ℝ) else 0) c t
 simpa only [cutPolyMFEE,if_pos ht,one_mul] using hh

theorem cut_absorbedM418 (d j t h : ℕ) (c : ℝ) (ht : h ≤ t) :
 cutPolyMFEE h (absorbedLiftM418 d j c t)=
 liftCutM7E2 j t h+C (absorbedExtraM418 d t c)*X^t := by
 rw [absorbedLiftM418,cut_addM418,cut_monomialM418 h t _ ht,cut_lift_identityMFEE]

def absorbedBoundaryGap0M418 (d j t : ℕ) (c : ℝ) : ℝ :=
 (liftTermMAE9 j (t+1) 1:ℝ)^2-
 ((liftTermMAE9 j t 0:ℝ)+absorbedExtraM418 d t c)*(liftTermMAE9 j (t+2) 2:ℝ)
def absorbedBoundaryGap1M418 (d j t : ℕ) (c : ℝ) : ℝ :=
 2*(liftTermMAE9 j (t+1) 1:ℝ)*((liftTermMAE9 j (t+1) 0:ℝ)+absorbedExtraM418 d (t+1) c)-
 ((liftTermMAE9 j t 0:ℝ)+absorbedExtraM418 d t c)*(liftTermMAE9 j (t+2) 1:ℝ)
def absorbedBoundaryGap2M418 (d j t : ℕ) (c : ℝ) : ℝ :=
 ((liftTermMAE9 j (t+1) 0:ℝ)+absorbedExtraM418 d (t+1) c)^2-
 ((liftTermMAE9 j t 0:ℝ)+absorbedExtraM418 d t c)*
   ((liftTermMAE9 j (t+2) 0:ℝ)+absorbedExtraM418 d (t+2) c)

theorem absorbed_boundary_identityM418 (d j t : ℕ) (c : ℝ) :
 (cutPolyMFEE t (absorbedLiftM418 d j c (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j c t)*cutPolyMFEE t (absorbedLiftM418 d j c (t+2))=
 X^(2*t)*(C (absorbedBoundaryGap0M418 d j t c)+
   C (absorbedBoundaryGap1M418 d j t c)*X+C (absorbedBoundaryGap2M418 d j t c)*X^2) := by
 rw [cut_absorbedM418 d j (t+1) t c (by omega),cut_absorbedM418 d j t t c (le_refl _),
   cut_absorbedM418 d j (t+2) t c (by omega)]
 have h0 := lift_cut_shiftMFEE j t 0
 have h1 := lift_cut_shiftMFEE j t 1
 have h2 := lift_cut_shiftMFEE j t 2
 simp only [Nat.add_zero] at h0
 rw [h0,h1,h2]
 simp only [sum_range_succ,sum_range_zero,Nat.sub_zero,Nat.sub_self,
   show 2-1=1 by rfl,monomial_zero_right,zero_add]
 simp only [←C_mul_X_pow_eq_monomial,pow_zero,pow_one,mul_one,
   absorbedBoundaryGap0M418,absorbedBoundaryGap1M418,absorbedBoundaryGap2M418,
   C_add,C_sub,C_pow,C_mul]
 rw [show 2*t=t+t by omega]
 simp only [pow_add,pow_one,map_ofNat]
 ring

theorem absorbed_boundary_of_threeM418 (d j t k : ℕ) (c : ℝ)
 (h0 : 0 ≤ absorbedBoundaryGap0M418 d j t c)
 (h1 : 0 ≤ absorbedBoundaryGap1M418 d j t c)
 (h2 : 0 ≤ absorbedBoundaryGap2M418 d j t c) :
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j c (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j c t)*cutPolyMFEE t (absorbedLiftM418 d j c (t+2))).coeff k := by
 rw [absorbed_boundary_identityM418,coeff_X_pow_mul']
 split_ifs
 · simp only [coeff_add,coeff_C,coeff_C_mul,coeff_X,coeff_X_pow]
   split_ifs <;> simp_all <;> positivity
 · exact le_rfl

end
end MathGKM.Markov
