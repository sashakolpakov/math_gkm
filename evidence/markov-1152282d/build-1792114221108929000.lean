import MarkovThirdInverseM115
/-! Machine-authored 1152282d. Literal integer quintic sequence, zero extended. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

def vJ0c1M115 (a b c d e q : ℤ) : ℤ :=
 24*d+48*c-72*b+24*a

def vJ0c2M115 (a b c d e q : ℤ) : ℤ :=
 24*e-144*d-480*c+744*b-96*b*c+192*b^2-288*a+96*a*c-288*a*b+96*a^2

def vJ0c3M115 (a b c d e q : ℤ) : ℤ :=
 -144*e+360*d+1296*c-1808*b+480*b*c-960*b^2-64*b^3+656*a-384*a*c+1248*a*b+192*a*b^2-384*a^2-192*a^2*b+64*a^3

def vJ0c4M115 (a b c d e q : ℤ) : ℤ :=
 360*e-480*d-1344*c+1296*b-960*b*c+1344*b^2+192*b^3-288*a+576*a*c-1056*a*b-384*a*b^2+96*a^2+192*a^2*b

def vJ0c5M115 (a b c d e q : ℤ) : ℤ :=
 -480*e+360*d+336*c-168*b+960*b*c-576*b^2-192*b^3+24*a-384*a*c+96*a*b+192*a*b^2

def vJ0c6M115 (a b c d e q : ℤ) : ℤ :=
 360*e-144*d+288*c+8*b-480*b*c+64*b^3+96*a*c

def vJ0c7M115 (a b c d e q : ℤ) : ℤ :=
 -144*e+24*d-144*c+96*b*c

def vJ0c8M115 (a b c d e q : ℤ) : ℤ :=
 24*e

def vJ1c2M115 (a b c d e q : ℤ) : ℤ :=
 24*c+96*c*q-48*b-192*b*q+24*b*c-48*b^2+24*a+96*a*q-24*a*c-24*a*c*q+72*a*b+48*a*b*q-24*a^2-24*a^2*q

def vJ1c3M115 (a b c d e q : ℤ) : ℤ :=
 264*c-288*c*q-528*b+576*b*q-72*b*c+96*b^2+192*b^2*q+48*b^3+264*a-288*a*q+72*a*c*q+24*a*b-528*a*b*q-144*a*b^2-48*a*b^2*q-48*a^2+264*a^2*q+144*a^2*b+96*a^2*b*q-48*a^3-48*a^3*q

def vJ1c4M115 (a b c d e q : ℤ) : ℤ :=
 -1128*c+96*c*q+1824*b+384*b*q+24*b*c+624*b^2-192*b^2*q-48*b^3-768*a-384*a*q+216*a*c-24*a*c*q-1440*a*b-96*a*b*q-96*a*b^2+48*a*b^2*q+576*a^2+288*a^2*q+336*a^2*b-192*a^3-48*a^3*q

def vJ1c5M115 (a b c d e q : ℤ) : ℤ :=
 1224*c+480*c*q-1056*b-1152*b*q+120*b*c-1152*b^2-384*b^2*q-96*b^3+384*a+384*a*q-336*a*c-120*a*c*q+1344*a*b+1056*a*b*q+480*a*b^2+96*a*b^2*q-288*a^2-288*a^2*q-336*a^2*b-192*a^2*b*q-48*a^3+48*a^3*q

def vJ1c6M115 (a b c d e q : ℤ) : ℤ :=
 264*c-480*c*q-1776*b-192*b*q-120*b*c-144*b^2+384*b^2*q+96*b^3+1128*a+288*a*q+24*a*c+120*a*c*q+1368*a*b+48*a*b*q-96*a*b^2*q-840*a^2-264*a^2*q-336*a^2*b+96*a^3+48*a^3*q

def vJ1c7M115 (a b c d e q : ℤ) : ℤ :=
 -1320*c-96*c*q+1584*b+576*b*q-24*b*c+1056*b^2+192*b^2*q+48*b^3-264*a-96*a*q+288*a*c+24*a*c*q-1368*a*b-528*a*b*q-336*a*b^2-48*a*b^2*q+48*a^2+24*a^2*q+192*a^2*b+96*a^2*b*q

