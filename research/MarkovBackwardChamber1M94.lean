import MarkovTailSource1M06
import MarkovConvK0B
/-! Machine-authored 94b1de05. Backwards fourth-slice algebra. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 32000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def backPart1_2M94 (c r : ℤ) : ℤ :=
 384*r + -96*c

def backPart1_3M94 (c r : ℤ) : ℤ :=
 -3072*r + 128*r^2 + 256*r^4 + 768*c

def backPart1_4M94 (c r : ℤ) : ℤ :=
 9600*r + -2816*r^2 + -4608*r^3 + -1024*r^4 + -2592*c + 512*c*r + 768*c*r^2 + 1024*c*r^3

def backPart1_5M94 (c r : ℤ) : ℤ :=
 -7680*r + 30336*r^2 + 15360*r^3 + 1536*r^4 + 3072*c + -9984*c*r + -13824*c*r^2 + -3072*c*r^3 + 576*c^2 + 1536*c^2*r + 1536*c^2*r^2

def backPart1_6M94 (c r : ℤ) : ℤ :=
 -29568*r + -68096*r^2 + -18432*r^3 + -1024*r^4 + 6240*c + 48128*c*r + 29184*c*r^2 + 3072*c*r^3 + -6144*c^2 + -12288*c^2*r + -3072*c^2*r^2 + 768*c^3 + 1024*c^3*r

def backPart1_7M94 (c r : ℤ) : ℤ :=
 55296*r + 57728*r^2 + 9216*r^3 + 256*r^4 + -17664*c + -59392*c*r + -19968*c*r^2 + -1024*c*r^3 + 13952*c^2 + 13824*c^2*r + 1536*c^2*r^2 + -3072*c^3 + -1024*c^3*r + 256*c^4

def backPart1_8M94 (c r : ℤ) : ℤ :=
 -29568*r + -19200*r^2 + -1536*r^3 + 10272*c + 23040*c*r + 3840*c*r^2 + -6144*c^2 + -3072*c^2*r + 768*c^3

def backPart1_9M94 (c r : ℤ) : ℤ :=
 4608*r + 1920*r^2 + -1536*c + -2304*c*r + 576*c^2

def backPoly1M94 (c r : ℤ) : ℤ[X] :=
 Polynomial.C (backPart1_2M94 c r)*X^2 + Polynomial.C (backPart1_3M94 c r)*X^3 + Polynomial.C (backPart1_4M94 c r)*X^4 + Polynomial.C (backPart1_5M94 c r)*X^5 + Polynomial.C (backPart1_6M94 c r)*X^6 + Polynomial.C (backPart1_7M94 c r)*X^7 + Polynomial.C (backPart1_8M94 c r)*X^8 + Polynomial.C (backPart1_9M94 c r)*X^9

def backShape1M94 (c r e : ℤ) : ℤ :=
 -4838400*r + -22885632*r*e + -20170752*r*e^2 + -7257600*r*e^3 + -1236480*r*e^4 + -96768*r*e^5 + -2688*r*e^6 + 97453440*r^2 + 104498688*r^2*e + 42336000*r^2*e^2 + 8090880*r^2*e^3 + 725760*r^2*e^4 + 24192*r^2*e^5 + -43545600*r^3 + -31691520*r^3*e + -8426880*r^3*e^2 + -967680*r^3*e^3 + -40320*r^3*e^4 + 2822400*r^4 + 1438080*r^4*e + 241920*r^4*e^2 + 13440*r^4*e^3 + 2903040*c + 7140096*c*e + 4666368*c*e^2 + 1134336*c*e^3 + 53760*c*e^4 + -18816*c*e^5 + -2688*c*e^6 + -96*c*e^7 + 8709120*c*r + 31632384*c*r*e + 27000512*c*r*e^2 + 9905280*c*r*e^3 + 1783040*c*r*e^4 + 153216*c*r*e^5 + 4928*c*r*e^6 + -60480000*c*r^2 + -66326400*c*r^2*e + -27881280*c*r^2*e^2 + -5624640*c*r^2*e^3 + -544320*c*r^2*e^4 + -20160*c*r^2*e^5 + 11289600*c*r^3 + 8574720*c*r^3*e + 2405760*c*r^3*e^2 + 295680*c*r^3*e^3 + 13440*c*r^3*e^4 + -4556160*c^2 + -6802272*c^2*e + -3172288*c^2*e^2 + -340816*c^2*e^3 + 143360*c^2*e^4 + 46592*c^2*e^5 + 4928*c^2*e^6 + 176*c^2*e^7 + -9192960*c^2*r + -18893952*c^2*r*e + -13659072*c^2*r*e^2 + -4737600*c^2*r*e^3 + -853440*c^2*r*e^4 + -76608*c^2*r*e^5 + -2688*c^2*r*e^6 + 10160640*c^2*r^2 + 11104128*c^2*r^2*e + 4737600*c^2*r^2*e^2 + 987840*c^2*r^2*e^3 + 100800*c^2*r^2*e^4 + 4032*c^2*r^2*e^5 + 967680*c^3 + 850176*c^3*e + -91392*c^3*e^2 + -337344*c^3*e^3 + -147840*c^3*e^4 + -28896*c^3*e^5 + -2688*c^3*e^6 + -96*c^3*e^7 + 2257920*c^3*r + 3596544*c^3*r*e + 2286592*c^3*r*e^2 + 745920*c^3*r*e^3 + 132160*c^3*r*e^4 + 12096*c^3*r*e^5 + 448*c^3*r*e^6 + 80640*c^4 + 209088*c^4*e + 210112*c^4*e^2 + 108304*c^4*e^3 + 31360*c^4*e^4 + 5152*c^4*e^5 + 448*c^4*e^6 + 16*c^4*e^7

