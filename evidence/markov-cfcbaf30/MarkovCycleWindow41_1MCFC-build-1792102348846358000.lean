import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint41_1_0MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1841280)*N + (-3040128))*N + (-24769920))*N + 45569664)*N + 285048960)*N + (-226749312))*N + (-1425513600))

theorem cyclePoint41_1_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+0)=16*cyclePoint41_1_0MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+0) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+0) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+0) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+0) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+0) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+0) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+0) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+0) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+0) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_0MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_1_1MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1860096)*N + 999936)*N + (-7042560))*N + 12628224)*N + 74371584)*N + (-37334016))*N + (-249903360))

theorem cyclePoint41_1_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+1)=16*cyclePoint41_1_1MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+1) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+1) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+1) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+1) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+1) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+1) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+1) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+1) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+1) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_1MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_1_2MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1878912)*N + 3282048)*N + 1975680)*N + 5693184)*N + 15438528)*N + (-3348288))*N + (-29393280))

theorem cyclePoint41_1_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+2)=16*cyclePoint41_1_2MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+2) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+2) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+2) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+2) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+2) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+2) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+2) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+2) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+2) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_2MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_1_3MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1897728)*N + 3806208)*N + 3494400)*N + 5612544)*N + 1986432)*N + 1167552)*N + (-1995840))

theorem cyclePoint41_1_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+3)=16*cyclePoint41_1_3MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+3) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+3) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+3) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+3) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+3) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+3) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+3) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+3) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+3) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_3MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_1_4MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1916544)*N + 2572416)*N + (-1276800))*N + 15208704)*N + (-19328064))*N + 17360064)*N + (-6108480))

theorem cyclePoint41_1_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+4)=16*cyclePoint41_1_4MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+4) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+4) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+4) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+4) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+4) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+4) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+4) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+4) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+4) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_4MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_1_5MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1935360)*N + (-419328))*N + (-11128320))*N + 62302464)*N + (-134507520))*N + 152218368)*N + (-72757440))

theorem cyclePoint41_1_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+5)=16*cyclePoint41_1_5MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+5) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+5) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+5) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+5) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+5) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+5) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+5) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+5) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+5) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_5MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_1_6MCFC (N x : ℤ) : ℤ := (((((((360576*N + 1954176)*N + (-5169024))*N + (-24850560))*N + 202333824)*N + (-584685696))*N + 841279104)*N + (-505310400))

theorem cyclePoint41_1_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (1*n+6)=16*cyclePoint41_1_6MCFC n j := by
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
 have h4_5 : chooseShiftSevenK0B (1*n+6) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (1*n+6) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (1*n+6) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (1*n+6) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (1*n+6) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (1*n+6) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (1*n+6) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (1*n+6) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (1*n+6) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cyclePoint41_1_6MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleWindowGap41_1_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*N + 59804481945600)*N + 2572150895935488)*N + 66705808126648320)*N + 1161489688366178304)*N + 14301311759597076480)*N + 127651375163843887104)*N + 832030884362358374400)*N + 3929580076578523250688)*N + 13112623760045435781120)*N + 29343705630134120644608)*N + 39544772760964628398080)*N + 24280202100525196492800)

theorem cycleWindowGap41_1_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_1_0MCFC (N+7) 0)*(cyclePoint41_1_2MCFC (N+7) 0)≤(cyclePoint41_1_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_1_1MCFC (N+7) 0)^2-(cyclePoint41_1_0MCFC (N+7) 0)*(cyclePoint41_1_2MCFC (N+7) 0)=cycleWindowGap41_1_0MCFCCert N Z x := by
  unfold cycleWindowGap41_1_0MCFCCert cyclePoint41_1_0MCFC cyclePoint41_1_1MCFC cyclePoint41_1_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_1_0MCFCCert
 positivity

