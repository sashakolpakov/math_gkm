import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour1011FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-6) + x*(120) + x^2*(1068) + x^3*(5256) + x^4*(15372) + x^5*(28320) + x^6*(35280) + x^7*(30624) + x^8*(18090) + x^9*(6888) + x^10*(1620) + x^11*(216)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x*(-48) + x^2*(-1536) + x^3*(-4032) + x^4*(-10608) + x^5*(-21024) + x^6*(-20736) + x^7*(-13248) + x^8*(-9696) + x^9*(-4656) + x^10*(-384) + x^12*(-48)) + N*(x^2*(-2368) + x^3*(-6432) + x^4*(-7776) + x^5*(-8512) + x^6*(-3264) + x^7*(9600) + x^8*(11776) + x^9*(4416) + x^10*(1536) + x^11*(928) + x^12*(96)) + N^2*(x^2*(-960) + x^3*(-2880) + x^4*(-1536) + x^5*(3072) + x^6*(4224) + x^7*(1920) + x^9*(-1536) + x^10*(-1728) + x^11*(-576)) + N^3*(x^2*(-128) + x^3*(-384) + x^5*(1024) + x^6*(768) + x^7*(-768) + x^8*(-1024) + x^10*(384) + x^11*(128))) + Z^2*((x^2*(144) + x^3*(-672) + x^4*(-4272) + x^5*(-11760) + x^6*(-7680) + x^7*(-5664) + x^8*(-12672) + x^9*(-1344) + x^10*(3312) + x^11*(-2112) + x^12*(-336) + x^13*(48)) + N*(x^4*(-3648) + x^5*(-13440) + x^6*(-6912) + x^7*(14208) + x^8*(8832) + x^9*(-3456) + x^10*(2304) + x^11*(2688) + x^12*(-576)) + N^2*(x^4*(-768) + x^5*(-3072) + x^6*(-1536) + x^7*(6144) + x^8*(6144) + x^9*(-3072) + x^10*(-4608) + x^12*(768))) + Z^3*((x^3*(-192) + x^4*(768) + x^5*(576) + x^6*(-4608) + x^7*(-6336) + x^8*(-6528) + x^9*(5568) + x^10*(2304) + x^11*(-5760) + x^12*(1920)) + N*(x^5*(384) + x^6*(-960) + x^7*(-4032) + x^8*(-4032) + x^9*(4416) + x^10*(7872) + x^11*(-1344) + x^12*(-2880) + x^13*(576))) + Z^4*((x^4*(96) + x^5*(-384) + x^6*(192) + x^7*(960) + x^8*(-480) + x^9*(-2688) + x^10*(96) + x^11*(-1344) + x^12*(3072) + x^13*(-1152) + x^14*(96)))

theorem fullFour1011FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x true false true true=fullFour1011FA N Z x := by
 simp only [localFourNumBC,fullFour1011FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
