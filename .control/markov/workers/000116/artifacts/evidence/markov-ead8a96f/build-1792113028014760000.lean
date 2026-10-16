import MarkovThirdSeedMEA
/-! Machine-authored ead8a96f. Integral source factor for every third-column run.
Seed log-concavity is an explicit remaining obligation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vEval_blockMEA (x : ℝ) (n : ℕ) (r : Bool) :
 hmapM13D (vEvalMDE6 x) (vBlockPolyMEA (X:ℤ[X]) n r)=vBlockPolyMEA x n r := by
 have hw (m : ℕ) := vEval_wordMDE6 x (runBlock025 m)
 have ha (m : ℕ) := congrArg Mat16.a (hw m)
 have hb (m : ℕ) := congrArg Mat16.b (hw m)
 have hc (m : ℕ) := congrArg Mat16.c (hw m)
 have hd (m : ℕ) := congrArg Mat16.d (hw m)
 simp only [hmapM13D] at ha hb hc hd
 have he : vEvalMDE6 x (C (X:ℤ[X]))=C x := by simp [vEvalMDE6]
 cases r <;> apply Mat16.ext <;>
   simp only [vBlockPolyMEA,Bool.false_eq_true,if_false,if_true,hmapM13D,
     hscaleM13D,vswapMDE6,map_mul,he,ha,hb,hc,hd]

theorem vThirdSeed_evalMEA (x : ℝ) (n : ℕ) (rest : List Bool) :
 eval₂ (Int.castRingHom ℝ) x (vThirdSeedMEA (X:ℤ[X]) n rest)=
 vThirdSeedMEA x n rest := by
 have hw (r : Bool) := vEval_blockMEA x n r
 have ha (r : Bool) (i : ℕ) := congrArg (fun m : Mat16 ℝ[X] => m.a.coeff i) (hw r)
 have hb (r : Bool) (i : ℕ) := congrArg (fun m : Mat16 ℝ[X] => m.b.coeff i) (hw r)
 have hc (r : Bool) (i : ℕ) := congrArg (fun m : Mat16 ℝ[X] => m.c.coeff i) (hw r)
 have hd (r : Bool) (i : ℕ) := congrArg (fun m : Mat16 ℝ[X] => m.d.coeff i) (hw r)
 simp only [hmapM13D,vEval_coeffMDE6] at ha hb hc hd
 simp only [vThirdSeedMEA,hsourceMomentM13D,boolMomentADB2,boolJetADB2,
   vLocalKScaledMEA,vLocalLScaledMEA,eval₂_add,eval₂_sub,eval₂_mul,eval₂_pow,
   eval₂_X,eval₂_natCast,eval₂_ofNat,eval₂_one,ha,hb,hc,hd]

theorem vertical_third_seed_factorMEA (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) :
 let path := List.replicate n false++true::rest
 6*vresidualM9E1 path 3=X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 let b := (frame path).mid.b
 let N := (vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ)
 let R := (vresidualM9E1 path 3).map (Int.castRingHom ℝ)
 have hi := (source_vertical_indicesMDE6 n rest).2
 have hm := Nat.mul_le_mul_right (n+1) ha
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

theorem vertical_third_all_run_factorMEA (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) :
 let path := List.replicate n false++true::rest
 6*((frame path).mid.p).coeff 3=
 X^((frame path).mid.b-3*(n+2))*(1+X)^((frame path).mid.a-7)*
   vThirdSeedMEA (X:ℤ[X]) n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi := (source_vertical_indicesMDE6 n rest).1
 have h := vertical_all_order_factorM9E1 path 3 (by dsimp [path]; omega)
 have hf := vertical_third_seed_factorMEA n rest ha
 dsimp only at hf
 rw [h]
 rw [show (frame path).mid.a-2*3-1=(frame path).mid.a-7 by omega]
 rw [add_comm X 1]
 linear_combination (1+X)^((frame path).mid.a-7)*hf
end
end MathGKM.Markov
