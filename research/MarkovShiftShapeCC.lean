import MarkovLinearDerivativeCC
import MarkovFourthBoundaryF2
/-! Machine-authored cc599cf1. Explicit coefficient identities, independently ring-checked. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def shiftPart0CC {A : Type*} [CommRing A] (N C R : A) : A :=
 0

def shiftPart1CC {A : Type*} [CommRing A] (N C R : A) : A :=
 0

def shiftPart2CC {A : Type*} [CommRing A] (N C R : A) : A :=
 3360*R + -1712*R^2 + 288*R^3 + -16*R^4 + -3360*C + 288*C*R^2 + -32*C*R^3 + 1712*C^2 + -288*C^2*R + -288*C^3 + 32*C^3*R + 16*C^4 + 3424*N*R + -1152*N*R^2 + 96*N*R^3 + -3424*N*C + -1712*N*C*R + 672*N*C*R^2 + -48*N*C*R^3 + 2864*N*C^2 + -96*N*C^2*R + -48*N*C^2*R^2 + -672*N*C^3 + 48*N*C^3*R + 48*N*C^4 + 1152*N^2*R + -192*N^2*R^2 + -1152*N^2*C + -1152*N^2*C*R + 192*N^2*C*R^2 + 1344*N^2*C^2 + 288*N^2*C^2*R + -48*N^2*C^2*R^2 + -480*N^2*C^3 + 48*N^2*C^4 + 128*N^3*R + -128*N^3*C + -192*N^3*C*R + 192*N^3*C^2 + 96*N^3*C^2*R + -96*N^3*C^3 + -16*N^3*C^3*R + 16*N^3*C^4

def shiftPart3CC {A : Type*} [CommRing A] (N C R : A) : A :=
 -4704*R + -448*R^2 + 384*R^3 + -32*R^4 + -3360*C + 10448*C*R + -2064*C*R^2 + 96*C*R^3 + -3888*C^2 + -1152*C^2*R + 192*C^2*R^2 + 1296*C^3 + -32*C^3*R + -96*C^4 + 896*N*R + -1536*N*R^2 + 192*N*R^3 + -7008*N*C + 5216*N*C*R + 288*N*C*R^2 + -96*N*C*R^3 + 2448*N*C^2 + -3216*N*C^2*R + 240*N*C^2*R^2 + 816*N*C^3 + 192*N*C^3*R + -144*N*C^4 + 1536*N^2*R + -384*N^2*R^2 + -3072*N^2*C + -768*N^2*C*R + 384*N^2*C*R^2 + 3072*N^2*C^2 + -384*N^2*C^2*R + -96*N^2*C^2*R^2 + -768*N^2*C^3 + 192*N^2*C^3*R + 256*N^3*R + -384*N^3*C + -384*N^3*C*R + 576*N^3*C^2 + 192*N^3*C^2*R + -288*N^3*C^3 + -32*N^3*C^3*R + 48*N^3*C^4

def shiftPart4CC {A : Type*} [CommRing A] (N C R : A) : A :=
 -5280*R + 4752*R^2 + -864*R^3 + 48*R^4 + -8544*C + 9312*C*R + -4224*C*R^2 + 384*C*R^3 + -11856*C^2 + 4992*C^2*R + -192*C^2*R^2 + 1152*C^3 + -480*C^3*R + 48*C^4 + -9504*N*R + 3456*N*R^2 + -288*N*R^3 + -4800*N*C + 13584*N*C*R + -3264*N*C*R^2 + 144*N*C*R^3 + -6720*N*C^2 + -3264*N*C^2*R + 768*N*C^2*R^2 + 5232*N*C^3 + -576*N*C^3*R + -336*N*C^4 + -3456*N^2*R + 576*N^2*R^2 + -768*N^2*C + 4992*N^2*C*R + -576*N^2*C*R^2 + -768*N^2*C^2 + -2400*N^2*C^2*R + 144*N^2*C^2*R^2 + 1344*N^2*C^3 + 384*N^2*C^3*R + -384*N^2*C^4 + -384*N^3*R + 576*N^3*C*R + -288*N^3*C^2*R + 48*N^3*C^3*R

