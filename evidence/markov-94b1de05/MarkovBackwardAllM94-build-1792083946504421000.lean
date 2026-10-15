import MarkovBackwardAdapter0M94
import MarkovBackwardAdapter1M94
import MarkovBackwardAdapter2M94
import MarkovBackwardAdapter3M94
import MarkovBackwardAdapter4M94
import MarkovBackwardAdapter5M94
/-! Machine-authored 94b1de05. All predecessor chambers, fourth lower tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_thirdM94 (n k : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i : ℕ) (hk : 7≤k) (hkn : k≤n)
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
 · exact source_fourth_third_chamber0M94 n k rest hc (by omega) (by omega) i hk hkn hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_third_chamber1M94 n k rest hc (by omega) (by omega) i hk hkn hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_third_chamber2M94 n k rest hc (by omega) (by omega) i hk hkn hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_third_chamber3M94 n k rest hc (by omega) (by omega) i hk hkn hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_third_chamber4M94 n k rest hc (by omega) (by omega) i hk hkn hs
 · exact source_fourth_third_chamber5M94 n k rest hc (by omega) (by omega) i hk hkn hs
end
end MathGKM.Markov
