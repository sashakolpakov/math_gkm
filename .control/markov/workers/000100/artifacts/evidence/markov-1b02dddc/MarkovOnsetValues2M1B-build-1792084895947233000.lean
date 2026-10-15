import MarkovBackwardChamber2M94
import MarkovPenultimateM1B
/-! Machine-authored 1b02dddc. Backwards onset algebra; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def onsetCorrection2_1M1B (n c r : ℤ) : ℤ :=
 -18486720*r + -3467520*r^2 + 29433600*r^3 + -3548160*r^4 + 2167200*c + 28082880*c*r + 16571520*c*r^2 + -10644480*c*r^3 + -302400*c^2 + -7015680*c^2*r + -6773760*c^2*r^2 + -927360*c^3 + -806400*c^3*r + 30965760*n*r + -103057920*n*r^2 + 21288960*n*r^3 + -7560000*n*c + -36368640*n*c*r + 54915840*n*c*r^2 + -3548160*n*c*r^3 + 4888800*n*c^2 + 16813440*n*c^2*r + -6289920*n*c^2*r^2 + -120960*n*c^3 + -1935360*n*c^3*r + -80640*n*c^4

def onsetValue2_1M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-1)+onsetCorrection2_1M1B n c r

theorem onsetCorrection2_1_eqM1B (n c r : ℤ) :
 penCorr1M1B n c r (0) (3*r + -1*c) (0)=onsetCorrection2_1M1B n c r := by
 unfold penCorr1M1B onsetCorrection2_1M1B
 ring

def onsetCorrection2_2M1B (n c r : ℤ) : ℤ :=
 3205440*r + 4798080*r^2 + 8951040*r^3 + -1532160*r^4 + -1179360*c + 3850560*c*r + 241920*c*r^2 + -3064320*c*r^3 + -332640*c^2 + -1693440*c^2*r + -967680*c^2*r^2 + 3144960*n*r + -29030400*n*r^2 + 9192960*n*r^3 + -1270080*n*c + -1975680*n*c*r + 14999040*n*c*r^2 + -1532160*n*c*r^3 + 937440*n*c^2 + 1693440*n*c^2*r + -1693440*n*c^2*r^2 + -120960*n*c^3 + -241920*n*c^3*r

def onsetValue2_2M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-2)+onsetCorrection2_2M1B n c r

theorem onsetCorrection2_2_eqM1B (n c r : ℤ) :
 penCorr2M1B n c r (0) (3*r + -1*c) (0)=onsetCorrection2_2M1B n c r := by
 unfold penCorr2M1B onsetCorrection2_2M1B
 ring

def onsetCorrection2_3M1B (n c r : ℤ) : ℤ :=
 5705280*r + 1935360*r^2 + 1370880*r^3 + -483840*r^4 + -1784160*c + -1028160*c*r + -846720*c*r^2 + -483840*c*r^3 + 241920*c^2 + 1451520*n*r + -4354560*n*r^2 + 2903040*n*r^3 + -544320*n*c + 483840*n*c*r + 2177280*n*c*r^2 + -483840*n*c*r^3 + 90720*n*c^2 + -120960*n*c^2*r + -241920*n*c^2*r^2

def onsetValue2_3M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-3)+onsetCorrection2_3M1B n c r

theorem onsetCorrection2_3_eqM1B (n c r : ℤ) :
 penCorr3M1B n c r (0) (3*r + -1*c) (0)=onsetCorrection2_3M1B n c r := by
 unfold penCorr3M1B onsetCorrection2_3M1B
 ring

def onsetCorrection2_4M1B (n c r : ℤ) : ℤ :=
 2076480*r + -282240*r^2 + -80640*r^3 + -80640*r^4 + -695520*c + -181440*c*r + 90720*c^2 + 1693440*n*r + 483840*n*r^3 + -544320*n*c + -282240*n*c*r + -80640*n*c*r^3 + 90720*n*c^2

def onsetValue2_4M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-4)+onsetCorrection2_4M1B n c r

theorem onsetCorrection2_4_eqM1B (n c r : ℤ) :
 penCorr4M1B n c r (0) (3*r + -1*c) (0)=onsetCorrection2_4M1B n c r := by
 unfold penCorr4M1B onsetCorrection2_4M1B
 ring

def onsetCorrection2_5M1B (n c r : ℤ) : ℤ :=
 90720*r + -90720*r^2 + -30240*c + 30240*c*r + 544320*n*r + -181440*n*c + -90720*n*c*r + 30240*n*c^2

def onsetValue2_5M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-5)+onsetCorrection2_5M1B n c r

theorem onsetCorrection2_5_eqM1B (n c r : ℤ) :
 penCorr5M1B n c r (0) (3*r + -1*c) (0)=onsetCorrection2_5M1B n c r := by
 unfold penCorr5M1B onsetCorrection2_5M1B
 ring

def onsetCorrection2_6M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue2_6M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-6)+onsetCorrection2_6M1B n c r

theorem onsetCorrection2_6_eqM1B (n c r : ℤ) :
 penCorr6M1B n c r (0) (3*r + -1*c) (0)=onsetCorrection2_6M1B n c r := by
 unfold penCorr6M1B onsetCorrection2_6M1B
 ring

def onsetCorrection2_7M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue2_7M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-7)+onsetCorrection2_7M1B n c r

def onsetCorrection2_8M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue2_8M1B (n c r : ℤ) : ℤ :=
 backShape2M94 c r (n-8)+onsetCorrection2_8M1B n c r
end
end MathGKM.Markov
