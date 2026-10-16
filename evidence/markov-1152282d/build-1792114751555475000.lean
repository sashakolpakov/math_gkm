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

def vR4c1M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*d+48*c-72*b+24*a

def vR4c2M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 24*e-192*c+312*b-96*b*c+192*b^2-144*a+96*a*c-288*a*b+96*a^2

def vR4c3M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -576*c+1144*b-96*b*c+192*b^2-64*b^3-568*a+192*a*c-480*a*b+192*a*b^2+192*a^2-192*a^2*b+64*a^3

def vR4c4M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -960*c+2040*b-96*b*c-384*b^2-192*b^3-1056*a+288*a*c+384*a*b+768*a*b^2-192*a^2-960*a^2*b+384*a^3

def vR4c5M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -1344*c+2232*b-96*b*c-1920*b^2-384*b^3-1032*a+384*a*c+3840*a*b+1920*a*b^2-2112*a^2-2880*a^2*b+1344*a^3

def vR4c6M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -1320*c-248*b-72*b*c-4848*b^2-640*b^3+1000*a+360*a*c+12264*a*b+3840*a*b^2-7512*a^2-6720*a^2*b+3584*a^3

def vR4c7M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -552*c-7608*b-24*b*c-8832*b^2-912*b^3+7104*a+144*a*c+27048*a*b+6384*a*b^2-18528*a^2-12912*a^2*b+7824*a^3

def vR4c8M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -17976*b-12096*b^2-1104*b^3+17256*a+44952*a*b+8832*a*b^2-35064*a^2-20688*a^2*b+14304*a^3

def vR4c9M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -26744*b-13440*b^2-1168*b^3+28608*a+60024*a*b+10512*a*b^2-53808*a^2-28320*a^2*b+22368*a^3

def vR4c10M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -30456*b-12864*b^2-1104*b^3+37032*a+67080*a*b+11040*a*b^2-69144*a^2-33696*a^2*b+30336*a^3

def vR4c11M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -27312*b-10524*b^2-924*b^3+38520*a+62640*a*b+10164*a*b^2-74700*a^2-34740*a^2*b+35676*a^3

def vR4c12M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18776*b-7164*b^2-676*b^3+31928*a+48012*a*b+8112*a*b^2-67200*a^2-30804*a^2*b+36136*a^3

def vR4c13M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -9696*b-4032*b^2-432*b^3+20904*a+30180*a*b+5616*a*b^2-50028*a^2-23508*a^2*b+31284*a^3

def vR4c14M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -3936*b-1920*b^2-240*b^3+10920*a+15924*a*b+3360*a*b^2-30792*a^2-15348*a^2*b+22752*a^3

def vR4c15M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-1365*b-774*b^2-111*b^3+4641*a+7056*a*b+1665*a*b^2-15450*a^2-8217*a^2*b+13311*a^3

def vR4c16M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-393*b-246*b^2-39*b^3+1611*a+2457*a*b+624*a*b^2-6003*a^2-3303*a^2*b+5778*a^3

def vR4c17M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -18-87*b-54*b^2-9*b^3+432*a+591*a*b+153*a*b^2-1602*a^2-864*a^2*b+1620*a^3

def vR4c18M115 {R : Type*} [CommRing R] (a b c d e : R) : R :=
 -6-11*b-6*b^2-b^3+66*a+72*a*b+18*a*b^2-216*a^2-108*a^2*b+216*a^3

def vR4seedM115 {R : Type*} [CommRing R] (a b c d e : R) : R[X] :=
 C (vR4c1M115 a b c d e)*X^1+
 C (vR4c2M115 a b c d e)*X^2+
 C (vR4c3M115 a b c d e)*X^3+
 C (vR4c4M115 a b c d e)*X^4+
 C (vR4c5M115 a b c d e)*X^5+
 C (vR4c6M115 a b c d e)*X^6+
 C (vR4c7M115 a b c d e)*X^7+
 C (vR4c8M115 a b c d e)*X^8+
 C (vR4c9M115 a b c d e)*X^9+
 C (vR4c10M115 a b c d e)*X^10+
 C (vR4c11M115 a b c d e)*X^11+
 C (vR4c12M115 a b c d e)*X^12+
 C (vR4c13M115 a b c d e)*X^13+
 C (vR4c14M115 a b c d e)*X^14+
 C (vR4c15M115 a b c d e)*X^15+
 C (vR4c16M115 a b c d e)*X^16+
 C (vR4c17M115 a b c d e)*X^17+
 C (vR4c18M115 a b c d e)*X^18

