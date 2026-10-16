import MarkovRegionDegreeM4F4
import MarkovNewtonRemainingM295
/-! Machine-authored 4f4ac079. Finite bounds apply to the precise shifted
integer gaps in the inherited root implication. No inequality is postulated. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem poly_gapM4F4 {f g h : ℚ → ℚ} {n : ℕ}
 (hf : PolyBoundM4F4 f n) (hg : PolyBoundM4F4 g n) (hh : PolyBoundM4F4 h n) :
 PolyBoundM4F4 (fun x => f x^2-g x*h x) (2*n) := by
 apply poly_subM4F4 (poly_squareM4F4 hf)
 simpa [two_mul] using poly_mulM4F4 hg hh

def lowerRatGapM4F4 (i : ℕ) (x y : ℚ) : ℚ :=
 lowerPolynomialM0D3 i (x+1) (y+1)^2-
 lowerPolynomialM0D3 i x (y+2)*lowerPolynomialM0D3 i (x+2) y

def upperRatGapM4F4 (i : ℕ) (x y : ℚ) : ℚ :=
 upperPolynomialM0D3 i (x+(i-2:ℕ)+1) (y+2)^2-
 upperPolynomialM0D3 i (x+(i-2:ℕ)+2) (y+1)*
 upperPolynomialM0D3 i (x+(i-2:ℕ)) (y+3)

def crossOneRatGapM4F4 (i : ℕ) (x _y : ℚ) : ℚ :=
 lowerPolynomialM0D3 i (x+(i-1:ℕ)) 0^2-
 lowerPolynomialM0D3 i (x+(i-2:ℕ)) 1*upperPolynomialM0D3 i (x+(i-2:ℕ)) 1

def crossTwoRatGapM4F4 (i : ℕ) (x _y : ℚ) : ℚ :=
 upperPolynomialM0D3 i (x+(i-1:ℕ)) 1^2-
 lowerPolynomialM0D3 i (x+i) 0*upperPolynomialM0D3 i (x+(i-2:ℕ)) 2

theorem lower_gap_castM4F4 (i x y : ℕ) :
 (lowerGapM295 i x y:ℚ)=lowerRatGapM4F4 i x y := by
 unfold lowerGapM295 lowerRatGapM4F4
 push_cast
 simp only [lower_polynomial_eqM0D3,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]

theorem upper_gap_castM4F4 (i x y : ℕ) (hi : 1 ≤ i) :
 (upperGapM295 i x y:ℚ)=upperRatGapM4F4 i x y := by
 unfold upperGapM295 upperRatGapM4F4
 push_cast
 rw [upper_polynomial_eqM0D3 _ _ _ hi (by omega),
   upper_polynomial_eqM0D3 _ _ _ hi (by omega),
   upper_polynomial_eqM0D3 _ _ _ hi (by omega)]
 push_cast
 rfl

theorem cross_one_gap_castM4F4 (i x y : ℕ) (hi : 1 ≤ i) :
 (crossOneGapM295 i x y:ℚ)=crossOneRatGapM4F4 i x y := by
 unfold crossOneGapM295 crossOneRatGapM4F4
 push_cast
 rw [lower_polynomial_eqM0D3,lower_polynomial_eqM0D3,
   upper_polynomial_eqM0D3 _ _ _ hi (by omega)]
 push_cast
 rfl

theorem cross_two_gap_castM4F4 (i x y : ℕ) (hi : 1 ≤ i) :
 (crossTwoGapM295 i x y:ℚ)=crossTwoRatGapM4F4 i x y := by
 unfold crossTwoGapM295 crossTwoRatGapM4F4
 push_cast
 rw [upper_polynomial_eqM0D3 _ _ _ hi (by omega),lower_polynomial_eqM0D3,
   upper_polynomial_eqM0D3 _ _ _ hi (by omega)]
 push_cast
 rfl

theorem lower_gap_x_degreeM4F4 (i : ℕ) (y : ℚ) :
 PolyBoundM4F4 (fun x => lowerRatGapM4F4 i x y) (4*i) := by
 have h1 := lower_x_affineM4F4 i (y+1) 1 1
 have h0 := lower_x_degreeM4F4 i (y+2)
 have h2 := lower_x_affineM4F4 i y 1 2
 simpa [lowerRatGapM4F4,Nat.mul_assoc] using poly_gapM4F4 h1 h0 h2

theorem lower_gap_y_degreeM4F4 (i : ℕ) (x : ℚ) :
 PolyBoundM4F4 (fun y => lowerRatGapM4F4 i x y) (2*i) := by
 have h1 := lower_y_affineM4F4 i (x+1) 1 1
 have h0 := lower_y_affineM4F4 i x 1 2
 have h2 := lower_y_degreeM4F4 i (x+2)
 simpa [lowerRatGapM4F4] using poly_gapM4F4 h1 h0 h2

theorem upper_gap_x_degreeM4F4 (i : ℕ) (y : ℚ) :
 PolyBoundM4F4 (fun x => upperRatGapM4F4 i x y) (4*i) := by
 have h1 := upper_x_affineM4F4 i (y+2) 1 ((i-2:ℕ)+1)
 have h0 := upper_x_affineM4F4 i (y+1) 1 ((i-2:ℕ)+2)
 have h2 := upper_x_affineM4F4 i (y+3) 1 (i-2:ℕ)
 simpa [upperRatGapM4F4,Nat.mul_assoc,add_assoc] using poly_gapM4F4 h1 h0 h2

