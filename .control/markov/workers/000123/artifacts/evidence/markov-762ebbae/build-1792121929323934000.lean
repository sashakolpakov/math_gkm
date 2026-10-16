import MarkovThirdHighBoundsM762
import MarkovThirdBoundsTransportM03
/-! Machine-authored 762ebbae. Raw third column for all source numerators at least seven. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
attribute [local irreducible] frame

theorem vThird_seed_cross_reducedM762 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))) := by
 obtain ⟨hpos,hlt,hcop⟩ := frame_reduced rest
 exact vThird_seed_cross_of_boundsM03 n rest ha
   (vAllbounds_reducedM762 _ _ hpos ha hlt hcop)

theorem vertical_third_all_runM762 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA n rest ha (vThird_seed_cross_reducedM762 n rest ha) j

theorem vertical_third_largeM762 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · obtain ⟨hi,_⟩ := source_vertical_indicesMDE6 n rest
   exact vertical_third_all_runM762 n rest (by omega) j
end
end MathGKM.Markov
