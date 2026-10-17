import MarkovDenseCertificateMC9F
/-! Machine-authored c9f23b44. Proof-free Boolean comparison with a proved
soundness theorem. The concrete Boolean computation is reduced by the kernel. -/
namespace MathGKM.Markov

def denseBEqMC9F {α : Type} (eqb : α → α → Bool) : List α → List α → Bool
 | [], [] => true
 | a::as, b::bs => eqb a b && denseBEqMC9F eqb as bs
 | _, _ => false

theorem dense_beq_soundMC9F {α : Type} (eqb : α → α → Bool)
 (h : ∀ a b, eqb a b=true → a=b) (a b : List α)
 (he : denseBEqMC9F eqb a b=true) : a=b := by
 induction a generalizing b with
 | nil => cases b <;> simp_all [denseBEqMC9F]
 | cons a as ih =>
   cases b with
   | nil => simp [denseBEqMC9F] at he
   | cons b bs =>
     have hh : eqb a b=true ∧ denseBEqMC9F eqb as bs=true := by
       simpa only [denseBEqMC9F,Bool.and_eq_true] using he
     rw [h a b hh.1,ih bs hh.2]

def dbeqMC9F : (n : ℕ) → DenseMC9F n → DenseMC9F n → Bool
 | 0, a, b => a == b
 | n+1, a, b => denseBEqMC9F (dbeqMC9F n) a b

theorem dbeq_soundMC9F (n : ℕ) (a b : DenseMC9F n) (h : dbeqMC9F n a b=true) : a=b := by
 induction n with
 | zero => exact eq_of_beq h
 | succ n ih => exact dense_beq_soundMC9F _ ih a b h

end MathGKM.Markov
