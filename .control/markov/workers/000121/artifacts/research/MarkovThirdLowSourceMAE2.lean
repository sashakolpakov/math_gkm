import MarkovThirdLowBoundsMAE2
import MarkovThirdBoundsTransportM03
import MarkovThirdFirstRunsM115
import MarkovThirdRun1LCM115
import MarkovThirdRun2LCM115
import MarkovThirdRun3LCM115
import MarkovThirdRun4LCM115
/-! Machine-authored 03d5764d, adapted from pending 1152282d source. All-run actual seed transport, no zero deletion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vThird_seed_cross_lowMAE2 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (hc : 3*(frame rest).mid.a ≤ (frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))) := by
 exact vThird_seed_cross_of_boundsM03 n rest ha
   (vAllbounds_lowMAE2 _ _ (frame_reduced rest).1 ha hc)

theorem vertical_third_all_run_lowMAE2 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (hc : 3*(frame rest).mid.a ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA n rest ha (vThird_seed_cross_lowMAE2 n rest ha hc) j

theorem vertical_third_remainderMAE2 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : 2*(frame path).mid.a ≤ 3*((frame path).mid.b % (frame path).mid.a))
 (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · obtain ⟨hi,hb⟩ := source_vertical_indicesMDE6 n rest
   have hp := frame_reduced rest
   have hm : (frame (List.replicate n false++true::rest)).mid.b %
       (frame (List.replicate n false++true::rest)).mid.a =
       (frame rest).mid.b-(frame rest).mid.a := by
     rw [hi,hb]
     simp only [Nat.add_mod,Nat.mul_mod_right,Nat.mul_mod_left,zero_add,Nat.mod_mod]
     exact Nat.mod_eq_of_lt (show (frame rest).mid.b-(frame rest).mid.a < (frame rest).mid.b by omega)
   rw [hm,hi] at hr
   exact vertical_third_all_run_lowMAE2 n rest (by omega) (by omega) j

theorem vertical_third_regionMAE2 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : (frame path).mid.b < 5*(frame path).mid.a ∨
       2*(frame path).mid.a ≤ 3*((frame path).mid.b % (frame path).mid.a))
 (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases hr with hr|hr
 · exact vertical_third_ratioM115 path ha hr j
 · exact vertical_third_remainderMAE2 path ha hr j
end
end MathGKM.Markov
