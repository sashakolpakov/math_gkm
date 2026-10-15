import MarkovFullLocalsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullThirdMomentFA {A : Type*} [CommRing A] (N Z C R Q T U x : A) : A :=
 (((2*R + 2*C) + x*(18*R + -24*C) + x^2*(60*R + -132*C) + x^3*(92*R + -400*C) + x^4*(48*R + -744*C) + x^5*(-48*R + -792*C) + x^6*(-92*R + -492*C) + x^7*(-60*R + -192*C) + x^8*(-18*R + -42*C) + x^9*(-2*R)) + N*((2*C) + x*(18*C) + x^2*(60*C) + x^3*(92*C) + x^4*(48*C) + x^5*(-48*C) + x^6*(-92*C) + x^7*(-60*C) + x^8*(-18*C) + x^9*(-2*C))) + Z*((x^2*(-240*R + 240*C) + x^3*(216*R + 288*C) + x^4*(408*R + 360*C) + x^5*(-336*R + 672*C) + x^6*(288*C) + x^7*(120*R) + x^8*(-168*R + 72*C)) + N*(x^2*(-216*R + 216*C) + x^3*(-72*R + 384*C) + x^4*(552*R + 24*C) + x^5*(120*R + -192*C) + x^6*(-456*R + -120*C) + x^7*(-24*R + -192*C) + x^8*(120*R + -120*C) + x^9*(-24*R)) + N^2*(x^2*(-48*R + 48*C) + x^3*(-48*R + 96*C) + x^4*(144*R + -48*C) + x^5*(144*R + -192*C) + x^6*(-144*R + -48*C) + x^7*(-144*R + 96*C) + x^8*(48*R + 48*C) + x^9*(48*R))) + Z^2*((x^3*(-144*Q + 288*R + -144*C) + x^4*(720*Q + -1440*R + 720*C) + x^5*(-1104*Q + 768*R + 96*C) + x^6*(144*Q + 1152*R + -288*C) + x^7*(1104*Q + -1056*R + 432*C) + x^8*(-912*Q + 288*R + -48*C) + x^9*(144*Q) + x^10*(48*Q)) + N*(x^3*(-96*Q + 192*R + -96*C) + x^4*(288*Q + -576*R + 288*C) + x^5*(-96*Q + -384*R + 384*C) + x^6*(-480*Q + 1152*R + -384*C) + x^7*(480*Q + 192*R + -288*C) + x^8*(96*Q + -576*R + 96*C) + x^9*(-288*Q) + x^10*(96*Q))) + Z^3*((x^4*(24*T + 48*Q + -72*R + 24*C) + x^5*(24*U + -144*T + -480*Q + 744*R + -288*C) + x^6*(-144*U + 360*T + 1296*Q + -1808*R + 656*C) + x^7*(360*U + -480*T + -1344*Q + 1296*R + -288*C) + x^8*(-480*U + 360*T + 336*Q + -168*R + 24*C) + x^9*(360*U + -144*T + 288*Q + 8*R) + x^10*(-144*U + 24*T + -144*Q) + x^11*(24*U)))

theorem fullThirdMomentFA_eq {A : Type*} [CommRing A] (N Z C R Q T U x : A) :
 boolMomentADB2 (localThirdNumBC N Z x) C R Q T U=fullThirdMomentFA N Z C R Q T U x := by
 rw [fullThird_eqFA]
 simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,fullThirdFA,fullThird000FA,fullThird001FA,fullThird010FA,fullThird011FA,fullThird100FA,fullThird101FA,fullThird110FA,fullThird111FA,fullThirdMomentFA]
 ring
end
end MathGKM.Markov
