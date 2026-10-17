import Mathlib
import Mathlib.Data.Nat.Digits.Lemmas
/-! Machine-authored live request 7a344181. Exact nonnegative polynomial
certificates from a single large integer evaluation. No computed equality is
assumed without an explicit proof argument. -/
namespace MathGKM.Markov
open Polynomial

theorem digits_rangeM7A3 (B n : ℕ) (f : ℕ → ℕ) :
 Nat.ofDigits B ((List.range n).map f) = ∑ i ∈ Finset.range n, f i * B^i := by
 induction n with
 | zero => simp [Nat.ofDigits]
 | succ n ih =>
   rw [List.range_succ, List.map_append, Nat.ofDigits_append, ih]
   simp [Finset.sum_range_succ, mul_comm]

theorem polynomial_digitsM7A3 (P : Polynomial ℕ) (B n : ℕ)
 (hn : P.natDegree < n) :
 Nat.ofDigits B ((List.range n).map P.coeff) = P.eval B := by
 rw [digits_rangeM7A3, Polynomial.eval_eq_sum_range' hn]

theorem coefficient_mass_boundM7A3 (P : Polynomial ℕ) (i : ℕ) :
 P.coeff i ≤ P.eval 1 := by
 rw [Polynomial.eval_eq_sum, Polynomial.sum_def]
 simp only [one_pow, mul_one]
 by_cases hi : i ∈ P.support
 · exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) hi
 · rw [Polynomial.notMem_support_iff.mp hi]
   exact Nat.zero_le _

theorem polynomial_packed_injectiveM7A3 (B : ℕ) (hB : 1 < B)
 (P Q : Polynomial ℕ) (hP : P.eval 1 < B) (hQ : Q.eval 1 < B)
 (heq : P.eval B = Q.eval B) : P = Q := by
 let n := max P.natDegree Q.natDegree + 1
 have hp : P.natDegree < n := by dsimp [n]; omega
 have hq : Q.natDegree < n := by dsimp [n]; omega
 have hl : (List.range n).map P.coeff = (List.range n).map Q.coeff := by
   apply Nat.ofDigits_inj_of_len_eq hB (by simp)
   · intro k hk
     obtain ⟨i, hi, rfl⟩ := List.mem_map.mp hk
     exact (coefficient_mass_boundM7A3 P i).trans_lt hP
   · intro k hk
     obtain ⟨i, hi, rfl⟩ := List.mem_map.mp hk
     exact (coefficient_mass_boundM7A3 Q i).trans_lt hQ
   · rw [polynomial_digitsM7A3 P B n hp, polynomial_digitsM7A3 Q B n hq, heq]
 apply Polynomial.ext
 intro i
 by_cases hi : i < n
 · have h := congrArg (fun l : List ℕ => l[i]?) hl
   simpa [List.getElem?_map, List.getElem?_range, hi] using h
 · rw [Polynomial.coeff_eq_zero_of_natDegree_lt (by omega : P.natDegree < i),
     Polynomial.coeff_eq_zero_of_natDegree_lt (by omega : Q.natDegree < i)]

end MathGKM.Markov