theorem upper_gap_y_degreeM4F4 (i : ℕ) (x : ℚ) :
 PolyBoundM4F4 (fun y => upperRatGapM4F4 i x y) (2*i) := by
 have h1 := upper_y_affineM4F4 i (x+(i-2:ℕ)+1) 1 2
 have h0 := upper_y_affineM4F4 i (x+(i-2:ℕ)+2) 1 1
 have h2 := upper_y_affineM4F4 i (x+(i-2:ℕ)) 1 3
 simpa [upperRatGapM4F4] using poly_gapM4F4 h1 h0 h2

theorem cross_one_gap_x_degreeM4F4 (i : ℕ) (y : ℚ) :
 PolyBoundM4F4 (fun x => crossOneRatGapM4F4 i x y) (4*i) := by
 have h1 := lower_x_affineM4F4 i 0 1 (i-1:ℕ)
 have h0 := lower_x_affineM4F4 i 1 1 (i-2:ℕ)
 have h2 := upper_x_affineM4F4 i 1 1 (i-2:ℕ)
 simpa [crossOneRatGapM4F4,Nat.mul_assoc] using poly_gapM4F4 h1 h0 h2

theorem cross_two_gap_x_degreeM4F4 (i : ℕ) (y : ℚ) :
 PolyBoundM4F4 (fun x => crossTwoRatGapM4F4 i x y) (4*i) := by
 have h1 := upper_x_affineM4F4 i 1 1 (i-1:ℕ)
 have h0 := lower_x_affineM4F4 i 0 1 i
 have h2 := upper_x_affineM4F4 i 2 1 (i-2:ℕ)
 simpa [crossTwoRatGapM4F4,Nat.mul_assoc] using poly_gapM4F4 h1 h0 h2

theorem separate_of_rationalM4F4 {f : ℕ → ℕ → ℤ} (F : ℚ → ℚ → ℚ) (m n : ℕ)
 (he : ∀ x y : ℕ, (f x y:ℚ)=F x y)
 (hx : ∀ y, PolyBoundM4F4 (fun x => F x y) m)
 (hy : ∀ x, PolyBoundM4F4 (F x) n) : SeparateBoundM4F4 f m n := by
 exact ⟨fun y => ⟨fun x => F x y,hx y,fun x => he x y⟩,
   fun x => ⟨F x,hy x,fun y => he x y⟩⟩

theorem lower_gap_boundM4F4 (i : ℕ) : SeparateBoundM4F4 (lowerGapM295 i) (4*i) (2*i) :=
 separate_of_rationalM4F4 _ _ _ (lower_gap_castM4F4 i)
   (lower_gap_x_degreeM4F4 i) (lower_gap_y_degreeM4F4 i)

theorem upper_gap_boundM4F4 (i : ℕ) (hi : 1 ≤ i) :
 SeparateBoundM4F4 (upperGapM295 i) (4*i) (2*i) :=
 separate_of_rationalM4F4 _ _ _ (fun x y => upper_gap_castM4F4 i x y hi)
   (upper_gap_x_degreeM4F4 i) (upper_gap_y_degreeM4F4 i)

theorem cross_one_gap_boundM4F4 (i : ℕ) (hi : 1 ≤ i) :
 SeparateBoundM4F4 (crossOneGapM295 i) (4*i) 0 :=
 separate_of_rationalM4F4 _ _ _ (fun x y => cross_one_gap_castM4F4 i x y hi)
   (cross_one_gap_x_degreeM4F4 i) (fun x => poly_constM4F4 _ 0)

theorem cross_two_gap_boundM4F4 (i : ℕ) (hi : 1 ≤ i) :
 SeparateBoundM4F4 (crossTwoGapM295 i) (4*i) 0 :=
 separate_of_rationalM4F4 _ _ _ (fun x y => cross_two_gap_castM4F4 i x y hi)
   (cross_two_gap_x_degreeM4F4 i) (fun x => poly_constM4F4 _ 0)

def FiniteNewtonVerticalM4F4 (i : ℕ) : Prop :=
 (∀ r ≤ 4*i, ∀ s ≤ 2*i, 0 ≤ newtonCoeffM295 (lowerGapM295 i) r s) ∧
 (∀ r ≤ 4*i, ∀ s ≤ 2*i, 0 ≤ newtonCoeffM295 (upperGapM295 i) r s) ∧
 (∀ r ≤ 4*i, 0 ≤ newtonCoeffM295 (crossOneGapM295 i) r 0) ∧
 (∀ r ≤ 4*i, 0 ≤ newtonCoeffM295 (crossTwoGapM295 i) r 0)

theorem finite_newton_vertical_iffM4F4 (i : ℕ) (hi : 1 ≤ i) :
 FiniteNewtonVerticalM4F4 i ↔ NewtonVerticalM295 i := by
 unfold FiniteNewtonVerticalM4F4 NewtonVerticalM295
 rw [newton_finite_iffM4F4 (lower_gap_boundM4F4 i),
   newton_finite_iffM4F4 (upper_gap_boundM4F4 i hi),
   newton_finite_iffM4F4 (cross_one_gap_boundM4F4 i hi),
   newton_finite_iffM4F4 (cross_two_gap_boundM4F4 i hi)]
 simp only [Nat.le_zero_eq,forall_eq]

theorem root_of_finite_newtonM4F4
 (hn : ∀ i : ℕ, 5 ≤ i → i ≠ 8 → FiniteNewtonVerticalM4F4 i)
 (ho : OtherVerticalCoreM0D3) : Conjecture63 := by
 apply root_of_remaining_newtonM295
 · intro i hi h8
   exact (finite_newton_vertical_iffM4F4 i (by omega)).mp (hn i hi h8)
 · exact ho
end
end MathGKM.Markov
