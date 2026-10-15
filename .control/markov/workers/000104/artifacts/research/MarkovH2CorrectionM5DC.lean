import MarkovMiddleCorrectedM5DC
/-! Machine-authored request 5dc9c88d. Explicit correction identities, not inequalities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def h2Part0M5DC (n c r q : ℤ) : ℤ :=
 -48*r*q + 48*r^2*q + 192*n*q + -384*n*r*q + -48*n*c*q + 96*n*c*r*q + 768*n^2*q + -384*n^2*c*q + 48*n^2*c^2*q

def h2Part1M5DC (n c r q : ℤ) : ℤ :=
 -960*q + -1152*r*q + 192*r^2 + -96*r^2*q + 288*r^3 + 96*r^4 + 192*c*q + 288*c*r*q + 4608*n*q + 768*n*r*q + -1152*n*r^2 + -768*n*r^3 + -2304*n*c*q + -192*n*c*r*q + 288*n*c*r^2 + 192*n*c*r^3 + 288*n*c^2*q + -1536*n^2*q + 1536*n^2*r^2 + 768*n^2*c*q + -768*n^2*c*r^2 + -96*n^2*c^2*q + 96*n^2*c^2*r^2

def h2Part2M5DC (n c r q : ℤ) : ℤ :=
 10368*q + -3456*r + 3312*r*q + -7008*r^2 + -144*r^2*q + -2016*r^3 + 576*c + -4176*c*q + 2640*c*r + -672*c*r*q + 2928*c*r^2 + 768*c*r^3 + 432*c^2*q + -13248*n*q + 8064*n*r + 1152*n*r*q + 9216*n*r^2 + -1344*n*c + 6000*n*c*q + -7776*n*c*r + -288*n*c*r*q + -6144*n*c*r^2 + 336*n*c^2 + -672*n*c^2*q + 1440*n*c^2*r + 960*n*c^2*r^2 + -2304*n^2*q + -4608*n^2*r + 768*n^2*c + 1152*n^2*c*q + 5376*n^2*c*r + -384*n^2*c^2 + -144*n^2*c^2*q + -1824*n^2*c^2*r + 48*n^2*c^3 + 192*n^2*c^3*r

def h2Part3M5DC (n c r q : ℤ) : ℤ :=
 -26880*q + 19584*r + 768*r*q + 16128*r^2 + 384*r^2*q + 768*r^3 + -384*r^4 + -7104*c + 11136*c*q + -21120*c*r + -384*c*r*q + -8832*c*r^2 + 4224*c^2 + -1152*c^2*q + 6720*c^2*r + 2112*c^2*r^2 + -3072*n*q + -12288*n*r + -3072*n*r*q + -2304*n*r^2 + 3072*n*r^3 + 7680*n*c + 2304*n*c*q + 16128*n*c*r + 768*n*c*r*q + -192*n*c*r^2 + -768*n*c*r^3 + -7296*n*c^2 + -384*n*c^2*q + -8640*n*c^2*r + 192*n*c^2*r^2 + 1344*n*c^3 + 1344*n*c^3*r + 6144*n^2*q + -3072*n^2*r + -6144*n^2*r^2 + -1536*n^2*c + -3072*n^2*c*q + 4608*n^2*c*r + 3072*n^2*c*r^2 + 2304*n^2*c^2 + 384*n^2*c^2*q + -1728*n^2*c^2*r + -384*n^2*c^2*r^2 + -864*n^2*c^3 + 192*n^2*c^3*r + 96*n^2*c^4

def h2Part4M5DC (n c r q : ℤ) : ℤ :=
 12288*q + -27264*r + -8928*r*q + -6528*r^2 + 96*r^2*q + 6144*r^3 + 7872*c + -3648*c*q + 22848*c*r + 1920*c*r*q + 2112*c*r^2 + -2304*c*r^3 + -8016*c^2 + 192*c^2*q + -6528*c^2*r + 384*c^2*r^2 + 4272*c^3 + 2304*c^3*r + 35712*n*q + -9216*n*r + -768*n*r*q + -28416*n*r^2 + 5760*n*c + -16608*n*c*q + 14592*n*c*r + 192*n*c*r*q + 18624*n*c*r^2 + -3360*n*c^2 + 1920*n*c^2*q + -7680*n*c^2*r + -2880*n*c^2*r^2 + -1824*n*c^3 + 1152*n*c^3*r + 576*n*c^4 + 1536*n^2*q + 15360*n^2*r + -6144*n^2*c + -768*n^2*c*q + -16896*n^2*c*r + 6144*n^2*c^2 + 96*n^2*c^2*q + 5568*n^2*c^2*r + -1920*n^2*c^3 + -576*n^2*c^3*r + 192*n^2*c^4

