import MarkovThirdShortMomentMF8
import MarkovThirdSparseM115
/-! Machine-authored f8ca2c8b. Corrected integral source identity for a=3. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vertical_three_residualMF8 (n : ℕ) (r : Bool) :
 let path := List.replicate n false++[true,r]
 let s : ℕ := if r then 2 else 1
 6*X^s*vresidualM9E1 path 3=vThirdSeedMEA (X:ℤ[X]) n [r]+6*X^s := by
 dsimp only
 let path := List.replicate n false++[true,r]
 let s : ℕ := if r then 2 else 1
 have hb : (frame path).mid.b+s=3*(n+2) := by
   have h := (source_vertical_indicesMDE6 n [r]).2
   cases r
   · rw [show (frame [false]).mid.b=3 by norm_num [frame,initial,advance],
       show (frame [false]).mid.a=1 by norm_num [frame,initial,advance]] at h
     change (frame (List.replicate n false++[true,false])).mid.b+1=3*(n+2)
     omega
   · rw [show (frame [true]).mid.b=3 by norm_num [frame,initial,advance],
       show (frame [true]).mid.a=2 by norm_num [frame,initial,advance]] at h
     change (frame (List.replicate n false++[true,true])).mid.b+2=3*(n+2)
     omega
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 apply Polynomial.eq_of_infinite_eval_eq
 apply (Set.Ioi_infinite (0:ℝ)).mono
 intro x hx
 have hv := vertical_three_momentMF8 n r x (ne_of_gt hx)
 dsimp only at hv
 have hn := vThirdSeed_normalizedMEA x (ne_of_gt hx) n [r]
 rw [←vThirdSeed_evalMEA x n [r],←hb,pow_add] at hn
 simp only [Polynomial.eval_map,eval₂_add,eval₂_mul,eval₂_ofNat,eval₂_pow,eval₂_X]
 change 6*x^s*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 3)=
   eval₂ (Int.castRingHom ℝ) x (vThirdSeedMEA (X:ℤ[X]) n [r])+6*x^s
 linear_combination x^s*hv-hn

theorem vertical_three_clearedMF8 (n : ℕ) (r : Bool) :
 let path := List.replicate n false++[true,r]
 let s : ℕ := if r then 2 else 1
 (1+X)^4*(6*X^s*((frame path).mid.p).coeff 3)=
 vThirdSeedMEA (X:ℤ[X]) n [r]+6*X^s := by
 dsimp only
 let path := List.replicate n false++[true,r]
 let s : ℕ := if r then 2 else 1
 have hi : (frame path).mid.a=3 := by
   rw [(source_vertical_indicesMDE6 n [r]).1]
   cases r <;> norm_num [frame,initial,advance]
 have hc := vertical_all_order_clearedM9E1 path 3
 rw [hi] at hc
 norm_num only at hc
 rw [add_comm X 1] at hc
 have hf := vertical_three_residualMF8 n r
 dsimp only at hf
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 2 hn)
 linear_combination 6*X^s*hc+(1+X)^2*hf
end
end MathGKM.Markov
