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

def vR2c1M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*d+48*c-72*b+24*a

def vR2c2M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*e-192*c+312*b-96*b*c+192*b^2-144*a+96*a*c-288*a*b+96*a^2

def vR2c3M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -576*c+1144*b-96*b*c+192*b^2-64*b^3-568*a+192*a*c-480*a*b+192*a*b^2+192*a^2-192*a^2*b+64*a^3

def vR2c4M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -744*c+1608*b-72*b*c-432*b^2-192*b^3-840*a+216*a*c+552*a*b+768*a*b^2-264*a^2-960*a^2*b+384*a^3

def vR2c5M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -360*c+264*b-24*b*c-1728*b^2-336*b^3-48*a+96*a*c+3816*a*b+1680*a*b^2-2064*a^2-2544*a^2*b+1200*a^3

def vR2c6M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -2168*b-2688*b^2-400*b^3+1720*a+7704*a*b+2400*a*b^2-4872*a^2-4368*a^2*b+2432*a^3

def vR2c7M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -3456*b-2556*b^2-348*b^3+3096*a+9192*a*b+2436*a*b^2-6900*a^2-5268*a^2*b+3468*a^3

def vR2c8M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -2856*b-1692*b^2-228*b^3+3048*a+7332*a*b+1824*a*b^2-6624*a^2-4596*a^2*b+3576*a^3

def vR2c9M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-1365*b-774*b^2-111*b^3+1911*a+3960*a*b+999*a*b^2-4434*a^2-2889*a^2*b+2649*a^3

def vR2c10M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-393*b-246*b^2-39*b^3+825*a+1473*a*b+390*a*b^2-2073*a^2-1275*a^2*b+1356*a^3

def vR2c11M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-87*b-54*b^2-9*b^3+258*a+375*a*b+99*a*b^2-636*a^2-360*a^2*b+432*a^3

def vR2c12M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-11*b-6*b^2-b^3+44*a+48*a*b+12*a*b^2-96*a^2-48*a^2*b+64*a^3

def vR2seedM115 {R : Type*} [CommRing R] (a b c d e : R) : R[X] :=
 C (vR2c1M115 a b c d e)*X^1+
 C (vR2c2M115 a b c d e)*X^2+
 C (vR2c3M115 a b c d e)*X^3+
 C (vR2c4M115 a b c d e)*X^4+
 C (vR2c5M115 a b c d e)*X^5+
 C (vR2c6M115 a b c d e)*X^6+
 C (vR2c7M115 a b c d e)*X^7+
 C (vR2c8M115 a b c d e)*X^8+
 C (vR2c9M115 a b c d e)*X^9+
 C (vR2c10M115 a b c d e)*X^10+
 C (vR2c11M115 a b c d e)*X^11+
 C (vR2c12M115 a b c d e)*X^12

def vR2BoundsM115 (a b c d e : ℝ) : Prop :=
 0 ≤ vR2c1M115 a b c d e ∧
 0 ≤ vR2c2M115 a b c d e ∧
 0 < vR2c3M115 a b c d e ∧
 0 < vR2c4M115 a b c d e ∧
 0 < vR2c5M115 a b c d e ∧
 0 < vR2c6M115 a b c d e ∧
 0 < vR2c7M115 a b c d e ∧
 0 < vR2c8M115 a b c d e ∧
 0 < vR2c9M115 a b c d e ∧
 0 < vR2c10M115 a b c d e ∧
 0 < vR2c11M115 a b c d e ∧
 0 < vR2c12M115 a b c d e ∧
 vR2c1M115 a b c d e*vR2c3M115 a b c d e ≤ (vR2c2M115 a b c d e)^2 ∧
 vR2c2M115 a b c d e*vR2c4M115 a b c d e ≤ (vR2c3M115 a b c d e)^2 ∧
 vR2c3M115 a b c d e*vR2c5M115 a b c d e ≤ (vR2c4M115 a b c d e)^2 ∧
 vR2c4M115 a b c d e*vR2c6M115 a b c d e ≤ (vR2c5M115 a b c d e)^2 ∧
 vR2c5M115 a b c d e*vR2c7M115 a b c d e ≤ (vR2c6M115 a b c d e)^2 ∧
 vR2c6M115 a b c d e*vR2c8M115 a b c d e ≤ (vR2c7M115 a b c d e)^2 ∧
 vR2c7M115 a b c d e*vR2c9M115 a b c d e ≤ (vR2c8M115 a b c d e)^2 ∧
 vR2c8M115 a b c d e*vR2c10M115 a b c d e ≤ (vR2c9M115 a b c d e)^2 ∧
 vR2c9M115 a b c d e*vR2c11M115 a b c d e ≤ (vR2c10M115 a b c d e)^2 ∧
 vR2c10M115 a b c d e*vR2c12M115 a b c d e ≤ (vR2c11M115 a b c d e)^2

theorem vR2seed_sourceM115 (rest : List Bool) :
 vThirdSeedMEA (X:ℤ[X]) 1 rest=
 vR2seedM115 ((frame rest).mid.b:ℤ) (frame rest).mid.a
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
   vR2seedM115,vR2c1M115,vR2c2M115,vR2c3M115,vR2c4M115,vR2c5M115,vR2c6M115,vR2c7M115,vR2c8M115,vR2c9M115,vR2c10M115,vR2c11M115,vR2c12M115,map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,map_neg,map_one,map_zero,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
 ring
end
end MathGKM.Markov
