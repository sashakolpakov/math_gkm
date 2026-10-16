import MarkovVerticalSmallMomentM758
import MarkovVerticalSeedLCM758
/-! Machine-authored 7584c5d0. Exact small-numerator source formula.
The quotient's log-concavity is not asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame
theorem vertical_second_general_momentM758 (n : ℕ) (rest : List Bool)
 (ha : 3 ≤ (frame rest).mid.b) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++true::rest
 let D := vGeneralDMDE6 x n rest
 let K := vGeneralKMDE6 x n rest
 2*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2)=
 x^(frame path).mid.b*(D^2+K-2*(x+1)*D+2*(x+1)^2) := by
 dsimp only
 let path := List.replicate n false++true::rest
 let D := vGeneralDMDE6 x n rest
 let K := vGeneralKMDE6 x n rest
 let T := tr16 (projProduct6905 ((sourceWord28 rest).map (vGeneralProjMDE6 x n)))
 let E := vEvalMDE6 x (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)))
 let z := x^(frame path).mid.b
 obtain ⟨h0,h1,h2⟩ := hsource_moments_twoM758 (vGeneralProjMDE6 x n)
   (vGeneral_shapeMDE6 x hx n) rest ha
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K at h2
 have ht : C z*T=(1+C (x+1)*X)*E := vGeneral_source_traceMDE6 x hx n rest
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2
 have he : 2*E.coeff 2=z*(D^2+K-2*(x+1)*D+2*(x+1)^2) := by
   linear_combination -2*e2+z*h2+2*(x+1)*e1-2*(x+1)^2*e0
 have ec : E.coeff 2=eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2) :=
   vEval_coeffMDE6 x _ 2
 rw [ec] at he
 exact he

theorem vertical_second_candidate_bridgeM758 (n : ℕ) (rest : List Bool)
 (ha : 3 ≤ (frame rest).mid.b) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let r := (frame rest).mid.b-(frame rest).mid.a
 let s := 2*r-a
 2*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2)=
 x^(frame path).mid.b*vSecondMomentMDE6 x n a r s := by
 dsimp only
 have h := vertical_second_general_momentM758 n rest ha x hx
 dsimp only at h
 obtain ⟨hd,hk⟩ := vGeneral_DK_explicitMDE6 x n rest
 rw [hd,hk,vF_stepMDE6 x hx] at h
 rw [(source_vertical_indicesMDE6 n rest).1]
 exact h
theorem vSecond_residual_factorM758 (n : ℕ) (rest : List Bool)
 (ha : 3 ≤ (frame rest).mid.b) :
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let r := (frame rest).mid.b-(frame rest).mid.a
 2*vresidualM9E1 path 2=X^(b-(2*n+4))*vNseedMDE6 n a r (2*r-a) := by
 dsimp only
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let r := (frame rest).mid.b-(frame rest).mid.a
 let R := (vresidualM9E1 path 2).map (Int.castRingHom ℝ)
 let N := (vNseedMDE6 n a r (2*r-a)).map (Int.castRingHom ℝ)
 have hi := source_vertical_indicesMDE6 n rest
 have hm := Nat.mul_le_mul_right (n+1) ha
 have hr0 := (frame_reduced rest).2.1
 have hb : 2*n+4 ≤ b := by dsimp [b,path]; omega
 have hclear : (2:ℝ[X])*X^(2*n+4)*R=X^b*N := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have hv := vertical_second_candidate_bridgeM758 n rest (by omega) x (ne_of_gt hx)
   dsimp only at hv
   have hs := vNseed_evalMDE6 x (ne_of_gt hx) n a r (2*r-a)
   have hh : 2*x^(2*n+4)*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2)=
     x^b*eval₂ (Int.castRingHom ℝ) x (vNseedMDE6 n a r (2*r-a)) := by
     linear_combination x^(2*n+4)*hv+x^b*hs
   simpa [Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_map,R,N] using hh
 have eb : (X:ℝ[X])^b=X^(2*n+4)*X^(b-(2*n+4)) := by
   rw [←pow_add]; congr 1; omega
 rw [eb] at hclear
 have hf : (2:ℝ[X])*R=X^(b-(2*n+4))*N := by
   apply mul_left_cancel₀ (pow_ne_zero (2*n+4) (X_ne_zero : (X:ℝ[X])≠0))
   linear_combination hclear
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 simpa only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,Polynomial.map_X] using hf


theorem vertical_second_small_clearedM758 (n : ℕ) (rest : List Bool)
 (ha : 3 ≤ (frame rest).mid.b) (hb : (frame rest).mid.b ≤ 5) :
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let r := (frame rest).mid.b-(frame rest).mid.a
 2*(1+X)^(5-a)*((frame path).mid.p).coeff 2=
 X^(b-(2*n+4))*vNseedMDE6 n a r (2*r-a) := by
 dsimp only
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 have hi : a=(frame rest).mid.b := (source_vertical_indicesMDE6 n rest).1
 have hc := vertical_all_order_clearedM9E1 path 2
 have hf := vSecond_residual_factorM758 n rest ha
 dsimp only at hf
 have hp : 2*(1+X)^4*((frame path).mid.p).coeff 2=
   (1+X)^(a-1)*(X^((frame path).mid.b-(2*n+4))*
     vNseedMDE6 n a ((frame rest).mid.b-(frame rest).mid.a)
       (2*((frame rest).mid.b-(frame rest).mid.a)-a)) := by
   rw [add_comm X 1] at hc
   linear_combination 2*hc+(1+X)^(a-1)*hf
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero (a-1) hn)
 have he : (1+X:ℤ[X])^4=(1+X)^(a-1)*(1+X)^(5-a) := by
   rw [←pow_add]; congr 1; omega
 rw [he] at hp
 linear_combination hp
end
end MathGKM.Markov
