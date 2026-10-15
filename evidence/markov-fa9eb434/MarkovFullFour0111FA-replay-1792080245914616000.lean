import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour0111FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-12) + x*(24) + x^2*(516) + x^3*(3624) + x^4*(12654) + x^5*(26016) + x^6*(35280) + x^7*(32928) + x^8*(20808) + x^9*(8520) + x^10*(2172) + x^11*(312) + x^12*(6)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x*(48) + x^2*(-384) + x^3*(-5088) + x^4*(-13200) + x^5*(-20448) + x^6*(-24576) + x^7*(-17280) + x^8*(-4896) + x^9*(-720) + x^11*(480) + x^12*(48)) + N*(x^3*(-4672) + x^4*(-13440) + x^5*(-10944) + x^6*(1088) + x^7*(7872) + x^8*(10560) + x^9*(8128) + x^10*(1728) + x^11*(-384) + x^12*(64)) + N^2*(x^3*(-1344) + x^4*(-4032) + x^5*(-1536) + x^6*(6144) + x^7*(6528) + x^8*(-384) + x^9*(-3072) + x^10*(-1536) + x^11*(-576) + x^12*(-192)) + N^3*(x^3*(-128) + x^4*(-384) + x^6*(1024) + x^7*(768) + x^8*(-768) + x^9*(-1024) + x^11*(384) + x^12*(128))) + Z^2*((x^2*(-144) + x^3*(672) + x^4*(2256) + x^5*(-3456) + x^6*(-20160) + x^7*(-17184) + x^8*(768) + x^9*(-2400) + x^10*(-4656) + x^11*(768) + x^12*(432) + x^13*(96)) + N*(x^4*(1440) + x^5*(1632) + x^6*(-15744) + x^7*(-22272) + x^8*(14016) + x^9*(24768) + x^10*(-1920) + x^11*(-4608) + x^12*(2208) + x^13*(480)) + N^2*(x^4*(192) + x^5*(576) + x^6*(-2304) + x^7*(-5376) + x^8*(2688) + x^9*(9600) + x^10*(768) + x^11*(-5376) + x^12*(-1344) + x^13*(576))) + Z^3*((x^3*(192) + x^4*(-768) + x^5*(-576) + x^6*(3360) + x^7*(7296) + x^8*(-12864) + x^9*(-17664) + x^10*(6528) + x^11*(5568) + x^12*(-2496) + x^13*(-960) + x^14*(96)) + N*(x^5*(-384) + x^6*(384) + x^7*(3264) + x^8*(-576) + x^9*(-11328) + x^10*(-2880) + x^11*(11328) + x^12*(2880) + x^13*(-2880) + x^14*(192))) + Z^4*((x^4*(-96) + x^5*(384) + x^6*(-192) + x^7*(-960) + x^8*(480) + x^9*(768) + x^10*(6048) + x^11*(-11712) + x^12*(3072) + x^13*(768) + x^14*(-96)))

theorem fullFour0111FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x false true true true=fullFour0111FA N Z x := by
 simp only [localFourNumBC,fullFour0111FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
