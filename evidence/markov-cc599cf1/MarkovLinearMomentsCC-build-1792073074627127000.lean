import MarkovThirdLinearCC
import MarkovFourLinearCC
/-! Machine-authored cc599cf1. Shift-linear moment identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem fourMoment_threeCC {A : Type*} [CommRing A]
 (f : Bool → Bool → Bool → A) (c r : ℕ) :
 fourMomentBE (fun p q r _ => f p q r) c r=
 boolMomentADB2 f c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE
   fourCanonicalBE fourPotentialBE <;> ring

def linearThirdMomentCC {A : Type*} [CommRing A] (N Z C R x : A) : A :=
 2*R + 18*R*x + 60*R*x^2 + 92*R*x^3 + 48*R*x^4 + -48*R*x^5 + -92*R*x^6 + -60*R*x^7 + -18*R*x^8 + -2*R*x^9 + 2*C + -24*C*x + -132*C*x^2 + -400*C*x^3 + -744*C*x^4 + -792*C*x^5 + -492*C*x^6 + -192*C*x^7 + -42*C*x^8 + -240*Z*R*x^2 + 216*Z*R*x^3 + 408*Z*R*x^4 + -336*Z*R*x^5 + 120*Z*R*x^7 + -168*Z*R*x^8 + 240*Z*C*x^2 + 288*Z*C*x^3 + 360*Z*C*x^4 + 672*Z*C*x^5 + 288*Z*C*x^6 + 72*Z*C*x^8 + 2*N*C + 18*N*C*x + 60*N*C*x^2 + 92*N*C*x^3 + 48*N*C*x^4 + -48*N*C*x^5 + -92*N*C*x^6 + -60*N*C*x^7 + -18*N*C*x^8 + -2*N*C*x^9 + -216*N*Z*R*x^2 + -72*N*Z*R*x^3 + 552*N*Z*R*x^4 + 120*N*Z*R*x^5 + -456*N*Z*R*x^6 + -24*N*Z*R*x^7 + 120*N*Z*R*x^8 + -24*N*Z*R*x^9 + 216*N*Z*C*x^2 + 384*N*Z*C*x^3 + 24*N*Z*C*x^4 + -192*N*Z*C*x^5 + -120*N*Z*C*x^6 + -192*N*Z*C*x^7 + -120*N*Z*C*x^8 + -48*N^2*Z*R*x^2 + -48*N^2*Z*R*x^3 + 144*N^2*Z*R*x^4 + 144*N^2*Z*R*x^5 + -144*N^2*Z*R*x^6 + -144*N^2*Z*R*x^7 + 48*N^2*Z*R*x^8 + 48*N^2*Z*R*x^9 + 48*N^2*Z*C*x^2 + 96*N^2*Z*C*x^3 + -48*N^2*Z*C*x^4 + -192*N^2*Z*C*x^5 + -48*N^2*Z*C*x^6 + 96*N^2*Z*C*x^7 + 48*N^2*Z*C*x^8

theorem linearThird_momentCC {A : Type*} [CommRing A] (N Z x c r q t u : A) :
 boolMomentADB2 (linearThirdCC N Z x) c r q t u=linearThirdMomentCC N Z c r x := by
 unfold boolMomentADB2 boolJetADB2 linearThirdCC linearThirdMomentCC
 ring

theorem thirdMoment_linearCC {A : Type*} [CommRing A] (N Z x c r q t u : A) (hz : Z^2=0) :
 boolMomentADB2 (localThirdNumBC N Z x) c r q t u=linearThirdMomentCC N Z c r x := by
 have he : localThirdNumBC N Z x=linearThirdCC N Z x := by
   funext p q r; exact localThird_linearCC N Z x p q r hz
 rw [he,linearThird_momentCC]

