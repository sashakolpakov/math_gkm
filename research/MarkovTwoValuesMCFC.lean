import MarkovSmallNumerator21MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def twoInitialMCFC (N x : ℤ) : ℤ := (((((((215040*x + (-1290240))*x + 3655680)*x + (-3870720))*N + (((((-537600)*x + 5160960)*x + (-23331840))*x + 52899840)*x + (-49029120)))*N + (((((516096*x + (-6773760))*x + 43169280)*x + (-153538560))*x + 295970304)*x + (-242887680)))*N + (((((((-225792)*x + 3741696)*x + (-30912000))*x + 151280640)*x + (-449879808))*x + 757499904)*x + (-557585280)))*N + (((((((38016*x + (-758016))*x + 7693056)*x + (-48061440))*x + 194310144)*x + (-499855104))*x + 748825344)*x + (-499685760)))

theorem twoInitialMCFC_value (n j : ℕ) (hj : 5≤j) (hju : j<n+2) :
 5040*smallValue21MCFC n (j)=16*twoInitialMCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (j) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (j) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (j) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (j) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (j) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (j) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (j) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (j) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (j) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (j) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (j) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (j) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (j) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (j) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (j) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (j) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (j) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (j) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (j) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (j) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (j) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (j) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (j) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (j) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (j) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (j) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (j) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (j) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (j) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (j) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (j) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (j) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (j) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (j) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (j) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoInitialMCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoMiddleMCFC (N x : ℤ) : ℤ := (((((((49152*N + ((-344064)*x + 1032192))*N + ((1032192*x + (-6193152))*x + 10924032))*N + ((((-1505280)*x + 14192640)*x + (-50964480))*x + 67092480))*N + ((((1182720*x + (-15482880))*x + 85908480)*x + (-230952960))*x + 248844288))*N + ((((((-516096)*x + 8709120)*x + (-66071040))*x + 272240640)*x + (-597649920))*x + 552158208))*N + ((((((118272*x + (-2451456))*x + 23708160)*x + (-132572160))*x + 443740416)*x + (-832591872))*x + 677985408))*N + ((((((((-11136)*x + 274176)*x + (-3230976))*x + 22901760)*x + (-103563264))*x + 295190784)*x + (-486745344))*x + 355743360))

theorem twoMiddleMCFC_value (n j : ℕ) (hj : n+5≤j) (hju : j<2*n+3) :
 5040*smallValue21MCFC n (j)=16*twoMiddleMCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (j) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (j) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (j) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (j) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (j) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (j) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (j) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (j) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (j) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (j) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (j) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (j) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (j) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (j) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (j) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (j) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (j) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (j) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (j) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (j) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (j) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (j) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (j) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (j) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_3 : chooseShiftSevenK0B (j) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (j) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (j) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (j) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (j) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (j) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (j) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (j) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (j) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (j) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (j) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12 + (smallTerm21_1_2MCFC (n:ℤ))*h1_2 + (smallTerm21_1_3MCFC (n:ℤ))*h1_3 + (smallTerm21_1_4MCFC (n:ℤ))*h1_4 + (smallTerm21_1_5MCFC (n:ℤ))*h1_5 + (smallTerm21_1_6MCFC (n:ℤ))*h1_6 + (smallTerm21_1_7MCFC (n:ℤ))*h1_7 + (smallTerm21_1_8MCFC (n:ℤ))*h1_8 + (smallTerm21_1_9MCFC (n:ℤ))*h1_9 + (smallTerm21_1_10MCFC (n:ℤ))*h1_10 + (smallTerm21_1_11MCFC (n:ℤ))*h1_11 + (smallTerm21_1_12MCFC (n:ℤ))*h1_12
 all_goals simp only [twoMiddleMCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow0MCFC (N x : ℤ) : ℤ := ((((5040*N + 5040)*N + (-1260))*N + (-1260))*N)

theorem twoLow0MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (0)=16*twoLow0MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (0) (0*n+0)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (0)-(0*n+0)=0 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (0) (0*n+1)=0 := by
  exact if_neg (by omega)
 have h0_2 : chooseShiftSevenK0B (0) (0*n+2)=0 := by
  exact if_neg (by omega)
 have h0_3 : chooseShiftSevenK0B (0) (0*n+3)=0 := by
  exact if_neg (by omega)
 have h0_4 : chooseShiftSevenK0B (0) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (0) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (0) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (0) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (0) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (0) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (0) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (0) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (0) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (0) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (0) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (0) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (0) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (0) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (0) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (0) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (0) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (0) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (0) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (0) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (0) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (0) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (0) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (0) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (0) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (0) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (0) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (0) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (0) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (0) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (0) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow0MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow1MCFC (N x : ℤ) : ℤ := ((((60480*N + (-10080))*N + 15120)*N + (-12600))*N)

theorem twoLow1MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (1)=16*twoLow1MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (1) (0*n+0)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1)-(0*n+0)=1 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (1) (0*n+1)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (1)-(0*n+1)=0 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (1) (0*n+2)=0 := by
  exact if_neg (by omega)
 have h0_3 : chooseShiftSevenK0B (1) (0*n+3)=0 := by
  exact if_neg (by omega)
 have h0_4 : chooseShiftSevenK0B (1) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (1) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (1) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (1) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (1) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (1) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (1) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (1) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (1) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (1) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (1) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (1) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (1) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (1) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (1) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (1) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (1) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (1) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (1) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (1) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (1) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (1) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (1) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (1) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (1) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (1) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (1) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (1) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (1) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (1) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (1) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow1MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow2MCFC (N x : ℤ) : ℤ := ((((352800*N + (-524160))*N + 667800)*N + (-458640))*N + 120960)

