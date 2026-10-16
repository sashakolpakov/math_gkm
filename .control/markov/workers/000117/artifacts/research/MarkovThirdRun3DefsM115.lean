import MarkovThirdClearedM115
import MarkovThirdTransportMEA
import MarkovCross774
/-! Machine-authored 1152282d. Explicit fixed-run seed and exact source identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def vR3c1M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*d+48*c-72*b+24*a

def vR3c2M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*e-192*c+312*b-96*b*c+192*b^2-144*a+96*a*c-288*a*b+96*a^2

def vR3c3M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -576*c+1144*b-96*b*c+192*b^2-64*b^3-568*a+192*a*c-480*a*b+192*a*b^2+192*a^2-192*a^2*b+64*a^3

def vR3c4M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -960*c+2040*b-96*b*c-384*b^2-192*b^3-1056*a+288*a*c+384*a*b+768*a*b^2-192*a^2-960*a^2*b+384*a^3

def vR3c5M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -1032*c+1608*b-72*b*c-1968*b^2-384*b^3-720*a+288*a*c+4056*a*b+1920*a*b^2-2208*a^2-2880*a^2*b+1344*a^3

def vR3c6M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -456*c-1976*b-24*b*c-4416*b^2-592*b^3+1864*a+120*a*c+11736*a*b+3552*a*b^2-7224*a^2-6288*a^2*b+3392*a^3

def vR3c7M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -7416*b-6336*b^2-720*b^3+6576*a+21000*a*b+5040*a*b^2-14928*a^2-10512*a^2*b+6576*a^3

def vR3c8M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -11256*b-6720*b^2-720*b^3+11208*a+27240*a*b+5760*a*b^2-22584*a^2-14016*a^2*b+10176*a^3

def vR3c9M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -11432*b-5676*b^2-604*b^3+13152*a+27156*a*b+5436*a*b^2-26352*a^2-15168*a^2*b+12768*a^3

def vR3c10M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -8112*b-3756*b^2-420*b^3+11208*a+20736*a*b+4200*a*b^2-23880*a^2-13272*a^2*b+12960*a^3

def vR3c11M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -3936*b-1920*b^2-240*b^3+6984*a+12084*a*b+2640*a*b^2-16788*a^2-9348*a^2*b+10524*a^3

def vR3c12M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-1365*b-774*b^2-111*b^3+3276*a+5508*a*b+1332*a*b^2-9168*a^2-5220*a^2*b+6648*a^3

def vR3c13M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-393*b-246*b^2-39*b^3+1218*a+1965*a*b+507*a*b^2-3792*a^2-2172*a^2*b+3060*a^3

def vR3c14M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-87*b-54*b^2-9*b^3+345*a+483*a*b+126*a*b^2-1065*a^2-585*a^2*b+900*a^3

def vR3c15M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-11*b-6*b^2-b^3+55*a+60*a*b+15*a*b^2-150*a^2-75*a^2*b+125*a^3

def vR3seedM115 {R : Type*} [CommRing R] (a b c d e : R) : R[X] :=
 C (vR3c1M115 a b c d e)*X^1+
 C (vR3c2M115 a b c d e)*X^2+
 C (vR3c3M115 a b c d e)*X^3+
 C (vR3c4M115 a b c d e)*X^4+
 C (vR3c5M115 a b c d e)*X^5+
 C (vR3c6M115 a b c d e)*X^6+
 C (vR3c7M115 a b c d e)*X^7+
 C (vR3c8M115 a b c d e)*X^8+
 C (vR3c9M115 a b c d e)*X^9+
 C (vR3c10M115 a b c d e)*X^10+
 C (vR3c11M115 a b c d e)*X^11+
 C (vR3c12M115 a b c d e)*X^12+
 C (vR3c13M115 a b c d e)*X^13+
 C (vR3c14M115 a b c d e)*X^14+
 C (vR3c15M115 a b c d e)*X^15

