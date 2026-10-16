import MarkovThirdRun1LCM115
import MarkovThirdRun2LCM115
import MarkovThirdRun3LCM115
import MarkovThirdRun4LCM115
/-! Machine-authored 1152282d. A source-ratio region, with universal indices. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame

theorem vertical_third_first_runsM115 (n : ℕ) (rest : List Bool)
 (hn : n ≤ 3) (ha : 7 ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 interval_cases n
 · exact vertical_third_run1M115 rest ha j
 · exact vertical_third_run2M115 rest ha j
 · exact vertical_third_run3M115 rest ha j
 · exact vertical_third_run4M115 rest ha j

theorem vertical_third_ratioM115 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a) (hb : (frame path).mid.b < 5*(frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · obtain ⟨hi,hb'⟩ := source_vertical_indicesMDE6 n rest
   have hn : n ≤ 3 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 5 ≤ n+1 by omega)
     omega
   exact vertical_third_first_runsM115 n rest hn (by omega) j
end
end MathGKM.Markov
