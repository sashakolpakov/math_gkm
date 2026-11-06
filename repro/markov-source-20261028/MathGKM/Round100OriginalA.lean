import MathGKM.Round100SupportA
import MathGKM.Round64ConsumerA

/- Machine-authored r100. Both coordinate maps into the unchanged raw
constant-right coefficients. No actual-family flow existence is asserted. -/
namespace NeighborOriginalR100
open scoped BigOperators
open MathGKM.Markov NeighborSupportR100 NeighborFlowR100 MatchingProjectionR64
noncomputable section

theorem original_margins (n t r K : ℕ) (hn : 1≤n)
    (hK : (2*r+2)+2*t+K=2*(2*n)) :
    let E := (frame (List.replicate (n-1) true)).mid
    (∑ a ∈ Finset.range (K+1), pooledDelta (2*n) 0 t r K a) =
      coeff E.p (r+1) t^2-coeff E.p r t*coeff E.p (r+2) t ∧
    (∑ a ∈ Finset.range (K+1), pooledDelta (2*n) 1 t r K a) =
      coeff E.p t (r+1)^2-coeff E.p t r*coeff E.p t (r+2) := by
  dsimp only
  constructor
  · rw [← pooled_specialization (2*n) 0 t r K hK]
    simp only [defect,map_sub,map_pow,map_mul]
    rw [(MatchingConsumerR64.actual_coefficients n hn (r+1) t).1,
      (MatchingConsumerR64.actual_coefficients n hn r t).1,
      (MatchingConsumerR64.actual_coefficients n hn (r+2) t).1]
  · rw [← pooled_specialization (2*n) 1 t r K hK]
    simp only [defect,map_sub,map_pow,map_mul]
    rw [(MatchingConsumerR64.actual_coefficients n hn t (r+1)).2,
      (MatchingConsumerR64.actual_coefficients n hn t r).2,
      (MatchingConsumerR64.actual_coefficients n hn t (r+2)).2]

theorem horizontal_from_flow (n t r K : ℕ) (hn : 1≤n)
    (hK : (2*r+2)+2*t+K=2*(2*n))
    (T : ℕ → ℕ → ℤ) (hf : Feasible K (pooledDelta (2*n) 0 t r K) T) :
    let E := (frame (List.replicate (n-1) true)).mid
    coeff E.p r t*coeff E.p (r+2) t ≤ coeff E.p (r+1) t^2 := by
  have hm := (original_margins n t r K hn hK).1
  have hs := feasible_total K (pooledDelta (2*n) 0 t r K) T hf
  rw [hm] at hs
  exact sub_nonneg.mp hs

theorem vertical_from_flow (n t r K : ℕ) (hn : 1≤n)
    (hK : (2*r+2)+2*t+K=2*(2*n))
    (T : ℕ → ℕ → ℤ) (hf : Feasible K (pooledDelta (2*n) 1 t r K) T) :
    let E := (frame (List.replicate (n-1) true)).mid
    coeff E.p t r*coeff E.p t (r+2) ≤ coeff E.p t (r+1)^2 := by
  have hm := (original_margins n t r K hn hK).2
  have hs := feasible_total K (pooledDelta (2*n) 1 t r K) T hf
  rw [hm] at hs
  exact sub_nonneg.mp hs

theorem polygon_degree_guard (n r t : ℕ)
    (hp : InPolygon n (n+1) (r+2) t ∨ InPolygon n (n+1) t (r+2)) :
    (2*r+2)+2*t+(2*(2*n)-(2*r+2)-2*t)=2*(2*n) := by
  rcases hp with hp | hp <;> obtain ⟨_,hu⟩ := hp <;> omega

end
end NeighborOriginalR100
#print axioms NeighborOriginalR100.original_margins
#print axioms NeighborOriginalR100.horizontal_from_flow
#print axioms NeighborOriginalR100.vertical_from_flow
#print axioms NeighborOriginalR100.polygon_degree_guard
