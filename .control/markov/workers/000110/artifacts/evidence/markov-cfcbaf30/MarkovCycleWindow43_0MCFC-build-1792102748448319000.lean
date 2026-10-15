import MarkovSmallNumerator43MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint43_0_0MCFC (N x : ℤ) : ℤ := ((((80640*N + 362880)*N + 599760)*N + 430920)*N + 113400)

theorem cyclePoint43_0_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+0)=16*cyclePoint43_0_0MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+0) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+0) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+0) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+0) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+0) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_0MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_0_1MCFC (N x : ℤ) : ℤ := ((((967680*N + 3306240)*N + 4415040)*N + 2726640)*N + 650160)

theorem cyclePoint43_0_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+1)=16*cyclePoint43_0_1MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+1) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+1) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+1) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+1) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+1) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_1MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_0_2MCFC (N x : ℤ) : ℤ := ((((5644800*N + 12741120)*N + 13497120)*N + 7232400)*N + 1557360)

theorem cyclePoint43_0_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+2)=16*cyclePoint43_0_2MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+2) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+2) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+2) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+2) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+2) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_2MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_0_3MCFC (N x : ℤ) : ℤ := ((((21611520*N + 21853440)*N + 24292800)*N + 10095120)*N + 2003400)

theorem cyclePoint43_0_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+3)=16*cyclePoint43_0_3MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+3) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+3) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+3) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+3) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+3) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_3MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_0_4MCFC (N x : ℤ) : ℤ := ((((62012160*N + (-20200320))*N + 62833680)*N + (-8066520))*N + 4256280)

theorem cyclePoint43_0_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+4)=16*cyclePoint43_0_4MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+4) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+4) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+4) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+4) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+4) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_4MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_0_5MCFC (N x : ℤ) : ℤ := ((((144506880*N + (-252887040))*N + 337397760)*N + (-194181120))*N + 50561280)

theorem cyclePoint43_0_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+5)=16*cyclePoint43_0_5MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+5) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+5) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+5) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+5) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+5) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_5MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cyclePoint43_0_6MCFC (N x : ℤ) : ℤ := ((((289013760*N + (-939294720))*N + 1545707520)*N + (-1263628800))*N + 423722880)

theorem cyclePoint43_0_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue43MCFC n (0*n+6)=16*cyclePoint43_0_6MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (0*n+6) (2*n+13)=0 := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+6) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (0*n+6) (3*n+14)=0 := by
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
 have h4_14 : chooseShiftSevenK0B (0*n+6) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (0*n+6) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 simp only [cyclePoint43_0_6MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cycleWindowGap43_0_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((481207910400*N + 30270578688000)*N + 833419586764800)*N + 13117154983833600)*N + 129080516899622400)*N + 813244063634956800)*N + 3203424450964483200)*N + 7213028652097228800)*N + 7107893655690240000)

theorem cycleWindowGap43_0_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_0_0MCFC (N+7) 0)*(cyclePoint43_0_2MCFC (N+7) 0)≤(cyclePoint43_0_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_0_1MCFC (N+7) 0)^2-(cyclePoint43_0_0MCFC (N+7) 0)*(cyclePoint43_0_2MCFC (N+7) 0)=cycleWindowGap43_0_0MCFCCert N Z x := by
  unfold cycleWindowGap43_0_0MCFCCert cyclePoint43_0_0MCFC cyclePoint43_0_1MCFC cyclePoint43_0_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_0_0MCFCCert
 positivity

def cycleWindowGap43_0_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((10950731366400*N + 664483096166400)*N + 17658805402828800)*N + 268438459484160000)*N + 2552922104932684800)*N + 15553385902273766400)*N + 59277809423558476800)*N + 129213073916114428800)*N + 123330254365084032000)

theorem cycleWindowGap43_0_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_0_1MCFC (N+7) 0)*(cyclePoint43_0_3MCFC (N+7) 0)≤(cyclePoint43_0_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_0_2MCFC (N+7) 0)^2-(cyclePoint43_0_1MCFC (N+7) 0)*(cyclePoint43_0_3MCFC (N+7) 0)=cycleWindowGap43_0_1MCFCCert N Z x := by
  unfold cycleWindowGap43_0_1MCFCCert cyclePoint43_0_1MCFC cyclePoint43_0_2MCFC cyclePoint43_0_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_0_1MCFCCert
 positivity

def cycleWindowGap43_0_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((117011555942400*N + 6821141638348800)*N + 174289372611379200)*N + 2549324086460928000)*N + 23345725475743372800)*N + 137052519556621939200)*N + 503654871637032796800)*N + 1059245392209774739200)*N + 976031009655402254400)

theorem cycleWindowGap43_0_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_0_2MCFC (N+7) 0)*(cyclePoint43_0_4MCFC (N+7) 0)≤(cyclePoint43_0_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_0_3MCFC (N+7) 0)^2-(cyclePoint43_0_2MCFC (N+7) 0)*(cyclePoint43_0_4MCFC (N+7) 0)=cycleWindowGap43_0_2MCFCCert N Z x := by
  unfold cycleWindowGap43_0_2MCFCCert cyclePoint43_0_2MCFC cyclePoint43_0_3MCFC cyclePoint43_0_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_0_2MCFCCert
 positivity

def cycleWindowGap43_0_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((722494660608000*N + 40261670933299200)*N + 984484455323443200)*N + 13794733976079974400)*N + 121133316195053164800)*N + 682492773601813305600)*N + 2409098109551919374400)*N + 4870271601520085376000)*N + 4316684495600039270400)

theorem cycleWindowGap43_0_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_0_3MCFC (N+7) 0)*(cyclePoint43_0_5MCFC (N+7) 0)≤(cyclePoint43_0_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_0_4MCFC (N+7) 0)^2-(cyclePoint43_0_3MCFC (N+7) 0)*(cyclePoint43_0_5MCFC (N+7) 0)=cycleWindowGap43_0_3MCFCCert N Z x := by
  unfold cycleWindowGap43_0_3MCFCCert cyclePoint43_0_3MCFC cyclePoint43_0_4MCFC cyclePoint43_0_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_0_3MCFCCert
 positivity

def cycleWindowGap43_0_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((2959870840012800*N + 156750797655244800)*N + 3648324228769382400)*N + 48730412675756851200)*N + 408442900075705958400)*N + 2199204494084363673600)*N + 7426428696183571200000)*N + 14375922021553312281600)*N + 12210491605977713664000)

theorem cycleWindowGap43_0_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint43_0_4MCFC (N+7) 0)*(cyclePoint43_0_6MCFC (N+7) 0)≤(cyclePoint43_0_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint43_0_5MCFC (N+7) 0)^2-(cyclePoint43_0_4MCFC (N+7) 0)*(cyclePoint43_0_6MCFC (N+7) 0)=cycleWindowGap43_0_4MCFCCert N Z x := by
  unfold cycleWindowGap43_0_4MCFCCert cyclePoint43_0_4MCFC cyclePoint43_0_5MCFC cyclePoint43_0_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap43_0_4MCFCCert
 positivity
end
end MathGKM.Markov
