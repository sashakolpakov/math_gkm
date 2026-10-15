import MarkovFourthBinomialBC
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullFour0001FA {A : Type*} [CommRing A] (N Z x : A) : A :=
 (((-6) + x*(120) + x^2*(1068) + x^3*(5256) + x^4*(15372) + x^5*(28320) + x^6*(35280) + x^7*(30624) + x^8*(18090) + x^9*(6888) + x^10*(1620) + x^11*(216)) + N*((-6) + x*(-96) + x^2*(-552) + x^3*(-1632) + x^4*(-2718) + x^5*(-2304) + x^7*(2304) + x^8*(2718) + x^9*(1632) + x^10*(552) + x^11*(96) + x^12*(6))) + Z*((x^2*(-1920) + x^3*(-4032) + x^4*(-9984) + x^5*(-20928) + x^6*(-20352) + x^7*(-14016) + x^8*(-10752) + x^9*(-3648) + x^11*(-384)) + N*(x^2*(-2368) + x^3*(-6528) + x^4*(-7872) + x^5*(-8128) + x^6*(-2880) + x^7*(9024) + x^8*(11200) + x^9*(4800) + x^10*(1920) + x^11*(832)) + N^2*(x^2*(-960) + x^3*(-2880) + x^4*(-1536) + x^5*(3072) + x^6*(4224) + x^7*(1920) + x^9*(-1536) + x^10*(-1728) + x^11*(-576)) + N^3*(x^2*(-128) + x^3*(-384) + x^5*(1024) + x^6*(768) + x^7*(-768) + x^8*(-1024) + x^10*(384) + x^11*(128))) + Z^2*((x^3*(2016) + x^4*(-12336) + x^5*(-6624) + x^6*(1632) + x^7*(-21792) + x^8*(-6144) + x^9*(4704) + x^10*(-4704) + x^11*(192) + x^12*(48)) + N*(x^3*(2496) + x^4*(-9216) + x^5*(-17280) + x^6*(9216) + x^7*(10752) + x^8*(-6144) + x^9*(4992) + x^10*(6144) + x^11*(-960)) + N^2*(x^3*(768) + x^4*(-1536) + x^5*(-6144) + x^6*(1536) + x^7*(10752) + x^8*(1536) + x^9*(-6144) + x^10*(-1536) + x^11*(768))) + Z^3*((x^4*(-672) + x^5*(10752) + x^6*(-25920) + x^7*(384) + x^8*(16896) + x^9*(-17664) + x^10*(3648) + x^11*(384) + x^12*(-96)) + N*(x^4*(-384) + x^5*(5568) + x^6*(-7488) + x^7*(-14400) + x^8*(13248) + x^9*(9024) + x^10*(-5568) + x^11*(-192) + x^12*(192))) + Z^4*((x^5*(192) + x^6*(-2400) + x^7*(11904) + x^8*(-19680) + x^9*(8640) + x^10*(480) + x^11*(-768) + x^12*(96)))

theorem fullFour0001FA_eq {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x false false false true=fullFour0001FA N Z x := by
 simp only [localFourNumBC,fullFour0001FA,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC]
 ring
end
end MathGKM.Markov
