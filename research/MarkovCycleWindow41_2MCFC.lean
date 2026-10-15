import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint41_2_1MCFC (N x : ℤ) : ℤ := (((((((55296*N + 774144)*N + 4790016)*N + 15200640)*N + 16740864)*N + (-44279424))*N + (-167826816))*N + 363182400)

theorem cyclePoint41_2_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (2*n+1)=16*cyclePoint41_2_1MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (2*n+1) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (2*n+1) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (2*n+1) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (2*n+1) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (2*n+1) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (2*n+1) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (2*n+1) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (2*n+1) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (2*n+1) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint41_2_1MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_2_2MCFC (N x : ℤ) : ℤ := (((((((55296*N + 580608)*N + 2886912)*N + 7862400)*N + 9644544)*N + (-5298048))*N + (-30609792))*N + 48202560)

theorem cyclePoint41_2_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (2*n+2)=16*cyclePoint41_2_2MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (2*n+2) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (2*n+2) (4*n+6)=0 := by
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
 unfold smallValue41MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint41_2_2MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_2_3MCFC (N x : ℤ) : ℤ := (((((((55296*N + 387072)*N + 1499904)*N + 3427200)*N + 4161024)*N + 1266048)*N + (-2934144))*N + 3628800)

theorem cyclePoint41_2_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (2*n+3)=16*cyclePoint41_2_3MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (2*n+3) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (2*n+3) (4*n+6)=0 := by
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
 unfold smallValue41MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint41_2_3MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_2_4MCFC (N x : ℤ) : ℤ := (((((((55296*N + 193536)*N + 628992)*N + 1249920)*N + 935424)*N + 1217664)*N + (-289152))*N + 241920)

theorem cyclePoint41_2_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (2*n+4)=16*cyclePoint41_2_4MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (2*n+4) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (2*n+4) (4*n+6)=0 := by
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
 unfold smallValue41MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint41_2_4MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_2_5MCFC (N x : ℤ) : ℤ := (((((((55296*N)*N + 274176)*N + 685440)*N + (-1967616))*N + 4878720)*N + (-5256576))*N + 2479680)

theorem cyclePoint41_2_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (2*n+5)=16*cyclePoint41_2_5MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (2*n+5) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (2*n+5) (4*n+6)=0 := by
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
 unfold smallValue41MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint41_2_5MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_2_6MCFC (N x : ℤ) : ℤ := (((((((55296*N + (-193536))*N + 435456)*N + 1088640)*N + (-9063936))*N + 26441856)*N + (-38480256))*N + 23284800)

theorem cyclePoint41_2_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (2*n+6)=16*cyclePoint41_2_6MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (2*n+6) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (2*n+6) (4*n+6)=0 := by
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
 unfold smallValue41MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cyclePoint41_2_6MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleWindowGap41_2_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 925702815744)*N + 44091427258368)*N + 1274064643031040)*N + 24871893578219520)*N + 345505204936507392)*N + 3501061742173814784)*N + 26065868186344734720)*N + 141452622810738892800)*N + 545408971190303883264)*N + 1417590782372195278848)*N + 2228826420722088714240)*N + 1602222500380678041600)

theorem cycleWindowGap41_2_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_2_1MCFC (N+7) 0)*(cyclePoint41_2_3MCFC (N+7) 0)≤(cyclePoint41_2_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_2_2MCFC (N+7) 0)^2-(cyclePoint41_2_1MCFC (N+7) 0)*(cyclePoint41_2_3MCFC (N+7) 0)=cycleWindowGap41_2_1MCFCCert N Z x := by
  unfold cycleWindowGap41_2_1MCFCCert cyclePoint41_2_1MCFC cyclePoint41_2_2MCFC cyclePoint41_2_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_2_1MCFCCert
 positivity

def cycleWindowGap41_2_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 861492215808)*N + 38208428310528)*N + 1028735560581120)*N + 18726060727664640)*N + 242767554477686784)*N + 2298204724995293184)*N + 16005723524843028480)*N + 81380012596500602880)*N + 294554511720547319808)*N + 720305574332477349888)*N + 1068335074059505459200)*N + 726642046330415308800)

theorem cycleWindowGap41_2_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_2_2MCFC (N+7) 0)*(cyclePoint41_2_4MCFC (N+7) 0)≤(cyclePoint41_2_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_2_3MCFC (N+7) 0)^2-(cyclePoint41_2_2MCFC (N+7) 0)*(cyclePoint41_2_4MCFC (N+7) 0)=cycleWindowGap41_2_2MCFCCert N Z x := by
  unfold cycleWindowGap41_2_2MCFCCert cyclePoint41_2_2MCFC cyclePoint41_2_3MCFC cyclePoint41_2_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_2_2MCFCCert
 positivity

def cycleWindowGap41_2_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 797281615872)*N + 32734474665984)*N + 816225229209600)*N + 13766866518343680)*N + 165476394585686016)*N + 1453525527830003712)*N + 9401400576239616000)*N + 44440658167973437440)*N + 149729276460884262912)*N + 341304160261993979904)*N + 472601438417370931200)*N + 300623967656377344000)

theorem cycleWindowGap41_2_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_2_3MCFC (N+7) 0)*(cyclePoint41_2_5MCFC (N+7) 0)≤(cyclePoint41_2_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_2_4MCFC (N+7) 0)^2-(cyclePoint41_2_3MCFC (N+7) 0)*(cyclePoint41_2_5MCFC (N+7) 0)=cycleWindowGap41_2_3MCFCCert N Z x := by
  unfold cycleWindowGap41_2_3MCFCCert cyclePoint41_2_3MCFC cyclePoint41_2_4MCFC cyclePoint41_2_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_2_3MCFCCert
 positivity

def cycleWindowGap41_2_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*N + 733071015936)*N + 27669566324736)*N + 634298168770560)*N + 9838386210078720)*N + 108802972209512448)*N + 879912807203340288)*N + 5244391710635212800)*N + 22866936893350502400)*N + 71146256809650978816)*N + 149947115831257522176)*N + 192222603945780387840)*N + 113351052128044953600)

theorem cycleWindowGap41_2_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_2_4MCFC (N+7) 0)*(cyclePoint41_2_6MCFC (N+7) 0)≤(cyclePoint41_2_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_2_5MCFC (N+7) 0)^2-(cyclePoint41_2_4MCFC (N+7) 0)*(cyclePoint41_2_6MCFC (N+7) 0)=cycleWindowGap41_2_4MCFCCert N Z x := by
  unfold cycleWindowGap41_2_4MCFCCert cyclePoint41_2_4MCFC cyclePoint41_2_5MCFC cyclePoint41_2_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_2_4MCFCCert
 positivity
end
end MathGKM.Markov
