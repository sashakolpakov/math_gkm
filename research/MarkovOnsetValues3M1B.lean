import MarkovBackwardChamber3M94
import MarkovPenultimateM1B
/-! Machine-authored 1b02dddc. Backwards onset algebra; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def onsetCorrection3_1M1B (n c r : ℤ) : ℤ :=
 -256536000*r + 80236800*r^2 + 25562880*r^3 + -3548160*r^4 + 121191840*c + 74531520*c*r + 3024000*c*r^2 + -10644480*c*r^3 + -44452800*c^2 + -8225280*c^2*r + -6773760*c^2*r^2 + 3548160*c^3 + -806400*c^3*r + -160634880*n*r + -79833600*n*r^2 + 21288960*n*r^3 + 88240320*n*c + 20240640*n*c*r + 51045120*n*c*r^2 + -3548160*n*c*r^3 + -29221920*n*c^2 + 12700800*n*c^2*r + -6289920*n*c^2*r^2 + 2903040*n*c^3 + -1935360*n*c^3*r + -80640*n*c^4

def onsetValue3_1M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-1)+onsetCorrection3_1M1B n c r

theorem onsetCorrection3_1_eqM1B (n c r : ℤ) :
 penCorr1M1B n c r (2*r + -1*c) (-1*r + 1*c) (0)=onsetCorrection3_1M1B n c r := by
 unfold penCorr1M1B onsetCorrection3_1M1B
 ring

def onsetCorrection3_2M1B (n c r : ℤ) : ℤ :=
 -114851520*r + 55601280*r^2 + 6048000*r^3 + -1532160*r^4 + 57849120*c + 16430400*c*r + -7015680*c*r^2 + -3064320*c*r^3 + -19323360*c^2 + -725760*c^2*r + -967680*c^2*r^2 + 1693440*c^3 + -107170560*n*r + -11612160*n*r^2 + 9192960*n*r^3 + 53887680*n*c + 26570880*n*c*r + 12096000*n*c*r^2 + -1532160*n*c*r^3 + -17690400*n*c^2 + -1693440*n*c^2*r^2 + 1451520*n*c^3 + -241920*n*c^3*r

def onsetValue3_2M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-2)+onsetCorrection3_2M1B n c r

theorem onsetCorrection3_2_eqM1B (n c r : ℤ) :
 penCorr2M1B n c r (2*r + -1*c) (-1*r + 1*c) (0)=onsetCorrection3_2M1B n c r := by
 unfold penCorr2M1B onsetCorrection3_2M1B
 ring

def onsetCorrection3_3M1B (n c r : ℤ) : ℤ :=
 -38808000*r + 27578880*r^2 + -564480*r^3 + -483840*r^4 + 20472480*c + -2963520*c*r + -3749760*c*r^2 + -483840*c*r^3 + -5201280*c^2 + 1209600*c^2*r + 362880*c^3 + -50803200*n*r + 7257600*n*r^2 + 2903040*n*r^3 + 25583040*n*c + 10644480*n*c*r + 241920*n*c*r^2 + -483840*n*c*r^3 + -7892640*n*c^2 + -362880*n*c^2*r + -241920*n*c^2*r^2 + 604800*n*c^3

def onsetValue3_3M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-3)+onsetCorrection3_3M1B n c r

theorem onsetCorrection3_3_eqM1B (n c r : ℤ) :
 penCorr3M1B n c r (2*r + -1*c) (-1*r + 1*c) (0)=onsetCorrection3_3M1B n c r := by
 unfold penCorr3M1B onsetCorrection3_3M1B
 ring

def onsetCorrection3_4M1B (n c r : ℤ) : ℤ :=
 -7600320*r + 7943040*r^2 + -1048320*r^3 + -80640*r^4 + 4142880*c + -3084480*c*r + -483840*c*r^2 + -514080*c^2 + 483840*c^2*r + -15724800*n*r + 5806080*n*r^2 + 483840*n*r^3 + 8164800*n*c + 1169280*n*c*r + -967680*n*c*r^2 + -80640*n*c*r^3 + -2086560*n*c^2 + 241920*n*c^2*r + 120960*n*c^3

def onsetValue3_4M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-4)+onsetCorrection3_4M1B n c r

theorem onsetCorrection3_4_eqM1B (n c r : ℤ) :
 penCorr4M1B n c r (2*r + -1*c) (-1*r + 1*c) (0)=onsetCorrection3_4M1B n c r := by
 unfold penCorr4M1B onsetCorrection3_4M1B
 ring

def onsetCorrection3_5M1B (n c r : ℤ) : ℤ :=
 -393120*r + 635040*r^2 + -241920*r^3 + 211680*c + -332640*c*r + 120960*c*r^2 + -2358720*n*r + 1451520*n*r^2 + 1270080*n*c + -332640*n*c*r + -241920*n*c*r^2 + -211680*n*c^2 + 120960*n*c^2*r

def onsetValue3_5M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-5)+onsetCorrection3_5M1B n c r

theorem onsetCorrection3_5_eqM1B (n c r : ℤ) :
 penCorr5M1B n c r (2*r + -1*c) (-1*r + 1*c) (0)=onsetCorrection3_5M1B n c r := by
 unfold penCorr5M1B onsetCorrection3_5M1B
 ring

def onsetCorrection3_6M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue3_6M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-6)+onsetCorrection3_6M1B n c r

theorem onsetCorrection3_6_eqM1B (n c r : ℤ) :
 penCorr6M1B n c r (2*r + -1*c) (-1*r + 1*c) (0)=onsetCorrection3_6M1B n c r := by
 unfold penCorr6M1B onsetCorrection3_6M1B
 ring

def onsetCorrection3_7M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue3_7M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-7)+onsetCorrection3_7M1B n c r

def onsetCorrection3_8M1B (n c r : ℤ) : ℤ :=
 0

def onsetValue3_8M1B (n c r : ℤ) : ℤ :=
 backShape3M94 c r (n-8)+onsetCorrection3_8M1B n c r
end
end MathGKM.Markov
