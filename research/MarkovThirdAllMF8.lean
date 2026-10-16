import MarkovThirdSmallLC21MF8
import MarkovThirdSmallLC31MF8
import MarkovThirdSmallLC32MF8
import MarkovThirdGeFourM762
import MarkovVerticalTwoAllMEA
/-! Machine-authored f8ca2c8b. Universal third-column raw adjacent LC. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

theorem vertical_third_twoMF8 (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   have hb : (frame rest).mid.b=2 := by omega
   obtain ⟨ha0,hab,_⟩ := frame_reduced rest
   have hp : rest=[] := frame_path_injective_098
     ((show (frame rest).mid.a=1 by omega).trans (by simp [frame,initial]))
     (hb.trans (by simp [frame,initial]))
   subst rest
   exact sThird21rawMF8 n j

theorem vertical_third_threeMF8 (path : List Bool)
 (ha : (frame path).mid.a=3) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   have hb : (frame rest).mid.b=3 := by omega
   obtain ⟨ha0,hab,_⟩ := frame_reduced rest
   have hh : (frame rest).mid.a=1 ∨ (frame rest).mid.a=2 := by omega
   rcases hh with hh|hh
   · exact sThird32rawMF8 n (by omega) rest hh hb j
   · exact sThird31rawMF8 n (by omega) rest hh hb j

theorem vertical_third_allMF8 (path : List Bool) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 by_cases h4 : 4≤(frame path).mid.a
 · exact vertical_third_ge_fourM762 path h4 j
 by_cases h1 : (frame path).mid.a=1
 · exact (source_one_global6 path h1).2.1 3 j
 by_cases h2 : (frame path).mid.a=2
 · exact vertical_third_twoMF8 path h2 j
 have h0 := (frame_reduced path).1
 exact vertical_third_threeMF8 path (by omega) j

theorem vertical_first_fourMF8 (path : List Bool) (i j : ℕ) (hi : i≤3) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 by_cases h : i≤2
 · exact vertical_first_threeMEA path i j h
 · have he : i=3 := by omega
   subst i
   exact vertical_third_allMF8 path j
end
end MathGKM.Markov
