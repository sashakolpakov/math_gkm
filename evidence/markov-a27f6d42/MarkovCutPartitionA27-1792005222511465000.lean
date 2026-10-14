import MarkovAmbientFormB5
/-! Machine-authored a27f6d42. Exact renewal/cut representation of every
ambient word, with the source coefficient bridge. No LC closure asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cutChargeA27 {R : Type*} [CommRing R] (y p q : R) (r : Bool) : R :=
 if r then y*(p+2*q) else 0
def cutFactorA27 {R : Type*} [CommRing R] (y : R) (r : Bool) : R :=
 if r then 1+y else 1

/-- Skip the first position, or select it and reset the row to (y,1). -/
def cutEvalA27 {R : Type*} [CommRing R] (x y p q : R) : List Bool → R
 | [] => q
 | r::rs => cutEvalA27 x y (cutChargeA27 y p q r) q rs +
     x*cutFactorA27 y r*(p+q)*cutEvalA27 x y y 1 rs

theorem cutEval_matrixA27 {R : Type*} [CommRing R] (x y p q : R)
 (w : List Bool) :
 cutEvalA27 x y p q w = p*(ambientWord5c x y w).b+q*(ambientWord5c x y w).d := by
 induction w generalizing p q with
 | nil => simp [cutEvalA27,ambientWord5c]
 | cons r rs ih =>
   simp only [cutEvalA27,ih,ambientWord5c]
   cases r <;> simp [cutChargeA27,cutFactorA27,ambientT5c,mm16] <;> ring

theorem cutEval_scalarA27 {R : Type*} [CommRing R] (x y : R) (w : List Bool) :
 cutEvalA27 x y y 1 (w++[true]) = ambientScalar5c x y w := by
 rw [cutEval_matrixA27,ambient_word_appendB5]
 simp [ambientWord5c,ambientT5c,mm16,ambientScalar5c]
 ring

/-- Exactly s selected cut positions; the gap contributions stay unnormalized. -/
def cutCoeffA27 {R : Type*} [CommRing R] (y p q : R) : List Bool → ℕ → R
 | [], 0 => q
 | [], _+1 => 0
 | r::rs, 0 => cutCoeffA27 y (cutChargeA27 y p q r) q rs 0
 | r::rs, s+1 => cutCoeffA27 y (cutChargeA27 y p q r) q rs (s+1) +
     cutFactorA27 y r*(p+q)*cutCoeffA27 y y 1 rs s

theorem cutCoeff_zeroA27 {R : Type*} [CommRing R] (y p q : R)
 (w : List Bool) : cutCoeffA27 y p q w 0=q := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih => exact ih _ _

theorem cutCoeff_boundA27 {R : Type*} [CommRing R] (y p q : R)
 (w : List Bool) (s : ℕ) (hs : w.length<s) : cutCoeffA27 y p q w s=0 := by
 induction w generalizing p q s with
 | nil => cases s <;> simp_all [cutCoeffA27]
 | cons r rs ih =>
   cases s with
   | zero => simp at hs
   | succ s =>
     simp only [cutCoeffA27]
     rw [ih _ _ (s+1) (by simp at hs; omega),ih _ _ s (by simp at hs; omega)]
     ring

theorem cutCoeff_polynomialA27 {R : Type*} [CommRing R] (y p q : R)
 (w : List Bool) (s : ℕ) :
 (cutEvalA27 (X : R[X]) (C y) (C p) (C q) w).coeff s =
 cutCoeffA27 y p q w s := by
 induction w generalizing p q s with
 | nil => cases s <;> simp [cutEvalA27,cutCoeffA27]
 | cons r rs ih =>
   have hc : cutChargeA27 (C y) (C p) (C q) r=C (cutChargeA27 y p q r) := by
     cases r <;> simp [cutChargeA27,map_mul,map_add]
   have hf : cutFactorA27 (C y) r=C (cutFactorA27 y r) := by
     cases r <;> simp [cutFactorA27]
   have he : X*cutFactorA27 (C y) r*(C p+C q)*
       cutEvalA27 (X : R[X]) (C y) (C y) 1 rs =
       X*(C (cutFactorA27 y r*(p+q))*cutEvalA27 X (C y) (C y) (C 1) rs) := by
     rw [hf]; simp only [map_mul,map_add,map_one]; ring
   cases s with
   | zero => simp [cutEvalA27,hc,he,ih,cutCoeffA27]
   | succ s =>
     simp only [cutEvalA27,hc,he,Polynomial.coeff_add,Polynomial.coeff_X_mul,
       Polynomial.coeff_C_mul,ih,cutCoeffA27]

theorem ambient_cut_coeffA27 (w : List Bool) (s j : ℕ) :
 coeff (ambientScalar5c U V w) s j =
   (cutCoeffA27 (X : ℤ[X]) X 1 (w++[true]) s).coeff j := by
 rw [← cutEval_scalarA27]
 have h := cutCoeff_polynomialA27 (X : ℤ[X]) X 1 (w++[true]) s
 simpa [coeff,U,V] using congrArg (fun p : ℤ[X] => p.coeff j) h

theorem source_cut_coeffA27 (path : List Bool) (i j s : ℕ)
 (hs : i+j=(frame path).mid.a+s) :
 coeff (frame path).mid.p i j =
   (cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) s).coeff j := by
 rw [source_ambient_coeff5c path i j s hs,ambient_cut_coeffA27]

theorem cutCoeff_nonnegA27 (y p q : ℝ) (hy : 0≤y) (hp : 0≤p) (hq : 0≤q)
 (w : List Bool) (s : ℕ) : 0≤cutCoeffA27 y p q w s := by
 induction w generalizing p q s with
 | nil => cases s <;> simp [cutCoeffA27,hq]
 | cons r rs ih =>
   have hc : 0≤cutChargeA27 y p q r := by cases r <;> simp [cutChargeA27]; positivity
   have hf : 0≤cutFactorA27 y r := by cases r <;> simp [cutFactorA27]; positivity
   cases s with
   | zero => exact ih _ _ hc hq 0
   | succ s =>
     exact add_nonneg (ih _ _ hc hq (s+1))
       (mul_nonneg (mul_nonneg hf (add_nonneg hp hq)) (ih _ _ hy (by norm_num) s))

#print axioms cutCoeff_polynomialA27
#print axioms source_cut_coeffA27
#print axioms cutCoeff_boundA27
#print axioms cutCoeff_nonnegA27
end
end MathGKM.Markov
