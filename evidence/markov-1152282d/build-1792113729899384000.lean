import MarkovThirdClearedM115
import MarkovBinomialExtractBC
/-! Machine-authored 1152282d. Explicit four-block identity, checked universally.
The proposed coefficients came from interpolation; the proof uses the checked
run-jet recurrence and ring identities and has no interpolation assumption. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 20000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def vJ0M115 {R : Type*} [CommRing R] (a b c d e q x : R) : R :=
 24*e*x^2-144*e*x^3+360*e*x^4-480*e*x^5+360*e*x^6-144*e*x^7+24*e*x^8+24*d*x-144*d*x^2+360*d*x^3-480*d*x^4+360*d*x^5-144*d*x^6+24*d*x^7+48*c*x-480*c*x^2+1296*c*x^3-1344*c*x^4+336*c*x^5+288*c*x^6-144*c*x^7-72*b*x+744*b*x^2-1808*b*x^3+1296*b*x^4-168*b*x^5+8*b*x^6-96*b*c*x^2+480*b*c*x^3-960*b*c*x^4+960*b*c*x^5-480*b*c*x^6+96*b*c*x^7+192*b^2*x^2-960*b^2*x^3+1344*b^2*x^4-576*b^2*x^5-64*b^3*x^3+192*b^3*x^4-192*b^3*x^5+64*b^3*x^6+24*a*x-288*a*x^2+656*a*x^3-288*a*x^4+24*a*x^5+96*a*c*x^2-384*a*c*x^3+576*a*c*x^4-384*a*c*x^5+96*a*c*x^6-288*a*b*x^2+1248*a*b*x^3-1056*a*b*x^4+96*a*b*x^5+192*a*b^2*x^3-384*a*b^2*x^4+192*a*b^2*x^5+96*a^2*x^2-384*a^2*x^3+96*a^2*x^4-192*a^2*b*x^3+192*a^2*b*x^4+64*a^3*x^3

def vJ1M115 {R : Type*} [CommRing R] (a b c d e q x : R) : R :=
 24*c*x^2+96*c*q*x^2+264*c*x^3-288*c*q*x^3-1128*c*x^4+96*c*q*x^4+1224*c*x^5+480*c*q*x^5+264*c*x^6-480*c*q*x^6-1320*c*x^7-96*c*q*x^7+840*c*x^8+288*c*q*x^8-168*c*x^9-96*c*q*x^9-48*b*x^2-192*b*q*x^2-528*b*x^3+576*b*q*x^3+1824*b*x^4+384*b*q*x^4-1056*b*x^5-1152*b*q*x^5-1776*b*x^6-192*b*q*x^6+1584*b*x^7+576*b*q*x^7+24*b*c*x^2-72*b*c*x^3+24*b*c*x^4+120*b*c*x^5-120*b*c*x^6-24*b*c*x^7+72*b*c*x^8-24*b*c*x^9-48*b^2*x^2+96*b^2*x^3+192*b^2*q*x^3+624*b^2*x^4-192*b^2*q*x^4-1152*b^2*x^5-384*b^2*q*x^5-144*b^2*x^6+384*b^2*q*x^6+1056*b^2*x^7+192*b^2*q*x^7-432*b^2*x^8-192*b^2*q*x^8+48*b^3*x^3-48*b^3*x^4-96*b^3*x^5+96*b^3*x^6+48*b^3*x^7-48*b^3*x^8+24*a*x^2+96*a*q*x^2+264*a*x^3-288*a*q*x^3-768*a*x^4-384*a*q*x^4+384*a*x^5+384*a*q*x^5+1128*a*x^6+288*a*q*x^6-264*a*x^7-96*a*q*x^7-24*a*c*x^2-24*a*c*q*x^2+72*a*c*q*x^3+216*a*c*x^4-24*a*c*q*x^4-336*a*c*x^5-120*a*c*q*x^5+24*a*c*x^6+120*a*c*q*x^6+288*a*c*x^7+24*a*c*q*x^7-216*a*c*x^8-72*a*c*q*x^8+48*a*c*x^9+24*a*c*q*x^9+72*a*b*x^2+48*a*b*q*x^2+24*a*b*x^3-528*a*b*q*x^3-1440*a*b*x^4-96*a*b*q*x^4+1344*a*b*x^5+1056*a*b*q*x^5+1368*a*b*x^6+48*a*b*q*x^6-1368*a*b*x^7-528*a*b*q*x^7-144*a*b^2*x^3-48*a*b^2*q*x^3-96*a*b^2*x^4+48*a*b^2*q*x^4+480*a*b^2*x^5+96*a*b^2*q*x^5-96*a*b^2*q*x^6-336*a*b^2*x^7-48*a*b^2*q*x^7+96*a*b^2*x^8+48*a*b^2*q*x^8-24*a^2*x^2-24*a^2*q*x^2-48*a^2*x^3+264*a^2*q*x^3+576*a^2*x^4+288*a^2*q*x^4-288*a^2*x^5-288*a^2*q*x^5-840*a^2*x^6-264*a^2*q*x^6+48*a^2*x^7+24*a^2*q*x^7+144*a^2*b*x^3+96*a^2*b*q*x^3+336*a^2*b*x^4-336*a^2*b*x^5-192*a^2*b*q*x^5-336*a^2*b*x^6+192*a^2*b*x^7+96*a^2*b*q*x^7-48*a^3*x^3-48*a^3*q*x^3-192*a^3*x^4-48*a^3*q*x^4-48*a^3*x^5+48*a^3*q*x^5+96*a^3*x^6+48*a^3*q*x^6

