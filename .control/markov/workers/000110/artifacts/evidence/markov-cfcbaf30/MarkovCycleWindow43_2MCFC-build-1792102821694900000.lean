import MarkovSmallNumerator43MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint43_2_2MCFC (N x : ℤ) : ℤ := (((((((55296*N + 967680)*N + 7402752)*N + 30360960)*N + 61576704)*N + 11491200)*N + (-191083392))*N + 266051520)

theorem cyclePoint43_2_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (2*n+2)=16*cyclePoint43_2_2MCFC n j := by
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
 have h4_7 : chooseShiftSevenK0B (2*n+2) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+2) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+2) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+2) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+2) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+2) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+2) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (2*n+2) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (2*n+2) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint43_2_2MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_2_3MCFC (N x : ℤ) : ℤ := (((((((55296*N + 774144)*N + 4919040)*N + 17539200)*N + 34481664)*N + 25958016)*N + (-23610240))*N + 31872960)

theorem cyclePoint43_2_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (2*n+3)=16*cyclePoint43_2_3MCFC n j := by
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
 have h4_7 : chooseShiftSevenK0B (2*n+3) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+3) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+3) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+3) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+3) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+3) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+3) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (2*n+3) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (2*n+3) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint43_2_3MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_2_4MCFC (N x : ℤ) : ℤ := (((((((55296*N + 580608)*N + 2951424)*N + 8910720)*N + 16095744)*N + 15426432)*N + 4000896)*N + 3024000)

theorem cyclePoint43_2_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (2*n+4)=16*cyclePoint43_2_4MCFC n j := by
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
 have h4_7 : chooseShiftSevenK0B (2*n+4) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+4) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+4) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+4) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+4) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+4) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+4) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (2*n+4) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (2*n+4) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint43_2_4MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_2_5MCFC (N x : ℤ) : ℤ := (((((((55296*N + 387072)*N + 1499904)*N + 3830400)*N + 5773824)*N + 5701248)*N + 2710656)*N + 604800)

theorem cyclePoint43_2_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (2*n+5)=16*cyclePoint43_2_5MCFC n j := by
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
 have h4_7 : chooseShiftSevenK0B (2*n+5) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+5) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+5) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+5) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+5) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+5) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+5) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (2*n+5) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (2*n+5) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint43_2_5MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_2_6MCFC (N x : ℤ) : ℤ := (((((((55296*N + 193536)*N + 564480)*N + 1653120)*N + 290304)*N + 3233664)*N + (-1031040))*N + 665280)

theorem cyclePoint43_2_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (2*n+6)=16*cyclePoint43_2_6MCFC n j := by
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
 have h4_7 : chooseShiftSevenK0B (2*n+6) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+6) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+6) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+6) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+6) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+6) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+6) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (2*n+6) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (2*n+6) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint43_2_6MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_2_7MCFC (N x : ℤ) : ℤ := (((((((55296*N)*N + 145152)*N + 1733760)*N + (-6160896))*N + 14474880)*N + (-16900992))*N + 8406720)

theorem cyclePoint43_2_7MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (2*n+7)=16*cyclePoint43_2_7MCFC n j := by
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
 have h4_7 : chooseShiftSevenK0B (2*n+7) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+7) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+7) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+7) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+7) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+7) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+7) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (2*n+7) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (2*n+7) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint43_2_7MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cycleWindowGap43_2_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 979211649024)*N + 49329942036480)*N + 1507505846353920)*N + 31121417629532160)*N + 457169967260762112)*N + 4899029226103111680)*N + 38575891779969761280)*N + 221447987479155548160)*N + 903491391854207729664)*N + 2485765913049030205440)*N + 4139073516690020966400)*N + 3152978830340223897600)

theorem cycleWindowGap43_2_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_2_2MCFC (N+7) 0)*(cyclePoint43_2_4MCFC (N+7) 0)≤(cyclePoint43_2_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_2_3MCFC (N+7) 0)^2-(cyclePoint43_2_2MCFC (N+7) 0)*(cyclePoint43_2_4MCFC (N+7) 0)=cycleWindowGap43_2_2MCFCCert N Z x := by
  unfold cycleWindowGap43_2_2MCFCCert cyclePoint43_2_2MCFC cyclePoint43_2_3MCFC cyclePoint43_2_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_2_2MCFCCert
 positivity

def cycleWindowGap43_2_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 915001049088)*N + 43093784788992)*N + 1231878873415680)*N + 23804053465006080)*N + 327548500939505664)*N + 3290825048914722816)*N + 24321213721694453760)*N + 131219414741193891840)*N + 503974284273828200448)*N + 1307767576006087483392)*N + 2058349575363577896960)*N + 1485853099778809036800)

theorem cycleWindowGap43_2_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_2_3MCFC (N+7) 0)*(cyclePoint43_2_5MCFC (N+7) 0)≤(cyclePoint43_2_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_2_4MCFC (N+7) 0)^2-(cyclePoint43_2_3MCFC (N+7) 0)*(cyclePoint43_2_5MCFC (N+7) 0)=cycleWindowGap43_2_3MCFCCert N Z x := by
  unfold cycleWindowGap43_2_3MCFCCert cyclePoint43_2_3MCFC cyclePoint43_2_4MCFC cyclePoint43_2_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_2_3MCFCCert
 positivity

def cycleWindowGap43_2_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 850790449152)*N + 37266672844800)*N + 991115878072320)*N + 17825614081228800)*N + 228421741743046656)*N + 2138527281695293440)*N + 14739296745308405760)*N + 74226976102764011520)*N + 266375978441615572992)*N + 646626097633096949760)*N + 953353250950622699520)*N + 645597897379784294400)

theorem cycleWindowGap43_2_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_2_4MCFC (N+7) 0)*(cyclePoint43_2_6MCFC (N+7) 0)≤(cyclePoint43_2_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_2_5MCFC (N+7) 0)^2-(cyclePoint43_2_4MCFC (N+7) 0)*(cyclePoint43_2_6MCFC (N+7) 0)=cycleWindowGap43_2_4MCFCCert N Z x := by
  unfold cycleWindowGap43_2_4MCFCCert cyclePoint43_2_4MCFC cyclePoint43_2_5MCFC cyclePoint43_2_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_2_4MCFCCert
 positivity

def cycleWindowGap43_2_5MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 786579849216)*N + 31848606203904)*N + 782981380177920)*N + 13020115077365760)*N + 154317118338367488)*N + 1337008323276767232)*N + 8533805682919587840)*N + 39832607632519618560)*N + 132616835699579191296)*N + 298978908081423704064)*N + 409839056406724976640)*N + 258347456843541811200)

theorem cycleWindowGap43_2_5MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_2_5MCFC (N+7) 0)*(cyclePoint43_2_7MCFC (N+7) 0)≤(cyclePoint43_2_6MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_2_6MCFC (N+7) 0)^2-(cyclePoint43_2_5MCFC (N+7) 0)*(cyclePoint43_2_7MCFC (N+7) 0)=cycleWindowGap43_2_5MCFCCert N Z x := by
  unfold cycleWindowGap43_2_5MCFCCert cyclePoint43_2_5MCFC cyclePoint43_2_6MCFC cyclePoint43_2_7MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_2_5MCFCCert
 positivity
end
end MathGKM.Markov
