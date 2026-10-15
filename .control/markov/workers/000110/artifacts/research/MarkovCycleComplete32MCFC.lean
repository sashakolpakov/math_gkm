import MarkovCycleAssembly32MCFC
import MarkovCycleShort32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem source_cycle_fourth_all32MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=2) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hn : 7≤n
 · exact source_cycle_fourth_ge_seven32MCFC n rest hn hc hr i j hs
 have ha := (source_run_indicesBF n rest).1
 rw [hc,hr] at ha
 have hj : j≤3*n+4 := by omega
 have h := cycle_short_value_lc32MCFC n j (by omega) hj
 rw [←source_small_value32MCFC n rest hc hr (i+2) j (by omega),
  ←source_small_value32MCFC n rest hc hr i (j+2) (by omega),
  ←source_small_value32MCFC n rest hc hr (i+1) (j+1) (by omega)] at h
 nlinarith only [h]
end
end MathGKM.Markov
