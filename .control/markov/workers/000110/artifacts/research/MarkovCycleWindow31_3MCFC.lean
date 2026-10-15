import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint31_3_2MCFC (N x : ℤ) : ℤ := (12700800*N + (-11672640))

theorem cyclePoint31_3_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (3*n+2)=16*cyclePoint31_3_2MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (3*n+2) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (3*n+2) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+3) (by omega)
 push_cast at h2_3
 have h2_4 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (3*n+2) (2*n+12) (by omega)
 push_cast at h2_12
 have h3_4 : chooseShiftSevenK0B (3*n+2) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (3*n+2) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (3*n+2) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (3*n+2) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (3*n+2) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (3*n+2) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (3*n+2) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (3*n+2) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (3*n+2) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (3*n+2) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12 + (smallTerm31_2_3MCFC (n:ℤ))*h2_3 + (smallTerm31_2_4MCFC (n:ℤ))*h2_4 + (smallTerm31_2_5MCFC (n:ℤ))*h2_5 + (smallTerm31_2_6MCFC (n:ℤ))*h2_6 + (smallTerm31_2_7MCFC (n:ℤ))*h2_7 + (smallTerm31_2_8MCFC (n:ℤ))*h2_8 + (smallTerm31_2_9MCFC (n:ℤ))*h2_9 + (smallTerm31_2_10MCFC (n:ℤ))*h2_10 + (smallTerm31_2_11MCFC (n:ℤ))*h2_11 + (smallTerm31_2_12MCFC (n:ℤ))*h2_12
 simp only [cyclePoint31_3_2MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_3_3MCFC (N x : ℤ) : ℤ := (2540160*N + (-1512000))

theorem cyclePoint31_3_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (3*n+3)=16*cyclePoint31_3_3MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (3*n+3) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (3*n+3) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+3) (by omega)
 push_cast at h2_3
 have h2_4 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (3*n+3) (2*n+12) (by omega)
 push_cast at h2_12
 have h3_4 : chooseShiftSevenK0B (3*n+3) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (3*n+3) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (3*n+3) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (3*n+3) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (3*n+3) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (3*n+3) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (3*n+3) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (3*n+3) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (3*n+3) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (3*n+3) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12 + (smallTerm31_2_3MCFC (n:ℤ))*h2_3 + (smallTerm31_2_4MCFC (n:ℤ))*h2_4 + (smallTerm31_2_5MCFC (n:ℤ))*h2_5 + (smallTerm31_2_6MCFC (n:ℤ))*h2_6 + (smallTerm31_2_7MCFC (n:ℤ))*h2_7 + (smallTerm31_2_8MCFC (n:ℤ))*h2_8 + (smallTerm31_2_9MCFC (n:ℤ))*h2_9 + (smallTerm31_2_10MCFC (n:ℤ))*h2_10 + (smallTerm31_2_11MCFC (n:ℤ))*h2_11 + (smallTerm31_2_12MCFC (n:ℤ))*h2_12
 simp only [cyclePoint31_3_3MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_3_4MCFC (N x : ℤ) : ℤ := (340200*N + (-98280))

theorem cyclePoint31_3_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (3*n+4)=16*cyclePoint31_3_4MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (3*n+4) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (3*n+4) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+3) (by omega)
 push_cast at h2_3
 have h2_4 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (3*n+4) (2*n+12) (by omega)
 push_cast at h2_12
 have h3_4 : chooseShiftSevenK0B (3*n+4) (3*n+4)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3*n+4)-(3*n+4)=0 by omega]
  norm_num [Nat.choose]
 have h3_5 : chooseShiftSevenK0B (3*n+4) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (3*n+4) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (3*n+4) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (3*n+4) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (3*n+4) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (3*n+4) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (3*n+4) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (3*n+4) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (3*n+4) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12 + (smallTerm31_2_3MCFC (n:ℤ))*h2_3 + (smallTerm31_2_4MCFC (n:ℤ))*h2_4 + (smallTerm31_2_5MCFC (n:ℤ))*h2_5 + (smallTerm31_2_6MCFC (n:ℤ))*h2_6 + (smallTerm31_2_7MCFC (n:ℤ))*h2_7 + (smallTerm31_2_8MCFC (n:ℤ))*h2_8 + (smallTerm31_2_9MCFC (n:ℤ))*h2_9 + (smallTerm31_2_10MCFC (n:ℤ))*h2_10 + (smallTerm31_2_11MCFC (n:ℤ))*h2_11 + (smallTerm31_2_12MCFC (n:ℤ))*h2_12
 simp only [cyclePoint31_3_4MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_3_5MCFC (N x : ℤ) : ℤ := (22680*N)

theorem cyclePoint31_3_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (3*n+5)=16*cyclePoint31_3_5MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (3*n+5) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (3*n+5) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+3) (by omega)
 push_cast at h2_3
 have h2_4 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (3*n+5) (2*n+12) (by omega)
 push_cast at h2_12
 have h3_4 : chooseShiftSevenK0B (3*n+5) (3*n+4)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3*n+5)-(3*n+4)=1 by omega]
  norm_num [Nat.choose]
 have h3_5 : chooseShiftSevenK0B (3*n+5) (3*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3*n+5)-(3*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h3_6 : chooseShiftSevenK0B (3*n+5) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (3*n+5) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (3*n+5) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (3*n+5) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (3*n+5) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (3*n+5) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (3*n+5) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (3*n+5) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12 + (smallTerm31_2_3MCFC (n:ℤ))*h2_3 + (smallTerm31_2_4MCFC (n:ℤ))*h2_4 + (smallTerm31_2_5MCFC (n:ℤ))*h2_5 + (smallTerm31_2_6MCFC (n:ℤ))*h2_6 + (smallTerm31_2_7MCFC (n:ℤ))*h2_7 + (smallTerm31_2_8MCFC (n:ℤ))*h2_8 + (smallTerm31_2_9MCFC (n:ℤ))*h2_9 + (smallTerm31_2_10MCFC (n:ℤ))*h2_10 + (smallTerm31_2_11MCFC (n:ℤ))*h2_11 + (smallTerm31_2_12MCFC (n:ℤ))*h2_12
 simp only [cyclePoint31_3_5MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleWindowGap31_3_2MCFCCert (N Z x : ℤ) : ℤ := ((2131600665600*N + 27380232230400)*N + 88352149939200)

theorem cycleWindowGap31_3_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_3_2MCFC (N+7) 0)*(cyclePoint31_3_4MCFC (N+7) 0)≤(cyclePoint31_3_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_3_3MCFC (N+7) 0)^2-(cyclePoint31_3_2MCFC (N+7) 0)*(cyclePoint31_3_4MCFC (N+7) 0)=cycleWindowGap31_3_2MCFCCert N Z x := by
  unfold cycleWindowGap31_3_2MCFCCert cyclePoint31_3_2MCFC cyclePoint31_3_3MCFC cyclePoint31_3_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_3_2MCFCCert
 positivity

def cycleWindowGap31_3_3MCFCCert (N Z x : ℤ) : ℤ := ((58125211200*N + 781175404800)*N + 2629751443200)

theorem cycleWindowGap31_3_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_3_3MCFC (N+7) 0)*(cyclePoint31_3_5MCFC (N+7) 0)≤(cyclePoint31_3_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_3_4MCFC (N+7) 0)^2-(cyclePoint31_3_3MCFC (N+7) 0)*(cyclePoint31_3_5MCFC (N+7) 0)=cycleWindowGap31_3_3MCFCCert N Z x := by
  unfold cycleWindowGap31_3_3MCFCCert cyclePoint31_3_3MCFC cyclePoint31_3_4MCFC cyclePoint31_3_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_3_3MCFCCert
 positivity
end
end MathGKM.Markov