def shiftPart5CC {A : Type*} [CommRing A] (N C R : A) : A :=
 10176*R + -512*R^2 + -1152*R^3 + 128*R^4 + -24288*C + -5856*C*R + 3072*C*R^2 + -128*C*R^3 + -12976*C^2 + 10368*C^2*R + -1344*C^2*R^2 + -4560*C^3 + 224*C^3*R + 448*C^4 + 1024*N*R + 4608*N*R^2 + -768*N*R^3 + -7360*N*C + -8576*N*C*R + -1536*N*C*R^2 + 384*N*C*R^3 + -4288*N*C^2 + 7488*N*C^2*R + -384*N*C^2*R^2 + 2736*N*C^3 + -1728*N*C^3*R + 624*N*C^4 + -4608*N^2*R + 1536*N^2*R^2 + 3840*N^2*C + 3072*N^2*C*R + -1536*N^2*C*R^2 + -5376*N^2*C^2 + 384*N^2*C^2*R + 384*N^2*C^2*R^2 + 2496*N^2*C^3 + -384*N^2*C^3*R + -384*N^2*C^4 + -1024*N^3*R + 1024*N^3*C + 1536*N^3*C*R + -1536*N^3*C^2 + -768*N^3*C^2*R + 768*N^3*C^3 + 128*N^3*C^3*R + -128*N^3*C^4

def shiftPart6CC {A : Type*} [CommRing A] (N C R : A) : A :=
 -8832*R + -4576*R^2 + 960*R^3 + -32*R^4 + -17952*C + 7136*C*R + 6720*C*R^2 + -960*C*R^3 + -26736*C^2 + -192*C^2*R + -192*C^2*R^2 + -6048*C^3 + 1888*C^3*R + -144*C^4 + 9152*N*R + -3840*N*R^2 + 192*N*R^3 + -5760*N*C + -19552*N*C*R + 5952*N*C*R^2 + -96*N*C*R^3 + 3744*N*C^2 + 6912*N*C^2*R + -2016*N*C^2*R^2 + -3024*N*C^3 + 288*N*C^3*R + 1296*N*C^4 + 3840*N^2*R + -384*N^2*R^2 + 3072*N^2*C + -8448*N^2*C*R + 384*N^2*C*R^2 + -1152*N^2*C^2 + 5568*N^2*C^2*R + -96*N^2*C^2*R^2 + -1152*N^2*C^3 + -1152*N^2*C^3*R + 480*N^2*C^4 + 256*N^3*R + 768*N^3*C + -384*N^3*C*R + -1152*N^3*C^2 + 192*N^3*C^2*R + 576*N^3*C^3 + -32*N^3*C^3*R + -96*N^3*C^4

def shiftPart7CC {A : Type*} [CommRing A] (N C R : A) : A :=
 -9984*R + 3456*R^2 + 1152*R^3 + -192*R^4 + -9888*C + 1728*C*R + -1056*C*R^2 + -192*C*R^3 + -30480*C^2 + -4992*C^2*R + 2112*C^2*R^2 + -4752*C^3 + 672*C^3*R + -864*C^4 + -6912*N*R + -4608*N*R^2 + 1152*N*R^3 + 9600*N*C + 5184*N*C*R + 2880*N*C*R^2 + -576*N*C*R^3 + -2592*N*C^2 + -6624*N*C^2*R + -288*N*C^2*R^2 + -1008*N*C^3 + 2880*N*C^3*R + -48*N*C^4 + 4608*N^2*R + -2304*N^2*R^2 + 768*N^2*C + -4608*N^2*C*R + 2304*N^2*C*R^2 + 2304*N^2*C^2 + 1152*N^2*C^2*R + -576*N^2*C^2*R^2 + -2880*N^2*C^3 + 768*N^2*C^4 + 1536*N^3*R + -768*N^3*C + -2304*N^3*C*R + 1152*N^3*C^2 + 1152*N^3*C^2*R + -576*N^3*C^3 + -192*N^3*C^3*R + 96*N^3*C^4

