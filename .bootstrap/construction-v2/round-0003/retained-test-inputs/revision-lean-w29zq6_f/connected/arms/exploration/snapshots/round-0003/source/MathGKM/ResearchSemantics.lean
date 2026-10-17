-- Machine-authored by the independent Codex/gpt-6-astra builder, 2026-10-17.
-- Generic foundations only. VALIDATION NOT YET RUN on this source.
import Lean

namespace MathGKM.ResearchSemantics
universe u v w z

/-- Models of an extension retract onto the old models. The section supplies
every old model with a compatible extension; it is a substantive obligation. -/
structure ConservativeExtension (Base : Type u) (Extended : Type v) where
  forget : Extended → Base
  extend : Base → Extended
  forget_extend : ∀ b, forget (extend b) = b

namespace ConservativeExtension
variable {B : Type u} {E : Type v} {F : Type w}

theorem preserves (a : ConservativeExtension B E) (P : B → Prop)
    (h : ∀ b, P b) : ∀ e, P (a.forget e) := fun e => h (a.forget e)

theorem reflects (a : ConservativeExtension B E) (P : B → Prop)
    (h : ∀ e, P (a.forget e)) : ∀ b, P b := by
  intro b
  simpa only [a.forget_extend b] using h (a.extend b)

def compose (a : ConservativeExtension B E) (b : ConservativeExtension E F) :
    ConservativeExtension B F where
  forget := a.forget ∘ b.forget
  extend := b.extend ∘ a.extend
  forget_extend := by intro x; simp [Function.comp_def, b.forget_extend, a.forget_extend]

/-- An uninhabited fiber would invalidate this construction. -/
def attach (B : Type u) (Cell : B → Type v) (witness : ∀ b, Cell b) :
    ConservativeExtension B (Sigma Cell) where
  forget := Sigma.fst
  extend := fun b => ⟨b, witness b⟩
  forget_extend := fun _ => rfl
end ConservativeExtension

/-- Exact observational transport, not mere agreement of type names. -/
structure Representation (A : Type u) (B : Type v) (P : A → Prop) (Q : B → Prop) where
  forward : A → B
  law : ∀ a, Q (forward a) ↔ P a

theorem Representation.consume {A : Type u} {B : Type v} {P : A → Prop} {Q : B → Prop}
    (r : Representation A B P Q) (h : ∀ b, Q b) : ∀ a, P a :=
  fun a => (r.law a).mp (h (r.forward a))

theorem collision_obstructs_transport {A : Type u} {B : Type v}
    (f : A → B) (P : A → Prop) (Q : B → Prop) (a b : A)
    (same : f a = f b) (different : ¬ (P a ↔ P b)) :
    ¬ (∀ x, Q (f x) ↔ P x) := by
  intro h
  apply different
  exact (h a).symm.trans (by simpa only [same] using h b)

/-- The semantic gluing here is a pullback of model interpretations, not a
symbol union and not an assertion about arbitrary dependent source edits. -/
def Compatible {B : Type u} {L : Type v} {R : Type w} (l : L → B) (r : R → B) :=
  {p : L × R // l p.1 = r p.2}

def glue {B : Type u} {L : Type v} {R : Type w} {X : Type z}
    (l : L → B) (r : R → B) (f : X → L) (g : X → R)
    (commutes : ∀ x, l (f x) = r (g x)) : X → Compatible l r :=
  fun x => ⟨(f x, g x), commutes x⟩

theorem glue_unique {B : Type u} {L : Type v} {R : Type w} {X : Type z}
    (l : L → B) (r : R → B) (f : X → L) (g : X → R)
    (commutes : ∀ x, l (f x) = r (g x)) (h : X → Compatible l r)
    (left : ∀ x, (h x).val.1 = f x) (right : ∀ x, (h x).val.2 = g x) :
    h = glue l r f g commutes := by
  funext x
  apply Subtype.ext
  exact Prod.ext (left x) (right x)

/-- Families over a base have a concrete cocartesian extension: dependent sum
over each fiber of the base map. The following factorization is its universal
property. No model-category cofibration is claimed. -/
def Push {I : Type u} {J : Type v} (f : I → J) (F : I → Type w) (j : J) :=
  Σ i, {x : F i // f i = j}

def pushUnit {I : Type u} {J : Type v} (f : I → J) (F : I → Type w)
    (i : I) (x : F i) : Push f F (f i) := ⟨i, x, rfl⟩

def pushLift {I : Type u} {J : Type v} {f : I → J} {F : I → Type w}
    {G : J → Type z} (h : ∀ i, F i → G (f i)) : ∀ j, Push f F j → G j :=
  fun _ ⟨i, x, eq⟩ => eq ▸ h i x

theorem push_beta {I : Type u} {J : Type v} {f : I → J} {F : I → Type w}
    {G : J → Type z} (h : ∀ i, F i → G (f i)) (i : I) (x : F i) :
    pushLift h (f i) (pushUnit f F i x) = h i x := rfl

theorem push_unique {I : Type u} {J : Type v} {f : I → J} {F : I → Type w}
    {G : J → Type z} (h : ∀ i, F i → G (f i))
    (k : ∀ j, Push f F j → G j)
    (beta : ∀ i x, k (f i) (pushUnit f F i x) = h i x) : k = pushLift h := by
  funext j p
  rcases p with ⟨i, x, eq⟩
  cases eq
  exact beta i x
end MathGKM.ResearchSemantics
