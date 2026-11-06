import MathGKM.Round63MatchingDefinitionsA

/- Machine-authored round66. Definitions recovered unchanged from Round65FibersA.
No rejected proof module or accepted export is imported. This module is uncompiled. -/
namespace ColorFibersR66
open MatchingSeparatorR63
noncomputable section

def uncovered (N : ℕ) (M : Finset ℕ) : Finset ℕ :=
  Finset.range N \ (M ∪ M.image Nat.succ)

def fiber (N sigma i j a b : ℕ) : Finset ((M : Finset ℕ) × Finset ℕ) :=
  (FiniteMatchingR61.matchings N).sigma fun M =>
    ((uncovered N M).powerset).filter fun S =>
      p sigma M=a ∧ q sigma M=b ∧
      p sigma M+S.card=i ∧ q sigma M+((uncovered N M).card-S.card)=j

end
end ColorFibersR66
