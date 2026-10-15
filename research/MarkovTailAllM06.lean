import MarkovTailSource0M06
import MarkovTailSource1M06
import MarkovTailSource2M06
import MarkovTailSource3M06
import MarkovTailSource4M06
import MarkovTailSource5M06
/-! Machine-authored 06b5b1f9. All predecessor chambers, fourth lower tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_tailM06 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i k : ℕ) (hk : k≤5)
 (hs : i+(4*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (4*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (4*n+k+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_tail_chamber0M06 n rest hn hc (by omega) (by omega) i k hk hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_tail_chamber1M06 n rest hn hc (by omega) (by omega) i k hk hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_tail_chamber2M06 n rest hn hc (by omega) (by omega) i k hk hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_tail_chamber3M06 n rest hn hc (by omega) (by omega) i k hk hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_tail_chamber4M06 n rest hn hc (by omega) (by omega) i k hk hs
 · exact source_fourth_tail_chamber5M06 n rest hn hc (by omega) (by omega) i k hk hs
end
end MathGKM.Markov
