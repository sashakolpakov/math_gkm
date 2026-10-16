import MarkovLowerUniformME9C
/-! Machine-authored e9cdd527. The auxiliary lower kernel must not be
extended beyond its proved source region or positivity wedge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

theorem lower_kernel_outside_negativeME9C : lowerKernelME9C 4 3 0= -29 := by
 have h0_0 : lowerRawME9C 5 0 0=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 0 0
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose] at h
   linarith only [h]
 have h0_1 : lowerRawME9C 5 0 1=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 0 1
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0] at h
   linarith only [h]
 have h0_2 : lowerRawME9C 5 0 2=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 0 2
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1] at h
   linarith only [h]
 have h0_3 : lowerRawME9C 5 0 3=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 0 3
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2] at h
   linarith only [h]
 have h1_0 : lowerRawME9C 5 1 0=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 1 0
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3] at h
   linarith only [h]
 have h1_1 : lowerRawME9C 5 1 1=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 1 1
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0] at h
   linarith only [h]
 have h1_2 : lowerRawME9C 5 1 2=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 1 2
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1] at h
   linarith only [h]
 have h1_3 : lowerRawME9C 5 1 3=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 1 3
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2] at h
   linarith only [h]
 have h2_0 : lowerRawME9C 5 2 0=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 2 0
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3] at h
   linarith only [h]
 have h2_1 : lowerRawME9C 5 2 1=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 2 1
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0] at h
   linarith only [h]
 have h2_2 : lowerRawME9C 5 2 2=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 2 2
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1] at h
   linarith only [h]
 have h2_3 : lowerRawME9C 5 2 3=(0:ℤ) := by
   have h := lower_raw_equationME9C 5 2 3
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2] at h
   linarith only [h]
 have h3_0 : lowerRawME9C 5 3 0=(1:ℤ) := by
   have h := lower_raw_equationME9C 5 3 0
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3] at h
   linarith only [h]
 have h3_1 : lowerRawME9C 5 3 1=(8:ℤ) := by
   have h := lower_raw_equationME9C 5 3 1
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0] at h
   linarith only [h]
 have h3_2 : lowerRawME9C 5 3 2=(34:ℤ) := by
   have h := lower_raw_equationME9C 5 3 2
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0,h3_1] at h
   linarith only [h]
 have h3_3 : lowerRawME9C 5 3 3=(104:ℤ) := by
   have h := lower_raw_equationME9C 5 3 3
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0,h3_1,h3_2] at h
   linarith only [h]
 have h4_0 : lowerRawME9C 5 4 0=(4:ℤ) := by
   have h := lower_raw_equationME9C 5 4 0
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0,h3_1,h3_2,h3_3] at h
   linarith only [h]
 have h4_1 : lowerRawME9C 5 4 1=(23:ℤ) := by
   have h := lower_raw_equationME9C 5 4 1
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0,h3_1,h3_2,h3_3,h4_0] at h
   linarith only [h]
 have h4_2 : lowerRawME9C 5 4 2=(50:ℤ) := by
   have h := lower_raw_equationME9C 5 4 2
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0,h3_1,h3_2,h3_3,h4_0,h4_1] at h
   linarith only [h]
 have h4_3 : lowerRawME9C 5 4 3=(-29:ℤ) := by
   have h := lower_raw_equationME9C 5 4 3
   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose ,h0_0,h0_1,h0_2,h0_3,h1_0,h1_1,h1_2,h1_3,h2_0,h2_1,h2_2,h2_3,h3_0,h3_1,h3_2,h3_3,h4_0,h4_1,h4_2] at h
   linarith only [h]
 exact h4_3

theorem lower_kernel_outside_sourceME9C :
 InPolygon 3 5 4 3 ∧ coeff (frame [true,false]).mid.p 4 3=35 ∧
 lowerKernelME9C 4 3 0= -29 ∧ ¬(2*3+3 ≤ 4+0) := by
 have hp : (frame [true,false]).mid.p=threePolyM9E2 1 false :=
   three_path_polynomialM9E2 0 false
 rw [hp,three_raw_formulaM9E2,lower_kernel_outside_negativeME9C]
 simp only [InPolygon]
 decide

end
end MathGKM.Markov
