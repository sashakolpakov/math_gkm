import MarkovThirdAlllow_0_4M03
import MarkovThirdBoundsTransportM03
import MarkovThirdFirstRunsM115
import MarkovThirdRun1LCM115
import MarkovThirdRun2LCM115
import MarkovThirdRun3LCM115
import MarkovThirdRun4LCM115
/-! Machine-authored 1152282d. All-run actual seed transport, no zero deletion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vAllbounds_lowM03 (a b : ℕ) (ha : 1 ≤ a) (hb : 3*a+4 ≤ b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 let x := a-1
 let y := b-3*a-4
 have ea : a=1+x := by dsimp [x]; omega
 have eb : b=7+y+3*x := by dsimp [x,y]; omega
 have h := vAllchart_low_0_4M03 (x:ℤ) (y:ℤ) (by positivity) (by positivity)
 have h0 : 2*a-b=0 := by omega
 have h1 : min (b-a) (3*a-b)=0 := by omega
 have h2 : 3*a-2*b=0 := by omega
 rw [h0,h1,h2,ea,eb]
 push_cast
 exact h

theorem vThird_seed_cross_lowM03 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (hc : 3*(frame rest).mid.a+4 ≤ (frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))) := by
 exact vThird_seed_cross_of_boundsM03 n rest ha
   (vAllbounds_lowM03 _ _ (frame_reduced rest).1 hc)

theorem vertical_third_all_run_lowM03 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (hc : 3*(frame rest).mid.a+4 ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA n rest ha (vThird_seed_cross_lowM03 n rest ha hc) j

theorem vertical_third_remainderM03 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : 2*(frame path).mid.a+4 ≤ 3*((frame path).mid.b % (frame path).mid.a))
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
   exact vertical_third_all_run_lowM03 n rest (by omega) (by omega) j

theorem vertical_third_regionM03 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : (frame path).mid.b < 5*(frame path).mid.a ∨
       2*(frame path).mid.a+4 ≤ 3*((frame path).mid.b % (frame path).mid.a))
 (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases hr with hr|hr
 · exact vertical_third_ratioM115 path ha hr j
 · exact vertical_third_remainderM03 path ha hr j
end
end MathGKM.Markov
