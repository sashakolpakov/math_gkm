import MarkovSmallNumerator32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cyclePoint32_0_0MCFC (N x : ℤ) : ℤ := ((((25515*N + 85050)*N + 99225)*N + 47250)*N + 7560)

theorem cyclePoint32_0_0MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+0)=16*cyclePoint32_0_0MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+0) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_0MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_0_1MCFC (N x : ℤ) : ℤ := ((((306180*N + 680400)*N + 646380)*N + 287280)*N + 45360)

theorem cyclePoint32_0_1MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+1)=16*cyclePoint32_0_1MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+1) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_1MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_0_2MCFC (N x : ℤ) : ℤ := ((((1786050*N + 1803060)*N + 2012850)*N + 695520)*N + 113400)

theorem cyclePoint32_0_2MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+2)=16*cyclePoint32_0_2MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+2) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_2MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_0_3MCFC (N x : ℤ) : ℤ := ((((6838020*N + (-2177280))*N + 8425620)*N + (-1776600))*N + 725760)

theorem cyclePoint32_0_3MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+3)=16*cyclePoint32_0_3MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+3) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_3MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_0_4MCFC (N x : ℤ) : ℤ := ((((19621035*N + (-34683390))*N + 54769365)*N + (-36811530))*N + 11544120)

theorem cyclePoint32_0_4MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+4)=16*cyclePoint32_0_4MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+4) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_4MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_0_5MCFC (N x : ℤ) : ℤ := ((((45722880*N + (-152409600))*N + 283409280)*N + (-267563520))*N + 106505280)

theorem cyclePoint32_0_5MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+5)=16*cyclePoint32_0_5MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+5) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_5MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cyclePoint32_0_6MCFC (N x : ℤ) : ℤ := ((((91445760*N + (-457228800))*N + 1080656640)*N + (-1292941440))*N + 638971200)

theorem cyclePoint32_0_6MCFC_value (n j : ℕ) (hn : 7≤n)  :
 5040*smallValue32MCFC n (0*n+6)=16*cyclePoint32_0_6MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (0*n+6) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 simp only [cyclePoint32_0_6MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cycleWindowGap32_0_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((48175126650*N + 2916548208000)*N + 77291420913000)*N + 1171062679115700)*N + 11094843143805750)*N + 67304203579777500)*N + 255288724980496200)*N + 553554482924494800)*N + 525332208691382400)

theorem cycleWindowGap32_0_0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_0_0MCFC (N+7) 0)*(cyclePoint32_0_2MCFC (N+7) 0)≤(cyclePoint32_0_1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_0_1MCFC (N+7) 0)^2-(cyclePoint32_0_0MCFC (N+7) 0)*(cyclePoint32_0_2MCFC (N+7) 0)=cycleWindowGap32_0_0MCFCCert N Z x := by
  unfold cycleWindowGap32_0_0MCFCCert cyclePoint32_0_0MCFC cyclePoint32_0_1MCFC cyclePoint32_0_2MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_0_0MCFCCert
 positivity

def cycleWindowGap32_0_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((1096309638900*N + 63848101186800)*N + 1629342966043800)*N + 23794621133648400)*N + 217487173892555700)*N + 1273933480676925600)*N + 4669701389274852000)*N + 9792985309008451200)*N + 8995285098871848000)

theorem cycleWindowGap32_0_1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_0_1MCFC (N+7) 0)*(cyclePoint32_0_3MCFC (N+7) 0)≤(cyclePoint32_0_2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_0_2MCFC (N+7) 0)^2-(cyclePoint32_0_1MCFC (N+7) 0)*(cyclePoint32_0_3MCFC (N+7) 0)=cycleWindowGap32_0_1MCFCCert N Z x := by
  unfold cycleWindowGap32_0_1MCFCCert cyclePoint32_0_1MCFC cyclePoint32_0_2MCFC cyclePoint32_0_3MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_0_1MCFCCert
 positivity

def cycleWindowGap32_0_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((11714367958650*N + 652796402655600)*N + 15960101763715200)*N + 223568529193881900)*N + 1962256779903297150)*N + 11048618364927210900)*N + 38967883029709036200)*N + 78700525471420095600)*N + 69676145156089987200)

theorem cycleWindowGap32_0_2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_0_2MCFC (N+7) 0)*(cyclePoint32_0_4MCFC (N+7) 0)≤(cyclePoint32_0_3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_0_3MCFC (N+7) 0)^2-(cyclePoint32_0_2MCFC (N+7) 0)*(cyclePoint32_0_4MCFC (N+7) 0)=cycleWindowGap32_0_2MCFCCert N Z x := by
  unfold cycleWindowGap32_0_2MCFCCert cyclePoint32_0_2MCFC cyclePoint32_0_3MCFC cyclePoint32_0_4MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_0_2MCFCCert
 positivity

def cycleWindowGap32_0_3MCFCCert (N Z x : ℤ) : ℤ := ((((((((72331046573625*N + 3831221995064100)*N + 89188842345305850)*N + 1191506995739062800)*N + 9988090276427296425)*N + 53782487679534950700)*N + 181614980661260271300)*N + 351548950278870388800)*N + 298579106064258028800)

theorem cycleWindowGap32_0_3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_0_3MCFC (N+7) 0)*(cyclePoint32_0_5MCFC (N+7) 0)≤(cyclePoint32_0_4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_0_4MCFC (N+7) 0)^2-(cyclePoint32_0_3MCFC (N+7) 0)*(cyclePoint32_0_5MCFC (N+7) 0)=cycleWindowGap32_0_3MCFCCert N Z x := by
  unfold cycleWindowGap32_0_3MCFCCert cyclePoint32_0_3MCFC cyclePoint32_0_4MCFC cyclePoint32_0_5MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_0_3MCFCCert
 positivity

def cycleWindowGap32_0_4MCFCCert (N Z x : ℤ) : ℤ := ((((((((296321297932800*N + 14799732226675200)*N + 325709048762899200)*N + 4122997012371081600)*N + 32813973505345636800)*N + 168040443350730585600)*N + 540434121562426190400)*N + 997509162162635337600)*N + 808667300082650803200)

theorem cycleWindowGap32_0_4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (cyclePoint32_0_4MCFC (N+7) 0)*(cyclePoint32_0_6MCFC (N+7) 0)≤(cyclePoint32_0_5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (cyclePoint32_0_5MCFC (N+7) 0)^2-(cyclePoint32_0_4MCFC (N+7) 0)*(cyclePoint32_0_6MCFC (N+7) 0)=cycleWindowGap32_0_4MCFCCert N Z x := by
  unfold cycleWindowGap32_0_4MCFCCert cyclePoint32_0_4MCFC cyclePoint32_0_5MCFC cyclePoint32_0_6MCFC
  ring
 rw [he]
 unfold cycleWindowGap32_0_4MCFCCert
 positivity
end
end MathGKM.Markov
