import MarkovLinearMomentsCC
/-! Machine-authored cc599cf1. Structured first derivative in the shift variable. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def firstShiftCC {A : Type*} [CommRing A] (N C R x : A) : A :=
 -4*R*x^2 + 4*R*x^3 + 4*C*x^2

theorem firstNum_linearCC {A : Type*} [CommRing A] (N Z c r q x : A) (hz : Z^2=0) :
 firstNumBC N Z c r q x=firstNumBC N 0 c r 0 x+Z*firstShiftCC N c r x := by
 simp only [firstNumBC,firstShiftCC,hz,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring

def secondShiftCC {A : Type*} [CommRing A] (N C R x : A) : A :=
 40*R*x^2 + -48*R*x^3 + -32*R*x^4 + 48*R*x^5 + -8*R*x^6 + -8*R^2*x^2 + 16*R^2*x^4 + -8*R^2*x^6 + -40*C*x^2 + -8*C*x^3 + 8*C*x^4 + -24*C*x^5 + 32*C*R*x^3 + -32*C*R*x^5 + 8*C^2*x^2 + -16*C^2*x^3 + -24*C^2*x^4 + 16*N*R*x^2 + -32*N*R*x^4 + 16*N*R*x^6 + -16*N*C*x^2 + -16*N*C*x^3 + 16*N*C*x^4 + 16*N*C*x^5 + -8*N*C*R*x^2 + 16*N*C*R*x^4 + -8*N*C*R*x^6 + 8*N*C^2*x^2 + 8*N*C^2*x^3 + -8*N*C^2*x^4 + -8*N*C^2*x^5

theorem secondNum_linearCC {A : Type*} [CommRing A] (N Z c r q x : A) (hz : Z^2=0) :
 secondNumBC N Z c r q x=secondNumBC N 0 c r 0 x+Z*secondShiftCC N c r x := by
 simp only [secondNumBC,secondShiftCC,hz,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring

def thirdShiftCC {A : Type*} [CommRing A] (N C R x : A) : A :=
 -240*R*x^2 + 216*R*x^3 + 408*R*x^4 + -336*R*x^5 + 120*R*x^7 + -168*R*x^8 + 240*C*x^2 + 288*C*x^3 + 360*C*x^4 + 672*C*x^5 + 288*C*x^6 + 72*C*x^8 + -216*N*R*x^2 + -72*N*R*x^3 + 552*N*R*x^4 + 120*N*R*x^5 + -456*N*R*x^6 + -24*N*R*x^7 + 120*N*R*x^8 + -24*N*R*x^9 + 216*N*C*x^2 + 384*N*C*x^3 + 24*N*C*x^4 + -192*N*C*x^5 + -120*N*C*x^6 + -192*N*C*x^7 + -120*N*C*x^8 + -48*N^2*R*x^2 + -48*N^2*R*x^3 + 144*N^2*R*x^4 + 144*N^2*R*x^5 + -144*N^2*R*x^6 + -144*N^2*R*x^7 + 48*N^2*R*x^8 + 48*N^2*R*x^9 + 48*N^2*C*x^2 + 96*N^2*C*x^3 + -48*N^2*C*x^4 + -192*N^2*C*x^5 + -48*N^2*C*x^6 + 96*N^2*C*x^7 + 48*N^2*C*x^8

theorem linearThird_splitCC {A : Type*} [CommRing A] (N Z c r x : A) :
 linearThirdMomentCC N Z c r x=linearThirdMomentCC N 0 c r x+Z*thirdShiftCC N c r x := by
 simp only [linearThirdMomentCC,thirdShiftCC,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring

def fourShiftCC {A : Type*} [CommRing A] (N C R x : A) : A :=
 1920*R*x^2 + -1344*R*x^3 + -3840*R*x^4 + 1536*R*x^5 + -4608*R*x^6 + -4224*R*x^7 + 6912*R*x^8 + 3072*R*x^9 + -384*R*x^10 + 960*R*x^11 + -1920*C*x^2 + -4032*C*x^3 + -9984*C*x^4 + -20928*C*x^5 + -20352*C*x^6 + -14016*C*x^7 + -10752*C*x^8 + -3648*C*x^9 + -384*C*x^11 + 2368*N*R*x^2 + 1856*N*R*x^3 + -5568*N*R*x^4 + -2816*N*R*x^5 + 3968*N*R*x^6 + -1152*N*R*x^7 + -640*N*R*x^8 + 3328*N*R*x^9 + -192*N*R*x^10 + -1216*N*R*x^11 + 64*N*R*x^12 + -2368*N*C*x^2 + -6528*N*C*x^3 + -7872*N*C*x^4 + -8128*N*C*x^5 + -2880*N*C*x^6 + 9024*N*C*x^7 + 11200*N*C*x^8 + 4800*N*C*x^9 + 1920*N*C*x^10 + 832*N*C*x^11 + 960*N^2*R*x^2 + 1536*N^2*R*x^3 + -2496*N^2*R*x^4 + -4608*N^2*R*x^5 + 1920*N^2*R*x^6 + 4608*N^2*R*x^7 + -384*N^2*R*x^8 + -1536*N^2*R*x^9 + 192*N^2*R*x^10 + -192*N^2*R*x^12 + -960*N^2*C*x^2 + -2880*N^2*C*x^3 + -1536*N^2*C*x^4 + 3072*N^2*C*x^5 + 4224*N^2*C*x^6 + 1920*N^2*C*x^7 + -1536*N^2*C*x^9 + -1728*N^2*C*x^10 + -576*N^2*C*x^11 + 128*N^3*R*x^2 + 256*N^3*R*x^3 + -384*N^3*R*x^4 + -1024*N^3*R*x^5 + 256*N^3*R*x^6 + 1536*N^3*R*x^7 + 256*N^3*R*x^8 + -1024*N^3*R*x^9 + -384*N^3*R*x^10 + 256*N^3*R*x^11 + 128*N^3*R*x^12 + -128*N^3*C*x^2 + -384*N^3*C*x^3 + 1024*N^3*C*x^5 + 768*N^3*C*x^6 + -768*N^3*C*x^7 + -1024*N^3*C*x^8 + 384*N^3*C*x^10 + 128*N^3*C*x^11

theorem linearFour_splitCC {A : Type*} [CommRing A] (N Z c r x : A) :
 linearFourMomentCC N Z c r x=linearFourMomentCC N 0 c r x+Z*fourShiftCC N c r x := by
 simp only [linearFourMomentCC,fourShiftCC,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring

def fourthShiftCC {A : Type*} [CommRing A] (N c r x : A) : A :=
 fourShiftCC N c r x+
 4*(firstNumBC N 0 c r 0 x*thirdShiftCC N c r x+
    firstShiftCC N c r x*linearThirdMomentCC N 0 c r x)-
 8*firstShiftCC N c r x*(1+x)^3*(1-x)^6+
 6*secondNumBC N 0 c r 0 x*secondShiftCC N c r x-
 8*(firstNumBC N 0 c r 0 x)^3*firstShiftCC N c r x

theorem fourthNumerator_linearCC {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hz : Z^2=0) :
 fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r=
 Z*fourthShiftCC N c r x := by
 have hz3 : Z^3=0 := by rw [show 3=2+1 by omega,pow_add,hz,zero_mul]
 have hz4 : Z^4=0 := by rw [show 4=2+2 by omega,pow_add,hz,zero_mul]
 unfold fourthNumeratorBC
 dsimp only
 rw [thirdMoment_linearCC N Z x _ _ _ _ _ hz,
   thirdMoment_linearCC N 0 x _ _ _ _ _ (by simp),
   fourthMoment_linearCC N Z x c r hz,
   fourthMoment_linearCC N 0 x c r (by simp),
   firstNum_linearCC N Z _ _ _ x hz,secondNum_linearCC N Z _ _ _ x hz,
   firstNum_linearCC N 0 _ _ _ x (by simp),secondNum_linearCC N 0 _ _ _ x (by simp),
   linearThird_splitCC N Z,linearFour_splitCC N Z]
 simp only [zero_mul,add_zero]
 unfold fourthShiftCC
 ring_nf
 simp only [hz,hz3,hz4,mul_zero,zero_mul,add_zero,zero_add,sub_zero]

theorem fourthShift_mapCC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N c r x : A) :
 g (fourthShiftCC N c r x)=fourthShiftCC (g N) (g c) (g r) (g x) := by
 simp only [fourthShiftCC,firstShiftCC,secondShiftCC,thirdShiftCC,fourShiftCC,
   firstNumBC,secondNumBC,linearThirdMomentCC,map_add,map_sub,map_mul,map_pow,
   map_ofNat,map_neg,map_one,map_zero]
end
end MathGKM.Markov
