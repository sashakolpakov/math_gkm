import MarkovOnsetTopChartM253
import MarkovOnsetTopSmall1M8B8
import MarkovOnsetTopSmall2M8B8
import MarkovOnsetTopSmall3M8B8
import MarkovOnsetTopSmall4M8B8
import MarkovOnsetTopSmall5M8B8
/-! Machine-authored request 8b851864. Raw onset inequality, reduced run bound. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff onsetScalarLowM253 onsetScalarHighM253
theorem onsetTop_chartM8B8 (N R : ℤ) (hN : -4≤N) (hR : 0≤R) (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) k*onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) (k+2) ≤ (onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) (k+1))^2 := by
 rw [onsetTop_valueM253 N R k hk (by omega),onsetTop_valueM253 N R (k+2) (by omega) (by omega),onsetTop_valueM253 N R (k+1) (by omega) (by omega)]
 interval_cases k
 · exact onsetTop_lc1M8B8 N R hN hR
 · exact onsetTop_lc2M8B8 N R hN hR
 · exact onsetTop_lc3M8B8 N R hN hR
 · exact onsetTop_lc4M8B8 N R hN hR
 · exact onsetTop_lc5M8B8 N R hN hR
end
end MathGKM.Markov