theorem twoLow2MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (2)=16*twoLow2MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (2) (0*n+0)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2)-(0*n+0)=2 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (2) (0*n+1)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2)-(0*n+1)=1 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (2) (0*n+2)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (2)-(0*n+2)=0 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (2) (0*n+3)=0 := by
  exact if_neg (by omega)
 have h0_4 : chooseShiftSevenK0B (2) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (2) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (2) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (2) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (2) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (2) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (2) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (2) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (2) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (2) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (2) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (2) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (2) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (2) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (2) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (2) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (2) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (2) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (2) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (2) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (2) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (2) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (2) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (2) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (2) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (2) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (2) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (2) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (2) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (2) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (2) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow2MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow3MCFC (N x : ℤ) : ℤ := ((((1350720*N + (-4021920))*N + 7010640)*N + (-6539400))*N + 2585520)

theorem twoLow3MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (3)=16*twoLow3MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (3) (0*n+0)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3)-(0*n+0)=3 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (3) (0*n+1)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3)-(0*n+1)=2 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (3) (0*n+2)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3)-(0*n+2)=1 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (3) (0*n+3)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (3)-(0*n+3)=0 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (3) (0*n+4)=0 := by
  exact if_neg (by omega)
 have h0_5 : chooseShiftSevenK0B (3) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (3) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (3) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (3) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (3) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (3) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (3) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (3) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (3) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (3) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (3) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (3) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (3) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (3) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (3) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (3) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (3) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (3) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (3) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (3) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (3) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (3) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (3) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (3) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (3) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (3) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (3) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (3) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (3) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (3) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow3MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow4MCFC (N x : ℤ) : ℤ := ((((3875760*N + (-18028080))*N + 41699700)*N + (-50423940))*N + 25802280)

theorem twoLow4MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (4)=16*twoLow4MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (4) (0*n+0)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4)-(0*n+0)=4 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (4) (0*n+1)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4)-(0*n+1)=3 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (4) (0*n+2)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4)-(0*n+2)=2 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (4) (0*n+3)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4)-(0*n+3)=1 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (4) (0*n+4)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (4)-(0*n+4)=0 by omega]
  norm_num [Nat.choose]
 have h0_5 : chooseShiftSevenK0B (4) (0*n+5)=0 := by
  exact if_neg (by omega)
 have h0_6 : chooseShiftSevenK0B (4) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (4) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (4) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (4) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (4) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (4) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (4) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (4) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (4) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (4) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (4) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (4) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (4) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (4) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (4) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (4) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (4) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (4) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (4) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (4) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (4) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (4) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (4) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (4) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (4) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (4) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (4) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (4) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (4) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow4MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow5MCFC (N x : ℤ) : ℤ := ((((9031680*N + (-58705920))*N + 173859840)*N + (-262200960))*N + 165231360)

