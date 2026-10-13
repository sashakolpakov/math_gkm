-- Machine-authored by Codex/gpt-6-astra, 2026-10-13.
import MathGKM.Machine
import MathGKM.Gluing
import Mathlib.Data.Int.Basic
import Mathlib.Logic.Equiv.Defs

namespace MathGKM.Continuation

/-- An engine's executable body. Installed bodies may themselves install or search. -/
inductive Code where
  | halt
  | work (next : Code)
  | search (query : Nat) (next : Code)
  | install (padding : Nat) (program next : Code)
  deriving Repr

def Code.size : Code → Nat
  | .halt => 1
  | .work p | .search _ p => 1 + p.size
  | .install _ p q => 1 + p.size + q.size

inductive Request where
  | science
  | engine (query : Nat)
  deriving Repr

structure Core where
  science : Machine.State
  journal : List (Request × Nat) := []
  deriving Repr

/-- `padding` many executable accounting instructions precede every body invocation. -/
structure Engine where
  padding : Nat
  code : Code
  deriving Repr

structure State where
  core : Core
  engine : Engine
  deriving Repr

structure Response where
  science : Machine.Input := {}
  engine : Option Engine := none
  delay : Nat := 0
  deriving Repr

/-- Responses may depend on the request and accumulated observations, but not on
    accounting padding or elapsed cost. No success/soundness law is assumed. -/
abbrev Environment := Request → Core → Response

structure Result where
  state : State
  cost : Nat
  deriving Repr

/-- One installation operation plus traversal of the new finite body. -/
def installCost (e : Engine) : Nat := 1 + e.code.size

def workState (s : State) (r : Response) : State :=
  { s with core := {
      science := (Machine.dispatch .candidate s.core.science r.science).state
      journal := (.science, r.science.answer) :: s.core.journal } }

def searchState (s : State) (q : Nat) (r : Response) : State :=
  { core := { s.core with journal := (.engine q, r.science.answer) :: s.core.journal }
    engine := r.engine.getD s.engine }

/-- The current body finishes after installing the next body. Search is an
    environmental computation whose delay and any resulting installation are charged. -/
def eval : Code → State → Environment → Result
  | .halt, s, _ => ⟨s, 0⟩
  | .work p, s, env =>
      let r := env .science s.core
      let t := eval p (workState s r) env
      ⟨t.state, (Machine.dispatch .candidate s.core.science r.science).cost + r.delay + t.cost⟩
  | .search q p, s, env =>
      let r := env (.engine q) s.core
      let t := eval p (searchState s q r) env
      ⟨t.state, 1 + r.delay + (r.engine.map installCost).getD 0 + t.cost⟩
  | .install d p next, s, env =>
      let t := eval next { s with engine := ⟨d, p⟩ } env
      ⟨t.state, installCost ⟨d, p⟩ + t.cost⟩

/-- Executing redundant accounting instructions really incurs one unit per instruction. -/
def accounts : Nat → Result → Result
  | 0, r => r
  | n + 1, r => let t := accounts n r; ⟨t.state, 1 + t.cost⟩

theorem accounts_state (n : Nat) (r : Result) : (accounts n r).state = r.state := by
  induction n with
  | zero => simp [accounts]
  | succ n ih => exact ih

theorem accounts_cost (n : Nat) (r : Result) : (accounts n r).cost = n + r.cost := by
  induction n with
  | zero => simp [accounts]
  | succ n ih => simp only [accounts, ih]; omega

/-- One round executes the current engine, including all its searches and installs. -/
def tick (s : State) (env : Environment) : Result :=
  let r := accounts s.engine.padding (eval s.engine.code s env)
  ⟨r.state, 1 + r.cost⟩

theorem tick_state (s : State) (env : Environment) :
    (tick s env).state = (eval s.engine.code s env).state := by
  exact accounts_state _ _

theorem tick_cost (s : State) (env : Environment) :
    (tick s env).cost = 1 + s.engine.padding + (eval s.engine.code s env).cost := by
  simp only [tick, accounts_cost]; omega

abbrev View := Core × Code
def view (s : State) : View := (s.core, s.engine.code)

/-- The candidate has identical observable data and body and no more padding. -/
def Refines (a b : State) : Prop :=
  view a = view b ∧ a.engine.padding ≤ b.engine.padding

