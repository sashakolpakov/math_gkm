import MarkovThirdCubicF2
import MarkovFourCubicF2
/-! Machine-authored request f2da221d. Cyclic cancellation at cubic order. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384

theorem thirdMoment_cubicF2 {A : Type*} [CommRing A]
    (N Z x c r q t u : A) (hx : x^3=0) :
    boolMomentADB2 (localThirdNumBC N Z x) c r q t u =
    c*cubicThirdF2 N Z x false false+
      r*(cubicThirdF2 N Z x true true-cubicThirdF2 N Z x false false) := by
  have he : localThirdNumBC N Z x=(fun p q _ => cubicThirdF2 N Z x p q) := by
    funext p q r; exact localThird_cubicF2 N Z x p q r hx
  rw [he]
  unfold boolMomentADB2 boolJetADB2 cubicThirdF2
  ring

theorem fourMoment_cubicF2 {A : Type*} [CommRing A]
    (N Z x : A) (c r : ℕ) (hx : x^3=0) :
    fourMomentBE (localFourNumBC N Z x) c r =
    (c:A)*cubicFourF2 N Z x false false+
      (r:A)*(cubicFourF2 N Z x true true-cubicFourF2 N Z x false false) := by
  have he : localFourNumBC N Z x=(fun p q _ _ => cubicFourF2 N Z x p q) := by
    funext p q r s; exact localFour_cubicF2 N Z x p q r s hx
  rw [he]
  unfold fourMomentBE fourSourceMoment897
  split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE
    fourCanonicalBE fourPotentialBE cubicFourF2 <;> ring

def shiftCorrectionF2 {A : Type*} [CommRing A] (N c r : A) : A :=
  16*(c-r)*(N*c+r+c-2*N-5)*(N*c+r+c-2*N-6)*(N*c+r+c-2*N-7)

end
end MathGKM.Markov
