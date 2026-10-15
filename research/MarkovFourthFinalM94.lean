import MarkovBackwardAllM94
import MarkovTailAllM94
/-! Machine-authored 94b1de05. Complete final interval of the fourth lower slice. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_finalM94 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hj : 3*n+7≤j) (hu : j≤4*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases h : j≤4*n
 · have he : j=3*n+(j-3*n) := by omega
   rw [he] at hs ⊢
   exact source_fourth_thirdM94 n (j-3*n) rest hc i (by omega) (by omega) hs
 · have he : j=4*n+(j-4*n) := by omega
   rw [he] at hs ⊢
   exact source_fourth_tailM94 n (j-4*n) rest (by omega) hc i (by omega) hs
end
end MathGKM.Markov