def vJ1c8M115 (a b c d e q : ℤ) : ℤ :=
 840*c+288*c*q+72*b*c-432*b^2-192*b^2*q-48*b^3-216*a*c-72*a*c*q+96*a*b^2+48*a*b^2*q

def vJ1c9M115 (a b c d e q : ℤ) : ℤ :=
 -168*c-96*c*q-24*b*c+48*a*c+24*a*c*q

def vJ2c3M115 (a b c d e q : ℤ) : ℤ :=
 -24*b+72*b*q-48*b*q^2+36*b^2-48*b^2*q-12*b^3+24*a-72*a*q+48*a*q^2-72*a*b+60*a*b*q+48*a*b*q^2+36*a*b^2+24*a*b^2*q+36*a^2-12*a^2*q-48*a^2*q^2-36*a^2*b-48*a^2*b*q-12*a^2*b*q^2+12*a^3+24*a^3*q+12*a^3*q^2

def vJ2c4M115 (a b c d e q : ℤ) : ℤ :=
 336*b-168*b*q-48*b*q^2-84*b^2-48*b^2*q-12*b^3-192*a+96*a*q^2-108*a*b+372*a*b*q+48*a*b*q^2+120*a*b^2+24*a*b^2*q+192*a^2-240*a^2*q-96*a^2*q^2-204*a^2*b-144*a^2*b*q-12*a^2*b*q^2+96*a^3+120*a^3*q+24*a^3*q^2

def vJ2c5M115 (a b c d e q : ℤ) : ℤ :=
 -336*b-120*b*q+144*b*q^2-60*b^2+144*b^2*q+36*b^3+240*a-72*a*q-48*a*q^2+252*a*b-36*a*b*q-144*a*b*q^2-36*a*b^2-72*a*b^2*q+144*a^2-156*a^2*q+48*a^2*q^2-216*a^2*b+48*a^2*b*q+36*a^2*b*q^2+216*a^3+96*a^3*q-12*a^3*q^2

def vJ2c6M115 (a b c d e q : ℤ) : ℤ :=
 -216*b+600*b*q+144*b*q^2+300*b^2+144*b^2*q+36*b^3+480*a-576*a*q-192*a*q^2-576*a*b-972*a*b*q-144*a*b*q^2-288*a*b^2-72*a*b^2*q+624*a^2+576*a^2*q+192*a^2*q^2+312*a^2*b+336*a^2*b*q+36*a^2*b*q^2+48*a^3-144*a^3*q-48*a^3*q^2

def vJ2c7M115 (a b c d e q : ℤ) : ℤ :=
 840*b+24*b*q-144*b*q^2+12*b^2-144*b^2*q-36*b^3+24*a-216*a*q-48*a*q^2-816*a*b-108*a*b*q+144*a*b*q^2-36*a*b^2+72*a*b^2*q+1044*a^2+444*a^2*q+48*a^2*q^2+396*a^2*b+48*a^2*b*q-36*a^2*b*q^2-180*a^3-168*a^3*q-12*a^3*q^2

def vJ2c8M115 (a b c d e q : ℤ) : ℤ :=
 -480*b-696*b*q-144*b*q^2-348*b^2-144*b^2*q-36*b^3+672*a+576*a*q+96*a*q^2+948*a*b+828*a*b*q+144*a*b*q^2+216*a*b^2+72*a*b^2*q+48*a^2-336*a^2*q-96*a^2*q^2-156*a^2*b-240*a^2*b*q-36*a^2*b*q^2-48*a^3+24*a^3*q+24*a^3*q^2

def vJ2c9M115 (a b c d e q : ℤ) : ℤ :=
 -480*b+24*b*q+48*b*q^2+12*b^2+48*b^2*q+12*b^3+672*a+360*a*q+48*a*q^2+636*a*b+84*a*b*q-48*a*b*q^2+36*a*b^2-24*a*b^2*q-360*a^2-276*a^2*q-48*a^2*q^2-144*a^2*b-48*a^2*b*q+12*a^2*b*q^2+48*a^3+48*a^3*q+12*a^3*q^2

def vJ2c10M115 (a b c d e q : ℤ) : ℤ :=
 360*b+264*b*q+48*b*q^2+132*b^2+48*b^2*q+12*b^3-264*a*b-228*a*b*q-48*a*b*q^2-48*a*b^2-24*a*b^2*q+48*a^2*b+48*a^2*b*q+12*a^2*b*q^2

