import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird51J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x^3+480*x^4+360*x^5+48*x^6
theorem sThird51block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird51J0MAE2 q x=vJ0M115 5 4 3 1 2 q x := by
 simp only [sThird51J0MAE2,vJ0M115]
 ring
def sThird51J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -96*x^3-1776*x^4-4680*x^5-2016*x^6-72*x^7-48*q*x^3-312*q*x^4-120*q*x^5+408*q*x^6+72*q*x^7
theorem sThird51block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird51J1MAE2 q x=vJ1M115 5 4 3 1 2 q x := by
 simp only [sThird51J1MAE2,vJ1M115]
 ring
def sThird51J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x^3+1968*x^4+8352*x^5+8208*x^6+600*x^7+180*q*x^3+2160*q*x^4+3384*q*x^5-2304*q*x^6-3564*q*x^7+144*q*x^8+108*q^2*x^3+432*q^2*x^4-216*q^2*x^5-864*q^2*x^6+108*q^2*x^7+432*q^2*x^8
theorem sThird51block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird51J2MAE2 q x=vJ2M115 5 4 3 1 2 q x := by
 simp only [sThird51J2MAE2,vJ2M115]
 ring
def sThird51J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -24*x^3-756*x^4-4032*x^5-5820*x^6-1368*x^7+756*x^8-336*x^9+60*x^10-130*q*x^3-1945*q*x^4-4680*q*x^5+285*q*x^6+5910*q*x^7+1425*q*x^8-1100*q*x^9+235*q*x^10-225*q^2*x^3-1350*q^2*x^4-375*q^2*x^5+3000*q^2*x^6+1425*q^2*x^7-1950*q^2*x^8-825*q^2*x^9+300*q^2*x^10-125*q^3*x^3-125*q^3*x^4+375*q^3*x^5+375*q^3*x^6-375*q^3*x^7-375*q^3*x^8+125*q^3*x^9+125*q^3*x^10
theorem sThird51block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird51J3MAE2 q x=vJ3M115 5 4 3 1 2 q x := by
 simp only [sThird51J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
