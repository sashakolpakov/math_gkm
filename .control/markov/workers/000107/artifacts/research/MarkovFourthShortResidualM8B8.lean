import MarkovFourthAllM8B8
import MarkovOnsetAllSmallM8B8
/-! Machine-authored request 8b851864. Exact short-run fourth-slice residual. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def RunFourthShortResidualM8B8 (n : ℕ) (rest : List Bool) : Prop :=
 let m := (frame (List.replicate n true++false::rest)).mid
 ∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
  InPolygon m.a m.b (i+2) j → i+j+2=m.a+4 →
  2*n+6≤j → 3*n<j → j≤3*n+6 →
  coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2

theorem run_fourth_iff_shortM8B8 (n : ℕ) (rest : List Bool)
 (hn : 4≤n) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 n rest ↔ RunFourthShortResidualM8B8 n rest := by
 constructor
 · intro h i j h0 h1 h2 hs _ _ _
   exact h i j h0 h1 h2 hs
 · intro h i j h0 h1 h2 hs
   by_cases hlo : j≤2*n
   · exact source_fourth_prefixM806 n rest hc hn i j hlo hs
   by_cases hon : j≤2*n+5
   · exact source_fourth_onsetM8B8 n rest hn hc i j (by omega) hon hs
   by_cases hmid : j≤3*n
   · exact source_fourth_middleM8B8 n rest hc i j (by omega) hmid hs
   by_cases htail : 3*n+7≤j
   · exact source_fourth_finalM94 n rest hc i j htail
       (source_fourth_polygon_boundM96 n rest i j hs h0) hs
   · exact h i j h0 h1 h2 hs (by omega) (by omega) (by omega)

theorem short_residual_boundsM8B8 (n j : ℕ) (hn : 4≤n) (hnu : n≤6)
 (hj : 2*n+6≤j) (hm : 3*n<j) (hju : j≤3*n+6) :
 (n=4 ∧ 14≤j ∧ j≤18) ∨ (n=5 ∧ 16≤j ∧ j≤21) ∨
 (n=6 ∧ 19≤j ∧ j≤24) := by omega
end
end MathGKM.Markov
