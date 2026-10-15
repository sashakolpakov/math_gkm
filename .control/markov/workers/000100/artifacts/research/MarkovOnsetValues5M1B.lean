import MarkovBackwardChamber5M94
import MarkovPenultimateM1B
/-! Machine-authored 1b02dddc. Backwards onset algebra; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def onsetCorrection5_1M1B (n c r : ℤ) : ℤ :=
 -244198080*r + 79873920*r^2 + 25562880*r^3 + -3548160*r^4 + 112966560*c + 72959040*c*r + 3024000*c*r^2 + -10644480*c*r^3 + -43243200*c^2 + -8225280*c^2*r + -6773760*c^2*r^2 + 3548160*c^3 + -806400*c^3*r + -158457600*n*r + -79833600*n*r^2 + 21288960*n*r^3 + 86788800*n*c + 19877760*n*c*r + 51045120*n*c*r^2 + -3548160*n*c*r^3 + -28980000*n*c^2 + 12700800*n*c^2*r + -6289920*n*c^2*r^2 + 2903040*n*c^3 + -1935360*n*c^3*r + -80640*n*c^4

def onsetValue5_1M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-1)+onsetCorrection5_1M1B n c r

theorem onsetCorrection5_1_eqM1B (n c r : ℤ) :
 penCorr1M1B n c r (2*r + -1*c) (-1*r + 1*c) (3*r + -2*c)=onsetCorrection5_1M1B n c r := by
 unfold penCorr1M1B onsetCorrection5_1M1B
 ring

def onsetCorrection5_2M1B (n c r : ℤ) : ℤ :=
 -104690880*r + 55238400*r^2 + 6048000*r^3 + -1532160*r^4 + 51075360*c + 15220800*c*r + -7015680*c*r^2 + -3064320*c*r^3 + -18355680*c^2 + -725760*c^2*r + -967680*c^2*r^2 + 1693440*c^3 + -104993280*n*r + -11612160*n*r^2 + 9192960*n*r^3 + 52436160*n*c + 26208000*n*c*r + 12096000*n*c*r^2 + -1532160*n*c*r^3 + -17448480*n*c^2 + -1693440*n*c^2*r^2 + 1451520*n*c^3 + -241920*n*c^3*r

def onsetValue5_2M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-2)+onsetCorrection5_2M1B n c r

theorem onsetCorrection5_2_eqM1B (n c r : ℤ) :
 penCorr2M1B n c r (2*r + -1*c) (-1*r + 1*c) (3*r + -2*c)=onsetCorrection5_2M1B n c r := by
 unfold penCorr2M1B onsetCorrection5_2M1B
 ring

def onsetCorrection5_3M1B (n c r : ℤ) : ℤ :=
 -30824640*r + 27216000*r^2 + -564480*r^3 + -483840*r^4 + 15150240*c + -3810240*c*r + -3749760*c*r^2 + -483840*c*r^3 + -4475520*c^2 + 1209600*c^2*r + 362880*c^3 + -48625920*n*r + 7257600*n*r^2 + 2903040*n*r^3 + 24131520*n*c + 10281600*n*c*r + 241920*n*c*r^2 + -483840*n*c*r^3 + -7650720*n*c^2 + -362880*n*c^2*r + -241920*n*c^2*r^2 + 604800*n*c^3

def onsetValue5_3M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-3)+onsetCorrection5_3M1B n c r

theorem onsetCorrection5_3_eqM1B (n c r : ℤ) :
 penCorr3M1B n c r (2*r + -1*c) (-1*r + 1*c) (3*r + -2*c)=onsetCorrection5_3M1B n c r := by
 unfold penCorr3M1B onsetCorrection5_3M1B
 ring

def onsetCorrection5_4M1B (n c r : ℤ) : ℤ :=
 -1794240*r + 7580160*r^2 + -1048320*r^3 + -80640*r^4 + 272160*c + -3568320*c*r + -483840*c*r^2 + -30240*c^2 + 483840*c^2*r + -13547520*n*r + 5806080*n*r^2 + 483840*n*r^3 + 6713280*n*c + 806400*n*c*r + -967680*n*c*r^2 + -80640*n*c*r^3 + -1844640*n*c^2 + 241920*n*c^2*r + 120960*n*c^3

def onsetValue5_4M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-4)+onsetCorrection5_4M1B n c r

theorem onsetCorrection5_4_eqM1B (n c r : ℤ) :
 penCorr4M1B n c r (2*r + -1*c) (-1*r + 1*c) (3*r + -2*c)=onsetCorrection5_4M1B n c r := by
 unfold penCorr4M1B onsetCorrection5_4M1B
 ring

def onsetCorrection5_5M1B (n c r : ℤ) : ℤ :=
 2237760*r + 362880*r^2 + -241920*r^3 + -1542240*c + -423360*c*r + 120960*c*r^2 + 181440*c^2 + -725760*n*r + 1451520*n*r^2 + 181440*n*c + -604800*n*c*r + -241920*n*c*r^2 + -30240*n*c^2 + 120960*n*c^2*r

def onsetValue5_5M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-5)+onsetCorrection5_5M1B n c r

theorem onsetCorrection5_5_eqM1B (n c r : ℤ) :
 penCorr5M1B n c r (2*r + -1*c) (-1*r + 1*c) (3*r + -2*c)=onsetCorrection5_5M1B n c r := by
 unfold penCorr5M1B onsetCorrection5_5M1B
 ring

def onsetCorrection5_6M1B (n c r : ℤ) : ℤ :=
 272160*r + -90720*r^2 + -181440*c + 60480*c*r + 544320*n*r + -362880*n*c + -90720*n*c*r + 60480*n*c^2

def onsetValue5_6M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-6)+onsetCorrection5_6M1B n c r

theorem onsetCorrection5_6_eqM1B (n c r : ℤ) :
 penCorr6M1B n c r (2*r + -1*c) (-1*r + 1*c) (3*r + -2*c)=onsetCorrection5_6M1B n c r := by
 unfold penCorr6M1B onsetCorrection5_6M1B
 ring

def onsetCorrection5_7M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue5_7M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-7)+onsetCorrection5_7M1B n c r

def onsetCorrection5_8M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue5_8M1B (n c r : ℤ) : ℤ :=
 backShape5M94 c r (n-8)+onsetCorrection5_8M1B n c r
end
end MathGKM.Markov
