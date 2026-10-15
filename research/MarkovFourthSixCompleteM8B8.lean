import MarkovFinalSixChamber0M8B8
import MarkovFinalSixChamber1M8B8
import MarkovFinalSixChamber2M8B8
import MarkovFinalSixChamber3M8B8
import MarkovFinalSixChamber4M8B8
import MarkovFinalSixChamber5M8B8
import MarkovFourthShortResidualM8B8
/-! Machine-authored request 8b851864. Whole fourth lower slice for n>=6, c>=5. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_finalSixM8B8 (k : ℕ) (rest : List Bool) (hc : 5≤(frame rest).mid.b) (i : ℕ) (hk : 1≤k) (hkn : k≤6)
 (hs : i+(18+k)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+k+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+k)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+k+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalSix_chamber0M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalSix_chamber1M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_finalSix_chamber2M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_finalSix_chamber3M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_finalSix_chamber4M8B8 rest hc (by omega) (by omega) i k hk hkn hs
 · exact source_finalSix_chamber5M8B8 rest hc (by omega) (by omega) i k hk hkn hs

theorem run_fourth_sixM8B8 (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 6 rest := by
 apply (run_fourth_iff_shortM8B8 6 rest (by omega) hc).mpr
 intro i j h0 h1 h2 hs hj hm hju
 have h := source_finalSixM8B8 (j-18) rest hc i (by omega) (by omega) (by omega)
 simpa only [show 18+(j-18)=j by omega] using h

theorem run_fourth_ge_sixM8B8 (n : ℕ) (rest : List Bool)
 (hn : 6≤n) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 by_cases h : 7≤n
 · exact run_fourth_allM8B8 n rest h hc
 · have he : n=6 := by omega
   subst n
   exact run_fourth_sixM8B8 rest hc
end
end MathGKM.Markov
