import MarkovVerticalJetClosedMDE6
/-! Machine-authored 1152282d. Third-order and off-diagonal run jets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option linter.unusedSimpArgs false

def vCJM115 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).a.coeff 3
def vGJM115 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).b.coeff 2

theorem vJet3_recurrencesM115 (n : ℕ) :
 vCJM115 (n+2)=(X+1)*vCJM115 (n+1)+(X+1)^2*vBJMDE6 (n+1)-X*vCJM115 n ∧
 vGJM115 (n+2)=(X+1)*vGJM115 (n+1)+(X+1)^2*vFJMDE6 (n+1)-X*vGJM115 n := by
 have h := vKa_cayleyMDE6 (X:ℤ[X]) (vKwordM9E1 X (runBlock025 n))
 rw [←vPolyRun_stepMDE6,←vPolyRun_stepMDE6] at h
 have hc := congrArg (fun p : BiPoly => p.coeff 3) h.1
 have hg := congrArg (fun p : BiPoly => p.coeff 2) h.2
 simp only [Polynomial.coeff_sub,add_mul,mul_assoc,Polynomial.coeff_add,
   Polynomial.coeff_C_mul,Polynomial.coeff_X_mul] at hc hg
 constructor
 · simpa only [vCJM115,vBJMDE6,add_mul,one_mul,Nat.add_assoc] using hc
 · simpa only [vGJM115,vFJMDE6,add_mul,one_mul,Nat.add_assoc] using hg

def vCLM115 (q : ℤ[X]) : ℤ[X] :=
 30*X+252*X^2+786*X^3+1224*X^4+1026*X^5+444*X^6+78*X^7-36*q*X-168*q*X^2-252*q*X^3-48*q*X^4+228*q*X^5+216*q*X^6+60*q*X^7+12*q^2*X+24*q^2*X^2-12*q^2*X^3-48*q^2*X^4-12*q^2*X^5+24*q^2*X^6+12*q^2*X^7

def vCPM115 (q : ℤ[X]) : ℤ[X] :=
 -30*X-252*X^2-786*X^3-1224*X^4-1026*X^5-444*X^6-78*X^7-2*q-51*q*X-222*q*X^2-350*q*X^3-114*q*X^4+276*q*X^5+326*q*X^6+126*q*X^7+12*q*X^8-q*X^9-3*q^2-24*q^2*X-48*q^2*X^2+90*q^2*X^4+72*q^2*X^5-24*q^2*X^6-48*q^2*X^7-15*q^2*X^8-q^3-3*q^3*X+8*q^3*X^3+6*q^3*X^4-6*q^3*X^5-8*q^3*X^6+3*q^3*X^8+q^3*X^9

def vGLM115 (q : ℤ[X]) : ℤ[X] :=
 -1-5*X-7*X^2-3*X^3+2*q+2*q*X-2*q*X^2-2*q*X^3

def vGPM115 (q : ℤ[X]) : ℤ[X] :=
 1+5*X+7*X^2+3*X^3+q+2*q*X-2*q*X^3-q*X^4

theorem vCJM115_initial0 : vCJM115 0=0 := by
 norm_num [vCJM115,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
   vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   Polynomial.coeff_one,Polynomial.coeff_X]
 <;> ring

theorem vCJM115_initial1 : vCJM115 1=X+4*X^2+6*X^3+4*X^4+X^5 := by
 norm_num [vCJM115,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
   vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   Polynomial.coeff_one,Polynomial.coeff_X]
 <;> ring

theorem vGJM115_initial0 : vGJM115 0=1+2*X+X^2 := by
 norm_num [vGJM115,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
   vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   Polynomial.coeff_one,Polynomial.coeff_X]
 <;> ring

theorem vGJM115_initial1 : vGJM115 1=3+8*X+7*X^2+2*X^3 := by
 norm_num [vGJM115,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
   vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   Polynomial.coeff_one,Polynomial.coeff_X]
 <;> ring

theorem vJet3_closedM115 (n : ℕ) :
 6*(1-X)^6*vCJM115 n=vCLM115 (n+1)+X^(n+1)*vCPM115 (n+1) ∧
 (1-X)^3*vGJM115 n=vGLM115 (n+1)+X^(n+1)*vGPM115 (n+1) := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [vCJM115_initial0,vGJM115_initial0]
   constructor <;> norm_num [vCLM115,vCPM115,vGLM115,vGPM115] <;> ring
 | one =>
   rw [vCJM115_initial1,vGJM115_initial1]
   constructor <;> norm_num [vCLM115,vCPM115,vGLM115,vGPM115] <;> ring
 | more n h0 h1 =>
   obtain ⟨hc,hg⟩ := vJet3_recurrencesM115 n
   obtain ⟨_,hb,hf⟩ := vJet_closedMDE6 (n+1)
   obtain ⟨c0,g0⟩ := h0
   obtain ⟨c1,g1⟩ := h1
   simp only [vCLM115,vCPM115,vGLM115,vGPM115,vBLMDE6,vBPMDE6,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_add,pow_succ] at c0 g0 c1 g1 hb hf hc hg ⊢
   constructor
   · linear_combination 6*(1-X)^6*hc+(X+1)*c1-X*c0+3*(X+1)^2*(1-X)^2*hb
   · linear_combination (1-X)^3*hg+(X+1)*g1-X*g0+(X+1)^2*(1-X)^2*hf
end
end MathGKM.Markov
