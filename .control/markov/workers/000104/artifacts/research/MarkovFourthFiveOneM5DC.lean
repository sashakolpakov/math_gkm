import MarkovFourthUpperOneM5DC
import MarkovFourthMiddleM94
/-! Machine-authored 722898f8. Exact residual fourth-slice interval for n≥7. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def RunFourthFiveOneM5DC (n : ℕ) (rest : List Bool) : Prop :=
 let m := (frame (List.replicate n true++false::rest)).mid
 ∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
  InPolygon m.a m.b (i+2) j → i+j+2=m.a+4 → 2*n<j → j≤2*n+5 →
  coeff m.p i (j+2)*coeff m.p (i+2) j≤coeff m.p (i+1) (j+1)^2

theorem run_fourth_iff_five_oneM5DC (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1) :
 RunFourthLCM94 n rest ↔ RunFourthFiveOneM5DC n rest := by
 constructor
 · intro h i j h0 h1 h2 hs _ _
   exact h i j h0 h1 h2 hs
 · intro h i j h0 h1 h2 hs
   by_cases hlo : j≤2*n
   · exact source_fourth_prefixM806 n rest hc (by omega) i j hlo hs
   by_cases hhi : 2*n+6≤j
   · exact source_fourth_upper_oneM5DC n rest hn hc hr i j hhi
      (source_fourth_polygon_boundM96 n rest i j hs h0) hs
   · exact h i j h0 h1 h2 hs (by omega) (by omega)
end
end MathGKM.Markov
