import MarkovOnsetScalarM253
import MarkovOnsetHighValue1M253
import MarkovOnsetHighValue2M253
import MarkovOnsetHighValue3M253
import MarkovOnsetHighValue4M253
import MarkovOnsetHighValue5M253
import MarkovOnsetHighValue6M253
import MarkovOnsetHighValue7M253
import MarkovOnsetHighGap1M253
import MarkovOnsetHighGap2M253
import MarkovOnsetHighGap3M253
import MarkovOnsetHighGap4M253
import MarkovOnsetHighGap5M253
/-! Machine-authored request 2532cf40. Exact onset chart assembly. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] middleShape0M722 middleShape3M722

def onsetHighValueM253 (N C R : ℤ) (k : ℕ) : ℤ :=
 match k with
 | 1 => onsetHighV1M253 N C R
 | 2 => onsetHighV2M253 N C R
 | 3 => onsetHighV3M253 N C R
 | 4 => onsetHighV4M253 N C R
 | 5 => onsetHighV5M253 N C R
 | 6 => onsetHighV6M253 N C R
 | 7 => onsetHighV7M253 N C R
 | _ => 0

theorem onsetHigh_valueM253 (N C R : ℤ) (k : ℕ) (hk : 1≤k) (hku : k≤7) :
 onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) k=onsetHighValueM253 N C R k := by
 interval_cases k
 · exact onsetHigh_value1M253 N C R
 · exact onsetHigh_value2M253 N C R
 · exact onsetHigh_value3M253 N C R
 · exact onsetHigh_value4M253 N C R
 · exact onsetHigh_value5M253 N C R
 · exact onsetHigh_value6M253 N C R
 · exact onsetHigh_value7M253 N C R

theorem onsetHigh_chartM253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) k*onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) (k+2) ≤ (onsetScalarHighM253 (N+7) (2*C+R+5) (C+R+3) (R+1) (k+1))^2 := by
 rw [onsetHigh_valueM253 N C R k hk (by omega),onsetHigh_valueM253 N C R (k+2) (by omega) (by omega),onsetHigh_valueM253 N C R (k+1) (by omega) (by omega)]
 interval_cases k
 · exact onsetHigh_lc1M253 N C R hN hC hR
 · exact onsetHigh_lc2M253 N C R hN hC hR
 · exact onsetHigh_lc3M253 N C R hN hC hR
 · exact onsetHigh_lc4M253 N C R hN hC hR
 · exact onsetHigh_lc5M253 N C R hN hC hR
end
end MathGKM.Markov
