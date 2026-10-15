import MarkovOnsetExpand1M96
import MarkovOnsetExpand2M96
import MarkovOnsetExpand3M96
import MarkovOnsetExpand4M96
import MarkovOnsetExpand5M96
import MarkovOnsetExpand6M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumn1_0M96 (N R : ℤ) : ℤ := ((onsetP1_0_0M96 N*R^0 + onsetP1_1_0M96 N*R^1) + (onsetP1_2_0M96 N*R^2 + (onsetP1_3_0M96 N*R^3 + onsetP1_4_0M96 N*R^4)))

def onsetColumn1_1M96 (N R : ℤ) : ℤ := ((onsetP1_0_1M96 N*R^0 + onsetP1_1_1M96 N*R^1) + (onsetP1_2_1M96 N*R^2 + onsetP1_3_1M96 N*R^3))

def onsetColumn1_2M96 (N R : ℤ) : ℤ := (onsetP1_0_2M96 N*R^0 + (onsetP1_1_2M96 N*R^1 + onsetP1_2_2M96 N*R^2))

def onsetColumn1_3M96 (N R : ℤ) : ℤ := (onsetP1_0_3M96 N*R^0 + onsetP1_1_3M96 N*R^1)

def onsetColumn1_4M96 (N R : ℤ) : ℤ := onsetP1_0_4M96 N*R^0

theorem onset_columns1M96 (N C R : ℤ) :
 onsetValue1M96 (N+4) (R+C+5) (R+4)=((onsetColumn1_0M96 N R*C^0 + onsetColumn1_1M96 N R*C^1) + (onsetColumn1_2M96 N R*C^2 + (onsetColumn1_3M96 N R*C^3 + onsetColumn1_4M96 N R*C^4))) := by
 rw [onset_expand1M96]
 unfold onsetColumn1_0M96 onsetColumn1_1M96 onsetColumn1_2M96 onsetColumn1_3M96 onsetColumn1_4M96
 ring

def onsetColumn2_0M96 (N R : ℤ) : ℤ := ((onsetP2_0_0M96 N*R^0 + onsetP2_1_0M96 N*R^1) + (onsetP2_2_0M96 N*R^2 + (onsetP2_3_0M96 N*R^3 + onsetP2_4_0M96 N*R^4)))

def onsetColumn2_1M96 (N R : ℤ) : ℤ := ((onsetP2_0_1M96 N*R^0 + onsetP2_1_1M96 N*R^1) + (onsetP2_2_1M96 N*R^2 + onsetP2_3_1M96 N*R^3))

def onsetColumn2_2M96 (N R : ℤ) : ℤ := (onsetP2_0_2M96 N*R^0 + (onsetP2_1_2M96 N*R^1 + onsetP2_2_2M96 N*R^2))

def onsetColumn2_3M96 (N R : ℤ) : ℤ := (onsetP2_0_3M96 N*R^0 + onsetP2_1_3M96 N*R^1)

def onsetColumn2_4M96 (N R : ℤ) : ℤ := onsetP2_0_4M96 N*R^0

theorem onset_columns2M96 (N C R : ℤ) :
 onsetValue2M96 (N+4) (R+C+5) (R+4)=((onsetColumn2_0M96 N R*C^0 + onsetColumn2_1M96 N R*C^1) + (onsetColumn2_2M96 N R*C^2 + (onsetColumn2_3M96 N R*C^3 + onsetColumn2_4M96 N R*C^4))) := by
 rw [onset_expand2M96]
 unfold onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96
 ring

def onsetColumn3_0M96 (N R : ℤ) : ℤ := ((onsetP3_0_0M96 N*R^0 + onsetP3_1_0M96 N*R^1) + (onsetP3_2_0M96 N*R^2 + (onsetP3_3_0M96 N*R^3 + onsetP3_4_0M96 N*R^4)))

def onsetColumn3_1M96 (N R : ℤ) : ℤ := ((onsetP3_0_1M96 N*R^0 + onsetP3_1_1M96 N*R^1) + (onsetP3_2_1M96 N*R^2 + onsetP3_3_1M96 N*R^3))

def onsetColumn3_2M96 (N R : ℤ) : ℤ := (onsetP3_0_2M96 N*R^0 + (onsetP3_1_2M96 N*R^1 + onsetP3_2_2M96 N*R^2))

def onsetColumn3_3M96 (N R : ℤ) : ℤ := (onsetP3_0_3M96 N*R^0 + onsetP3_1_3M96 N*R^1)

def onsetColumn3_4M96 (N R : ℤ) : ℤ := onsetP3_0_4M96 N*R^0

theorem onset_columns3M96 (N C R : ℤ) :
 onsetValue3M96 (N+4) (R+C+5) (R+4)=((onsetColumn3_0M96 N R*C^0 + onsetColumn3_1M96 N R*C^1) + (onsetColumn3_2M96 N R*C^2 + (onsetColumn3_3M96 N R*C^3 + onsetColumn3_4M96 N R*C^4))) := by
 rw [onset_expand3M96]
 unfold onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96
 ring

