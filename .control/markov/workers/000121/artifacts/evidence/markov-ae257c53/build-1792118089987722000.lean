import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird52J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 24*x^2+336*x^3+408*x^4+192*x^5
theorem sThird52block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird52J0MAE2 q x=vJ0M115 5 3 1 2 0 q x := by
 simp only [sThird52J0MAE2,vJ0M115]
 ring
def sThird52J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -576*x^3-3192*x^4-3984*x^5-888*x^6-192*q*x^3-216*q*x^4+72*q*x^5+312*q*x^6+24*q*x^7
theorem sThird52block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird52J1MAE2 q x=vJ1M115 5 3 1 2 0 q x := by
 simp only [sThird52J1MAE2,vJ1M115]
 ring
def sThird52J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 288*x^3+3672*x^4+9552*x^5+6048*x^6-432*x^7+72*x^8+504*q*x^3+2916*q*x^4+2160*q*x^5-3240*q*x^6-2664*q*x^7+324*q*x^8+216*q^2*x^3+324*q^2*x^4-432*q^2*x^5-648*q^2*x^6+216*q^2*x^7+324*q^2*x^8
theorem sThird52block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird52J2MAE2 q x=vJ2M115 5 3 1 2 0 q x := by
 simp only [sThird52J2MAE2,vJ2M115]
 ring
def sThird52J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -60*x^3-1200*x^4-4980*x^5-5640*x^6-132*x^7+960*x^8-588*x^9+120*x^10-235*q*x^3-2500*q*x^4-4785*q*x^5+1530*q*x^6+6435*q*x^7+600*q*x^8-1415*q*x^9+370*q*x^10-300*q^2*x^3-1425*q^2*x^4-150*q^2*x^5+3225*q^2*x^6+1200*q^2*x^7-2175*q^2*x^8-750*q^2*x^9+375*q^2*x^10-125*q^3*x^3-125*q^3*x^4+375*q^3*x^5+375*q^3*x^6-375*q^3*x^7-375*q^3*x^8+125*q^3*x^9+125*q^3*x^10
theorem sThird52block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird52J3MAE2 q x=vJ3M115 5 3 1 2 0 q x := by
 simp only [sThird52J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
