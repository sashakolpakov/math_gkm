import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint31_0_0MCFC (N x : ℤ) : ℤ := ((((25515*N + 51030)*N + 31185)*N + 5670)*N)

theorem cyclePoint31_0_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+0)=16*cyclePoint31_0_0MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+0) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_0MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_0_1MCFC (N x : ℤ) : ℤ := ((((306180*N + 272160)*N + 170100)*N + 37800)*N)

theorem cyclePoint31_0_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+1)=16*cyclePoint31_0_1MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+1) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_1MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_0_2MCFC (N x : ℤ) : ℤ := ((((1786050*N + (-578340))*N + 1400490)*N + (-309960))*N + 60480)

theorem cyclePoint31_0_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+2)=16*cyclePoint31_0_2MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+2) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_2MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_0_3MCFC (N x : ℤ) : ℤ := ((((6838020*N + (-11294640))*N + 15161580)*N + (-9132480))*N + 2419200)

theorem cyclePoint31_0_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+3)=16*cyclePoint31_0_3MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+3) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_3MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_0_4MCFC (N x : ℤ) : ℤ := ((((19621035*N + (-60844770))*N + 102533445)*N + (-87792390))*N + 31426920)

theorem cyclePoint31_0_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+4)=16*cyclePoint31_0_4MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+4) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_4MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_0_5MCFC (N x : ℤ) : ℤ := ((((45722880*N + (-213373440))*N + 466300800)*N + (-514080000))*N + 233392320)

theorem cyclePoint31_0_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+5)=16*cyclePoint31_0_5MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+5) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_5MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cyclePoint31_0_6MCFC (N x : ℤ) : ℤ := ((((91445760*N + (-579156480))*N + 1598849280)*N + (-2179336320))*N + 1208088000)

theorem cyclePoint31_0_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue31MCFC n (0*n+6)=16*cyclePoint31_0_6MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (0*n+6) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 simp only [cyclePoint31_0_6MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleWindowGap31_0_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((48175126650*N + 2788081203600)*N + 70636019932800)*N + 1023185197660500)*N + 9268151968986750)*N + 53756256373022700)*N + 194961419607465000)*N + 404223460883600400)*N + 366818972204361600)

theorem cycleWindowGap31_0_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_0_0MCFC (N+7) 0)*(cyclePoint31_0_2MCFC (N+7) 0)≤(cyclePoint31_0_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_0_1MCFC (N+7) 0)^2-(cyclePoint31_0_0MCFC (N+7) 0)*(cyclePoint31_0_2MCFC (N+7) 0)=cycleWindowGap31_0_0MCFCCert N Z x := by
  unfold cycleWindowGap31_0_0MCFCCert cyclePoint31_0_0MCFC cyclePoint31_0_1MCFC cyclePoint31_0_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_0_0MCFCCert
 positivity

def cycleWindowGap31_0_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((1096309638900*N + 60924608816400)*N + 1483774804373400)*N + 20682640276930800)*N + 180463224984203700)*N + 1009209465402415200)*N + 3532242789767210400)*N + 7073704403147491200)*N + 6205218963546254400)

theorem cycleWindowGap31_0_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_0_1MCFC (N+7) 0)*(cyclePoint31_0_3MCFC (N+7) 0)≤(cyclePoint31_0_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_0_2MCFC (N+7) 0)^2-(cyclePoint31_0_1MCFC (N+7) 0)*(cyclePoint31_0_3MCFC (N+7) 0)=cycleWindowGap31_0_1MCFCCert N Z x := by
  unfold cycleWindowGap31_0_1MCFCCert cyclePoint31_0_1MCFC cyclePoint31_0_2MCFC cyclePoint31_0_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_0_1MCFCCert
 positivity

def cycleWindowGap31_0_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((11714367958650*N + 621558088099200)*N + 14473354857834600)*N + 193147220805770700)*N + 1615406640155220150)*N + 8669142543914388900)*N + 29147532302254653000)*N + 56127517540456647600)*N + 47386520312790153600)

theorem cycleWindowGap31_0_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_0_2MCFC (N+7) 0)*(cyclePoint31_0_4MCFC (N+7) 0)≤(cyclePoint31_0_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_0_3MCFC (N+7) 0)^2-(cyclePoint31_0_2MCFC (N+7) 0)*(cyclePoint31_0_4MCFC (N+7) 0)=cycleWindowGap31_0_2MCFCCert N Z x := by
  unfold cycleWindowGap31_0_2MCFCCert cyclePoint31_0_2MCFC cyclePoint31_0_3MCFC cyclePoint31_0_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_0_2MCFCCert
 positivity

def cycleWindowGap31_0_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((72331046573625*N + 3638339204201100)*N + 80474354279496450)*N + 1021918809088485000)*N + 8145989463533731425)*N + 41724503627830512300)*N + 134066109082540616100)*N + 246991459464354024000)*N + 199702147984360761600)

theorem cycleWindowGap31_0_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_0_3MCFC (N+7) 0)*(cyclePoint31_0_5MCFC (N+7) 0)≤(cyclePoint31_0_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_0_4MCFC (N+7) 0)^2-(cyclePoint31_0_3MCFC (N+7) 0)*(cyclePoint31_0_5MCFC (N+7) 0)=cycleWindowGap31_0_3MCFCCert N Z x := by
  unfold cycleWindowGap31_0_3MCFCCert cyclePoint31_0_3MCFC cyclePoint31_0_4MCFC cyclePoint31_0_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_0_3MCFCCert
 positivity

def cycleWindowGap31_0_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((296321297932800*N + 14009542098854400)*N + 292098228716448000)*N + 3505497031052553600)*N + 26466231474727732800)*N + 128634647164401369600)*N + 392801673500731051200)*N + 688618504312053033600)*N + 530377345418462438400)

theorem cycleWindowGap31_0_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint31_0_4MCFC (N+7) 0)*(cyclePoint31_0_6MCFC (N+7) 0)≤(cyclePoint31_0_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint31_0_5MCFC (N+7) 0)^2-(cyclePoint31_0_4MCFC (N+7) 0)*(cyclePoint31_0_6MCFC (N+7) 0)=cycleWindowGap31_0_4MCFCCert N Z x := by
  unfold cycleWindowGap31_0_4MCFCCert cyclePoint31_0_4MCFC cyclePoint31_0_5MCFC cyclePoint31_0_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap31_0_4MCFCCert
 positivity
end
end MathGKM.Markov
