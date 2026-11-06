import MathGKM.Target9c09b70f4c5021cf5d29c1e1
import MathGKM.Acceptedabce3c07d75c9c186964a29f

/- Machine-authored round43: exact corner-only residual implication. -/
namespace CornerReductionR43

def Residual : Prop :=
  (
    (
        (
            ∀ path : List Bool, true ∈ path → let E := (MathGKM.Markov.frame path).mid;
              (∀ i j : ℕ, 0 < j →
                MathGKM.Markov.InPolygon E.a E.b i j →
                MathGKM.Markov.InPolygon E.a E.b (i+1) j →
                MathGKM.Markov.InPolygon E.a E.b (i+2) j →
                MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j ≤
                  MathGKM.Markov.coeff E.p (i+1) j^2) ∧
              (∀ i j : ℕ, 0 < i →
                (¬∃ n : ℕ, 2≤n ∧ path=List.replicate (n-1) true ∧ i=n ∧ j=0) →
                MathGKM.Markov.InPolygon E.a E.b i j →
                MathGKM.Markov.InPolygon E.a E.b i (j+1) →
                MathGKM.Markov.InPolygon E.a E.b i (j+2) →
                MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2) ≤
                  MathGKM.Markov.coeff E.p i (j+1)^2) ∧
              (false ∈ path → ∀ i j : ℕ, i+j+2 < E.a+E.b-1 →
                MathGKM.Markov.InPolygon E.a E.b i (j+2) →
                MathGKM.Markov.InPolygon E.a E.b (i+1) (j+1) →
                MathGKM.Markov.InPolygon E.a E.b (i+2) j →
                MathGKM.Markov.coeff E.p i (j+2)*MathGKM.Markov.coeff E.p (i+2) j ≤
                  MathGKM.Markov.coeff E.p (i+1) (j+1)^2)
          )
      )
  )

theorem corner_partition : Residual → MathGKM.Target9c09b70f4c5021cf5d29c1e1.Residual0 :=
by
  classical
  intro h path ht
  have hp := h path ht
  refine ⟨hp.1, ?_, hp.2.2⟩
  intro i j hi h0 h1 h2
  by_cases hc : ∃ n : ℕ, 2≤n ∧ path=List.replicate (n-1) true ∧ i=n ∧ j=0
  · rcases hc with ⟨n, hn, hpath, hin, hj⟩
    have corner := Acceptedabce3c07d75c9c186964a29f.obligation n hn
    simpa only [hpath, hin, hj, Nat.zero_add] using le_of_lt corner.2.2.2.2.2
  · exact hp.2.1 i j hi hc h0 h1 h2

end CornerReductionR43

#print axioms CornerReductionR43.corner_partition