def vJ3c3M115 (a b c d e q : ℤ) : ℤ :=
 -6+11*b-6*b^2+b^3-11*a-11*a*q+12*a*b+12*a*b*q-3*a*b^2-3*a*b^2*q-6*a^2-12*a^2*q-6*a^2*q^2+3*a^2*b+6*a^2*b*q+3*a^2*b*q^2-a^3-3*a^3*q-3*a^3*q^2-a^3*q^3

def vJ3c4M115 (a b c d e q : ℤ) : ℤ :=
 18+21*b-18*b^2+3*b^3-111*a-21*a*q+93*a*b+36*a*b*q-18*a*b^2-9*a*b^2*q-75*a^2-93*a^2*q-18*a^2*q^2+27*a^2*b+36*a^2*b*q+9*a^2*b*q^2-12*a^3-27*a^3*q-18*a^3*q^2-3*a^3*q^3

def vJ3c5M115 (a b c d e q : ℤ) : ℤ :=
 36*b-12*b^2-243*a-36*a*q+177*a*b+24*a*b*q-24*a*b^2-282*a^2-177*a^2*q-12*a^2*q^2+75*a^2*b+48*a^2*b*q-51*a^3-75*a^3*q-24*a^3*q^2

def vJ3c6M115 (a b c d e q : ℤ) : ℤ :=
 -48+92*b+12*b^2-8*b^3-509*a-92*a*q+93*a*b-24*a*b*q+24*a*b^2+24*a*b^2*q-381*a^2-93*a^2*q+12*a^2*q^2+39*a^2*b-48*a^2*b*q-24*a^2*b*q^2-82*a^3-39*a^3*q+24*a^3*q^2+8*a^3*q^3

def vJ3c7M115 (a b c d e q : ℤ) : ℤ :=
 36+66*b+24*b^2-6*b^3-873*a-66*a*q-39*a*b-48*a*b*q+66*a*b^2+18*a*b^2*q-240*a^2+39*a^2*q+24*a^2*q^2-111*a^2*b-132*a^2*b*q-18*a^2*b*q^2-3*a^3+111*a^3*q+66*a^3*q^2+6*a^3*q^3

def vJ3c8M115 (a b c d e q : ℤ) : ℤ :=
 36-66*b+24*b^2+6*b^3-675*a+66*a*q-105*a*b-48*a*b*q+12*a*b^2-18*a*b^2*q-141*a^2+105*a^2*q+24*a^2*q^2-123*a^2*b-24*a^2*b*q+18*a^2*b*q^2+96*a^3+123*a^3*q+12*a^3*q^2-6*a^3*q^3

def vJ3c9M115 (a b c d e q : ℤ) : ℤ :=
 -48-92*b+12*b^2+8*b^3-233*a+92*a*q-165*a*b-24*a*b*q-48*a*b^2-24*a*b^2*q+6*a^2+165*a^2*q+12*a^2*q^2+33*a^2*b+96*a^2*b*q+24*a^2*b*q^2+35*a^3-33*a^3*q-48*a^3*q^2-8*a^3*q^3

def vJ3c10M115 (a b c d e q : ℤ) : ℤ :=
 -36*b-12*b^2-135*a+36*a*q-105*a*b+24*a*b*q-24*a*b^2+141*a^2+105*a^2*q-12*a^2*q^2+69*a^2*b+48*a^2*b*q-42*a^3-69*a^3*q-24*a^3*q^2

def vJ3c11M115 (a b c d e q : ℤ) : ℤ :=
 18-21*b-18*b^2-3*b^3-48*a+21*a*q+15*a*b+36*a*b*q+9*a*b^2+9*a*b^2*q+42*a^2-15*a^2*q-18*a^2*q^2-18*a^2*b*q-9*a^2*b*q^2-12*a^3+9*a^3*q^2+3*a^3*q^3

def vJ3c12M115 (a b c d e q : ℤ) : ℤ :=
 -6-11*b-6*b^2-b^3+22*a+11*a*q+24*a*b+12*a*b*q+6*a*b^2+3*a*b^2*q-24*a^2-24*a^2*q-6*a^2*q^2-12*a^2*b-12*a^2*b*q-3*a^2*b*q^2+8*a^3+12*a^3*q+6*a^3*q^2+a^3*q^3

