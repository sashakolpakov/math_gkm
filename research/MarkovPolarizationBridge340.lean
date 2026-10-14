import MarkovPolarization340
/-! Machine-authored 34071a88. Exact site-refinement and source specialization.
The auxiliary obstruction does not reverse the raw source inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def siteEval340 {R : Type*} [CommRing R] (y p q : R) : List (Bool × R) → R
 | [] => q
 | (r,x)::rs => siteEval340 y (cutChargeA27 y p q r) q rs+
     x*cutFactorA27 y r*(p+q)*siteEval340 y y 1 rs

theorem siteEval_uniform340 {R : Type*} [CommRing R] (x y p q : R) (w : List Bool) :
 siteEval340 y p q (w.map (fun r => (r,x)))=cutEvalA27 x y p q w := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih => simp only [List.map_cons,siteEval340,cutEvalA27,ih]

theorem siteEval_source340 (path : List Bool) :
 horizontalShear5c (frame path).mid.p=U^(frame path).mid.a*
 siteEval340 V V 1 ((central28 path++[true]).map (fun r => (r,U))) := by
 rw [siteEval_uniform340,cutEval_scalarA27,source_ambient_identity5c]

def polarHom340 {R : Type*} [CommRing R] (z a b c d : R) : R :=
 (a+d)*z^3+(2*a*b+a*c+b*c+2*a*d+b*d+2*c*d)*z^2+
 3*(a*b*c+a*b*d+a*c*d+b*c*d)*z+5*a*b*c*d

theorem site_first_coeff340 (a b c d : ℝ) :
 (siteEval340 (X:ℝ[X]) X 1
   [(false,C a),(false,C b),(false,C c),(true,C d)]).coeff 1=polarHom340 1 a b c d := by
 simp only [siteEval340,cutFactorA27,cutChargeA27,Bool.false_eq_true,if_false,if_true]
 norm_num [Polynomial.coeff_add,Polynomial.mul_coeff_zero,Polynomial.mul_coeff_one,
   Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_one]
 unfold polarHom340
 ring

theorem polar_mixed_identity340 (z u v x y : ℝ) :
 polarHom340 (z+v) u x y 0 = x*y*(z+v)^2+
 u*(z^3+(2*x+y)*z^2+3*x*y*z+v*polarQuad340 z x y+
 v^2*(3*z+2*x+y)+v^3) := by
 unfold polarHom340 polarQuad340
 ring

#print axioms siteEval_source340
#print axioms site_first_coeff340
#print axioms polar_mixed_identity340
end
end MathGKM.Markov
