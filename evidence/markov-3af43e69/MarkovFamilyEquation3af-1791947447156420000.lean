import MarkovFamilyRecurrence3af

/-! Machine-authored request 3af43e69. Second-order inhomogeneous recurrence
and its columnwise form, retaining the exact correction term. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem two_inhomogeneous3af (q : ℕ) :
    twoFamily3af (q+2)=(S^2-2*V)*twoFamily3af (q+1)-
      V^2*twoFamily3af q-4*U*V^(q+2) := by
  unfold twoFamily3af
  have hc := fib_cassini3556 q
  rw [fib_rec6 q] at hc
  rw [show q+2+1=(q+1)+2 by omega,fib_rec6 (q+1),fib_rec6 q]
  simp only [pow_add,pow_one]
  linear_combination -4*V^2*hc

theorem two_polynomial_coefficient3af (q i : ℕ) :
    (twoFamily3af (q+2)).coeff (i+2)=
      (1+X^2)*(twoFamily3af (q+1)).coeff (i+2)-
      X^2*(twoFamily3af q).coeff (i+2)+
      2*(X+1)*(twoFamily3af (q+1)).coeff (i+1)+
      (twoFamily3af (q+1)).coeff i := by
  rw [two_inhomogeneous3af]
  have hs : S^2-2*V=U^2+C (2*(X+1))*U+C (1+X^2) := by
    simp [S,U,V]; ring
  rw [hs]
  simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_sub,
    U,V,← map_pow,Polynomial.coeff_C_mul,
    Polynomial.coeff_X_pow_mul,Polynomial.coeff_X_mul]
  simp [mul_assoc,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,
    Polynomial.coeff_X,show i+2≠1 by omega]
  ring

#print axioms two_inhomogeneous3af
#print axioms two_polynomial_coefficient3af
end
end MathGKM.Markov
