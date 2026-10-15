import MarkovThirdRunPolynomialADB2
/-! Machine-authored request 8bbb934e. Exact run-one sequence and polynomial.
The source adapter is proved separately; all zero tails are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def thirdOneSeq8BBB (c r q t u : ℤ) : ℕ → ℤ
 | 0 => -6 + 11*r + -6*r^2 + 1*r^3 + 22*c + -24*c*r + 6*c*r^2 + -24*c^2 + 12*c^2*r + 8*c^3
 | 1 => -18 + 87*r + -54*r^2 + 9*r^3 + 84*c + -159*c*r + 45*c*r^2 + -102*c^2 + 72*c^2*r + 36*c^3
 | 2 => -18 + 393*r + -246*r^2 + 39*r^3 + 39*c + -489*c*r + 156*c*r^2 + -111*c^2 + 183*c^2*r + 54*c^3
 | 3 => -6 + 693*r + -594*r^2 + 99*r^3 + -147*c + -684*c*r + 297*c*r^2 + 30*c^2 + 225*c^2*r + 27*c^3
 | 4 => 312*r + -780*r^2 + 156*r^3 + -120*c + -276*c*r + 312*c*r^2 + 72*c^2 + 108*c^2*r
 | 5 => -264*q + -120*r + 24*r*q + -432*r^2 + 144*r^3 + 24*c + 48*c*q + 96*c*r + 144*c*r^2
 | 6 => -456*q + 8*r + 72*r*q + 64*r^3 + 72*c*q
 | 7 => 24*t + -144*q + 96*r*q
 | 8 => 24*u
 | _ => 0

def thirdOnePoly8BBB (c r q t u : ℤ) : ℤ[X] :=
 C (thirdOneSeq8BBB c r q t u 0)+
 C (thirdOneSeq8BBB c r q t u 1)*X^1+
 C (thirdOneSeq8BBB c r q t u 2)*X^2+
 C (thirdOneSeq8BBB c r q t u 3)*X^3+
 C (thirdOneSeq8BBB c r q t u 4)*X^4+
 C (thirdOneSeq8BBB c r q t u 5)*X^5+
 C (thirdOneSeq8BBB c r q t u 6)*X^6+
 C (thirdOneSeq8BBB c r q t u 7)*X^7+
 C (thirdOneSeq8BBB c r q t u 8)*X^8

theorem thirdOnePoly_coeff8BBB (c r q t u : ℤ) (j : ℕ) :
 (thirdOnePoly8BBB c r q t u).coeff j=thirdOneSeq8BBB c r q t u j := by
 unfold thirdOnePoly8BBB
 by_cases hj : j<9
 · interval_cases j <;> simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_C] <;> norm_num
 · have h0 : j≠0 := by omega
   have h1 : j≠1 := by omega
   have h2 : j≠2 := by omega
   have h3 : j≠3 := by omega
   have h4 : j≠4 := by omega
   have h5 : j≠5 := by omega
   have h6 : j≠6 := by omega
   have h7 : j≠7 := by omega
   have h8 : j≠8 := by omega
   have hz : thirdOneSeq8BBB c r q t u j=0 := by
     obtain ⟨k,rfl⟩ : ∃ k,j=k+9 := ⟨j-9,by omega⟩
     rfl
   simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_C,h0,h1,h2,h3,h4,h5,h6,h7,h8,hz,if_false,
     mul_zero,add_zero,eq_comm]
end
end MathGKM.Markov
