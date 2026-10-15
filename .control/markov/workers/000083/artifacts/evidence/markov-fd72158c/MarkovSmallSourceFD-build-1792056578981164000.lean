import MarkovSmallCombine2FD
import MarkovSmallCombine3FD
import MarkovLongSourceE2
/-! Machine-authored fd72158c. Raw source transfer, all polynomial zeros retained. -/
namespace MathGKM.Markov
noncomputable section
theorem source_third_smallFD (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : n=2 ∨ n=3) (hc : 4 ≤ (frame rest).mid.b)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hs' := hs
 have hp' := hp
 rw [ha] at hs'
 rw [ha,hb] at hp'
 have hj := third_polygon_bound53D n (frame rest).mid.b (frame rest).mid.a i j
   (by omega) hrc hs' hp'
 have hh : (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff j*
   (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+2) ≤
   ((thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+1))^2 := by
  rcases hn with rfl | rfl
  · exact small_run_lc2FD _ _ _ hc (by omega) (by omega) (by omega)
  · exact small_run_lc3FD _ _ _ hc (by omega) (by omega) (by omega)
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at hh
 nlinarith only [hh]

theorem source_third_ge_twoFD (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 2 ≤ n) (hc : 4 ≤ (frame rest).mid.b)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hn' : 4 ≤ n
 · exact source_third_ge_fourE2 n rest i j hn' hc hs hp
 · exact source_third_smallFD n rest i j (by omega) hc hs hp
end
end MathGKM.Markov
