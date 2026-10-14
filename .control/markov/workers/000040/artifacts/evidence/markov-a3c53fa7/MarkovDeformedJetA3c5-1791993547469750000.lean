import MarkovRightJetsF650
/-! Machine-authored a3c53fa7. Low-excess jets of the type-deformed Pell
recurrence. These are exact polynomial identities, not a full LC theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def deformR3 (t : ℤ) : ℕ → BiPoly
 | 0 => 1
 | 1 => 1+U*(1+V)^2
 | n+2 => (1+C (C t)*V+U*(1+V)^2)*deformR3 t (n+1)-
     C (C t)*V*deformR3 t n

theorem deform_zero3 (t : ℤ) (n : ℕ) : (deformR3 t n).coeff 0=1 := by
 induction n using Nat.twoStepInduction with
 | zero => simp [deformR3]
 | one => simp [deformR3,U]
 | more n h0 h1 => simp [deformR3,U,V,Polynomial.mul_coeff_zero,h0,h1]

theorem deform_rows3 (t : ℤ) (n : ℕ) :
 (deformR3 t (n+2)).coeff 1 =
   (1+C t*X)*(deformR3 t (n+1)).coeff 1+(1+X)^2-
     C t*X*(deformR3 t n).coeff 1 ∧
 (deformR3 t (n+2)).coeff 2 =
   (1+C t*X)*(deformR3 t (n+1)).coeff 2+
     (1+X)^2*(deformR3 t (n+1)).coeff 1-
     C t*X*(deformR3 t n).coeff 2 := by
 have he : 1+C (C t)*V+U*(1+V)^2 =
     C (1+C t*X)+X*C ((1+X)^2) := by simp [U,V]
 rw [deformR3,he]
 simp only [add_mul,Polynomial.coeff_sub,Polynomial.coeff_add,
   mul_assoc,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,Polynomial.coeff_mul_C,
   V,← Polynomial.C_mul, deform_zero3]
 constructor <;> ring

def deformJet3 (t a : ℤ) (p : BiPoly) : Prop :=
 coeff p 1 0=a ∧
 coeff p 1 1=2*a+(a-1)*t ∧
 coeff p 1 2=a+2*(a-1)*t+(a-2)*t^2 ∧
 2*coeff p 2 0=a*(a-1) ∧
 2*coeff p 2 1=4*a*(a-1)+2*(a-1)*(a-2)*t ∧
 2*coeff p 2 2=6*a*(a-1)+8*(a-1)*(a-2)*t+3*(a-2)*(a-3)*t^2

theorem deform_jet_step3 (t a : ℤ) (p q z : BiPoly)
 (hp : deformJet3 t a p) (hq : deformJet3 t (a+1) q)
 (h1 : z.coeff 1=(1+C t*X)*q.coeff 1+(1+X)^2-C t*X*p.coeff 1)
 (h2 : z.coeff 2=(1+C t*X)*q.coeff 2+(1+X)^2*q.coeff 1-C t*X*p.coeff 2) :
 deformJet3 t (a+2) z := by
 rcases hp with ⟨p10,p11,p12,p20,p21,p22⟩
 rcases hq with ⟨q10,q11,q12,q20,q21,q22⟩
 have he : ((1+X)^2 : Polynomial ℤ)=1+2*X+X^2 := by ring
 unfold deformJet3 coeff at *
 rw [h1,h2,he]
 simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_sub,
   one_mul,Polynomial.coeff_C_mul, mul_assoc,Polynomial.coeff_X_mul,
   pow_two,Polynomial.coeff_X_mul,Polynomial.coeff_X,Polynomial.coeff_one,Polynomial.coeff_ofNat_mul]
 norm_num
 refine ⟨?_,?_,?_,?_,?_,?_⟩
 · linear_combination q10
 · linear_combination q11+t*q10-t*p10
 · linear_combination q12+t*q11-t*p11
 · linear_combination q20+2*q10
 · linear_combination q21+t*q20+2*q11+4*q10-t*p20
 · linear_combination q22+t*q21+2*q12+4*q11+2*q10-t*p21

theorem deform_jets3 (t : ℤ) (n : ℕ) :
 deformJet3 t (n+3) (deformR3 t (n+3)) := by
 induction n using Nat.twoStepInduction with
 | zero =>
   norm_num only [Nat.cast_zero,zero_add]
   unfold deformJet3 coeff
   rw [(deform_rows3 t 1).1,(deform_rows3 t 1).2,
     (deform_rows3 t 0).1,(deform_rows3 t 0).2]
   norm_num [deformR3,U,V,add_mul,mul_add,mul_assoc,pow_two,
     Polynomial.coeff_X_mul,Polynomial.coeff_C_mul,Polynomial.coeff_mul_C]
   all_goals ring
 | one =>
   norm_num only [Nat.cast_one]
   unfold deformJet3 coeff
   rw [(deform_rows3 t 2).1,(deform_rows3 t 2).2,
     (deform_rows3 t 1).1,(deform_rows3 t 1).2,
     (deform_rows3 t 0).1,(deform_rows3 t 0).2]
   norm_num [deformR3,U,V,add_mul,mul_add,mul_assoc,pow_two,
     Polynomial.coeff_X_mul,Polynomial.coeff_C_mul,Polynomial.coeff_mul_C]
   all_goals ring
 | more n h0 h1 =>
   have hh := deform_jet_step3 t (n+3) _ _ _ h0
     (by simpa [Nat.cast_add,Nat.cast_one,add_assoc,add_comm,add_left_comm] using h1)
     (deform_rows3 t (n+3)).1 (deform_rows3 t (n+3)).2
   convert hh using 1 <;> push_cast <;> ring

#print axioms deform_jets3
end
end MathGKM.Markov
