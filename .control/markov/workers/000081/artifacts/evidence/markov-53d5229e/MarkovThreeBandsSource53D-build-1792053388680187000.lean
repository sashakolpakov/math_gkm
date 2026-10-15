import MarkovTailExtended53D
import MarkovCrossTailLC53D
import MarkovTwoBandsSource07F1
/-! Machine-authored 53d5229e. Three contiguous coefficient bands on the
third lower slice. This is not the full slice or the full conjecture. -/
namespace MathGKM.Markov
noncomputable section
theorem third_three_bands_lc53D (n c r j : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hj : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h : j ≤ 2*n
 · exact third_two_bands_lc07F1 n c r j hr hrc (by omega) h
 · by_cases h' : j ≤ 2*n+4
   · exact third_cross_tail_lc53D n c r j hn hc hr hrc (by omega) h'
   · exact third_tail_lc53D n c r j hc hr hrc (by omega) hj

theorem source_third_three_bands53D (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 5 ≤ n) (hc : 4 ≤ (frame rest).mid.b) (hj : j ≤ 3*n+1)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := third_three_bands_lc53D n (frame rest).mid.b (frame rest).mid.a j
   hn hc (by omega) (by omega) hj
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms source_third_three_bands53D
end
end MathGKM.Markov
