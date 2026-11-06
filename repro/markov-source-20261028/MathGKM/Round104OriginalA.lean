import MathGKM.Round104OrderedA
import MathGKM.Round100OriginalA

/- Machine-authored r104. Actual prefix premises remain explicit. -/
namespace OrderedOriginalR104
open scoped BigOperators
open MathGKM.Markov NeighborSupportR100 OrderedCompensationR104
noncomputable section

theorem horizontal_from_prefix (n t r K : ℕ) (hn : 1≤n)
    (hK : (2*r+2)+2*t+K=2*(2*n))
    (hp : Prefix K (pooledDelta (2*n) 0 t r K)) :
    let E := (frame (List.replicate (n-1) true)).mid
    coeff E.p r t*coeff E.p (r+2) t ≤ coeff E.p (r+1) t^2 := by
  have ht := prefix_to_transport K _ hp
  have hs := feasible_total K _ _ ht
  rw [(NeighborOriginalR100.original_margins n t r K hn hK).1] at hs
  exact sub_nonneg.mp hs

theorem vertical_from_prefix (n t r K : ℕ) (hn : 1≤n)
    (hK : (2*r+2)+2*t+K=2*(2*n))
    (hp : Prefix K (pooledDelta (2*n) 1 t r K)) :
    let E := (frame (List.replicate (n-1) true)).mid
    coeff E.p t r*coeff E.p t (r+2) ≤ coeff E.p t (r+1)^2 := by
  have ht := prefix_to_transport K _ hp
  have hs := feasible_total K _ _ ht
  rw [(NeighborOriginalR100.original_margins n t r K hn hK).2] at hs
  exact sub_nonneg.mp hs

def OriginalBridge : Prop := ∀ n t r K : ℕ, 1≤n →
    (2*r+2)+2*t+K=2*(2*n) →
    let E := (frame (List.replicate (n-1) true)).mid
    (Prefix K (pooledDelta (2*n) 0 t r K) →
      coeff E.p r t*coeff E.p (r+2) t ≤ coeff E.p (r+1) t^2) ∧
    (Prefix K (pooledDelta (2*n) 1 t r K) →
      coeff E.p t r*coeff E.p t (r+2) ≤ coeff E.p t (r+1)^2)

theorem original_bridge : OriginalBridge := by
  intro n t r K hn hK
  exact ⟨horizontal_from_prefix n t r K hn hK,vertical_from_prefix n t r K hn hK⟩

end
end OrderedOriginalR104
#print axioms OrderedOriginalR104.original_bridge
