import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird41J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x^3+96*x^4+24*x^5
theorem sThird41block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird41J0MAE2 q x=vJ0M115 4 3 2 1 1 q x := by
 simp only [sThird41J0MAE2,vJ0M115]
 ring
def sThird41J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -96*x^3-1056*x^4-1056*x^5-96*x^6
theorem sThird41block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird41J1MAE2 q x=vJ1M115 4 3 2 1 1 q x := by
 simp only [sThird41J1MAE2,vJ1M115]
 ring
def sThird41J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x^3+1392*x^4+3480*x^5+1008*x^6+120*q*x^3+960*q*x^4+336*q*x^5-1344*q*x^6-72*q*x^7+48*q^2*x^3+96*q^2*x^4-192*q^2*x^5-96*q^2*x^6+144*q^2*x^7
theorem sThird41block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird41J2MAE2 q x=vJ2M115 4 3 2 1 1 q x := by
 simp only [sThird41J2MAE2,vJ2M115]
 ring
def sThird41J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -24*x^3-576*x^4-2088*x^5-1392*x^6+360*x^7-144*x^8+24*x^9-104*q*x^3-1152*q*x^4-1416*q*x^5+1728*q*x^6+1416*q*x^7-576*q*x^8+104*q*x^9-144*q^2*x^3-576*q^2*x^4+432*q^2*x^5+1152*q^2*x^6-432*q^2*x^7-576*q^2*x^8+144*q^2*x^9-64*q^3*x^3+192*q^3*x^5-192*q^3*x^7+64*q^3*x^9
theorem sThird41block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird41J3MAE2 q x=vJ3M115 4 3 2 1 1 q x := by
 simp only [sThird41J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
