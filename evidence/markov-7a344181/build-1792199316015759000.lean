import MarkovLiftPolynomialM7E2
import MarkovCorrectionObstructionMC9F
/-! Machine-authored 7a344181. Failure of an augmented coefficientwise
kernel criterion, with the corresponding actual source triple retained.
This is not a refutation of Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def augmentedLiftM7A3 (j : ℕ) (c : ℝ) : ℕ → Polynomial ℝ
 | 0 => C c
 | t+1 => liftPolyM7E2 j t + C c*X^(t+1)

theorem augmented_kernel_valuesM7A3 :
 augmentedLiftM7A3 3 4 1=C 104+C 4*X ∧
 augmentedLiftM7A3 3 4 2=C 265+C 147*X+C 4*X^2 ∧
 augmentedLiftM7A3 3 4 3=C 252+C 384*X+C 200*X^2+C 4*X^3 := by
 norm_num [augmentedLiftM7A3,liftPolyM7E2,Finset.sum_range_succ,liftTermMAE9,
   Nat.choose, ← Polynomial.C_mul_X_pow_eq_monomial, map_ofNat]
 constructor <;> ring

theorem augmented_kernel_negativeM7A3 :
 ((augmentedLiftM7A3 3 4 2)^2-
   augmentedLiftM7A3 3 4 1*augmentedLiftM7A3 3 4 3).coeff 3 = -40 := by
 rcases augmented_kernel_valuesM7A3 with ⟨h1,h2,h3⟩
 rw [h1,h2,h3]
 have he : (C (265:ℝ)+C 147*X+C 4*X^2)^2-
   (C 104+C 4*X)*(C 252+C 384*X+C 200*X^2+C 4*X^3) =
   C 44017+C 36966*X+C 1393*X^2-C 40*X^3 := by simp only [map_ofNat]; ring
 rw [he]
 norm_num [Polynomial.coeff_sub,Polynomial.coeff_add,Polynomial.coeff_C_mul]

theorem augmented_kernel_shape_falseM7A3 :
 ¬(∀ j t k : ℕ, 3 ≤ j →
   0 ≤ ((augmentedLiftM7A3 j 4 (t+1))^2-
     augmentedLiftM7A3 j 4 t*augmentedLiftM7A3 j 4 (t+2)).coeff k) := by
 intro h
 have hh := h 3 1 3 (by omega)
 rw [augmented_kernel_negativeM7A3] at hh
 norm_num at hh

theorem correction_middle_valuesM7A3 :
 threeRawM9E2 2 false 3 3=108 ∧ threeRawM9E2 2 false 4 3=412 ∧
 threeRawM9E2 2 false 5 3=636 := by
 unfold threeRawM9E2
 decide +kernel

theorem correction_middle_sourceM7A3 :
 (frame [false,true,false]).mid.a=3 ∧ (frame [false,true,false]).mid.b=8 ∧
 InPolygon 3 8 3 3 ∧ InPolygon 3 8 4 3 ∧ InPolygon 3 8 5 3 ∧
 coeff (frame [false,true,false]).mid.p 3 3=108 ∧
 coeff (frame [false,true,false]).mid.p 4 3=412 ∧
 coeff (frame [false,true,false]).mid.p 5 3=636 ∧
 coeff (frame [false,true,false]).mid.p 4 3^2-
   coeff (frame [false,true,false]).mid.p 3 3*
   coeff (frame [false,true,false]).mid.p 5 3=101056 := by
 have hp : (frame [false,true,false]).mid.p=threePolyM9E2 2 false :=
   three_path_polynomialM9E2 1 false
 rw [hp]
 simp only [three_raw_formulaM9E2]
 rcases correction_middle_valuesM7A3 with ⟨v3,v4,v5⟩
 rw [v3,v4,v5]
 norm_num [frame,initial,advance,InPolygon]

end
end MathGKM.Markov
