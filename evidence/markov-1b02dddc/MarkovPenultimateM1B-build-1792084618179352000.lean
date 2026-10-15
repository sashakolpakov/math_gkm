import MarkovFullDegree3M06
import MarkovConvK0B
/-! Machine-authored 1b02dddc. Backwards onset algebra; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def penPart0M1B (n c r q t u : ℤ) : ℤ :=
 288*u + -96*r*u + 576*n*u + -96*n*c*u

def penPart1M1B (n c r q t u : ℤ) : ℤ :=
 480*u + 96*t + -576*q + 480*r*u + -96*r*t + 960*r*q + -384*r^2*q + -288*c*u + -2880*n*u + 576*n*t + -3456*n*q + 2304*n*r*q + 480*n*c*u + -96*n*c*t + 576*n*c*q + -384*n*c*r*q

def penPart2M1B (n c r q t u : ℤ) : ℤ :=
 -8064*u + 1440*t + -6336*q + -32*r + -768*r*u + 480*r*t + 4800*r*q + -32*r^2 + 1536*r^2*q + -256*r^3 + -256*r^4 + 1536*c*u + -288*c*t + 1344*c*q + -1536*c*r*q + 4608*n*u + -2880*n*t + 3456*n*q + 192*n*r + -9216*n*r*q + 1536*n*r^3 + -768*n*c*u + 480*n*c*t + 1728*n*c*q + -32*n*c*r + 1536*n*c*r*q + -256*n*c*r^3 + -384*n*c^2*q

def penPart3M1B (n c r q t u : ℤ) : ℤ :=
 21120*u + -9600*t + 11520*q + 2240*r + -768*r*t + -33024*r*q + 7552*r^2 + -1536*r^2*q + 6400*r^3 + 512*r^4 + -288*c + -3072*c*u + 1536*c*t + 4992*c*q + -1344*c*r + 6144*c*r*q + -2688*c*r^2 + -1536*c*r^3 + -1152*c^2*q + 4608*n*t + 18432*n*q + -3840*n*r + 9216*n*r*q + -13824*n*r^2 + -3072*n*r^3 + 576*n*c + -768*n*c*t + -9984*n*c*q + 2944*n*c*r + -1536*n*c*r*q + 6912*n*c*r^2 + 512*n*c*r^3 + -96*n*c^2 + 1152*n*c^2*q + -384*n*c^2*r + -768*n*c^2*r^2

def penPart4M1B (n c r q t u : ℤ) : ℤ :=
 -20544*u + 21120*t + 33024*q + -29632*r + 1344*r*u + 56064*r*q + -42880*r^2 + -1536*r^2*q + -13568*r^3 + 256*r^4 + 6240*c + 2304*c*u + -3072*c*t + -30336*c*q + 26048*c*r + -7680*c*r*q + 22272*c*r^2 + 2560*c*r^3 + -2208*c^2 + 3840*c^2*q + -5376*c^2*r + -3072*c^2*r^2 + -8064*n*u + -27648*n*q + 26880*n*r + 9216*n*r*q + 18432*n*r^2 + -1536*n*r^3 + -6336*n*c + 1344*n*c*u + 6912*n*c*q + -27520*n*c*r + -1536*n*c*r*q + -7680*n*c*r^2 + 256*n*c*r^3 + 3360*n*c^2 + -384*n*c^2*q + 8448*n*c^2*r + 768*n*c^2*r^2 + -384*n*c^3 + -768*n*c^3*r

def penPart5M1B (n c r q t u : ℤ) : ℤ :=
 -1728*u + -17856*t + -86400*q + 71616*r + -1344*r*u + 1344*r*t + -20352*r*q + 65152*r^2 + 3840*r^2*q + 2304*r^3 + -1024*r^4 + -22688*c + 960*c*u + 2304*c*t + 38784*c*q + -66624*c*r + -28800*c*r^2 + 1024*c*r^3 + 15168*c^2 + -3456*c^2*q + 20736*c^2*r + 3072*c^2*r^2 + -2944*c^3 + -2560*c^3*r + 8064*n*u + -8064*n*t + -16128*n*q + -8448*n*r + -23040*n*r*q + 23040*n*r^2 + 6144*n*r^3 + 8256*n*c + -1344*n*c*u + 1344*n*c*t + 14208*n*c*q + 3712*n*c*r + 3840*n*c*r*q + -13056*n*c*r^2 + -1024*n*c*r^3 + -8288*n*c^2 + -1920*n*c^2*q + -384*n*c^2*r + 1536*n*c^2*r^2 + 2688*n*c^3 + -256*n*c^4

