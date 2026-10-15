import MarkovRun4CombineE2
import MarkovTerminalSourceE2
namespace MathGKM.Markov
noncomputable section
theorem third_three_bandsE2 (n c r j : ℕ) (hn : 4 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hj : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h : 5 ≤ n
 · exact third_three_bands_lc53D n c r j h hc hr hrc hj
 · have he : n=4 := by omega
   subst n
   by_cases h1 : j ≤ 8
   · exact third_two_bands_lc07F1 4 c r j hr hrc (by omega) (by omega)
   · by_cases h2 : j ≤ 12
     · exact run4_cross_lcE2 c r j hc hr hrc (by omega) h2
     · exact third_tail_lc53D 4 c r j hc hr hrc (by omega) hj
theorem source_third_three_bandsE2 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 4 ≤ n) (hc : 4 ≤ (frame rest).mid.b) (hj : j ≤ 3*n+1)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := third_three_bandsE2 n (frame rest).mid.b (frame rest).mid.a j
   hn hc (by omega) (by omega) hj
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]
theorem source_third_ge_fourE2 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 4 ≤ n) (hc : 4 ≤ (frame rest).mid.b)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hj : j ≤ 3*n+1
 · exact source_third_three_bandsE2 n rest i j hn hc hj hs
 · have hterm := source_third_remaining_terminal53D n rest i j hs hp (by omega)
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   have hpoly := hp
   rw [ha,hb] at hpoly
   have hs' := hs
   rw [ha] at hs'
   have hch := third_polygon_terminal_chamberE2 n (frame rest).mid.b
     (frame rest).mid.a i j hs' hpoly
   have hh : (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff j*
     (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+2) ≤
     ((thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+1))^2 := by
    rcases hterm with h | h <;> subst j
    · have hh := third_terminal0_lcE2 n (frame rest).mid.b (frame rest).mid.a
        (by omega) hc (by omega) (by omega) (by nlinarith [hch])
      convert hh using 1 <;> congr 2 <;> omega
    · have hh := third_terminal1_lcE2 n (frame rest).mid.b (frame rest).mid.a
        (by omega) hc (by omega) (by nlinarith [hch])
      convert hh using 1 <;> congr 2 <;> omega
   rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
     ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
     ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at hh
   nlinarith only [hh]

#print axioms source_third_ge_fourE2
end
end MathGKM.Markov
