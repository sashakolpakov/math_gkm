import MathGKM.Round41AntidiagonalA

/-! Machine-authored round41. One symbolically derived separator of grouped signs.
Its positive raw margin is recovered separately from the admitted exact formula. -/
namespace GroupedSignsR41
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem witness_weights (s : ℕ) (hs : s ≤ 10) :
    MidpointR36.W 10 10 0 s = (if s=10 then 1 else 0) ∧
    MidpointR36.W 10 10 1 s = (if s=8 then 9 else if s=9 then 20 else 0) ∧
    MidpointR36.W 10 10 2 s = (if s=6 then 84 else if s=7 then 288 else if s=8 then 270 else 0) := by
  interval_cases s <;> norm_num [MidpointR36.W, RenewalR28.mc, Nat.choose]

theorem witness_ordered_pairs (s t : ℕ) (hs : s ≤ 10) (ht : t ≤ 10) :
    (if s+t=16 then
      MidpointR36.W 10 10 1 s * MidpointR36.W 10 10 1 t -
      MidpointR36.W 10 10 0 s * MidpointR36.W 10 10 2 t else 0) =
    (if s=8 ∧ t=8 then 81 else if s=10 ∧ t=6 then -84 else 0) := by
  rcases witness_weights s hs with ⟨ha,hb,hc⟩
  rcases witness_weights t ht with ⟨ha',hb',hc'⟩
  rw [ha,hb,hb',hc']
  split_ifs <;> omega

theorem witness_groups (l : ℕ) :
    GroupedR40.group 10 10 0 0 1 l =
      (if l=16 then -3 else if l=17 then 72 else if l=18 then 130 else 0) := by
  norm_num [GroupedR40.group, MidpointR36.W, RenewalR28.mc,
    Finset.sum_range_succ, Nat.choose, eq_comm]
  split_ifs <;> omega

theorem witness_recovery :
    coeff (frame (List.replicate 9 true)).mid.p 10 0 = 1 ∧
    coeff (frame (List.replicate 9 true)).mid.p 10 1 = 29 ∧
    coeff (frame (List.replicate 9 true)).mid.p 10 2 = 642 := by
  have recover (j : ℕ) := Acceptedb6d2ec5febf447178088c884.obligation 10 (by omega) 10 j
  constructor
  · rw [show 9=10-1 by omega, recover]
    norm_num [MidpointR36.W, RenewalR28.mc, Finset.sum_range_succ, Nat.choose]
  · constructor
    · rw [show 9=10-1 by omega, recover]
      norm_num [MidpointR36.W, RenewalR28.mc, Finset.sum_range_succ, Nat.choose]
    · rw [show 9=10-1 by omega, recover]
      norm_num [MidpointR36.W, RenewalR28.mc, Finset.sum_range_succ, Nat.choose]

theorem grouped_separator :
    InPolygon 10 11 10 0 ∧ InPolygon 10 11 10 1 ∧ InPolygon 10 11 10 2 ∧
    16 ≤ 2*(10 : ℕ) ∧
    GroupedR40.group 10 10 0 0 1 16 = -3 ∧
    GroupedR40.group 10 10 0 0 1 17 = 72 ∧
    GroupedR40.group 10 10 0 0 1 18 = 130 ∧
    (∀ s t : ℕ, s ≤ 10 → t ≤ 10 →
      (if s+t=16 then MidpointR36.W 10 10 1 s * MidpointR36.W 10 10 1 t -
        MidpointR36.W 10 10 0 s * MidpointR36.W 10 10 2 t else 0) =
      (if s=8 ∧ t=8 then 81 else if s=10 ∧ t=6 then -84 else 0)) ∧
    coeff (frame (List.replicate 9 true)).mid.p 10 0 = 1 ∧
    coeff (frame (List.replicate 9 true)).mid.p 10 1 = 29 ∧
    coeff (frame (List.replicate 9 true)).mid.p 10 2 = 642 ∧
    coeff (frame (List.replicate 9 true)).mid.p 10 1 ^ 2 -
      coeff (frame (List.replicate 9 true)).mid.p 10 0 *
        coeff (frame (List.replicate 9 true)).mid.p 10 2 = 199 := by
  rcases witness_recovery with ⟨h0,h1,h2⟩
  refine ⟨by norm_num [InPolygon], by norm_num [InPolygon], by norm_num [InPolygon],
    by omega, ?_, ?_, ?_, witness_ordered_pairs, h0, h1, h2, ?_⟩
  · simpa using witness_groups 16
  · simpa using witness_groups 17
  · simpa using witness_groups 18
  · rw [h0,h1,h2]
    norm_num

theorem witness_labels :
    (frame (List.replicate 9 true)).mid.a = 10 ∧
    (frame (List.replicate 9 true)).mid.b = 11 := by
  exact ⟨(RightR30.right_labels 9).2.1, (RightR30.right_labels 9).2.2⟩

theorem vertical_prediction_false :
    ¬ (∀ n : ℕ, 1 ≤ n → ∀ i j : ℕ,
      InPolygon n (n+1) i j → InPolygon n (n+1) i (j+1) →
      InPolygon n (n+1) i (j+2) →
      ∀ l : ℕ, l ≤ 2*n → 0 ≤ GroupedR40.group n i j 0 1 l) := by
  intro hv
  have h := hv 10 (by omega) 10 0
    (by norm_num [InPolygon]) (by norm_num [InPolygon]) (by norm_num [InPolygon]) 16 (by omega)
  rw [witness_groups] at h
  norm_num at h

end
end GroupedSignsR41

#print axioms GroupedSignsR41.grouped_separator
#print axioms GroupedSignsR41.vertical_prediction_false
