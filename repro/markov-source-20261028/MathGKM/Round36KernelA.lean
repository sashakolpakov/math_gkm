import MathGKM.Round28CoefficientsA

/-! Machine-authored round36. The committed weight, with its actual corner and guards. -/
namespace MidpointR36
open MathGKM.Markov
open scoped BigOperators
noncomputable section

def W (n i j s : ℕ) : ℤ :=
  if n ≤ i+j ∧ i+j ≤ 2*n ∧ s ≤ i then
    RenewalR28.mc n (i+j-n) s * ((2*(i+j-n)).choose (i-s) : ℤ)
  else 0

theorem W_nonnegative (n i j s : ℕ) : 0 ≤ W n i j s := by
  unfold W RenewalR28.mc
  split_ifs <;> positivity

theorem separator :
    InPolygon 5 6 5 0 ∧ InPolygon 5 6 5 1 ∧ InPolygon 5 6 5 2 ∧
    (5+2)/2=3 ∧ (5+2+1)/2=4 ∧
    W 5 5 0 5=1 ∧ W 5 5 2 2=48 ∧ W 5 5 1 3=4 ∧ W 5 5 1 4=10 ∧
    W 5 5 0 5 * W 5 5 2 2 > W 5 5 1 ((5+2)/2) * W 5 5 1 ((5+2+1)/2) ∧
    (∑ s ∈ Finset.range 6, W 5 5 0 s)=1 ∧
    (∑ s ∈ Finset.range 6, W 5 5 1 s)=14 ∧
    (∑ s ∈ Finset.range 6, W 5 5 2 s)=117 ∧
    (14:ℤ)^2-1*117=79 := by
  norm_num [InPolygon,W,RenewalR28.mc,Finset.sum_range_succ,Nat.choose]

/-- The committed scan also separates compatibility away from the degree corner. -/
theorem noncorner_separator :
    InPolygon 8 9 9 0 ∧ InPolygon 8 9 9 1 ∧ InPolygon 8 9 9 2 ∧
    (7+4)/2=5 ∧ (7+4+1)/2=6 ∧
    W 8 9 0 7=8 ∧ W 8 9 2 4=630 ∧ W 8 9 1 5=42 ∧ W 8 9 1 6=112 ∧
    W 8 9 0 7*W 8 9 2 4 > W 8 9 1 ((7+4)/2)*W 8 9 1 ((7+4+1)/2) ∧
    (∑ s ∈ Finset.range 9, W 8 9 0 s)=8 ∧
    (∑ s ∈ Finset.range 9, W 8 9 1 s)=154 ∧
    (∑ s ∈ Finset.range 9, W 8 9 2 s)=1590 ∧
    (154:ℤ)^2-8*1590=10996 := by
  norm_num [InPolygon,W,RenewalR28.mc,Finset.sum_range_succ,Nat.choose]

end
end MidpointR36

#print axioms MidpointR36.separator
#print axioms MidpointR36.noncorner_separator
