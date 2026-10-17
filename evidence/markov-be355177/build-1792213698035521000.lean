import MarkovSharpMarginMBE3
/-! Machine-authored be355177. Exact source transport from a sharper complete
margin and top-coefficient scalars. Both premises remain unproved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem asymmetric_product_boundMBE3 (A B P Q : ℝ[X]) (a b x y : ℝ)
 (ha : 0 ≤ a) (hy : 0 ≤ y) (hP : ∀ i, 0 ≤ P.coeff i) (hB : ∀ i, 0 ≤ B.coeff i)
 (h0 : ∀ i, a*P.coeff i ≤ x*A.coeff i)
 (h2 : ∀ i, b*Q.coeff i ≤ y*B.coeff i) (n : ℕ) :
 a*b*(P*Q).coeff n ≤ x*y*(A*B).coeff n := by
 rw [coeff_mul,coeff_mul,mul_sum,mul_sum]
 apply sum_le_sum
 intro p hp
 have h := mul_le_mul (h2 p.2) (h0 p.1) (mul_nonneg ha (hP p.1))
   (mul_nonneg hy (hB p.2))
 nlinarith only [h]

def SharpTopScalarsMBE3 : Prop := ∀ d k s : ℕ, ∀ r,
 3 ≤ s → s ≤ bandJMBE3 d k r →
 bandTopMBE3 d k s r*bandTopMBE3 d k (s+2) r ≤ bandBaseMBE3 d k (s+1) r^2

theorem band_robust_cutMBE3 (HM : SharpCompleteMarginMBE3)
 (d k s : ℕ) (r : Bool) (hs : s ≤ bandJMBE3 d k r)
 (HT : bandTopMBE3 d k s r*bandTopMBE3 d k (s+2) r ≤ bandBaseMBE3 d k (s+1) r^2)
 (h n : ℕ) :
 0 ≤ ((cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+1)))^2-
   cutPolyMFEE h (bandKernelM657 d k s r)*cutPolyMFEE h (bandKernelM657 d k (s+2) r)).coeff n := by
 have hp (t i : ℕ) : 0 ≤ (cutPolyMFEE h (bandKernelM657 d k t r)).coeff i := by
   rw [cut_poly_coeffMFEE]; split_ifs; exact band_kernel_nonnegM657 _ _ _ _ _; exact le_rfl
 have hl (t i : ℕ) : 0 ≤ (cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) t)).coeff i := by
   rw [cut_poly_coeffMFEE]; split_ifs; exact lift_nonnegM964 _ _ _; exact le_rfl
 have hb (t i : ℕ) :
   bandBaseMBE3 d k t r*(cutPolyMFEE h (bandKernelM657 d k t r)).coeff i ≤
   bandTopMBE3 d k t r*(cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) t)).coeff i := by
   simp only [cut_poly_coeffMFEE]
   split_ifs; exact band_kernel_scaledMBE3 _ _ _ _ _; simp
 have hpbound := asymmetric_product_boundMBE3 _ _ _ _
   (bandBaseMBE3 d k s r) (bandBaseMBE3 d k (s+2) r)
   (bandTopMBE3 d k s r) (bandTopMBE3 d k (s+2) r)
   (band_base_posMBE3 _ _ _ _).le (band_top_posMBE3 _ _ _ _).le
   (hp s) (hl (s+2)) (hb s) (hb (s+2)) n
 have hprod : 0 ≤ (cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) s)*
     cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+2))).coeff n := by
   rw [coeff_mul]; exact sum_nonneg (fun p _ => mul_nonneg (hl s _) (hl (s+2) _))
 have hscalar := mul_le_mul_of_nonneg_right HT hprod
 have hm := sharp_cut_marginMBE3 HM (bandJMBE3 d k r) s h n hs
 simp only [←cut_lift_identityMFEE,liftCutGapM7E2,coeff_sub] at hm
 simp only [←cut_lift_identityMFEE] at hpbound hscalar
 have he : kernelScaleMA64 (bandJMBE3 d k r) s=bandBaseMBE3 d k (s+1) r^2 := by
   rw [kernelScaleMA64,complete_coeffMA64]; rfl
 have hg : sharpGapMBE3 (bandJMBE3 d k r) s=bandBaseMBE3 d k (s+1) r^2-
     bandBaseMBE3 d k s r*bandBaseMBE3 d k (s+2) r := rfl
 rw [he,hg] at hm
 have hpositive := mul_pos (band_base_posMBE3 d k s r) (band_base_posMBE3 d k (s+2) r)
 rw [coeff_sub]
 simp only [←cut_lift_identityMFEE]
 apply (mul_nonneg_iff_of_pos_left hpositive).mp
 nlinarith only [hpbound,hscalar,hm]

