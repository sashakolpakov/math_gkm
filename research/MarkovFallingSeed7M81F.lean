import MarkovFallingM81F
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 12000
theorem falling_seed7M81F (k l : ℕ) (hd : 7 ≤ k+l) (c0 c1 c2 c3 c4 c5 c6 c7 : ℝ) :
 ((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*((k:ℝ)+l-3)*((k:ℝ)+l-4)*((k:ℝ)+l-5)*((k:ℝ)+l-6)*(((1+(X:ℝ[X]))^(k+l-7)*(C c0*X^0+C c1*X^1+C c2*X^2+C c3*X^3+C c4*X^4+C c5*X^5+C c6*X^6+C c7*X^7)).coeff k)=
 ((k+l).choose k:ℝ)*(c0*1*(l)*(l-1)*(l-2)*(l-3)*(l-4)*(l-5)*(l-6)+c1*(k)*(l)*(l-1)*(l-2)*(l-3)*(l-4)*(l-5)+c2*(k)*(k-1)*(l)*(l-1)*(l-2)*(l-3)*(l-4)+c3*(k)*(k-1)*(k-2)*(l)*(l-1)*(l-2)*(l-3)+c4*(k)*(k-1)*(k-2)*(k-3)*(l)*(l-1)*(l-2)+c5*(k)*(k-1)*(k-2)*(k-3)*(k-4)*(l)*(l-1)+c6*(k)*(k-1)*(k-2)*(k-3)*(k-4)*(k-5)*(l)+c7*(k)*(k-1)*(k-2)*(k-3)*(k-4)*(k-5)*(k-6)*1) := by
 have h0 := falling_monomialM81F k l 7 0 (by omega) hd
 have h1 := falling_monomialM81F k l 7 1 (by omega) hd
 have h2 := falling_monomialM81F k l 7 2 (by omega) hd
 have h3 := falling_monomialM81F k l 7 3 (by omega) hd
 have h4 := falling_monomialM81F k l 7 4 (by omega) hd
 have h5 := falling_monomialM81F k l 7 5 (by omega) hd
 have h6 := falling_monomialM81F k l 7 6 (by omega) hd
 have h7 := falling_monomialM81F k l 7 7 (by omega) hd
 norm_num only [fallM81F,descPochhammer_succ_eval,descPochhammer_zero,Polynomial.eval_one,Nat.cast_ofNat,mul_one,one_mul,sub_zero] at h0 h1 h2 h3 h4 h5 h6 h7
 have he : (1+(X:ℝ[X]))^(k+l-7)*(C c0*X^0+C c1*X^1+C c2*X^2+C c3*X^3+C c4*X^4+C c5*X^5+C c6*X^6+C c7*X^7)=
 C c0*((1+X)^(k+l-7)*X^0)+C c1*((1+X)^(k+l-7)*X^1)+C c2*((1+X)^(k+l-7)*X^2)+C c3*((1+X)^(k+l-7)*X^3)+C c4*((1+X)^(k+l-7)*X^4)+C c5*((1+X)^(k+l-7)*X^5)+C c6*((1+X)^(k+l-7)*X^6)+C c7*((1+X)^(k+l-7)*X^7) := by ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination c0*h0+c1*h1+c2*h2+c3*h3+c4*h4+c5*h5+c6*h6+c7*h7
end
end MathGKM.Markov
