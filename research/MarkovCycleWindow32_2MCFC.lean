import MarkovSmallNumerator32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint32_2_2MCFC (N x : ℤ) : ℤ := (((((((4608*N + 94080)*N + 862848)*N + 4327680)*N + 11394432)*N + 15718080)*N + (-78608448))*N + 81648000)

theorem cyclePoint32_2_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (2*n+2)=16*cyclePoint32_2_2MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+2) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+2) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (2*n+2) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (2*n+2) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (2*n+2) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (2*n+2) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2*n+2) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+2) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+2) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+2) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+2) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2*n+2) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+2) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+2) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+2) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+2) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+2) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+2) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+2) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+2) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+2) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (2*n+2) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint32_2_2MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_2_3MCFC (N x : ℤ) : ℤ := (((((((4608*N + 69888)*N + 516096)*N + 2190720)*N + 5225472)*N + 6811392)*N + (-11794176))*N + 9374400)

theorem cyclePoint32_2_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (2*n+3)=16*cyclePoint32_2_3MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+3) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+3) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (2*n+3) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (2*n+3) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (2*n+3) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (2*n+3) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2*n+3) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+3) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+3) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+3) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+3) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2*n+3) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+3) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+3) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+3) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+3) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+3) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+3) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+3) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+3) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+3) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (2*n+3) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint32_2_3MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_2_4MCFC (N x : ℤ) : ℤ := (((((((4608*N + 45696)*N + 266112)*N + 940800)*N + 1959552)*N + 2370144)*N + (-446112))*N + 604800)

theorem cyclePoint32_2_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (2*n+4)=16*cyclePoint32_2_4MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+4) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+4) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (2*n+4) (2*n+4)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+4)-(2*n+4)=0 by omega]
  norm_num [Nat.choose]
 have h2_5 : chooseShiftSevenK0B (2*n+4) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (2*n+4) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (2*n+4) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2*n+4) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+4) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+4) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+4) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+4) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2*n+4) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+4) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+4) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+4) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+4) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+4) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+4) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+4) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+4) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+4) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (2*n+4) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint32_2_4MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_2_5MCFC (N x : ℤ) : ℤ := (((((((4608*N + 21504)*N + 112896)*N + 336000)*N + 467712)*N + 746256)*N + 95184)*N + 90720)

theorem cyclePoint32_2_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (2*n+5)=16*cyclePoint32_2_5MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+5) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+5) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (2*n+5) (2*n+4)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+5)-(2*n+4)=1 by omega]
  norm_num [Nat.choose]
 have h2_5 : chooseShiftSevenK0B (2*n+5) (2*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+5)-(2*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h2_6 : chooseShiftSevenK0B (2*n+5) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (2*n+5) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2*n+5) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+5) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+5) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+5) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+5) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2*n+5) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+5) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+5) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+5) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+5) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+5) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+5) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+5) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+5) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+5) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (2*n+5) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint32_2_5MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_2_6MCFC (N x : ℤ) : ℤ := (((((((4608*N + (-2688))*N + 56448)*N + 134400)*N + (-379008))*N + 1319808)*N + (-1496448))*N + 786240)

theorem cyclePoint32_2_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (2*n+6)=16*cyclePoint32_2_6MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+6) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+6) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (2*n+6) (2*n+4)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+6)-(2*n+4)=2 by omega]
  norm_num [Nat.choose]
 have h2_5 : chooseShiftSevenK0B (2*n+6) (2*n+5)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+6)-(2*n+5)=1 by omega]
  norm_num [Nat.choose]
 have h2_6 : chooseShiftSevenK0B (2*n+6) (2*n+6)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+6)-(2*n+6)=0 by omega]
  norm_num [Nat.choose]
 have h2_7 : chooseShiftSevenK0B (2*n+6) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2*n+6) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+6) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+6) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+6) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+6) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2*n+6) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+6) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+6) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+6) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+6) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+6) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+6) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+6) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+6) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+6) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (2*n+6) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint32_2_6MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_2_7MCFC (N x : ℤ) : ℤ := (((((((4608*N + (-26880))*N + 96768)*N + 94080)*N + (-1709568))*N + 6101760)*N + (-10003968))*N + 6592320)