theorem band_cuts_of_sharpMBE3 (HM : SharpCompleteMarginMBE3) (HT : SharpTopScalarsMBE3)
 (d k s : ℕ) (r : Bool) (hs : 3 ≤ s) (hsj : s ≤ bandJMBE3 d k r) (h n : ℕ) :
 0 ≤ ((cutPolyMFEE h (bandKernelM657 d k (s+1) r))^2-
   cutPolyMFEE h (bandKernelM657 d k s r)*cutPolyMFEE h (bandKernelM657 d k (s+2) r)).coeff n := by
 have hl (i : ℕ) : 0 ≤ (cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+1))).coeff i := by
   rw [cut_poly_coeffMFEE]; split_ifs; exact lift_nonnegM964 _ _ _; exact le_rfl
 have hp (i : ℕ) : 0 ≤ (cutPolyMFEE h (bandKernelM657 d k (s+1) r)).coeff i := by
   rw [cut_poly_coeffMFEE]; split_ifs; exact band_kernel_nonnegM657 _ _ _ _ _; exact le_rfl
 have hm (i : ℕ) : (cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+1))).coeff i ≤
     (cutPolyMFEE h (bandKernelM657 d k (s+1) r)).coeff i := by
   rw [cut_poly_coeffMFEE,cut_poly_coeffMFEE]
   split_ifs; exact band_kernel_ge_lowerMBE3 _ _ _ _ _; exact le_rfl
 have hsq := product_coeff_monoM964 _ _ _ _ hl hp hm hm n
 rw [←pow_two,←pow_two] at hsq
 have hc := band_robust_cutMBE3 HM d k s r hsj (HT d k s r hs hsj) h n
 rw [coeff_sub] at hc ⊢
 linarith

theorem band_output_of_sharpMBE3 (HM : SharpCompleteMarginMBE3) (HT : SharpTopScalarsMBE3)
 (d k s : ℕ) (r : Bool) (hs : 3 ≤ s) (hsj : s ≤ bandJMBE3 d k r) :
 bandOutputM657 d k s r*bandOutputM657 d k (s+2) r ≤ bandOutputM657 d k (s+1) r^2 := by
 have hf : CrossLC (zchooseM37B d) := by
   have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext h; exact zchoose_coeffM37B d h
   rw [he]; exact crossLC_binomial d
 have hp (h : ℤ) : 0 ≤ zchooseM37B d h := by unfold zchooseM37B; split_ifs <;> positivity
 have h := weighted_value_lcMFEE _ _ _ (band_cuts_of_sharpMBE3 HM HT d k s r hs hsj)
   (zchooseM37B d) hf hp
 simp only [band_kernel_weightM657] at h
 exact_mod_cast h

theorem band_middle_of_sharpMBE3 (HM : SharpCompleteMarginMBE3) (HT : SharpTopScalarsMBE3) :
 BandMiddleM657 := by
 intro q k r hq hn i hi htop
 by_cases hp : i ≤ 5
 · exact source_band_prefixM657 q k i r hq hn hp
 have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 let s := i-3
 have hs : 3 ≤ s := by dsimp [s]; omega
 have hsj : s ≤ bandJMBE3 (bandExponentM139 q k r) k r := by
   unfold bandJMBE3; dsimp [s]; split_ifs <;> omega
 have h := band_output_of_sharpMBE3 HM HT (bandExponentM139 q k r) k s r hs hsj
 have hval (t : ℕ) := source_band_outputM657 (bandExponentM139 q k r) k t r (by omega)
 rw [he] at hval
 rw [←hval s,←hval (s+1),←hval (s+2)] at h
 have h0 : s+3=i := by dsimp [s]; omega
 simpa only [h0,show s+1+3=i+1 by omega,show s+2+3=i+2 by omega] using h

theorem source_band_all_of_sharpMBE3 (HM : SharpCompleteMarginMBE3) (HT : SharpTopScalarsMBE3)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 band_all_iff_middleM657.mpr (band_middle_of_sharpMBE3 HM HT) q k r hq hn i

end
end MathGKM.Markov
