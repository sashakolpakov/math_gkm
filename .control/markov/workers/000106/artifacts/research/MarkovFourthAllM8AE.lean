import MarkovMiddleSourceM8AE
import MarkovFourthCentralM253
/-! Machine-authored request 8ae35b59. Full fourth slice in the specified run range. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem run_fourth_allM8AE (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 apply (run_fourth_iff_centralM253 n rest hn hc).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_middleM8AE n rest hc i j hj hju hs
end
end MathGKM.Markov
