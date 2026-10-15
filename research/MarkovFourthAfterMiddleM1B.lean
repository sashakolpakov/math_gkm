import MarkovOnsetAllM1B
import MarkovFourthFinalM94
/-! Machine-authored 1b02dddc. Fourth lower-slice final interval for n≥7. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_after_middleM1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hj : 3*n<j) (hu : j≤4*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hh : 3*n+7≤j
 · exact source_fourth_finalM94 n rest hc i j hh hu hs
 · have h := source_fourth_onsetM1B n (j-3*n) rest hn hc i
     (by omega) (by omega) (by omega)
   simpa only [show 3*n+(j-3*n)=j by omega] using h
end
end MathGKM.Markov
