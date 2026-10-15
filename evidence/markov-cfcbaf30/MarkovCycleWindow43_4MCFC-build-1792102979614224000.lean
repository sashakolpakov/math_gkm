import MarkovSmallNumerator43MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint43_4_5MCFC (N x : ℤ) : ℤ := 967680

theorem cyclePoint43_4_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (4*n+5)=16*cyclePoint43_4_5MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (4*n+5) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (4*n+5) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+12) (by omega)
 push_cast at h2_12
 have h2_13 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+13) (by omega)
 push_cast at h2_13
 have h3_6 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+6) (by omega)
 push_cast at h3_6
 have h3_7 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+7) (by omega)
 push_cast at h3_7
 have h3_8 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+8) (by omega)
 push_cast at h3_8
 have h3_9 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+9) (by omega)
 push_cast at h3_9
 have h3_10 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+10) (by omega)
 push_cast at h3_10
 have h3_11 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+11) (by omega)
 push_cast at h3_11
 have h3_12 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+12) (by omega)
 push_cast at h3_12
 have h3_13 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+13) (by omega)
 push_cast at h3_13
 have h3_14 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+14) (by omega)
 push_cast at h3_14
 have h4_7 : chooseShiftSevenK0B (4*n+5) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (4*n+5) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (4*n+5) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (4*n+5) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (4*n+5) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (4*n+5) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (4*n+5) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (4*n+5) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (4*n+5) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12 + (smallTerm43_2_4MCFC (n:ℤ))*h2_4 + (smallTerm43_2_5MCFC (n:ℤ))*h2_5 + (smallTerm43_2_6MCFC (n:ℤ))*h2_6 + (smallTerm43_2_7MCFC (n:ℤ))*h2_7 + (smallTerm43_2_8MCFC (n:ℤ))*h2_8 + (smallTerm43_2_9MCFC (n:ℤ))*h2_9 + (smallTerm43_2_10MCFC (n:ℤ))*h2_10 + (smallTerm43_2_11MCFC (n:ℤ))*h2_11 + (smallTerm43_2_12MCFC (n:ℤ))*h2_12 + (smallTerm43_2_13MCFC (n:ℤ))*h2_13 + (smallTerm43_3_6MCFC (n:ℤ))*h3_6 + (smallTerm43_3_7MCFC (n:ℤ))*h3_7 + (smallTerm43_3_8MCFC (n:ℤ))*h3_8 + (smallTerm43_3_9MCFC (n:ℤ))*h3_9 + (smallTerm43_3_10MCFC (n:ℤ))*h3_10 + (smallTerm43_3_11MCFC (n:ℤ))*h3_11 + (smallTerm43_3_12MCFC (n:ℤ))*h3_12 + (smallTerm43_3_13MCFC (n:ℤ))*h3_13 + (smallTerm43_3_14MCFC (n:ℤ))*h3_14
 simp only [cyclePoint43_4_5MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_4_6MCFC (N x : ℤ) : ℤ := 120960

theorem cyclePoint43_4_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (4*n+6)=16*cyclePoint43_4_6MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (4*n+6) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (4*n+6) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+12) (by omega)
 push_cast at h2_12
 have h2_13 := chooseShiftSeven_fallingK0B (4*n+6) (2*n+13) (by omega)
 push_cast at h2_13
 have h3_6 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+6) (by omega)
 push_cast at h3_6
 have h3_7 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+7) (by omega)
 push_cast at h3_7
 have h3_8 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+8) (by omega)
 push_cast at h3_8
 have h3_9 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+9) (by omega)
 push_cast at h3_9
 have h3_10 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+10) (by omega)
 push_cast at h3_10
 have h3_11 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+11) (by omega)
 push_cast at h3_11
 have h3_12 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+12) (by omega)
 push_cast at h3_12
 have h3_13 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+13) (by omega)
 push_cast at h3_13
 have h3_14 := chooseShiftSeven_fallingK0B (4*n+6) (3*n+14) (by omega)
 push_cast at h3_14
 have h4_7 : chooseShiftSevenK0B (4*n+6) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (4*n+6) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (4*n+6) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (4*n+6) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (4*n+6) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (4*n+6) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (4*n+6) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (4*n+6) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (4*n+6) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12 + (smallTerm43_2_4MCFC (n:ℤ))*h2_4 + (smallTerm43_2_5MCFC (n:ℤ))*h2_5 + (smallTerm43_2_6MCFC (n:ℤ))*h2_6 + (smallTerm43_2_7MCFC (n:ℤ))*h2_7 + (smallTerm43_2_8MCFC (n:ℤ))*h2_8 + (smallTerm43_2_9MCFC (n:ℤ))*h2_9 + (smallTerm43_2_10MCFC (n:ℤ))*h2_10 + (smallTerm43_2_11MCFC (n:ℤ))*h2_11 + (smallTerm43_2_12MCFC (n:ℤ))*h2_12 + (smallTerm43_2_13MCFC (n:ℤ))*h2_13 + (smallTerm43_3_6MCFC (n:ℤ))*h3_6 + (smallTerm43_3_7MCFC (n:ℤ))*h3_7 + (smallTerm43_3_8MCFC (n:ℤ))*h3_8 + (smallTerm43_3_9MCFC (n:ℤ))*h3_9 + (smallTerm43_3_10MCFC (n:ℤ))*h3_10 + (smallTerm43_3_11MCFC (n:ℤ))*h3_11 + (smallTerm43_3_12MCFC (n:ℤ))*h3_12 + (smallTerm43_3_13MCFC (n:ℤ))*h3_13 + (smallTerm43_3_14MCFC (n:ℤ))*h3_14
 simp only [cyclePoint43_4_6MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_4_7MCFC (N x : ℤ) : ℤ := 7560

theorem cyclePoint43_4_7MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (4*n+7)=16*cyclePoint43_4_7MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (4*n+7) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (4*n+7) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+12) (by omega)
 push_cast at h2_12
 have h2_13 := chooseShiftSeven_fallingK0B (4*n+7) (2*n+13) (by omega)
 push_cast at h2_13
 have h3_6 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+6) (by omega)
 push_cast at h3_6
 have h3_7 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+7) (by omega)
 push_cast at h3_7
 have h3_8 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+8) (by omega)
 push_cast at h3_8
 have h3_9 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+9) (by omega)
 push_cast at h3_9
 have h3_10 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+10) (by omega)
 push_cast at h3_10
 have h3_11 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+11) (by omega)
 push_cast at h3_11
 have h3_12 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+12) (by omega)
 push_cast at h3_12
 have h3_13 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+13) (by omega)
 push_cast at h3_13
 have h3_14 := chooseShiftSeven_fallingK0B (4*n+7) (3*n+14) (by omega)
 push_cast at h3_14
 have h4_7 : chooseShiftSevenK0B (4*n+7) (4*n+7)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4*n+7)-(4*n+7)=0 by omega]
  norm_num [Nat.choose]
 have h4_8 : chooseShiftSevenK0B (4*n+7) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (4*n+7) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (4*n+7) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (4*n+7) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (4*n+7) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (4*n+7) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (4*n+7) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (4*n+7) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12 + (smallTerm43_2_4MCFC (n:ℤ))*h2_4 + (smallTerm43_2_5MCFC (n:ℤ))*h2_5 + (smallTerm43_2_6MCFC (n:ℤ))*h2_6 + (smallTerm43_2_7MCFC (n:ℤ))*h2_7 + (smallTerm43_2_8MCFC (n:ℤ))*h2_8 + (smallTerm43_2_9MCFC (n:ℤ))*h2_9 + (smallTerm43_2_10MCFC (n:ℤ))*h2_10 + (smallTerm43_2_11MCFC (n:ℤ))*h2_11 + (smallTerm43_2_12MCFC (n:ℤ))*h2_12 + (smallTerm43_2_13MCFC (n:ℤ))*h2_13 + (smallTerm43_3_6MCFC (n:ℤ))*h3_6 + (smallTerm43_3_7MCFC (n:ℤ))*h3_7 + (smallTerm43_3_8MCFC (n:ℤ))*h3_8 + (smallTerm43_3_9MCFC (n:ℤ))*h3_9 + (smallTerm43_3_10MCFC (n:ℤ))*h3_10 + (smallTerm43_3_11MCFC (n:ℤ))*h3_11 + (smallTerm43_3_12MCFC (n:ℤ))*h3_12 + (smallTerm43_3_13MCFC (n:ℤ))*h3_13 + (smallTerm43_3_14MCFC (n:ℤ))*h3_14
 simp only [cyclePoint43_4_7MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cycleWindowGap43_4_5MCFCCert (N Z x : ℤ) : ℤ := 7315660800

theorem cycleWindowGap43_4_5MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_4_5MCFC (N+7) 0)*(cyclePoint43_4_7MCFC (N+7) 0)≤(cyclePoint43_4_6MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_4_6MCFC (N+7) 0)^2-(cyclePoint43_4_5MCFC (N+7) 0)*(cyclePoint43_4_7MCFC (N+7) 0)=cycleWindowGap43_4_5MCFCCert N Z x := by
  unfold cycleWindowGap43_4_5MCFCCert cyclePoint43_4_5MCFC cyclePoint43_4_6MCFC cyclePoint43_4_7MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_4_5MCFCCert
 positivity
end
end MathGKM.Markov
