import MathGKM.MarkovTopLC
import MathGKM.Acceptedece47dcbaf17012fa9f29e24

/-! Machine-authored round-0004. The residual remains an open antecedent. -/
namespace MathGKM.Markov
noncomputable section

def TopBoundaryResidual : Prop := ∀ path : List Bool,
  let m := (frame path).mid
  (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
    InPolygon m.a m.b (i+2) j →
    coeff m.p i j * coeff m.p (i+2) j ≤ coeff m.p (i+1) j ^ 2) ∧
  (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
    InPolygon m.a m.b i (j+2) →
    coeff m.p i j * coeff m.p i (j+2) ≤ coeff m.p i (j+1) ^ 2) ∧
  (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
    InPolygon m.a m.b (i+2) j → i+j+2 < m.a+m.b-1 →
    coeff m.p i (j+2) * coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1) ^ 2)

theorem top_boundary_reduction : TopBoundaryResidual → Conjecture63 := by
  intro hr
  have ep := Acceptedece47dcbaf17012fa9f29e24.obligation.2.2.2.2.2
  refine ⟨ep.1, ep.2, ?_⟩
  intro path
  have hm := hr path
  refine ⟨hm.1, hm.2.1, ?_⟩
  intro i j h0 h1 h2
  have hd := h0.2
  by_cases ht : i+j+2 = (frame path).mid.a+(frame path).mid.b-1
  · exact (all_frame_top_diagonal path).2.1 i j h0 h1 h2 ht
  · exact hm.2.2 i j h0 h1 h2 (by omega)

theorem top_boundary_residual_iff : TopBoundaryResidual ↔ Conjecture63 := by
  refine ⟨top_boundary_reduction, ?_⟩
  intro hc path
  have hm := hc.2.2 path
  exact ⟨hm.1, hm.2.1, fun i j h0 h1 h2 _ => hm.2.2 i j h0 h1 h2⟩

end
end MathGKM.Markov