def h2Part5M5DC (n c r q : ℤ) : ℤ :=
 40320*q + -12672*r + 4608*r*q + -29568*r^2 + -576*r^2*q + -4032*r^3 + 576*r^4 + -5184*c + -17664*c*q + 12672*c*r + -576*c*r*q + 20352*c*r^2 + 3072*c^2 + 1920*c^2*q + -2112*c^2*r + -4416*c^2*r^2 + 2400*c^3 + 1536*c^3*r + 864*c^4 + -18432*n*q + 46080*n*r + 4608*n*r*q + 13824*n*r^2 + -4608*n*r^3 + -10752*n*c + 6912*n*c*q + -55296*n*c*r + -1152*n*c*r*q + -1152*n*c*r^2 + 1152*n*c*r^3 + 10368*n*c^2 + -576*n*c^2*q + 22464*n*c^2*r + -576*n*c^2*r^2 + -5760*n*c^3 + -2880*n*c^3*r + 960*n*c^4 + -9216*n^2*q + 9216*n^2*r + 9216*n^2*r^2 + 1536*n^2*c + 4608*n^2*c*q + -13824*n^2*c*r + -4608*n^2*c*r^2 + -2304*n^2*c^2 + -576*n^2*c^2*q + 5184*n^2*c^2*r + 576*n^2*c^2*r^2 + 864*n^2*c^3 + -576*n^2*c^3*r + -96*n^2*c^4

def h2Part6M5DC (n c r q : ℤ) : ℤ :=
 -52992*q + 53376*r + 7392*r*q + 35520*r^2 + 96*r^2*q + -6336*r^3 + -28608*c + 19104*c*q + -57504*c*r + -1728*c*r*q + -13152*c*r^2 + 2304*c*r^3 + 18768*c^2 + -1632*c^2*q + 22272*c^2*r + -768*c^2*r^2 + 720*c^3 + -3072*c^3*r + 1152*c^4 + -29568*n*q + -11520*n*r + -768*n*r*q + 29952*n*r^2 + 10752*n*c + 14304*n*c*q + -4032*n*c*r + 192*n*c*r*q + -19008*n*c*r^2 + -11520*n*c^2 + -1728*n*c^2*q + 10944*n*c^2*r + 2880*n*c^2*r^2 + 3744*n*c^3 + -2304*n*c^3*r + -384*n*c^4 + 1536*n^2*q + -18432*n^2*r + 10752*n^2*c + -768*n^2*c*q + 18432*n^2*c*r + -11520*n^2*c^2 + 96*n^2*c^2*q + -5760*n^2*c^2*r + 3744*n^2*c^3 + 576*n^2*c^3*r + -384*n^2*c^4

def h2Part7M5DC (n c r q : ℤ) : ℤ :=
 3840*q + -39552*r + -6912*r*q + 9984*r^2 + 384*r^2*q + 4608*r^3 + -384*r^4 + 7104*c + 1152*c*q + 33408*c*r + 1152*c*r*q + -14208*c*r^2 + -9600*c^2 + -384*c^2*q + -6720*c^2*r + 2496*c^2*r^2 + 9024*c^3 + -1536*c^3*r + -192*c^4 + 27648*n*q + -55296*n*r + -3072*n*r*q + -16128*n*r^2 + 3072*n*r^3 + 13824*n*c + -11520*n*c*q + 62208*n*c*r + 768*n*c*r*q + 1728*n*c*r^2 + -768*n*c*r^3 + -14976*n*c^2 + 1152*n*c^2*q + -19008*n*c^2*r + 576*n*c^2*r^2 + 7488*n*c^3 + 1728*n*c^3*r + -1152*n*c^4 + 6144*n^2*q + -9216*n^2*r + -6144*n^2*r^2 + 1536*n^2*c + -3072*n^2*c*q + 13824*n^2*c*r + 3072*n^2*c*r^2 + -2304*n^2*c^2 + 384*n^2*c^2*q + -5184*n^2*c^2*r + -384*n^2*c^2*r^2 + 864*n^2*c^3 + 576*n^2*c^3*r + -96*n^2*c^4

