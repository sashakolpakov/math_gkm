import MarkovFullPartsFA
/-! Machine-authored fa9eb434. Run-degree staging of exact identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def runF0n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((-1 + 1*R + 1*C) + x*(1 + 1*R + -2*C) + x^2*(1 + -1*R + -3*C) + x^3*(-1 + -1*R))

def runF0n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((1*C) + x*(1*C) + x^2*(-1*C) + x^3*(-1*C))
theorem runF0FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partF0FA N C R Q T U x=(runF0n0FA C R Q T U x) + N*(runF0n1FA C R Q T U x) := by
 unfold partF0FA runF0n0FA runF0n1FA
 ring

def runF1n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(-4*R + 4*C) + x^3*(4*R))
theorem runF1FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partF1FA N C R Q T U x=(runF1n0FA C R Q T U x) := by
 unfold partF1FA runF1n0FA
 ring

def runS0n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((2 + -3*R + 1*R^2 + -3*C + 2*C*R + 1*C^2) + x*(-4 + -4*R + 2*R^2 + 12*C + -2*C*R + -4*C^2) + x^2*(-2 + 1*R + -1*R^2 + 22*C + -12*C*R + -2*C^2) + x^3*(8 + -4*R^2 + 12*C + -4*C*R + 12*C^2) + x^4*(-2 + -1*R + -1*R^2 + 21*C + 10*C*R + 9*C^2) + x^5*(-4 + 4*R + 2*R^2 + 16*C + 6*C*R) + x^6*(2 + 3*R + 1*R^2))

def runS0n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((-3*C + 2*C*R + 2*C^2) + x*(-4*C + 4*C*R + -2*C^2) + x^2*(1*C + -2*C*R + -12*C^2) + x^3*(-8*C*R + -4*C^2) + x^4*(-1*C + -2*C*R + 10*C^2) + x^5*(4*C + 4*C*R + 6*C^2) + x^6*(3*C + 2*C*R))

def runS0n2FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((1*C^2) + x*(2*C^2) + x^2*(-1*C^2) + x^3*(-4*C^2) + x^4*(-1*C^2) + x^5*(2*C^2) + x^6*(1*C^2))
theorem runS0FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partS0FA N C R Q T U x=(runS0n0FA C R Q T U x) + N*(runS0n1FA C R Q T U x) + N^2*(runS0n2FA C R Q T U x) := by
 unfold partS0FA runS0n0FA runS0n1FA runS0n2FA
 ring

def runS1n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(40*R + -8*R^2 + -40*C + 8*C^2) + x^3*(-48*R + -8*C + 32*C*R + -16*C^2) + x^4*(-32*R + 16*R^2 + 8*C + -24*C^2) + x^5*(48*R + -24*C + -32*C*R) + x^6*(-8*R + -8*R^2))

def runS1n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(16*R + -16*C + -8*C*R + 8*C^2) + x^3*(-16*C + 8*C^2) + x^4*(-32*R + 16*C + 16*C*R + -8*C^2) + x^5*(16*C + -8*C^2) + x^6*(16*R + -8*C*R))
theorem runS1FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partS1FA N C R Q T U x=(runS1n0FA C R Q T U x) + N*(runS1n1FA C R Q T U x) := by
 unfold partS1FA runS1n0FA runS1n1FA
 ring

def runS2n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^3*(8*Q + -16*R + 8*C) + x^4*(-32*Q + 64*R + 16*R^2 + -32*C + -32*C*R + 16*C^2) + x^5*(48*Q + -48*R + -32*R^2 + 8*C + 32*C*R) + x^6*(-32*Q + 16*R^2) + x^7*(8*Q))
theorem runS2FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partS2FA N C R Q T U x=(runS2n0FA C R Q T U x) := by
 unfold partS2FA runS2n0FA
 ring