def shiftPart8CC {A : Type*} [CommRing A] (N C R : A) : A :=
 13824*R + 1568*R^2 + -576*R^3 + -32*R^4 + -14112*C + -18656*C*R + -1920*C*R^2 + 896*C*R^3 + -12528*C^2 + -1152*C^2*R + 960*C^2*R^2 + -5568*C^3 + -1440*C^3*R + -432*C^4 + -3136*N*R + 2304*N*R^2 + 192*N*R^3 + 11968*N*C + 5024*N*C*R + -4992*N*C*R^2 + -96*N*C*R^3 + -1856*N*C^2 + -3648*N*C^2*R + 1920*N*C^2*R^2 + -48*N*C^3 + 960*N*C^3*R + -1008*N*C^4 + -2304*N^2*R + -384*N^2*R^2 + 768*N^2*C + 6912*N^2*C*R + 384*N^2*C*R^2 + -768*N^2*C^2 + -5184*N^2*C^2*R + -96*N^2*C^2*R^2 + 192*N^2*C^3 + 1152*N^2*C^3*R + 256*N^3*R + -1024*N^3*C + -384*N^3*C*R + 1536*N^3*C^2 + 192*N^3*C^2*R + -768*N^3*C^3 + -32*N^3*C^3*R + 128*N^3*C^4

def shiftPart9CC {A : Type*} [CommRing A] (N C R : A) : A :=
 2112*R + -3584*R^2 + -384*R^3 + 128*R^4 + -4512*C + -4128*C*R + 1152*C*R^2 + 384*C*R^3 + -5904*C^2 + -4224*C^2*R + -960*C^2*R^2 + -2736*C^3 + -864*C^3*R + 7168*N*R + 1536*N*R^2 + -768*N*R^3 + 3264*N*C + -5504*N*C*R + -2304*N*C*R^2 + 384*N*C*R^3 + 5184*N*C^2 + 3648*N*C^2*R + 768*N*C^2*R^2 + -2544*N*C^3 + -1344*N*C^3*R + -432*N*C^4 + -1536*N^2*R + 1536*N^2*R^2 + -768*N^2*C + 3072*N^2*C*R + -1536*N^2*C*R^2 + -768*N^2*C^2 + -1920*N^2*C^2*R + 384*N^2*C^2*R^2 + 1344*N^2*C^3 + 384*N^2*C^3*R + -384*N^2*C^4 + -1024*N^3*R + 1536*N^3*C*R + -768*N^3*C^2*R + 128*N^3*C^3*R

def shiftPart10CC {A : Type*} [CommRing A] (N C R : A) : A :=
 -2976*R + 144*R^2 + 288*R^3 + 48*R^4 + 960*C + 2208*C*R + -864*C*R^2 + -288*C*R^3 + -3840*C^2 + -3360*C^2*R + -576*C^2*R^2 + -288*N*R + -1152*N*R^2 + -288*N*R^3 + 2016*N*C + 2832*N*C*R + 1824*N*C*R^2 + 144*N*C*R^3 + 1968*N*C^2 + 96*N*C^2*R + -624*N*C^2*R^2 + -1488*N*C^3 + -720*N*C^3*R + 1152*N^2*R + 576*N^2*R^2 + -1920*N^2*C + -2688*N^2*C*R + -576*N^2*C*R^2 + 1344*N^2*C^2 + 1824*N^2*C^2*R + 144*N^2*C^2*R^2 + 96*N^2*C^3 + -384*N^2*C^3*R + -144*N^2*C^4 + -384*N^3*R + 384*N^3*C + 576*N^3*C*R + -576*N^3*C^2 + -288*N^3*C^2*R + 288*N^3*C^3 + 48*N^3*C^3*R + -48*N^3*C^4

def shiftPart11CC {A : Type*} [CommRing A] (N C R : A) : A :=
 2400*R + 1088*R^2 + -32*R^4 + -960*C + -2192*C*R + -1104*C*R^2 + -160*C*R^3 + -2176*N*R + 192*N*R^3 + 1504*N*C + 3680*N*C*R + 672*N*C*R^2 + -96*N*C*R^3 + -752*N*C^2 + -1296*N*C^2*R + -336*N*C^2*R^2 + -384*N^2*R^2 + -768*N^2*C + -768*N^2*C*R + 384*N^2*C*R^2 + 768*N^2*C^2 + 768*N^2*C^2*R + -96*N^2*C^2*R^2 + -192*N^2*C^3 + -192*N^2*C^3*R + 256*N^3*R + 128*N^3*C + -384*N^3*C*R + -192*N^3*C^2 + 192*N^3*C^2*R + 96*N^3*C^3 + -32*N^3*C^3*R + -16*N^3*C^4

