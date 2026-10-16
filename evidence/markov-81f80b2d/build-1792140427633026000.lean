import MarkovFallingM81F
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 12000
theorem falling_seed5M81F (k l : ℕ) (hd : 5 ≤ k+l) (c0 c1 c2 c3 c4 c5 : ℝ) :
 ((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*((k:ℝ)+l-3)*((k:ℝ)+l-4)*(((1+(X:ℝ[X]))^(k+l-5)*(C c0*X^0+C c1*X^1+C c2*X^2+C c3*X^3+C c4*X^4+C c5*X^5)).coeff k)=
 ((k+l).choose k:ℝ)*(c0*1*(l)*(l-1)*(l-2)*(l-3)*(l-4)+c1*(k)*(l)*(l-1)*(l-2)*(l-3)+c2*(k)*(k-1)*(l)*(l-1)*(l-2)+c3*(k)*(k-1)*(k-2)*(l)*(l-1)+c4*(k)*(k-1)*(k-2)*(k-3)*(l)+c5*(k)*(k-1)*(k-2)*(k-3)*(k-4)*1) := by
 have h0 := falling_monomialM81F k l 5 0 (by omega) hd
 have h1 := falling_monomialM81F k l 5 1 (by omega) hd
 have h2 := falling_monomialM81F k l 5 2 (by omega) hd
 have h3 := falling_monomialM81F k l 5 3 (by omega) hd
 have h4 := falling_monomialM81F k l 5 4 (by omega) hd
 have h5 := falling_monomialM81F k l 5 5 (by omega) hd
 norm_num only [fallM81F,descPochhammer_succ_eval,descPochhammer_zero,Polynomial.eval_one,Nat.cast_ofNat,mul_one,one_mul,sub_zero] at h0 h1 h2 h3 h4 h5
 have he : (1+(X:ℝ[X]))^(k+l-5)*(C c0*X^0+C c1*X^1+C c2*X^2+C c3*X^3+C c4*X^4+C c5*X^5)=
 C c0*((1+X)^(k+l-5)*X^0)+C c1*((1+X)^(k+l-5)*X^1)+C c2*((1+X)^(k+l-5)*X^2)+C c3*((1+X)^(k+l-5)*X^3)+C c4*((1+X)^(k+l-5)*X^4)+C c5*((1+X)^(k+l-5)*X^5) := by ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination c0*h0+c1*h1+c2*h2+c3*h3+c4*h4+c5*h5
end
end MathGKM.Markov
