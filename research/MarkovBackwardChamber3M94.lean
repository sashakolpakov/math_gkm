import MarkovTailSource3M06
import MarkovConvK0B
/-! Machine-authored 94b1de05. Backwards fourth-slice algebra. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 32000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def backPart3_1M94 (c r : ℤ) : ℤ :=
 768*r^2 + -768*c*r + 192*c^2

def backPart3_2M94 (c r : ℤ) : ℤ :=
 4224*r + -11136*r^2 + 1536*r^3 + -2400*c + 8832*c*r + -768*c*r^2 + -1536*c^2

def backPart3_3M94 (c r : ℤ) : ℤ :=
 33536*r^2 + -9216*r^3 + 256*r^4 + 768*c + -33024*c*r + 7680*c*r^2 + 7680*c^2 + -1536*c^2*r

def backPart3_4M94 (c r : ℤ) : ℤ :=
 -28032*r + -27776*r^2 + 18432*r^3 + -1024*r^4 + 15072*c + 43904*c*r + -26112*c*r^2 + 1024*c*r^3 + -14592*c^2 + 9216*c^2*r + -768*c^3

def backPart3_5M94 (c r : ℤ) : ℤ :=
 30720*r + -9984*r^2 + -15360*r^3 + 1536*r^4 + -19968*c + -768*c*r + 32256*c*r^2 + -3072*c*r^3 + 5568*c^2 + -19968*c^2*r + 1536*c^2*r^2 + 3072*c^3

def backPart3_6M94 (c r : ℤ) : ℤ :=
 -2688*r + 21376*r^2 + 4608*r^3 + -1024*r^4 + 2400*c + -28288*c*r + -13056*c*r^2 + 3072*c*r^3 + 9216*c^2 + 12288*c^2*r + -3072*c^2*r^2 + -3840*c^3 + 1024*c^3*r

def backPart3_7M94 (c r : ℤ) : ℤ :=
 -6144*r + -7936*r^2 + 256*r^4 + 3840*c + 12032*c*r + -1024*c*r^3 + -4480*c^2 + 1536*c^2*r^2 + -1024*c^3*r + 256*c^4

def backPart3_8M94 (c r : ℤ) : ℤ :=
 1920*r + 1152*r^2 + -1248*c + -1920*c*r + 768*c^2

def backPoly3M94 (c r : ℤ) : ℤ[X] :=
 Polynomial.C (backPart3_1M94 c r)*X^1 + Polynomial.C (backPart3_2M94 c r)*X^2 + Polynomial.C (backPart3_3M94 c r)*X^3 + Polynomial.C (backPart3_4M94 c r)*X^4 + Polynomial.C (backPart3_5M94 c r)*X^5 + Polynomial.C (backPart3_6M94 c r)*X^6 + Polynomial.C (backPart3_7M94 c r)*X^7 + Polynomial.C (backPart3_8M94 c r)*X^8

def backShape3M94 (c r e : ℤ) : ℤ :=
 333849600*r + 149442048*r*e + 8859648*r*e^2 + -5644800*r*e^3 + -1236480*r*e^4 + -96768*r*e^5 + -2688*r*e^6 + 11208960*r^2 + 75468288*r^2*e + 39916800*r^2*e^2 + 8090880*r^2*e^3 + 725760*r^2*e^4 + 24192*r^2*e^5 + -40642560*r^3 + -31207680*r^3*e + -8426880*r^3*e^2 + -967680*r^3*e^3 + -40320*r^3*e^4 + 2822400*r^4 + 1438080*r^4*e + 241920*r^4*e^2 + 13440*r^4*e^3 + -168376320*c + -79386624*c*e + -9848832*c*e^2 + 327936*c*e^3 + 53760*c*e^4 + -18816*c*e^5 + -2688*c*e^6 + -96*c*e^7 + -61205760*c*r + -17598336*c*r*e + 16356032*c*r*e^2 + 9179520*c*r*e^3 + 1783040*c*r*e^4 + 153216*c*r*e^5 + 4928*c*r*e^6 + -47416320*c*r^2 + -61246080*c*r^2*e + -27397440*c*r^2*e^2 + -5624640*c*r^2*e^3 + -544320*c*r^2*e^4 + -20160*c*r^2*e^5 + 11289600*c*r^3 + 8574720*c*r^3*e + 2405760*c*r^3*e^2 + 295680*c*r^3*e^3 + 13440*c*r^3*e^4 + 52295040*c^2 + 25131168*c^2*e + 2754752*c^2*e^2 + 22064*c^2*e^3 + 143360*c^2*e^4 + 46592*c^2*e^5 + 4928*c^2*e^6 + 176*c^2*e^7 + -6773760*c^2*r + -15587712*c^2*r*e + -12691392*c^2*r*e^2 + -4656960*c^2*r*e^3 + -853440*c^2*r*e^4 + -76608*c^2*r*e^5 + -2688*c^2*r*e^6 + 10160640*c^2*r^2 + 11104128*c^2*r^2*e + 4737600*c^2*r^2*e^2 + 987840*c^2*r^2*e^3 + 100800*c^2*r^2*e^4 + 4032*c^2*r^2*e^5 + -3870720*c^3 + -2133504*c^3*e + -696192*c^3*e^2 + -377664*c^3*e^3 + -147840*c^3*e^4 + -28896*c^3*e^5 + -2688*c^3*e^6 + -96*c^3*e^7 + 2257920*c^3*r + 3596544*c^3*r*e + 2286592*c^3*r*e^2 + 745920*c^3*r*e^3 + 132160*c^3*r*e^4 + 12096*c^3*r*e^5 + 448*c^3*r*e^6 + 80640*c^4 + 209088*c^4*e + 210112*c^4*e^2 + 108304*c^4*e^3 + 31360*c^4*e^4 + 5152*c^4*e^5 + 448*c^4*e^6 + 16*c^4*e^7

