import MarkovHorizontalResidualM511
/-! Machine-authored request 5110b3fa. Uniform integral source-row identity
and prescribed binomial divisibility, for every row and every source path. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem horizontal_all_order_clearedM511 (path : List Bool) (j : ℕ) :
 (1+X)^(2*j)*(Bivariate.swap (frame path).mid.p).coeff j=
 (1+X)^((frame path).mid.b-1)*hresidualM511 (X:ℤ[X]) (sourceWord28 path) j := by
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 apply Polynomial.eq_of_infinite_eval_eq
 apply (Set.Ioi_infinite (0:ℝ)).mono
 intro x hx
 change 0 < x at hx
 have h := hresidual_source_evalM511 x (ne_of_gt hx) (by linarith) path j
 rw [hrowEval_coeffM13D] at h
 have hr := hresidual_mapM511 (Polynomial.eval₂RingHom (Int.castRingHom ℝ) x)
   (X:ℤ[X]) (sourceWord28 path) j
 simp only [coe_eval₂RingHom,eval₂_X] at hr
 rw [←hr] at h
 simpa [Polynomial.eval_map,Polynomial.eval₂_mul,Polynomial.eval₂_pow,
   Polynomial.eval₂_add,Polynomial.eval₂_one,Polynomial.eval₂_X,add_comm] using h

theorem horizontal_all_order_factorM511 (path : List Bool) (j : ℕ)
 (hb : 2*j+1 ≤ (frame path).mid.b) :
 (Bivariate.swap (frame path).mid.p).coeff j=
 (1+X)^((frame path).mid.b-2*j-1)*hresidualM511 (X:ℤ[X]) (sourceWord28 path) j := by
 have h := horizontal_all_order_clearedM511 path j
 have hn : (1+X:ℤ[X])≠0 := by
   intro hz
   have hh := congrArg (fun p : ℤ[X] => p.coeff 0) hz
   norm_num [Polynomial.coeff_one] at hh
 apply mul_left_cancel₀ (pow_ne_zero (2*j) hn)
 have he : (1+X:ℤ[X])^((frame path).mid.b-1)=
   (1+X)^(2*j)*(1+X)^((frame path).mid.b-2*j-1) := by
   rw [←pow_add]; congr 1; omega
 rw [he,mul_assoc] at h
 exact h

theorem horizontal_binomial_dvdM511 (path : List Bool) (j : ℕ) :
 (1+X:ℤ[X])^((frame path).mid.b-2*j-1) ∣
 (Bivariate.swap (frame path).mid.p).coeff j := by
 by_cases hb : 2*j+1 ≤ (frame path).mid.b
 · exact ⟨hresidualM511 X (sourceWord28 path) j,horizontal_all_order_factorM511 path j hb⟩
 · have he : (frame path).mid.b-2*j-1=0 := by omega
   simp [he]

end
end MathGKM.Markov
