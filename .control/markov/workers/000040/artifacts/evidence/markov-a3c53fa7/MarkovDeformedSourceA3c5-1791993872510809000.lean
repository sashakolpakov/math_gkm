import MarkovDeformedJetA3c5
import MarkovPellSource0618
/-! Machine-authored a3c53fa7. Exact moving-coefficient source bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def typeP3 (t : ℤ) : ℕ → BiPoly
 | 0 => 1
 | 1 => (U+V)^2+U
 | n+2 => ((U+V)^2+U+C (C t)*V)*typeP3 t (n+1)-C (C t)*U*V*typeP3 t n

theorem typeP_source3 (n : ℕ) : typeP3 1 (n+1)=rightP650 n := by
 induction n using Nat.twoStepInduction with
 | zero => simp [typeP3,rightP650,frame,initial]
 | one =>
   norm_num [typeP3,rightP650,frame,initial,advance,S,U,V]
   ring
 | more n h0 h1 =>
   rw [typeP3,h0,h1,right_rec650]
   simp only [map_one,one_mul,S]
   ring

def excessShear3 : BiPoly →+* BiPoly :=
 eval₂RingHom (eval₂RingHom (Int.castRingHom BiPoly) (U*V)) U

theorem excessShear_U3 : excessShear3 U=U := by simp [excessShear3,U]
theorem excessShear_V3 : excessShear3 V=U*V := by simp [excessShear3,V]

theorem excessShear_monomial3 (n m : ℕ) (z : ℤ) :
 excessShear3 (monomial n (monomial m z))=monomial (n+m) (monomial m z) := by
 have hm (a b : ℕ) : monomial a (monomial b z)=(z:BiPoly)*V^b*U^a := by
   simp [← C_mul_X_pow_eq_monomial,U,V]
 rw [hm,hm,map_mul,map_mul,map_pow,map_pow,map_intCast,excessShear_U3,excessShear_V3]
 ring

theorem excessShear_coeff3 (p : BiPoly) (i j : ℕ) :
 coeff (excessShear3 p) (i+j) j=coeff p i j := by
 induction p using Polynomial.induction_on' with
 | add p q hp hq => simpa [map_add,coeff,Polynomial.coeff_add] using congrArg₂ (·+·) hp hq
 | monomial n p =>
   induction p using Polynomial.induction_on' with
   | add p q hp hq => simpa [map_add,coeff,Polynomial.coeff_add] using congrArg₂ (·+·) hp hq
   | monomial m z =>
     rw [excessShear_monomial3]
     by_cases hm : m=j
     · subst m
       by_cases hn : n=i <;> simp [coeff,Polynomial.coeff_monomial,hn]
     · by_cases hs : n+m=i+j <;> simp [coeff,Polynomial.coeff_monomial,hm,hs]

theorem typeP_shear3 (t : ℤ) (a : ℕ) :
 excessShear3 (typeP3 t a)=U^a*deformR3 t a := by
 induction a using Nat.twoStepInduction with
 | zero => simp [typeP3,deformR3]
 | one => simp [typeP3,deformR3,map_add,map_pow,excessShear_U3,excessShear_V3]; ring
 | more n h0 h1 =>
   have hc : excessShear3 (C (C t))=C (C t) := by simp [excessShear3]
   rw [typeP3,map_sub,map_mul,map_mul,map_mul,map_mul,map_add,map_add,map_pow,
     map_add,excessShear_U3,excessShear_V3,hc,h0,h1,deformR3]
   simp only [pow_succ]
   ring

theorem typeP_moving_coeff3 (t : ℤ) (a j : ℕ) :
 coeff (typeP3 t a) a j=coeff (deformR3 t a) j j := by
 rw [← excessShear_coeff3,typeP_shear3]
 simp [coeff,U,Polynomial.coeff_X_pow_mul]

theorem typeP_triple3 (t : ℤ) (n : ℕ) :
 coeff (typeP3 t (n+3)) (n+3) 0=1 ∧
 coeff (typeP3 t (n+3)) (n+3) 1=2*(n+3)+(n+2)*t ∧
 2*coeff (typeP3 t (n+3)) (n+3) 2=
   6*(n+3)*(n+2)+8*(n+2)*(n+1)*t+3*(n+1)*n*t^2 := by
 simp only [typeP_moving_coeff3]
 have h := deform_jets3 t n
 refine ⟨?_,?_,?_⟩
 · simp [coeff,deform_zero3]
 · convert h.2.1 using 1 <;> ring
 · convert h.2.2.2.2.2 using 1 <;> ring

theorem typeP_gap3 (t : ℤ) (n : ℕ) :
 2*(coeff (typeP3 t (n+3)) (n+3) 1^2-
   coeff (typeP3 t (n+3)) (n+3) 0*coeff (typeP3 t (n+3)) (n+3) 2)=
 2*(n+3)*(n+6)+16*(n+2)*t+(-((n:ℤ)+3)^2+11*(n+3)-16)*t^2 := by
 obtain ⟨h0,h1,h2⟩ := typeP_triple3 t n
 rw [h0,h1]
 linear_combination -h2

#print axioms typeP_source3
#print axioms typeP_moving_coeff3
#print axioms typeP_gap3
end
end MathGKM.Markov
