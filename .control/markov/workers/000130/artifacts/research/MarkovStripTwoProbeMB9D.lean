import MarkovBottomCoefficientsMAA6
import MarkovHorizontalThirdSourceM13D
/-! Machine-authored b9d0d341. Exact source formulas in the low-slope cone. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

def stripQuadMB9D {R : Type*} [CommRing R] (a b : R) : R[X] :=
 C (9*a^2-5*a+2)+C (6*a^2+6*a*b-16*a+4)*X+C ((a+b-1)*(a+b-2))*X^2
def stripCubicMB9D {R : Type*} [CommRing R] (a b : R) : R[X] :=
 C (h3c2M13D a b 0)+C (h3c3M13D a b)*X+C (h3c4M13D a b)*X^2+C (h3c5M13D a b)*X^3

theorem source_strip_twoMB9D (path : List Bool) (hb : 5 ≤ (frame path).mid.b)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) :
 2*(Bivariate.swap (frame path).mid.p).coeff 2=
 X^(frame path).mid.a*(1+X)^((frame path).mid.b-5)*
 stripQuadMB9D ((frame path).mid.a:ℤ) (frame path).mid.b := by
 obtain ⟨n,m,s,hn,hm,hn3,hstat,he⟩ := source_second_exactMAA6 path hb
 have hz : s=0 := by omega
 have hf : secondExpr8934 (X:ℤ[X]) n m s=
   X*stripQuadMB9D ((frame path).mid.a:ℤ) (frame path).mid.b := by
   have hmR : (m:ℤ)+1=(frame path).mid.a := by exact_mod_cast hm
   have hnR : (n:ℤ)+2=(frame path).mid.b := by exact_mod_cast hn
   rw [hz,←hmR,←hnR]
   simp only [secondExpr8934,stripQuadMB9D,map_add,map_mul,map_pow,map_natCast,map_ofNat,map_one,map_sub]
   ring
 rw [he,hf,show n-3=(frame path).mid.b-5 by omega]
 rw [←hm,pow_succ]
 ring


end
end MathGKM.Markov
