import MathGKM.Round44TransportA
import MathGKM.Round40ConsumerA

/-! Machine-authored round44: total grouped defect and conditional original transport. -/
namespace DistanceTwoR44
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem group_total (n i j dx dy : ℕ) :
    (∑ l ∈ Finset.range (2*n+1), GroupedR40.group n i j dx dy l) =
      (∑ s ∈ Finset.range (n+1), MidpointR36.W n (i+dx) (j+dy) s)^2 -
      (∑ s ∈ Finset.range (n+1), MidpointR36.W n i j s)*
        (∑ t ∈ Finset.range (n+1), MidpointR36.W n (i+2*dx) (j+2*dy) t) := by
  classical
  simp only [GroupedR40.group]
  rw [Finset.sum_comm]
  have he : (∑ s ∈ Finset.range (n+1), ∑ l ∈ Finset.range (2*n+1),
      ∑ t ∈ Finset.range (n+1),
        if s+t=l then
          MidpointR36.W n (i+dx) (j+dy) s*MidpointR36.W n (i+dx) (j+dy) t-
            MidpointR36.W n i j s*MidpointR36.W n (i+2*dx) (j+2*dy) t
        else 0) =
      ∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
          (MidpointR36.W n (i+dx) (j+dy) s*MidpointR36.W n (i+dx) (j+dy) t-
            MidpointR36.W n i j s*MidpointR36.W n (i+2*dx) (j+2*dy) t) := by
    apply Finset.sum_congr rfl
    intro s hs
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro t ht
    have hst : s+t < 2*n+1 := by
      have := Finset.mem_range.mp hs
      have := Finset.mem_range.mp ht
      omega
    simp [Finset.sum_ite_eq', hst]
  rw [he]
  simp only [Finset.sum_sub_distrib, pow_two, Finset.sum_mul, Finset.mul_sum]
  congr 1 <;> rw [Finset.sum_comm]

theorem original_raw_consumer (n : ℕ) (hn : 1≤n) (i j dx dy : ℕ)
    (h : Capacity (2*n) (GroupedR40.group n i j dx dy)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j*
      coeff (frame (List.replicate (n-1) true)).mid.p (i+2*dx) (j+2*dy) ≤
        coeff (frame (List.replicate (n-1) true)).mid.p (i+dx) (j+dy)^2 := by
  have hh := finite_transport (2*n) (GroupedR40.group n i j dx dy) h
  rw [group_total] at hh
  rw [Acceptedb6d2ec5febf447178088c884.obligation n hn i j,
    Acceptedb6d2ec5febf447178088c884.obligation n hn (i+2*dx) (j+2*dy),
    Acceptedb6d2ec5febf447178088c884.obligation n hn (i+dx) (j+dy)]
  exact sub_nonneg.mp hh

theorem original_polygon_consumer (n : ℕ) (hn : 1≤n) (i j dx dy : ℕ)
    (_hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
    (_h0 : InPolygon n (n+1) i j)
    (_h1 : InPolygon n (n+1) (i+dx) (j+dy))
    (_h2 : InPolygon n (n+1) (i+2*dx) (j+2*dy))
    (h : ∀ l, l≤2*n → GroupedR40.group n i j dx dy l<0 →
      l+2≤2*n ∧ -GroupedR40.group n i j dx dy l≤GroupedR40.group n i j dx dy (l+2)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j*
      coeff (frame (List.replicate (n-1) true)).mid.p (i+2*dx) (j+2*dy) ≤
        coeff (frame (List.replicate (n-1) true)).mid.p (i+dx) (j+dy)^2 :=
  original_raw_consumer n hn i j dx dy h

end
end DistanceTwoR44
#print axioms DistanceTwoR44.group_total
#print axioms DistanceTwoR44.original_polygon_consumer