def shiftPart12CC {A : Type*} [CommRing A] (N C R : A) : A :=
 -96*R + -176*R^2 + -96*R^3 + -16*R^4 + 352*N*R + 384*N*R^2 + 96*N*R^3 + -176*N*C*R + -192*N*C*R^2 + -48*N*C*R^3 + -384*N^2*R + -192*N^2*R^2 + 384*N^2*C*R + 192*N^2*C*R^2 + -96*N^2*C^2*R + -48*N^2*C^2*R^2 + 128*N^3*R + -192*N^3*C*R + 96*N^3*C^2*R + -16*N^3*C^3*R

def shiftPolyCC {A : Type*} [CommRing A] (N c r x : A) : A :=
 shiftPart0CC N c r*x^0 + shiftPart1CC N c r*x^1 + shiftPart2CC N c r*x^2 + shiftPart3CC N c r*x^3 + shiftPart4CC N c r*x^4 + shiftPart5CC N c r*x^5 + shiftPart6CC N c r*x^6 + shiftPart7CC N c r*x^7 + shiftPart8CC N c r*x^8 + shiftPart9CC N c r*x^9 + shiftPart10CC N c r*x^10 + shiftPart11CC N c r*x^11 + shiftPart12CC N c r*x^12

theorem fourthShift_polyCC {A : Type*} [CommRing A] (N c r x : A) :
 fourthShiftCC N c r x=shiftPolyCC N c r x := by
 unfold fourthShiftCC firstShiftCC secondShiftCC thirdShiftCC fourShiftCC
   firstNumBC secondNumBC linearThirdMomentCC shiftPolyCC
   shiftPart0CC shiftPart1CC shiftPart2CC shiftPart3CC shiftPart4CC shiftPart5CC shiftPart6CC shiftPart7CC shiftPart8CC shiftPart9CC shiftPart10CC shiftPart11CC shiftPart12CC
 ring

