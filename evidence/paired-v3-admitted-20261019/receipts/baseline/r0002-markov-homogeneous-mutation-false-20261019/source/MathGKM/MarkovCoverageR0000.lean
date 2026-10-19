import MathGKM.Markov

/-! Machine-authored 2026-10-19, round 0. Arithmetic label results only.
No source-family or coefficient correspondence is assumed. -/
namespace MathGKM.Markov

/-- The middle label is the mediant of the outside labels. -/
def MediantFrame (f : Frame) : Prop :=
  f.mid.a = f.lo.a + f.hi.a ∧ f.mid.b = f.lo.b + f.hi.b

/-- Determinants are encoded without truncated subtraction. -/
def FareyFrame (f : Frame) : Prop :=
  MediantFrame f ∧
  f.lo.b * f.hi.a = f.lo.a * f.hi.b + 1 ∧
  0 < f.lo.b ∧ 0 < f.hi.b ∧
  f.lo.a ≤ f.lo.b ∧ f.hi.a ≤ f.hi.b

theorem farey_advance (f : Frame) (h : FareyFrame f) (r : Bool) :
    FareyFrame (advance f r) := by
  rcases h with ⟨⟨ha, hb⟩, hd, hl, hh, hla, hha⟩
  cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte, FareyFrame, MediantFrame]
  · refine ⟨by trivial, ?_, hl, ?_, hla, ?_⟩
    · nlinarith
    · omega
    · omega
  · refine ⟨by trivial, ?_, ?_, hh, ?_, hha⟩
    · nlinarith
    · omega
    · omega

theorem frame_append (p q : List Bool) :
    frame (p ++ q) = q.foldl advance (frame p) := by
  simp [frame, List.foldl_append]

theorem frame_farey (p : List Bool) : FareyFrame (frame p) := by
  induction p using List.reverseRecOn with
  | nil => norm_num [frame, initial, FareyFrame, MediantFrame]
  | append_singleton p r ih =>
    simpa [frame_append] using farey_advance (frame p) ih r

theorem frame_adjacent_determinants (p : List Bool) :
    (frame p).lo.b * (frame p).mid.a =
      (frame p).lo.a * (frame p).mid.b + 1 ∧
    (frame p).mid.b * (frame p).hi.a =
      (frame p).mid.a * (frame p).hi.b + 1 := by
  rcases frame_farey p with ⟨⟨ha, hb⟩, hd, _⟩
  constructor <;> nlinarith

/-- Positive coprime coordinates in a mediant frame are reached by subtraction. -/
theorem weighted_coverage (m n : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hc : Nat.Coprime m n) (f : Frame) (hf : MediantFrame f) :
    ∃ q : List Bool,
      (q.foldl advance f).mid.a = m * f.lo.a + n * f.hi.a ∧
      (q.foldl advance f).mid.b = m * f.lo.b + n * f.hi.b := by
  generalize hk : m + n = k
  induction k using Nat.strong_induction_on generalizing m n f with
  | h k ih =>
    by_cases he : m = n
    · subst n
      have hm1 : m = 1 := by simpa [Nat.Coprime] using hc
      subst m
      exact ⟨[], by simpa [MediantFrame] using hf⟩
    · rcases lt_or_gt_of_ne he with hlt | hgt
      · have hsub : 0 < n - m := Nat.sub_pos_of_lt hlt
        have hcop : Nat.Coprime m (n - m) :=
          (Nat.coprime_sub_self_right (Nat.le_of_lt hlt)).2 hc
        have hsum : m + (n - m) < k := by omega
        obtain ⟨q, ha, hb⟩ := ih (m + (n-m)) hsum m (n-m) hm hsub hcop
          (advance f true) ⟨rfl, rfl⟩ rfl
        refine ⟨true :: q, ?_, ?_⟩
        · simp only [List.foldl_cons]
          rw [ha]
          simp only [advance, ↓reduceIte]
          rcases hf with ⟨hfa, hfb⟩
          rw [hfa]
          have hs := Nat.sub_add_cancel (Nat.le_of_lt hlt)
          nlinarith only [congrArg (fun t : ℕ => t * f.hi.a) hs]
        · simp only [List.foldl_cons]
          rw [hb]
          simp only [advance, ↓reduceIte]
          rcases hf with ⟨hfa, hfb⟩
          rw [hfb]
          have hs := Nat.sub_add_cancel (Nat.le_of_lt hlt)
          nlinarith only [congrArg (fun t : ℕ => t * f.hi.b) hs]
      · have hsub : 0 < m - n := Nat.sub_pos_of_lt hgt
        have hcop : Nat.Coprime (m - n) n :=
          (Nat.coprime_sub_self_left (Nat.le_of_lt hgt)).2 hc
        have hsum : (m - n) + n < k := by omega
        obtain ⟨q, ha, hb⟩ := ih ((m-n) + n) hsum (m-n) n hsub hn hcop
          (advance f false) ⟨rfl, rfl⟩ rfl
        refine ⟨false :: q, ?_, ?_⟩
        · simp only [List.foldl_cons]
          rw [ha]
          simp only [advance, Bool.false_eq_true, ↓reduceIte]
          rcases hf with ⟨hfa, hfb⟩
          rw [hfa]
          have hs := Nat.sub_add_cancel (Nat.le_of_lt hgt)
          nlinarith only [congrArg (fun t : ℕ => t * f.lo.a) hs]
        · simp only [List.foldl_cons]
          rw [hb]
          simp only [advance, Bool.false_eq_true, ↓reduceIte]
          rcases hf with ⟨hfa, hfb⟩
          rw [hfb]
          have hs := Nat.sub_add_cancel (Nat.le_of_lt hgt)
          nlinarith only [congrArg (fun t : ℕ => t * f.lo.b) hs]

/-- Every reduced positive rational at most one is the endpoint or a path label. -/
theorem reduced_pair_coverage (a b : ℕ) (ha : 0 < a) (hab : a ≤ b)
    (hc : Nat.Coprime a b) :
    (a = 1 ∧ b = 1) ∨
      ∃ p : List Bool, (frame p).mid.a = a ∧ (frame p).mid.b = b := by
  by_cases he : a = b
  · subst b
    have ha1 : a = 1 := by simpa [Nat.Coprime] using hc
    exact Or.inl ⟨ha1, ha1⟩
  · have hlt : a < b := lt_of_le_of_ne hab he
    have hm : 0 < b-a := Nat.sub_pos_of_lt hlt
    have hcop : Nat.Coprime (b-a) a :=
      (Nat.coprime_sub_self_left hab).2 hc.symm
    obtain ⟨p, hp⟩ := weighted_coverage (b-a) a hm ha hcop initial (by
      norm_num [MediantFrame, initial])
    right
    refine ⟨p, ?_⟩
    simpa [frame, initial, Nat.sub_add_cancel hab] using hp

#print axioms frame_farey
#print axioms frame_adjacent_determinants
#print axioms reduced_pair_coverage
end MathGKM.Markov
