import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour0010FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-6) + x*(120) + x^2*(1068) + x^3*(5256) + x^4*(15372) + x^5*(28320) + x^6*(35280) + x^7*(30624) + x^8*(18090) + x^9*(6888) + x^10*(1620) + x^11*(216)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x^2*(-1920) + x^3*(-3744) + x^4*(-9984) + x^5*(-22080) + x^6*(-20352) + x^7*(-12288) + x^8*(-10752) + x^9*(-4800) + x^11*(-96)) + N*(x^2*(-2368) + x^3*(-6432) + x^4*(-7776) + x^5*(-8512) + x^6*(-3264) + x^7*(9600) + x^8*(11776) + x^9*(4416) + x^10*(1536) + x^11*(928) + x^12*(96)) + N^2*(x^2*(-960) + x^3*(-2880) + x^4*(-1536) + x^5*(3072) + x^6*(4224) + x^7*(1920) + x^9*(-1536) + x^10*(-1728) + x^11*(-576)) + N^3*(x^2*(-128) + x^3*(-384) + x^5*(1024) + x^6*(768) + x^7*(-768) + x^8*(-1024) + x^10*(384) + x^11*(128))) + Z^2*((x^3*(1440) + x^4*(-9696) + x^5*(-9696) + x^6*(96) + x^7*(-15264) + x^8*(-11232) + x^9*(3168) + x^10*(-480) + x^11*(-1152) + x^12*(-192)) + N*(x^3*(1056) + x^4*(-5664) + x^5*(-15360) + x^6*(-1152) + x^7*(13632) + x^8*(3648) + x^9*(-768) + x^10*(3456) + x^11*(1440) + x^12*(-288)) + N^2*(x^3*(192) + x^4*(-960) + x^5*(-3840) + x^6*(-768) + x^7*(7296) + x^8*(4992) + x^9*(-3840) + x^10*(-3840) + x^11*(192) + x^12*(576))) + Z^3*((x^4*(-1152) + x^5*(7872) + x^6*(-11904) + x^7*(-14784) + x^8*(12288) + x^9*(-192) + x^10*(-5760) + x^11*(960) + x^12*(384)) + N*(x^4*(-384) + x^5*(2112) + x^6*(-960) + x^7*(-10176) + x^8*(-192) + x^9*(10944) + x^10*(1728) + x^11*(-2880) + x^12*(-192))) + Z^4*((x^5*(384) + x^6*(-2784) + x^7*(6720) + x^8*(-3936) + x^9*(-6144) + x^10*(3936) + x^11*(576) + x^12*(-288)))

theorem fullFour0010FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x false false true false=fullFour0010FA N Z x := by
 simp only [localFourNumBC,fullFour0010FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
