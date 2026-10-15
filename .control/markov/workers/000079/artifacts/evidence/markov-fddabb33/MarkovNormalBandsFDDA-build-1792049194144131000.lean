import MarkovNormalFirstSecondFDDA
import MarkovNormalLocal000FDDA
import MarkovNormalLocal001FDDA
import MarkovNormalLocal010FDDA
import MarkovNormalLocal011FDDA
import MarkovNormalLocal100FDDA
import MarkovNormalLocal101FDDA
import MarkovNormalLocal110FDDA
import MarkovNormalLocal111FDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def normalBand0FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 -6 + 18*x + -48*x^3 + 36*x^4 + 36*x^5 + -48*x^6 + 18*x^8 + -6*x^9 + 11*r + 21*r*x + 36*r*x^2 + 92*r*x^3 + 66*r*x^4 + -66*r*x^5 + -92*r*x^6 + -36*r*x^7 + -21*r*x^8 + -11*r*x^9 + -6*r^2 + -18*r^2*x + -12*r^2*x^2 + 12*r^2*x^3 + 24*r^2*x^4 + 24*r^2*x^5 + 12*r^2*x^6 + -12*r^2*x^7 + -18*r^2*x^8 + -6*r^2*x^9 + 1*r^3 + 3*r^3*x + -8*r^3*x^3 + -6*r^3*x^4 + 6*r^3*x^5 + 8*r^3*x^6 + -3*r^3*x^8 + -1*r^3*x^9 + 11*c + -69*c*x + -171*c*x^2 + -325*c*x^3 + -741*c*x^4 + -807*c*x^5 + -417*c*x^6 + -207*c*x^7 + -90*c*x^8 + -12*c*r + 21*c*r*x + 129*c*r*x^2 + 141*c*r*x^3 + 57*c*r*x^4 + -9*c*r*x^5 + -117*c*r*x^6 + -153*c*r*x^7 + -57*c*r*x^8 + 3*c*r^2 + -24*c*r^2*x^2 + -24*c*r^2*x^3 + 30*c*r^2*x^4 + 48*c*r^2*x^5 + -24*c*r^2*x^7 + -9*c*r^2*x^8 + -6*c^2 + 39*c^2*x + 24*c^2*x^2 + -147*c^2*x^3 + -222*c^2*x^4 + -255*c^2*x^5 + -276*c^2*x^6 + -117*c^2*x^7 + 3*c^2*r + -9*c^2*r*x + -21*c^2*r*x^2 + 39*c^2*r*x^3 + 81*c^2*r*x^4 + -3*c^2*r*x^5 + -63*c^2*r*x^6 + -27*c^2*r*x^7 + 1*c^3 + -6*c^3*x + 3*c^3*x^2 + 28*c^3*x^3 + -9*c^3*x^4 + -54*c^3*x^5 + -27*c^3*x^6 + 11*N*c + 21*N*c*x + 36*N*c*x^2 + 92*N*c*x^3 + 66*N*c*x^4 + -66*N*c*x^5 + -92*N*c*x^6 + -36*N*c*x^7 + -21*N*c*x^8 + -11*N*c*x^9 + -12*N*c*r + -36*N*c*r*x + -24*N*c*r*x^2 + 24*N*c*r*x^3 + 48*N*c*r*x^4 + 48*N*c*r*x^5 + 24*N*c*r*x^6 + -24*N*c*r*x^7 + -36*N*c*r*x^8 + -12*N*c*r*x^9 + 3*N*c*r^2 + 9*N*c*r^2*x + -24*N*c*r^2*x^3 + -18*N*c*r^2*x^4 + 18*N*c*r^2*x^5 + 24*N*c*r^2*x^6 + -9*N*c*r^2*x^8 + -3*N*c*r^2*x^9 + -12*N*c^2 + 21*N*c^2*x + 129*N*c^2*x^2 + 141*N*c^2*x^3 + 57*N*c^2*x^4 + -9*N*c^2*x^5 + -117*N*c^2*x^6 + -153*N*c^2*x^7 + -57*N*c^2*x^8 + 6*N*c^2*r + -48*N*c^2*r*x^2 + -48*N*c^2*r*x^3 + 60*N*c^2*r*x^4 + 96*N*c^2*r*x^5 + -48*N*c^2*r*x^7 + -18*N*c^2*r*x^8 + 3*N*c^3 + -9*N*c^3*x + -21*N*c^3*x^2 + 39*N*c^3*x^3 + 81*N*c^3*x^4 + -3*N*c^3*x^5 + -63*N*c^3*x^6 + -27*N*c^3*x^7 + -6*N^2*c^2 + -18*N^2*c^2*x + -12*N^2*c^2*x^2 + 12*N^2*c^2*x^3 + 24*N^2*c^2*x^4 + 24*N^2*c^2*x^5 + 12*N^2*c^2*x^6 + -12*N^2*c^2*x^7 + -18*N^2*c^2*x^8 + -6*N^2*c^2*x^9 + 3*N^2*c^2*r + 9*N^2*c^2*r*x + -24*N^2*c^2*r*x^3 + -18*N^2*c^2*r*x^4 + 18*N^2*c^2*r*x^5 + 24*N^2*c^2*r*x^6 + -9*N^2*c^2*r*x^8 + -3*N^2*c^2*r*x^9 + 3*N^2*c^3 + -24*N^2*c^3*x^2 + -24*N^2*c^3*x^3 + 30*N^2*c^3*x^4 + 48*N^2*c^3*x^5 + -24*N^2*c^3*x^7 + -9*N^2*c^3*x^8 + 1*N^3*c^3 + 3*N^3*c^3*x + -8*N^3*c^3*x^3 + -6*N^3*c^3*x^4 + 6*N^3*c^3*x^5 + 8*N^3*c^3*x^6 + -3*N^3*c^3*x^8 + -1*N^3*c^3*x^9
def normalTail1FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 -360*r + 480*r*x + 480*r*x^2 + -840*r*x^3 + 216*r*x^4 + 336*r*x^5 + -336*r*x^6 + 24*r*x^7 + 132*r^2 + 12*r^2*x + -348*r^2*x^2 + 12*r^2*x^3 + 300*r^2*x^4 + -60*r^2*x^5 + -84*r^2*x^6 + 36*r^2*x^7 + -12*r^3 + -12*r^3*x + 36*r^3*x^2 + 36*r^3*x^3 + -36*r^3*x^4 + -36*r^3*x^5 + 12*r^3*x^6 + 12*r^3*x^7 + 360*c + 192*c*x + 192*c*x^2 + 864*c*x^3 + 264*c*x^4 + -96*c*x^5 + 144*c*x^6 + -660*c*r*x + -252*c*r*x^2 + 792*c*r*x^3 + -24*c*r*x^4 + -132*c*r*x^5 + 276*c*r*x^6 + -12*c*r^2 + 72*c*r^2*x + 108*c*r^2*x^2 + -144*c*r^2*x^3 + -180*c*r^2*x^4 + 72*c*r^2*x^5 + 84*c*r^2*x^6 + -132*c^2 + 288*c^2*x + 648*c^2*x^2 + 240*c^2*x^3 + 348*c^2*x^4 + 336*c^2*x^5 + 12*c^2*r + 36*c^2*r*x + -168*c^2*r*x^2 + -216*c^2*r*x^3 + 156*c^2*r*x^4 + 180*c^2*r*x^5 + 12*c^3 + -48*c^3*x + -24*c^3*x^2 + 144*c^3*x^3 + 108*c^3*x^4 + -264*N*r + -24*N*r*x + 696*N*r*x^2 + -24*N*r*x^3 + -600*N*r*x^4 + 120*N*r*x^5 + 168*N*r*x^6 + -72*N*r*x^7 + 48*N*r^2 + 48*N*r^2*x + -144*N*r^2*x^2 + -144*N*r^2*x^3 + 144*N*r^2*x^4 + 144*N*r^2*x^5 + -48*N*r^2*x^6 + -48*N*r^2*x^7 + 264*N*c + 384*N*c*x + -120*N*c*x^2 + -192*N*c*x^3 + 24*N*c*x^4 + -192*N*c*x^5 + -168*N*c*x^6 + 132*N*c*r + -180*N*c*r*x + -540*N*c*r*x^2 + 396*N*c*r*x^3 + 684*N*c*r*x^4 + -252*N*c*r*x^5 + -276*N*c*r*x^6 + 36*N*c*r*x^7 + -24*N*c*r^2 + -24*N*c*r^2*x + 72*N*c*r^2*x^2 + 72*N*c*r^2*x^3 + -72*N*c*r^2*x^4 + -72*N*c*r^2*x^5 + 24*N*c*r^2*x^6 + 24*N*c*r^2*x^7 + -180*N*c^2 + -144*N*c^2*x + 348*N*c^2*x^2 + 192*N*c^2*x^3 + -252*N*c^2*x^4 + -48*N*c^2*x^5 + 84*N*c^2*x^6 + 96*N*c^2*r*x + 96*N*c^2*r*x^2 + -192*N*c^2*r*x^3 + -192*N*c^2*r*x^4 + 96*N*c^2*r*x^5 + 96*N*c^2*r*x^6 + 24*N*c^3 + -24*N*c^3*x + -144*N*c^3*x^2 + -48*N*c^3*x^3 + 120*N*c^3*x^4 + 72*N*c^3*x^5 + -48*N^2*r + -48*N^2*r*x + 144*N^2*r*x^2 + 144*N^2*r*x^3 + -144*N^2*r*x^4 + -144*N^2*r*x^5 + 48*N^2*r*x^6 + 48*N^2*r*x^7 + 48*N^2*c + 96*N^2*c*x + -48*N^2*c*x^2 + -192*N^2*c*x^3 + -48*N^2*c*x^4 + 96*N^2*c*x^5 + 48*N^2*c*x^6 + 48*N^2*c*r + 48*N^2*c*r*x + -144*N^2*c*r*x^2 + -144*N^2*c*r*x^3 + 144*N^2*c*r*x^4 + 144*N^2*c*r*x^5 + -48*N^2*c*r*x^6 + -48*N^2*c*r*x^7 + -48*N^2*c^2 + -96*N^2*c^2*x + 48*N^2*c^2*x^2 + 192*N^2*c^2*x^3 + 48*N^2*c^2*x^4 + -96*N^2*c^2*x^5 + -48*N^2*c^2*x^6 + -12*N^2*c^2*r + -12*N^2*c^2*r*x + 36*N^2*c^2*r*x^2 + 36*N^2*c^2*r*x^3 + -36*N^2*c^2*r*x^4 + -36*N^2*c^2*r*x^5 + 12*N^2*c^2*r*x^6 + 12*N^2*c^2*r*x^7 + 12*N^2*c^3 + 24*N^2*c^3*x + -12*N^2*c^3*x^2 + -48*N^2*c^3*x^3 + -12*N^2*c^3*x^4 + 24*N^2*c^3*x^5 + 12*N^2*c^3*x^6
def normalBand1FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 x^2*normalTail1FDDA N c r q t u x
theorem normal_band_factor_1FDDA {A : Type*} [CommRing A] (N c r q t u x : A) :
 normalBand1FDDA N c r q t u x=x^2*normalTail1FDDA N c r q t u x := rfl
