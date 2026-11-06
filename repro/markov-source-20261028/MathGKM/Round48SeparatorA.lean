import MathGKM.Round36KernelA

/-! Machine-authored round48. First separator in committed lexicographic order.
No assertion that a stronger summand failure refutes a raw coefficient inequality. -/
namespace OrientedR48
open MathGKM.Markov MidpointR36

theorem horizontal_separator :
    InPolygon 32 33 0 34 ∧ InPolygon 32 33 1 34 ∧ InPolygon 32 33 2 34 ∧
    (0+1)/2=0 ∧ (0+1+1)/2=1 ∧
    W 32 0 34 0=31 ∧ W 32 2 34 1=162400 ∧
    W 32 1 34 0=2790 ∧ W 32 1 34 1=1740 ∧
    W 32 0 34 0 * W 32 2 34 1 >
      W 32 1 34 ((0+1)/2) * W 32 1 34 ((0+1+1)/2) := by
  norm_num [InPolygon,W,RenewalR28.mc,Nat.choose]

theorem horizontal_prediction_false :
    ¬ (∀ n : ℕ, 1 ≤ n → ∀ i j : ℕ,
      InPolygon n (n+1) i j → InPolygon n (n+1) (i+1) j →
      InPolygon n (n+1) (i+2) j → ∀ s t : ℕ, s≤n → t≤n →
      W n i j s * W n (i+2) j t ≤
        W n (i+1) j ((s+t)/2) * W n (i+1) j ((s+t+1)/2)) := by
  intro h
  have hp := horizontal_separator
  have bad := h 32 (by norm_num) 0 34 hp.1 hp.2.1 hp.2.2.1 0 1
    (by norm_num) (by norm_num)
  have strict := hp.2.2.2.2.2.2.2.2.2
  exact (not_lt_of_ge bad) strict

end OrientedR48
#print axioms OrientedR48.horizontal_separator
#print axioms OrientedR48.horizontal_prediction_false