theorem twoLow5MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (5)=16*twoLow5MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (5) (0*n+0)=792 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (5)-(0*n+0)=5 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (5) (0*n+1)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (5)-(0*n+1)=4 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (5) (0*n+2)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (5)-(0*n+2)=3 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (5) (0*n+3)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (5)-(0*n+3)=2 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (5) (0*n+4)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (5)-(0*n+4)=1 by omega]
  norm_num [Nat.choose]
 have h0_5 : chooseShiftSevenK0B (5) (0*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (5)-(0*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h0_6 : chooseShiftSevenK0B (5) (0*n+6)=0 := by
  exact if_neg (by omega)
 have h0_7 : chooseShiftSevenK0B (5) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (5) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (5) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (5) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (5) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (5) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (5) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (5) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (5) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (5) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (5) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (5) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (5) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (5) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (5) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (5) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (5) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (5) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (5) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (5) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (5) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (5) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (5) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (5) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (5) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (5) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (5) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (5) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow5MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoLow6MCFC (N x : ℤ) : ℤ := ((((18063360*N + (-153538560))*N + 564480000)*N + (-1032716160))*N + 779103360)

theorem twoLow6MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (6)=16*twoLow6MCFC n j := by
 have h0_0 : chooseShiftSevenK0B (6) (0*n+0)=1716 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+0)=6 by omega]
  norm_num [Nat.choose]
 have h0_1 : chooseShiftSevenK0B (6) (0*n+1)=792 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+1)=5 by omega]
  norm_num [Nat.choose]
 have h0_2 : chooseShiftSevenK0B (6) (0*n+2)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+2)=4 by omega]
  norm_num [Nat.choose]
 have h0_3 : chooseShiftSevenK0B (6) (0*n+3)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+3)=3 by omega]
  norm_num [Nat.choose]
 have h0_4 : chooseShiftSevenK0B (6) (0*n+4)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+4)=2 by omega]
  norm_num [Nat.choose]
 have h0_5 : chooseShiftSevenK0B (6) (0*n+5)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+5)=1 by omega]
  norm_num [Nat.choose]
 have h0_6 : chooseShiftSevenK0B (6) (0*n+6)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (6)-(0*n+6)=0 by omega]
  norm_num [Nat.choose]
 have h0_7 : chooseShiftSevenK0B (6) (0*n+7)=0 := by
  exact if_neg (by omega)
 have h0_8 : chooseShiftSevenK0B (6) (0*n+8)=0 := by
  exact if_neg (by omega)
 have h0_9 : chooseShiftSevenK0B (6) (0*n+9)=0 := by
  exact if_neg (by omega)
 have h0_10 : chooseShiftSevenK0B (6) (0*n+10)=0 := by
  exact if_neg (by omega)
 have h0_11 : chooseShiftSevenK0B (6) (0*n+11)=0 := by
  exact if_neg (by omega)
 have h0_12 : chooseShiftSevenK0B (6) (0*n+12)=0 := by
  exact if_neg (by omega)
 have h1_2 : chooseShiftSevenK0B (6) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (6) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (6) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (6) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (6) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (6) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (6) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (6) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (6) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (6) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (6) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (6) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (6) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (6) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (6) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (6) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (6) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (6) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (6) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (6) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (6) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (6) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h0_0,h0_1,h0_2,h0_3,h0_4,h0_5,h0_6,h0_7,h0_8,h0_9,h0_10,h0_11,h0_12,h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (0 : ℤ)
 all_goals simp only [twoLow6MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset0MCFC (N x : ℤ) : ℤ := (((((((5760*N + 80640)*N + 274176)*N + (-1290240))*N + (-8628480))*N + 14757120)*N + 191240064)*N + (-499685760))

theorem twoOnset0MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+0)=16*twoOnset0MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+0) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+0) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+0) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+0) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+0) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+0) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+0) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+0) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+0) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+0) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+0) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+0) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+0) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+0) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (n+0) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (n+0) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (n+0) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (n+0) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (n+0) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+0) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+0) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+0) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+0) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+0) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+0) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+0) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+0) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+0) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+0) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+0) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+0) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+0) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+0) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+0) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+0) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset0MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset1MCFC (N x : ℤ) : ℤ := (((((((5760*N + 67200)*N + 233856)*N + (-336000))*N + (-3265920))*N + 2808960)*N + 47902464)*N + (-97493760))

