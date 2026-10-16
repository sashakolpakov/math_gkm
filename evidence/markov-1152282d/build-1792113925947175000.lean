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

def vR1c1M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*d+48*c-72*b+24*a

def vR1c2M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*e-192*c+312*b-96*b*c+192*b^2-144*a+96*a*c-288*a*b+96*a^2

def vR1c3M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -456*c+904*b-72*b*c+144*b^2-64*b^3-448*a+144*a*c-360*a*b+192*a*b^2+144*a^2-192*a^2*b+64*a^3

def vR1c4M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -264*c+648*b-24*b*c-384*b^2-144*b^3-360*a+72*a*c+600*a*b+576*a*b^2-264*a^2-720*a^2*b+288*a^3

def vR1c5M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -312*b-780*b^2-156*b^3+192*a+1836*a*b+780*a*b^2-984*a^2-1200*a^2*b+576*a^3

def vR1c6M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-693*b-594*b^2-99*b^3+546*a+1872*a*b+594*a*b^2-1248*a^2-1116*a^2*b+648*a^3

def vR1c7M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-393*b-246*b^2-39*b^3+432*a+981*a*b+273*a*b^2-846*a^2-612*a^2*b+432*a^3

def vR1c8M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-87*b-54*b^2-9*b^3+171*a+267*a*b+72*a*b^2-315*a^2-189*a^2*b+162*a^3

def vR1c9M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-11*b-6*b^2-b^3+33*a+36*a*b+9*a*b^2-54*a^2-27*a^2*b+27*a^3

def vR1seedM115 {R : Type*} [CommRing R] (a b c d e : R) : R[X] :=
 C (vR1c1M115 a b c d e)*X^1+
 C (vR1c2M115 a b c d e)*X^2+
 C (vR1c3M115 a b c d e)*X^3+
 C (vR1c4M115 a b c d e)*X^4+
 C (vR1c5M115 a b c d e)*X^5+
 C (vR1c6M115 a b c d e)*X^6+
 C (vR1c7M115 a b c d e)*X^7+
 C (vR1c8M115 a b c d e)*X^8+
 C (vR1c9M115 a b c d e)*X^9

def vR1BoundsM115 (a b c d e : ℝ) : Prop :=
 0 ≤ vR1c1M115 a b c d e ∧
 0 ≤ vR1c2M115 a b c d e ∧
 0 < vR1c3M115 a b c d e ∧
 0 < vR1c4M115 a b c d e ∧
 0 < vR1c5M115 a b c d e ∧
 0 < vR1c6M115 a b c d e ∧
 0 < vR1c7M115 a b c d e ∧
 0 < vR1c8M115 a b c d e ∧
 0 < vR1c9M115 a b c d e ∧
 vR1c1M115 a b c d e*vR1c3M115 a b c d e ≤ (vR1c2M115 a b c d e)^2 ∧
 vR1c2M115 a b c d e*vR1c4M115 a b c d e ≤ (vR1c3M115 a b c d e)^2 ∧
 vR1c3M115 a b c d e*vR1c5M115 a b c d e ≤ (vR1c4M115 a b c d e)^2 ∧
 vR1c4M115 a b c d e*vR1c6M115 a b c d e ≤ (vR1c5M115 a b c d e)^2 ∧
 vR1c5M115 a b c d e*vR1c7M115 a b c d e ≤ (vR1c6M115 a b c d e)^2 ∧
 vR1c6M115 a b c d e*vR1c8M115 a b c d e ≤ (vR1c7M115 a b c d e)^2 ∧
 vR1c7M115 a b c d e*vR1c9M115 a b c d e ≤ (vR1c8M115 a b c d e)^2

theorem vR1seed_sourceM115 (rest : List Bool) :
 vThirdSeedMEA (X:ℤ[X]) 0 rest=
 vR1seedM115 ((frame rest).mid.b:ℤ) (frame rest).mid.a
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
   vR1seedM115,vR1c1M115,vR1c2M115,vR1c3M115,vR1c4M115,vR1c5M115,vR1c6M115,vR1c7M115,vR1c8M115,vR1c9M115,map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
 ring
end
end MathGKM.Markov
