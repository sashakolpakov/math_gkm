import MathGKM.MarkovLaurent
import MathGKM.Markov
def MathGKM.Target8ba2a17bcf7e1b519f5c003a.Interface :=
  (
    True
  )
def MathGKM.Target8ba2a17bcf7e1b519f5c003a.Transport (StudyInterface : MathGKM.Target8ba2a17bcf7e1b519f5c003a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8ba2a17bcf7e1b519f5c003a.Goal (StudyInterface : MathGKM.Target8ba2a17bcf7e1b519f5c003a.Interface) : Prop :=
  (
    ∀ (K : Type) [Field K] (φ : MathGKM.Markov.BiPoly →+* K), Function.Injective φ → ∀ x y : K, x ≠ 0 → y ≠ 0 → φ MathGKM.Markov.U = x^2 → φ MathGKM.Markov.V = y^2 → ∀ (M : ℕ → ℕ → K) (Q : ℕ → ℕ → MathGKM.Markov.BiPoly), MathGKM.Markov.AffineLaurentFamily x y M → (∀ a b, φ (Q a b) = MathGKM.Markov.affineDen x y a b * M a b) → ∀ a b : ℕ, 0<a → a≤b → Nat.Coprime a b → ((a=1 ∧ b=1) ∧ Q a b = MathGKM.Markov.U+MathGKM.Markov.V) ∨ ∃ path : List Bool, (MathGKM.Markov.frame path).mid.a=a ∧ (MathGKM.Markov.frame path).mid.b=b ∧ Q a b = (MathGKM.Markov.frame path).mid.p
  )
