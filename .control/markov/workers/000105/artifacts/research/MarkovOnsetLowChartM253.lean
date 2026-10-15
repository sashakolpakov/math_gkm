import MarkovOnsetScalarM253
import MarkovOnsetLowValue1M253
import MarkovOnsetLowValue2M253
import MarkovOnsetLowValue3M253
import MarkovOnsetLowValue4M253
import MarkovOnsetLowValue5M253
import MarkovOnsetLowValue6M253
import MarkovOnsetLowValue7M253
import MarkovOnsetLowGap1M253
import MarkovOnsetLowGap2M253
import MarkovOnsetLowGap3M253
import MarkovOnsetLowGap4M253
import MarkovOnsetLowGap5M253
/-! Machine-authored request 2532cf40. Exact onset chart assembly. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] middleShape0M722 middleShape3M722

def onsetLowValueM253 (N C R : ℤ) (k : ℕ) : ℤ :=
 match k with
 | 1 => onsetLowV1M253 N C R
 | 2 => onsetLowV2M253 N C R
 | 3 => onsetLowV3M253 N C R
 | 4 => onsetLowV4M253 N C R
 | 5 => onsetLowV5M253 N C R
 | 6 => onsetLowV6M253 N C R
 | 7 => onsetLowV7M253 N C R
 | _ => 0

theorem onsetLow_valueM253 (N C R : ℤ) (k : ℕ) (hk : 1≤k) (hku : k≤7) :
 onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) k=onsetLowValueM253 N C R k := by
 interval_cases k
 · exact onsetLow_value1M253 N C R
 · exact onsetLow_value2M253 N C R
 · exact onsetLow_value3M253 N C R
 · exact onsetLow_value4M253 N C R
 · exact onsetLow_value5M253 N C R
 · exact onsetLow_value6M253 N C R
 · exact onsetLow_value7M253 N C R

theorem onsetLow_chartM253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) k*onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) (k+2) ≤ (onsetScalarLowM253 (N+7) (2*R+C+5) (R+2) (0) (k+1))^2 := by
 rw [onsetLow_valueM253 N C R k hk (by omega),onsetLow_valueM253 N C R (k+2) (by omega) (by omega),onsetLow_valueM253 N C R (k+1) (by omega) (by omega)]
 interval_cases k
 · exact onsetLow_lc1M253 N C R hN hC hR
 · exact onsetLow_lc2M253 N C R hN hC hR
 · exact onsetLow_lc3M253 N C R hN hC hR
 · exact onsetLow_lc4M253 N C R hN hC hR
 · exact onsetLow_lc5M253 N C R hN hC hR
end
end MathGKM.Markov
