import MathGKM.MarkovCoverageR0000

/-! Machine-authored 2026-10-19, round 3. Strict intervals use only natural
cross products. These results concern the generated family. -/
namespace MathGKM.Markov

def LabelLT (x y : Label) : Prop := x.a * y.b < y.a * x.b

theorem labelLT_trans {x y z : Label} (_hy : 0 < y.b)
    (hxy : LabelLT x y) (hyz : LabelLT y z) : LabelLT x z := by
  unfold LabelLT at *
  have h1 := Nat.mul_le_mul_right z.b (Nat.le_of_lt hxy)
  have h2 := Nat.mul_lt_mul_of_pos_right hyz (by
    have : 0 < x.b := by nlinarith
    exact this)
  have h3 : (x.a * z.b) * y.b < (z.a * x.b) * y.b := by
    nlinarith only [h1, h2]
  exact Nat.lt_of_mul_lt_mul_right h3

theorem farey_mid_bounds (f : Frame) (hf : FareyFrame f) :
    LabelLT f.lo f.mid ∧ LabelLT f.mid f.hi ∧ 0 < f.mid.b := by
  rcases hf with ⟨⟨ha,hb⟩,hd,hl,hh,rest⟩
  unfold LabelLT
  constructor
  · nlinarith
  constructor
  · nlinarith
  · omega

theorem descendant_bounds (q : List Bool) (f : Frame) (hf : FareyFrame f) :
    LabelLT f.lo (q.foldl advance f).mid ∧
    LabelLT (q.foldl advance f).mid f.hi ∧
    0 < (q.foldl advance f).mid.b := by
  induction q generalizing f with
  | nil => exact farey_mid_bounds f hf
  | cons r q ih =>
    have h := ih (advance f r) (farey_advance f hf r)
    have hm := farey_mid_bounds f hf
    cases r
    · change LabelLT f.lo (q.foldl advance (advance f false)).mid ∧
        LabelLT (q.foldl advance (advance f false)).mid f.hi ∧ _
      exact ⟨h.1, labelLT_trans hm.2.2 h.2.1 hm.2.1, h.2.2⟩
    · change LabelLT f.lo (q.foldl advance (advance f true)).mid ∧
        LabelLT (q.foldl advance (advance f true)).mid f.hi ∧ _
      exact ⟨labelLT_trans hm.2.2 hm.1 h.1, h.2.1, h.2.2⟩

theorem branch_bounds (q : List Bool) (f : Frame) (hf : FareyFrame f) :
    LabelLT (q.foldl advance (advance f false)).mid f.mid ∧
    LabelLT f.mid (q.foldl advance (advance f true)).mid := by
  exact ⟨(descendant_bounds q _ (farey_advance f hf false)).2.1,
    (descendant_bounds q _ (farey_advance f hf true)).1⟩

theorem fold_path_unique (p q : List Bool) (f : Frame) (hf : FareyFrame f)
    (he : (p.foldl advance f).mid.a * (q.foldl advance f).mid.b =
      (q.foldl advance f).mid.a * (p.foldl advance f).mid.b) : p = q := by
  induction p generalizing q f with
  | nil =>
    cases q with
    | nil => rfl
    | cons r q =>
      have h := branch_bounds q f hf
      cases r <;> simp only [List.foldl_nil, List.foldl_cons] at he
      · have := h.1
        unfold LabelLT at this
        omega
      · have := h.2
        unfold LabelLT at this
        omega
  | cons r p ih =>
    cases q with
    | nil =>
      have h := branch_bounds p f hf
      cases r <;> simp only [List.foldl_nil, List.foldl_cons] at he
      · have := h.1
        unfold LabelLT at this
        omega
      · have := h.2
        unfold LabelLT at this
        omega
    | cons s q =>
      by_cases hrs : r = s
      · subst s
        exact congrArg (List.cons r) (ih q (advance f r) (farey_advance f hf r) he)
      · have hp := branch_bounds p f hf
        have hq := branch_bounds q f hf
        have hm := (farey_mid_bounds f hf).2.2
        cases r <;> cases s <;> try contradiction
        · have h := labelLT_trans hm hp.1 hq.2
          unfold LabelLT at h
          simp only [List.foldl_cons] at he
          omega
        · have h := labelLT_trans hm hq.1 hp.2
          unfold LabelLT at h
          simp only [List.foldl_cons] at he
          omega

theorem frame_path_unique (p q : List Bool)
    (he : (frame p).mid.a * (frame q).mid.b =
      (frame q).mid.a * (frame p).mid.b) : p = q := by
  exact fold_path_unique p q initial (frame_farey []) he

theorem frame_mid_strict (p : List Bool) :
    0 < (frame p).mid.a ∧ (frame p).mid.a < (frame p).mid.b := by
  have h := descendant_bounds p initial (frame_farey [])
  simpa [LabelLT, initial, frame] using And.intro h.1 h.2.1

#print axioms frame_path_unique
end MathGKM.Markov
