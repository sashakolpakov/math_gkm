import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour1001FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-6) + x*(120) + x^2*(1068) + x^3*(5256) + x^4*(15372) + x^5*(28320) + x^6*(35280) + x^7*(30624) + x^8*(18090) + x^9*(6888) + x^10*(1620) + x^11*(216)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x*(-48) + x^2*(-1536) + x^3*(-4320) + x^4*(-10608) + x^5*(-19872) + x^6*(-20736) + x^7*(-14976) + x^8*(-9696) + x^9*(-3504) + x^10*(-384) + x^11*(-288) + x^12*(-48)) + N*(x^2*(-2368) + x^3*(-6528) + x^4*(-7872) + x^5*(-8128) + x^6*(-2880) + x^7*(9024) + x^8*(11200) + x^9*(4800) + x^10*(1920) + x^11*(832)) + N^2*(x^2*(-960) + x^3*(-2880) + x^4*(-1536) + x^5*(3072) + x^6*(4224) + x^7*(1920) + x^9*(-1536) + x^10*(-1728) + x^11*(-576)) + N^3*(x^2*(-128) + x^3*(-384) + x^5*(1024) + x^6*(768) + x^7*(-768) + x^8*(-1024) + x^10*(384) + x^11*(128))) + Z^2*((x^2*(144) + x^3*(-96) + x^4*(-6912) + x^5*(-8640) + x^6*(-6240) + x^7*(-12288) + x^8*(-7296) + x^9*(192) + x^10*(-1200) + x^11*(-672)) + N*(x^3*(1440) + x^4*(-7200) + x^5*(-15360) + x^6*(3456) + x^7*(11328) + x^8*(-960) + x^9*(2304) + x^10*(4992) + x^11*(288) + x^12*(-288)) + N^2*(x^3*(576) + x^4*(-1344) + x^5*(-5376) + x^6*(768) + x^7*(9600) + x^8*(2688) + x^9*(-5376) + x^10*(-2304) + x^11*(576) + x^12*(192))) + Z^3*((x^3*(-192) + x^4*(1920) + x^5*(-1344) + x^6*(-5376) + x^7*(-7488) + x^8*(1920) + x^9*(1344) + x^10*(-4608) + x^11*(1536)) + N*(x^4*(384) + x^5*(1728) + x^6*(-3648) + x^7*(-9024) + x^8*(3264) + x^9*(9792) + x^10*(-192) + x^11*(-2496) + x^12*(192))) + Z^4*((x^4*(96) + x^5*(-768) + x^6*(2688) + x^7*(-2208) + x^8*(-192) + x^9*(-3168) + x^10*(1152) + x^11*(1440) + x^12*(-672) + x^13*(96)))

theorem fullFour1001FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x true false false true=fullFour1001FA N Z x := by
 simp only [localFourNumBC,fullFour1001FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
