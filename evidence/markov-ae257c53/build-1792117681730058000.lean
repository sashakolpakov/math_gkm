import MarkovThirdSourceMEA
/-! Machine-authored ae257c53. Small-numerator third-column identities only.
No quotient log-concavity is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame
theorem vertical_third_seed_factor_smallMAE2 (n : ℕ) (rest : List Bool)
 (ha : 4 ≤ (frame rest).mid.b) (hn : 1 ≤ n) :
 let path := List.replicate n false++true::rest
 6*vresidualM9E1 path 3=X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 let b := (frame path).mid.b
 let N := (vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ)
 let R := (vresidualM9E1 path 3).map (Int.castRingHom ℝ)
 have hi := (source_vertical_indicesMDE6 n rest).2
 have hm := Nat.mul_le_mul_right (n+1) ha
 have hr := (frame_reduced rest).2.1
 have hb : 3*(n+2) ≤ b := by dsimp [b,path]; omega
 have he : (6:ℝ[X])*X^(3*(n+2))*R=X^b*N := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have hv := vertical_third_general_momentMEA n rest (by omega) x (ne_of_gt hx)
   dsimp only at hv
   have hn := vThirdSeed_normalizedMEA x (ne_of_gt hx) n rest
   rw [←vThirdSeed_evalMEA x n rest] at hn
   have hh : 6*x^(3*(n+2))*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 3)=
     x^b*eval₂ (Int.castRingHom ℝ) x (vThirdSeedMEA (X:ℤ[X]) n rest) := by
     linear_combination x^(3*(n+2))*hv-x^b*hn
   simpa only [Set.mem_setOf_eq,R,N,Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_X,
     Polynomial.eval_ofNat,Polynomial.eval_map] using hh
 have ep : (X:ℝ[X])^b=X^(3*(n+2))*X^(b-3*(n+2)) := by
   rw [←pow_add]; congr 1; omega
 rw [ep] at he
 have hf : (6:ℝ[X])*R=X^(b-3*(n+2))*N := by
   apply mul_left_cancel₀ (pow_ne_zero (3*(n+2)) (X_ne_zero : (X:ℝ[X])≠0))
   linear_combination he
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 simpa only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,Polynomial.map_X] using hf

theorem vertical_third_small_clearedMAE2 (n : ℕ) (rest : List Bool)
 (ha : 4 ≤ (frame rest).mid.b) (hb : (frame rest).mid.b ≤ 7) (hn : 1 ≤ n) :
 let path := List.replicate n false++true::rest
 6*(1+X)^(7-(frame path).mid.a)*((frame path).mid.p).coeff 3=
 X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 have hi : a=(frame rest).mid.b := (source_vertical_indicesMDE6 n rest).1
 have hc := vertical_all_order_clearedM9E1 path 3
 have hf := vertical_third_seed_factor_smallMAE2 n rest ha hn
 dsimp only at hf
 have hp : 6*(1+X)^6*((frame path).mid.p).coeff 3=
   (1+X)^(a-1)*(X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest) := by
   rw [add_comm X 1] at hc
   linear_combination 6*hc+(1+X)^(a-1)*hf
 have hne : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero (a-1) hne)
 have he : (1+X:ℤ[X])^6=(1+X)^(a-1)*(1+X)^(7-a) := by
   rw [←pow_add]; congr 1; omega
 rw [he] at hp
 linear_combination hp
end
end MathGKM.Markov
