import MarkovLowerDiagnosticsMF88
/-! Machine-authored 9f234835. A direct diagonal paired-summand obstruction.
This is not a source-family counterexample. The summed inequality is preserved. -/
namespace MathGKM.Markov
noncomputable section
def diagonalTermM9F23 (t j k r : ℕ) : ℤ :=
 if r ≤ j ∧ r ≤ k then ((j-r+t+3).choose (t+3):ℤ)*((k-r+t).choose t:ℤ) else 0

theorem diagonal_pair_negativeM9F23 :
 2*diagonalTermM9F23 1 1 2 0*diagonalTermM9F23 1 1 2 2-
 diagonalTermM9F23 0 2 2 0*diagonalTermM9F23 2 0 2 2-
 diagonalTermM9F23 0 2 2 2*diagonalTermM9F23 2 0 2 0= -6 := by
 norm_num [diagonalTermM9F23,Nat.choose]

theorem diagonal_pair_nonnegative_falseM9F23 : ¬(∀ t j k r s : ℕ,
 0 ≤ 2*diagonalTermM9F23 (t+1) (j+1) k r*diagonalTermM9F23 (t+1) (j+1) k s-
 diagonalTermM9F23 t (j+2) k r*diagonalTermM9F23 (t+2) j k s-
 diagonalTermM9F23 t (j+2) k s*diagonalTermM9F23 (t+2) j k r) := by
 intro h
 have hh := h 0 0 2 0 2
 norm_num only [Nat.reduceAdd] at hh
 rw [diagonal_pair_negativeM9F23] at hh
 norm_num at hh
end
end MathGKM.Markov
