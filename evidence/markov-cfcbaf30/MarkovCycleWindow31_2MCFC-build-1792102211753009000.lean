import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint31_2_1MCFC (N x : ℤ) : ℤ := (((((((4608*N + 91392)*N + 806400)*N + 3776640)*N + 8289792)*N + 8590848)*N + (-141189120))*N + 197467200)

theorem cyclePoint31_2_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (2*n+1)=16*cyclePoint31_2_1MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (2*n+1) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (2*n+1) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 : chooseShiftSevenK0B (2*n+1) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (2*n+1) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (2*n+1) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (2*n+1) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (2*n+1) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2*n+1) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2*n+1) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2*n+1) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2*n+1) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2*n+1) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (2*n+1) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (2*n+1) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (2*n+1) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (2*n+1) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (2*n+1) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (2*n+1) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (2*n+1) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (2*n+1) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (2*n+1) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (2*n+1) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint31_2_1MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_2_2MCFC (N x : ℤ) : ℤ := (((((((4608*N + 67200)*N + 475776)*N + 1881600)*N + 3814272)*N + 3796800)*N + (-27579456))*N + 29030400)

theorem cyclePoint31_2_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (2*n+2)=16*cyclePoint31_2_2MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (2*n+2) (2*n+3)=0 := by
  exact if_neg (by omega)
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
 have h3_4 : chooseShiftSevenK0B (2*n+2) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint31_2_2MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_2_3MCFC (N x : ℤ) : ℤ := (((((((4608*N + 43008)*N + 241920)*N + 792960)*N + 1435392)*N + 1356432)*N + (-3390480))*N + 2540160)

theorem cyclePoint31_2_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (2*n+3)=16*cyclePoint31_2_3MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (2*n+3) (2*n+3)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+3)-(2*n+3)=0 by omega]
  norm_num [Nat.choose]
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
 have h3_4 : chooseShiftSevenK0B (2*n+3) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint31_2_3MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_2_4MCFC (N x : ℤ) : ℤ := (((((((4608*N + 18816)*N + 104832)*N + 268800)*N + 346752)*N + 468384)*N + (-244512))*N + 120960)

theorem cyclePoint31_2_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (2*n+4)=16*cyclePoint31_2_4MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (2*n+4) (2*n+3)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+4)-(2*n+3)=1 by omega]
  norm_num [Nat.choose]
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
 have h3_4 : chooseShiftSevenK0B (2*n+4) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint31_2_4MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_2_5MCFC (N x : ℤ) : ℤ := (((((((4608*N + (-5376))*N + 64512)*N + 67200)*N + (-258048))*N + 1026816)*N + (-1262592))*N + 665280)

theorem cyclePoint31_2_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (2*n+5)=16*cyclePoint31_2_5MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (2*n+5) (2*n+3)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+5)-(2*n+3)=2 by omega]
  norm_num [Nat.choose]
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
 have h3_4 : chooseShiftSevenK0B (2*n+5) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint31_2_5MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_2_6MCFC (N x : ℤ) : ℤ := (((((((4608*N + (-29568))*N + 120960)*N + (-53760))*N + (-1185408))*N + 4921728)*N + (-8496000))*N + 5745600)

theorem cyclePoint31_2_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (2*n+6)=16*cyclePoint31_2_6MCFC n j := by
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
 have h2_3 : chooseShiftSevenK0B (2*n+6) (2*n+3)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2*n+6)-(2*n+3)=3 by omega]
  norm_num [Nat.choose]
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
 have h3_4 : chooseShiftSevenK0B (2*n+6) (3*n+4)=0 := by
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
 unfold smallValue31MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint31_2_6MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleWindowGap31_2_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 15142256640)*N + 754917359616)*N + 22802310881280)*N + 464757996810240)*N + 6737580871741440)*N + 71276755250792448)*N + 554634742345205760)*N + 3150949603074416640)*N + 12742449468647915520)*N + 34797980821937550336)*N + 57567681371325404160)*N + 43583041404703180800)

theorem cycleWindowGap31_2_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_2_1MCFC (N+7) 0)*(cyclePoint31_2_3MCFC (N+7) 0)≤(cyclePoint31_2_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_2_2MCFC (N+7) 0)^2-(cyclePoint31_2_1MCFC (N+7) 0)*(cyclePoint31_2_3MCFC (N+7) 0)=cycleWindowGap31_2_1MCFCCert N Z x := by
  unfold cycleWindowGap31_2_1MCFCCert cyclePoint31_2_1MCFC cyclePoint31_2_2MCFC cyclePoint31_2_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_2_1MCFCCert
 positivity

def cycleWindowGap31_2_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 13916012544)*N + 638331273216)*N + 17774346240000)*N + 334591558963200)*N + 4486442055524352)*N + 43947068912345088)*N + 316926658616279040)*N + 1670192541418625280)*N + 6273174327632239104)*N + 15939326203768509696)*N + 24595968830304936960)*N + 17427114490381747200)

theorem cycleWindowGap31_2_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_2_2MCFC (N+7) 0)*(cyclePoint31_2_4MCFC (N+7) 0)≤(cyclePoint31_2_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_2_3MCFC (N+7) 0)^2-(cyclePoint31_2_2MCFC (N+7) 0)*(cyclePoint31_2_4MCFC (N+7) 0)=cycleWindowGap31_2_2MCFCCert N Z x := by
  unfold cycleWindowGap31_2_2MCFCCert cyclePoint31_2_2MCFC cyclePoint31_2_3MCFC cyclePoint31_2_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_2_2MCFCCert
 positivity

def cycleWindowGap31_2_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 12689768448)*N + 531109232640)*N + 13507907051520)*N + 232529242337280)*N + 2854585004027904)*N + 25630050430494720)*N + 169613878421514240)*N + 821267601081984000)*N + 2837978261737371648)*N + 6644567154801623040)*N + 9464921667135728640)*N + 6203685166618060800)

theorem cycleWindowGap31_2_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_2_3MCFC (N+7) 0)*(cyclePoint31_2_5MCFC (N+7) 0)≤(cyclePoint31_2_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_2_4MCFC (N+7) 0)^2-(cyclePoint31_2_3MCFC (N+7) 0)*(cyclePoint31_2_5MCFC (N+7) 0)=cycleWindowGap31_2_3MCFCCert N Z x := by
  unfold cycleWindowGap31_2_3MCFCCert cyclePoint31_2_3MCFC cyclePoint31_2_4MCFC cyclePoint31_2_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_2_3MCFCCert
 positivity

def cycleWindowGap31_2_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*N + 11463524352)*N + 433251237888)*N + 9950181212160)*N + 154715507896320)*N + 1716536868028416)*N + 13940000147533824)*N + 83528388828057600)*N + 366671206771752960)*N + 1150474910682488832)*N + 2449924212722853888)*N + 3180055355029002240)*N + 1903145944528281600)

theorem cycleWindowGap31_2_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_2_4MCFC (N+7) 0)*(cyclePoint31_2_6MCFC (N+7) 0)≤(cyclePoint31_2_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_2_5MCFC (N+7) 0)^2-(cyclePoint31_2_4MCFC (N+7) 0)*(cyclePoint31_2_6MCFC (N+7) 0)=cycleWindowGap31_2_4MCFCCert N Z x := by
  unfold cycleWindowGap31_2_4MCFCCert cyclePoint31_2_4MCFC cyclePoint31_2_5MCFC cyclePoint31_2_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_2_4MCFCCert
 positivity
end
end MathGKM.Markov
