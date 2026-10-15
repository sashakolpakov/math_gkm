import MarkovBackwardChamber0M94
import MarkovPenultimateM1B
/-! Machine-authored 1b02dddc. Backwards onset algebra; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def onsetCorrection0_1M1B (n c r : ℤ) : ℤ :=
 -27921600*r + -3104640*r^2 + 29433600*r^3 + -3548160*r^4 + 5312160*c + 29413440*c*r + 16571520*c*r^2 + -10644480*c*r^3 + -786240*c^2 + -7015680*c^2*r + -6773760*c^2*r^2 + -927360*c^3 + -806400*c^3*r + 28788480*n*r + -103057920*n*r^2 + 21288960*n*r^3 + -6834240*n*c + -36005760*n*c*r + 54915840*n*c*r^2 + -3548160*n*c*r^3 + 4767840*n*c^2 + 16813440*n*c^2*r + -6289920*n*c^2*r^2 + -120960*n*c^3 + -1935360*n*c^3*r + -80640*n*c^4

def onsetValue0_1M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-1)+onsetCorrection0_1M1B n c r

theorem onsetCorrection0_1_eqM1B (n c r : ℤ) :
 penCorr1M1B n c r (0) (0) (0)=onsetCorrection0_1M1B n c r := by
 unfold penCorr1M1B onsetCorrection0_1M1B
 ring

def onsetCorrection0_2M1B (n c r : ℤ) : ℤ :=
 -4052160*r + 5160960*r^2 + 8951040*r^3 + -1532160*r^4 + 1239840*c + 4818240*c*r + 241920*c*r^2 + -3064320*c*r^3 + -695520*c^2 + -1693440*c^2*r + -967680*c^2*r^2 + 967680*n*r + -29030400*n*r^2 + 9192960*n*r^3 + -544320*n*c + -1612800*n*c*r + 14999040*n*c*r^2 + -1532160*n*c*r^3 + 816480*n*c^2 + 1693440*n*c^2*r + -1693440*n*c^2*r^2 + -120960*n*c^3 + -241920*n*c^3*r

def onsetValue0_2M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-2)+onsetCorrection0_2M1B n c r

theorem onsetCorrection0_2_eqM1B (n c r : ℤ) :
 penCorr2M1B n c r (0) (0) (0)=onsetCorrection0_2M1B n c r := by
 unfold penCorr2M1B onsetCorrection0_2M1B
 ring

def onsetCorrection0_3M1B (n c r : ℤ) : ℤ :=
 624960*r + 2298240*r^2 + 1370880*r^3 + -483840*r^4 + -90720*c + -423360*c*r + -846720*c*r^2 + -483840*c*r^3 + -725760*n*r + -4354560*n*r^2 + 2903040*n*r^3 + 181440*n*c + 846720*n*c*r + 2177280*n*c*r^2 + -483840*n*c*r^3 + -30240*n*c^2 + -120960*n*c^2*r + -241920*n*c^2*r^2

def onsetValue0_3M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-3)+onsetCorrection0_3M1B n c r

theorem onsetCorrection0_3_eqM1B (n c r : ℤ) :
 penCorr3M1B n c r (0) (0) (0)=onsetCorrection0_3M1B n c r := by
 unfold penCorr3M1B onsetCorrection0_3M1B
 ring

def onsetCorrection0_4M1B (n c r : ℤ) : ℤ :=
 -10080*r + -10080*r^2 + -80640*r^3 + -80640*r^4 + 60480*n*r + 483840*n*r^3 + -10080*n*c*r + -80640*n*c*r^3

def onsetValue0_4M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-4)+onsetCorrection0_4M1B n c r

theorem onsetCorrection0_4_eqM1B (n c r : ℤ) :
 penCorr4M1B n c r (0) (0) (0)=onsetCorrection0_4M1B n c r := by
 unfold penCorr4M1B onsetCorrection0_4M1B
 ring

def onsetCorrection0_5M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue0_5M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-5)+onsetCorrection0_5M1B n c r

theorem onsetCorrection0_5_eqM1B (n c r : ℤ) :
 penCorr5M1B n c r (0) (0) (0)=onsetCorrection0_5M1B n c r := by
 unfold penCorr5M1B onsetCorrection0_5M1B
 ring

def onsetCorrection0_6M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue0_6M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-6)+onsetCorrection0_6M1B n c r

theorem onsetCorrection0_6_eqM1B (n c r : ℤ) :
 penCorr6M1B n c r (0) (0) (0)=onsetCorrection0_6M1B n c r := by
 unfold penCorr6M1B onsetCorrection0_6M1B
 ring

def onsetCorrection0_7M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue0_7M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-7)+onsetCorrection0_7M1B n c r

def onsetCorrection0_8M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue0_8M1B (n c r : ℤ) : ℤ :=
 backShape0M94 c r (n-8)+onsetCorrection0_8M1B n c r
end
end MathGKM.Markov
