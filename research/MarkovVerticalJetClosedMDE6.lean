import MarkovVerticalJetRecurrenceMDE6
/-! Machine-authored de6168c6. Universal sparse rational numerators of the
vertical block jets. Identities follow by the checked scalar recurrence. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

def vAPMDE6 (q : ℤ[X]) : ℤ[X] :=
 -q+(-q-3)*X+(q-2)*X^2+(q+1)*X^3
def vBLMDE6 (q : ℤ[X]) : ℤ[X] :=
 (8*q-8)*X+(8*q-32)*X^2+(-8*q-40)*X^3+(-8*q-16)*X^4
def vBPMDE6 (q : ℤ[X]) : ℤ[X] :=
 q^2+q+(2*q^2+10*q+8)*X+(-q^2+15*q+32)*X^2+
 (-4*q^2-4*q+40)*X^3+(-q^2-17*q+16)*X^4+
 (2*q^2-6*q)*X^5+(q^2+q)*X^6

theorem vJet_closedMDE6 (n : ℕ) :
 (1-X)^2*vAJMDE6 n=4*X+X^(n+1)*vAPMDE6 (n+1) ∧
 2*(1-X)^4*vBJMDE6 n=vBLMDE6 (n+1)+X^(n+1)*vBPMDE6 (n+1) ∧
 (1-X)*vFJMDE6 n=2-X^(n+1)-X^(n+2) := by
 induction n using Nat.twoStepInduction with
 | zero =>
   obtain ⟨ha,_,hb,_,hf,_⟩ := vJet_initialMDE6
   rw [ha,hb,hf]
   refine ⟨?_,?_,?_⟩ <;> norm_num [vAPMDE6,vBLMDE6,vBPMDE6] <;> ring
 | one =>
   obtain ⟨_,ha,_,hb,_,hf⟩ := vJet_initialMDE6
   rw [ha,hb,hf]
   refine ⟨?_,?_,?_⟩ <;> norm_num [vAPMDE6,vBLMDE6,vBPMDE6] <;> ring
 | more n h0 h1 =>
   obtain ⟨ha,hb,hf⟩ := vJet_recurrencesMDE6 n
   obtain ⟨a0,b0,f0⟩ := h0
   obtain ⟨a1,b1,f1⟩ := h1
   simp only [vAPMDE6,vBLMDE6,vBPMDE6,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,
     pow_add,pow_succ] at a0 b0 f0 a1 b1 f1 ha hb hf ⊢
   refine ⟨?_,?_,?_⟩
   · linear_combination (1-X)^2*ha+(X+1)*a1-X*a0
   · linear_combination 2*(1-X)^4*hb+(X+1)*b1-X*b0+2*(X+1)^2*(1-X)^2*a1
   · linear_combination (1-X)*hf+(X+1)*f1-X*f0

end
end MathGKM.Markov