def onsetColumn4_0M96 (N R : ℤ) : ℤ := ((onsetP4_0_0M96 N*R^0 + onsetP4_1_0M96 N*R^1) + (onsetP4_2_0M96 N*R^2 + (onsetP4_3_0M96 N*R^3 + onsetP4_4_0M96 N*R^4)))

def onsetColumn4_1M96 (N R : ℤ) : ℤ := ((onsetP4_0_1M96 N*R^0 + onsetP4_1_1M96 N*R^1) + (onsetP4_2_1M96 N*R^2 + onsetP4_3_1M96 N*R^3))

def onsetColumn4_2M96 (N R : ℤ) : ℤ := (onsetP4_0_2M96 N*R^0 + (onsetP4_1_2M96 N*R^1 + onsetP4_2_2M96 N*R^2))

def onsetColumn4_3M96 (N R : ℤ) : ℤ := (onsetP4_0_3M96 N*R^0 + onsetP4_1_3M96 N*R^1)

def onsetColumn4_4M96 (N R : ℤ) : ℤ := onsetP4_0_4M96 N*R^0

theorem onset_columns4M96 (N C R : ℤ) :
 onsetValue4M96 (N+4) (R+C+5) (R+4)=((onsetColumn4_0M96 N R*C^0 + onsetColumn4_1M96 N R*C^1) + (onsetColumn4_2M96 N R*C^2 + (onsetColumn4_3M96 N R*C^3 + onsetColumn4_4M96 N R*C^4))) := by
 rw [onset_expand4M96]
 unfold onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96
 ring

def onsetColumn5_0M96 (N R : ℤ) : ℤ := ((onsetP5_0_0M96 N*R^0 + onsetP5_1_0M96 N*R^1) + (onsetP5_2_0M96 N*R^2 + (onsetP5_3_0M96 N*R^3 + onsetP5_4_0M96 N*R^4)))

def onsetColumn5_1M96 (N R : ℤ) : ℤ := ((onsetP5_0_1M96 N*R^0 + onsetP5_1_1M96 N*R^1) + (onsetP5_2_1M96 N*R^2 + onsetP5_3_1M96 N*R^3))

def onsetColumn5_2M96 (N R : ℤ) : ℤ := (onsetP5_0_2M96 N*R^0 + (onsetP5_1_2M96 N*R^1 + onsetP5_2_2M96 N*R^2))

def onsetColumn5_3M96 (N R : ℤ) : ℤ := (onsetP5_0_3M96 N*R^0 + onsetP5_1_3M96 N*R^1)

def onsetColumn5_4M96 (N R : ℤ) : ℤ := onsetP5_0_4M96 N*R^0

theorem onset_columns5M96 (N C R : ℤ) :
 onsetValue5M96 (N+4) (R+C+5) (R+4)=((onsetColumn5_0M96 N R*C^0 + onsetColumn5_1M96 N R*C^1) + (onsetColumn5_2M96 N R*C^2 + (onsetColumn5_3M96 N R*C^3 + onsetColumn5_4M96 N R*C^4))) := by
 rw [onset_expand5M96]
 unfold onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96
 ring

def onsetColumn6_0M96 (N R : ℤ) : ℤ := ((onsetP6_0_0M96 N*R^0 + onsetP6_1_0M96 N*R^1) + (onsetP6_2_0M96 N*R^2 + (onsetP6_3_0M96 N*R^3 + onsetP6_4_0M96 N*R^4)))

def onsetColumn6_1M96 (N R : ℤ) : ℤ := ((onsetP6_0_1M96 N*R^0 + onsetP6_1_1M96 N*R^1) + (onsetP6_2_1M96 N*R^2 + onsetP6_3_1M96 N*R^3))

def onsetColumn6_2M96 (N R : ℤ) : ℤ := (onsetP6_0_2M96 N*R^0 + (onsetP6_1_2M96 N*R^1 + onsetP6_2_2M96 N*R^2))

def onsetColumn6_3M96 (N R : ℤ) : ℤ := (onsetP6_0_3M96 N*R^0 + onsetP6_1_3M96 N*R^1)

def onsetColumn6_4M96 (N R : ℤ) : ℤ := onsetP6_0_4M96 N*R^0

theorem onset_columns6M96 (N C R : ℤ) :
 onsetValue6M96 (N+4) (R+C+5) (R+4)=((onsetColumn6_0M96 N R*C^0 + onsetColumn6_1M96 N R*C^1) + (onsetColumn6_2M96 N R*C^2 + (onsetColumn6_3M96 N R*C^3 + onsetColumn6_4M96 N R*C^4))) := by
 rw [onset_expand6M96]
 unfold onsetColumn6_0M96 onsetColumn6_1M96 onsetColumn6_2M96 onsetColumn6_3M96 onsetColumn6_4M96
 ring
end
end MathGKM.Markov
