import MarkovTwoSource8833
import MarkovThreeBridge8833
import MarkovThirdLargeFD
import MarkovPellRawLC0618
/-! Machine-authored 8833a0fb. Third lower diagonal for every source path.
This is one slice and one direction, not the pinned full conjecture. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 16384

theorem source_third_three_long8833 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 4 ≤ n) (hc : (frame rest).mid.b=3)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hcases : (frame rest).mid.a=1 ∨ (frame rest).mid.a=2 := by omega
 have hh : (correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff j*
   (correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff (j+2) ≤
   ((correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff (j+1))^2 := by
   have hs' := hs
   rw [ha,hc] at hs'
   rcases hcases with hr' | hr'
   · rw [hc,hr']
     exact three_lc_18833 n j hn (by omega)
   · rw [hc,hr']
     exact three_lc_28833 n j hn (by omega)
 rw [←source_third_all_cycles_raw8BBB n rest (i+2) j (by omega),
   ←source_third_all_cycles_raw8BBB n rest i (j+2) (by omega),
   ←source_third_all_cycles_raw8BBB n rest (i+1) (j+1) (by omega)] at hh
 nlinarith only [hh]

theorem source_third_mixed8833 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hn : 4 ≤ n
 · by_cases hc : 4 ≤ (frame rest).mid.b
   · exact source_third_ge_twoFD n rest i j (by omega) hc hs hp
   · obtain ⟨hr,hrc,_⟩ := frame_reduced rest
     have hh : (frame rest).mid.b=2 ∨ (frame rest).mid.b=3 := by omega
     rcases hh with hh | hh
     · exact source_third_two_long8833 n rest i j hn hh hs
     · exact source_third_three_long8833 n rest i j hn hh hs
 · interval_cases n
   · simpa using source_false_third_diagonalADB2 rest i j hs hp
   · exact source_third_one8BBB rest i j hs
   · exact source_third_small_allFD 2 rest i j (Or.inl rfl) hs hp
   · exact source_third_small_allFD 3 rest i j (Or.inr rfl) hs hp

theorem source_third_lower8833 (path : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame path).mid.a+3)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h1 h2
   exact right_raw_diagonal0618 n i j h0 h1 h2
 · subst path
   exact source_third_mixed8833 n rest i j hs h0

end
end MathGKM.Markov