def runT0n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((2*R + 2*C) + x*(18*R + -24*C) + x^2*(60*R + -132*C) + x^3*(92*R + -400*C) + x^4*(48*R + -744*C) + x^5*(-48*R + -792*C) + x^6*(-92*R + -492*C) + x^7*(-60*R + -192*C) + x^8*(-18*R + -42*C) + x^9*(-2*R))

def runT0n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((2*C) + x*(18*C) + x^2*(60*C) + x^3*(92*C) + x^4*(48*C) + x^5*(-48*C) + x^6*(-92*C) + x^7*(-60*C) + x^8*(-18*C) + x^9*(-2*C))
theorem runT0FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partT0FA N C R Q T U x=(runT0n0FA C R Q T U x) + N*(runT0n1FA C R Q T U x) := by
 unfold partT0FA runT0n0FA runT0n1FA
 ring

def runT1n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(-240*R + 240*C) + x^3*(216*R + 288*C) + x^4*(408*R + 360*C) + x^5*(-336*R + 672*C) + x^6*(288*C) + x^7*(120*R) + x^8*(-168*R + 72*C))

def runT1n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(-216*R + 216*C) + x^3*(-72*R + 384*C) + x^4*(552*R + 24*C) + x^5*(120*R + -192*C) + x^6*(-456*R + -120*C) + x^7*(-24*R + -192*C) + x^8*(120*R + -120*C) + x^9*(-24*R))

def runT1n2FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(-48*R + 48*C) + x^3*(-48*R + 96*C) + x^4*(144*R + -48*C) + x^5*(144*R + -192*C) + x^6*(-144*R + -48*C) + x^7*(-144*R + 96*C) + x^8*(48*R + 48*C) + x^9*(48*R))
theorem runT1FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partT1FA N C R Q T U x=(runT1n0FA C R Q T U x) + N*(runT1n1FA C R Q T U x) + N^2*(runT1n2FA C R Q T U x) := by
 unfold partT1FA runT1n0FA runT1n1FA runT1n2FA
 ring

def runT2n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^3*(-144*Q + 288*R + -144*C) + x^4*(720*Q + -1440*R + 720*C) + x^5*(-1104*Q + 768*R + 96*C) + x^6*(144*Q + 1152*R + -288*C) + x^7*(1104*Q + -1056*R + 432*C) + x^8*(-912*Q + 288*R + -48*C) + x^9*(144*Q) + x^10*(48*Q))

def runT2n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^3*(-96*Q + 192*R + -96*C) + x^4*(288*Q + -576*R + 288*C) + x^5*(-96*Q + -384*R + 384*C) + x^6*(-480*Q + 1152*R + -384*C) + x^7*(480*Q + 192*R + -288*C) + x^8*(96*Q + -576*R + 96*C) + x^9*(-288*Q) + x^10*(96*Q))
theorem runT2FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partT2FA N C R Q T U x=(runT2n0FA C R Q T U x) + N*(runT2n1FA C R Q T U x) := by
 unfold partT2FA runT2n0FA runT2n1FA
 ring

def runT3n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^4*(24*T + 48*Q + -72*R + 24*C) + x^5*(24*U + -144*T + -480*Q + 744*R + -288*C) + x^6*(-144*U + 360*T + 1296*Q + -1808*R + 656*C) + x^7*(360*U + -480*T + -1344*Q + 1296*R + -288*C) + x^8*(-480*U + 360*T + 336*Q + -168*R + 24*C) + x^9*(360*U + -144*T + 288*Q + 8*R) + x^10*(-144*U + 24*T + -144*Q) + x^11*(24*U))
theorem runT3FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partT3FA N C R Q T U x=(runT3n0FA C R Q T U x) := by
 unfold partT3FA runT3n0FA
 ring

def runM0n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((-6*R + -6*C) + x*(-96*R + 120*C) + x^2*(-552*R + 1068*C) + x^3*(-1632*R + 5256*C) + x^4*(-2718*R + 15372*C) + x^5*(-2304*R + 28320*C) + x^6*(35280*C) + x^7*(2304*R + 30624*C) + x^8*(2718*R + 18090*C) + x^9*(1632*R + 6888*C) + x^10*(552*R + 1620*C) + x^11*(96*R + 216*C) + x^12*(6*R))