def vJ2M115 {R : Type*} [CommRing R] (a b c d e q x : R) : R :=
 -24*b*x^3+72*b*q*x^3-48*b*q^2*x^3+336*b*x^4-168*b*q*x^4-48*b*q^2*x^4-336*b*x^5-120*b*q*x^5+144*b*q^2*x^5-216*b*x^6+600*b*q*x^6+144*b*q^2*x^6+840*b*x^7+24*b*q*x^7-144*b*q^2*x^7-480*b*x^8-696*b*q*x^8-144*b*q^2*x^8-480*b*x^9+24*b*q*x^9+48*b*q^2*x^9+360*b*x^10+264*b*q*x^10+48*b*q^2*x^10+36*b^2*x^3-48*b^2*q*x^3-84*b^2*x^4-48*b^2*q*x^4-60*b^2*x^5+144*b^2*q*x^5+300*b^2*x^6+144*b^2*q*x^6+12*b^2*x^7-144*b^2*q*x^7-348*b^2*x^8-144*b^2*q*x^8+12*b^2*x^9+48*b^2*q*x^9+132*b^2*x^10+48*b^2*q*x^10-12*b^3*x^3-12*b^3*x^4+36*b^3*x^5+36*b^3*x^6-36*b^3*x^7-36*b^3*x^8+12*b^3*x^9+12*b^3*x^10+24*a*x^3-72*a*q*x^3+48*a*q^2*x^3-192*a*x^4+96*a*q^2*x^4+240*a*x^5-72*a*q*x^5-48*a*q^2*x^5+480*a*x^6-576*a*q*x^6-192*a*q^2*x^6+24*a*x^7-216*a*q*x^7-48*a*q^2*x^7+672*a*x^8+576*a*q*x^8+96*a*q^2*x^8+672*a*x^9+360*a*q*x^9+48*a*q^2*x^9-72*a*b*x^3+60*a*b*q*x^3+48*a*b*q^2*x^3-108*a*b*x^4+372*a*b*q*x^4+48*a*b*q^2*x^4+252*a*b*x^5-36*a*b*q*x^5-144*a*b*q^2*x^5-576*a*b*x^6-972*a*b*q*x^6-144*a*b*q^2*x^6-816*a*b*x^7-108*a*b*q*x^7+144*a*b*q^2*x^7+948*a*b*x^8+828*a*b*q*x^8+144*a*b*q^2*x^8+636*a*b*x^9+84*a*b*q*x^9-48*a*b*q^2*x^9-264*a*b*x^10-228*a*b*q*x^10-48*a*b*q^2*x^10+36*a*b^2*x^3+24*a*b^2*q*x^3+120*a*b^2*x^4+24*a*b^2*q*x^4-36*a*b^2*x^5-72*a*b^2*q*x^5-288*a*b^2*x^6-72*a*b^2*q*x^6-36*a*b^2*x^7+72*a*b^2*q*x^7+216*a*b^2*x^8+72*a*b^2*q*x^8+36*a*b^2*x^9-24*a*b^2*q*x^9-48*a*b^2*x^10-24*a*b^2*q*x^10+36*a^2*x^3-12*a^2*q*x^3-48*a^2*q^2*x^3+192*a^2*x^4-240*a^2*q*x^4-96*a^2*q^2*x^4+144*a^2*x^5-156*a^2*q*x^5+48*a^2*q^2*x^5+624*a^2*x^6+576*a^2*q*x^6+192*a^2*q^2*x^6+1044*a^2*x^7+444*a^2*q*x^7+48*a^2*q^2*x^7+48*a^2*x^8-336*a^2*q*x^8-96*a^2*q^2*x^8-360*a^2*x^9-276*a^2*q*x^9-48*a^2*q^2*x^9-36*a^2*b*x^3-48*a^2*b*q*x^3-12*a^2*b*q^2*x^3-204*a^2*b*x^4-144*a^2*b*q*x^4-12*a^2*b*q^2*x^4-216*a^2*b*x^5+48*a^2*b*q*x^5+36*a^2*b*q^2*x^5+312*a^2*b*x^6+336*a^2*b*q*x^6+36*a^2*b*q^2*x^6+396*a^2*b*x^7+48*a^2*b*q*x^7-36*a^2*b*q^2*x^7-156*a^2*b*x^8-240*a^2*b*q*x^8-36*a^2*b*q^2*x^8-144*a^2*b*x^9-48*a^2*b*q*x^9+12*a^2*b*q^2*x^9+48*a^2*b*x^10+48*a^2*b*q*x^10+12*a^2*b*q^2*x^10+12*a^3*x^3+24*a^3*q*x^3+12*a^3*q^2*x^3+96*a^3*x^4+120*a^3*q*x^4+24*a^3*q^2*x^4+216*a^3*x^5+96*a^3*q*x^5-12*a^3*q^2*x^5+48*a^3*x^6-144*a^3*q*x^6-48*a^3*q^2*x^6-180*a^3*x^7-168*a^3*q*x^7-12*a^3*q^2*x^7-48*a^3*x^8+24*a^3*q*x^8+24*a^3*q^2*x^8+48*a^3*x^9+48*a^3*q*x^9+12*a^3*q^2*x^9

