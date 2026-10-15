import MarkovCycleAssembly41MCFC
import MarkovCycleShortTail41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem source_cycle_fourth_ge_four41MCFC (n : ℕ) (rest : List Bool)
 (hn4 : 4≤n) (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=1) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hn : 7≤n
 · exact source_cycle_fourth_ge_seven41MCFC n rest hn hc hr i j hs
 have ha := (source_run_indicesBF n rest).1
 rw [hc,hr] at ha
 have hj : j≤4*n+3 := by omega
 have h : smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
   have hn6 : n≤6 := by omega
   interval_cases n
   · exact cycle_short_41_4MCFC j (by omega)
   · exact cycle_short_41_5MCFC j (by omega)
   · exact cycle_short_41_6MCFC j (by omega)
 rw [←source_small_value41MCFC n rest hc hr (i+2) j (by omega),
  ←source_small_value41MCFC n rest hc hr i (j+2) (by omega),
  ←source_small_value41MCFC n rest hc hr (i+1) (j+1) (by omega)] at h
 nlinarith only [h]
end
end MathGKM.Markov