def shiftShapeCC (N C R J : ℤ) : ℤ :=
 -56669760*R + 65253888*R*J + -34113408*R*J^2 + 10483200*R*J^3 + -1921920*R*J^4 + 225792*R*J^5 + -10752*R*J^6 + -15926400*R^2 + 16050048*R^2*J + -5967360*R^2*J^2 + 1021440*R^2*J^3 + -80640*R^2*J^4 + -16128*R^2*J^5 + 7862400*R^3 + -7096320*R^3*J + 2822400*R^3*J^2 + -645120*R^3*J^3 + 80640*R^3*J^4 + 2016000*R^4 + -1639680*R^4*J + 483840*R^4*J^2 + -53760*R^4*J^3 + 41217120*C + -56697984*C*J + 36668352*C*J^2 + -14375424*C*J^3 + 3662400*C*J^4 + -650496*C*J^5 + 69888*C*J^6 + -5376*C*J^7 + 74098080*C*R + -90596352*C*R*J + 51257024*C*R*J^2 + -17445120*C*R*J^3 + 3738560*C*R*J^4 + -499968*C*R*J^5 + 41216*C*R*J^6 + 49230720*C*R^2 + -55411776*C*R^2*J + 26570880*C*R^2*J^2 + -7096320*C*R^2*J^3 + 1128960*C*R^2*J^4 + -88704*C*R^2*J^5 + 8064000*C*R^3 + -8574720*C*R^3*J + 3575040*C*R^3*J^2 + -698880*C*R^3*J^3 + 53760*C*R^3*J^4 + 62370000*C^2 + -94869216*C^2*J + 63559328*C^2*J^2 + -24934784*C^2*J^3 + 6362720*C^2*J^4 + -1058624*C^2*J^5 + 113792*C^2*J^6 + -6656*C^2*J^7 + 49109760*C^2*R + -70068096*C^2*R*J + 42502656*C^2*R*J^2 + -14353920*C^2*R*J^3 + 2956800*C^2*R*J^4 + -370944*C^2*R*J^5 + 21504*C^2*R*J^6 + 8648640*C^2*R^2 + -11958912*C^2*R^2*J + 6733440*C^2*R^2*J^2 + -1935360*C^2*R^2*J^3 + 282240*C^2*R^2*J^4 + -16128*C^2*R^2*J^5 + 8648640*C^3 + -16570512*C^3*J + 13403712*C^3*J^2 + -5992896*C^3*J^3 + 1626240*C^3*J^4 + -281568*C^3*J^5 + 29568*C^3*J^6 + -1344*C^3*J^7 + 2630880*C^3*R + -4898880*C^3*R*J + 3763648*C^3*R*J^2 + -1532160*C^3*R*J^3 + 347200*C^3*R*J^4 + -40320*C^3*R*J^5 + 1792*C^3*R*J^6 + 136080*C^4 + -389808*C^4*J + 447328*C^4*J^2 + -271936*C^4*J^3 + 95200*C^4*J^4 + -18592*C^4*J^5 + 1792*C^4*J^6 + -64*C^4*J^7 + 31852800*N*R + -32100096*N*R*J + 11934720*N*R*J^2 + -2042880*N*R*J^3 + 161280*N*R*J^4 + 32256*N*R*J^5 + -31449600*N*R^2 + 28385280*N*R^2*J + -11289600*N*R^2*J^2 + 2580480*N*R^2*J^3 + -322560*N*R^2*J^4 + -12096000*N*R^3 + 9838080*N*R^3*J + -2903040*N*R^3*J^2 + 322560*N*R^3*J^3 + -91707840*N*C + 117043584*N*C*J + -66506496*N*C*J^2 + 22149120*N*C*J^3 + -4690560*N*C*J^4 + 596736*N*C*J^5 + -48384*N*C*J^6 + -140636160*N*C*R + 158581248*N*C*R*J + -75317760*N*C*R*J^2 + 19729920*N*C*R*J^3 + -3064320*N*C*R*J^4 + 225792*N*C*R*J^5 + -18748800*N*C*R^2 + 22659840*N*C*R^2*J + -9838080*N*C*R^2*J^2 + 1774080*N*C*R^2*J^3 + -80640*N*C*R^2*J^4 + 6048000*N*C*R^3 + -4919040*N*C*R^3*J + 1451520*N*C*R^3*J^2 + -161280*N*C*R^3*J^3 + -6370560*N*C^2 + 19283712*N*C^2*J + -16095744*N*C^2*J^2 + 6263040*N*C^2*J^3 + -1317120*N*C^2*J^4 + 177408*N*C^2*J^5 + -5376*N*C^2*J^6 + 39856320*N*C^2*R + -39743424*N*C^2*R*J + 16611840*N*C^2*R*J^2 + -4032000*N*C^2*R*J^3 + 685440*N*C^2*R*J^4 + -72576*N*C^2*R*J^5 + 17236800*N*C^2*R^2 + -18426240*N*C^2*R^2*J + 7741440*N*C^2*R^2*J^2 + -1532160*N*C^2*R^2*J^3 + 120960*N*C^2*R^2*J^4 + 23299920*N*C^3 + -33495840*N*C^3*J + 20349504*N*C^3*J^2 + -6814080*N*C^3*J^3 + 1380960*N*C^3*J^4 + -181440*N*C^3*J^5 + 12096*N*C^3*J^6 + 11249280*N*C^3*R + -15761088*N*C^3*R*J + 9031680*N*C^3*R*J^2 + -2661120*N*C^3*R*J^3 + 403200*N*C^3*R*J^4 + -24192*N*C^3*R*J^5 + 1406160*N*C^4 + -2703456*N*C^4*J + 2162496*N*C^4*J^2 + -927360*N*C^4*J^3 + 225120*N*C^4*J^4 + -28224*N*C^4*J^5 + 1344*N*C^4*J^6 + 31449600*N^2*R + -28385280*N^2*R*J + 11289600*N^2*R*J^2 + -2580480*N^2*R*J^3 + 322560*N^2*R*J^4 + 24192000*N^2*R^2 + -19676160*N^2*R^2*J + 5806080*N^2*R^2*J^2 + -645120*N^2*R^2*J^3 + 52496640*N^2*C + -63415296*N^2*C*J + 32417280*N^2*C*J^2 + -9031680*N^2*C*J^3 + 1451520*N^2*C*J^4 + -129024*N^2*C*J^5 + 9676800*N^2*C*R + -16128000*N^2*C*R*J + 7741440*N^2*C*R*J^2 + -1290240*N^2*C*R*J^3 + -24192000*N^2*C*R^2 + 19676160*N^2*C*R^2*J + -5806080*N^2*C*R^2*J^2 + 645120*N^2*C*R^2*J^3 + -42094080*N^2*C^2 + 48206592*N^2*C^2*J + -23224320*N^2*C^2*J^2 + 6128640*N^2*C^2*J^3 + -967680*N^2*C^2*J^4 + 96768*N^2*C^2*J^5 + -33264000*N^2*C^2*R + 37416960*N^2*C^2*R*J + -16208640*N^2*C^2*R*J^2 + 3225600*N^2*C^2*R*J^3 + -241920*N^2*C^2*R*J^4 + 6048000*N^2*C^2*R^2 + -4919040*N^2*C^2*R^2*J + 1451520*N^2*C^2*R^2*J^2 + -161280*N^2*C^2*R^2*J^3 + 2721600*N^2*C^3 + -645120*N^2*C^3*J + -1088640*N^2*C^3*J^2 + 645120*N^2*C^3*J^3 + -120960*N^2*C^3*J^4 + 10281600*N^2*C^3*R + -11128320*N^2*C^3*R*J + 4757760*N^2*C^3*R*J^2 + -967680*N^2*C^3*R*J^3 + 80640*N^2*C^3*R*J^4 + 2600640*N^2*C^4 + -3802176*N^2*C^4*J + 2298240*N^2*C^4*J^2 + -725760*N^2*C^4*J^3 + 120960*N^2*C^4*J^4 + -8064*N^2*C^4*J^5 + -16128000*N^3*R + 13117440*N^3*R*J + -3870720*N^3*R*J^2 + 430080*N^3*R*J^3 + -8870400*N^3*C + 10214400*N^3*C*J + -4730880*N^3*C*J^2 + 1075200*N^3*C*J^3 + -107520*N^3*C*J^4 + 24192000*N^3*C*R + -19676160*N^3*C*R*J + 5806080*N^3*C*R*J^2 + -645120*N^3*C*R*J^3 + 13305600*N^3*C^2 + -15321600*N^3*C^2*J + 7096320*N^3*C^2*J^2 + -1612800*N^3*C^2*J^3 + 161280*N^3*C^2*J^4 + -12096000*N^3*C^2*R + 9838080*N^3*C^2*R*J + -2903040*N^3*C^2*R*J^2 + 322560*N^3*C^2*R*J^3 + -6652800*N^3*C^3 + 7660800*N^3*C^3*J + -3548160*N^3*C^3*J^2 + 806400*N^3*C^3*J^3 + -80640*N^3*C^3*J^4 + 2016000*N^3*C^3*R + -1639680*N^3*C^3*R*J + 483840*N^3*C^3*R*J^2 + -53760*N^3*C^3*R*J^3 + 1108800*N^3*C^4 + -1276800*N^3*C^4*J + 591360*N^3*C^4*J^2 + -134400*N^3*C^4*J^3 + 13440*N^3*C^4*J^4

