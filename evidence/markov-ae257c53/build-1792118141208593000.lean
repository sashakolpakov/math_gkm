import MarkovThirdSparseM115
/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def sThird61J0MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x^3+864*x^4+1968*x^5+864*x^6+72*x^7
theorem sThird61block0MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird61J0MAE2 q x=vJ0M115 6 5 4 1 3 q x := by
 simp only [sThird61J0MAE2,vJ0M115]
 ring
def sThird61J1MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -96*x^3-2496*x^4-10944*x^5-12480*x^6-2784*x^7-96*q*x^3-960*q*x^4-1536*q*x^5+768*q*x^6+1632*q*x^7+192*q*x^8
theorem sThird61block1MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird61J1MAE2 q x=vJ1M115 6 5 4 1 3 q x := by
 simp only [sThird61J1MAE2,vJ1M115]
 ring
def sThird61J2MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 72*x^3+2544*x^4+15336*x^5+26976*x^6+13272*x^7-720*x^8+120*x^9+240*q*x^3+3840*q*x^4+10608*q*x^5+2688*q*x^6-11568*q*x^7-6528*q*x^8+720*q*x^9+192*q^2*x^3+1152*q^2*x^4+576*q^2*x^5-2304*q^2*x^6-1728*q^2*x^7+1152*q^2*x^8+960*q^2*x^9
theorem sThird61block2MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird61J2MAE2 q x=vJ2M115 6 5 4 1 3 q x := by
 simp only [sThird61J2MAE2,vJ2M115]
 ring
def sThird61J3MAE2 {R : Type*} [CommRing R] (q x : R) : R :=
 -24*x^3-936*x^4-6600*x^5-14760*x^6-10800*x^7-24*x^8+984*x^9-600*x^10+120*x^11-156*q*x^3-2940*q*x^4-10488*q*x^5-7596*q*x^6+10080*q*x^7+12204*q*x^8+120*q*x^9-1668*q*x^10+444*q*x^11-324*q^2*x^3-2592*q^2*x^4-3024*q^2*x^5+4320*q^2*x^6+7560*q^2*x^7-864*q^2*x^8-4752*q^2*x^9-864*q^2*x^10+540*q^2*x^11-216*q^3*x^3-432*q^3*x^4+432*q^3*x^5+1296*q^3*x^6-1296*q^3*x^8-432*q^3*x^9+432*q^3*x^10+216*q^3*x^11
theorem sThird61block3MAE2 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*sThird61J3MAE2 q x=vJ3M115 6 5 4 1 3 q x := by
 simp only [sThird61J3MAE2,vJ3M115]
 ring
end
end MathGKM.Markov