def normalTail2FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 -168*q + 840*q*x + -1320*q*x^2 + 264*q*x^3 + 1224*q*x^4 + -1128*q*x^5 + 264*q*x^6 + 24*q*x^7 + 336*r + -1680*r*x + 1056*r*x^2 + 1248*r*x^3 + -1392*r*x^4 + 432*r*x^5 + 24*r*q + -72*r*q*x + 24*r*q*x^2 + 120*r*q*x^3 + -120*r*q*x^4 + -24*r*q*x^5 + 72*r*q*x^6 + -24*r*q*x^7 + -48*r^2 + -288*r^2*x + 1008*r^2*x^2 + -384*r^2*x^3 + -912*r^2*x^4 + 672*r^2*x^5 + -48*r^2*x^6 + 48*r^3*x + -48*r^3*x^2 + -96*r^3*x^3 + 96*r^3*x^4 + 48*r^3*x^5 + -48*r^3*x^6 + -168*c + 840*c*x + -384*c*x^3 + 552*c*x^4 + -72*c*x^5 + 24*c*q + -144*c*q*x + 264*c*q*x^2 + -96*c*q*x^3 + -216*c*q*x^4 + 240*c*q*x^5 + -72*c*q*x^6 + -24*c*r + 1080*c*r*x + -1248*c*r*x^2 + -768*c*r*x^3 + 1272*c*r*x^4 + -312*c*r*x^5 + -48*c*r^2*x + -192*c*r^2*x^2 + 288*c*r^2*x^3 + 192*c*r^2*x^4 + -240*c*r^2*x^5 + 24*c^2 + -576*c^2*x + 288*c^2*x^3 + -312*c^2*x^4 + -48*c^2*r*x + 336*c^2*r*x^2 + 48*c^2*r*x^3 + -336*c^2*r*x^4 + 48*c^3*x + -96*c^3*x^2 + -144*c^3*x^3 + -96*N*q + 288*N*q*x + -96*N*q*x^2 + -480*N*q*x^3 + 480*N*q*x^4 + 96*N*q*x^5 + -288*N*q*x^6 + 96*N*q*x^7 + 192*N*r + -576*N*r*x + -384*N*r*x^2 + 1152*N*r*x^3 + 192*N*r*x^4 + -576*N*r*x^5 + -192*N*r^2*x + 192*N*r^2*x^2 + 384*N*r^2*x^3 + -384*N*r^2*x^4 + -192*N*r^2*x^5 + 192*N*r^2*x^6 + -96*N*c + 288*N*c*x + 384*N*c*x^2 + -384*N*c*x^3 + -288*N*c*x^4 + 96*N*c*x^5 + 24*N*c*q + -72*N*c*q*x + 24*N*c*q*x^2 + 120*N*c*q*x^3 + -120*N*c*q*x^4 + -24*N*c*q*x^5 + 72*N*c*q*x^6 + -24*N*c*q*x^7 + -48*N*c*r + 528*N*c*r*x + 96*N*c*r*x^2 + -1056*N*c*r*x^3 + -48*N*c*r*x^4 + 528*N*c*r*x^5 + 48*N*c*r^2*x + -48*N*c*r^2*x^2 + -96*N*c*r^2*x^3 + 96*N*c*r^2*x^4 + 48*N*c*r^2*x^5 + -48*N*c*r^2*x^6 + 24*N*c^2 + -264*N*c^2*x + -288*N*c^2*x^2 + 288*N*c^2*x^3 + 264*N*c^2*x^4 + -24*N*c^2*x^5 + -96*N*c^2*r*x + 192*N*c^2*r*x^3 + -96*N*c^2*r*x^5 + 48*N*c^3*x + 48*N*c^3*x^2 + -48*N*c^3*x^3 + -48*N*c^3*x^4
def normalBand2FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 x^3*normalTail2FDDA N c r q t u x
theorem normal_band_factor_2FDDA {A : Type*} [CommRing A] (N c r q t u x : A) :
 normalBand2FDDA N c r q t u x=x^3*normalTail2FDDA N c r q t u x := rfl