def vJ3M115 {R : Type*} [CommRing R] (a b c d e q x : R) : R :=
 -6*x^3+18*x^4-48*x^6+36*x^7+36*x^8-48*x^9+18*x^11-6*x^12+11*b*x^3+21*b*x^4+36*b*x^5+92*b*x^6+66*b*x^7-66*b*x^8-92*b*x^9-36*b*x^10-21*b*x^11-11*b*x^12-6*b^2*x^3-18*b^2*x^4-12*b^2*x^5+12*b^2*x^6+24*b^2*x^7+24*b^2*x^8+12*b^2*x^9-12*b^2*x^10-18*b^2*x^11-6*b^2*x^12+b^3*x^3+3*b^3*x^4-8*b^3*x^6-6*b^3*x^7+6*b^3*x^8+8*b^3*x^9-3*b^3*x^11-b^3*x^12-11*a*x^3-11*a*q*x^3-111*a*x^4-21*a*q*x^4-243*a*x^5-36*a*q*x^5-509*a*x^6-92*a*q*x^6-873*a*x^7-66*a*q*x^7-675*a*x^8+66*a*q*x^8-233*a*x^9+92*a*q*x^9-135*a*x^10+36*a*q*x^10-48*a*x^11+21*a*q*x^11+22*a*x^12+11*a*q*x^12+12*a*b*x^3+12*a*b*q*x^3+93*a*b*x^4+36*a*b*q*x^4+177*a*b*x^5+24*a*b*q*x^5+93*a*b*x^6-24*a*b*q*x^6-39*a*b*x^7-48*a*b*q*x^7-105*a*b*x^8-48*a*b*q*x^8-165*a*b*x^9-24*a*b*q*x^9-105*a*b*x^10+24*a*b*q*x^10+15*a*b*x^11+36*a*b*q*x^11+24*a*b*x^12+12*a*b*q*x^12-3*a*b^2*x^3-3*a*b^2*q*x^3-18*a*b^2*x^4-9*a*b^2*q*x^4-24*a*b^2*x^5+24*a*b^2*x^6+24*a*b^2*q*x^6+66*a*b^2*x^7+18*a*b^2*q*x^7+12*a*b^2*x^8-18*a*b^2*q*x^8-48*a*b^2*x^9-24*a*b^2*q*x^9-24*a*b^2*x^10+9*a*b^2*x^11+9*a*b^2*q*x^11+6*a*b^2*x^12+3*a*b^2*q*x^12-6*a^2*x^3-12*a^2*q*x^3-6*a^2*q^2*x^3-75*a^2*x^4-93*a^2*q*x^4-18*a^2*q^2*x^4-282*a^2*x^5-177*a^2*q*x^5-12*a^2*q^2*x^5-381*a^2*x^6-93*a^2*q*x^6+12*a^2*q^2*x^6-240*a^2*x^7+39*a^2*q*x^7+24*a^2*q^2*x^7-141*a^2*x^8+105*a^2*q*x^8+24*a^2*q^2*x^8+6*a^2*x^9+165*a^2*q*x^9+12*a^2*q^2*x^9+141*a^2*x^10+105*a^2*q*x^10-12*a^2*q^2*x^10+42*a^2*x^11-15*a^2*q*x^11-18*a^2*q^2*x^11-24*a^2*x^12-24*a^2*q*x^12-6*a^2*q^2*x^12+3*a^2*b*x^3+6*a^2*b*q*x^3+3*a^2*b*q^2*x^3+27*a^2*b*x^4+36*a^2*b*q*x^4+9*a^2*b*q^2*x^4+75*a^2*b*x^5+48*a^2*b*q*x^5+39*a^2*b*x^6-48*a^2*b*q*x^6-24*a^2*b*q^2*x^6-111*a^2*b*x^7-132*a^2*b*q*x^7-18*a^2*b*q^2*x^7-123*a^2*b*x^8-24*a^2*b*q*x^8+18*a^2*b*q^2*x^8+33*a^2*b*x^9+96*a^2*b*q*x^9+24*a^2*b*q^2*x^9+69*a^2*b*x^10+48*a^2*b*q*x^10-18*a^2*b*q*x^11-9*a^2*b*q^2*x^11-12*a^2*b*x^12-12*a^2*b*q*x^12-3*a^2*b*q^2*x^12-a^3*x^3-3*a^3*q*x^3-3*a^3*q^2*x^3-a^3*q^3*x^3-12*a^3*x^4-27*a^3*q*x^4-18*a^3*q^2*x^4-3*a^3*q^3*x^4-51*a^3*x^5-75*a^3*q*x^5-24*a^3*q^2*x^5-82*a^3*x^6-39*a^3*q*x^6+24*a^3*q^2*x^6+8*a^3*q^3*x^6-3*a^3*x^7+111*a^3*q*x^7+66*a^3*q^2*x^7+6*a^3*q^3*x^7+96*a^3*x^8+123*a^3*q*x^8+12*a^3*q^2*x^8-6*a^3*q^3*x^8+35*a^3*x^9-33*a^3*q*x^9-48*a^3*q^2*x^9-8*a^3*q^3*x^9-42*a^3*x^10-69*a^3*q*x^10-24*a^3*q^2*x^10-12*a^3*x^11+9*a^3*q^2*x^11+3*a^3*q^3*x^11+8*a^3*x^12+12*a^3*q*x^12+6*a^3*q^2*x^12+a^3*q^3*x^12