def linearFourMomentCC {A : Type*} [CommRing A] (N Z C R x : A) : A :=
 -6*R + -96*R*x + -552*R*x^2 + -1632*R*x^3 + -2718*R*x^4 + -2304*R*x^5 + 2304*R*x^7 + 2718*R*x^8 + 1632*R*x^9 + 552*R*x^10 + 96*R*x^11 + 6*R*x^12 + -6*C + 120*C*x + 1068*C*x^2 + 5256*C*x^3 + 15372*C*x^4 + 28320*C*x^5 + 35280*C*x^6 + 30624*C*x^7 + 18090*C*x^8 + 6888*C*x^9 + 1620*C*x^10 + 216*C*x^11 + 1920*Z*R*x^2 + -1344*Z*R*x^3 + -3840*Z*R*x^4 + 1536*Z*R*x^5 + -4608*Z*R*x^6 + -4224*Z*R*x^7 + 6912*Z*R*x^8 + 3072*Z*R*x^9 + -384*Z*R*x^10 + 960*Z*R*x^11 + -1920*Z*C*x^2 + -4032*Z*C*x^3 + -9984*Z*C*x^4 + -20928*Z*C*x^5 + -20352*Z*C*x^6 + -14016*Z*C*x^7 + -10752*Z*C*x^8 + -3648*Z*C*x^9 + -384*Z*C*x^11 + -6*N*C + -96*N*C*x + -552*N*C*x^2 + -1632*N*C*x^3 + -2718*N*C*x^4 + -2304*N*C*x^5 + 2304*N*C*x^7 + 2718*N*C*x^8 + 1632*N*C*x^9 + 552*N*C*x^10 + 96*N*C*x^11 + 6*N*C*x^12 + 2368*N*Z*R*x^2 + 1856*N*Z*R*x^3 + -5568*N*Z*R*x^4 + -2816*N*Z*R*x^5 + 3968*N*Z*R*x^6 + -1152*N*Z*R*x^7 + -640*N*Z*R*x^8 + 3328*N*Z*R*x^9 + -192*N*Z*R*x^10 + -1216*N*Z*R*x^11 + 64*N*Z*R*x^12 + -2368*N*Z*C*x^2 + -6528*N*Z*C*x^3 + -7872*N*Z*C*x^4 + -8128*N*Z*C*x^5 + -2880*N*Z*C*x^6 + 9024*N*Z*C*x^7 + 11200*N*Z*C*x^8 + 4800*N*Z*C*x^9 + 1920*N*Z*C*x^10 + 832*N*Z*C*x^11 + 960*N^2*Z*R*x^2 + 1536*N^2*Z*R*x^3 + -2496*N^2*Z*R*x^4 + -4608*N^2*Z*R*x^5 + 1920*N^2*Z*R*x^6 + 4608*N^2*Z*R*x^7 + -384*N^2*Z*R*x^8 + -1536*N^2*Z*R*x^9 + 192*N^2*Z*R*x^10 + -192*N^2*Z*R*x^12 + -960*N^2*Z*C*x^2 + -2880*N^2*Z*C*x^3 + -1536*N^2*Z*C*x^4 + 3072*N^2*Z*C*x^5 + 4224*N^2*Z*C*x^6 + 1920*N^2*Z*C*x^7 + -1536*N^2*Z*C*x^9 + -1728*N^2*Z*C*x^10 + -576*N^2*Z*C*x^11 + 128*N^3*Z*R*x^2 + 256*N^3*Z*R*x^3 + -384*N^3*Z*R*x^4 + -1024*N^3*Z*R*x^5 + 256*N^3*Z*R*x^6 + 1536*N^3*Z*R*x^7 + 256*N^3*Z*R*x^8 + -1024*N^3*Z*R*x^9 + -384*N^3*Z*R*x^10 + 256*N^3*Z*R*x^11 + 128*N^3*Z*R*x^12 + -128*N^3*Z*C*x^2 + -384*N^3*Z*C*x^3 + 1024*N^3*Z*C*x^5 + 768*N^3*Z*C*x^6 + -768*N^3*Z*C*x^7 + -1024*N^3*Z*C*x^8 + 384*N^3*Z*C*x^10 + 128*N^3*Z*C*x^11

theorem linearFour_momentCC {A : Type*} [CommRing A] (N Z x c r q t u : A) :
 boolMomentADB2 (linearFourCC N Z x) c r q t u=linearFourMomentCC N Z c r x := by
 unfold boolMomentADB2 boolJetADB2 linearFourCC linearFourMomentCC
 ring

theorem fourthMoment_linearCC {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) (hz : Z^2=0) :
 fourMomentBE (localFourNumBC N Z x) c r=linearFourMomentCC N Z c r x := by
 have he : localFourNumBC N Z x=(fun p q r _ => linearFourCC N Z x p q r) := by
   funext p q r s; exact localFour_linearCC N Z x p q r s hz
 rw [he,fourMoment_threeCC,linearFour_momentCC]
end
end MathGKM.Markov