theorem twoOnset1MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+1)=16*twoOnset1MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+1) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+1) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+1) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+1) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+1) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+1) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+1) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+1) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+1) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+1) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+1) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+1) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+1) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+1) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (n+1) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (n+1) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (n+1) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (n+1) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (n+1) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+1) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+1) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+1) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+1) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+1) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+1) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+1) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+1) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+1) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+1) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+1) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+1) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+1) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+1) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+1) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+1) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset1MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset2MCFC (N x : ℤ) : ℤ := (((((((5760*N + 53760)*N + 177408)*N + 53760)*N + (-887040))*N + 134400)*N + 8929152)*N + (-13547520))

theorem twoOnset2MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+2)=16*twoOnset2MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+2) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+2) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+2) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+2) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+2) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+2) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+2) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+2) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+2) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+2) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+2) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+2) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+2) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+2) (1*n+2)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+2)-(1*n+2)=0 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (n+2) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (n+2) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (n+2) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (n+2) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (n+2) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+2) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+2) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+2) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+2) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+2) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+2) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+2) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+2) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+2) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+2) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+2) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+2) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+2) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+2) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+2) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+2) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset2MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset3MCFC (N x : ℤ) : ℤ := (((((((5760*N + 40320)*N + 104832)*N + 120960)*N + (-40320))*N + (-282240))*N + 1260288)*N + (-1209600))

theorem twoOnset3MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+3)=16*twoOnset3MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+3) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+3) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+3) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+3) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+3) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+3) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+3) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+3) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+3) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+3) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+3) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+3) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+3) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+3) (1*n+2)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+3)-(1*n+2)=1 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (n+3) (1*n+3)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+3)-(1*n+3)=0 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (n+3) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (n+3) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (n+3) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (n+3) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+3) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+3) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+3) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+3) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+3) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+3) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+3) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+3) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+3) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+3) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+3) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+3) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+3) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+3) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+3) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+3) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset3MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset4MCFC (N x : ℤ) : ℤ := (((((((5760*N + 26880)*N + 16128)*N + 107520)*N + 403200)*N + (-1585920))*N + 2477952)*N + (-1451520))

theorem twoOnset4MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+4)=16*twoOnset4MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+4) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+4) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+4) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+4) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+4) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+4) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+4) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+4) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+4) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+4) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+4) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+4) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+4) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+4) (1*n+2)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+4)-(1*n+2)=2 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (n+4) (1*n+3)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+4)-(1*n+3)=1 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (n+4) (1*n+4)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+4)-(1*n+4)=0 by omega]
  norm_num [Nat.choose]
 have h1_5 : chooseShiftSevenK0B (n+4) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (n+4) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (n+4) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+4) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+4) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+4) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+4) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+4) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+4) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+4) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+4) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+4) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+4) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+4) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+4) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+4) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+4) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+4) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+4) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset4MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset5MCFC (N x : ℤ) : ℤ := (((((((5760*N + 13440)*N + (-88704))*N + 255360)*N + 1249920)*N + (-7889280))*N + 16614144)*N + (-12821760))

theorem twoOnset5MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+5)=16*twoOnset5MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+5) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+5) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+5) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+5) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+5) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+5) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+5) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+5) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+5) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+5) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+5) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+5) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+5) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+5) (1*n+2)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+5)-(1*n+2)=3 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (n+5) (1*n+3)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+5)-(1*n+3)=2 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (n+5) (1*n+4)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+5)-(1*n+4)=1 by omega]
  norm_num [Nat.choose]
 have h1_5 : chooseShiftSevenK0B (n+5) (1*n+5)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+5)-(1*n+5)=0 by omega]
  norm_num [Nat.choose]
 have h1_6 : chooseShiftSevenK0B (n+5) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (n+5) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+5) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+5) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+5) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+5) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+5) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+5) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+5) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+5) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+5) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+5) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+5) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+5) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+5) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+5) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+5) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+5) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset5MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoOnset6MCFC (N x : ℤ) : ℤ := (((((((5760*N)*N + (-209664))*N + 806400)*N + 2983680)*N + (-29111040))*N + 78989184)*N + (-76325760))

