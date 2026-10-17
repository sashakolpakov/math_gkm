import MarkovMarginSourceMA64
/-! Machine-authored a646848d. Complete reversed absorbed kernel, with its
exact cut/shift bridge to the inherited triangular kernel. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def absorbedCompleteMA64 (d j : ℕ) (c : ℝ) (t : ℕ) : ℝ[X] :=
 ePolyM7E2 j t+C (absorbedExtraM418 d t c)*X^j

theorem complete_degreeMA64 (j t : ℕ) (a : ℝ) :
 (completeLiftMA64 j t+C a).natDegree ≤ j := by
 apply (natDegree_add_le _ _).trans
 exact max_le (q_comp_degreeM7E2 j t) (by simp)

theorem absorbed_complete_reflectMA64 (d j t : ℕ) (c : ℝ) :
 absorbedCompleteMA64 d j c t=
 reflect j (completeLiftMA64 j t+C (absorbedExtraM418 d t c)) := by
 rw [reflect_add,reflect_C]
 rfl

theorem absorbed_complete_nonnegMA64 (d j t k : ℕ) (c : ℝ) (hc : 0 ≤ c) :
 0 ≤ (absorbedCompleteMA64 d j c t).coeff k := by
 rw [absorbed_complete_reflectMA64,coeff_reflect,coeff_add,coeff_C]
 have h := complete_nonnegMA64 j t (revAt j k)
 have he : 0 ≤ absorbedExtraM418 d t c := by unfold absorbedExtraM418; positivity
 split_ifs <;> linarith

theorem absorbed_complete_tailMA64 (d j t k : ℕ) (c : ℝ) (hk : j<k) :
 (absorbedCompleteMA64 d j c t).coeff k=0 := by
 simp [absorbedCompleteMA64,coeff_add,e_poly_tailM7E2 j t k hk,
   coeff_C_mul,coeff_X_pow,show k≠j by omega]

theorem absorbed_complete_gapMA64 (d j t k : ℕ) (c : ℝ)
 (ht : 4 ≤ t) (htd : t<d) (hj : d+2 ≤ j) (hc : 0 ≤ c) (hc8 : c ≤ 8) :
 0 ≤ (absorbedCompleteMA64 d j c (t+1)^2-
   absorbedCompleteMA64 d j c t*absorbedCompleteMA64 d j c (t+2)).coeff k := by
 have he : absorbedCompleteMA64 d j c (t+1)^2-
     absorbedCompleteMA64 d j c t*absorbedCompleteMA64 d j c (t+2)=
   reflect (j+j) ((completeLiftMA64 j (t+1)+C (absorbedExtraM418 d (t+1) c))^2-
     (completeLiftMA64 j t+C (absorbedExtraM418 d t c))*
     (completeLiftMA64 j (t+2)+C (absorbedExtraM418 d (t+2) c))) := by
   rw [reflect_sub,pow_two,pow_two,reflect_mul _ _
     (complete_degreeMA64 j (t+1) _) (complete_degreeMA64 j (t+1) _),
     reflect_mul _ _ (complete_degreeMA64 j t _) (complete_degreeMA64 j (t+2) _)]
   simp only [←absorbed_complete_reflectMA64]
 rw [he,coeff_reflect]
 exact complete_absorbed_nonnegMA64 d j t _ c ht htd hj hc hc8

theorem cut_shift_monomialMA64 (h n : ℕ) (a : ℝ) (hn : h ≤ n) :
 cutPolyMFEE h (C a*X^n)=C a*X^n := cut_monomialM418 h n a hn

theorem absorbed_common_shiftMA64 (d j t h s H : ℕ) (c : ℝ)
 (hH : H+t=j+h) (hht : h ≤ t) :
 X^j*cutPolyMFEE h (absorbedLiftM418 d j c (t+s))=
 X^t*cutPolyMFEE H (X^s*absorbedCompleteMA64 d j c (t+s)) := by
 rw [cut_absorbedM418 d j (t+s) h c (by omega)]
 unfold absorbedCompleteMA64
 rw [mul_add,cut_addM418,mul_add,mul_add]
 rw [lift_cut_common_shiftMAD5 j t h s H hH]
 have hm : X^s*(C (absorbedExtraM418 d (t+s) c)*X^j)=
     C (absorbedExtraM418 d (t+s) c)*X^(s+j) := by rw [pow_add]; ring
 rw [hm,cut_monomialM418 H (s+j) _ (by omega)]
 congr 1
 simp only [pow_add]
 ring

end
end MathGKM.Markov
