/- Machine-authored round-10 ordinary exact-root reduction.
All three polygon premises, raw coefficients and both endpoints are retained.
The non-face residual is an open antecedent; no positivity assumption is made. -/
import MathGKM.Acceptedd3299806602b30aaa7cf6a46
import MathGKM.Markov
open MathGKM.Markov
noncomputable section
namespace RootR10
def InteriorResidual : Prop :=
  ∀ path : List Bool, let E := (MathGKM.Markov.frame path).mid;
  (∀ i j : ℕ, 0 < j →
    MathGKM.Markov.InPolygon E.a E.b i j →
    MathGKM.Markov.InPolygon E.a E.b (i+1) j →
    MathGKM.Markov.InPolygon E.a E.b (i+2) j →
    MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j ≤
      MathGKM.Markov.coeff E.p (i+1) j^2) ∧
  (∀ i j : ℕ, 0 < i →
    MathGKM.Markov.InPolygon E.a E.b i j →
    MathGKM.Markov.InPolygon E.a E.b i (j+1) →
    MathGKM.Markov.InPolygon E.a E.b i (j+2) →
    MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2) ≤
      MathGKM.Markov.coeff E.p i (j+1)^2) ∧
  (∀ i j : ℕ, i+j+2 < E.a+E.b-1 →
    MathGKM.Markov.InPolygon E.a E.b i (j+2) →
    MathGKM.Markov.InPolygon E.a E.b (i+1) (j+1) →
    MathGKM.Markov.InPolygon E.a E.b (i+2) j →
    MathGKM.Markov.coeff E.p i (j+2)*MathGKM.Markov.coeff E.p (i+2) j ≤
      MathGKM.Markov.coeff E.p (i+1) (j+1)^2)
theorem root_reduction : InteriorResidual → MathGKM.Markov.Conjecture63 :=
by
  intro hr
  have faces := Acceptedd3299806602b30aaa7cf6a46.obligation
  refine ⟨faces.1,faces.2.1,?_⟩
  intro path
  have hs := hr path
  have hf := faces.2.2 path (frame path).mid (by simp)
  dsimp only at hs hf ⊢
  refine ⟨?_,?_,?_⟩
  · intro i j p0 p1 p2
    by_cases hj : j=0
    · subst j
      exact hf.1 i p0 p1 p2
    · exact hs.1 i j (by omega) p0 p1 p2
  · intro i j p0 p1 p2
    by_cases hi : i=0
    · subst i
      exact hf.2.1 j p0 p1 p2
    · exact hs.2.1 i j (by omega) p0 p1 p2
  · intro i j p0 p1 p2
    by_cases ht : i+j+2=(frame path).mid.a+(frame path).mid.b-1
    · exact hf.2.2 i j ht p0 p1 p2
    · have hp := p0.2
      exact hs.2.2 i j (by omega) p0 p1 p2

end RootR10
