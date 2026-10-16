import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird54J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 48*x+360*x^2+480*x^3+72*x^4
theorem sThird54block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird54J0MAE2 q x=vJ0M115 5 1 0 0 0 q x := by
 simp only [sThird54J0MAE2,vJ0M115]
 ring
def sThird54J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -216*x^2-2832*x^3-4440*x^4-1152*x^5-72*q*x^2-408*q*x^3+120*q*x^4+312*q*x^5+48*q*x^6
theorem sThird54block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird54J1MAE2 q x=vJ1M115 5 1 0 0 0 q x := by
 simp only [sThird54J1MAE2,vJ1M115]
 ring
def sThird54J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 1440*x^3+8160*x^4+9360*x^5+720*x^6-624*x^7+144*x^8+1584*q*x^3+3996*q*x^4-1152*q*x^5-4248*q*x^6-432*q*x^7+252*q*x^8+432*q^2*x^3+108*q^2*x^4-864*q^2*x^5-216*q^2*x^6+432*q^2*x^7+108*q^2*x^8
theorem sThird54block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird54J2MAE2 q x=vJ2M115 5 1 0 0 0 q x := by
 simp only [sThird54J2MAE2,vJ2M115]
 ring
def sThird54J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -210*x^3-2436*x^4-6894*x^5-4488*x^6+2610*x^7+828*x^8-1266*x^9+336*x^10-535*q*x^3-3700*q*x^4-4725*q*x^5+4290*q*x^6+7215*q*x^7-1320*q*x^8-1955*q*x^9+730*q*x^10-450*q^2*x^3-1575*q^2*x^4+300*q^2*x^5+3675*q^2*x^6+750*q^2*x^7-2625*q^2*x^8-600*q^2*x^9+525*q^2*x^10-125*q^3*x^3-125*q^3*x^4+375*q^3*x^5+375*q^3*x^6-375*q^3*x^7-375*q^3*x^8+125*q^3*x^9+125*q^3*x^10
theorem sThird54block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*sThird54J3MAE2 q x=vJ3M115 5 1 0 0 0 q x := by
 simp only [sThird54J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