def h2Part8M5DC (n c r q : ℤ) : ℤ :=
 27648*q + -17280*r + -1008*r*q + -23424*r^2 + -144*r^2*q + 2304*r^3 + -4032*c + -10560*c*q + 31296*c*r + 384*c*r*q + 8256*c*r^2 + -768*c*r^3 + 1488*c^2 + 960*c^2*q + -15744*c^2*r + 384*c^2*r^2 + 4176*c^3 + 768*c^3*r + -384*c^4 + 4032*n*q + 18432*n*r + 1152*n*r*q + -11520*n*r^2 + -18048*n*c + -2544*n*c*q + -4608*n*c*r + -288*n*c*r*q + 6720*n*c*r^2 + 15648*n*c^2 + 384*n*c^2*q + -4608*n*c^2*r + -960*n*c^2*r^2 + -2016*n*c^3 + 1152*n*c^3*r + -192*n*c^4 + -2304*n^2*q + 9216*n^2*r + -6144*n^2*c + 1152*n^2*c*q + -7680*n^2*c*r + 6144*n^2*c^2 + -144*n^2*c^2*q + 2112*n^2*c^2*r + -1920*n^2*c^3 + -192*n^2*c^3*r + 192*n^2*c^4

def h2Part9M5DC (n c r q : ℤ) : ℤ :=
 -16320*q + 32640*r + 2688*r*q + 3264*r^2 + -96*r^2*q + -1632*r^3 + 96*r^4 + -16320*c + 5184*c*q + -24960*c*r + -480*c*r*q + 2688*c*r^2 + 13824*c^2 + -384*c^2*q + 2112*c^2*r + -192*c^2*r^2 + -2208*c^3 + 96*c^4 + -10752*n*q + 21504*n*r + 768*n*r*q + 5760*n*r^2 + -768*n*r^3 + -10752*n*c + 4608*n*c*q + -23040*n*c*r + -192*n*c*r*q + -672*n*c*r^2 + 192*n*c*r^3 + 11904*n*c^2 + -480*n*c^2*q + 5184*n*c^2*r + -192*n*c^2*r^2 + -3072*n*c^3 + -192*n*c^3*r + 192*n*c^4 + -1536*n^2*q + 3072*n^2*r + 1536*n^2*r^2 + -1536*n^2*c + 768*n^2*c*q + -4608*n^2*c*r + -768*n^2*c*r^2 + 2304*n^2*c^2 + -96*n^2*c^2*q + 1728*n^2*c^2*r + 96*n^2*c^2*r^2 + -864*n^2*c^3 + -192*n^2*c^3*r + 96*n^2*c^4

def h2Part10M5DC (n c r q : ℤ) : ℤ :=
 2688*q + -5376*r + -720*r*q + 1440*r^2 + 48*r^2*q + -96*r^3 + 2688*c + -720*c*q + 720*c*r + 96*c*r*q + -144*c*r^2 + -720*c^2 + 48*c^2*q + 48*c^3 + 2880*n*q + -5760*n*r + -384*n*r*q + 768*n*r^2 + 2880*n*c + -1104*n*c*q + 1824*n*c*r + 96*n*c*r*q + -192*n*c*r^2 + -1104*n*c^2 + 96*n*c^2*q + -96*n*c^2*r + 96*n*c^3 + 768*n^2*q + -1536*n^2*r + 768*n^2*c + -384*n^2*c*q + 768*n^2*c*r + -384*n^2*c^2 + 48*n^2*c^2*q + -96*n^2*c^2*r + 48*n^2*c^3

def h2PolyM5DC (n c r q : ℤ) : ℤ[X] :=
 Polynomial.C (h2Part0M5DC n c r q)*X^0 + Polynomial.C (h2Part1M5DC n c r q)*X^1 + Polynomial.C (h2Part2M5DC n c r q)*X^2 + Polynomial.C (h2Part3M5DC n c r q)*X^3 + Polynomial.C (h2Part4M5DC n c r q)*X^4 + Polynomial.C (h2Part5M5DC n c r q)*X^5 + Polynomial.C (h2Part6M5DC n c r q)*X^6 + Polynomial.C (h2Part7M5DC n c r q)*X^7 + Polynomial.C (h2Part8M5DC n c r q)*X^8 + Polynomial.C (h2Part9M5DC n c r q)*X^9 + Polynomial.C (h2Part10M5DC n c r q)*X^10