theorem shiftShape_fallingCC (n c r j : ℤ) :
 16*shiftShapeCC n c r j=
 shiftPart0CC n c r*fallingSevenK0B (j+7-0) + shiftPart1CC n c r*fallingSevenK0B (j+7-1) + shiftPart2CC n c r*fallingSevenK0B (j+7-2) + shiftPart3CC n c r*fallingSevenK0B (j+7-3) + shiftPart4CC n c r*fallingSevenK0B (j+7-4) + shiftPart5CC n c r*fallingSevenK0B (j+7-5) + shiftPart6CC n c r*fallingSevenK0B (j+7-6) + shiftPart7CC n c r*fallingSevenK0B (j+7-7) + shiftPart8CC n c r*fallingSevenK0B (j+7-8) + shiftPart9CC n c r*fallingSevenK0B (j+7-9) + shiftPart10CC n c r*fallingSevenK0B (j+7-10) + shiftPart11CC n c r*fallingSevenK0B (j+7-11) + shiftPart12CC n c r*fallingSevenK0B (j+7-12) := by
 unfold shiftShapeCC fallingSevenK0B
   shiftPart0CC shiftPart1CC shiftPart2CC shiftPart3CC shiftPart4CC shiftPart5CC shiftPart6CC shiftPart7CC shiftPart8CC shiftPart9CC shiftPart10CC shiftPart11CC shiftPart12CC
 ring