def penPart6M1B (n c r q t u : ℤ) : ℤ :=
 21120*u + -4416*t + 37248*q + -58880*r + -1344*r*t + -40320*r*q + -448*r^2 + -1536*r^2*q + 13568*r^3 + 256*r^4 + 19424*c + -3072*c*u + 960*c*t + 1536*c*q + 46528*c*r + 7680*c*r*q + -10752*c*r^2 + -3072*c*r^3 + -13152*c^2 + -1536*c^2*q + -10752*c^2*r + 3072*c^2*r^2 + 4096*c^3 + 512*c^3*r + -768*c^4 + 8064*n*t + 43776*n*q + -52608*n*r + 9216*n*r*q + -36864*n*r^2 + -1536*n*r^3 + 15168*n*c + -1344*n*c*t + -18816*n*c*q + 54848*n*c*r + -1536*n*c*r*q + 15360*n*c*r^2 + 256*n*c*r^3 + -11744*n*c^2 + 1920*n*c^2*q + -16896*n*c^2*r + -1536*n*c^2*r^2 + 3072*n*c^3 + 1536*n*c^3*r + -256*n*c^4

def penPart7M1B (n c r q t u : ℤ) : ℤ :=
 -18816*u + 21120*t + 54528*q + -41408*r + 768*r*u + 49920*r*q + -66944*r^2 + -1536*r^2*q + -9472*r^3 + 512*r^4 + 4256*c + 2304*c*u + -3072*c*t + -37248*c*q + 52800*c*r + -6144*c*r*q + 31872*c*r^2 + 512*c*r^3 + -1408*c^2 + 4224*c^2*q + -19968*c^2*r + -3072*c^2*r^2 + 1024*c^3 + 2560*c^3*r + -512*c^4 + -4608*n*u + -9216*n*q + 28416*n*r + 9216*n*r*q + -4608*n*r^2 + -3072*n*r^3 + -15168*n*c + 768*n*c*u + -768*n*c*q + -16256*n*c*r + -1536*n*c*r*q + 5376*n*c*r^2 + 512*n*c*r^3 + 11744*n*c^2 + 384*n*c^2*q + 1920*n*c^2*r + -768*n*c^2*r^2 + -3072*n*c^3 + 256*n*c^4

def penPart8M1B (n c r q t u : ℤ) : ℤ :=
 7200*u + -17280*t + -62208*q + 85952*r + -480*r*u + 768*r*t + -20736*r*q + 43648*r^2 + 1536*r^2*q + 256*r^3 + -256*r^4 + -30944*c + -768*c*u + 2304*c*t + 27264*c*q + -72384*c*r + 1536*c*r*q + -11520*c*r^2 + 512*c*r^3 + 23456*c^2 + -2304*c^2*q + 16128*c^2*r + -5632*c^3 + -512*c^3*r + 256*c^4 + 2880*n*u + -4608*n*t + -18432*n*q + 23808*n*r + -9216*n*r*q + 18432*n*r^2 + 1536*n*r^3 + -8256*n*c + -480*n*c*u + 768*n*c*t + 9984*n*c*q + -27008*n*c*r + 1536*n*c*r*q + -7680*n*c*r^2 + -256*n*c*r^3 + 8288*n*c^2 + -1152*n*c^2*q + 8448*n*c^2*r + 768*n*c^2*r^2 + -2688*n*c^3 + -768*n*c^3*r + 256*n*c^4

def penPart9M1B (n c r q t u : ℤ) : ℤ :=
 -1056*u + 6240*t + 20928*q + -32448*r + 96*r*u + -480*r*t + 2496*r*q + -5760*r^2 + -384*r^2*q + 768*r^3 + 12576*c + 96*c*u + -768*c*t + -6528*c*q + 15168*c*r + -384*c*r^2 + -5568*c^2 + 384*c^2*q + -768*c^2*r + 384*c^3 + -576*n*u + 2880*n*t + 10368*n*q + -16128*n*r + 2304*n*r*q + -4608*n*r^2 + 6336*n*c + 96*n*c*u + -480*n*c*t + -4032*n*c*q + 9600*n*c*r + -384*n*c*r*q + 768*n*c*r^2 + -3360*n*c^2 + 384*n*c^2*q + -1152*n*c^2*r + 384*n*c^3

