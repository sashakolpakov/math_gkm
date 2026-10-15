import MarkovThirdZeroK0B
import MarkovFourZeroK0B
/-! Machine-authored request 0b212317. Degenerate moment formulas in any commutative ring. -/
namespace MathGKM.Markov
noncomputable section
variable {A : Type*} [CommRing A]

theorem boolMoment_secondK0B (f : Bool → A) (c r q t u : A) :
    boolMomentADB2 (fun _ b _ => f b) c r q t u =
    c*f false+r*(f true-f false) := by
  unfold boolMomentADB2 boolJetADB2
  ring

theorem fourMoment_secondK0B (f : Bool → A) (c r : ℕ) :
    fourMomentBE (fun _ b _ _ => f b) c r =
    (c:A)*f false+(r:A)*(f true-f false) := by
  unfold fourMomentBE fourSourceMoment897
  split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE
    fourCanonicalBE fourPotentialBE <;> ring

theorem thirdMoment_zeroK0B (N x : A) (c r q t u : A) :
    boolMomentADB2 (localThirdNumBC N 0 x) c r q t u =
    c*zeroThird0K0B N x+r*(zeroThird1K0B N x-zeroThird0K0B N x) := by
  have he : localThirdNumBC N 0 x =
      (fun _ q _ => if q then zeroThird1K0B N x else zeroThird0K0B N x) := by
    funext p q r
    exact localThird_zeroK0B N x p q r
  rw [he, boolMoment_secondK0B]

theorem fourMoment_zeroK0B (N x : A) (c r : ℕ) :
    fourMomentBE (localFourNumBC N 0 x) c r =
    (c:A)*zeroFour0K0B N x+(r:A)*(zeroFour1K0B N x-zeroFour0K0B N x) := by
  have he : localFourNumBC N 0 x =
      (fun _ q _ _ => if q then zeroFour1K0B N x else zeroFour0K0B N x) := by
    funext p q r s
    exact localFour_zeroK0B N x p q r s
  rw [he, fourMoment_secondK0B]

end
end MathGKM.Markov