def vEM115 (a b c d e q j : ℤ) : ℤ :=
 vJ0c1M115 a b c d e q*vFallM115 (j-0*q) 1+
 vJ0c2M115 a b c d e q*vFallM115 (j-0*q) 2+
 vJ0c3M115 a b c d e q*vFallM115 (j-0*q) 3+
 vJ0c4M115 a b c d e q*vFallM115 (j-0*q) 4+
 vJ0c5M115 a b c d e q*vFallM115 (j-0*q) 5+
 vJ0c6M115 a b c d e q*vFallM115 (j-0*q) 6+
 vJ0c7M115 a b c d e q*vFallM115 (j-0*q) 7+
 vJ0c8M115 a b c d e q*vFallM115 (j-0*q) 8+
 vJ1c2M115 a b c d e q*vFallM115 (j-1*q) 2+
 vJ1c3M115 a b c d e q*vFallM115 (j-1*q) 3+
 vJ1c4M115 a b c d e q*vFallM115 (j-1*q) 4+
 vJ1c5M115 a b c d e q*vFallM115 (j-1*q) 5+
 vJ1c6M115 a b c d e q*vFallM115 (j-1*q) 6+
 vJ1c7M115 a b c d e q*vFallM115 (j-1*q) 7+
 vJ1c8M115 a b c d e q*vFallM115 (j-1*q) 8+
 vJ1c9M115 a b c d e q*vFallM115 (j-1*q) 9+
 vJ2c3M115 a b c d e q*vFallM115 (j-2*q) 3+
 vJ2c4M115 a b c d e q*vFallM115 (j-2*q) 4+
 vJ2c5M115 a b c d e q*vFallM115 (j-2*q) 5+
 vJ2c6M115 a b c d e q*vFallM115 (j-2*q) 6+
 vJ2c7M115 a b c d e q*vFallM115 (j-2*q) 7+
 vJ2c8M115 a b c d e q*vFallM115 (j-2*q) 8+
 vJ2c9M115 a b c d e q*vFallM115 (j-2*q) 9+
 vJ2c10M115 a b c d e q*vFallM115 (j-2*q) 10+
 vJ3c3M115 a b c d e q*vFallM115 (j-3*q) 3+
 vJ3c4M115 a b c d e q*vFallM115 (j-3*q) 4+
 vJ3c5M115 a b c d e q*vFallM115 (j-3*q) 5+
 vJ3c6M115 a b c d e q*vFallM115 (j-3*q) 6+
 vJ3c7M115 a b c d e q*vFallM115 (j-3*q) 7+
 vJ3c8M115 a b c d e q*vFallM115 (j-3*q) 8+
 vJ3c9M115 a b c d e q*vFallM115 (j-3*q) 9+
 vJ3c10M115 a b c d e q*vFallM115 (j-3*q) 10+
 vJ3c11M115 a b c d e q*vFallM115 (j-3*q) 11+
 vJ3c12M115 a b c d e q*vFallM115 (j-3*q) 12