theorem eval_simulation (p : Code) (a b : State) (env : Environment)
    (h : Refines a b) :
    Refines (eval p a env).state (eval p b env).state ∧
      (eval p a env).cost = (eval p b env).cost := by
  induction p generalizing a b with
  | halt => exact ⟨h, rfl⟩
  | work p ih =>
      have hc : a.core = b.core := congrArg Prod.fst h.1
      have hs : Refines (workState a (env .science a.core))
          (workState b (env .science b.core)) := by
        rcases h with ⟨hv, hp⟩
        have he : a.engine.code = b.engine.code := congrArg Prod.snd hv
        exact ⟨by simp [view, workState, hc, he], hp⟩
      have ht := ih _ _ hs
      exact ⟨ht.1, by simp only [eval]; rw [ht.2, hc]⟩
  | search q p ih =>
      have hc : a.core = b.core := congrArg Prod.fst h.1
      have hs : Refines (searchState a q (env (.engine q) a.core))
          (searchState b q (env (.engine q) b.core)) := by
        rw [hc]
        cases hr : (env (.engine q) b.core).engine with
        | none =>
            have he : a.engine.code = b.engine.code := congrArg Prod.snd h.1
            exact ⟨by simp [view, searchState, hr, hc, he], by simpa [searchState, hr] using h.2⟩
        | some e => simp [Refines, view, searchState, hr, hc]
      have ht := ih _ _ hs
      exact ⟨ht.1, by simp only [eval]; rw [ht.2, hc]⟩
  | install d p next ihp ih =>
      have hc : a.core = b.core := congrArg Prod.fst h.1
      have hs : Refines { a with engine := ⟨d, p⟩ } { b with engine := ⟨d, p⟩ } := by
        simp [Refines, view, hc]
      have ht := ih _ _ hs
      exact ⟨ht.1, by simp only [eval, ht.2]⟩

theorem tick_simulation (a b : State) (env : Environment) (h : Refines a b) :
    Refines (tick a env).state (tick b env).state ∧
    (tick a env).cost + b.engine.padding = (tick b env).cost + a.engine.padding := by
  have he : a.engine.code = b.engine.code := congrArg Prod.snd h.1
  have ht := eval_simulation b.engine.code a b env h
  constructor
  · simpa only [tick_state, he] using ht.1
  · simp only [tick_cost, he, ht.2]; omega

/-- Padding is semantically invisible even when its order is reversed. -/
theorem tick_view (a b : State) (env : Environment) (h : view a = view b) :
    view (tick a env).state = view (tick b env).state := by
  rcases Nat.le_total a.engine.padding b.engine.padding with hab | hba
  · exact (tick_simulation a b env ⟨h, hab⟩).1.1
  · exact (tick_simulation b a env ⟨h.symm, hba⟩).1.1.symm

