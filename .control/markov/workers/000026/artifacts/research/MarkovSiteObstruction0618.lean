import MarkovPalindrome28b1
import MarkovReduction18
/-! Machine-authored 061840e8. Positive palindromic site weights need not
preserve source-core LC. This is NOT a counterexample to the pinned source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def siteWord0618 {R : Type*} [CommRing R] (u v : R) : List (Bool × R) → Mat16 R
 | [] => ⟨1,0,0,1⟩
 | (r,t)::w => mm16 (gasT80 u v t r) (siteWord0618 u v w)
def siteScalar0618 {R : Type*} [CommRing R] (u v : R) (w : List (Bool × R)) : R :=
 let m := siteWord0618 u v w
 v*m.a+u*v*m.b+m.c+u*m.d

theorem siteWord_uniform0618 {R : Type*} [CommRing R] (u v t : R) (w : List Bool) :
 siteWord0618 u v (w.map (fun r => (r,t)))=gasWord80 u v t w := by
 induction w with
 | nil => rfl
 | cons r w ih => simp [siteWord0618,gasWord80,ih]

theorem site_source0618 (path : List Bool) :
 siteScalar0618 U V ((gasCore28 path).map (fun r => (r,1)))=(frame path).mid.p := by
 rw [source_gas_exact28]
 simp [siteScalar0618,gasScalar80,siteWord_uniform0618]

def siteBad0618 : BiPoly := siteScalar0618 U V [(false,2),(false,1),(false,2)]

theorem siteBad_coeff0618 :
 coeff siteBad0618 1 0=4 ∧ coeff siteBad0618 1 1=4 ∧ coeff siteBad0618 1 2=5 := by
 have he : siteBad0618 =
   C (X^4)+C (4+4*X+5*X^2+4*X^3)*X+
   C (8+10*X+6*X^2)*X^2+C (5+4*X)*X^3+X^4 := by
   simp only [siteBad0618,siteScalar0618,siteWord0618,gasT80,mm16,U,V, Bool.false_eq_true,if_false,map_add,map_mul,map_pow,map_ofNat,map_one]
   ring
 have hc : siteBad0618.coeff 1=4+4*X+5*X^2+4*X^3 := by
   rw [he]
   simp only [coeff_add,coeff_C_mul_X_pow,coeff_C_mul_X,coeff_C,coeff_X_pow]
   norm_num
 change (siteBad0618.coeff 1).coeff 0=4 ∧ (siteBad0618.coeff 1).coeff 1=4 ∧
   (siteBad0618.coeff 1).coeff 2=5
 rw [hc]
 norm_num [coeff_add,coeff_ofNat_mul,coeff_X_pow,coeff_X]

theorem siteBad_failure0618 : ¬GlobalLC18 siteBad0618 := by
 intro h
 have hh := h.2.1 1 0
 obtain ⟨h0,h1,h2⟩ := siteBad_coeff0618
 norm_num [h0,h1,h2] at hh

theorem siteBad_core_source0618 : gasCore28 [false,false]=[false,false,false] := rfl

#print axioms site_source0618
#print axioms siteBad_coeff0618
#print axioms siteBad_failure0618
end
end MathGKM.Markov
