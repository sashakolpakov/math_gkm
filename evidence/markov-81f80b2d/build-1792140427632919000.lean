import MarkovFallingM81F
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 12000
theorem falling_seed3M81F (k l : ℕ) (hd : 3 ≤ k+l) (c0 c1 c2 c3 : ℝ) :
 ((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*(((1+(X:ℝ[X]))^(k+l-3)*(C c0*X^0+C c1*X^1+C c2*X^2+C c3*X^3)).coeff k)=
 ((k+l).choose k:ℝ)*(c0*1*(l)*(l-1)*(l-2)+c1*(k)*(l)*(l-1)+c2*(k)*(k-1)*(l)+c3*(k)*(k-1)*(k-2)*1) := by
 have h0 := falling_monomialM81F k l 3 0 (by omega) hd
 have h1 := falling_monomialM81F k l 3 1 (by omega) hd
 have h2 := falling_monomialM81F k l 3 2 (by omega) hd
 have h3 := falling_monomialM81F k l 3 3 (by omega) hd
 norm_num only [fallM81F,descPochhammer_succ_eval,descPochhammer_zero,Polynomial.eval_one,Nat.cast_ofNat,mul_one,one_mul,sub_zero] at h0 h1 h2 h3
 have he : (1+(X:ℝ[X]))^(k+l-3)*(C c0*X^0+C c1*X^1+C c2*X^2+C c3*X^3)=
 C c0*((1+X)^(k+l-3)*X^0)+C c1*((1+X)^(k+l-3)*X^1)+C c2*((1+X)^(k+l-3)*X^2)+C c3*((1+X)^(k+l-3)*X^3) := by ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination c0*h0+c1*h1+c2*h2+c3*h3
end
end MathGKM.Markov
