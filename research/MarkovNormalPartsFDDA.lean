import MarkovNormalBandsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def partFirst0FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 -1 + 1*x + 1*x^2 + -1*x^3 + 1*r + 1*r*x + -1*r*x^2 + -1*r*x^3 + 1*c + -2*c*x + -3*c*x^2 + 1*N*c + 1*N*c*x + -1*N*c*x^2 + -1*N*c*x^3
def partFirst1FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 -4*r*x^2 + 4*r*x^3 + 4*c*x^2
def partSecond0FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 2 + -4*x + -2*x^2 + 8*x^3 + -2*x^4 + -4*x^5 + 2*x^6 + -3*r + -4*r*x + 1*r*x^2 + -1*r*x^4 + 4*r*x^5 + 3*r*x^6 + 1*r^2 + 2*r^2*x + -1*r^2*x^2 + -4*r^2*x^3 + -1*r^2*x^4 + 2*r^2*x^5 + 1*r^2*x^6 + -3*c + 12*c*x + 22*c*x^2 + 12*c*x^3 + 21*c*x^4 + 16*c*x^5 + 2*c*r + -2*c*r*x + -12*c*r*x^2 + -4*c*r*x^3 + 10*c*r*x^4 + 6*c*r*x^5 + 1*c^2 + -4*c^2*x + -2*c^2*x^2 + 12*c^2*x^3 + 9*c^2*x^4 + -3*N*c + -4*N*c*x + 1*N*c*x^2 + -1*N*c*x^4 + 4*N*c*x^5 + 3*N*c*x^6 + 2*N*c*r + 4*N*c*r*x + -2*N*c*r*x^2 + -8*N*c*r*x^3 + -2*N*c*r*x^4 + 4*N*c*r*x^5 + 2*N*c*r*x^6 + 2*N*c^2 + -2*N*c^2*x + -12*N*c^2*x^2 + -4*N*c^2*x^3 + 10*N*c^2*x^4 + 6*N*c^2*x^5 + 1*N^2*c^2 + 2*N^2*c^2*x + -1*N^2*c^2*x^2 + -4*N^2*c^2*x^3 + -1*N^2*c^2*x^4 + 2*N^2*c^2*x^5 + 1*N^2*c^2*x^6
def partSecond1FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 40*r*x^2 + -48*r*x^3 + -32*r*x^4 + 48*r*x^5 + -8*r*x^6 + -8*r^2*x^2 + 16*r^2*x^4 + -8*r^2*x^6 + -40*c*x^2 + -8*c*x^3 + 8*c*x^4 + -24*c*x^5 + 32*c*r*x^3 + -32*c*r*x^5 + 8*c^2*x^2 + -16*c^2*x^3 + -24*c^2*x^4 + 16*N*r*x^2 + -32*N*r*x^4 + 16*N*r*x^6 + -16*N*c*x^2 + -16*N*c*x^3 + 16*N*c*x^4 + 16*N*c*x^5 + -8*N*c*r*x^2 + 16*N*c*r*x^4 + -8*N*c*r*x^6 + 8*N*c^2*x^2 + 8*N*c^2*x^3 + -8*N*c^2*x^4 + -8*N*c^2*x^5
def partSecond2FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 8*q*x^3 + -32*q*x^4 + 48*q*x^5 + -32*q*x^6 + 8*q*x^7 + -16*r*x^3 + 64*r*x^4 + -48*r*x^5 + 16*r^2*x^4 + -32*r^2*x^5 + 16*r^2*x^6 + 8*c*x^3 + -32*c*x^4 + 8*c*x^5 + -32*c*r*x^4 + 32*c*r*x^5 + 16*c^2*x^4
def partMoment0FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 2*r + 18*r*x + 60*r*x^2 + 92*r*x^3 + 48*r*x^4 + -48*r*x^5 + -92*r*x^6 + -60*r*x^7 + -18*r*x^8 + -2*r*x^9 + 2*c + -24*c*x + -132*c*x^2 + -400*c*x^3 + -744*c*x^4 + -792*c*x^5 + -492*c*x^6 + -192*c*x^7 + -42*c*x^8 + 2*N*c + 18*N*c*x + 60*N*c*x^2 + 92*N*c*x^3 + 48*N*c*x^4 + -48*N*c*x^5 + -92*N*c*x^6 + -60*N*c*x^7 + -18*N*c*x^8 + -2*N*c*x^9
def partMoment1FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 -240*r*x^2 + 216*r*x^3 + 408*r*x^4 + -336*r*x^5 + 120*r*x^7 + -168*r*x^8 + 240*c*x^2 + 288*c*x^3 + 360*c*x^4 + 672*c*x^5 + 288*c*x^6 + 72*c*x^8 + -216*N*r*x^2 + -72*N*r*x^3 + 552*N*r*x^4 + 120*N*r*x^5 + -456*N*r*x^6 + -24*N*r*x^7 + 120*N*r*x^8 + -24*N*r*x^9 + 216*N*c*x^2 + 384*N*c*x^3 + 24*N*c*x^4 + -192*N*c*x^5 + -120*N*c*x^6 + -192*N*c*x^7 + -120*N*c*x^8 + -48*N^2*r*x^2 + -48*N^2*r*x^3 + 144*N^2*r*x^4 + 144*N^2*r*x^5 + -144*N^2*r*x^6 + -144*N^2*r*x^7 + 48*N^2*r*x^8 + 48*N^2*r*x^9 + 48*N^2*c*x^2 + 96*N^2*c*x^3 + -48*N^2*c*x^4 + -192*N^2*c*x^5 + -48*N^2*c*x^6 + 96*N^2*c*x^7 + 48*N^2*c*x^8
def partMoment2FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 -144*q*x^3 + 720*q*x^4 + -1104*q*x^5 + 144*q*x^6 + 1104*q*x^7 + -912*q*x^8 + 144*q*x^9 + 48*q*x^10 + 288*r*x^3 + -1440*r*x^4 + 768*r*x^5 + 1152*r*x^6 + -1056*r*x^7 + 288*r*x^8 + -144*c*x^3 + 720*c*x^4 + 96*c*x^5 + -288*c*x^6 + 432*c*x^7 + -48*c*x^8 + -96*N*q*x^3 + 288*N*q*x^4 + -96*N*q*x^5 + -480*N*q*x^6 + 480*N*q*x^7 + 96*N*q*x^8 + -288*N*q*x^9 + 96*N*q*x^10 + 192*N*r*x^3 + -576*N*r*x^4 + -384*N*r*x^5 + 1152*N*r*x^6 + 192*N*r*x^7 + -576*N*r*x^8 + -96*N*c*x^3 + 288*N*c*x^4 + 384*N*c*x^5 + -384*N*c*x^6 + -288*N*c*x^7 + 96*N*c*x^8
def partMoment3FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=
 24*u*x^5 + -144*u*x^6 + 360*u*x^7 + -480*u*x^8 + 360*u*x^9 + -144*u*x^10 + 24*u*x^11 + 24*t*x^4 + -144*t*x^5 + 360*t*x^6 + -480*t*x^7 + 360*t*x^8 + -144*t*x^9 + 24*t*x^10 + 48*q*x^4 + -480*q*x^5 + 1296*q*x^6 + -1344*q*x^7 + 336*q*x^8 + 288*q*x^9 + -144*q*x^10 + -72*r*x^4 + 744*r*x^5 + -1808*r*x^6 + 1296*r*x^7 + -168*r*x^8 + 8*r*x^9 + 24*c*x^4 + -288*c*x^5 + 656*c*x^6 + -288*c*x^7 + 24*c*x^8