theorem h2_reflectM5DC (n c r q t u : ℤ) :
 reflect 13 (fullH2FA (n:ℤ[X]) c r q t u X)=h2PolyM5DC n c r q := by
 have he : fullH2FA (n:ℤ[X]) c r q t u X=Polynomial.C (h2Part0M5DC n c r q)*X^13 + Polynomial.C (h2Part1M5DC n c r q)*X^12 + Polynomial.C (h2Part2M5DC n c r q)*X^11 + Polynomial.C (h2Part3M5DC n c r q)*X^10 + Polynomial.C (h2Part4M5DC n c r q)*X^9 + Polynomial.C (h2Part5M5DC n c r q)*X^8 + Polynomial.C (h2Part6M5DC n c r q)*X^7 + Polynomial.C (h2Part7M5DC n c r q)*X^6 + Polynomial.C (h2Part8M5DC n c r q)*X^5 + Polynomial.C (h2Part9M5DC n c r q)*X^4 + Polynomial.C (h2Part10M5DC n c r q)*X^3 := by
  simp only [fullH2FA,h2Part0M5DC,h2Part1M5DC,h2Part2M5DC,h2Part3M5DC,h2Part4M5DC,h2Part5M5DC,h2Part6M5DC,h2Part7M5DC,h2Part8M5DC,h2Part9M5DC,h2Part10M5DC,map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]
  rw [show Polynomial.C n=(n:ℤ[X]) from Polynomial.C_eq_intCast n, show Polynomial.C c=(c:ℤ[X]) from Polynomial.C_eq_intCast c, show Polynomial.C r=(r:ℤ[X]) from Polynomial.C_eq_intCast r, show Polynomial.C q=(q:ℤ[X]) from Polynomial.C_eq_intCast q]
  ring
 rw [he]
 simp only [reflect_add,reflect_C_mul_X_pow]
 norm_num [revAt,h2PolyM5DC]

def h2Corr1M5DC (n c r q : ℤ) : ℤ :=
 278691840*q + 25159680*r + -189665280*r*q + -538030080*r^2 + 11612160*r^2*q + -129669120*r^3 + 42577920*r^4 + -142248960*c + -210954240*c*q + -257402880*c*r + 46448640*c*r*q + 185794560*c*r^2 + 127733760*c*r^3 + 129911040*c^2 + 32901120*c^2*q + 238049280*c^2*r + 87091200*c^2*r^2 + 21530880*c^3 + 11612160*c^3*r + 758661120*n*q + 921231360*n*r + -92897280*n*r*q + 739307520*n*r^2 + -340623360*n*r^3 + 94832640*n*c + -375459840*n*c*q + -687052800*n*c*r + 23224320*n*c*r*q + -854461440*n*c*r^2 + 85155840*n*c*r^3 + -250145280*n*c^2 + 46448640*n*c^2*q + -125798400*n*c^2*r + 167408640*n*c^2*r^2 + 44997120*n*c^3 + 59996160*n*c^3*r + 2903040*n*c^4 + 185794560*n^2*q + -882524160*n^2*r + 681246720*n^2*r^2 + 46448640*n^2*c + -92897280*n^2*c*q + 1076060160*n^2*c*r + -340623360*n^2*c*r^2 + 54190080*n^2*c^2 + 11612160*n^2*c^2*q + -372556800*n^2*c^2*r + 42577920*n^2*c^2*r^2 + -35804160*n^2*c^3 + 39674880*n^2*c^3*r + 4838400*n^2*c^4

theorem h2_conv1M5DC (n c r q : ℤ) :
 5040*convSevenK0B (h2PolyM5DC n c r q) 4=h2Corr1M5DC n c r q := by
 unfold h2PolyM5DC
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B,Nat.choose]
 simp only [h2Corr1M5DC,h2Part0M5DC,h2Part1M5DC,h2Part2M5DC,h2Part3M5DC,h2Part4M5DC,h2Part5M5DC,h2Part6M5DC,h2Part7M5DC,h2Part8M5DC,h2Part9M5DC,h2Part10M5DC]
 ring

theorem middleCorrection_onset1M5DC (n c r : ℕ) :
 middleCorrectionM5DC n c r (2*n+1)=h2Corr1M5DC n c r ((2*r-c:ℕ):ℤ) := by
 unfold middleCorrectionM5DC
 rw [if_pos (by omega : 2*n+1≤2*n+5),show 2*n+5-(2*n+1)=4 by omega]
 have h := h2_reflectM5DC (n:ℤ) (c:ℤ) (r:ℤ) ((2*r-c:ℕ):ℤ)
  ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at h
 rw [h]
 exact h2_conv1M5DC n c r ((2*r-c:ℕ):ℤ)

