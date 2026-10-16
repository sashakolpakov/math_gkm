import MarkovNewtonFiniteM4F4
import MarkovVerticalPolyM0D3
/-! Machine-authored 4f4ac079. Uniform separate degree bounds for the exact
raw coefficient polynomials, including their natural zero values. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem poly_leftM4F4 {f : ℚ → ℚ} {n : ℕ} (hf : PolyBoundM4F4 f n) (a : ℚ) :
 PolyBoundM4F4 (fun x => a*f x) n := by
 simpa using poly_mulM4F4 (poly_constM4F4 a 0) hf

theorem poly_rightM4F4 {f : ℚ → ℚ} {n : ℕ} (hf : PolyBoundM4F4 f n) (a : ℚ) :
 PolyBoundM4F4 (fun x => f x*a) n := by
 simpa using poly_mulM4F4 hf (poly_constM4F4 a 0)

theorem poly_squareM4F4 {f : ℚ → ℚ} {n : ℕ} (hf : PolyBoundM4F4 f n) :
 PolyBoundM4F4 (fun x => f x^2) (2*n) := by
 simpa [pow_two,two_mul] using poly_mulM4F4 hf hf

theorem poly_choose_affineM4F4 (a b : ℚ) (k n : ℕ) (hk : k≤n) :
 PolyBoundM4F4 (fun x => choosePolyM0D3 (a*x+b) k) n :=
 poly_monoM4F4 (poly_affineM4F4 (poly_chooseM4F4 k) a b) hk

theorem lower_x_degreeM4F4 (i : ℕ) (y : ℚ) :
 PolyBoundM4F4 (fun x => lowerPolynomialM0D3 i x y) (2*i) := by
 unfold lowerPolynomialM0D3
 apply poly_sumM4F4
 intro h hh
 apply poly_leftM4F4
 apply poly_addM4F4
 · simpa [add_assoc] using poly_choose_affineM4F4 1 ((i:ℚ)+1) (2*i-1-h) (2*i) (by omega)
 · simpa using poly_choose_affineM4F4 1 (i:ℚ) (2*i-1-h) (2*i) (by omega)

theorem lower_y_degreeM4F4 (i : ℕ) (x : ℚ) :
 PolyBoundM4F4 (fun y => lowerPolynomialM0D3 i x y) i := by
 unfold lowerPolynomialM0D3
 apply poly_sumM4F4
 intro h hh
 have hh' := mem_range.mp hh
 apply poly_rightM4F4
 apply poly_rightM4F4
 simpa using poly_choose_affineM4F4 2 0 h i (by omega)

theorem upper_x_degreeM4F4 (i : ℕ) (y : ℚ) :
 PolyBoundM4F4 (fun x => upperPolynomialM0D3 i x y) (2*i) := by
 unfold upperPolynomialM0D3
 apply poly_sumM4F4
 intro h hh
 apply poly_leftM4F4
 apply poly_addM4F4
 · simpa [add_assoc] using poly_choose_affineM4F4 1 ((i-h:ℕ)+1) (2*i-1-h) (2*i) (by omega)
 · simpa using poly_choose_affineM4F4 1 (i-h:ℕ) (2*i-1-h) (2*i) (by omega)

theorem upper_y_degreeM4F4 (i : ℕ) (x : ℚ) :
 PolyBoundM4F4 (fun y => upperPolynomialM0D3 i x y) i := by
 unfold upperPolynomialM0D3
 apply poly_sumM4F4
 intro h hh
 have hh' := mem_range.mp hh
 apply poly_rightM4F4
 apply poly_rightM4F4
 simpa [sub_eq_add_neg,add_assoc] using poly_choose_affineM4F4 2 ((h:ℚ)-1) h i (by omega)

theorem lower_x_affineM4F4 (i : ℕ) (y a b : ℚ) :
 PolyBoundM4F4 (fun x => lowerPolynomialM0D3 i (a*x+b) y) (2*i) :=
 poly_affineM4F4 (lower_x_degreeM4F4 i y) a b

theorem lower_y_affineM4F4 (i : ℕ) (x a b : ℚ) :
 PolyBoundM4F4 (fun y => lowerPolynomialM0D3 i x (a*y+b)) i :=
 poly_affineM4F4 (lower_y_degreeM4F4 i x) a b

theorem upper_x_affineM4F4 (i : ℕ) (y a b : ℚ) :
 PolyBoundM4F4 (fun x => upperPolynomialM0D3 i (a*x+b) y) (2*i) :=
 poly_affineM4F4 (upper_x_degreeM4F4 i y) a b

theorem upper_y_affineM4F4 (i : ℕ) (x a b : ℚ) :
 PolyBoundM4F4 (fun y => upperPolynomialM0D3 i x (a*y+b)) i :=
 poly_affineM4F4 (upper_y_degreeM4F4 i x) a b
end
end MathGKM.Markov