theorem part_firstFDDA (N Z c r q t u x : RunFieldBDEE) :
 normalFirstNumFDDA N Z c r x=Z^0*partFirst0FDDA N c r q t u x+Z^1*partFirst1FDDA N c r q t u x := by
 unfold normalFirstNumFDDA partFirst0FDDA partFirst1FDDA
 ring
theorem part_secondFDDA (N Z c r q t u x : RunFieldBDEE) :
 normalSecondNumFDDA N Z c r q x=Z^0*partSecond0FDDA N c r q t u x+Z^1*partSecond1FDDA N c r q t u x+Z^2*partSecond2FDDA N c r q t u x := by
 unfold normalSecondNumFDDA partSecond0FDDA partSecond1FDDA partSecond2FDDA
 ring
theorem part_momentFDDA (N Z c r q t u x : RunFieldBDEE) :
 boolMomentADB2 (normalLocalFDDA N Z x) c r q t u=Z^0*partMoment0FDDA N c r q t u x+Z^1*partMoment1FDDA N c r q t u x+Z^2*partMoment2FDDA N c r q t u x+Z^3*partMoment3FDDA N c r q t u x := by
 unfold boolMomentADB2 boolJetADB2 normalLocalFDDA normalLocal000FDDA normalLocal001FDDA normalLocal010FDDA normalLocal011FDDA normalLocal100FDDA normalLocal101FDDA normalLocal110FDDA normalLocal111FDDA partMoment0FDDA partMoment1FDDA partMoment2FDDA partMoment3FDDA
 ring
end
end MathGKM.Markov
