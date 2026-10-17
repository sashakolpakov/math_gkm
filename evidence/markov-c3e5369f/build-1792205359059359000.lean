import MarkovCorrectionClosedMA64
/-! Machine-authored c3e5369f. Arbitrary last-coefficient perturbations.
These auxiliary polynomials have an explicit source-weight transport below. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def perturbLiftMC3E (j t : ℕ) (a : ℝ) : ℝ[X] := liftPolyM7E2 j t+C a*X^t
def perturbCompleteMC3E (j t : ℕ) (a : ℝ) : ℝ[X] := ePolyM7E2 j t+C a*X^j
def perturbGapMC3E (j t h : ℕ) (a b c : ℝ) : ℝ[X] :=
 (cutPolyMFEE h (perturbLiftMC3E j (t+1) b))^2-
 cutPolyMFEE h (perturbLiftMC3E j t a)*cutPolyMFEE h (perturbLiftMC3E j (t+2) c)

theorem perturb_nonnegMC3E (j t k : ℕ) (a : ℝ) (ha : 0 ≤ a) :
 0 ≤ (perturbLiftMC3E j t a).coeff k := by
 rw [perturbLiftMC3E,coeff_add,lift_poly_coeffM7E2,coeff_C_mul,coeff_X_pow]
 have hl : 0 ≤ (reverseLiftMAE9 j t k:ℝ) := by
   unfold reverseLiftMAE9 liftTermMAE9
   split_ifs <;> positivity
 split_ifs <;> linarith

theorem perturb_tailMC3E (j t k : ℕ) (a : ℝ) (hk : t<k) :
 (perturbLiftMC3E j t a).coeff k=0 := by
 simp [perturbLiftMC3E,coeff_add,lift_poly_coeffM7E2,reverseLiftMAE9,
   show ¬k ≤ t by omega,coeff_C_mul,coeff_X_pow,show k≠t by omega]

theorem cut_perturbMC3E (j t h : ℕ) (a : ℝ) (hh : h ≤ t) :
 cutPolyMFEE h (perturbLiftMC3E j t a)=liftCutM7E2 j t h+C a*X^t := by
 rw [perturbLiftMC3E,cut_addM418,cut_lift_identityMFEE,cut_monomialM418 h t a hh]

theorem perturb_complete_reflectMC3E (j t : ℕ) (a : ℝ) :
 perturbCompleteMC3E j t a=reflect j (completeLiftMA64 j t+C a) := by
 rw [reflect_add,reflect_C]
 rfl

theorem perturb_complete_nonnegMC3E (j t k : ℕ) (a : ℝ) (ha : 0 ≤ a) :
 0 ≤ (perturbCompleteMC3E j t a).coeff k := by
 rw [perturb_complete_reflectMC3E,coeff_reflect,coeff_add,coeff_C]
 have h := complete_nonnegMA64 j t (revAt j k)
 split_ifs <;> linarith

theorem perturb_complete_tailMC3E (j t k : ℕ) (a : ℝ) (hk : j<k) :
 (perturbCompleteMC3E j t a).coeff k=0 := by
 simp [perturbCompleteMC3E,coeff_add,e_poly_tailM7E2 j t k hk,
   coeff_C_mul,coeff_X_pow,show k≠j by omega]

theorem perturb_complete_gapMC3E (j t k : ℕ) (a b c u : ℝ)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hu : 0 ≤ u) (hau : a ≤ u) (hcu : c ≤ u)
 (hm : 2*u*(completeLiftMA64 j (t+2)).coeff 0+u^2 ≤ topGapMA64 j t) :
 0 ≤ (perturbCompleteMC3E j (t+1) b^2-
   perturbCompleteMC3E j t a*perturbCompleteMC3E j (t+2) c).coeff k := by
 have he : perturbCompleteMC3E j (t+1) b^2-
     perturbCompleteMC3E j t a*perturbCompleteMC3E j (t+2) c=
   reflect (j+j) ((completeLiftMA64 j (t+1)+C b)^2-
     (completeLiftMA64 j t+C a)*(completeLiftMA64 j (t+2)+C c)) := by
   rw [reflect_sub,pow_two,pow_two,reflect_mul _ _
     (complete_degreeMA64 j (t+1) _) (complete_degreeMA64 j (t+1) _),
     reflect_mul _ _ (complete_degreeMA64 j t _) (complete_degreeMA64 j (t+2) _)]
   simp only [←perturb_complete_reflectMC3E]
 rw [he,coeff_reflect]
 exact complete_perturb_nonnegMA64 j t _ a b c u ha hb hc hu hau hcu hm