def penPart10M1B (n c r q t u : ℤ) : ℤ :=
 -864*t + -1728*q + 2592*r + 96*r*t + 192*r*q + -288*r^2 + -864*c + 96*c*t + 192*c*q + -192*c*r + 96*c^2 + -576*n*t + -1152*n*q + 1728*n*r + -576*n*c + 96*n*c*t + 192*n*c*q + -288*n*c*r + 96*n*c^2

def penPolyM1B (n c r q t u : ℤ) : ℤ[X] :=
 Polynomial.C (penPart0M1B n c r q t u)*X^0 + Polynomial.C (penPart1M1B n c r q t u)*X^1 + Polynomial.C (penPart2M1B n c r q t u)*X^2 + Polynomial.C (penPart3M1B n c r q t u)*X^3 + Polynomial.C (penPart4M1B n c r q t u)*X^4 + Polynomial.C (penPart5M1B n c r q t u)*X^5 + Polynomial.C (penPart6M1B n c r q t u)*X^6 + Polynomial.C (penPart7M1B n c r q t u)*X^7 + Polynomial.C (penPart8M1B n c r q t u)*X^8 + Polynomial.C (penPart9M1B n c r q t u)*X^9 + Polynomial.C (penPart10M1B n c r q t u)*X^10

theorem pen_reflectM1B (n c r q t u : ℤ) :
 reflect 14 (fullH3FA (n:ℤ[X]) c r q t u X)=penPolyM1B n c r q t u := by
 have he : fullH3FA (n:ℤ[X]) c r q t u X=Polynomial.C (penPart0M1B n c r q t u)*X^14 + Polynomial.C (penPart1M1B n c r q t u)*X^13 + Polynomial.C (penPart2M1B n c r q t u)*X^12 + Polynomial.C (penPart3M1B n c r q t u)*X^11 + Polynomial.C (penPart4M1B n c r q t u)*X^10 + Polynomial.C (penPart5M1B n c r q t u)*X^9 + Polynomial.C (penPart6M1B n c r q t u)*X^8 + Polynomial.C (penPart7M1B n c r q t u)*X^7 + Polynomial.C (penPart8M1B n c r q t u)*X^6 + Polynomial.C (penPart9M1B n c r q t u)*X^5 + Polynomial.C (penPart10M1B n c r q t u)*X^4 := by
  simp only [fullH3FA,penPart9M1B,penPart8M1B,penPart7M1B,penPart6M1B,penPart5M1B,penPart4M1B,penPart3M1B,penPart2M1B,penPart1M1B,penPart0M1B,penPart10M1B,
   map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]
  ring
 rw [he]
 simp only [reflect_add,reflect_C_mul_X_pow]
 norm_num [revAt,penPolyM1B]

def penCorr1M1B (n c r q t u : ℤ) : ℤ :=
 4112640*u + 3144960*t + -112734720*q + -27921600*r + -120960*r*u + -120960*r*t + 41610240*r*q + -3104640*r^2 + -1935360*r^2*q + 29433600*r^3 + -3548160*r^4 + 5312160*c + -604800*c*u + -483840*c*t + 43182720*c*q + 29413440*c*r + -7741440*c*r*q + 16571520*c*r^2 + -10644480*c*r^3 + -786240*c^2 + -4475520*c^2*q + -7015680*c^2*r + -6773760*c^2*r^2 + -927360*c^3 + -806400*c^3*r + 725760*n*u + 725760*n*t + -94348800*n*q + 28788480*n*r + 11612160*n*r*q + -103057920*n*r^2 + 21288960*n*r^3 + -6834240*n*c + -120960*n*c*u + -120960*n*c*t + 33868800*n*c*q + -36005760*n*c*r + -1935360*n*c*r*q + 54915840*n*c*r^2 + -3548160*n*c*r^3 + 4767840*n*c^2 + -3024000*n*c^2*q + 16813440*n*c^2*r + -6289920*n*c^2*r^2 + -120960*n*c^3 + -1935360*n*c^3*r + -80640*n*c^4

theorem pen_conv1M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) 5=penCorr1M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr1M1B penPart9M1B penPart8M1B penPart7M1B penPart6M1B penPart5M1B penPart4M1B penPart3M1B penPart2M1B penPart1M1B penPart0M1B penPart10M1B
 ring