def vR4BoundsM115 (a b c d e : ℝ) : Prop :=
 0 ≤ vR4c1M115 a b c d e ∧
 0 ≤ vR4c2M115 a b c d e ∧
 0 < vR4c3M115 a b c d e ∧
 0 < vR4c4M115 a b c d e ∧
 0 < vR4c5M115 a b c d e ∧
 0 < vR4c6M115 a b c d e ∧
 0 < vR4c7M115 a b c d e ∧
 0 < vR4c8M115 a b c d e ∧
 0 < vR4c9M115 a b c d e ∧
 0 < vR4c10M115 a b c d e ∧
 0 < vR4c11M115 a b c d e ∧
 0 < vR4c12M115 a b c d e ∧
 0 < vR4c13M115 a b c d e ∧
 0 < vR4c14M115 a b c d e ∧
 0 < vR4c15M115 a b c d e ∧
 0 < vR4c16M115 a b c d e ∧
 0 < vR4c17M115 a b c d e ∧
 0 < vR4c18M115 a b c d e ∧
 vR4c1M115 a b c d e*vR4c3M115 a b c d e ≤ (vR4c2M115 a b c d e)^2 ∧
 vR4c2M115 a b c d e*vR4c4M115 a b c d e ≤ (vR4c3M115 a b c d e)^2 ∧
 vR4c3M115 a b c d e*vR4c5M115 a b c d e ≤ (vR4c4M115 a b c d e)^2 ∧
 vR4c4M115 a b c d e*vR4c6M115 a b c d e ≤ (vR4c5M115 a b c d e)^2 ∧
 vR4c5M115 a b c d e*vR4c7M115 a b c d e ≤ (vR4c6M115 a b c d e)^2 ∧
 vR4c6M115 a b c d e*vR4c8M115 a b c d e ≤ (vR4c7M115 a b c d e)^2 ∧
 vR4c7M115 a b c d e*vR4c9M115 a b c d e ≤ (vR4c8M115 a b c d e)^2 ∧
 vR4c8M115 a b c d e*vR4c10M115 a b c d e ≤ (vR4c9M115 a b c d e)^2 ∧
 vR4c9M115 a b c d e*vR4c11M115 a b c d e ≤ (vR4c10M115 a b c d e)^2 ∧
 vR4c10M115 a b c d e*vR4c12M115 a b c d e ≤ (vR4c11M115 a b c d e)^2 ∧
 vR4c11M115 a b c d e*vR4c13M115 a b c d e ≤ (vR4c12M115 a b c d e)^2 ∧
 vR4c12M115 a b c d e*vR4c14M115 a b c d e ≤ (vR4c13M115 a b c d e)^2 ∧
 vR4c13M115 a b c d e*vR4c15M115 a b c d e ≤ (vR4c14M115 a b c d e)^2 ∧
 vR4c14M115 a b c d e*vR4c16M115 a b c d e ≤ (vR4c15M115 a b c d e)^2 ∧
 vR4c15M115 a b c d e*vR4c17M115 a b c d e ≤ (vR4c16M115 a b c d e)^2 ∧
 vR4c16M115 a b c d e*vR4c18M115 a b c d e ≤ (vR4c17M115 a b c d e)^2

theorem vR4seed_sourceM115 (rest : List Bool) :
 vThirdSeedMEA (X:ℤ[X]) 3 rest=
 vR4seedM115 ((frame rest).mid.b:ℤ) (frame rest).mid.a
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
   vR4seedM115,vR4c1M115,vR4c2M115,vR4c3M115,vR4c4M115,vR4c5M115,vR4c6M115,vR4c7M115,vR4c8M115,vR4c9M115,vR4c10M115,vR4c11M115,vR4c12M115,vR4c13M115,vR4c14M115,vR4c15M115,vR4c16M115,vR4c17M115,vR4c18M115,map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,map_neg,map_one,map_zero,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
 ring
end
end MathGKM.Markov
