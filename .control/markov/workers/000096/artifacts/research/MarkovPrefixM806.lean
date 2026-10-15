import MarkovBlockSourceM806
import MarkovPrefixM96
/-! Machine-authored 8067e0c5. Raw fourth lower-slice prefix, retaining zeros. -/
namespace MathGKM.Markov
noncomputable section
theorem source_fourth_prefixM806 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hn : 4≤n) (i j : ℕ)
 (hj : j≤2*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hsmall : j≤n+4
 · exact source_fourth_prefixM96 n rest hc hn i j (Or.inl hsmall) hs
 · have hnk : n+(j-n)=j := by omega
   have h := source_fourth_blockM806 n rest hc i (j-n) (by omega) (by omega) (by omega)
   simpa only [hnk] using h
end
end MathGKM.Markov