def runM0n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 ((-6*C) + x*(-96*C) + x^2*(-552*C) + x^3*(-1632*C) + x^4*(-2718*C) + x^5*(-2304*C) + x^7*(2304*C) + x^8*(2718*C) + x^9*(1632*C) + x^10*(552*C) + x^11*(96*C) + x^12*(6*C))
theorem runM0FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partM0FA N C R Q T U x=(runM0n0FA C R Q T U x) + N*(runM0n1FA C R Q T U x) := by
 unfold partM0FA runM0n0FA runM0n1FA
 ring

def runM1n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(1920*R + -1920*C) + x^3*(-1344*R + -4032*C) + x^4*(-3840*R + -9984*C) + x^5*(1536*R + -20928*C) + x^6*(-4608*R + -20352*C) + x^7*(-4224*R + -14016*C) + x^8*(6912*R + -10752*C) + x^9*(3072*R + -3648*C) + x^10*(-384*R) + x^11*(960*R + -384*C))

def runM1n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(2368*R + -2368*C) + x^3*(1856*R + -6528*C) + x^4*(-5568*R + -7872*C) + x^5*(-2816*R + -8128*C) + x^6*(3968*R + -2880*C) + x^7*(-1152*R + 9024*C) + x^8*(-640*R + 11200*C) + x^9*(3328*R + 4800*C) + x^10*(-192*R + 1920*C) + x^11*(-1216*R + 832*C) + x^12*(64*R))

def runM1n2FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(960*R + -960*C) + x^3*(1536*R + -2880*C) + x^4*(-2496*R + -1536*C) + x^5*(-4608*R + 3072*C) + x^6*(1920*R + 4224*C) + x^7*(4608*R + 1920*C) + x^8*(-384*R) + x^9*(-1536*R + -1536*C) + x^10*(192*R + -1728*C) + x^11*(-576*C) + x^12*(-192*R))

def runM1n3FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^2*(128*R + -128*C) + x^3*(256*R + -384*C) + x^4*(-384*R) + x^5*(-1024*R + 1024*C) + x^6*(256*R + 768*C) + x^7*(1536*R + -768*C) + x^8*(256*R + -1024*C) + x^9*(-1024*R) + x^10*(-384*R + 384*C) + x^11*(256*R + 128*C) + x^12*(128*R))
theorem runM1FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partM1FA N C R Q T U x=(runM1n0FA C R Q T U x) + N*(runM1n1FA C R Q T U x) + N^2*(runM1n2FA C R Q T U x) + N^3*(runM1n3FA C R Q T U x) := by
 unfold partM1FA runM1n0FA runM1n1FA runM1n2FA runM1n3FA
 ring

def runM2n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^3*(2016*Q + -4032*R + 2016*C) + x^4*(-12288*Q + 24576*R + -12288*C) + x^5*(19680*Q + -7680*R + -6720*C) + x^6*(6144*Q + -30720*R + 1536*C) + x^7*(-40512*Q + 31872*R + -21504*C) + x^8*(24576*Q + -6144*R + -6144*C) + x^9*(14016*Q + -18432*R + 4416*C) + x^10*(-18432*Q + 12288*R + -4608*C) + x^11*(4704*Q + -1728*R + 288*C) + x^13*(96*Q))

def runM2n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^3*(2496*Q + -4992*R + 2496*C) + x^4*(-9216*Q + 18432*R + -9216*C) + x^5*(2880*Q + 18432*R + -17280*C) + x^6*(24576*Q + -46080*R + 9216*C) + x^7*(-24192*Q + -16128*R + 10752*C) + x^8*(-18432*Q + 36864*R + -6144*C) + x^9*(30336*Q + -3072*R + 4992*C) + x^10*(-9216*R + 6144*C) + x^11*(-12096*Q + 5760*R + -960*C) + x^12*(3072*Q) + x^13*(576*Q))

