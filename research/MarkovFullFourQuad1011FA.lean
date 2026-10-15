import MarkovFullLocalsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFourQuad1011FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 Z^4*((x^6*(96) + x^7*(-768) + x^8*(2688) + x^9*(-5376) + x^10*(6720) + x^11*(-5376) + x^12*(2688) + x^13*(-768) + x^14*(96)))

theorem fullFourQuad1011FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 fourQuadBE (localFourNumBC N Z x) true false true true=fullFourQuad1011FA N Z x := by
 rw [fullFour_eqFA]
 simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,fullFourFA,fullFour0000FA,fullFour0001FA,fullFour0010FA,fullFour0011FA,fullFour0100FA,fullFour0101FA,fullFour0110FA,fullFour0111FA,fullFour1000FA,fullFour1001FA,fullFour1010FA,fullFour1011FA,fullFour1100FA,fullFour1101FA,fullFour1110FA,fullFour1111FA,fullFourQuad1011FA]
 ring
end
end MathGKM.Markov
