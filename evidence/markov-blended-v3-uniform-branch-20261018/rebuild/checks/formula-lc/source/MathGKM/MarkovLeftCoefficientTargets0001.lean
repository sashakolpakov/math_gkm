import MathGKM.MarkovLeftBranch0001

/-! Machine-authored exact remaining targets, round-0001.
These are definitions of propositions, with no proofs asserted or postulated. -/
namespace MathGKM.Markov.LeftBranch0001

def rawFormula (n i j : ℕ) : ℤ :=
  if i = 0 then (if j = n then 1 else 0)
  else if i+j ≤ n then
    ((i+j).choose j : ℤ) * ((n-j-1).choose (i-1) : ℤ)
  else 0

def CoefficientBridge : Prop :=
  ∀ n i j : ℕ, coeff (Q n) i j = rawFormula n i j

def FormulaWeakLC : Prop :=
  ∀ n : ℕ, 1 ≤ n →
    (∀ i j, InPolygon 1 n i j → InPolygon 1 n (i+1) j →
      InPolygon 1 n (i+2) j →
      rawFormula n i j * rawFormula n (i+2) j ≤ rawFormula n (i+1) j ^ 2) ∧
    (∀ i j, InPolygon 1 n i j → InPolygon 1 n i (j+1) →
      InPolygon 1 n i (j+2) →
      rawFormula n i j * rawFormula n i (j+2) ≤ rawFormula n i (j+1) ^ 2) ∧
    (∀ i j, InPolygon 1 n i (j+2) → InPolygon 1 n (i+1) (j+1) →
      InPolygon 1 n (i+2) j →
      rawFormula n i (j+2) * rawFormula n (i+2) j ≤ rawFormula n (i+1) (j+1) ^ 2)

def RestrictedWeakLC : Prop :=
  ∀ n : ℕ, 1 ≤ n → WeakLC 1 n (Q n)

theorem coefficient_targets_suffice :
    CoefficientBridge → FormulaWeakLC → RestrictedWeakLC := by
  intro hc hf n hn
  unfold CoefficientBridge at hc
  simpa only [WeakLC, hc] using hf n hn

#print axioms coefficient_targets_suffice
end MathGKM.Markov.LeftBranch0001