theorem vThirdSparse_expandM115 (a b c d e q T : ℤ[X]) :
 vThirdSparseM115 a b c d e q T=
 vJ0M115 a b c d e q X+T*vJ1M115 a b c d e q X+
 T^2*vJ2M115 a b c d e q X+T^3*vJ3M115 a b c d e q X := by
 simp only [vThirdSparseM115,vThirdClearedM115,boolMomentADB2,boolJetADB2,
   Bool.false_eq_true,if_false,if_true,vJ0M115,vJ1M115,vJ2M115,vJ3M115,
   vAPMDE6,vBLMDE6,vBPMDE6,vCLM115,vCPM115,vGLM115,vGPM115]
 ring

def vThirdNumeratorM115 (n : ℕ) (a b c d e : ℕ) : ℤ[X] :=
 vJ0M115 (a:ℤ[X]) b c d e (n+1) X+
 X^(n+1)*vJ1M115 (a:ℤ[X]) b c d e (n+1) X+
 X^(2*(n+1))*vJ2M115 (a:ℤ[X]) b c d e (n+1) X+
 X^(3*(n+1))*vJ3M115 (a:ℤ[X]) b c d e (n+1) X

theorem vThirdSeed_four_blocksM115 (n : ℕ) (rest : List Bool) :
 (1-X)^6*vThirdSeedMEA (X:ℤ[X]) n rest=
 vThirdNumeratorM115 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b) := by
 rw [vThirdSeed_sparseM115,vThirdSparse_expandM115]
 simp only [vThirdNumeratorM115,pow_mul,mul_comm 2 (n+1),mul_comm 3 (n+1)]

def vThirdValueM115 (n a b c d e j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1), (vThirdNumeratorM115 n a b c d e).coeff k*
   ((5+(j-k)).choose 5:ℤ)

theorem vThirdSeed_coeffM115 (n : ℕ) (rest : List Bool) (j : ℕ) :
 (vThirdSeedMEA (X:ℤ[X]) n rest).coeff j=
 vThirdValueM115 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b) j := by
 exact coeff_of_one_sub_mul_rangeBC _ _ 5 j (vThirdSeed_four_blocksM115 n rest)
end
end MathGKM.Markov
