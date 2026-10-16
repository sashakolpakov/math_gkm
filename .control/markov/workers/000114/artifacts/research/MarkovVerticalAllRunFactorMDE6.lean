import MarkovVerticalClearedSeedMDE6
import MarkovVerticalSecondRightMDE6
/-! Machine-authored de6168c6. Universal integral second-column identity.
General seed log-concavity remains an explicit, unproved condition. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vSecond_residual_factorMDE6 (n : ℕ) (rest : List Bool)
 (ha : 5 ≤ (frame rest).mid.b) :
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
 have hb : 2*n+4 ≤ b := by dsimp [b,path]; omega
 have hclear : (2:ℝ[X])*X^(2*n+4)*R=X^b*N := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have hv := vertical_second_candidate_bridgeMDE6 n rest (by omega) x (ne_of_gt hx)
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

theorem vertical_second_all_run_factorMDE6 (n : ℕ) (rest : List Bool)
 (ha : 5 ≤ (frame rest).mid.b) :
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let r := (frame rest).mid.b-(frame rest).mid.a
 2*((frame path).mid.p).coeff 2=
 X^(b-(2*n+4))*(1+X)^(a-5)*vNseedMDE6 n a r (2*r-a) := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi := (source_vertical_indicesMDE6 n rest).1
 have h := vertical_all_order_factorM9E1 path 2 (by dsimp [path]; omega)
 have hf := vSecond_residual_factorMDE6 n rest ha
 dsimp only at hf
 rw [h]
 rw [show (frame path).mid.a-2*2-1=(frame path).mid.a-5 by omega]
 linear_combination (1+X)^((frame path).mid.a-5)*hf

theorem vertical_second_source_factorMDE6 (path : List Bool)
 (ha : 5 ≤ (frame path).mid.a) :
 ∃ n rest, path=List.replicate n false++true::rest ∧
   let a := (frame path).mid.a
   let b := (frame path).mid.b
   let r := (frame rest).mid.b-(frame rest).mid.a
   2*((frame path).mid.p).coeff 2=
     X^(b-(2*n+4))*(1+X)^(a-5)*vNseedMDE6 n a r (2*r-a) := by
 rcases split_first_true025 path with ⟨n,rfl⟩ | ⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · refine ⟨n,rest,rfl,?_⟩
   have hi := (source_vertical_indicesMDE6 n rest).1
   exact vertical_second_all_run_factorMDE6 n rest (by omega)

end
end MathGKM.Markov
