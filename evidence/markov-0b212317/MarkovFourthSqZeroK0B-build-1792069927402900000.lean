import MarkovThirdTinyK0B
import MarkovFourTinyK0B
/-! Machine-authored request 0b212317. Local square-zero coefficient reductions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

theorem thirdMoment_tinyK0B {A : Type*} [CommRing A] (N Z x c r q t u : A) (hx : x^2=0) :
 boolMomentADB2 (localThirdNumBC N Z x) c r q t u=
 boolMomentADB2 (localThirdNumBC N 0 x) c r q t u := by
 have he (Z : A) : localThirdNumBC N Z x=(fun p q _ => tinyThirdK0B N Z x p q) := by
   funext p q r; exact localThird_tinyK0B N Z x p q r hx
 rw [he Z,he 0]
 unfold boolMomentADB2 boolJetADB2 tinyThirdK0B
 ring

theorem fourMoment_tinyK0B {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) (hx : x^2=0) :
 fourMomentBE (localFourNumBC N Z x) c r=
 fourMomentBE (localFourNumBC N 0 x) c r := by
 have he (Z : A) : localFourNumBC N Z x=(fun p q _ _ => tinyFourK0B N Z x p q) := by
   funext p q r s; exact localFour_tinyK0B N Z x p q r s hx
 rw [he Z,he 0]
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE fourCanonicalBE fourPotentialBE tinyFourK0B <;> ring

theorem fourthNumerator_sqzeroK0B {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hx : x^2=0) :
 fourthNumeratorBC N Z x c r=fourthNumeratorBC N 0 x c r := by
 have hx3 : x^3=0 := by rw [show 3=2+1 by omega,pow_add,hx,zero_mul]
 have hx4 : x^4=0 := by rw [show 4=2+2 by omega,pow_add,hx,zero_mul]
 have hx5 : x^5=0 := by rw [show 5=2+3 by omega,pow_add,hx,zero_mul]
 have hx6 : x^6=0 := by rw [show 6=2+4 by omega,pow_add,hx,zero_mul]
 have hx7 : x^7=0 := by rw [show 7=2+5 by omega,pow_add,hx,zero_mul]
 have hx8 : x^8=0 := by rw [show 8=2+6 by omega,pow_add,hx,zero_mul]
 have hx9 : x^9=0 := by rw [show 9=2+7 by omega,pow_add,hx,zero_mul]
 have hx10 : x^10=0 := by rw [show 10=2+8 by omega,pow_add,hx,zero_mul]
 have hx11 : x^11=0 := by rw [show 11=2+9 by omega,pow_add,hx,zero_mul]
 have hx12 : x^12=0 := by rw [show 12=2+10 by omega,pow_add,hx,zero_mul]
 have hx13 : x^13=0 := by rw [show 13=2+11 by omega,pow_add,hx,zero_mul]
 have hx14 : x^14=0 := by rw [show 14=2+12 by omega,pow_add,hx,zero_mul]

 have hf : firstNumBC N Z (c:A) r (2*r-c:ℕ) x=firstNumBC N 0 c r (2*r-c:ℕ) x := by
   simp only [firstNumBC,hx,hx3,mul_zero,zero_mul,add_zero,zero_add]
 have hs : secondNumBC N Z (c:A) r (2*r-c:ℕ) x=secondNumBC N 0 c r (2*r-c:ℕ) x := by
   simp only [secondNumBC,hx,hx3,hx4,hx5,hx6,hx7,mul_zero,zero_mul,add_zero,zero_add]
 unfold fourthNumeratorBC
 dsimp only
 rw [hf,hs,thirdMoment_tinyK0B N Z x _ _ _ _ _ hx,fourMoment_tinyK0B N Z x c r hx]
end
end MathGKM.Markov
