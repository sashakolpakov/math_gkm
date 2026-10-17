import MarkovUpperConvolutionM9F23
/-! Machine-authored 9f234835. Complete upper vertical direction and all
upper diagonal starting columns at least four, with exact source transport. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem lower_model_antidiagonalM9F23 (t j k : ℕ) :
 lowerDiagMF88 t j (k+2)*lowerDiagMF88 t (j+2) k ≤
 lowerDiagMF88 t (j+1) (k+1)^2 := by
 apply real_minor_glueM9F23
   (lowerDiagMF88 t j (k+2)) (lowerDiagMF88 t (j+1) (k+2))
   (lowerDiagMF88 t (j+2) (k+2)) (lowerDiagMF88 t (j+1) (k+1))
   (lowerDiagMF88 t (j+2) (k+1)) (lowerDiagMF88 t (j+2) k)
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact lower_diag_positiveM9F23 _ _ _
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact lower_diag_rowMF88 t j (k+2)
 · exact lower_diag_columnMF88 t (j+2) k
 · simpa [Nat.add_assoc,mul_comm] using lower_diag_minorMF88 t (j+1) (k+1)

theorem source_upper_verticalM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : sourceNME9C q r ≤ j+q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤
 threeRawM9E2 q r i (j+1)^2 := by
 by_cases hi : i ≤ 3
 · exact source_first_four_verticalMF88 q i j r hq hi
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_model_antidiagonalM9F23 (i-3) j (sourceNME9C q r-i-j)
   have h0 := source_upper_diagonal_modelM9F23 q i j r hq (by omega) hj (by omega)
   have h1 := source_upper_diagonal_modelM9F23 q i (j+1) r hq (by omega) (by omega) (by omega)
   have h2 := source_upper_diagonal_modelM9F23 q i (j+2) r hq (by omega) (by omega) (by omega)
   rw [show sourceNME9C q r+2-i-j=sourceNME9C q r-i-j+2 by omega] at h0
   rw [show sourceNME9C q r+2-i-(j+1)=sourceNME9C q r-i-j+1 by omega] at h1
   rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega] at h2
   rw [←h0,←h1,←h2] at h
   exact_mod_cast h
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),mul_zero]
   exact sq_nonneg _

theorem source_upper_diagonalM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 4 ≤ i) (hj : sourceNME9C q r ≤ j+q) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_parameter_diagonalM9F23 (i-3) j (sourceNME9C q r-i-j) (by omega)
   have h0 := source_upper_diagonal_modelM9F23 q i (j+2) r hq (by omega) (by omega) (by omega)
   have h1 := source_upper_diagonal_modelM9F23 q (i+1) (j+1) r hq (by omega) (by omega) (by omega)
   have h2 := source_upper_diagonal_modelM9F23 q (i+2) j r hq (by omega) hj (by omega)
   rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega] at h0
   rw [show sourceNME9C q r+2-(i+1)-(j+1)=sourceNME9C q r-i-j by omega,
     show i+1-3=i-3+1 by omega] at h1
   rw [show sourceNME9C q r+2-(i+2)-j=sourceNME9C q r-i-j by omega,
     show i+2-3=i-3+2 by omega] at h2
   rw [←h0,←h1,←h2] at h
   exact_mod_cast h
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),zero_mul]
   exact sq_nonneg _

theorem path_upper_verticalM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 2*(frame path).mid.b+2 ≤ 3*j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : sourceNME9C q r ≤ j+q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 simp only [hp]
 exact source_upper_verticalM9F23 q i j r hq hjq

theorem path_upper_diagonalM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 4 ≤ i) (hj : 2*(frame path).mid.b+2 ≤ 3*j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : sourceNME9C q r ≤ j+q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 simp only [hp]
 exact source_upper_diagonalM9F23 q i j r hq hi hjq

def ThreeMiddleTransverseM9F23 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, q < j+2 → (j+q < sourceNME9C q r ∨ i ≤ 3) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem middle_transverse_iffM9F23 : ThreeUpperTransverseM9F23 ↔ ThreeMiddleTransverseM9F23 := by
 constructor
 · intro h q hq r
   exact ⟨fun i j hi hj _ he => (h q hq r).1 i j hi hj he,
     fun i j hj _ => (h q hq r).2 i j hj⟩
 · intro h q hq r
   refine ⟨?_,?_⟩
   · intro i j hi hj he
     by_cases ht : sourceNME9C q r ≤ j+q
     · exact source_upper_verticalM9F23 q i j r hq ht
     · exact (h q hq r).1 i j hi hj (by omega) he
   · intro i j hj
     by_cases ht : sourceNME9C q r ≤ j+q ∧ 4 ≤ i
     · exact source_upper_diagonalM9F23 q i j r hq ht.2 ht.1
     · exact (h q hq r).2 i j hj (by omega)

theorem root_iff_middle_transverseM9F23 :
 Conjecture63 ↔ ThreeMiddleTransverseM9F23 ∧ OtherFourM9E2 := by
 rw [root_iff_upper_transverseM9F23,middle_transverse_iffM9F23]

end
end MathGKM.Markov
