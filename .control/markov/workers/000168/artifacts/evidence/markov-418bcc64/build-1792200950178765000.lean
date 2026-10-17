import MarkovAugmentedObstructionM7A3
import MarkovAbsorbedKernelM418
/-! Machine-authored 418bcc64. Even the actual binomial-weighted augmented
polynomials need not have coefficientwise nonnegative gaps. Their values at 1
are the source coefficients and are log-concave in this exact witness. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem augmented_seven_valuesM418 :
 augmentedLiftM7A3 7 8 0=C 8 ∧
 augmentedLiftM7A3 7 8 1=C 1968+C 8*X ∧
 augmentedLiftM7A3 7 8 2=C 18150+C 4026*X+C 8*X^2 := by
 norm_num [augmentedLiftM7A3,liftPolyM7E2,Finset.sum_range_succ,liftTermMAE9,
   Nat.choose,←Polynomial.C_mul_X_pow_eq_monomial,map_ofNat]

theorem weighted_augmented_valuesM418 :
 weightPolyMFEE (fun k => zchooseM37B 4 k) (augmentedLiftM7A3 7 8 0)=C 8 ∧
 weightPolyMFEE (fun k => zchooseM37B 4 k) (augmentedLiftM7A3 7 8 1)=C 1968+C 32*X ∧
 weightPolyMFEE (fun k => zchooseM37B 4 k) (augmentedLiftM7A3 7 8 2)=C 18150+C 16104*X+C 48*X^2 := by
 rcases augmented_seven_valuesM418 with ⟨h0,h1,h2⟩
 rw [h0,h1,h2]
 have hw (a : ℝ) : weightPolyMFEE (fun k => zchooseM37B 4 k) (C a)=C a := by
   have h := weight_monomialM418 (fun k => zchooseM37B 4 k) a 0
   simpa [zchooseM37B] using h
 simp only [weight_addM418,hw]
 have h1' := weight_monomialM418 (fun k => zchooseM37B 4 k) 8 1
 have h2' := weight_monomialM418 (fun k => zchooseM37B 4 k) 4026 1
 have h3' := weight_monomialM418 (fun k => zchooseM37B 4 k) 8 2
 norm_num [zchooseM37B] at h1' h2' h3' ⊢
 rw [h1',h2',h3']
 norm_num [show Int.toNat (2:ℤ)=2 by rfl,show Nat.choose 4 2=6 by rfl,map_ofNat]

theorem weighted_augmented_negativeM418 :
 ((weightPolyMFEE (fun k => zchooseM37B 4 k) (augmentedLiftM7A3 7 8 1))^2-
   weightPolyMFEE (fun k => zchooseM37B 4 k) (augmentedLiftM7A3 7 8 0)*
   weightPolyMFEE (fun k => zchooseM37B 4 k) (augmentedLiftM7A3 7 8 2)).coeff 1= -2880 := by
 rcases weighted_augmented_valuesM418 with ⟨h0,h1,h2⟩
 rw [h0,h1,h2]
 have he : (C (1968:ℝ)+C 32*X)^2-C 8*(C 18150+C 16104*X+C 48*X^2)=
   C 3727824-C 2880*X+C 640*X^2 := by simp only [map_ofNat]; ring
 rw [he]
 norm_num [coeff_add,coeff_sub,coeff_C_mul]

theorem weighted_source_valuesM418 :
 threeRawM9E2 6 true 2 7=8 ∧ threeRawM9E2 6 true 3 7=2000 ∧
 threeRawM9E2 6 true 4 7=34302 := by
 have h0 := source_correction_outputM7A3 6 0 true (by omega)
 have h1 := source_correction_outputM7A3 6 1 true (by omega)
 have h2 := source_correction_outputM7A3 6 2 true (by omega)
 norm_num only at h0 h1 h2
 rw [h0,h1,h2]
 unfold correctionExponentMDB2 correctionConstantMDB2 augmentedOutputM7A3 liftOutputMAE9 liftTermMAE9
 decide +kernel

theorem weighted_source_witnessM418 :
 (frame (threePathM9E2 5 true)).mid.a=3 ∧ (frame (threePathM9E2 5 true)).mid.b=19 ∧
 InPolygon 3 19 2 7 ∧ InPolygon 3 19 3 7 ∧ InPolygon 3 19 4 7 ∧
 coeff (frame (threePathM9E2 5 true)).mid.p 2 7=8 ∧
 coeff (frame (threePathM9E2 5 true)).mid.p 3 7=2000 ∧
 coeff (frame (threePathM9E2 5 true)).mid.p 4 7=34302 ∧
 coeff (frame (threePathM9E2 5 true)).mid.p 3 7^2-
   coeff (frame (threePathM9E2 5 true)).mid.p 2 7*
   coeff (frame (threePathM9E2 5 true)).mid.p 4 7=3725584 := by
 rw [three_path_polynomialM9E2]
 simp only [three_raw_formulaM9E2]
 rcases weighted_source_valuesM418 with ⟨h0,h1,h2⟩
 norm_num only at *
 rw [h0,h1,h2]
 have hl := three_path_labelsM9E2 5 true
 norm_num at hl
 norm_num [hl.1,hl.2,InPolygon]

end
end MathGKM.Markov
