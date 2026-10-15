import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint31_1_0MCFC (N x : ℤ) : ℤ := (((((((77184*N + 564480)*N + (-16128))*N + (-9394560))*N + (-3798144))*N + 129790080)*N + 84659328)*N + (-895648320))

theorem cyclePoint31_1_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+0)=16*cyclePoint31_1_0MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+0) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+0) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_0MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_1_1MCFC (N x : ℤ) : ℤ := (((((((77184*N + 524160)*N + 685440)*N + (-2903040))*N + (-2467584))*N + 33586560)*N + 25534080)*N + (-164808000))

theorem cyclePoint31_1_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+1)=16*cyclePoint31_1_1MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+1) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+1) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_1MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_1_2MCFC (N x : ℤ) : ℤ := (((((((77184*N + 483840)*N + 999936)*N + 201600)*N + (-159264))*N + 6511680)*N + 5372064)*N + (-20926080))

theorem cyclePoint31_1_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+2)=16*cyclePoint31_1_2MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+2) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+2) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_2MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_1_3MCFC (N x : ℤ) : ℤ := (((((((77184*N + 443520)*N + 927360)*N + 887040)*N + 1277136)*N + 393120)*N + 1316880)*N + (-1693440))

theorem cyclePoint31_1_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+3)=16*cyclePoint31_1_3MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+3) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+3) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_3MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_1_4MCFC (N x : ℤ) : ℤ := (((((((77184*N + 403200)*N + 467712)*N + 120960)*N + 4119696)*N + (-7464240))*N + 8807328)*N + (-4112640))

theorem cyclePoint31_1_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+4)=16*cyclePoint31_1_4MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+4) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+4) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_4MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_1_5MCFC (N x : ℤ) : ℤ := (((((((77184*N + 362880)*N + (-379008))*N + (-1128960))*N + 15051456)*N + (-45017280))*N + 66777408)*N + (-40824000))

theorem cyclePoint31_1_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+5)=16*cyclePoint31_1_5MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+5) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+5) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_5MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_1_6MCFC (N x : ℤ) : ℤ := (((((((77184*N + 322560)*N + (-1612800))*N + (-1895040))*N + 45412416)*N + (-182044800))*N + 339505920)*N + (-257644800))

theorem cyclePoint31_1_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (1*n+6)=16*cyclePoint31_1_6MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (1*n+6) (2*n+3)=0 := by
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
 have h3_4 : chooseShiftSevenK0B (1*n+6) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint31_1_6MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleWindowGap31_1_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 3069456187392)*N + 136271217438720)*N + 3643324187811840)*N + 65304388447248384)*N + 826401587204100096)*N + 7567637519304253440)*N + 50508568998012948480)*N + 243767568084814061568)*N + 829434265707467814912)*N + 1888346377728571299840)*N + 2582945350319515668480)*N + 1605969991391418777600)

theorem cycleWindowGap31_1_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_1_0MCFC (N+7) 0)*(cyclePoint31_1_2MCFC (N+7) 0)≤(cyclePoint31_1_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_1_1MCFC (N+7) 0)^2-(cyclePoint31_1_0MCFC (N+7) 0)*(cyclePoint31_1_2MCFC (N+7) 0)=cycleWindowGap31_1_0MCFCCert N Z x := by
  unfold cycleWindowGap31_1_0MCFCCert cyclePoint31_1_0MCFC cyclePoint31_1_1MCFC cyclePoint31_1_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_1_0MCFCCert
 positivity

def cycleWindowGap31_1_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 3010373517312)*N + 131372224800768)*N + 3461340570347520)*N + 61315118516219904)*N + 769224209396299776)*N + 7007215049520989184)*N + 46697196247057520640)*N + 225936865575356802048)*N + 773991523508387853312)*N + 1782019878518559310848)*N + 2476046440081816842240)*N + 1570366371461581209600)

theorem cycleWindowGap31_1_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_1_1MCFC (N+7) 0)*(cyclePoint31_1_3MCFC (N+7) 0)≤(cyclePoint31_1_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_1_2MCFC (N+7) 0)^2-(cyclePoint31_1_1MCFC (N+7) 0)*(cyclePoint31_1_3MCFC (N+7) 0)=cycleWindowGap31_1_1MCFCCert N Z x := by
  unfold cycleWindowGap31_1_1MCFCCert cyclePoint31_1_1MCFC cyclePoint31_1_2MCFC cyclePoint31_1_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_1_1MCFCCert
 positivity

def cycleWindowGap31_1_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 2951290847232)*N + 126304459868160)*N + 3265452093818880)*N + 56810646413144064)*N + 700757582620870656)*N + 6284984612412844800)*N + 41302606827818004480)*N + 197409599821771884288)*N + 669343105126322790912)*N + 1528437632620271063040)*N + 2110767887612995107840)*N + 1333388096396397619200)

theorem cycleWindowGap31_1_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_1_2MCFC (N+7) 0)*(cyclePoint31_1_4MCFC (N+7) 0)≤(cyclePoint31_1_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_1_3MCFC (N+7) 0)^2-(cyclePoint31_1_2MCFC (N+7) 0)*(cyclePoint31_1_4MCFC (N+7) 0)=cycleWindowGap31_1_2MCFCCert N Z x := by
  unfold cycleWindowGap31_1_2MCFCCert cyclePoint31_1_2MCFC cyclePoint31_1_3MCFC cyclePoint31_1_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_1_2MCFCCert
 positivity

def cycleWindowGap31_1_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 2892208177152)*N + 121046527236096)*N + 3055827999651840)*N + 51856060094705664)*N + 623474757296326656)*N + 5448459070940030208)*N + 34883701515357972480)*N + 162461221850360498688)*N + 536928414558643924992)*N + 1195713505651821117696)*N + 1611463864561519610880)*N + 994206793320732902400)

theorem cycleWindowGap31_1_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_1_3MCFC (N+7) 0)*(cyclePoint31_1_5MCFC (N+7) 0)≤(cyclePoint31_1_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_1_4MCFC (N+7) 0)^2-(cyclePoint31_1_3MCFC (N+7) 0)*(cyclePoint31_1_5MCFC (N+7) 0)=cycleWindowGap31_1_3MCFCCert N Z x := by
  unfold cycleWindowGap31_1_3MCFCCert cyclePoint31_1_3MCFC cyclePoint31_1_4MCFC cyclePoint31_1_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_1_3MCFCCert
 positivity

def cycleWindowGap31_1_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*N + 2833125507072)*N + 115578976536576)*N + 2833255499397120)*N + 46546913796009984)*N + 540543580150081536)*N + 4554278670481763328)*N + 28074230184055587840)*N + 125760943338648403968)*N + 399521364031952289792)*N + 854911722841646109696)*N + 1106967918972454640640)*N + 656219104095321446400)

theorem cycleWindowGap31_1_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_1_4MCFC (N+7) 0)*(cyclePoint31_1_6MCFC (N+7) 0)≤(cyclePoint31_1_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_1_5MCFC (N+7) 0)^2-(cyclePoint31_1_4MCFC (N+7) 0)*(cyclePoint31_1_6MCFC (N+7) 0)=cycleWindowGap31_1_4MCFCCert N Z x := by
  unfold cycleWindowGap31_1_4MCFCCert cyclePoint31_1_4MCFC cyclePoint31_1_5MCFC cyclePoint31_1_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_1_4MCFCCert
 positivity
end
end MathGKM.Markov
