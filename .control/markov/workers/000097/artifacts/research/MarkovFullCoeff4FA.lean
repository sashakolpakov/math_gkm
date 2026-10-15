import MarkovFullPartsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullH4FA {A : Type*} [CommRing A] (N C R Q T U x : A) : A :=
 ((x^5*(192*T + 288*Q + -384*R + 96*C) + x^6*(192*U + -3072*T + -5568*Q + 192*Q^2 + 7680*R + -384*R*T + -1536*R*Q + 1920*R^2 + -2304*C + 384*C*T + 1152*C*Q + -2304*C*R + 576*C^2) + x^7*(-2304*U + 13824*T + 29568*Q + -1536*Q^2 + -40320*R + -384*R*U + 2688*R*T + 14592*R*Q + -19200*R^2 + 768*R^2*Q + -1536*R^3 + 12960*C + 384*C*U + -2304*C*T + -10752*C*Q + 23040*C*R + -1536*C*R*Q + 3840*C*R^2 + -6144*C^2 + 768*C^2*Q + -3072*C^2*R + 768*C^3) + x^8*(8448*U + -29184*T + -61440*Q + 5376*Q^2 + 76800*R + 2688*R*U + -8064*R*T + -47616*R*Q + 57728*R^2 + -4608*R^2*Q + 9216*R^3 + 256*R^4 + -23040*C + -2304*C*U + 5760*C*T + 29568*C*Q + -59392*C*R + 7680*C*R*Q + -19968*C*R^2 + -1024*C*R^3 + 13952*C^2 + -3072*C^2*Q + 13824*C^2*R + 1536*C^2*R^2 + -3072*C^3 + -1024*C^3*R + 256*C^4) + x^9*(-13056*U + 32640*T + 53952*Q + -10752*Q^2 + -56448*R + -8064*R*U + 13440*R*T + 72960*R*Q + -68096*R^2 + 11520*R^2*Q + -18432*R^3 + -1024*R^4 + 12960*C + 5760*C*U + -7680*C*T + -33792*C*Q + 48128*C*R + -15360*C*R*Q + 29184*C*R^2 + 3072*C*R^3 + -6144*C^2 + 4608*C^2*Q + -12288*C^2*R + -3072*C^2*R^2 + 768*C^3 + 1024*C^3*R) + x^10*(5760*U + -18432*T + -14208*Q + 13440*Q^2 + 13824*R + 13440*R*U + -13440*R*T + -53760*R*Q + 30336*R^2 + -15360*R^2*Q + 15360*R^3 + 1536*R^4 + -2304*C + -7680*C*U + 5760*C*T + 14208*C*Q + -9984*C*R + 15360*C*R*Q + -13824*C*R^2 + -3072*C*R^3 + 576*C^2 + -3072*C^2*Q + 1536*C^2*R + 1536*C^2*R^2) + x^11*(8448*U + 3072*T + -1152*Q + -10752*Q^2 + -1152*R + -13440*R*U + 8064*R*T + 13056*R*Q + -2816*R^2 + 11520*R^2*Q + -4608*R^3 + -1024*R^4 + 96*C + 5760*C*U + -2304*C*T + 1536*C*Q + 512*C*R + -7680*C*R*Q + 768*C*R^2 + 1024*C*R^3 + 768*C^2*Q) + x^12*(-13056*U + 1536*T + -4608*Q + 5376*Q^2 + 8064*R*U + -2688*R*T + 4608*R*Q + 128*R^2 + -4608*R^2*Q + 256*R^4 + -2304*C*U + 384*C*T + -1920*C*Q + 1536*C*R*Q) + x^13*(6912*U + -576*T + 3360*Q + -1536*Q^2 + -2688*R*U + 384*R*T + -2304*R*Q + 768*R^2*Q + 384*C*U) + x^14*(-1344*U + -192*Q + 192*Q^2 + 384*R*U)))
theorem fullH4FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 (partM4FA N C R Q T U x) + 4*(partF1FA N C R Q T U x)*(partT3FA N C R Q T U x) + 3*(partS2FA N C R Q T U x)^2 - 2*(partF1FA N C R Q T U x)^4=fullH4FA N C R Q T U x := by
 unfold partF1FA partM4FA partS2FA partT3FA fullH4FA
 ring
end
end MathGKM.Markov
