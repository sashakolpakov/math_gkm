import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird65J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x+864*x^2+1968*x^3+864*x^4+72*x^5
theorem sThird65block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird65J0MAE2 q x=vJ0M115 6 1 0 0 0 q x := by
 simp only [sThird65J0MAE2,vJ0M115]
 ring
def sThird65J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -384*x^2-6048*x^3-14016*x^4-7872*x^5-576*x^6+96*x^7-192*q*x^2-1632*q*x^3-768*q*x^4+1536*q*x^5+960*q*x^6+96*q*x^7
theorem sThird65block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird65J1MAE2 q x=vJ1M115 6 1 0 0 0 q x := by
 simp only [sThird65J1MAE2,vJ1M115]
 ring
def sThird65J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 2520*x^3+16944*x^4+29496*x^5+12384*x^6-3576*x^7-528*x^8+360*x^9+3120*q*x^3+11136*q*x^4+4656*q*x^5-11904*q*x^6-8304*q*x^7+768*q*x^8+528*q*x^9+960*q^2*x^3+1152*q^2*x^4-1728*q^2*x^5-2304*q^2*x^6+576*q^2*x^7+1152*q^2*x^8+192*q^2*x^9
theorem sThird65block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird65J2MAE2 q x=vJ2M115 6 1 0 0 0 q x := by
 simp only [sThird65J2MAE2,vJ2M115]
 ring
def sThird65J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -336*x^3-4176*x^4-14808*x^5-17520*x^6-720*x^7+7344*x^8-1176*x^9-1968*x^10+720*x^11-876*q*x^3-6972*q*x^4-13944*q*x^5-108*q*x^6+20160*q*x^7+9324*q*x^8-6792*q*x^9-2244*q*x^10+1452*q*x^11-756*q^2*x^3-3456*q^2*x^4-2160*q^2*x^5+6912*q^2*x^6+7560*q^2*x^7-3456*q^2*x^8-5616*q^2*x^9+972*q^2*x^11-216*q^3*x^3-432*q^3*x^4+432*q^3*x^5+1296*q^3*x^6-1296*q^3*x^8-432*q^3*x^9+432*q^3*x^10+216*q^3*x^11
theorem sThird65block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird65J3MAE2 q x=vJ3M115 6 1 0 0 0 q x := by
 simp only [sThird65J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
