import MarkovBooleanJets6905
import MarkovThirdTransfer75
/-! Machine-authored request 6905e489. Exact algebra between three trace
moments and the candidate third-slice coefficients. Trace moment hypotheses
are explicit and are not introduced as axioms. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def momentD6905 {R : Type*} [CommRing R] (y c r : R) : R := c+r*(1+3*y)
def momentK6905 {R : Type*} [CommRing R] (y c r q : R) : R :=
 -c+2*c*y-r-8*r*y+r*y^2+8*q*y^3
def momentL6905 {R : Type*} [CommRing R] (y c r q t u : R) : R :=
 2*c-12*c*y+6*c*y^2+2*r+30*r*y-30*r*y^2+6*r*y^3-
 144*q*y^3-96*q*y^4+24*t*y^4+24*u*y^5
def thirdMomentPoly6905 (c r q t u : ℤ) : ℤ[X] :=
 let D := momentD6905 X (C c) (C r)
 let K := momentK6905 X (C c) (C r) (C q)
 let L := momentL6905 X (C c) (C r) (C q) (C t) (C u)
 D^3+3*D*K+L-3*(1+X)*(D^2+K)+6*(1+X)^2*D-6*(1+X)^3

theorem thirdMomentPoly_expand6905 (c r q t u : ℤ) :
 thirdMomentPoly6905 c r q t u=
 C (thirdSeq75 c r q t u 0)+C (thirdSeq75 c r q t u 1)*X+
 C (thirdSeq75 c r q t u 2)*X^2+C (thirdSeq75 c r q t u 3)*X^3+
 C (thirdSeq75 c r q t u 4)*X^4+C (thirdSeq75 c r q t u 5)*X^5 := by
 simp [thirdMomentPoly6905,momentD6905,momentK6905,momentL6905,thirdSeq75,map_ofNat]
 ring

theorem thirdMomentPoly_coeff6905 (c r q t u : ℤ) (j : ℕ) :
 (thirdMomentPoly6905 c r q t u).coeff j=thirdSeq75 c r q t u j := by
 rw [thirdMomentPoly_expand6905]
 by_cases hj : j<6
 · interval_cases j <;> simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_C] <;> norm_num
 · have h0 : j≠0 := by omega
   have h1 : j≠1 := by omega
   have h2 : j≠2 := by omega
   have h3 : j≠3 := by omega
   have h4 : j≠4 := by omega
   have h5 : j≠5 := by omega
   have hseq : thirdSeq75 c r q t u j=0 := by
     obtain ⟨k,rfl⟩ : ∃ k,j=k+6 := ⟨j-6,by omega⟩
     rfl
   simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_C,h0,h1,h2,h3,h4,h5,hseq,if_false,
     mul_zero,add_zero,eq_comm]

/-- The only hypotheses concern the actual source trace. The conclusion is
the inherited all-index identification proposition, with a uniform factor six. -/
theorem source_third_of_moments6905 (path : List Bool) (c r q t u : ℤ)
 (h1 : (tr16 (ambientWord5c U V (sourceWord28 path))).coeff 1=
   momentD6905 X (C c) (C r))
 (h2 : 2*(tr16 (ambientWord5c U V (sourceWord28 path))).coeff 2=
   (momentD6905 X (C c) (C r))^2+momentK6905 X (C c) (C r) (C q))
 (h3 : 6*(tr16 (ambientWord5c U V (sourceWord28 path))).coeff 3=
   (momentD6905 X (C c) (C r))^3+
   3*momentD6905 X (C c) (C r)*momentK6905 X (C c) (C r) (C q)+
   momentL6905 X (C c) (C r) (C q) (C t) (C u)) :
 ThirdFormula75 path c r q t u := by
 have ht1 := source_first_cut_trace487 path
 have ht2 := source_cut_trace75 path 1
 have ht3 := source_cut_trace75 path 2
 have he : 6*cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 3=
   thirdMomentPoly6905 c r q t u := by
   unfold thirdMomentPoly6905
   linear_combination h3+6*(1+X)*ht2-3*(1+X)*h2-6*ht3-
     6*(1+X)^2*ht1+6*(1+X)^2*h1
 intro j
 have hh := congrArg (fun P : ℤ[X] => P.coeff j) he
 simpa [Polynomial.coeff_ofNat_mul,thirdMomentPoly_coeff6905] using hh

#print axioms thirdMomentPoly_expand6905
#print axioms thirdMomentPoly_coeff6905
#print axioms source_third_of_moments6905
end
end MathGKM.Markov