theorem shiftPoly_CCC (n c r : ℤ) :
 shiftPolyCC (C n) (C c) (C r) (X:ℤ[X])=
 C (shiftPart0CC n c r)*X^0 + C (shiftPart1CC n c r)*X^1 + C (shiftPart2CC n c r)*X^2 + C (shiftPart3CC n c r)*X^3 + C (shiftPart4CC n c r)*X^4 + C (shiftPart5CC n c r)*X^5 + C (shiftPart6CC n c r)*X^6 + C (shiftPart7CC n c r)*X^7 + C (shiftPart8CC n c r)*X^8 + C (shiftPart9CC n c r)*X^9 + C (shiftPart10CC n c r)*X^10 + C (shiftPart11CC n c r)*X^11 + C (shiftPart12CC n c r)*X^12 := by
 simp only [shiftPolyCC,shiftPart0CC,shiftPart1CC,shiftPart2CC,shiftPart3CC,shiftPart4CC,shiftPart5CC,shiftPart6CC,shiftPart7CC,shiftPart8CC,shiftPart9CC,shiftPart10CC,shiftPart11CC,shiftPart12CC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,map_neg,map_zero]

theorem shiftPoly_convolutionCC (n c r : ℤ) (j : ℕ) :
 convSevenK0B (shiftPolyCC (C n) (C c) (C r) X) j=
 shiftPart0CC n c r*chooseShiftSevenK0B j 0 + shiftPart1CC n c r*chooseShiftSevenK0B j 1 + shiftPart2CC n c r*chooseShiftSevenK0B j 2 + shiftPart3CC n c r*chooseShiftSevenK0B j 3 + shiftPart4CC n c r*chooseShiftSevenK0B j 4 + shiftPart5CC n c r*chooseShiftSevenK0B j 5 + shiftPart6CC n c r*chooseShiftSevenK0B j 6 + shiftPart7CC n c r*chooseShiftSevenK0B j 7 + shiftPart8CC n c r*chooseShiftSevenK0B j 8 + shiftPart9CC n c r*chooseShiftSevenK0B j 9 + shiftPart10CC n c r*chooseShiftSevenK0B j 10 + shiftPart11CC n c r*chooseShiftSevenK0B j 11 + shiftPart12CC n c r*chooseShiftSevenK0B j 12 := by
 rw [shiftPoly_CCC]
 simp only [convSeven_addK0B,convSeven_monomialK0B]

theorem shiftShape_convolutionCC (n c r : ℤ) (j : ℕ) (hj : 5≤j) :
 315*convSevenK0B (shiftPolyCC (C n) (C c) (C r) X) j=shiftShapeCC n c r j := by
 rw [shiftPoly_convolutionCC]
 have hs := shiftShape_fallingCC n c r j
 have h0 := chooseShiftSeven_fallingK0B j 0 (by omega)
 norm_num only [Nat.cast_ofNat] at h0
 have h1 := chooseShiftSeven_fallingK0B j 1 (by omega)
 norm_num only [Nat.cast_ofNat] at h1
 have h2 := chooseShiftSeven_fallingK0B j 2 (by omega)
 norm_num only [Nat.cast_ofNat] at h2
 have h3 := chooseShiftSeven_fallingK0B j 3 (by omega)
 norm_num only [Nat.cast_ofNat] at h3
 have h4 := chooseShiftSeven_fallingK0B j 4 (by omega)
 norm_num only [Nat.cast_ofNat] at h4
 have h5 := chooseShiftSeven_fallingK0B j 5 (by omega)
 norm_num only [Nat.cast_ofNat] at h5
 have h6 := chooseShiftSeven_fallingK0B j 6 (by omega)
 norm_num only [Nat.cast_ofNat] at h6
 have h7 := chooseShiftSeven_fallingK0B j 7 (by omega)
 norm_num only [Nat.cast_ofNat] at h7
 have h8 := chooseShiftSeven_fallingK0B j 8 (by omega)
 norm_num only [Nat.cast_ofNat] at h8
 have h9 := chooseShiftSeven_fallingK0B j 9 (by omega)
 norm_num only [Nat.cast_ofNat] at h9
 have h10 := chooseShiftSeven_fallingK0B j 10 (by omega)
 norm_num only [Nat.cast_ofNat] at h10
 have h11 := chooseShiftSeven_fallingK0B j 11 (by omega)
 norm_num only [Nat.cast_ofNat] at h11
 have h12 := chooseShiftSeven_fallingK0B j 12 (by omega)
 norm_num only [Nat.cast_ofNat] at h12
 rw [←h0,←h1,←h2,←h3,←h4,←h5,←h6,←h7,←h8,←h9,←h10,←h11,←h12] at hs
 nlinarith only [hs]
end
end MathGKM.Markov
