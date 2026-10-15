import MarkovOnsetAllM253
/-! Machine-authored request 2532cf40. Exact remaining fourth-slice interval. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def RunFourthCentralM253 (n : ℕ) (rest : List Bool) : Prop :=
 let m := (frame (List.replicate n true++false::rest)).mid
 ∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
  InPolygon m.a m.b (i+2) j → i+j+2=m.a+4 → 2*n+6≤j → j≤3*n →
  coeff m.p i (j+2)*coeff m.p (i+2) j≤coeff m.p (i+1) (j+1)^2

theorem run_fourth_iff_centralM253 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 n rest ↔ RunFourthCentralM253 n rest := by
 constructor
 · intro h i j h0 h1 h2 hs _ _
   exact h i j h0 h1 h2 hs
 · intro h i j h0 h1 h2 hs
   by_cases hlo : j≤2*n
   · exact source_fourth_prefixM806 n rest hc (by omega) i j hlo hs
   by_cases hon : j≤2*n+5
   · exact source_fourth_onsetM253 n rest hn hc i j (by omega) hon hs
   by_cases hmid : j≤3*n
   · exact h i j h0 h1 h2 hs (by omega) hmid
   · exact source_fourth_after_middleM722 n rest hn hc i j (by omega)
       (source_fourth_polygon_boundM96 n rest i j hs h0) hs
end
end MathGKM.Markov
