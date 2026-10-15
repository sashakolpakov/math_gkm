import MarkovSmallNumerator32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint32_1_0MCFC (N x : ℤ) : ℤ := (((((((77184*N + 758016)*N + 999936)*N + (-11975040))*N + (-19684224))*N + 181044864)*N + 243471744)*N + (-1417832640))

theorem cyclePoint32_1_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+0)=16*cyclePoint32_1_0MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+0) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+0) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (1*n+0) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (1*n+0) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (1*n+0) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (1*n+0) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1*n+0) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+0) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+0) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+0) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+0) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+0) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+0) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+0) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+0) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+0) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+0) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+0) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+0) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+0) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+0) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+0) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+0) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+0) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+0) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+0) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+0) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+0) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+0) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+0) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+0) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+0) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_0MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_1_1MCFC (N x : ℤ) : ℤ := (((((((77184*N + 717696)*N + 1749888)*N + (-2822400))*N + (-8434944))*N + 48311424)*N + 73982592)*N + (-281050560))

theorem cyclePoint32_1_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+1)=16*cyclePoint32_1_1MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+1) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+1) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (1*n+1) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (1*n+1) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (1*n+1) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (1*n+1) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1*n+1) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+1) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+1) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+1) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+1) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+1) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+1) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+1) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+1) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+1) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+1) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+1) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+1) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+1) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+1) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+1) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+1) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+1) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+1) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+1) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+1) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+1) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+1) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+1) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+1) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+1) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_1MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_1_2MCFC (N x : ℤ) : ℤ := (((((((77184*N + 677376)*N + 2112768)*N + 1975680)*N + (-83664))*N + 10879344)*N + 16899552)*N + (-39372480))

theorem cyclePoint32_1_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+2)=16*cyclePoint32_1_2MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+2) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+2) (1*n+2)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+2)-(1*n+2)=0 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (1*n+2) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (1*n+2) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (1*n+2) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (1*n+2) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1*n+2) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+2) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+2) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+2) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+2) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+2) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+2) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+2) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+2) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+2) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+2) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+2) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+2) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+2) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+2) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+2) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+2) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+2) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+2) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+2) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+2) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+2) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+2) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+2) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+2) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+2) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_2MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_1_3MCFC (N x : ℤ) : ℤ := (((((((77184*N + 637056)*N + 2088576)*N + 3386880)*N + 3484656)*N + 3596544)*N + 3270384)*N + (-3175200))

theorem cyclePoint32_1_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+3)=16*cyclePoint32_1_3MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+3) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+3) (1*n+2)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+3)-(1*n+2)=1 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (1*n+3) (1*n+3)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+3)-(1*n+3)=0 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (1*n+3) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (1*n+3) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (1*n+3) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1*n+3) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+3) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+3) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+3) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+3) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+3) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+3) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+3) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+3) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+3) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+3) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+3) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+3) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+3) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+3) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+3) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+3) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+3) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+3) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+3) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+3) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+3) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+3) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+3) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+3) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+3) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_3MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_1_4MCFC (N x : ℤ) : ℤ := (((((((77184*N + 596736)*N + 1677312)*N + 2378880)*N + 4437216)*N + (-72576))*N + 2698848)*N + (-604800))

theorem cyclePoint32_1_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+4)=16*cyclePoint32_1_4MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+4) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+4) (1*n+2)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+4)-(1*n+2)=2 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (1*n+4) (1*n+3)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+4)-(1*n+3)=1 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (1*n+4) (1*n+4)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+4)-(1*n+4)=0 by omega]
  norm_num [Nat.choose]
 have h1_5 : chooseShiftSevenK0B (1*n+4) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (1*n+4) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1*n+4) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+4) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+4) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+4) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+4) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+4) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+4) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+4) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+4) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+4) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+4) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+4) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+4) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+4) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+4) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+4) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+4) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+4) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+4) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+4) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+4) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+4) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+4) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+4) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+4) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+4) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_4MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_1_5MCFC (N x : ℤ) : ℤ := (((((((77184*N + 556416)*N + 878976)*N + (-80640))*N + 9245376)*N + (-16744896))*N + 21248064)*N + (-10342080))

theorem cyclePoint32_1_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+5)=16*cyclePoint32_1_5MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+5) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+5) (1*n+2)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+5)-(1*n+2)=3 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (1*n+5) (1*n+3)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+5)-(1*n+3)=2 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (1*n+5) (1*n+4)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+5)-(1*n+4)=1 by omega]
  norm_num [Nat.choose]
 have h1_5 : chooseShiftSevenK0B (1*n+5) (1*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+5)-(1*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h1_6 : chooseShiftSevenK0B (1*n+5) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1*n+5) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+5) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+5) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+5) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+5) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+5) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+5) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+5) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+5) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+5) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+5) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+5) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+5) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+5) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+5) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+5) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+5) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+5) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+5) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+5) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+5) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+5) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+5) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+5) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+5) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+5) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_5MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_1_6MCFC (N x : ℤ) : ℤ := (((((((77184*N + 516096)*N + (-306432))*N + (-3024000))*N + 28961856)*N + (-87486336))*N + 135833472)*N + (-87454080))

