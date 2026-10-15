import MarkovTailLC53D
/-! Machine-authored 53d5229e. Actual source family, raw integer coefficients. -/
namespace MathGKM.Markov
noncomputable section

theorem source_third_tail_low53D (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hc : 4 ≤ (frame rest).mid.b) (hch : 2*(frame rest).mid.a ≤ (frame rest).mid.b)
 (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,_,_⟩ := frame_reduced rest
 have h := third_tail_low_lc53D n (frame rest).mid.b (frame rest).mid.a j
   hc (by omega) hch hj hn
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

theorem source_third_tail_high53D (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hc : 4 ≤ (frame rest).mid.b) (hch : (frame rest).mid.b ≤ 2*(frame rest).mid.a)
 (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨_,hr,_⟩ := frame_reduced rest
 have h := third_tail_high_lc53D n (frame rest).mid.b (frame rest).mid.a j
   hc (by omega) hch hj hn
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms source_third_tail_low53D
#print axioms source_third_tail_high53D

end
end MathGKM.Markov
