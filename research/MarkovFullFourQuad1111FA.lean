import MarkovFullLocalsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFourQuad1111FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 Z^4*((x^7*(96) + x^8*(-768) + x^9*(2688) + x^10*(-5376) + x^11*(6720) + x^12*(-5376) + x^13*(2688) + x^14*(-768) + x^15*(96)))

theorem fullFourQuad1111FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 fourQuadBE (localFourNumBC N Z x) true true true true=fullFourQuad1111FA N Z x := by
 rw [fullFour_eqFA]
 simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,fullFourFA,fullFour0000FA,fullFour0001FA,fullFour0010FA,fullFour0011FA,fullFour0100FA,fullFour0101FA,fullFour0110FA,fullFour0111FA,fullFour1000FA,fullFour1001FA,fullFour1010FA,fullFour1011FA,fullFour1100FA,fullFour1101FA,fullFour1110FA,fullFour1111FA,fullFourQuad1111FA]
 ring
end
end MathGKM.Markov
