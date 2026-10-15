import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint41_0_0MCFC (N x : ℤ) : ℤ := ((((80640*N + 201600)*N + 176400)*N + 63000)*N + 7560)

theorem cyclePoint41_0_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+0)=16*cyclePoint41_0_0MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+0) (0*n+0)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+0)-(0*n+0)=0 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+0) (0*n+1)=0 := by
  exact if_neg (by omega)
 have h0_2 : chooseShiftSevenK0B (0*n+0) (0*n+2)=0 := by
  exact if_neg (by omega)
 have h0_3 : chooseShiftSevenK0B (0*n+0) (0*n+3)=0 := by
  exact if_neg (by omega)
 have h0_4 : chooseShiftSevenK0B (0*n+0) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (0*n+0) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (0*n+0) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0*n+0) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+0) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+0) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+0) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+0) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+0) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+0) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+0) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+0) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+0) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+0) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+0) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+0) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+0) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+0) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+0) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+0) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+0) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+0) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+0) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+0) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+0) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+0) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+0) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+0) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+0) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+0) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+0) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+0) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+0) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+0) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+0) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+0) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+0) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+0) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+0) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+0) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+0) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+0) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+0) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+0) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+0) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+0) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+0) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+0) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_0MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_0_1MCFC (N x : ℤ) : ℤ := ((((967680*N + 1370880)*N + 907200)*N + 307440)*N + 37800)

theorem cyclePoint41_0_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+1)=16*cyclePoint41_0_1MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+1) (0*n+0)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+1)-(0*n+0)=1 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+1) (0*n+1)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+1)-(0*n+1)=0 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (0*n+1) (0*n+2)=0 := by
  exact if_neg (by omega)
 have h0_3 : chooseShiftSevenK0B (0*n+1) (0*n+3)=0 := by
  exact if_neg (by omega)
 have h0_4 : chooseShiftSevenK0B (0*n+1) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (0*n+1) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (0*n+1) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0*n+1) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+1) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+1) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+1) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+1) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+1) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+1) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+1) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+1) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+1) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+1) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+1) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+1) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+1) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+1) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+1) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+1) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+1) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+1) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+1) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+1) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+1) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+1) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+1) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+1) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+1) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+1) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+1) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+1) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+1) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+1) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+1) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+1) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+1) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+1) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+1) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+1) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+1) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+1) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+1) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+1) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+1) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+1) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+1) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+1) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_1MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_0_2MCFC (N x : ℤ) : ℤ := ((((5644800*N + 1451520)*N + 2852640)*N + 468720)*N + 75600)

theorem cyclePoint41_0_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+2)=16*cyclePoint41_0_2MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+2) (0*n+0)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+2)-(0*n+0)=2 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+2) (0*n+1)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+2)-(0*n+1)=1 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (0*n+2) (0*n+2)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+2)-(0*n+2)=0 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (0*n+2) (0*n+3)=0 := by
  exact if_neg (by omega)
 have h0_4 : chooseShiftSevenK0B (0*n+2) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (0*n+2) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (0*n+2) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0*n+2) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+2) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+2) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+2) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+2) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+2) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+2) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+2) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+2) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+2) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+2) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+2) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+2) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+2) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+2) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+2) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+2) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+2) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+2) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+2) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+2) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+2) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+2) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+2) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+2) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+2) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+2) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+2) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+2) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+2) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+2) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+2) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+2) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+2) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+2) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+2) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+2) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+2) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+2) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+2) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+2) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+2) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+2) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+2) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+2) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_2MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_0_3MCFC (N x : ℤ) : ℤ := ((((21611520*N + (-21369600))*N + 23929920)*N + (-8613360))*N + 1648080)

theorem cyclePoint41_0_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+3)=16*cyclePoint41_0_3MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+3) (0*n+0)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+3)-(0*n+0)=3 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+3) (0*n+1)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+3)-(0*n+1)=2 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (0*n+3) (0*n+2)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+3)-(0*n+2)=1 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (0*n+3) (0*n+3)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+3)-(0*n+3)=0 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (0*n+3) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (0*n+3) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (0*n+3) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0*n+3) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+3) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+3) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+3) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+3) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+3) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+3) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+3) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+3) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+3) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+3) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+3) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+3) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+3) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+3) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+3) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+3) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+3) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+3) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+3) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+3) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+3) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+3) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+3) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+3) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+3) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+3) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+3) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+3) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+3) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+3) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+3) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+3) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+3) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+3) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+3) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+3) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+3) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+3) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+3) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+3) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+3) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+3) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+3) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+3) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_3MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_0_4MCFC (N x : ℤ) : ℤ := ((((62012160*N + (-144224640))*N + 186152400)*N + (-117056520))*N + 30398760)

