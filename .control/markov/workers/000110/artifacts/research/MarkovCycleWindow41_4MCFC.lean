import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint41_4_3MCFC (N x : ℤ) : ℤ := 967680

theorem cyclePoint41_4_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (4*n+3)=16*cyclePoint41_4_3MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (4*n+3) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (4*n+3) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+3) (by omega)
 push_cast at h2_3
 have h2_4 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (4*n+3) (2*n+12) (by omega)
 push_cast at h2_12
 have h3_4 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+4) (by omega)
 push_cast at h3_4
 have h3_5 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+5) (by omega)
 push_cast at h3_5
 have h3_6 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+6) (by omega)
 push_cast at h3_6
 have h3_7 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+7) (by omega)
 push_cast at h3_7
 have h3_8 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+8) (by omega)
 push_cast at h3_8
 have h3_9 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+9) (by omega)
 push_cast at h3_9
 have h3_10 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+10) (by omega)
 push_cast at h3_10
 have h3_11 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+11) (by omega)
 push_cast at h3_11
 have h3_12 := chooseShiftSeven_fallingK0B (4*n+3) (3*n+12) (by omega)
 push_cast at h3_12
 have h4_5 : chooseShiftSevenK0B (4*n+3) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (4*n+3) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (4*n+3) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (4*n+3) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (4*n+3) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (4*n+3) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (4*n+3) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (4*n+3) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (4*n+3) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12 + (smallTerm41_2_3MCFC (n:ℤ))*h2_3 + (smallTerm41_2_4MCFC (n:ℤ))*h2_4 + (smallTerm41_2_5MCFC (n:ℤ))*h2_5 + (smallTerm41_2_6MCFC (n:ℤ))*h2_6 + (smallTerm41_2_7MCFC (n:ℤ))*h2_7 + (smallTerm41_2_8MCFC (n:ℤ))*h2_8 + (smallTerm41_2_9MCFC (n:ℤ))*h2_9 + (smallTerm41_2_10MCFC (n:ℤ))*h2_10 + (smallTerm41_2_11MCFC (n:ℤ))*h2_11 + (smallTerm41_2_12MCFC (n:ℤ))*h2_12 + (smallTerm41_3_4MCFC (n:ℤ))*h3_4 + (smallTerm41_3_5MCFC (n:ℤ))*h3_5 + (smallTerm41_3_6MCFC (n:ℤ))*h3_6 + (smallTerm41_3_7MCFC (n:ℤ))*h3_7 + (smallTerm41_3_8MCFC (n:ℤ))*h3_8 + (smallTerm41_3_9MCFC (n:ℤ))*h3_9 + (smallTerm41_3_10MCFC (n:ℤ))*h3_10 + (smallTerm41_3_11MCFC (n:ℤ))*h3_11 + (smallTerm41_3_12MCFC (n:ℤ))*h3_12
 simp only [cyclePoint41_4_3MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_4_4MCFC (N x : ℤ) : ℤ := 120960

theorem cyclePoint41_4_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (4*n+4)=16*cyclePoint41_4_4MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (4*n+4) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (4*n+4) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+3) (by omega)
 push_cast at h2_3
 have h2_4 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (4*n+4) (2*n+12) (by omega)
 push_cast at h2_12
 have h3_4 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+4) (by omega)
 push_cast at h3_4
 have h3_5 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+5) (by omega)
 push_cast at h3_5
 have h3_6 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+6) (by omega)
 push_cast at h3_6
 have h3_7 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+7) (by omega)
 push_cast at h3_7
 have h3_8 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+8) (by omega)
 push_cast at h3_8
 have h3_9 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+9) (by omega)
 push_cast at h3_9
 have h3_10 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+10) (by omega)
 push_cast at h3_10
 have h3_11 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+11) (by omega)
 push_cast at h3_11
 have h3_12 := chooseShiftSeven_fallingK0B (4*n+4) (3*n+12) (by omega)
 push_cast at h3_12
 have h4_5 : chooseShiftSevenK0B (4*n+4) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (4*n+4) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (4*n+4) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (4*n+4) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (4*n+4) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (4*n+4) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (4*n+4) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (4*n+4) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (4*n+4) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12 + (smallTerm41_2_3MCFC (n:ℤ))*h2_3 + (smallTerm41_2_4MCFC (n:ℤ))*h2_4 + (smallTerm41_2_5MCFC (n:ℤ))*h2_5 + (smallTerm41_2_6MCFC (n:ℤ))*h2_6 + (smallTerm41_2_7MCFC (n:ℤ))*h2_7 + (smallTerm41_2_8MCFC (n:ℤ))*h2_8 + (smallTerm41_2_9MCFC (n:ℤ))*h2_9 + (smallTerm41_2_10MCFC (n:ℤ))*h2_10 + (smallTerm41_2_11MCFC (n:ℤ))*h2_11 + (smallTerm41_2_12MCFC (n:ℤ))*h2_12 + (smallTerm41_3_4MCFC (n:ℤ))*h3_4 + (smallTerm41_3_5MCFC (n:ℤ))*h3_5 + (smallTerm41_3_6MCFC (n:ℤ))*h3_6 + (smallTerm41_3_7MCFC (n:ℤ))*h3_7 + (smallTerm41_3_8MCFC (n:ℤ))*h3_8 + (smallTerm41_3_9MCFC (n:ℤ))*h3_9 + (smallTerm41_3_10MCFC (n:ℤ))*h3_10 + (smallTerm41_3_11MCFC (n:ℤ))*h3_11 + (smallTerm41_3_12MCFC (n:ℤ))*h3_12
 simp only [cyclePoint41_4_4MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_4_5MCFC (N x : ℤ) : ℤ := 7560

theorem cyclePoint41_4_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (4*n+5)=16*cyclePoint41_4_5MCFC n j := by
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
 have h2_3 := chooseShiftSeven_fallingK0B (4*n+5) (2*n+3) (by omega)
 push_cast at h2_3
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
 have h3_4 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+4) (by omega)
 push_cast at h3_4
 have h3_5 := chooseShiftSeven_fallingK0B (4*n+5) (3*n+5) (by omega)
 push_cast at h3_5
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
 have h4_5 : chooseShiftSevenK0B (4*n+5) (4*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4*n+5)-(4*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h4_6 : chooseShiftSevenK0B (4*n+5) (4*n+6)=0 := by
  exact if_neg (by omega)
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
 unfold smallValue41MCFC
 rw [h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12 + (smallTerm41_2_3MCFC (n:ℤ))*h2_3 + (smallTerm41_2_4MCFC (n:ℤ))*h2_4 + (smallTerm41_2_5MCFC (n:ℤ))*h2_5 + (smallTerm41_2_6MCFC (n:ℤ))*h2_6 + (smallTerm41_2_7MCFC (n:ℤ))*h2_7 + (smallTerm41_2_8MCFC (n:ℤ))*h2_8 + (smallTerm41_2_9MCFC (n:ℤ))*h2_9 + (smallTerm41_2_10MCFC (n:ℤ))*h2_10 + (smallTerm41_2_11MCFC (n:ℤ))*h2_11 + (smallTerm41_2_12MCFC (n:ℤ))*h2_12 + (smallTerm41_3_4MCFC (n:ℤ))*h3_4 + (smallTerm41_3_5MCFC (n:ℤ))*h3_5 + (smallTerm41_3_6MCFC (n:ℤ))*h3_6 + (smallTerm41_3_7MCFC (n:ℤ))*h3_7 + (smallTerm41_3_8MCFC (n:ℤ))*h3_8 + (smallTerm41_3_9MCFC (n:ℤ))*h3_9 + (smallTerm41_3_10MCFC (n:ℤ))*h3_10 + (smallTerm41_3_11MCFC (n:ℤ))*h3_11 + (smallTerm41_3_12MCFC (n:ℤ))*h3_12
 simp only [cyclePoint41_4_5MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleWindowGap41_4_3MCFCCert (N Z x : ℤ) : ℤ := 7315660800

theorem cycleWindowGap41_4_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_4_3MCFC (N+7) 0)*(cyclePoint41_4_5MCFC (N+7) 0)≤(cyclePoint41_4_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_4_4MCFC (N+7) 0)^2-(cyclePoint41_4_3MCFC (N+7) 0)*(cyclePoint41_4_5MCFC (N+7) 0)=cycleWindowGap41_4_3MCFCCert N Z x := by
  unfold cycleWindowGap41_4_3MCFCCert cyclePoint41_4_3MCFC cyclePoint41_4_4MCFC cyclePoint41_4_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_4_3MCFCCert
 positivity
end
end MathGKM.Markov