theorem cyclePoint32_2_7MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (2*n+7)=16*cyclePoint32_2_7MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+7) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+7) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (2*n+7) (2*n+4)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+7)-(2*n+4)=3 by omega]
  norm_num [Nat.choose]
 have h2_5 : chooseShiftSevenK0B (2*n+7) (2*n+5)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+7)-(2*n+5)=2 by omega]
  norm_num [Nat.choose]
 have h2_6 : chooseShiftSevenK0B (2*n+7) (2*n+6)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+7)-(2*n+6)=1 by omega]
  norm_num [Nat.choose]
 have h2_7 : chooseShiftSevenK0B (2*n+7) (2*n+7)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+7)-(2*n+7)=0 by omega]
  norm_num [Nat.choose]
 have h2_8 : chooseShiftSevenK0B (2*n+7) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+7) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+7) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+7) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+7) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2*n+7) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+7) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+7) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+7) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+7) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+7) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+7) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+7) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+7) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+7) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (2*n+7) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint32_2_7MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cycleWindowGap32_2_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 15290892288)*N + 770059616256)*N + 23512874434560)*N + 484770648821760)*N + 7111711166644224)*N + 76149393923248128)*N + 599819462102568960)*N + 3450006822173829120)*N + 14130483612026277888)*N + 39110457578019158016)*N + 65652480711920148480)*N + 50516639012038348800)

theorem cycleWindowGap32_2_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_2_2MCFC (N+7) 0)*(cyclePoint32_2_4MCFC (N+7) 0)≤(cyclePoint32_2_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_2_3MCFC (N+7) 0)^2-(cyclePoint32_2_2MCFC (N+7) 0)*(cyclePoint32_2_4MCFC (N+7) 0)=cycleWindowGap32_2_2MCFCCert N Z x := by
  unfold cycleWindowGap32_2_2MCFCCert cyclePoint32_2_2MCFC cyclePoint32_2_3MCFC cyclePoint32_2_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_2_2MCFCCert
 positivity

def cycleWindowGap32_2_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 14064648192)*N + 652098650112)*N + 18358755287040)*N + 349529302241280)*N + 4741370137276416)*N + 46995242696349696)*N + 342988057175500800)*N + 1829609944448025600)*N + 6957404138233608192)*N + 17903364930147336192)*N + 27991788947791119360)*N + 20108013607422720000)

theorem cycleWindowGap32_2_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_2_3MCFC (N+7) 0)*(cyclePoint32_2_5MCFC (N+7) 0)≤(cyclePoint32_2_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_2_4MCFC (N+7) 0)^2-(cyclePoint32_2_3MCFC (N+7) 0)*(cyclePoint32_2_5MCFC (N+7) 0)=cycleWindowGap32_2_3MCFCCert N Z x := by
  unfold cycleWindowGap32_2_3MCFCCert cyclePoint32_2_3MCFC cyclePoint32_2_4MCFC cyclePoint32_2_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_2_3MCFCCert
 positivity

def cycleWindowGap32_2_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 12838404096)*N + 543501729792)*N + 13980235530240)*N + 243381363240960)*N + 3021509657714688)*N + 27434704485113856)*N + 183607911355760640)*N + 899116569405169920)*N + 3142530160173282816)*N + 7442742673782404352)*N + 10726522255407006720)*N + 7114982897702937600)

theorem cycleWindowGap32_2_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_2_4MCFC (N+7) 0)*(cyclePoint32_2_6MCFC (N+7) 0)≤(cyclePoint32_2_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_2_5MCFC (N+7) 0)^2-(cyclePoint32_2_4MCFC (N+7) 0)*(cyclePoint32_2_6MCFC (N+7) 0)=cycleWindowGap32_2_4MCFCCert N Z x := by
  unfold cycleWindowGap32_2_4MCFCCert cyclePoint32_2_4MCFC cyclePoint32_2_5MCFC cyclePoint32_2_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_2_4MCFCCert
 positivity

def cycleWindowGap32_2_5MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 11612160000)*N + 444268855296)*N + 10323109601280)*N + 162326373027840)*N + 1820627148533760)*N + 14942089747888128)*N + 90460738108016640)*N + 401147709788528640)*N + 1271324138848727040)*N + 2734377542179992576)*N + 3584806525599022080)*N + 2166949373450803200)

theorem cycleWindowGap32_2_5MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_2_5MCFC (N+7) 0)*(cyclePoint32_2_7MCFC (N+7) 0)≤(cyclePoint32_2_6MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_2_6MCFC (N+7) 0)^2-(cyclePoint32_2_5MCFC (N+7) 0)*(cyclePoint32_2_7MCFC (N+7) 0)=cycleWindowGap32_2_5MCFCCert N Z x := by
  unfold cycleWindowGap32_2_5MCFCCert cyclePoint32_2_5MCFC cyclePoint32_2_6MCFC cyclePoint32_2_7MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_2_5MCFCCert
 positivity
end
end MathGKM.Markov