theorem back_reflect1M94 (c r : ℤ) :
 reflect 15 ((1-X)^8*tailPoly1M06 (c:ℤ[X]) r X+tailRem1M06 (c:ℤ[X]) r X)=
 backPoly1M94 c r := by
 have he : (1-X)^8*tailPoly1M06 (c:ℤ[X]) r X+tailRem1M06 (c:ℤ[X]) r X=
  Polynomial.C (backPart1_2M94 c r)*X^13 + Polynomial.C (backPart1_3M94 c r)*X^12 + Polynomial.C (backPart1_4M94 c r)*X^11 + Polynomial.C (backPart1_5M94 c r)*X^10 + Polynomial.C (backPart1_6M94 c r)*X^9 + Polynomial.C (backPart1_7M94 c r)*X^8 + Polynomial.C (backPart1_8M94 c r)*X^7 + Polynomial.C (backPart1_9M94 c r)*X^6 := by
  simp only [tailPoly1M06,tailRem1M06,tailV10M06,tailV11M06,tailV12M06,tailV13M06,tailV14M06,tailV15M06,tailV16M06,tailV17M06,backPart1_9M94,backPart1_8M94,backPart1_7M94,backPart1_6M94,backPart1_5M94,backPart1_4M94,backPart1_3M94,backPart1_2M94,
   map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]
  rw [show Polynomial.C c=(c:ℤ[X]) from Polynomial.C_eq_intCast c,
    show Polynomial.C r=(r:ℤ[X]) from Polynomial.C_eq_intCast r]
  ring
 rw [he]
 simp only [reflect_add,reflect_C_mul_X_pow]
 norm_num [revAt,backPoly1M94]

theorem back_falling1M94 (c r e : ℤ) :
 16*backShape1M94 c r e=
 backPart1_2M94 c r*fallingSevenK0B (e+14-2) + backPart1_3M94 c r*fallingSevenK0B (e+14-3) + backPart1_4M94 c r*fallingSevenK0B (e+14-4) + backPart1_5M94 c r*fallingSevenK0B (e+14-5) + backPart1_6M94 c r*fallingSevenK0B (e+14-6) + backPart1_7M94 c r*fallingSevenK0B (e+14-7) + backPart1_8M94 c r*fallingSevenK0B (e+14-8) + backPart1_9M94 c r*fallingSevenK0B (e+14-9) := by
 unfold backShape1M94 fallingSevenK0B backPart1_9M94 backPart1_8M94 backPart1_7M94 backPart1_6M94 backPart1_5M94 backPart1_4M94 backPart1_3M94 backPart1_2M94
 ring

theorem back_convolution1M94 (c r : ℤ) (j : ℕ) (hj : 3≤j) :
 315*convSevenK0B (backPoly1M94 c r) j=backShape1M94 c r ((j:ℤ)-7) := by
 unfold backPoly1M94
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 have hs := back_falling1M94 c r ((j:ℤ)-7)
 have h2 := chooseShiftSeven_fallingK0B j 2 (by omega)
 norm_num only [Nat.cast_ofNat] at h2
 have h3 := chooseShiftSeven_fallingK0B j 3 (by omega)
 norm_num only [Nat.cast_ofNat] at h3
 have h4 := chooseShiftSeven_fallingK0B j 4 (by omega)
 norm_num only [Nat.cast_ofNat] at h4
 have h5 := chooseShiftSeven_fallingK0B j 5 (by omega)
 norm_num only [Nat.cast_ofNat] at h5
 have h6 := chooseShiftSeven_fallingK0B j 6 (by omega)
 norm_num only [Nat.cast_ofNat] at h6
 have h7 := chooseShiftSeven_fallingK0B j 7 (by omega)
 norm_num only [Nat.cast_ofNat] at h7
 have h8 := chooseShiftSeven_fallingK0B j 8 (by omega)
 norm_num only [Nat.cast_ofNat] at h8
 have h9 := chooseShiftSeven_fallingK0B j 9 (by omega)
 norm_num only [Nat.cast_ofNat] at h9
 have he : (j:ℤ)-7+14=(j:ℤ)+7 := by ring
 rw [he] at hs
 rw [←h2,←h3,←h4,←h5,←h6,←h7,←h8,←h9] at hs
 nlinarith only [hs]
end
end MathGKM.Markov