theorem cyclePoint41_0_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+4)=16*cyclePoint41_0_4MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+4) (0*n+0)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+4)-(0*n+0)=4 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+4) (0*n+1)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+4)-(0*n+1)=3 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (0*n+4) (0*n+2)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+4)-(0*n+2)=2 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (0*n+4) (0*n+3)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+4)-(0*n+3)=1 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (0*n+4) (0*n+4)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+4)-(0*n+4)=0 by omega]
  norm_num [Nat.choose]
 have h0_5 : chooseShiftSevenK0B (0*n+4) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (0*n+4) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0*n+4) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+4) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+4) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+4) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+4) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+4) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+4) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+4) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+4) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+4) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+4) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+4) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+4) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+4) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+4) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+4) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+4) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+4) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+4) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+4) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+4) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+4) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+4) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+4) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+4) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+4) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+4) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+4) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+4) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+4) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+4) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+4) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+4) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+4) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+4) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+4) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+4) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+4) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+4) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+4) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+4) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+4) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+4) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+4) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+4) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_4MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_0_5MCFC (N x : ℤ) : ℤ := ((((144506880*N + (-541900800))*N + 933488640)*N + (-793497600))*N + 272643840)

theorem cyclePoint41_0_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+5)=16*cyclePoint41_0_5MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+5) (0*n+0)=792 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+5)-(0*n+0)=5 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+5) (0*n+1)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+5)-(0*n+1)=4 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (0*n+5) (0*n+2)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+5)-(0*n+2)=3 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (0*n+5) (0*n+3)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+5)-(0*n+3)=2 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (0*n+5) (0*n+4)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+5)-(0*n+4)=1 by omega]
  norm_num [Nat.choose]
 have h0_5 : chooseShiftSevenK0B (0*n+5) (0*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+5)-(0*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h0_6 : chooseShiftSevenK0B (0*n+5) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0*n+5) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+5) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+5) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+5) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+5) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+5) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+5) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+5) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+5) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+5) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+5) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+5) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+5) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+5) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+5) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+5) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+5) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+5) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+5) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+5) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+5) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+5) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+5) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+5) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+5) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+5) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+5) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+5) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+5) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+5) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+5) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+5) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+5) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+5) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+5) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+5) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+5) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+5) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+5) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+5) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+5) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+5) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+5) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+5) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+5) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_5MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cyclePoint41_0_6MCFC (N x : ℤ) : ℤ := ((((289013760*N + (-1517322240))*N + 3388170240)*N + (-3658314240))*N + 1577439360)

theorem cyclePoint41_0_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue41MCFC n (0*n+6)=16*cyclePoint41_0_6MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0*n+6) (0*n+0)=1716 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+0)=6 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0*n+6) (0*n+1)=792 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+1)=5 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (0*n+6) (0*n+2)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+2)=4 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (0*n+6) (0*n+3)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+3)=3 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (0*n+6) (0*n+4)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+4)=2 by omega]
  norm_num [Nat.choose]
 have h0_5 : chooseShiftSevenK0B (0*n+6) (0*n+5)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+5)=1 by omega]
  norm_num [Nat.choose]
 have h0_6 : chooseShiftSevenK0B (0*n+6) (0*n+6)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0*n+6)-(0*n+6)=0 by omega]
  norm_num [Nat.choose]
 have h0_7 : chooseShiftSevenK0B (0*n+6) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0*n+6) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0*n+6) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0*n+6) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0*n+6) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0*n+6) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0*n+6) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0*n+6) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0*n+6) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0*n+6) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0*n+6) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0*n+6) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0*n+6) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0*n+6) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0*n+6) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0*n+6) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0*n+6) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0*n+6) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0*n+6) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0*n+6) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0*n+6) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0*n+6) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0*n+6) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0*n+6) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0*n+6) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0*n+6) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0*n+6) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (0*n+6) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (0*n+6) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (0*n+6) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (0*n+6) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (0*n+6) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (0*n+6) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (0*n+6) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (0*n+6) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (0*n+6) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h4_5 : chooseShiftSevenK0B (0*n+6) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (0*n+6) (4*n+6)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (0*n+6) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (0*n+6) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (0*n+6) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (0*n+6) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (0*n+6) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (0*n+6) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (0*n+6) (4*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue41MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 simp only [cyclePoint41_0_6MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleWindowGap41_0_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((481207910400*N + 28345747046400)*N + 730841016729600)*N + 10772448306278400)*N + 99282624393254400)*N + 585857743105420800)*N + 2161544363455478400)*N + 4558943115938131200)*N + 4208250343213224000)

