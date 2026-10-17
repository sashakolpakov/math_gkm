import MarkovBinomialDilationM41B
/-! Machine-authored e108e0e2. Binomial comparison one place past the center. -/
namespace MathGKM.Markov
theorem choose_near_stepME10 (N a b : ℕ) (hab : a ≤ b)
 (hb : 2 ≤ b) (hN : 2*b ≤ N+2) : N.choose a ≤ 2*N.choose b := by
 by_cases he : a=b
 · subst a; omega
 have hp : N.choose a ≤ N.choose (b-1) :=
   choose_lower_stepM41B N a (b-1) (by omega) (by omega)
 have h := Nat.choose_succ_right_eq N (b-1)
 rw [show b-1+1=b by omega] at h
 have hnb : b ≤ 2*(N-(b-1)) := by omega
 have hm := Nat.mul_le_mul_left (N.choose (b-1)) hnb
 have hf : N.choose (b-1) ≤ 2*N.choose b := by nlinarith
 exact hp.trans hf
end MathGKM.Markov