theorem cyclePoint32_1_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (1*n+6)=16*cyclePoint32_1_6MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (1*n+6) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (1*n+6) (1*n+2)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+6)-(1*n+2)=4 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (1*n+6) (1*n+3)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+6)-(1*n+3)=3 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (1*n+6) (1*n+4)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+6)-(1*n+4)=2 by omega]
  norm_num [Nat.choose]
 have h1_5 : chooseShiftSevenK0B (1*n+6) (1*n+5)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+6)-(1*n+5)=1 by omega]
  norm_num [Nat.choose]
 have h1_6 : chooseShiftSevenK0B (1*n+6) (1*n+6)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1*n+6)-(1*n+6)=0 by omega]
  norm_num [Nat.choose]
 have h1_7 : chooseShiftSevenK0B (1*n+6) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1*n+6) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1*n+6) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1*n+6) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1*n+6) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1*n+6) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1*n+6) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1*n+6) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1*n+6) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1*n+6) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1*n+6) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1*n+6) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1*n+6) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1*n+6) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1*n+6) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1*n+6) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (1*n+6) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (1*n+6) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (1*n+6) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (1*n+6) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (1*n+6) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (1*n+6) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (1*n+6) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (1*n+6) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (1*n+6) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (1*n+6) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint32_1_6MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cycleWindowGap32_1_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 3215156281344)*N + 149427199014912)*N + 4179539509770240)*N + 78320012184981504)*N + 1035351040074688512)*N + 9895935900869093376)*N + 68874484946456770560)*N + 346274705660512462848)*N + 1225996793080121631744)*N + 2900835466598082650112)*N + 4118497455687582643200)*N + 2654625160103006361600)

theorem cycleWindowGap32_1_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_1_0MCFC (N+7) 0)*(cyclePoint32_1_2MCFC (N+7) 0)≤(cyclePoint32_1_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_1_1MCFC (N+7) 0)^2-(cyclePoint32_1_0MCFC (N+7) 0)*(cyclePoint32_1_2MCFC (N+7) 0)=cycleWindowGap32_1_0MCFCCert N Z x := by
  unfold cycleWindowGap32_1_0MCFCCert cyclePoint32_1_0MCFC cyclePoint32_1_1MCFC cyclePoint32_1_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_1_0MCFCCert
 positivity

def cycleWindowGap32_1_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 3156073611264)*N + 144363937277952)*N + 3985706641029120)*N + 73958340665954304)*N + 971535112955430912)*N + 9262710478577961216)*N + 64572057976794117120)*N + 326624673976005339648)*N + 1169033182643997748224)*N + 2810148915634160792832)*N + 4073632097288847528960)*N + 2693414697860699366400)

theorem cycleWindowGap32_1_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_1_1MCFC (N+7) 0)*(cyclePoint32_1_3MCFC (N+7) 0)≤(cyclePoint32_1_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_1_2MCFC (N+7) 0)^2-(cyclePoint32_1_1MCFC (N+7) 0)*(cyclePoint32_1_3MCFC (N+7) 0)=cycleWindowGap32_1_1MCFCCert N Z x := by
  unfold cycleWindowGap32_1_1MCFCCert cyclePoint32_1_1MCFC cyclePoint32_1_2MCFC cyclePoint32_1_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_1_1MCFCCert
 positivity

def cycleWindowGap32_1_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 3096990941184)*N + 139137738356736)*N + 3777364691896320)*N + 69019352172417024)*N + 894210270469834752)*N + 8423724348771395328)*N + 58139079745212748800)*N + 291796980776146960128)*N + 1038689855290061259264)*N + 2489357970904470414336)*N + 3606947538126854906880)*N + 2389772554329797683200)

theorem cycleWindowGap32_1_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_1_2MCFC (N+7) 0)*(cyclePoint32_1_4MCFC (N+7) 0)≤(cyclePoint32_1_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_1_3MCFC (N+7) 0)^2-(cyclePoint32_1_2MCFC (N+7) 0)*(cyclePoint32_1_4MCFC (N+7) 0)=cycleWindowGap32_1_2MCFCCert N Z x := by
  unfold cycleWindowGap32_1_2MCFCCert cyclePoint32_1_2MCFC cyclePoint32_1_3MCFC cyclePoint32_1_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_1_2MCFCCert
 positivity

def cycleWindowGap32_1_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 3037908271104)*N + 133729151883264)*N + 3554620865832960)*N + 63564965063921664)*N + 805883901929551872)*N + 7429755499761917952)*N + 50202170393948052480)*N + 246801686640419570688)*N + 861125630557677133824)*N + 2024612118767439581184)*N + 2880565191630926069760)*N + 1875963631183752499200)

theorem cycleWindowGap32_1_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_1_3MCFC (N+7) 0)*(cyclePoint32_1_5MCFC (N+7) 0)≤(cyclePoint32_1_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_1_4MCFC (N+7) 0)^2-(cyclePoint32_1_3MCFC (N+7) 0)*(cyclePoint32_1_5MCFC (N+7) 0)=cycleWindowGap32_1_3MCFCCert N Z x := by
  unfold cycleWindowGap32_1_3MCFCCert cyclePoint32_1_3MCFC cyclePoint32_1_4MCFC cyclePoint32_1_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_1_3MCFCCert
 positivity

def cycleWindowGap32_1_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 2978825601024)*N + 128116782452736)*N + 3317889130536960)*N + 57679239801544704)*N + 709682161362112512)*N + 6341421518580492288)*N + 41489073417924034560)*N + 197362342800535707648)*N + 666046686247724888064)*N + 1514315421446297573376)*N + 2083469363281806151680)*N + 1312316569593856512000)

theorem cycleWindowGap32_1_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_1_4MCFC (N+7) 0)*(cyclePoint32_1_6MCFC (N+7) 0)≤(cyclePoint32_1_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_1_5MCFC (N+7) 0)^2-(cyclePoint32_1_4MCFC (N+7) 0)*(cyclePoint32_1_6MCFC (N+7) 0)=cycleWindowGap32_1_4MCFCCert N Z x := by
  unfold cycleWindowGap32_1_4MCFCCert cyclePoint32_1_4MCFC cyclePoint32_1_5MCFC cyclePoint32_1_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_1_4MCFCCert
 positivity
end
end MathGKM.Markov