def vR3BoundsM115 (a b c d e : ℝ) : Prop :=
 0 ≤ vR3c1M115 a b c d e ∧
 0 ≤ vR3c2M115 a b c d e ∧
 0 < vR3c3M115 a b c d e ∧
 0 < vR3c4M115 a b c d e ∧
 0 < vR3c5M115 a b c d e ∧
 0 < vR3c6M115 a b c d e ∧
 0 < vR3c7M115 a b c d e ∧
 0 < vR3c8M115 a b c d e ∧
 0 < vR3c9M115 a b c d e ∧
 0 < vR3c10M115 a b c d e ∧
 0 < vR3c11M115 a b c d e ∧
 0 < vR3c12M115 a b c d e ∧
 0 < vR3c13M115 a b c d e ∧
 0 < vR3c14M115 a b c d e ∧
 0 < vR3c15M115 a b c d e ∧
 vR3c1M115 a b c d e*vR3c3M115 a b c d e ≤ (vR3c2M115 a b c d e)^2 ∧
 vR3c2M115 a b c d e*vR3c4M115 a b c d e ≤ (vR3c3M115 a b c d e)^2 ∧
 vR3c3M115 a b c d e*vR3c5M115 a b c d e ≤ (vR3c4M115 a b c d e)^2 ∧
 vR3c4M115 a b c d e*vR3c6M115 a b c d e ≤ (vR3c5M115 a b c d e)^2 ∧
 vR3c5M115 a b c d e*vR3c7M115 a b c d e ≤ (vR3c6M115 a b c d e)^2 ∧
 vR3c6M115 a b c d e*vR3c8M115 a b c d e ≤ (vR3c7M115 a b c d e)^2 ∧
 vR3c7M115 a b c d e*vR3c9M115 a b c d e ≤ (vR3c8M115 a b c d e)^2 ∧
 vR3c8M115 a b c d e*vR3c10M115 a b c d e ≤ (vR3c9M115 a b c d e)^2 ∧
 vR3c9M115 a b c d e*vR3c11M115 a b c d e ≤ (vR3c10M115 a b c d e)^2 ∧
 vR3c10M115 a b c d e*vR3c12M115 a b c d e ≤ (vR3c11M115 a b c d e)^2 ∧
 vR3c11M115 a b c d e*vR3c13M115 a b c d e ≤ (vR3c12M115 a b c d e)^2 ∧
 vR3c12M115 a b c d e*vR3c14M115 a b c d e ≤ (vR3c13M115 a b c d e)^2 ∧
 vR3c13M115 a b c d e*vR3c15M115 a b c d e ≤ (vR3c14M115 a b c d e)^2

theorem vR3seed_sourceM115 (rest : List Bool) :
 vThirdSeedMEA (X:ℤ[X]) 2 rest=
 vR3seedM115 ((frame rest).mid.b:ℤ) (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) := by
 have hz : (1-X:ℤ[X])≠0 := by
   intro h
   have hh := congrArg (fun p : ℤ[X] => p.coeff 0) h
   norm_num at hh
 apply mul_left_cancel₀ (pow_ne_zero 6 hz)
 rw [vThirdSeed_sparseM115]
 norm_num only [vThirdSparseM115,vThirdClearedM115,boolMomentADB2,boolJetADB2,
   Bool.false_eq_true,if_false,if_true,vAPMDE6,vBLMDE6,vBPMDE6,
   vCLM115,vCPM115,vGLM115,vGPM115,
   vR3seedM115,vR3c1M115,vR3c2M115,vR3c3M115,vR3c4M115,vR3c5M115,vR3c6M115,vR3c7M115,vR3c8M115,vR3c9M115,vR3c10M115,vR3c11M115,vR3c12M115,vR3c13M115,vR3c14M115,vR3c15M115,map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,map_neg,map_one,map_zero,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
 ring
end
end MathGKM.Markov
