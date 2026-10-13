-- Machine-authored by Codex/Astra, 2026-10-13. No campaign results claimed.
import Mathlib.Data.Nat.Basic

namespace MathGKM

/-- Models of a context extended by a cell with interpretation relation R. -/
def Attachment {X Y : Type} (C : X → Prop) (R : X → Y → Prop) :=
  {p : X × Y // C p.1 ∧ R p.1 p.2}

def forget {X Y : Type} {C : X → Prop} {R : X → Y → Prop}
    (a : Attachment C R) : X := a.val.1

/-- Every old model extends: this is the actual conservativity obligation. -/
theorem attachment_conservative {X Y : Type} (C : X → Prop) (R : X → Y → Prop)
    (extension : ∀ x, C x → ∃ y, R x y) (P : X → Prop) :
    (∀ a : Attachment C R, P (forget a)) ↔ ∀ x, C x → P x := by
  constructor
  · intro h x hx
    obtain ⟨y, hy⟩ := extension x hx
    exact h ⟨(x, y), hx, hy⟩
  · intro h a
    exact h a.val.1 a.property.1

theorem sequential_extension {X Y Z : Type} (C : X → Prop)
    (R : X → Y → Prop) (S : X → Y → Z → Prop)
    (first : ∀ x, C x → ∃ y, R x y)
    (second : ∀ x y, C x → R x y → ∃ z, S x y z) :
    ∀ x, C x → ∃ yz : Y × Z, R x yz.1 ∧ S x yz.1 yz.2 := by
  intro x hx
  obtain ⟨y, hy⟩ := first x hx
  obtain ⟨z, hz⟩ := second x y hx hy
  exact ⟨(y, z), hy, hz⟩

theorem inconsistent_attachment :
    (∀ a : Attachment (fun _ : Unit => True) (fun _ _ : Unit => False),
      False) ∧ ¬ (∀ _ : Unit, True → False) := by
  constructor
  · intro a; exact a.property.2
  · intro h; exact h () trivial

/-- The consumer must supply an exact predicate transport, not just a map. -/
theorem transport {X Y : Type} (f : X → Y) (P : X → Prop) (Q : Y → Prop)
    (law : ∀ x, P x ↔ Q (f x)) (x : X) : Q (f x) → P x :=
  (law x).mpr

theorem collision_obstruction {X Y : Type} (f : X → Y) (P : X → Prop)
    (a b : X) (collision : f a = f b) (ha : P a) (hb : ¬ P b) :
    ¬ ∃ Q : Y → Prop, ∀ x, P x ↔ Q (f x) := by
  rintro ⟨Q, h⟩
  apply hb
  apply (h b).mpr
  rw [← collision]
  exact (h a).mp ha

theorem lossy_bool :
    ¬ ∃ Q : Unit → Prop, ∀ b : Bool, b = true ↔ Q () := by
  rintro ⟨Q, h⟩
  have bad := (h false).mpr ((h true).mp rfl)
  cases bad

end MathGKM
