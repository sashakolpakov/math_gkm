import MarkovOnsetScalarM253
import MarkovOnsetTopValue1M253
import MarkovOnsetTopValue2M253
import MarkovOnsetTopValue3M253
import MarkovOnsetTopValue4M253
import MarkovOnsetTopValue5M253
import MarkovOnsetTopValue6M253
import MarkovOnsetTopValue7M253
import MarkovOnsetTopGap1M253
import MarkovOnsetTopGap2M253
import MarkovOnsetTopGap3M253
import MarkovOnsetTopGap4M253
import MarkovOnsetTopGap5M253
/-! Machine-authored request 2532cf40. Exact onset chart assembly. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] middleShape0M722 middleShape3M722

def onsetTopValueM253 (N R : ℤ) (k : ℕ) : ℤ :=
 match k with
 | 1 => onsetTopV1M253 N R
 | 2 => onsetTopV2M253 N R
 | 3 => onsetTopV3M253 N R
 | 4 => onsetTopV4M253 N R
 | 5 => onsetTopV5M253 N R
 | 6 => onsetTopV6M253 N R
 | 7 => onsetTopV7M253 N R
 | _ => 0

theorem onsetTop_valueM253 (N R : ℤ) (k : ℕ) (hk : 1≤k) (hku : k≤7) :
 onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) k=onsetTopValueM253 N R k := by
 interval_cases k
 · exact onsetTop_value1M253 N R
 · exact onsetTop_value2M253 N R
 · exact onsetTop_value3M253 N R
 · exact onsetTop_value4M253 N R
 · exact onsetTop_value5M253 N R
 · exact onsetTop_value6M253 N R
 · exact onsetTop_value7M253 N R

theorem onsetTop_chartM253 (N R : ℤ) (hN : 0≤N) (hR : 0≤R) (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) k*onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) (k+2) ≤ (onsetScalarHighM253 (N+7) (R+5) (R+4) (R+3) (k+1))^2 := by
 rw [onsetTop_valueM253 N R k hk (by omega),onsetTop_valueM253 N R (k+2) (by omega) (by omega),onsetTop_valueM253 N R (k+1) (by omega) (by omega)]
 interval_cases k
 · exact onsetTop_lc1M253 N R hN hR
 · exact onsetTop_lc2M253 N R hN hR
 · exact onsetTop_lc3M253 N R hN hR
 · exact onsetTop_lc4M253 N R hN hR
 · exact onsetTop_lc5M253 N R hN hR
end
end MathGKM.Markov
