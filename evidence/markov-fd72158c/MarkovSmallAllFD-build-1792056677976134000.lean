import MarkovSmallSourceFD
import MarkovSmallCycles2FD
import MarkovSmallCycles3FD
/-! Machine-authored fd72158c. Run lengths two and three, every source cycle. -/
namespace MathGKM.Markov
noncomputable section
theorem source_third_small_allFD (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : n=2 ∨ n=3)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 4 ≤ (frame rest).mid.b
 · exact source_third_smallFD n rest i j hn hc hs hp
 · obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   rcases hn with rfl | rfl
   · exact source_third_all_cycles_of_lc8BBB 2 rest
       (small_cycles_lc2FD _ _ (by omega) hr hrc) i j hs
   · exact source_third_all_cycles_of_lc8BBB 3 rest
       (small_cycles_lc3FD _ _ (by omega) hr hrc) i j hs

#print axioms source_third_small_allFD
end
end MathGKM.Markov
