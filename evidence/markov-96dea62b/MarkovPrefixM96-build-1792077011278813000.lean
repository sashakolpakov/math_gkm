import MarkovOnsetSourceM96
import MarkovFirstShiftCC
import MarkovBlockSmallM042
/-! Machine-authored 96dea62b. A contiguous raw fourth-slice prefix, retaining zeros. -/
namespace MathGKM.Markov
noncomputable section
theorem source_fourth_prefixM96 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hn : 4≤n) (i j : ℕ)
 (hj : j≤n+4 ∨ (frame rest).mid.a≤3 ∧ j≤2*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hlt : j<n
 · exact source_fourth_initial_allF2 n rest hc i j hs hlt
 by_cases he : j=n
 · subst j
   exact source_fourth_first_shiftCC n rest hc hn i hs
 have hnk : n+(j-n)=j := by omega
 by_cases hk : j-n≤4
 · have h := source_fourth_onsetM96 n rest hc hn i (j-n) (by omega) hk (by omega)
   simpa only [hnk] using h
 · have hr : (frame rest).mid.a≤3 := by omega
   have h := source_fourth_block_smallM042 n rest hc hr i (j-n) (by omega) (by omega) (by omega)
   simpa only [hnk] using h
end
end MathGKM.Markov