theorem twoOnset6MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (n+6)=16*twoOnset6MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (n+6) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (n+6) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (n+6) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (n+6) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (n+6) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (n+6) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (n+6) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (n+6) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (n+6) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (n+6) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (n+6) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (n+6) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (n+6) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (n+6) (1*n+2)=330 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+6)-(1*n+2)=4 by omega]
  norm_num [Nat.choose]
 have h1_3 : chooseShiftSevenK0B (n+6) (1*n+3)=120 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+6)-(1*n+3)=3 by omega]
  norm_num [Nat.choose]
 have h1_4 : chooseShiftSevenK0B (n+6) (1*n+4)=36 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+6)-(1*n+4)=2 by omega]
  norm_num [Nat.choose]
 have h1_5 : chooseShiftSevenK0B (n+6) (1*n+5)=8 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+6)-(1*n+5)=1 by omega]
  norm_num [Nat.choose]
 have h1_6 : chooseShiftSevenK0B (n+6) (1*n+6)=1 := by
  unfold chooseShiftSevenK0B
  rw [if_pos (by omega),show (n+6)-(1*n+6)=0 by omega]
  norm_num [Nat.choose]
 have h1_7 : chooseShiftSevenK0B (n+6) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (n+6) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (n+6) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (n+6) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (n+6) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (n+6) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (n+6) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (n+6) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (n+6) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (n+6) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (n+6) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (n+6) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (n+6) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (n+6) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (n+6) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (n+6) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (n+6) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12
 all_goals simp only [twoOnset6MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoTail1MCFC (N x : ℤ) : ℤ := ((23708160*N + (-82131840))*N + 80559360)

theorem twoTail1MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (2*n+1)=16*twoTail1MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (2*n+1) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12 + (smallTerm21_1_2MCFC (n:ℤ))*h1_2 + (smallTerm21_1_3MCFC (n:ℤ))*h1_3 + (smallTerm21_1_4MCFC (n:ℤ))*h1_4 + (smallTerm21_1_5MCFC (n:ℤ))*h1_5 + (smallTerm21_1_6MCFC (n:ℤ))*h1_6 + (smallTerm21_1_7MCFC (n:ℤ))*h1_7 + (smallTerm21_1_8MCFC (n:ℤ))*h1_8 + (smallTerm21_1_9MCFC (n:ℤ))*h1_9 + (smallTerm21_1_10MCFC (n:ℤ))*h1_10 + (smallTerm21_1_11MCFC (n:ℤ))*h1_11 + (smallTerm21_1_12MCFC (n:ℤ))*h1_12
 all_goals simp only [twoTail1MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoTail2MCFC (N x : ℤ) : ℤ := ((6773760*N + (-17781120))*N + 13668480)

theorem twoTail2MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (2*n+2)=16*twoTail2MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (2*n+2) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12 + (smallTerm21_1_2MCFC (n:ℤ))*h1_2 + (smallTerm21_1_3MCFC (n:ℤ))*h1_3 + (smallTerm21_1_4MCFC (n:ℤ))*h1_4 + (smallTerm21_1_5MCFC (n:ℤ))*h1_5 + (smallTerm21_1_6MCFC (n:ℤ))*h1_6 + (smallTerm21_1_7MCFC (n:ℤ))*h1_7 + (smallTerm21_1_8MCFC (n:ℤ))*h1_8 + (smallTerm21_1_9MCFC (n:ℤ))*h1_9 + (smallTerm21_1_10MCFC (n:ℤ))*h1_10 + (smallTerm21_1_11MCFC (n:ℤ))*h1_11 + (smallTerm21_1_12MCFC (n:ℤ))*h1_12
 all_goals simp only [twoTail2MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoTail3MCFC (N x : ℤ) : ℤ := ((1466640*N + (-2714040))*N + 1527120)

theorem twoTail3MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (2*n+3)=16*twoTail3MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (2*n+3) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12 + (smallTerm21_1_2MCFC (n:ℤ))*h1_2 + (smallTerm21_1_3MCFC (n:ℤ))*h1_3 + (smallTerm21_1_4MCFC (n:ℤ))*h1_4 + (smallTerm21_1_5MCFC (n:ℤ))*h1_5 + (smallTerm21_1_6MCFC (n:ℤ))*h1_6 + (smallTerm21_1_7MCFC (n:ℤ))*h1_7 + (smallTerm21_1_8MCFC (n:ℤ))*h1_8 + (smallTerm21_1_9MCFC (n:ℤ))*h1_9 + (smallTerm21_1_10MCFC (n:ℤ))*h1_10 + (smallTerm21_1_11MCFC (n:ℤ))*h1_11 + (smallTerm21_1_12MCFC (n:ℤ))*h1_12
 all_goals simp only [twoTail3MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoTail4MCFC (N x : ℤ) : ℤ := ((211680*N + (-241920))*N + 83160)

theorem twoTail4MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (2*n+4)=16*twoTail4MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (2*n+4) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12 + (smallTerm21_1_2MCFC (n:ℤ))*h1_2 + (smallTerm21_1_3MCFC (n:ℤ))*h1_3 + (smallTerm21_1_4MCFC (n:ℤ))*h1_4 + (smallTerm21_1_5MCFC (n:ℤ))*h1_5 + (smallTerm21_1_6MCFC (n:ℤ))*h1_6 + (smallTerm21_1_7MCFC (n:ℤ))*h1_7 + (smallTerm21_1_8MCFC (n:ℤ))*h1_8 + (smallTerm21_1_9MCFC (n:ℤ))*h1_9 + (smallTerm21_1_10MCFC (n:ℤ))*h1_10 + (smallTerm21_1_11MCFC (n:ℤ))*h1_11 + (smallTerm21_1_12MCFC (n:ℤ))*h1_12
 all_goals simp only [twoTail4MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring

def twoTail5MCFC (N x : ℤ) : ℤ := ((15120*N + (-7560))*N)

theorem twoTail5MCFC_value (n j : ℕ) (hn : 7≤n) :
 5040*smallValue21MCFC n (2*n+5)=16*twoTail5MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (2*n+5) (2*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue21MCFC
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13]
 linear_combination (norm := skip) (smallTerm21_0_0MCFC (n:ℤ))*h0_0 + (smallTerm21_0_1MCFC (n:ℤ))*h0_1 + (smallTerm21_0_2MCFC (n:ℤ))*h0_2 + (smallTerm21_0_3MCFC (n:ℤ))*h0_3 + (smallTerm21_0_4MCFC (n:ℤ))*h0_4 + (smallTerm21_0_5MCFC (n:ℤ))*h0_5 + (smallTerm21_0_6MCFC (n:ℤ))*h0_6 + (smallTerm21_0_7MCFC (n:ℤ))*h0_7 + (smallTerm21_0_8MCFC (n:ℤ))*h0_8 + (smallTerm21_0_9MCFC (n:ℤ))*h0_9 + (smallTerm21_0_10MCFC (n:ℤ))*h0_10 + (smallTerm21_0_11MCFC (n:ℤ))*h0_11 + (smallTerm21_0_12MCFC (n:ℤ))*h0_12 + (smallTerm21_1_2MCFC (n:ℤ))*h1_2 + (smallTerm21_1_3MCFC (n:ℤ))*h1_3 + (smallTerm21_1_4MCFC (n:ℤ))*h1_4 + (smallTerm21_1_5MCFC (n:ℤ))*h1_5 + (smallTerm21_1_6MCFC (n:ℤ))*h1_6 + (smallTerm21_1_7MCFC (n:ℤ))*h1_7 + (smallTerm21_1_8MCFC (n:ℤ))*h1_8 + (smallTerm21_1_9MCFC (n:ℤ))*h1_9 + (smallTerm21_1_10MCFC (n:ℤ))*h1_10 + (smallTerm21_1_11MCFC (n:ℤ))*h1_11 + (smallTerm21_1_12MCFC (n:ℤ))*h1_12
 all_goals simp only [twoTail5MCFC,fallingSevenK0B,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 all_goals push_cast
 all_goals ring
end
end MathGKM.Markov
