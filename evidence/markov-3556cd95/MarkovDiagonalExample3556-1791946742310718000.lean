import MarkovVerticalTwo3556

/-! Machine-authored request 3556cd95. Actual numerator-two diagonal
with a nonreal zero; this is NOT a failure of raw log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def rawSlice3556 (P : BiPoly) (d : ℕ) : Polynomial ℤ :=
  ∑ i ∈ Finset.range (d+1), C (coeff P i (d-i))*X^i

theorem two_sevenths_slice3556 : rawSlice3556 (frame [false,false,true]).mid.p 4=
    X^2*(14+28*X+15*X^2) := by
  have hp : (frame [false,false,true]).mid.p =
      C (1*X^7+1*X^8)*X^0 +
      C (4*X^4+8*X^5+12*X^6+8*X^7)*X^1 +
      C (1*X^0+5*X^1+14*X^2+30*X^3+47*X^4+51*X^5+28*X^6)*X^2 +
      C (6*X^0+28*X^1+68*X^2+108*X^3+110*X^4+56*X^5)*X^3 +
      C (15*X^0+62*X^1+122*X^2+135*X^3+70*X^4)*X^4 +
      C (20*X^0+68*X^1+96*X^2+56*X^3)*X^5 +
      C (15*X^0+37*X^1+28*X^2)*X^6 +
      C (6*X^0+8*X^1)*X^7 +
      C (1*X^0)*X^8 := by
    simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
      Bool.false_eq_true,if_false,if_true,S,U,V]
    norm_num
    ring
  rw [hp]
  norm_num [rawSlice3556,Finset.sum_range_succ,coeff,Polynomial.coeff_add,
    Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]
  ring

theorem source_diagonal_nonreal3556 :
    ∃ z : ℂ, z.im≠0 ∧ Polynomial.eval₂ (Int.castRingHom ℂ) z
      (rawSlice3556 (frame [false,false,true]).mid.p 4)=0 := by
  let z : ℂ := (-14+(Real.sqrt 14 : ℂ)*Complex.I)/15
  have hs : (Real.sqrt 14)^2=(14:ℝ) := Real.sq_sqrt (by norm_num)
  have hc : (Real.sqrt 14 : ℂ)^2=14 := by exact_mod_cast hs
  have hz : z.im≠0 := by
    have hp : 0<Real.sqrt 14 := Real.sqrt_pos.2 (by norm_num)
    dsimp [z]; simp
  have he : 14+28*z+15*z^2=0 := by
    dsimp [z]; ring_nf; norm_num [Complex.I_sq,hc]
  refine ⟨z,hz,?_⟩
  rw [two_sevenths_slice3556]
  simp only [Polynomial.eval₂_mul,Polynomial.eval₂_pow,Polynomial.eval₂_X,
    Polynomial.eval₂_add,Polynomial.eval₂_ofNat]
  rw [he,mul_zero]

#print axioms two_sevenths_slice3556
#print axioms source_diagonal_nonreal3556
end
end MathGKM.Markov
