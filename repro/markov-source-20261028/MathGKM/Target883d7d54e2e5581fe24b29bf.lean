import MathGKM.Round40SubmissionA
import MathGKM.Markov
def MathGKM.Target883d7d54e2e5581fe24b29bf.Interface :=
  (
    True
  )
def MathGKM.Target883d7d54e2e5581fe24b29bf.Transport (StudyInterface : MathGKM.Target883d7d54e2e5581fe24b29bf.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target883d7d54e2e5581fe24b29bf.Goal (StudyInterface : MathGKM.Target883d7d54e2e5581fe24b29bf.Interface) : Prop :=
  (
    (∀ A₀ A₁ A₂ : Polynomial ℤ,
      (∀ l : ℕ, 0≤(A₁^2-A₀*A₂).coeff l) →
      A₀.eval 1*A₂.eval 1≤(A₁.eval 1)^2) ∧
    (∀ (n : ℕ) (a b c : ℕ → ℤ) (l : ℕ),
      (GroupedR40.Defect (GroupedR40.encode n a) (GroupedR40.encode n b) (GroupedR40.encode n c)).coeff l =
        Finset.sum (Finset.range (n+1)) (fun s => Finset.sum (Finset.range (n+1)) (fun t =>
          if s+t=l then b s*b t-a s*c t else 0))) ∧
    (∀ (n : ℕ) (a b c : ℕ → ℤ),
      (∀ l : ℕ, l≤2*n → 0≤Finset.sum (Finset.range (n+1)) (fun s =>
        Finset.sum (Finset.range (n+1)) (fun t => if s+t=l then b s*b t-a s*c t else 0))) →
      Finset.sum (Finset.range (n+1)) a*Finset.sum (Finset.range (n+1)) c ≤
        (Finset.sum (Finset.range (n+1)) b)^2)
  )
