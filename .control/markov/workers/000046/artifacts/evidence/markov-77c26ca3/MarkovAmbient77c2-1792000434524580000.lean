import MarkovUltraSummandBe07
import MarkovHorizontalLCB46
/-! Machine-authored 77c26ca3. Ambient-degree horizontal candidate.
The all-source predicate remains unproved. Raw coefficients are unchanged. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def AmbientHorizontal77 : Prop := ∀ (path : List Bool) (i j : ℕ),
 let m := (frame path).mid
 InPolygon m.a m.b i j → InPolygon m.a m.b (i+2) j →
 let s := i+j-m.a
 (s+2 : ℤ)*(m.b-1-s)*coeff m.p i j*coeff m.p (i+2) j ≤
 (s+1 : ℤ)*(m.b-2-s)*coeff m.p (i+1) j^2

theorem ambient_implies_horizontal77 (h : AmbientHorizontal77)
 (path : List Bool) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 let m := (frame path).mid
 let s := i+j-m.a
 have hi := frame_reduced path
 have hdeg := h2.2
 have hlo : m.a ≤ i+j := by
   have hl := h0.1
   change m.a*m.b ≤ m.b*i+m.a*j at hl
   have hab : m.a ≤ m.b := by dsimp [m]; omega
   nlinarith [Nat.mul_le_mul_right j hab]
 have hs : s+2 ≤ m.b-1 := by dsimp [s,m] at *; omega
 have he := h path i j h0 h2
 change (s+2 : ℤ)*(m.b-1-s)*coeff m.p i j*coeff m.p (i+2) j ≤
   (s+1 : ℤ)*(m.b-2-s)*coeff m.p (i+1) j^2 at he
 have hc : (0:ℤ)<(s+1)*(m.b-2-s) := by
   have : (0:ℤ)<m.b-2-s := by omega
   positivity
 have hp : 0 ≤ coeff m.p i j*coeff m.p (i+2) j := by
   exact mul_nonneg (raw_nonneg16 path i j) (raw_nonneg16 path (i+2) j)
 have hd : (s+1 : ℤ)*(m.b-2-s) ≤ (s+2)*(m.b-1-s) := by
   have : (0:ℤ) ≤ m.b := by positivity
   nlinarith
 have hh := mul_le_mul_of_nonneg_right hd hp
 have hfinal : (s+1 : ℤ)*(m.b-2-s)*(coeff m.p i j*coeff m.p (i+2) j) ≤
   (s+1 : ℤ)*(m.b-2-s)*coeff m.p (i+1) j^2 := by nlinarith [hh,he]
 exact (mul_le_mul_iff_right₀ hc).mp hfinal

/-- The elementary normalized first-row shape has LC even when its affine
factor is decreasing. Only endpoint nonnegativity is needed. -/
theorem affine_times_index_lc77 (s A B : ℝ)
 (hs : 0 ≤ s) (hA : 0 ≤ A+B*s) (hC : 0 ≤ A+B*(s+2)) :
 (s*(A+B*s))*((s+2)*(A+B*(s+2))) ≤
 ((s+1)*(A+B*(s+1)))^2 := by
 have hm : 0 ≤ A+B*(s+1) := by linarith
 have hprod := mul_nonneg hA hC
 nlinarith [sq_nonneg B, sq_nonneg (A+B*(s+1)),
   mul_nonneg (sq_nonneg B) (show 0 ≤ s*(s+2) by positivity)]

#print axioms ambient_implies_horizontal77
#print axioms affine_times_index_lc77
end
end MathGKM.Markov
