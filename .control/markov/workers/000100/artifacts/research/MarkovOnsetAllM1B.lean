import MarkovOnsetAdapter0M1B
import MarkovOnsetAdapter1M1B
import MarkovOnsetAdapter2M1B
import MarkovOnsetAdapter3M1B
import MarkovOnsetAdapter4M1B
import MarkovOnsetAdapter5M1B
/-! Machine-authored 1b02dddc. All predecessor chambers, fourth lower tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_onsetM1B (n k : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i : ℕ) (hk : 1≤k) (hkn : k≤6)
 (hs : i+(3*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+k+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_chamber0M1B n k rest hn hc (by omega) (by omega) i hk hkn hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_chamber1M1B n k rest hn hc (by omega) (by omega) i hk hkn hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_onset_chamber2M1B n k rest hn hc (by omega) (by omega) i hk hkn hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_onset_chamber3M1B n k rest hn hc (by omega) (by omega) i hk hkn hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_onset_chamber4M1B n k rest hn hc (by omega) (by omega) i hk hkn hs
 · exact source_fourth_onset_chamber5M1B n k rest hn hc (by omega) (by omega) i hk hkn hs
end
end MathGKM.Markov
