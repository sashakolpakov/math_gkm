import MarkovSmallLC3_0M38E
import MarkovSmallLC3_1M38E
import MarkovSmallLC3_2M38E
import MarkovSmallLC3_3M38E
import MarkovSmallLC3_4M38E
import MarkovSmallLC3_5M38E
import MarkovFourthFourCompleteM8B8
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
theorem source_fourth_run3M38E (rest : List Bool) (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 3 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 3 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 3 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 3 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_small_lc3_0M38E rest hc (by omega) (by omega) i j hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_small_lc3_1M38E rest hc (by omega) (by omega) i j hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_small_lc3_2M38E rest hc (by omega) (by omega) i j hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_small_lc3_3M38E rest hc (by omega) (by omega) i j hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_small_lc3_4M38E rest hc (by omega) (by omega) i j hs
 · exact source_small_lc3_5M38E rest hc (by omega) (by omega) i j hs

theorem run_fourth_3M38E (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 3 rest := by
 intro i j _ _ _ hs
 exact source_fourth_run3M38E rest hc i j hs
end
end MathGKM.Markov
