import MathGKM.MarkovRecurrenceR0002

/-! Machine-authored 2026-10-19. Independent three-variable path recurrence,
transcribed after comparison with source equations (5), (7), (8).
The recurrence definitions below do not use H or liftHomogeneous.
Rational source-family identification remains a separate obligation. -/
namespace MathGKM.Markov
noncomputable section

@[ext] structure NumeratorLabel where
  a : ℕ
  b : ℕ
  p : TriPoly

@[ext] structure NumeratorFrame where
  lo : NumeratorLabel
  mid : NumeratorLabel
  hi : NumeratorLabel

def numeratorInitial : NumeratorFrame :=
  ⟨⟨0,1,1⟩, ⟨1,2,(u+v)^2+u*w⟩, ⟨1,1,u+v⟩⟩

def numeratorAdvance (f : NumeratorFrame) (right : Bool) : NumeratorFrame :=
  if right then
    ⟨f.mid, ⟨f.mid.a+f.hi.a, f.mid.b+f.hi.b,
      (u+v+w)*f.hi.p*f.mid.p-u^f.hi.a*v^f.hi.b*w^(f.hi.a+f.hi.b)*f.lo.p⟩, f.hi⟩
  else
    ⟨f.lo, ⟨f.lo.a+f.mid.a, f.lo.b+f.mid.b,
      (u+v+w)*f.lo.p*f.mid.p-u^f.lo.a*v^f.lo.b*w^(f.lo.a+f.lo.b)*f.hi.p⟩, f.mid⟩

def numeratorFrame (path : List Bool) : NumeratorFrame :=
  path.foldl numeratorAdvance numeratorInitial

def liftedLabel (L : Label) : NumeratorLabel := ⟨L.a,L.b,H L⟩
def liftedFrame (f : Frame) : NumeratorFrame :=
  ⟨liftedLabel f.lo, liftedLabel f.mid, liftedLabel f.hi⟩

theorem initial_H_lo : H initial.lo = 1 := by
  symm
  apply Acceptedcb1615e51542ac6eb2dd5748.obligation
  · exact hom_one
  · simp [specializeW, initial]

theorem initial_H_hi : H initial.hi = u+v := by
  symm
  apply Acceptedcb1615e51542ac6eb2dd5748.obligation
  · exact hom_add hom_u hom_v
  · change specW (u+v) = U+V
    simp only [spec_add, spec_u, spec_v]

theorem initial_H_mid : H initial.mid = (u+v)^2+u*w := by
  symm
  apply Acceptedcb1615e51542ac6eb2dd5748.obligation
  · exact hom_add (hom_pow (hom_add hom_u hom_v) 2) (hom_mul hom_u hom_w)
  · change specW ((u+v)^2+u*w) = (U+V)^2+U
    simp only [spec_add, spec_pow, spec_mul, spec_u, spec_v, spec_w, mul_one]

theorem initial_identification : liftedFrame initial = numeratorInitial := by
  apply NumeratorFrame.ext
  · apply NumeratorLabel.ext <;> try rfl
    exact initial_H_lo
  · apply NumeratorLabel.ext <;> try rfl
    exact initial_H_mid
  · apply NumeratorLabel.ext <;> try rfl
    exact initial_H_hi

theorem advance_identification (p : List Bool) (r : Bool) :
    liftedFrame (advance (frame p) r) = numeratorAdvance (liftedFrame (frame p)) r := by
  cases r
  · apply NumeratorFrame.ext
    · rfl
    · apply NumeratorLabel.ext
      · rfl
      · rfl
      · exact mutation_false p
    · rfl
  · apply NumeratorFrame.ext
    · rfl
    · apply NumeratorLabel.ext
      · rfl
      · rfl
      · exact mutation_true p
    · rfl

theorem numeratorFrame_append (p q : List Bool) :
    numeratorFrame (p++q) = q.foldl numeratorAdvance (numeratorFrame p) := by
  simp [numeratorFrame, List.foldl_append]

theorem all_path_identification (p : List Bool) :
    numeratorFrame p = liftedFrame (frame p) := by
  induction p using List.reverseRecOn with
  | nil => exact initial_identification.symm
  | append_singleton p r ih =>
    rw [numeratorFrame_append, frame_append]
    simp only [List.foldl_cons, List.foldl_nil]
    rw [ih]
    exact (advance_identification p r).symm

#print axioms all_path_identification
end
end MathGKM.Markov
