import MarkovOnsetLowChartM253
import MarkovOnsetLowSmall1M8B8
import MarkovOnsetLowSmall2M8B8
import MarkovOnsetLowSmall3M8B8
import MarkovOnsetLowSmall4M8B8
import MarkovOnsetLowSmall5M8B8
/-! Machine-authored request 8b851864. Raw onset inequality, reduced run bound. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff onsetScalarLowM253 onsetScalarHighM253
theorem onsetLow_chartM8B8 (N C R : ℤ) (hN : -4≤N) (hC : 0≤C) (hR : 0≤R) (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) k*onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) (k+2) ≤ (onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) (k+1))^2 := by
 rw [onsetLow_valueM253 N C R k hk (by omega),onsetLow_valueM253 N C R (k+2) (by omega) (by omega),onsetLow_valueM253 N C R (k+1) (by omega) (by omega)]
 interval_cases k
 · exact onsetLow_lc1M8B8 N C R hN hC hR
 · exact onsetLow_lc2M8B8 N C R hN hC hR
 · exact onsetLow_lc3M8B8 N C R hN hC hR
 · exact onsetLow_lc4M8B8 N C R hN hC hR
 · exact onsetLow_lc5M8B8 N C R hN hC hR
end
end MathGKM.Markov
