import MarkovFourthSixCompleteM8B8
import MarkovFinalFourChamber0M8B8
import MarkovFinalFourChamber1M8B8
import MarkovFinalFourChamber2M8B8
import MarkovFinalFourChamber3M8B8
import MarkovFinalFourChamber4M8B8
import MarkovFinalFourChamber5M8B8
import MarkovFinalFiveChamber0M8B8
import MarkovFinalFiveChamber1M8B8
import MarkovFinalFiveChamber2M8B8
import MarkovFinalFiveChamber3M8B8
import MarkovFinalFiveChamber4M8B8
import MarkovFinalFiveChamber5M8B8
/-! Machine-authored request 8b851864. Exact short-run final transition. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] frame coeff
theorem source_finalFourM8B8 (k : ℕ) (rest : List Bool) (hc : 5≤(frame rest).mid.b) (i : ℕ) (hk : 2≤k) (hkn : k≤6)
 (hs : i+(12+k)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+k+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+k)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+k+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalFour_chamber0M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalFour_chamber1M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalFour_chamber2M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_finalFour_chamber3M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_finalFour_chamber4M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 · exact source_finalFour_chamber5M8B8 rest hc (by omega) (by omega) i k hk hkn hs

theorem run_fourth_fourM8B8 (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 4 rest := by
 apply (run_fourth_iff_shortM8B8 4 rest (by omega) hc).mpr
 intro i j h0 h1 h2 hs hj hm hju
 have h := source_finalFourM8B8 (j-12) rest hc i (by omega) (by omega) (by omega)
 simpa only [show 12+(j-12)=j by omega] using h

theorem source_finalFiveM8B8 (k : ℕ) (rest : List Bool) (hc : 5≤(frame rest).mid.b) (i : ℕ) (hk : 1≤k) (hkn : k≤6)
 (hs : i+(15+k)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+k+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+k)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+k+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalFive_chamber0M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalFive_chamber1M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalFive_chamber2M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_finalFive_chamber3M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_finalFive_chamber4M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 · exact source_finalFive_chamber5M8B8 rest hc (by omega) (by omega) i k hk hkn hs

theorem run_fourth_fiveM8B8 (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 5 rest := by
 apply (run_fourth_iff_shortM8B8 5 rest (by omega) hc).mpr
 intro i j h0 h1 h2 hs hj hm hju
 have h := source_finalFiveM8B8 (j-15) rest hc i (by omega) (by omega) (by omega)
 simpa only [show 15+(j-15)=j by omega] using h

theorem run_fourth_ge_fourM8B8 (n : ℕ) (rest : List Bool)
 (hn : 4≤n) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 by_cases h : 6≤n
 · exact run_fourth_ge_sixM8B8 n rest h hc
 · have he : n=4 ∨ n=5 := by omega
   rcases he with he | he
   · subst n; exact run_fourth_fourM8B8 rest hc
   · subst n; exact run_fourth_fiveM8B8 rest hc
end
end MathGKM.Markov
