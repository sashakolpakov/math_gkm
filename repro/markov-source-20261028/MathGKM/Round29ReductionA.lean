import MathGKM.Round29EndpointA
import MathGKM.Target28970cec784233956929e138

/-! Machine-authored exact path partition, committed round29. -/
namespace EndpointR29
open MathGKM.Markov

def TruePathResidual : Prop :=
  (
    ∀ path : List Bool, true ∈ path → let E := (MathGKM.Markov.frame path).mid;
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
  )

theorem no_true_replicate (path : List Bool) (h : ¬true ∈ path) :
    path=List.replicate path.length false := by
  apply List.eq_replicate_length.mpr
  intro b hb
  cases b with
  | false => rfl
  | true => exact False.elim (h hb)

theorem path_partition : TruePathResidual →
    MathGKM.Target28970cec784233956929e138.Residual0 := by
  intro h path
  by_cases ht : true ∈ path
  · exact h path ht
  · have hc : WeakLC (frame path).mid.a (frame path).mid.b (frame path).mid.p := by
      have hp := no_true_replicate path ht
      simpa only [← hp] using actual_labels path.length
    exact ⟨fun i j _ => hc.1 i j, fun i j _ => hc.2.1 i j,
      fun i j _ => hc.2.2 i j⟩

end EndpointR29