/-- The boundary consists of all pairs with the same core and executable body. -/
abbrev Boundary := {p : State × State // view p.1 = view p.2}
def boundaryLeft (a : Boundary) : State := a.val.1
def boundaryRight (a : Boundary) : State := a.val.2
abbrev Glued := Gluing.Pushout boundaryLeft boundaryRight
def embedLeft : State → Glued := Gluing.left boundaryLeft boundaryRight
def embedRight : State → Glued := Gluing.right boundaryLeft boundaryRight

theorem glue_bridge (a b : State) (h : view a = view b) :
    embedLeft a = embedRight b :=
  Gluing.square boundaryLeft boundaryRight ⟨(a, b), h⟩

def gluedView : Glued → View :=
  Gluing.descend boundaryLeft boundaryRight view view (fun a => a.property)

@[simp] theorem gluedView_left (s : State) : gluedView (embedLeft s) = view s := rfl
@[simp] theorem gluedView_right (s : State) : gluedView (embedRight s) = view s := rfl

/-- Compatibility of transitions is proved by the engine simulation, not assumed. -/
def gluedTick (env : Environment) : Glued → Glued :=
  Gluing.descend boundaryLeft boundaryRight
    (fun s => embedLeft (tick s env).state)
    (fun s => embedRight (tick s env).state)
    (fun a => glue_bridge _ _ (tick_view _ _ env a.property))

@[simp] theorem gluedTick_left (env : Environment) (s : State) :
    gluedTick env (embedLeft s) = embedLeft (tick s env).state := rfl
@[simp] theorem gluedTick_right (env : Environment) (s : State) :
    gluedTick env (embedRight s) = embedRight (tick s env).state := rfl

theorem gluedTick_unique (env : Environment) (w : Glued → Glued)
    (hl : ∀ s, w (embedLeft s) = embedLeft (tick s env).state)
    (hr : ∀ s, w (embedRight s) = embedRight (tick s env).state) :
    w = gluedTick env :=
  Gluing.unique boundaryLeft boundaryRight _ _ _ w hl hr

def representative (v : View) : Glued := embedLeft ⟨v.1, ⟨0, v.2⟩⟩

theorem representative_view (v : View) : gluedView (representative v) = v := rfl

theorem representative_glued (q : Glued) : representative (gluedView q) = q := by
  induction q using Quot.inductionOn with
  | h x => cases x with
    | inl s =>
        change embedLeft _ = embedLeft s
        exact (glue_bridge ⟨s.core, ⟨0, s.engine.code⟩⟩ s rfl).trans
          (glue_bridge s s rfl).symm
    | inr s =>
        change embedLeft _ = embedRight s
        exact glue_bridge _ s rfl

/-- The glued object identifies precisely padding and the choice of component;
    it does not accidentally identify different scientific data or bodies. -/
def gluedEquivView : Glued ≃ View where
  toFun := gluedView
  invFun := representative
  left_inv := representative_glued
  right_inv := representative_view

structure Outcome where
  state : State
  observations : List View
  cost : Nat
  deriving Repr

/-- Horizon: exactly n complete engine rounds, including all future searches,
    scientific rewrites, and engine installations within those rounds. -/
def run : Nat → State → Environment → Outcome
  | 0, s, _ => ⟨s, [view s], 0⟩
  | n + 1, s, env =>
      let t := tick s env
      let r := run n t.state env
      ⟨r.state, view s :: r.observations, t.cost + r.cost⟩

def Transition (env : Environment) (s t : State) (cost : Nat) : Prop :=
  tick s env = ⟨t, cost⟩

/-- Finite traces of the transition relation, with additive cost. -/
inductive Execution (env : Environment) : Nat → State → State → Nat → Prop where
  | zero (s) : Execution env 0 s s 0
  | succ {n s t u c d} : Transition env s t c → Execution env n t u d →
      Execution env (n + 1) s u (c + d)

theorem run_execution (n : Nat) (s : State) (env : Environment) :
    Execution env n s (run n s env).state (run n s env).cost := by
  induction n generalizing s with
  | zero => exact Execution.zero s
  | succ n ih => exact Execution.succ (by rfl) (ih _)

theorem execution_unique {n : Nat} {s t : State} {env : Environment} {cost : Nat}
    (h : Execution env n s t cost) :
    t = (run n s env).state ∧ cost = (run n s env).cost := by
  induction h with
  | zero s => exact ⟨rfl, rfl⟩
  | @succ n s t u c d ht htail ih =>
      have hs : (tick s env).state = t := congrArg Result.state ht
      have hc : (tick s env).cost = c := congrArg Result.cost ht
      simpa only [run, hs, hc, ih.1, ih.2] using
        (show (run n t env).state = (run n t env).state ∧
          c + (run n t env).cost = c + (run n t env).cost from ⟨rfl, rfl⟩)

def gluedTrace : Nat → Glued → Environment → List View
  | 0, q, _ => [gluedView q]
  | n + 1, q, env => gluedView q :: gluedTrace n (gluedTick env q) env

theorem run_glued_left (n : Nat) (s : State) (env : Environment) :
    (run n s env).observations = gluedTrace n (embedLeft s) env := by
  induction n generalizing s with
  | zero => rfl
  | succ n ih => simp only [run, gluedTrace, gluedView_left, gluedTick_left, ih]

theorem run_glued_right (n : Nat) (s : State) (env : Environment) :
    (run n s env).observations = gluedTrace n (embedRight s) env := by
  induction n generalizing s with
  | zero => rfl
  | succ n ih => simp only [run, gluedTrace, gluedView_right, gluedTick_right, ih]

/-- This preservation theorem actually factors both traces through the pushout. -/
theorem continuation_observations (n : Nat) (a b : State) (env : Environment)
    (h : view a = view b) :
    (run n a env).observations = (run n b env).observations := by
  rw [run_glued_left, run_glued_right, glue_bridge a b h]

theorem continuation_simulation (n : Nat) (a b : State) (env : Environment)
    (h : Refines a b) :
    Refines (run n a env).state (run n b env).state ∧
      (run n a env).cost ≤ (run n b env).cost := by
  induction n generalizing a b with
  | zero => exact ⟨h, Nat.le_refl 0⟩
  | succ n ih =>
      have ht := tick_simulation a b env h
      have hr := ih _ _ ht.1
      refine ⟨hr.1, ?_⟩
      simp only [run]
      have hp := h.2
      omega

/-- At least the first round's removed accounting cost is saved. Later engines
    can replace themselves immediately; no later savings are presumed. -/
theorem continuation_first_gain (n : Nat) (a b : State) (env : Environment)
    (h : Refines a b) :
    (run (n + 1) a env).cost + b.engine.padding ≤
      (run (n + 1) b env).cost + a.engine.padding := by
  have ht := tick_simulation a b env h
  have hr := continuation_simulation n _ _ env ht.1
  simp only [run]
  omega

def strip (s : State) : State := { s with engine := { s.engine with padding := 0 } }

theorem strip_refines (s : State) : Refines (strip s) s := by
  exact ⟨rfl, Nat.zero_le _⟩

/-- One arithmetic guard operation plus installation, in the declared unit-cost
    semantics. The general theorem is already proved at the comparison state;
    this is not a bound on Lean proof-checking time. -/
def changeCost (s : State) : Nat := 1 + installCost (strip s).engine

/-- A single objective on both branches. Rewards may be any integer function of
    the complete observable trace; every charged unit has disutility one. -/
def utility (reward : List View → Int) (r : Outcome) : Int :=
  reward r.observations - r.cost

/-- Installation and continuation, both charged from the original state. The
    installation changes no core observation and consumes no environmental reply. -/
def switchRun (n : Nat) (s : State) (env : Environment) : Outcome :=
  let r := run n (strip s) env
  { r with cost := changeCost s + r.cost }

/-- Main theorem: a genuine engine change, with its costs, improves the whole
    continuation for every permitted environment and every positive finite horizon. -/
theorem main (n : Nat) (s : State) (env : Environment) (reward : List View → Int)
    (profitable : changeCost s < s.engine.padding) :
    (run (n + 1) (strip s) env).observations = (run (n + 1) s env).observations ∧
    Refines (run (n + 1) (strip s) env).state (run (n + 1) s env).state ∧
    utility reward (run (n + 1) s env) <
      utility reward (switchRun (n + 1) s env) := by
  have ho := continuation_observations (n + 1) (strip s) s env rfl
  have hs := continuation_simulation (n + 1) (strip s) s env (strip_refines s)
  have hg := continuation_first_gain n (strip s) s env (strip_refines s)
  have hp : (strip s).engine.padding = 0 := rfl
  refine ⟨ho, hs.1, ?_⟩
  simp only [utility, switchRun, ho]
  omega

/-- Executable installation guarded by the proved structural sufficient condition. -/
def tryChange (s : State) : Option Result :=
  if changeCost s < s.engine.padding then some ⟨strip s, changeCost s⟩ else none

theorem accepted_change (s : State) (r : Result) (accepted : tryChange s = some r) :
    r.state = strip s ∧ r.cost = changeCost s ∧ changeCost s < s.engine.padding := by
  unfold tryChange at accepted
  split at accepted
  · cases accepted
    exact ⟨rfl, rfl, by assumption⟩
  · contradiction

/-- Installation cost becomes part of the same outcome on which utility is evaluated. -/
def afterChange (n : Nat) (r : Result) (env : Environment) : Outcome :=
  let tail := run n r.state env
  { tail with cost := r.cost + tail.cost }

/-- End-to-end statement for every accepted executable change, not just a
    comparison of unnamed programs. Its proof consumes `main`. -/
theorem installed_main (n : Nat) (s : State) (r : Result) (env : Environment)
    (reward : List View → Int) (accepted : tryChange s = some r) :
    (afterChange (n + 1) r env).observations = (run (n + 1) s env).observations ∧
    utility reward (run (n + 1) s env) < utility reward (afterChange (n + 1) r env) := by
  obtain ⟨hs, hc, hp⟩ := accepted_change s r accepted
  have hm := main n s env reward hp
  simpa only [afterChange, hs, hc, switchRun] using And.intro hm.1 hm.2.2

/-- The final theorem ties the executable change, both transition-relation
    continuations, the glued observation trace, and the one fixed utility together. -/
theorem verified_change (n : Nat) (s : State) (r : Result) (env : Environment)
    (reward : List View → Int) (accepted : tryChange s = some r) :
    Execution env (n + 1) s (run (n + 1) s env).state (run (n + 1) s env).cost ∧
    (∃ continuationCost,
      Execution env (n + 1) r.state (afterChange (n + 1) r env).state continuationCost ∧
      (afterChange (n + 1) r env).cost = r.cost + continuationCost) ∧
    (afterChange (n + 1) r env).observations = (run (n + 1) s env).observations ∧
    utility reward (run (n + 1) s env) < utility reward (afterChange (n + 1) r env) := by
  have hm := installed_main n s r env reward accepted
  exact ⟨run_execution _ _ _, ⟨_, run_execution _ _ _, rfl⟩, hm⟩

/-- Any additional cost still outstanding at the baseline can be included.
    The hypothesis is an explicit syntactic padding bound, not a utility inequality. -/
theorem additional_change_cost (extra n : Nat) (s : State) (env : Environment)
    (reward : List View → Int) (bound : extra + changeCost s < s.engine.padding) :
    utility reward (run (n + 1) s env) <
      utility reward (afterChange (n + 1) ⟨strip s, extra + changeCost s⟩ env) := by
  have ho := continuation_observations (n + 1) (strip s) s env rfl
  have hg := continuation_first_gain n (strip s) s env (strip_refines s)
  have hz : (strip s).engine.padding = 0 := rfl
  simp only [utility, afterChange, ho]
  omega

/-- The same change beats the incumbent at every positive prefix measured from
    the comparison state, not just at the final horizon. -/
theorem every_positive_prefix (s : State) (env : Environment)
    (profitable : changeCost s < s.engine.padding) (j : Nat) :
    changeCost s + (run (j + 1) (strip s) env).cost < (run (j + 1) s env).cost := by
  have h := continuation_first_gain j (strip s) s env (strip_refines s)
  have hz : (strip s).engine.padding = 0 := rfl
  omega

/-- A deadline outcome observed at a completed positive round is retained by
    the candidate. This is an abstract-cost deadline, not a wall-clock claim. -/
theorem deadline_preservation (s : State) (env : Environment)
    (profitable : changeCost s < s.engine.padding) (j budget : Nat)
    (P : View → Prop)
    (success : P (view (run (j + 1) s env).state))
    (in_time : (run (j + 1) s env).cost ≤ budget) :
    P (view (run (j + 1) (strip s) env).state) ∧
    changeCost s + (run (j + 1) (strip s) env).cost ≤ budget := by
  have hs := continuation_simulation (j + 1) (strip s) s env (strip_refines s)
  have hc := every_positive_prefix s env profitable j
  exact ⟨by rw [hs.1.1]; exact success, by omega⟩

/-- If an engine installation makes the states equal, the *entire* remaining
    continuation has equal costs. Extending the horizon cannot invent savings. -/
theorem coalesced_cost (n : Nat) (a b : State) (env : Environment)
    (coalesced : (tick a env).state = (tick b env).state) :
    (run (n + 1) a env).cost + (tick b env).cost =
      (run (n + 1) b env).cost + (tick a env).cost := by
  simp only [run, coalesced]
  omega

/-- Costs cannot be transported through the padding-forgetting pushout. -/
theorem cost_does_not_descend (env : Environment) :
    ¬ ∃ w : Glued → Nat,
      (∀ s, w (embedLeft s) = (tick s env).cost) ∧
      (∀ s, w (embedRight s) = (tick s env).cost) := by
  rintro ⟨w, hl, hr⟩
  let a : State := ⟨⟨{ code := [] }, []⟩, ⟨0, .halt⟩⟩
  let b : State := ⟨a.core, ⟨1, .halt⟩⟩
  have he : embedLeft a = embedRight b := glue_bridge a b rfl
  have hc : (tick a env).cost = (tick b env).cost := by rw [← hl, ← hr, he]
  simp [tick_cost, eval, a, b] at hc

end MathGKM.Continuation