theorem perturb_common_shiftMC3E (j t h s H : ℕ) (a : ℝ)
 (hH : H+t=j+h) (hht : h ≤ t) :
 X^j*cutPolyMFEE h (perturbLiftMC3E j (t+s) a)=
 X^t*cutPolyMFEE H (X^s*perturbCompleteMC3E j (t+s) a) := by
 rw [cut_perturbMC3E j (t+s) h a (by omega)]
 unfold perturbCompleteMC3E
 simp only [mul_add,cut_addM418]
 rw [lift_cut_common_shiftMAD5 j t h s H hH]
 have hm : X^s*(C a*X^j)=C a*X^(s+j) := by rw [pow_add]; ring
 rw [hm,cut_monomialM418 H (s+j) _ (by omega)]
 congr 1
 simp only [pow_add]
 ring

theorem perturb_gap_expandMC3E (j t h : ℕ) (a b c : ℝ) (hh : h ≤ t) :
 perturbGapMC3E j t h a b c=liftCutGapM7E2 j t h+
 C (2*b)*X^(t+1)*liftCutM7E2 j (t+1) h-
 C a*X^t*liftCutM7E2 j (t+2) h-C c*X^(t+2)*liftCutM7E2 j t h+
 C (b^2-a*c)*X^(2*t+2) := by
 unfold perturbGapMC3E
 rw [cut_perturbMC3E j (t+1) h b (by omega),cut_perturbMC3E j t h a hh,
   cut_perturbMC3E j (t+2) h c (by omega)]
 unfold liftCutGapM7E2
 rw [show 2*t+2=t+t+2 by omega]
 simp only [pow_add,pow_one,C_mul,C_sub,C_pow,map_ofNat]
 ring

theorem perturb_gap_lowMC3E (j t h k : ℕ) (a b c : ℝ) (hh : h ≤ t) (hk : k<t+h) :
 (perturbGapMC3E j t h a b c).coeff k=(liftCutGapM7E2 j t h).coeff k := by
 rw [perturb_gap_expandMC3E j t h a b c hh]
 simp only [coeff_add,coeff_sub]
 rw [monomial_lift_cut_lowMF8F j (t+1) h (t+1) k _ (by omega),
   monomial_lift_cut_lowMF8F j (t+2) h t k _ hk,
   monomial_lift_cut_lowMF8F j t h (t+2) k _ (by omega)]
 simp [coeff_C_mul,coeff_X_pow,show k≠2*t+2 by omega]

theorem perturb_gap_borderMC3E (j t h : ℕ) (a b c : ℝ) (hh : h ≤ t) :
 (perturbGapMC3E j t h a b c).coeff (t+h)=
 (liftCutGapM7E2 j t h).coeff (t+h)-a*(liftTermMAE9 j (t+2) (t+2-h):ℝ) := by
 rw [perturb_gap_expandMC3E j t h a b c hh]
 simp only [coeff_add,coeff_sub]
 rw [monomial_lift_cut_lowMF8F j (t+1) h (t+1) (t+h) _ (by omega),
   monomial_lift_cut_lowMF8F j t h (t+2) (t+h) _ (by omega)]
 have ht : (C (b^2-a*c)*X^(2*t+2)).coeff (t+h)=0 := by
   rw [coeff_C_mul,coeff_X_pow]
   simp only [if_neg (show t+h≠2*t+2 by omega),mul_zero]
 rw [ht,add_zero,sub_zero,add_zero]
 congr 1
 rw [mul_assoc,coeff_C_mul,coeff_X_pow_mul',if_pos (by omega),
   show t+h-t=h by omega,lift_cut_coeffM7E2,if_pos (le_refl h),
   lift_poly_coeffM7E2,reverseLiftMAE9,if_pos (by omega)]

end
end MathGKM.Markov
