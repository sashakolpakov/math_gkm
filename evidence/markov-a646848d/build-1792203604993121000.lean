import MarkovBinomialMarginMA64
/-! Machine-authored a646848d. A quantitative complete-kernel gap bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def completeLiftMA64 (j t : ℕ) : ℝ[X] := (qPolyM7E2 j t).comp (X+1)
def topGapMA64 (j t : ℕ) : ℝ :=
 ((t+1+j+3).choose j:ℝ)^2-((t+j+3).choose j:ℝ)*((t+2+j+3).choose j:ℝ)

theorem complete_coeffMA64 (j t m : ℕ) :
 (completeLiftMA64 j t).coeff m=(liftTermMAE9 j t m:ℝ) := q_comp_liftM7E2 j t m

theorem complete_nonnegMA64 (j t m : ℕ) : 0 ≤ (completeLiftMA64 j t).coeff m :=
 comp_positiveM7E2 _ (q_coeff_nonnegMA64 j t) m

theorem complete_zero_monoMA64 (j t s : ℕ) (hts : t ≤ s) :
 (completeLiftMA64 j t).coeff 0 ≤ (completeLiftMA64 j s).coeff 0 := by
 simp only [completeLiftMA64,qPolyM7E2,Polynomial.sum_comp,Polynomial.monomial_comp,
   Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_X_add_one_pow,
   Nat.choose_zero_right,Nat.cast_one,mul_one,qCoeffM7E2,qBinM7E2]
 apply sum_le_sum
 intro k hk
 apply mul_le_mul_of_nonneg_left _ (q_weight_nonnegM7E2 _)
 exact_mod_cast Nat.choose_le_choose k (show t+k+3 ≤ s+k+3 by omega)

theorem complete_upperMA64 (j t m : ℕ) :
 (completeLiftMA64 j t).coeff m ≤ (completeLiftMA64 j t).coeff 0*(j.choose m:ℝ) :=
 comp_binomial_upperMA64 _ j m (q_coeff_nonnegMA64 j t) (q_poly_degreeM7E2 j t)

theorem q_gap_topMA64 (j t : ℕ) :
 (qPolyM7E2 j (t+1)^2-qPolyM7E2 j t*qPolyM7E2 j (t+2)).coeff (j+j)=topGapMA64 j t := by
 rw [coeff_sub,pow_two,coeff_mul_add_eq_of_natDegree_le
   (q_poly_degreeM7E2 j (t+1)) (q_poly_degreeM7E2 j (t+1)),
   coeff_mul_add_eq_of_natDegree_le (q_poly_degreeM7E2 j t) (q_poly_degreeM7E2 j (t+2))]
 simp only [q_topMA64,topGapMA64,pow_two]

theorem top_gap_nonnegMA64 (j t : ℕ) : 0 ≤ topGapMA64 j t := by
 rw [←q_gap_topMA64]
 exact q_gap_nonnegM7E2 j t (j+j)

theorem complete_gap_lowerMA64 (j t m : ℕ) :
 topGapMA64 j t*((j+j).choose m:ℝ) ≤
 (completeLiftMA64 j (t+1)^2-completeLiftMA64 j t*completeLiftMA64 j (t+2)).coeff m := by
 have h := comp_binomial_lowerMA64
   (qPolyM7E2 j (t+1)^2-qPolyM7E2 j t*qPolyM7E2 j (t+2)) (j+j) m (q_gap_nonnegM7E2 j t)
 rw [q_gap_topMA64,Polynomial.sub_comp,Polynomial.pow_comp,Polynomial.mul_comp] at h
 exact h

theorem complete_perturb_nonnegMA64 (j t m : ℕ) (a b c u : ℝ)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hu : 0 ≤ u)
 (hau : a ≤ u) (hcu : c ≤ u)
 (hmargin : 2*u*(completeLiftMA64 j (t+2)).coeff 0+u^2 ≤ topGapMA64 j t) :
 0 ≤ ((completeLiftMA64 j (t+1)+C b)^2-
   (completeLiftMA64 j t+C a)*(completeLiftMA64 j (t+2)+C c)).coeff m := by
 let K : ℝ := ((j+j).choose m:ℝ)
 let Z : ℝ := (completeLiftMA64 j (t+2)).coeff 0
 have hK : 0 ≤ K := by dsimp [K]; positivity
 have hZ : 0 ≤ Z := complete_nonnegMA64 j (t+2) 0
 have hchoose : (j.choose m:ℝ) ≤ K := by
   exact_mod_cast Nat.choose_le_choose m (show j ≤ j+j by omega)
 have hA : (completeLiftMA64 j t).coeff m ≤ Z*K := by
   calc
    _ ≤ (completeLiftMA64 j t).coeff 0*(j.choose m:ℝ) := complete_upperMA64 j t m
    _ ≤ Z*(j.choose m:ℝ) := mul_le_mul_of_nonneg_right
      (complete_zero_monoMA64 j t (t+2) (by omega)) (by positivity)
    _ ≤ Z*K := mul_le_mul_of_nonneg_left hchoose hZ
 have hC : (completeLiftMA64 j (t+2)).coeff m ≤ Z*K :=
   (complete_upperMA64 j (t+2) m).trans (mul_le_mul_of_nonneg_left hchoose hZ)
 have haC : a*(completeLiftMA64 j (t+2)).coeff m ≤ u*(Z*K) :=
   mul_le_mul hau hC (complete_nonnegMA64 j (t+2) m) hu
 have hcA : c*(completeLiftMA64 j t).coeff m ≤ u*(Z*K) :=
   mul_le_mul hcu hA (complete_nonnegMA64 j t m) hu
 have hac : a*c ≤ u^2 := by
   simpa only [pow_two] using mul_le_mul hau hcu hc hu
 have hg := complete_gap_lowerMA64 j t m
 have hm := mul_le_mul_of_nonneg_right hmargin hK
 have hp : 0 ≤ 2*b*(completeLiftMA64 j (t+1)).coeff m :=
   mul_nonneg (mul_nonneg (by norm_num) hb) (complete_nonnegMA64 j (t+1) m)
 have he : (completeLiftMA64 j (t+1)+C b)^2-
   (completeLiftMA64 j t+C a)*(completeLiftMA64 j (t+2)+C c)=
   (completeLiftMA64 j (t+1)^2-completeLiftMA64 j t*completeLiftMA64 j (t+2))+
   C (2*b)*completeLiftMA64 j (t+1)-C a*completeLiftMA64 j (t+2)-
   C c*completeLiftMA64 j t+C (b^2-a*c) := by
   simp only [map_sub,map_pow,map_mul,map_ofNat]
   ring
 rw [he]
 simp only [coeff_add,coeff_sub,coeff_C_mul,coeff_C]
 change topGapMA64 j t*K ≤ _ at hg
 change (2*u*Z+u^2)*K ≤ topGapMA64 j t*K at hm
 by_cases hz : m=0
 · subst m
   have hK1 : K=1 := by simp [K]
   rw [hK1] at hm haC hcA
   simp only [ite_true]
   nlinarith [sq_nonneg b]
 · rw [if_neg hz]
   have huK : 0 ≤ u^2*K := mul_nonneg (sq_nonneg u) hK
   nlinarith

end
end MathGKM.Markov
