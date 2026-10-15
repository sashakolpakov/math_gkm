import MarkovFullLocalsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFourQuad1001FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 Z^4*((x^5*(96) + x^6*(-768) + x^7*(2688) + x^8*(-5376) + x^9*(6720) + x^10*(-5376) + x^11*(2688) + x^12*(-768) + x^13*(96)))

theorem fullFourQuad1001FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 fourQuadBE (localFourNumBC N Z x) true false false true=fullFourQuad1001FA N Z x := by
 rw [fullFour_eqFA]
 simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,fullFourFA,fullFour0000FA,fullFour0001FA,fullFour0010FA,fullFour0011FA,fullFour0100FA,fullFour0101FA,fullFour0110FA,fullFour0111FA,fullFour1000FA,fullFour1001FA,fullFour1010FA,fullFour1011FA,fullFour1100FA,fullFour1101FA,fullFour1110FA,fullFour1111FA,fullFourQuad1001FA]
 ring
end
end MathGKM.Markov
