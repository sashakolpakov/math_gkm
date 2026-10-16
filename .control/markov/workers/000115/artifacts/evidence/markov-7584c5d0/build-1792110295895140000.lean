import MarkovVerticalJetClosedMDE6
import MarkovBinomialExtractBC
/-! Machine-authored 7584c5d0. Sparse integral numerator, all run lengths. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768

def vH0M758 {R : Type*} [CommRing R] (a r s q x : R) : R :=
 8*s*x-32*s*x^2+48*s*x^3-32*s*x^4+8*s*x^5-48*r*x^3+64*r*x^4-16*r*x^5+16*r^2*x^2-32*r^2*x^3+16*r^2*x^4+8*a*x^3-32*a*x^4+8*a*x^5+32*a*r*x^3-32*a*r*x^4+16*a^2*x^4

def vH1M758 {R : Type*} [CommRing R] (a r s q x : R) : R :=
 -8*r*x^2+48*r*x^3-32*r*x^4-48*r*x^5+40*r*x^6+16*r*q*x^2-32*r*q*x^4+16*r*q*x^6-8*r^2*x^2+16*r^2*x^4-8*r^2*x^6-24*a*x^3+8*a*x^4-8*a*x^5-40*a*x^6+16*a*q*x^3+16*a*q*x^4-16*a*q*x^5-16*a*q*x^6-32*a*r*x^3+32*a*r*x^5-8*a*r*q*x^2+16*a*r*q*x^4-8*a*r*q*x^6-24*a^2*x^4-16*a^2*x^5+8*a^2*x^6-8*a^2*q*x^3-8*a^2*q*x^4+8*a^2*q*x^5+8*a^2*q*x^6

def vH2M758 {R : Type*} [CommRing R] (a r s q x : R) : R :=
 2*x^2-4*x^3-2*x^4+8*x^5-2*x^6-4*x^7+2*x^8+3*r*x^2+4*r*x^3-1*r*x^4+1*r*x^6-4*r*x^7-3*r*x^8+1*r^2*x^2+2*r^2*x^3-1*r^2*x^4-4*r^2*x^5-1*r^2*x^6+2*r^2*x^7+1*r^2*x^8+16*a*x^3+21*a*x^4+12*a*x^5+22*a*x^6+12*a*x^7-3*a*x^8+3*a*q*x^2+4*a*q*x^3-1*a*q*x^4+1*a*q*x^6-4*a*q*x^7-3*a*q*x^8+6*a*r*x^3+10*a*r*x^4-4*a*r*x^5-12*a*r*x^6-2*a*r*x^7+2*a*r*x^8+2*a*r*q*x^2+4*a*r*q*x^3-2*a*r*q*x^4-8*a*r*q*x^5-2*a*r*q*x^6+4*a*r*q*x^7+2*a*r*q*x^8+9*a^2*x^4+12*a^2*x^5-2*a^2*x^6-4*a^2*x^7+1*a^2*x^8+6*a^2*q*x^3+10*a^2*q*x^4-4*a^2*q*x^5-12*a^2*q*x^6-2*a^2*q*x^7+2*a^2*q*x^8+1*a^2*q^2*x^2+2*a^2*q^2*x^3-1*a^2*q^2*x^4-4*a^2*q^2*x^5-1*a^2*q^2*x^6+2*a^2*q^2*x^7+1*a^2*q^2*x^8

theorem vN_sparseM758 (n a r s : ℕ) :
 (1-X)^4*vNseedMDE6 n a r s=
 vH0M758 (a:ℤ[X]) r s (n+1) X+
 X^(n+1)*vH1M758 (a:ℤ[X]) r s (n+1) X+
 X^(2*(n+1))*vH2M758 (a:ℤ[X]) r s (n+1) X := by
 obtain ⟨ha,hb,hf⟩ := vJet_closedMDE6 n
 obtain ⟨ha',hb',_⟩ := vJet_closedMDE6 (n+1)
 let A := vAJMDE6 n
 let A' := vAJMDE6 (n+1)
 let B := vBJMDE6 n
 let B' := vBJMDE6 (n+1)
 let F := vFJMDE6 n
 have hh : (1-X)^4*vNseedMDE6 n a r s =
   (((a:ℤ[X])-(r:ℤ[X]))*X*((1-X)^2*A)+(r:ℤ[X])*((1-X)^2*A'))^2-
   ((a:ℤ[X])-(r:ℤ[X]))*X^2*((1-X)^2*A)^2-(r:ℤ[X])*((1-X)^2*A')^2+
   X^(n+1)*X*(((a:ℤ[X])-(r:ℤ[X]))*X*(2*(1-X)^4*B)+(r:ℤ[X])*(2*(1-X)^4*B'))+
   2*X*((a:ℤ[X])*X^2*((1-X)*F)^2+4*(r:ℤ[X])*X*((1-X)*F)*(1-X)+4*(s:ℤ[X])*(1-X)^2)*(1-X)^2-
   2*(X+1)*X^(n+1)*X*(((a:ℤ[X])-(r:ℤ[X]))*X*((1-X)^2*A)+(r:ℤ[X])*((1-X)^2*A'))*(1-X)^2+
   2*(X+1)^2*(X^(n+1))^2*X^2*(1-X)^4 := by
   dsimp [vNseedMDE6,vNexprMDE6,A,A',B,B',F]; ring
 rw [hh]
 dsimp only [A,A',B,B',F]
 rw [ha,ha',hb,hb',hf]
 simp only [vAPMDE6,vBLMDE6,vBPMDE6,vH0M758,vH1M758,vH2M758,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_add,pow_mul,pow_succ]
 ring

def vNvalueM758 (n a r s j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1),
   (vH0M758 (a:ℤ[X]) r s (n+1) X+
    X^(n+1)*vH1M758 (a:ℤ[X]) r s (n+1) X+
    X^(2*(n+1))*vH2M758 (a:ℤ[X]) r s (n+1) X).coeff k *
    ((3+(j-k)).choose 3:ℤ)

theorem vN_coeffM758 (n a r s j : ℕ) :
 (vNseedMDE6 n a r s).coeff j=vNvalueM758 n a r s j := by
 exact coeff_of_one_sub_mul_rangeBC _ _ 3 j (vN_sparseM758 n a r s)
end
end MathGKM.Markov
