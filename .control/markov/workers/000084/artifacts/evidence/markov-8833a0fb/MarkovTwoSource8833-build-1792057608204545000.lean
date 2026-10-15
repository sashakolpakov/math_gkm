import MarkovTwoCoefficients8833
import MarkovTwoBandsSource07F1
import MarkovSmallAllFD
import MarkovThirdTwoThirds8BBB
/-! Machine-authored 8833a0fb. Entire third lower slice for two-cycle sources. -/
namespace MathGKM.Markov
noncomputable section

theorem two_tail_lc18833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 2 1).coeff (2*n+1)*
 (correctedThirdRun8BBB n 2 1).coeff (2*n+3) ≤
 ((correctedThirdRun8BBB n 2 1).coeff (2*n+2))^2 := by
 rw [two_tail_coeff18833 n hn,two_tail_coeff28833 n hn,two_tail_coeff38833 n hn]
 have h : (4:ℤ) ≤ n := by exact_mod_cast hn
 nlinarith [sq_nonneg ((n:ℤ)-4)]

theorem two_tail_lc28833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 2 1).coeff (2*n+2)*
 (correctedThirdRun8BBB n 2 1).coeff (2*n+4) ≤
 ((correctedThirdRun8BBB n 2 1).coeff (2*n+3))^2 := by
 rw [two_tail_coeff28833 n hn,two_tail_coeff38833 n hn,two_tail_coeff48833 n hn]
 have h : (4:ℤ) ≤ n := by exact_mod_cast hn
 nlinarith [sq_nonneg ((n:ℤ)-4)]

theorem source_third_two_long8833 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 4 ≤ n) (hc : (frame rest).mid.b=2)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hj : j ≤ 2*n
 · exact source_third_two_bands07F1 n rest i j hn hj hs
 · obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   have hr' : (frame rest).mid.a=1 := by omega
   have hs' := hs
   rw [ha,hc,hr'] at hs'
   have hh : (correctedThirdRun8BBB n 2 1).coeff j*
     (correctedThirdRun8BBB n 2 1).coeff (j+2) ≤
     ((correctedThirdRun8BBB n 2 1).coeff (j+1))^2 := by
     have he : j=2*n+1 ∨ j=2*n+2 := by omega
     rcases he with he | he <;> subst j
     · convert two_tail_lc18833 n hn using 1 <;> congr 2 <;> omega
     · convert two_tail_lc28833 n hn using 1 <;> congr 2 <;> omega
   rw [←hc,←hr'] at hh
   rw [←source_third_all_cycles_raw8BBB n rest (i+2) j (by omega),
     ←source_third_all_cycles_raw8BBB n rest i (j+2) (by omega),
     ←source_third_all_cycles_raw8BBB n rest (i+1) (j+1) (by omega)] at hh
   nlinarith only [hh]

theorem source_third_two8833 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hc : (frame rest).mid.b=2)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hn : 4 ≤ n
 · exact source_third_two_long8833 n rest i j hn hc hs
 · interval_cases n
   · simpa using source_false_third_diagonalADB2 rest i j hs hp
   · exact source_third_one8BBB rest i j hs
   · exact source_third_small_allFD 2 rest i j (Or.inl rfl) hs hp
   · exact source_third_small_allFD 3 rest i j (Or.inr rfl) hs hp

end
end MathGKM.Markov
