import MarkovCutPartitionA27
/-! Machine-authored 34071a88. A cut-site polarization obstruction, not a
counterexample to any pinned raw coefficient inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

/-- One specified choice of selected and skipped cut sites. -/
def maskWeight340 {R : Type*} [CommRing R] (y p q : R) : List (Bool × Bool) → R
 | [] => q
 | (r,b)::rs => if b then cutFactorA27 y r*(p+q)*maskWeight340 y y 1 rs
     else maskWeight340 y (cutChargeA27 y p q r) q rs

theorem source_fifth_central340 : central28 [false,false,false]=[false,false,false] := by
 simp [central28,subst28]

theorem cut_site_weights340 {R : Type*} [CommRing R] (y : R) :
 maskWeight340 y y 1 [(false,true),(false,false),(false,false),(true,false)] = 1+y ∧
 maskWeight340 y y 1 [(false,true),(false,true),(false,false),(true,false)] = (1+y)^2 ∧
 maskWeight340 y y 1 [(false,true),(false,false),(false,true),(true,false)] = 1+y ∧
 maskWeight340 y y 1 [(false,true),(false,true),(false,true),(true,false)] = (1+y)^3 := by
 simp [maskWeight340,cutFactorA27,cutChargeA27]
 <;> ring_nf <;> simp

theorem cut_site_coefficients340 :
 (maskWeight340 (X:ℤ[X]) X 1 [(false,true),(false,false),(false,false),(true,false)]).coeff 1=1 ∧
 (maskWeight340 (X:ℤ[X]) X 1 [(false,true),(false,true),(false,false),(true,false)]).coeff 1=2 ∧
 (maskWeight340 (X:ℤ[X]) X 1 [(false,true),(false,false),(false,true),(true,false)]).coeff 1=1 ∧
 (maskWeight340 (X:ℤ[X]) X 1 [(false,true),(false,true),(false,true),(true,false)]).coeff 1=3 := by
 obtain ⟨h0,h1,h2,h3⟩ := cut_site_weights340 (X:ℤ[X])
 rw [h0,h1,h2,h3]
 norm_num [Polynomial.coeff_one_add_X_pow,Polynomial.coeff_one]

/-- Restricted quadratic of the homogeneous cut-site refinement after
one site derivative and one homogenizing-variable derivative. -/
def polarQuad340 (z x y : ℝ) : ℝ := 3*z^2+4*z*x+2*z*y+3*x*y

theorem polarization_curve340 (t : ℝ) :
 polarQuad340 (1-17*t) (1+12*t) (1+24*t)=12+99*t^2 := by
 unfold polarQuad340
 ring

/-- Even this source cut-site refinement fails continuous midpoint LC in
the positive orthant. This is a stronger auxiliary predicate than the root. -/
theorem polarization_positive_failure340 :
 let t : ℝ := 1/100
 0 < 1-17*t ∧ 0 < 1+17*t ∧ 0 < 1-12*t ∧ 0 < 1+12*t ∧
 0 < 1-24*t ∧ 0 < 1+24*t ∧
 polarQuad340 1 1 1^2 <
 polarQuad340 (1-17*t) (1+12*t) (1+24*t)*
 polarQuad340 (1+17*t) (1-12*t) (1-24*t) := by
 norm_num [polarQuad340]

#print axioms cut_site_coefficients340
#print axioms polarization_positive_failure340
end
end MathGKM.Markov
