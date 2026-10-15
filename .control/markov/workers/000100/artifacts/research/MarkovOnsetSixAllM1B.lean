import MarkovOnsetSixSource0M1B
import MarkovOnsetSixSource1M1B
import MarkovOnsetSixSource2M1B
import MarkovOnsetSixSource3M1B
import MarkovOnsetSixSource4M1B
import MarkovOnsetSixSource5M1B
/-! Machine-authored 1b02dddc. All predecessor chambers, fourth lower tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_onset_sixM1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i : ℕ)
 (hs : i+(3*n+6)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+8)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+6)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+7)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_six0M1B n rest hn hc (by omega) (by omega) i hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_six1M1B n rest hn hc (by omega) (by omega) i hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_six2M1B n rest hn hc (by omega) (by omega) i hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_onset_six3M1B n rest hn hc (by omega) (by omega) i hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_onset_six4M1B n rest hn hc (by omega) (by omega) i hs
 · exact source_fourth_onset_six5M1B n rest hn hc (by omega) (by omega) i hs
end
end MathGKM.Markov