def runM2n2FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^3*(768*Q + -1536*R + 768*C) + x^4*(-1536*Q + 3072*R + -1536*C) + x^5*(-2304*Q + 9216*R + -6144*C) + x^6*(6144*Q + -9216*R + 1536*C) + x^7*(1536*Q + -18432*R + 10752*C) + x^8*(-9216*Q + 9216*R + 1536*C) + x^9*(1536*Q + 15360*R + -6144*C) + x^10*(6144*Q + -3072*R + -1536*C) + x^11*(-2304*Q + -4608*R + 768*C) + x^12*(-1536*Q) + x^13*(768*Q))
theorem runM2FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partM2FA N C R Q T U x=(runM2n0FA C R Q T U x) + N*(runM2n1FA C R Q T U x) + N^2*(runM2n2FA C R Q T U x) := by
 unfold partM2FA runM2n0FA runM2n1FA runM2n2FA
 ring

def runM3n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^4*(-768*T + -1536*Q + 2304*R + -768*C) + x^5*(-960*U + 5568*T + 18816*Q + -29184*R + 11328*C) + x^6*(6528*U + -15360*T + -55296*Q + 76032*R + -27264*C) + x^7*(-16896*U + 18432*T + 46080*Q + -32256*R + 1728*C) + x^8*(18432*U + -3072*T + 36864*Q + -54528*R + 16896*C) + x^9*(-384*U + -16512*T + -76032*Q + 59904*R + -19008*C) + x^10*(-19200*U + 18432*T + 24576*Q + -23808*R + 4992*C) + x^11*(18432*U + -7680*T + 12288*Q + 1536*R + -192*C) + x^12*(-6144*U + 768*T + -4608*Q) + x^13*(-192*U + 192*T + -1152*Q) + x^14*(384*U))

def runM3n1FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^4*(-576*T + -1152*Q + 1728*R + -576*C) + x^5*(-576*U + 2880*T + 10368*Q + -16128*R + 6336*C) + x^6*(2880*U + -4608*T + -18432*Q + 23808*R + -8256*C) + x^7*(-4608*U + -9216*Q + 28416*R + -15168*C) + x^8*(8064*T + 43776*Q + -52608*R + 15168*C) + x^9*(8064*U + -8064*T + -16128*Q + -8448*R + 8256*C) + x^10*(-8064*U + -27648*Q + 26880*R + -6336*C) + x^11*(4608*T + 18432*Q + -3840*R + 576*C) + x^12*(4608*U + -2880*T + 3456*Q + 192*R) + x^13*(-2880*U + 576*T + -3456*Q) + x^14*(576*U))
theorem runM3FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partM3FA N C R Q T U x=(runM3n0FA C R Q T U x) + N*(runM3n1FA C R Q T U x) := by
 unfold partM3FA runM3n0FA runM3n1FA
 ring

def runM4n0FA {A : Type*} [CommRing A] (C R Q T U x : A) : A :=
 (x^5*(192*T + 288*Q + -384*R + 96*C) + x^6*(192*U + -3072*T + -5568*Q + 7680*R + -2304*C) + x^7*(-2304*U + 13824*T + 29568*Q + -40320*R + 12960*C) + x^8*(8448*U + -29184*T + -61440*Q + 76800*R + -23040*C) + x^9*(-13056*U + 32640*T + 53952*Q + -56448*R + 12960*C) + x^10*(5760*U + -18432*T + -14208*Q + 13824*R + -2304*C) + x^11*(8448*U + 3072*T + -1152*Q + -1152*R + 96*C) + x^12*(-13056*U + 1536*T + -4608*Q) + x^13*(6912*U + -576*T + 3360*Q) + x^14*(-1344*U + -192*Q))
theorem runM4FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 partM4FA N C R Q T U x=(runM4n0FA C R Q T U x) := by
 unfold partM4FA runM4n0FA
 ring
end
end MathGKM.Markov