theorem vThird_coeff_scaledM115 (n : ℕ) (rest : List Bool) (j : ℕ) :
 120*(vThirdSeedMEA (X:ℤ[X]) n rest).coeff j=
 vEM115 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) (n+1) j := by
 let a := (frame rest).mid.b
 let b := (frame rest).mid.a
 let c := 2*b-a
 let d := min (a-b) (3*b-a)
 let e := 3*b-2*a
 have hs := vThirdSeed_four_blocksM115 n rest
 change (1-X)^6*vThirdSeedMEA (X:ℤ[X]) n rest=vThirdNumeratorM115 n a b c d e at hs
 have he : vThirdNumeratorM115 n a b c d e=
 C (vJ0c1M115 a b c d e (n+1))*X^(0*(n+1)+1)+
 C (vJ0c2M115 a b c d e (n+1))*X^(0*(n+1)+2)+
 C (vJ0c3M115 a b c d e (n+1))*X^(0*(n+1)+3)+
 C (vJ0c4M115 a b c d e (n+1))*X^(0*(n+1)+4)+
 C (vJ0c5M115 a b c d e (n+1))*X^(0*(n+1)+5)+
 C (vJ0c6M115 a b c d e (n+1))*X^(0*(n+1)+6)+
 C (vJ0c7M115 a b c d e (n+1))*X^(0*(n+1)+7)+
 C (vJ0c8M115 a b c d e (n+1))*X^(0*(n+1)+8)+
 C (vJ1c2M115 a b c d e (n+1))*X^(1*(n+1)+2)+
 C (vJ1c3M115 a b c d e (n+1))*X^(1*(n+1)+3)+
 C (vJ1c4M115 a b c d e (n+1))*X^(1*(n+1)+4)+
 C (vJ1c5M115 a b c d e (n+1))*X^(1*(n+1)+5)+
 C (vJ1c6M115 a b c d e (n+1))*X^(1*(n+1)+6)+
 C (vJ1c7M115 a b c d e (n+1))*X^(1*(n+1)+7)+
 C (vJ1c8M115 a b c d e (n+1))*X^(1*(n+1)+8)+
 C (vJ1c9M115 a b c d e (n+1))*X^(1*(n+1)+9)+
 C (vJ2c3M115 a b c d e (n+1))*X^(2*(n+1)+3)+
 C (vJ2c4M115 a b c d e (n+1))*X^(2*(n+1)+4)+
 C (vJ2c5M115 a b c d e (n+1))*X^(2*(n+1)+5)+
 C (vJ2c6M115 a b c d e (n+1))*X^(2*(n+1)+6)+
 C (vJ2c7M115 a b c d e (n+1))*X^(2*(n+1)+7)+
 C (vJ2c8M115 a b c d e (n+1))*X^(2*(n+1)+8)+
 C (vJ2c9M115 a b c d e (n+1))*X^(2*(n+1)+9)+
 C (vJ2c10M115 a b c d e (n+1))*X^(2*(n+1)+10)+
 C (vJ3c3M115 a b c d e (n+1))*X^(3*(n+1)+3)+
 C (vJ3c4M115 a b c d e (n+1))*X^(3*(n+1)+4)+
 C (vJ3c5M115 a b c d e (n+1))*X^(3*(n+1)+5)+
 C (vJ3c6M115 a b c d e (n+1))*X^(3*(n+1)+6)+
 C (vJ3c7M115 a b c d e (n+1))*X^(3*(n+1)+7)+
 C (vJ3c8M115 a b c d e (n+1))*X^(3*(n+1)+8)+
 C (vJ3c9M115 a b c d e (n+1))*X^(3*(n+1)+9)+
 C (vJ3c10M115 a b c d e (n+1))*X^(3*(n+1)+10)+
 C (vJ3c11M115 a b c d e (n+1))*X^(3*(n+1)+11)+
 C (vJ3c12M115 a b c d e (n+1))*X^(3*(n+1)+12) := by
   simp only [vThirdNumeratorM115,vJ0M115,vJ1M115,vJ2M115,vJ3M115,vJ0c1M115,vJ0c2M115,vJ0c3M115,vJ0c4M115,vJ0c5M115,vJ0c6M115,vJ0c7M115,vJ0c8M115,vJ1c2M115,vJ1c3M115,vJ1c4M115,vJ1c5M115,vJ1c6M115,vJ1c7M115,vJ1c8M115,vJ1c9M115,vJ2c3M115,vJ2c4M115,vJ2c5M115,vJ2c6M115,vJ2c7M115,vJ2c8M115,vJ2c9M115,vJ2c10M115,vJ3c3M115,vJ3c4M115,vJ3c5M115,vJ3c6M115,vJ3c7M115,vJ3c8M115,vJ3c9M115,vJ3c10M115,vJ3c11M115,vJ3c12M115,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [he] at hs
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 5 j hs
 change (vThirdSeedMEA (X:ℤ[X]) n rest).coeff j=vInvM115 _ j at hc
 rw [hc]
 simp only [vInv_addM115,mul_add,vInv_monomialM115]
 have hshift (j q k : ℤ) : vFallM115 j (q+k)=vFallM115 (j-q) k := by
   unfold vFallM115
   split_ifs <;> first | omega | ring
 simp only [vEM115,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   zero_mul,zero_add,one_mul,hshift]
 rfl
end
end MathGKM.Markov
