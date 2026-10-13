-- Codex/Astra round 2. A pushout of types, not dependent declaration attachment.
import Mathlib.Data.Quot

namespace MathGKM.Gluing

variable {A B C : Type} (f : A → B) (g : A → C)

inductive Boundary : B ⊕ C → B ⊕ C → Prop
  | identify (a : A) : Boundary (.inl (f a)) (.inr (g a))

abbrev Pushout := Quot (Boundary f g)

def left (b : B) : Pushout f g := Quot.mk _ (.inl b)
def right (c : C) : Pushout f g := Quot.mk _ (.inr c)

theorem square (a : A) : left f g (f a) = right f g (g a) :=
  Quot.sound (Boundary.identify a)

def descend {D : Type} (u : B → D) (v : C → D)
    (compatible : ∀ a, u (f a) = v (g a)) : Pushout f g → D :=
  Quot.lift (Sum.elim u v) (by
    intro x y h
    cases h with
    | identify a => exact compatible a)

theorem descend_left {D : Type} (u : B → D) (v : C → D)
    (h : ∀ a, u (f a) = v (g a)) (b : B) :
    descend f g u v h (left f g b) = u b := rfl

theorem descend_right {D : Type} (u : B → D) (v : C → D)
    (h : ∀ a, u (f a) = v (g a)) (c : C) :
    descend f g u v h (right f g c) = v c := rfl

theorem unique {D : Type} (u : B → D) (v : C → D)
    (compatible : ∀ a, u (f a) = v (g a))
    (w : Pushout f g → D) (hl : ∀ b, w (left f g b) = u b)
    (hr : ∀ c, w (right f g c) = v c) : w = descend f g u v compatible := by
  funext q
  induction q using Quot.inductionOn with
  | h x => cases x with
    | inl b => exact hl b
    | inr c => exact hr c

/-- Compatibility is necessary, not merely sufficient. -/
theorem necessary {D : Type} (u : B → D) (v : C → D)
    (w : Pushout f g → D) (hl : ∀ b, w (left f g b) = u b)
    (hr : ∀ c, w (right f g c) = v c) (a : A) : u (f a) = v (g a) := by
  rw [← hl, ← hr, square]

theorem conflicting_binding :
    ¬ ∃ w : Pushout (fun _ : Unit => ()) (fun _ : Unit => ()) → Bool,
      (∀ b, w (left _ _ b) = false) ∧ (∀ c, w (right _ _ c) = true) := by
  rintro ⟨w, hl, hr⟩
  have h := necessary (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ => false) (fun _ => true) w hl hr ()
  cases h

end MathGKM.Gluing