def normalTail3FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 24*u*x + -144*u*x^2 + 360*u*x^3 + -480*u*x^4 + 360*u*x^5 + -144*u*x^6 + 24*u*x^7 + 24*t + -144*t*x + 360*t*x^2 + -480*t*x^3 + 360*t*x^4 + -144*t*x^5 + 24*t*x^6 + 48*q + -480*q*x + 1296*q*x^2 + -1344*q*x^3 + 336*q*x^4 + 288*q*x^5 + -144*q*x^6 + -72*r + 744*r*x + -1808*r*x^2 + 1296*r*x^3 + -168*r*x^4 + 8*r*x^5 + -96*r*q*x + 480*r*q*x^2 + -960*r*q*x^3 + 960*r*q*x^4 + -480*r*q*x^5 + 96*r*q*x^6 + 192*r^2*x + -960*r^2*x^2 + 1344*r^2*x^3 + -576*r^2*x^4 + -64*r^3*x^2 + 192*r^3*x^3 + -192*r^3*x^4 + 64*r^3*x^5 + 24*c + -288*c*x + 656*c*x^2 + -288*c*x^3 + 24*c*x^4 + 96*c*q*x + -384*c*q*x^2 + 576*c*q*x^3 + -384*c*q*x^4 + 96*c*q*x^5 + -288*c*r*x + 1248*c*r*x^2 + -1056*c*r*x^3 + 96*c*r*x^4 + 192*c*r^2*x^2 + -384*c*r^2*x^3 + 192*c*r^2*x^4 + 96*c^2*x + -384*c^2*x^2 + 96*c^2*x^3 + -192*c^2*r*x^2 + 192*c^2*r*x^3 + 64*c^3*x^2
def normalBand3FDDA {A : Type*} [CommRing A] (N c r q t u x : A) : A :=
 x^4*normalTail3FDDA N c r q t u x
theorem normal_band_factor_3FDDA {A : Type*} [CommRing A] (N c r q t u x : A) :
 normalBand3FDDA N c r q t u x=x^4*normalTail3FDDA N c r q t u x := rfl
def normalLocalFDDA (N Z x : RunFieldBDEE) (p q r : Bool) : RunFieldBDEE :=
 match p,q,r with
 | false,false,false => normalLocal000FDDA N Z x
 | false,false,true => normalLocal001FDDA N Z x
 | false,true,false => normalLocal010FDDA N Z x
 | false,true,true => normalLocal011FDDA N Z x
 | true,false,false => normalLocal100FDDA N Z x
 | true,false,true => normalLocal101FDDA N Z x
 | true,true,false => normalLocal110FDDA N Z x
 | true,true,true => normalLocal111FDDA N Z x
end
end MathGKM.Markov
