import MarkovOnsetAdapter0M00
import MarkovOnsetAdapter1M00
import MarkovOnsetAdapter2M00
import MarkovOnsetAdapter3M00
import MarkovFourthFinalSixM1B
/-! Machine-authored 00a02b28. Source theorem for the four validated chambers. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_onset_lowM00 (n k : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hlo : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hk : 1≤k) (hkn : k≤6)
 (hs : i+(3*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+k+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_chamber0M00 n k rest hn hc (by omega) (by omega) i hk hkn hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_chamber1M00 n k rest hn hc (by omega) (by omega) i hk hkn hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_chamber2M00 n k rest hn hc (by omega) (by omega) i hk hkn hs
 · exact source_fourth_onset_chamber3M00 n k rest hn hc (by omega) (by omega) i hk hkn hs

theorem source_fourth_after_middle_lowM00 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hlo : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i j : ℕ)
 (hj : 3*n<j) (hu : j≤4*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hh : 3*n+6≤j
 · exact source_fourth_final_sixM1B n rest hn hc i j hh hu hs
 · have h := source_fourth_onset_lowM00 n (j-3*n) rest hn hc hlo i
     (by omega) (by omega) (by omega)
   simpa only [show 3*n+(j-3*n)=j by omega] using h
end
end MathGKM.Markov
