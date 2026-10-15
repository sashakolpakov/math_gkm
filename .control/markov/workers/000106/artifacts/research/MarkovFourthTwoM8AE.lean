import MarkovMiddleTwoSourceM8AE
import MarkovFourthCentralM253
/-! Machine-authored 8ae35b59. Top-predecessor fourth slice; exact scope. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem run_fourth_twoM8AE (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hr : (frame rest).mid.a=2) : RunFourthLCM94 n rest := by
 apply (run_fourth_iff_centralM253 n rest hn hc).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_middle_twoM8AE n rest hc hr i j hj hju hs
end
end MathGKM.Markov
