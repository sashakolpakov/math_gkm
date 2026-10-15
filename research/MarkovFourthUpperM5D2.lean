import MarkovMiddleSourceM5D2
import MarkovFourthAfterMiddleM722
/-! Machine-authored request 722898f8. Assembly remains conditional on compiled imports. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_upperM5D2 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hj : 2*n+6≤j) (hu : j≤4*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hmid : j≤3*n
 · exact source_fourth_middleM5D2 n rest hc i j hj hmid hs
 · exact source_fourth_after_middleM722 n rest hn hc i j (by omega) hu hs
end
end MathGKM.Markov