theorem back_reflect3M94 (c r : ℤ) :
 reflect 15 ((1-X)^8*tailPoly3M06 (c:ℤ[X]) r X+tailRem3M06 (c:ℤ[X]) r X)=
 backPoly3M94 c r := by
 have he : (1-X)^8*tailPoly3M06 (c:ℤ[X]) r X+tailRem3M06 (c:ℤ[X]) r X=
  Polynomial.C (backPart3_1M94 c r)*X^14 + Polynomial.C (backPart3_2M94 c r)*X^13 + Polynomial.C (backPart3_3M94 c r)*X^12 + Polynomial.C (backPart3_4M94 c r)*X^11 + Polynomial.C (backPart3_5M94 c r)*X^10 + Polynomial.C (backPart3_6M94 c r)*X^9 + Polynomial.C (backPart3_7M94 c r)*X^8 + Polynomial.C (backPart3_8M94 c r)*X^7 := by
  simp only [tailPoly3M06,tailRem3M06,tailV30M06,tailV31M06,tailV32M06,tailV33M06,tailV34M06,tailV35M06,tailV36M06,tailV37M06,backPart3_8M94,backPart3_7M94,backPart3_6M94,backPart3_5M94,backPart3_4M94,backPart3_3M94,backPart3_2M94,backPart3_1M94,
   map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]
  rw [show Polynomial.C c=(c:ℤ[X]) from Polynomial.C_eq_intCast c,
    show Polynomial.C r=(r:ℤ[X]) from Polynomial.C_eq_intCast r]
  ring
 rw [he]
 simp only [reflect_add,reflect_C_mul_X_pow]
 norm_num [revAt,backPoly3M94]

theorem back_falling3M94 (c r e : ℤ) :
 16*backShape3M94 c r e=
 backPart3_1M94 c r*fallingSevenK0B (e+14-1) + backPart3_2M94 c r*fallingSevenK0B (e+14-2) + backPart3_3M94 c r*fallingSevenK0B (e+14-3) + backPart3_4M94 c r*fallingSevenK0B (e+14-4) + backPart3_5M94 c r*fallingSevenK0B (e+14-5) + backPart3_6M94 c r*fallingSevenK0B (e+14-6) + backPart3_7M94 c r*fallingSevenK0B (e+14-7) + backPart3_8M94 c r*fallingSevenK0B (e+14-8) := by
 unfold backShape3M94 fallingSevenK0B backPart3_8M94 backPart3_7M94 backPart3_6M94 backPart3_5M94 backPart3_4M94 backPart3_3M94 backPart3_2M94 backPart3_1M94
 ring

theorem back_convolution3M94 (c r : ℤ) (j : ℕ) (hj : 3≤j) :
 315*convSevenK0B (backPoly3M94 c r) j=backShape3M94 c r ((j:ℤ)-7) := by
 unfold backPoly3M94
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 have hs := back_falling3M94 c r ((j:ℤ)-7)
 have h1 := chooseShiftSeven_fallingK0B j 1 (by omega)
 norm_num only [Nat.cast_ofNat] at h1
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
 have he : (j:ℤ)-7+14=(j:ℤ)+7 := by ring
 rw [he] at hs
 rw [←h1,←h2,←h3,←h4,←h5,←h6,←h7,←h8] at hs
 nlinarith only [hs]
end
end MathGKM.Markov
