import MarkovCoverage098

/-! Machine-authored worker 098a5a66. Positive endpoint weights uniquely encode
paths, hence every reduced interior rational has exactly one path. -/
namespace MathGKM.Markov

def pathWeights098 : List Bool → ℕ × ℕ
  | [] => (1, 1)
  | false :: p => let w := pathWeights098 p; (w.1 + w.2, w.2)
  | true :: p => let w := pathWeights098 p; (w.1, w.1 + w.2)

theorem weights_positive_098 (p : List Bool) :
    0 < (pathWeights098 p).1 ∧ 0 < (pathWeights098 p).2 := by
  induction p with
  | nil => simp [pathWeights098]
  | cons r p ih => cases r <;> simp only [pathWeights098] <;> omega

theorem weights_injective_098 : Function.Injective pathWeights098 := by
  intro p
  induction p with
  | nil =>
    intro q h
    cases q with
    | nil => rfl
    | cons s q =>
      have hq := weights_positive_098 q
      have h1 := congrArg Prod.fst h
      have h2 := congrArg Prod.snd h
      cases s <;> simp only [pathWeights098] at h1 h2 <;> omega
  | cons r p ih =>
    intro q h
    have hp := weights_positive_098 p
    cases q with
    | nil =>
      have h1 := congrArg Prod.fst h
      have h2 := congrArg Prod.snd h
      cases r <;> simp only [pathWeights098] at h1 h2 <;> omega
    | cons s q =>
      have hq := weights_positive_098 q
      have h1 := congrArg Prod.fst h
      have h2 := congrArg Prod.snd h
      cases r <;> cases s <;> simp only [pathWeights098] at h1 h2
      · have hw : pathWeights098 p = pathWeights098 q := Prod.ext (by omega) (by omega)
        exact congrArg (List.cons false) (ih hw)
      · omega
      · omega
      · have hw : pathWeights098 p = pathWeights098 q := Prod.ext (by omega) (by omega)
        exact congrArg (List.cons true) (ih hw)

theorem weights_labels_098 (p : List Bool) (f : Frame) (hf : FrameIndices f) :
    (p.foldl advance f).mid.a = (pathWeights098 p).1 * f.lo.a +
      (pathWeights098 p).2 * f.hi.a ∧
    (p.foldl advance f).mid.b = (pathWeights098 p).1 * f.lo.b +
      (pathWeights098 p).2 * f.hi.b := by
  induction p generalizing f with
  | nil => simpa [pathWeights098] using And.intro hf.1 hf.2.1
  | cons r p ih =>
    have hh := ih (advance f r) (indices_advance hf r)
    cases r <;> simp only [List.foldl_cons, pathWeights098, advance,
      Bool.false_eq_true, if_false, if_true] at hh ⊢
    · constructor
      · rw [hh.1, hf.1]; ring
      · rw [hh.2, hf.2.1]; ring
    · constructor
      · rw [hh.1, hf.1]; ring
      · rw [hh.2, hf.2.1]; ring

theorem frame_path_injective_098 {p q : List Bool}
    (ha : (frame p).mid.a = (frame q).mid.a)
    (hb : (frame p).mid.b = (frame q).mid.b) : p = q := by
  have hp := weights_labels_098 p initial indices_initial
  have hq := weights_labels_098 q initial indices_initial
  simp only [initial, mul_zero, mul_one, zero_add] at hp hq
  change (p.foldl advance initial).mid.a = (q.foldl advance initial).mid.a at ha
  change (p.foldl advance initial).mid.b = (q.foldl advance initial).mid.b at hb
  apply weights_injective_098
  apply Prod.ext <;> omega

/-- Exact existence and uniqueness; no bound on the denominator or path. -/
theorem rational_unique_098 {a b : ℕ} (ha : 0 < a) (hab : a < b)
    (hc : Nat.Coprime a b) :
    ∃! path : List Bool, (frame path).mid.a = a ∧ (frame path).mid.b = b := by
  obtain ⟨p, hp⟩ := rational_coverage_098 ha hab hc
  refine ⟨p, hp, ?_⟩
  intro q hq
  exact frame_path_injective_098 (hq.1.trans hp.1.symm) (hq.2.trans hp.2.symm)

theorem rational_range_098 (a b : ℕ) :
    (∃ path : List Bool, (frame path).mid.a = a ∧ (frame path).mid.b = b) ↔
    0 < a ∧ a < b ∧ Nat.Coprime a b := by
  constructor
  · rintro ⟨p, rfl, rfl⟩
    exact frame_reduced p
  · rintro ⟨ha, hab, hc⟩
    exact rational_coverage_098 ha hab hc

#print axioms weights_positive_098
#print axioms weights_injective_098
#print axioms weights_labels_098
#print axioms frame_path_injective_098
#print axioms rational_unique_098
#print axioms rational_range_098
end MathGKM.Markov
