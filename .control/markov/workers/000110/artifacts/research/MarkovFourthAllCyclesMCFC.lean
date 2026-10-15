import MarkovCycleComplete21MCFC
import MarkovCycleComplete31MCFC
import MarkovCycleComplete32MCFC
import MarkovCycleGeFour41MCFC
import MarkovCycleGeFour43MCFC
import MarkovFourthGapM38E
/-! Machine-authored cfcbaf30. All remaining fourth lower slices; no root closure. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000

theorem source_fourth_all_gap_ge_twoMCFC (path : List Bool)
 (hgap : (frame path).mid.a+2 ≤ (frame path).mid.b)
 (hslope : 4*(frame path).mid.b < 5*(frame path).mid.a) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j)
 (hs : i+j+2=(frame path).mid.a+4) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases hbig : (frame path).mid.a+5 ≤ (frame path).mid.b
 · exact source_fourth_gap_ge_fiveM38E path hbig i j h0 h1 h2 hs
 obtain ⟨n,rest,hpath,hn,he⟩ := fourth_small_gap_parametersM38E path hgap (by omega) hslope
 subst path
 rcases he with ⟨hb,ha⟩ | ⟨hb,ha⟩ | ⟨hb,ha⟩ | ⟨hb,ha⟩ | ⟨hb,ha⟩
 · exact source_cycle_fourth_all21MCFC n rest hb ha i j hs
 · exact source_cycle_fourth_all31MCFC n rest hb ha i j hs
 · exact source_cycle_fourth_all32MCFC n rest hb ha i j hs
 · exact source_cycle_fourth_ge_four41MCFC n rest hn hb ha i j hs
 · exact source_cycle_fourth_ge_four43MCFC n rest hn hb ha i j hs
end
end MathGKM.Markov