def penCorr2M1B (n c r q t u : ℤ) : ℤ :=
 3386880*u + 2419200*t + -54190080*q + -4052160*r + -120960*r*u + -120960*r*t + 25159680*r*q + 5160960*r^2 + -1451520*r^2*q + 8951040*r^3 + -1532160*r^4 + 1239840*c + -483840*c*u + -362880*c*t + 18264960*c*q + 4818240*c*r + -4354560*c*r*q + 241920*c*r^2 + -3064320*c*r^3 + -695520*c^2 + -1693440*c^2*q + -1693440*c^2*r + -967680*c^2*r^2 + 725760*n*u + 725760*n*t + -53706240*n*q + 967680*n*r + 8709120*n*r*q + -29030400*n*r^2 + 9192960*n*r^3 + -544320*n*c + -120960*n*c*u + -120960*n*c*t + 18385920*n*c*q + -1612800*n*c*r + -1451520*n*c*r*q + 14999040*n*c*r^2 + -1532160*n*c*r^3 + 816480*n*c^2 + -1572480*n*c^2*q + 1693440*n*c^2*r + -1693440*n*c^2*r^2 + -120960*n*c^3 + -241920*n*c^3*r

theorem pen_conv2M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) 4=penCorr2M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr2M1B penPart9M1B penPart8M1B penPart7M1B penPart6M1B penPart5M1B penPart4M1B penPart3M1B penPart2M1B penPart1M1B penPart0M1B penPart10M1B
 ring

def penCorr3M1B (n c r q t u : ℤ) : ℤ :=
 2661120*u + 1693440*t + -18869760*q + 624960*r + -120960*r*u + -120960*r*t + 12579840*r*q + 2298240*r^2 + -967680*r^2*q + 1370880*r^3 + -483840*r^4 + -90720*c + -362880*c*u + -241920*c*t + 4959360*c*q + -423360*c*r + -1935360*c*r*q + -846720*c*r^2 + -483840*c*r^3 + -362880*c^2*q + 725760*n*u + 725760*n*t + -24675840*n*q + -725760*n*r + 5806080*n*r*q + -4354560*n*r^2 + 2903040*n*r^3 + 181440*n*c + -120960*n*c*u + -120960*n*c*t + 7741440*n*c*q + 846720*n*c*r + -967680*n*c*r*q + 2177280*n*c*r^2 + -483840*n*c*r^3 + -30240*n*c^2 + -604800*n*c^2*q + -120960*n*c^2*r + -241920*n*c^2*r^2

theorem pen_conv3M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) 3=penCorr3M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr3M1B penPart9M1B penPart8M1B penPart7M1B penPart6M1B penPart5M1B penPart4M1B penPart3M1B penPart2M1B penPart1M1B penPart0M1B penPart10M1B
 ring

def penCorr4M1B (n c r q t u : ℤ) : ℤ :=
 1935360*u + 695520*t + -3447360*q + -10080*r + -120960*r*u + -90720*r*t + 3931200*r*q + -10080*r^2 + -483840*r^2*q + -80640*r^3 + -80640*r^4 + -241920*c*u + -90720*c*t + 423360*c*q + -483840*c*r*q + 725760*n*u + 544320*n*t + -7620480*n*q + 60480*n*r + 2903040*n*r*q + 483840*n*r^3 + -120960*n*c*u + -90720*n*c*t + 1995840*n*c*q + -10080*n*c*r + -483840*n*c*r*q + -80640*n*c*r^3 + -120960*n*c^2*q

theorem pen_conv4M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) 2=penCorr4M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr4M1B penPart9M1B penPart8M1B penPart7M1B penPart6M1B penPart5M1B penPart4M1B penPart3M1B penPart2M1B penPart1M1B penPart0M1B penPart10M1B
 ring

def penCorr5M1B (n c r q t u : ℤ) : ℤ :=
 876960*u + 30240*t + -181440*q + -90720*r*u + -30240*r*t + 302400*r*q + -120960*r^2*q + -90720*c*u + 544320*n*u + 181440*n*t + -1088640*n*q + 725760*n*r*q + -90720*n*c*u + -30240*n*c*t + 181440*n*c*q + -120960*n*c*r*q

theorem pen_conv5M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) 1=penCorr5M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr5M1B penPart9M1B penPart8M1B penPart7M1B penPart6M1B penPart5M1B penPart4M1B penPart3M1B penPart2M1B penPart1M1B penPart0M1B penPart10M1B
 ring

def penCorr6M1B (n c r q t u : ℤ) : ℤ :=
 90720*u + -30240*r*u + 181440*n*u + -30240*n*c*u

theorem pen_conv6M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) 0=penCorr6M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr6M1B penPart9M1B penPart8M1B penPart7M1B penPart6M1B penPart5M1B penPart4M1B penPart3M1B penPart2M1B penPart1M1B penPart0M1B penPart10M1B
 ring
end
end MathGKM.Markov
