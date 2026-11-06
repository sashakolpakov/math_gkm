import MathGKM.Accepted7444de3b0a95eefb7df0f208
import MathGKM.Target517568c10ae5cc54007aa4b8

/-! Machine-authored committed round35 partition. No existing DAG node is rebound. -/
namespace PathPartitionR35
open MathGKM.Markov

def MixedResidual : Prop :=
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

theorem no_false_replicate (path : List Bool) (h : ¬false ∈ path) :
    path = List.replicate path.length true := by
  apply List.eq_replicate_length.mpr
  intro b hb
  cases b with
  | false => exact False.elim (h hb)
  | true => rfl

theorem path_partition : MixedResidual →
    MathGKM.Target517568c10ae5cc54007aa4b8.Residual0 := by
  intro h path ht
  have hh := h path ht
  refine ⟨hh.1, hh.2.1, ?_⟩
  intro i j hd hp hq hr
  by_cases hf : false ∈ path
  · exact hh.2.2 hf i j hd hp hq hr
  · have heq := no_false_replicate path hf
    have hc := Accepted7444de3b0a95eefb7df0f208.obligation path.length
    have hc' : ∀ i j : ℕ,
        InPolygon (frame path).mid.a (frame path).mid.b i (j+2) →
        InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1) →
        InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
        coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
          coeff (frame path).mid.p (i+1) (j+1)^2 := by
      simpa only [← heq] using hc
    exact hc' i j hp hq hr

end PathPartitionR35

#print axioms PathPartitionR35.no_false_replicate
#print axioms PathPartitionR35.path_partition
