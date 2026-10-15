import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour0101FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-12) + x*(24) + x^2*(516) + x^3*(3624) + x^4*(12654) + x^5*(26016) + x^6*(35280) + x^7*(32928) + x^8*(20808) + x^9*(8520) + x^10*(2172) + x^11*(312) + x^12*(6)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x*(48) + x^2*(-384) + x^3*(-5376) + x^4*(-13200) + x^5*(-19296) + x^6*(-24576) + x^7*(-19008) + x^8*(-4896) + x^9*(432) + x^11*(192) + x^12*(48)) + N*(x^3*(-4768) + x^4*(-13536) + x^5*(-10560) + x^6*(1472) + x^7*(7296) + x^8*(9984) + x^9*(8512) + x^10*(2112) + x^11*(-480) + x^12*(-32)) + N^2*(x^3*(-1344) + x^4*(-4032) + x^5*(-1536) + x^6*(6144) + x^7*(6528) + x^8*(-384) + x^9*(-3072) + x^10*(-1536) + x^11*(-576) + x^12*(-192)) + N^3*(x^3*(-128) + x^4*(-384) + x^6*(1024) + x^7*(768) + x^8*(-768) + x^9*(-1024) + x^11*(384) + x^12*(128))) + Z^2*((x^2*(-144) + x^3*(672) + x^4*(4272) + x^5*(-9408) + x^6*(-19872) + x^7*(-5376) + x^8*(-6048) + x^9*(-8256) + x^10*(48) + x^11*(864) + x^12*(240)) + N*(x^4*(3648) + x^5*(-2688) + x^6*(-20736) + x^7*(-8832) + x^8*(15744) + x^9*(10368) + x^10*(768) + x^11*(1152) + x^12*(576)) + N^2*(x^4*(768) + x^6*(-4608) + x^7*(-3072) + x^8*(6144) + x^9*(6144) + x^10*(-1536) + x^11*(-3072) + x^12*(-768))) + Z^3*((x^3*(192) + x^4*(-768) + x^5*(-1440) + x^6*(10176) + x^7*(-2688) + x^8*(-18624) + x^9*(-192) + x^10*(3648) + x^11*(-2112) + x^12*(-576) + x^13*(96)) + N*(x^5*(-768) + x^6*(2880) + x^7*(2880) + x^8*(-9408) + x^9*(-6336) + x^10*(7104) + x^11*(4032) + x^12*(-576) + x^13*(192))) + Z^4*((x^4*(-96) + x^5*(384) + x^7*(-2400) + x^8*(3648) + x^9*(2784) + x^10*(-6912) + x^11*(864) + x^12*(288) + x^13*(-96)))

theorem fullFour0101FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x false true false true=fullFour0101FA N Z x := by
 simp only [localFourNumBC,fullFour0101FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
