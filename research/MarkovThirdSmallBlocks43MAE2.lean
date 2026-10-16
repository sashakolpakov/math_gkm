import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird43J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 24*x+96*x^2+72*x^3
theorem sThird43block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird43J0MAE2 q x=vJ0M115 4 1 0 0 0 q x := by
 simp only [sThird43J0MAE2,vJ0M115]
 ring
def sThird43J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -96*x^2-1056*x^3-1056*x^4-96*x^5
theorem sThird43block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird43J1MAE2 q x=vJ1M115 4 1 0 0 0 q x := by
 simp only [sThird43J1MAE2,vJ1M115]
 ring
def sThird43J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 720*x^3+3312*x^4+2040*x^5-144*x^6+24*x^7+648*q*x^3+960*q*x^4-1104*q*x^5-576*q*x^6+72*q*x^7+144*q^2*x^3-96*q^2*x^4-192*q^2*x^5+96*q^2*x^6+48*q^2*x^7
theorem sThird43block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird43J2MAE2 q x=vJ2M115 4 1 0 0 0 q x := by
 simp only [sThird43J2MAE2,vJ2M115]
 ring
def sThird43J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -120*x^3-1296*x^4-2664*x^5-240*x^6+936*x^7-576*x^8+120*x^9-296*q*x^3-1728*q*x^4-840*q*x^5+2880*q*x^6+840*q*x^7-1152*q*x^8+296*q*x^9-240*q^2*x^3-576*q^2*x^4+720*q^2*x^5+1152*q^2*x^6-720*q^2*x^7-576*q^2*x^8+240*q^2*x^9-64*q^3*x^3+192*q^3*x^5-192*q^3*x^7+64*q^3*x^9
theorem sThird43block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*sThird43J3MAE2 q x=vJ3M115 4 1 0 0 0 q x := by
 simp only [sThird43J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
