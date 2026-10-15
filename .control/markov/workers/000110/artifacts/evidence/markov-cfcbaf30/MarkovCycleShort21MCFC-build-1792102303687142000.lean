import MarkovSmallNumerator21MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

theorem cycle_short_21_0MCFC (j : ℕ) (hj : j≤3) :
 smallValue21MCFC 0 j*smallValue21MCFC 0 (j+2) ≤ smallValue21MCFC 0 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_21_1MCFC (j : ℕ) (hj : j≤5) :
 smallValue21MCFC 1 j*smallValue21MCFC 1 (j+2) ≤ smallValue21MCFC 1 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_21_2MCFC (j : ℕ) (hj : j≤7) :
 smallValue21MCFC 2 j*smallValue21MCFC 2 (j+2) ≤ smallValue21MCFC 2 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_21_3MCFC (j : ℕ) (hj : j≤9) :
 smallValue21MCFC 3 j*smallValue21MCFC 3 (j+2) ≤ smallValue21MCFC 3 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_21_4MCFC (j : ℕ) (hj : j≤11) :
 smallValue21MCFC 4 j*smallValue21MCFC 4 (j+2) ≤ smallValue21MCFC 4 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_21_5MCFC (j : ℕ) (hj : j≤13) :
 smallValue21MCFC 5 j*smallValue21MCFC 5 (j+2) ≤ smallValue21MCFC 5 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_21_6MCFC (j : ℕ) (hj : j≤15) :
 smallValue21MCFC 6 j*smallValue21MCFC 6 (j+2) ≤ smallValue21MCFC 6 (j+1)^2 := by
 interval_cases j <;> norm_num [smallValue21MCFC,chooseShiftSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC,Nat.choose_eq_factorial_div_factorial,Nat.factorial]

theorem cycle_short_value_lc21MCFC (n j : ℕ) (hn : n<7) (hj : j≤2*n+3) :
 smallValue21MCFC n j*smallValue21MCFC n (j+2) ≤ smallValue21MCFC n (j+1)^2 := by
 interval_cases n
 · exact cycle_short_21_0MCFC j (by omega)
 · exact cycle_short_21_1MCFC j (by omega)
 · exact cycle_short_21_2MCFC j (by omega)
 · exact cycle_short_21_3MCFC j (by omega)
 · exact cycle_short_21_4MCFC j (by omega)
 · exact cycle_short_21_5MCFC j (by omega)
 · exact cycle_short_21_6MCFC j (by omega)
end
end MathGKM.Markov