theorem cycleWindowGap41_0_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_0_0MCFC (N+7) 0)*(cyclePoint41_0_2MCFC (N+7) 0)≤(cyclePoint41_0_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_0_1MCFC (N+7) 0)^2-(cyclePoint41_0_0MCFC (N+7) 0)*(cyclePoint41_0_2MCFC (N+7) 0)=cycleWindowGap41_0_0MCFCCert N Z x := by
  unfold cycleWindowGap41_0_0MCFCCert cyclePoint41_0_0MCFC cyclePoint41_0_1MCFC cyclePoint41_0_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_0_0MCFCCert
 positivity

def cycleWindowGap41_0_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((10950731366400*N + 620680170700800)*N + 15409769685811200)*N + 218873924410982400)*N + 1945187272386892800)*N + 11075925220604697600)*N + 39457689507169920000)*N + 80404490852788636800)*N + 71750436225168153600)

theorem cycleWindowGap41_0_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_0_1MCFC (N+7) 0)*(cyclePoint41_0_3MCFC (N+7) 0)≤(cyclePoint41_0_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_0_2MCFC (N+7) 0)^2-(cyclePoint41_0_1MCFC (N+7) 0)*(cyclePoint41_0_3MCFC (N+7) 0)=cycleWindowGap41_0_1MCFCCert N Z x := by
  unfold cycleWindowGap41_0_1MCFCCert cyclePoint41_0_1MCFC cyclePoint41_0_2MCFC cyclePoint41_0_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_0_1MCFCCert
 positivity

def cycleWindowGap41_0_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((117011555942400*N + 6353095414579200)*N + 151234457768755200)*N + 2061447881336524800)*N + 17596669837773196800)*N + 96313371866870054400)*N + 330066996512817513600)*N + 647471770771135564800)*N + 556572578418081792000)

theorem cycleWindowGap41_0_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_0_2MCFC (N+7) 0)*(cyclePoint41_0_4MCFC (N+7) 0)≤(cyclePoint41_0_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_0_3MCFC (N+7) 0)^2-(cyclePoint41_0_2MCFC (N+7) 0)*(cyclePoint41_0_4MCFC (N+7) 0)=cycleWindowGap41_0_2MCFCCert N Z x := by
  unfold cycleWindowGap41_0_2MCFCCert cyclePoint41_0_2MCFC cyclePoint41_0_3MCFC cyclePoint41_0_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_0_2MCFCCert
 positivity

def cycleWindowGap41_0_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((722494660608000*N + 37371692290867200)*N + 848626069681152000)*N + 11047596919885209600)*N + 90165314066123116800)*N + 472338573053108832000)*N + 1550712354518408961600)*N + 2916607036068493286400)*N + 2405666443200743116800)

theorem cycleWindowGap41_0_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_0_3MCFC (N+7) 0)*(cyclePoint41_0_5MCFC (N+7) 0)≤(cyclePoint41_0_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_0_4MCFC (N+7) 0)^2-(cyclePoint41_0_3MCFC (N+7) 0)*(cyclePoint41_0_5MCFC (N+7) 0)=cycleWindowGap41_0_3MCFCCert N Z x := by
  unfold cycleWindowGap41_0_3MCFCCert cyclePoint41_0_3MCFC cyclePoint41_0_4MCFC cyclePoint41_0_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_0_3MCFCCert
 positivity

def cycleWindowGap41_0_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((2959870840012800*N + 144911314295193600)*N + 3120415532856115200)*N + 38587662581258649600)*N + 299625248939382374400)*N + 1495361627646321254400)*N + 4682692020522891110400)*N + 8409236398690006656000)*N + 6628297855357482393600)

theorem cycleWindowGap41_0_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint41_0_4MCFC (N+7) 0)*(cyclePoint41_0_6MCFC (N+7) 0)≤(cyclePoint41_0_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint41_0_5MCFC (N+7) 0)^2-(cyclePoint41_0_4MCFC (N+7) 0)*(cyclePoint41_0_6MCFC (N+7) 0)=cycleWindowGap41_0_4MCFCCert N Z x := by
  unfold cycleWindowGap41_0_4MCFCCert cyclePoint41_0_4MCFC cyclePoint41_0_5MCFC cyclePoint41_0_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap41_0_4MCFCCert
 positivity
end
end MathGKM.Markov
