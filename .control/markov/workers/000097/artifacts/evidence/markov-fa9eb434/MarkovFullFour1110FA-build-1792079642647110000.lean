import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour1110FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-12) + x*(24) + x^2*(516) + x^3*(3624) + x^4*(12654) + x^5*(26016) + x^6*(35280) + x^7*(32928) + x^8*(20808) + x^9*(8520) + x^10*(2172) + x^11*(312) + x^12*(6)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x^3*(-5376) + x^4*(-13824) + x^5*(-19392) + x^6*(-24960) + x^7*(-18240) + x^8*(-3840) + x^9*(-576) + x^10*(-384) + x^11*(576)) + N*(x^3*(-4672) + x^4*(-13440) + x^5*(-10944) + x^6*(1088) + x^7*(7872) + x^8*(10560) + x^9*(8128) + x^10*(1728) + x^11*(-384) + x^12*(64)) + N^2*(x^3*(-1344) + x^4*(-4032) + x^5*(-1536) + x^6*(6144) + x^7*(6528) + x^8*(-384) + x^9*(-3072) + x^10*(-1536) + x^11*(-576) + x^12*(-192)) + N^3*(x^3*(-128) + x^4*(-384) + x^6*(1024) + x^7*(768) + x^8*(-768) + x^9*(-1024) + x^11*(384) + x^12*(128))) + Z^2*((x^5*(5328) + x^6*(-23136) + x^7*(-30240) + x^8*(12576) + x^10*(-11040) + x^11*(3360) + x^12*(96) + x^13*(48)) + N*(x^5*(4032) + x^6*(-12288) + x^7*(-29568) + x^8*(12288) + x^9*(32256) + x^10*(-3072) + x^11*(-7296) + x^12*(3072) + x^13*(576)) + N^2*(x^5*(768) + x^6*(-1536) + x^7*(-6144) + x^8*(1536) + x^9*(10752) + x^10*(1536) + x^11*(-6144) + x^12*(-1536) + x^13*(768))) + Z^3*((x^6*(-288) + x^8*(15552) + x^9*(-34944) + x^10*(-11520) + x^11*(29952) + x^12*(-10176) + x^13*(-1152) + x^14*(288)) + N*(x^6*(-192) + x^7*(192) + x^8*(5568) + x^9*(-9024) + x^10*(-13248) + x^11*(14400) + x^12*(7488) + x^13*(-5568) + x^14*(384))) + Z^4*((x^8*(-96) + x^9*(192) + x^10*(-1248) + x^11*(9600) + x^12*(-18720) + x^13*(10176) + x^14*(-1440)))

theorem fullFour1110FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x true true true false=fullFour1110FA N Z x := by
 simp only [localFourNumBC,fullFour1110FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