def h2Corr2M5DC (n c r q : ℤ) : ℤ :=
 108380160*q + -40642560*r + -100638720*r*q + -166440960*r^2 + 7741440*r^2*q + -25159680*r^3 + 15482880*r^4 + -12579840*c + -77414400*c*q + 23224320*c*r*q + 73543680*c*r^2 + 30965760*c*r^3 + 21288960*c^2 + 11612160*c^2*q + 33868800*c^2*r + 10644480*c^2*r^2 + 402554880*n*q + 263208960*n*r + -61931520*n*r*q + 150958080*n*r^2 + -123863040*n*r^3 + -15482880*n*c + -193536000*n*c*q + -232243200*n*c*r + 15482880*n*c*r*q + -196439040*n*c*r^2 + 30965760*n*c*r^3 + -23224320*n*c^2 + 23224320*n*c^2*q + 14515200*n*c^2*r + 39674880*n*c^2*r^2 + 6773760*n*c^3 + 6773760*n*c^3*r + 123863040*n^2*q + -201277440*n^2*r + 247726080*n^2*r^2 + 23224320*n^2*c + -61931520*n^2*c*q + 239984640*n^2*c*r + -123863040*n^2*c*r^2 + -3870720*n^2*c^2 + 7741440*n^2*c^2*q + -82252800*n^2*c^2*r + 15482880*n^2*c^2*r^2 + -2419200*n^2*c^3 + 8709120*n^2*c^3*r + 483840*n^2*c^4

theorem h2_conv2M5DC (n c r q : ℤ) :
 5040*convSevenK0B (h2PolyM5DC n c r q) 3=h2Corr2M5DC n c r q := by
 unfold h2PolyM5DC
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B,Nat.choose]
 simp only [h2Corr2M5DC,h2Part0M5DC,h2Part1M5DC,h2Part2M5DC,h2Part3M5DC,h2Part4M5DC,h2Part5M5DC,h2Part6M5DC,h2Part7M5DC,h2Part8M5DC,h2Part9M5DC,h2Part10M5DC]
 ring

theorem middleCorrection_onset2M5DC (n c r : ℕ) :
 middleCorrectionM5DC n c r (2*n+2)=h2Corr2M5DC n c r ((2*r-c:ℕ):ℤ) := by
 unfold middleCorrectionM5DC
 rw [if_pos (by omega : 2*n+2≤2*n+5),show 2*n+5-(2*n+2)=3 by omega]
 have h := h2_reflectM5DC (n:ℤ) (c:ℤ) (r:ℤ) ((2*r-c:ℕ):ℤ)
  ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at h
 rw [h]
 exact h2_conv2M5DC n c r ((2*r-c:ℕ):ℤ)

def h2Corr3M5DC (n c r q : ℤ) : ℤ :=
 13547520*q + -17418240*r + -38465280*r*q + -27578880*r^2 + 4112640*r^2*q + 1451520*r^3 + 3870720*r^4 + 2903040*c + -13305600*c*q + 13305600*c*r + 8225280*c*r*q + 14757120*c*r^2 + 3870720*c*r^3 + 2177280*c^2*q + 153861120*n*q + 40642560*n*r + -32901120*n*r*q + -30965760*n*r^3 + -6773760*n*c + -71366400*n*c*q + -39191040*n*c*r + 8225280*n*c*r*q + -19353600*n*c*r^2 + 7741440*n*c*r^3 + 1693440*n*c^2 + 8225280*n*c^2*q + 7257600*n*c^2*r + 4838400*n*c^2*r^2 + 65802240*n^2*q + -23224320*n^2*r + 61931520*n^2*r^2 + 3870720*n^2*c + -32901120*n^2*c*q + 27095040*n^2*c*r + -30965760*n^2*c*r^2 + -1935360*n^2*c^2 + 4112640*n^2*c^2*q + -9192960*n^2*c^2*r + 3870720*n^2*c^2*r^2 + 241920*n^2*c^3 + 967680*n^2*c^3*r

theorem h2_conv3M5DC (n c r q : ℤ) :
 5040*convSevenK0B (h2PolyM5DC n c r q) 2=h2Corr3M5DC n c r q := by
 unfold h2PolyM5DC
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B,Nat.choose]
 simp only [h2Corr3M5DC,h2Part0M5DC,h2Part1M5DC,h2Part2M5DC,h2Part3M5DC,h2Part4M5DC,h2Part5M5DC,h2Part6M5DC,h2Part7M5DC,h2Part8M5DC,h2Part9M5DC,h2Part10M5DC]
 ring

