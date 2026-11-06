import MathGKM.Round48SeparatorA
import MathGKM.Acceptedb6d2ec5febf447178088c884

/-! Machine-authored round48: original raw margins at the first kernel separator. -/
namespace OrientedR48
open MathGKM.Markov MidpointR36
open scoped BigOperators
noncomputable section

theorem separator_sums :
    (∑ s ∈ Finset.range 33, W 32 0 34 s)=31 ∧
    (∑ s ∈ Finset.range 33, W 32 1 34 s)=4530 ∧
    (∑ s ∈ Finset.range 33, W 32 2 34 s)=343070 := by
  norm_num [Finset.sum_range_succ,W,RenewalR28.mc,Nat.choose]

theorem separator_raw :
    let P := (frame (List.replicate 31 true)).mid.p
    coeff P 0 34=31 ∧ coeff P 1 34=4530 ∧ coeff P 2 34=343070 ∧
    coeff P 1 34^2-coeff P 0 34*coeff P 2 34=9885730 ∧
    coeff P 0 34*coeff P 2 34 < coeff P 1 34^2 := by
  have h0 := Acceptedb6d2ec5febf447178088c884.obligation 32 (by norm_num) 0 34
  have h1 := Acceptedb6d2ec5febf447178088c884.obligation 32 (by norm_num) 1 34
  have h2 := Acceptedb6d2ec5febf447178088c884.obligation 32 (by norm_num) 2 34
  have hs := separator_sums
  rw [hs.1] at h0
  rw [hs.2.1] at h1
  rw [hs.2.2] at h2
  change coeff (frame (List.replicate 31 true)).mid.p 0 34=31 at h0
  change coeff (frame (List.replicate 31 true)).mid.p 1 34=4530 at h1
  change coeff (frame (List.replicate 31 true)).mid.p 2 34=343070 at h2
  dsimp only
  rw [h0,h1,h2]
  norm_num

end
end OrientedR48
#print axioms OrientedR48.separator_raw
