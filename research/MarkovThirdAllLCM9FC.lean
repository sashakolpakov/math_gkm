import MarkovThirdAllSourceBoundsM9FC
import MarkovThirdBoundsTransportM03
/-! Machine-authored ae257c53. Universal third-column result for a>=7. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
attribute [local irreducible] frame

theorem vThird_seed_crossM9FC (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))) := by
 exact vThird_seed_cross_of_boundsM03 n rest ha
   (vAllboundsM9FC _ _ (frame_reduced rest).1 ha (frame_reduced rest).2.1)

theorem vertical_third_all_runM9FC (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA n rest ha (vThird_seed_crossM9FC n rest ha) j

theorem vertical_third_largeM9FC (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   exact vertical_third_all_runM9FC n rest (by omega) j
end
end MathGKM.Markov