theorem middleCorrection_onset3M5DC (n c r : ℕ) :
 middleCorrectionM5DC n c r (2*n+3)=h2Corr3M5DC n c r ((2*r-c:ℕ):ℤ) := by
 unfold middleCorrectionM5DC
 rw [if_pos (by omega : 2*n+3≤2*n+5),show 2*n+5-(2*n+3)=2 by omega]
 have h := h2_reflectM5DC (n:ℤ) (c:ℤ) (r:ℤ) ((2*r-c:ℕ):ℤ)
  ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at h
 rw [h]
 exact h2_conv3M5DC n c r ((2*r-c:ℕ):ℤ)

def h2Corr4M5DC (n c r q : ℤ) : ℤ :=
 -4838400*q + -7741440*r*q + 967680*r^2 + 1451520*r^2*q + 1451520*r^3 + 483840*r^4 + 967680*c*q + 1451520*c*r*q + 30965760*n*q + -11612160*n*r*q + -5806080*n*r^2 + -3870720*n*r^3 + -13547520*n*c*q + 2903040*n*c*r*q + 1451520*n*c*r^2 + 967680*n*c*r^3 + 1451520*n*c^2*q + 23224320*n^2*q + 7741440*n^2*r^2 + -11612160*n^2*c*q + -3870720*n^2*c*r^2 + 1451520*n^2*c^2*q + 483840*n^2*c^2*r^2

theorem h2_conv4M5DC (n c r q : ℤ) :
 5040*convSevenK0B (h2PolyM5DC n c r q) 1=h2Corr4M5DC n c r q := by
 unfold h2PolyM5DC
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B,Nat.choose]
 simp only [h2Corr4M5DC,h2Part0M5DC,h2Part1M5DC,h2Part2M5DC,h2Part3M5DC,h2Part4M5DC,h2Part5M5DC,h2Part6M5DC,h2Part7M5DC,h2Part8M5DC,h2Part9M5DC,h2Part10M5DC]
 ring

theorem middleCorrection_onset4M5DC (n c r : ℕ) :
 middleCorrectionM5DC n c r (2*n+4)=h2Corr4M5DC n c r ((2*r-c:ℕ):ℤ) := by
 unfold middleCorrectionM5DC
 rw [if_pos (by omega : 2*n+4≤2*n+5),show 2*n+5-(2*n+4)=1 by omega]
 have h := h2_reflectM5DC (n:ℤ) (c:ℤ) (r:ℤ) ((2*r-c:ℕ):ℤ)
  ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at h
 rw [h]
 exact h2_conv4M5DC n c r ((2*r-c:ℕ):ℤ)

def h2Corr5M5DC (n c r q : ℤ) : ℤ :=
 -241920*r*q + 241920*r^2*q + 967680*n*q + -1935360*n*r*q + -241920*n*c*q + 483840*n*c*r*q + 3870720*n^2*q + -1935360*n^2*c*q + 241920*n^2*c^2*q

theorem h2_conv5M5DC (n c r q : ℤ) :
 5040*convSevenK0B (h2PolyM5DC n c r q) 0=h2Corr5M5DC n c r q := by
 unfold h2PolyM5DC
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B,Nat.choose]
 simp only [h2Corr5M5DC,h2Part0M5DC,h2Part1M5DC,h2Part2M5DC,h2Part3M5DC,h2Part4M5DC,h2Part5M5DC,h2Part6M5DC,h2Part7M5DC,h2Part8M5DC,h2Part9M5DC,h2Part10M5DC]
 ring

theorem middleCorrection_onset5M5DC (n c r : ℕ) :
 middleCorrectionM5DC n c r (2*n+5)=h2Corr5M5DC n c r ((2*r-c:ℕ):ℤ) := by
 unfold middleCorrectionM5DC
 rw [if_pos (by omega : 2*n+5≤2*n+5),show 2*n+5-(2*n+5)=0 by omega]
 have h := h2_reflectM5DC (n:ℤ) (c:ℤ) (r:ℤ) ((2*r-c:ℕ):ℤ)
  ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at h
 rw [h]
 exact h2_conv5M5DC n c r ((2*r-c:ℕ):ℤ)
end
end MathGKM.Markov
