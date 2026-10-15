import MarkovOnsetHighChartM253
import MarkovOnsetHighSmall1M8B8
import MarkovOnsetHighSmall2M8B8
import MarkovOnsetHighSmall3M8B8
import MarkovOnsetHighSmall4M8B8
import MarkovOnsetHighSmall5M8B8
/-! Machine-authored request 8b851864. Raw onset inequality, reduced run bound. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff onsetScalarLowM253 onsetScalarHighM253
theorem onsetHigh_chartM8B8 (N C R : ℤ) (hN : -4≤N) (hC : 0≤C) (hR : 0≤R) (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) k*onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) (k+2) ≤ (onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) (k+1))^2 := by
 rw [onsetHigh_valueM253 N C R k hk (by omega),onsetHigh_valueM253 N C R (k+2) (by omega) (by omega),onsetHigh_valueM253 N C R (k+1) (by omega) (by omega)]
 interval_cases k
 · exact onsetHigh_lc1M8B8 N C R hN hC hR
 · exact onsetHigh_lc2M8B8 N C R hN hC hR
 · exact onsetHigh_lc3M8B8 N C R hN hC hR
 · exact onsetHigh_lc4M8B8 N C R hN hC hR
 · exact onsetHigh_lc5M8B8 N C R hN hC hR
end
end MathGKM.Markov