def cycleWindowGap41_1_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*N + 59335251591168)*N + 2536500223918080)*N + 65512328460042240)*N + 1138529875999186944)*N + 14025452980777426944)*N + 125579680093346734080)*N + 823431912925547520000)*N + 3924339809928962715648)*N + 13257490574132416217088)*N + 30137399696973866250240)*N + 41395845885378084495360)*N + 25986406683718991462400)

theorem cycleWindowGap41_1_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_1_1MCFC (N+7) 0)*(cyclePoint41_1_3MCFC (N+7) 0)≤(cyclePoint41_1_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_1_2MCFC (N+7) 0)^2-(cyclePoint41_1_1MCFC (N+7) 0)*(cyclePoint41_1_3MCFC (N+7) 0)=cycleWindowGap41_1_1MCFCCert N Z x := by
  unfold cycleWindowGap41_1_1MCFCCert cyclePoint41_1_1MCFC cyclePoint41_1_2MCFC cyclePoint41_1_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_1_1MCFCCert
 positivity

def cycleWindowGap41_1_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*N + 58866021236736)*N + 2496016505880576)*N + 63946533518622720)*N + 1102662239698059264)*N + 13484488056554446848)*N + 119937685970896109568)*N + 781909706499252387840)*N + 3708741582255031676928)*N + 12483707769502339055616)*N + 28310018683009002541056)*N + 38841313989314235248640)*N + 24385700240254983168000)

theorem cycleWindowGap41_1_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_1_2MCFC (N+7) 0)*(cyclePoint41_1_4MCFC (N+7) 0)≤(cyclePoint41_1_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_1_3MCFC (N+7) 0)^2-(cyclePoint41_1_2MCFC (N+7) 0)*(cyclePoint41_1_4MCFC (N+7) 0)=cycleWindowGap41_1_2MCFCCert N Z x := by
  unfold cycleWindowGap41_1_2MCFCCert cyclePoint41_1_2MCFC cyclePoint41_1_3MCFC cyclePoint41_1_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_1_2MCFCCert
 positivity

def cycleWindowGap41_1_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*N + 58396790882304)*N + 2449609359998976)*N + 61952549343068160)*N + 1052828468357750784)*N + 12672824459288297472)*N + 110842897742870888448)*N + 710108512044735283200)*N + 3308311503192180215808)*N + 10934721612804787789824)*N + 24345821023636005605376)*N + 32793339449214632816640)*N + 20214492509333367705600)

theorem cycleWindowGap41_1_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_1_3MCFC (N+7) 0)*(cyclePoint41_1_5MCFC (N+7) 0)≤(cyclePoint41_1_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_1_4MCFC (N+7) 0)^2-(cyclePoint41_1_3MCFC (N+7) 0)*(cyclePoint41_1_5MCFC (N+7) 0)=cycleWindowGap41_1_3MCFCCert N Z x := by
  unfold cycleWindowGap41_1_3MCFCCert cyclePoint41_1_3MCFC cyclePoint41_1_4MCFC cyclePoint41_1_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_1_3MCFCCert
 positivity

def cycleWindowGap41_1_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*N + 57927560527872)*N + 2396333788692480)*N + 59498640480706560)*N + 989166092847980544)*N + 11615213656329486336)*N + 98882321313851228160)*N + 615448940903851622400)*N + 2781498469082573979648)*N + 8907538268720055508992)*N + 19196827921033077288960)*N + 25010000730082182205440)*N + 14902525023226354483200)

theorem cycleWindowGap41_1_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_1_4MCFC (N+7) 0)*(cyclePoint41_1_6MCFC (N+7) 0)≤(cyclePoint41_1_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_1_5MCFC (N+7) 0)^2-(cyclePoint41_1_4MCFC (N+7) 0)*(cyclePoint41_1_6MCFC (N+7) 0)=cycleWindowGap41_1_4MCFCCert N Z x := by
  unfold cycleWindowGap41_1_4MCFCCert cyclePoint41_1_4MCFC cyclePoint41_1_5MCFC cyclePoint41_1_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_1_4MCFCCert
 positivity
end
end MathGKM.Markov
