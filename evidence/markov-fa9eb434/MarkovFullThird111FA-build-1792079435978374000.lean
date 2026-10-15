import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullThird111FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((4) + x*(-6) + x^2*(-72) + x^3*(-308) + x^4*(-696) + x^5*(-840) + x^6*(-584) + x^7*(-252) + x^8*(-60) + x^9*(-2)) + N*((2) + x*(18) + x^2*(60) + x^3*(92) + x^4*(48) + x^5*(-48) + x^6*(-92) + x^7*(-60) + x^8*(-18) + x^9*(-2))) + Z*((x^3*(504) + x^4*(768) + x^5*(336) + x^6*(288) + x^7*(120) + x^8*(-96)) + N*(x^3*(312) + x^4*(576) + x^5*(-72) + x^6*(-576) + x^7*(-216) + x^9*(-24)) + N^2*(x^3*(48) + x^4*(96) + x^5*(-48) + x^6*(-192) + x^7*(-48) + x^8*(96) + x^9*(48))) + Z^2*((x^5*(-240) + x^6*(1008) + x^7*(480) + x^8*(-672) + x^9*(144) + x^10*(48)) + N*(x^5*(-96) + x^6*(288) + x^7*(384) + x^8*(-384) + x^9*(-288) + x^10*(96))) + Z^3*((x^7*(24) + x^8*(-288) + x^9*(656) + x^10*(-288) + x^11*(24)))

theorem fullThird111FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localThirdNumBC N Z x true true true=fullThird111FA N Z x := by
 simp only [localThirdNumBC,fullThird111FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
