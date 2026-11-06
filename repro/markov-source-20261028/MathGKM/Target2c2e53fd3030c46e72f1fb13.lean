import MathGKM.Round80BinomialA
import MathGKM.Markov
def MathGKM.Target2c2e53fd3030c46e72f1fb13.Interface :=
  (
    True
  )
def MathGKM.Target2c2e53fd3030c46e72f1fb13.Transport (StudyInterface : MathGKM.Target2c2e53fd3030c46e72f1fb13.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2c2e53fd3030c46e72f1fb13.Goal (StudyInterface : MathGKM.Target2c2e53fd3030c46e72f1fb13.Interface) : Prop :=
  (
    ∀ (L : ℕ) (gamma : ℕ → ℤ) (H : Polynomial ℤ),
      H = (∑ k ∈ Finset.range (L/2+1),
        Polynomial.C (gamma k)*(Polynomial.X^k*(1+Polynomial.X)^(L-2*k))) →
      (∀ k, k≤L/2 → 0≤gamma k) →
      (∀ r, r≤L → H.coeff r=H.coeff (L-r)) ∧
      (∀ r, 2*r<L → H.coeff r≤H.coeff (r+1)) ∧
      (∀ r, L<r → H.coeff r=0)
  )
