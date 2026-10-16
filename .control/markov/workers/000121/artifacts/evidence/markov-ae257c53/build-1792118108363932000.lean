import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird53J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 192*x^2+408*x^3+336*x^4+24*x^5
theorem sThird53block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird53J0MAE2 q x=vJ0M115 5 2 0 1 0 q x := by
 simp only [sThird53J0MAE2,vJ0M115]
 ring
def sThird53J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -48*x^2-1512*x^3-4128*x^4-2760*x^5-192*x^6-24*q*x^2-312*q*x^3-72*q*x^4+216*q*x^5+192*q*x^6
theorem sThird53block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird53J1MAE2 q x=vJ1M115 5 2 0 1 0 q x := by
 simp only [sThird53J1MAE2,vJ1M115]
 ring
def sThird53J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 720*x^3+5760*x^4+9936*x^5+3504*x^6-864*x^7+144*x^8+972*q*x^3+3528*q*x^4+648*q*x^5-3888*q*x^6-1620*q*x^7+360*q*x^8+324*q^2*x^3+216*q^2*x^4-648*q^2*x^5-432*q^2*x^6+324*q^2*x^7+216*q^2*x^8
theorem sThird53block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird53J2MAE2 q x=vJ2M115 5 2 0 1 0 q x := by
 simp only [sThird53J2MAE2,vJ2M115]
 ring
def sThird53J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -120*x^3-1758*x^4-5940*x^5-5202*x^6+1200*x^7+990*x^8-900*x^9+210*x^10-370*q*x^3-3085*q*x^4-4800*q*x^5+2865*q*x^6+6870*q*x^7-315*q*x^8-1700*q*x^9+535*q*x^10-375*q^2*x^3-1500*q^2*x^4+75*q^2*x^5+3450*q^2*x^6+975*q^2*x^7-2400*q^2*x^8-675*q^2*x^9+450*q^2*x^10-125*q^3*x^3-125*q^3*x^4+375*q^3*x^5+375*q^3*x^6-375*q^3*x^7-375*q^3*x^8+125*q^3*x^9+125*q^3*x^10
theorem sThird53block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird53J3MAE2 q x=vJ3M115 5 2 0 1 0 q x := by
 simp only [sThird53J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
