-- Machine-authored by Codex/Astra, 2026-10-13.
import Mathlib.Data.Nat.Basic
import Lean.Elab.Tactic.Omega

namespace MathGKM.Machine

/-- Inspectable executable code. Replacement code can itself replace code. -/
inductive Instruction where
  | record (value : Nat)
  | request (query : Nat)
  | rewrite (code : List Instruction)
  deriving Repr

abbrev Program := List Instruction

structure State where
  code : Program
  archive : List Nat := []
  agenda : List Nat := []
  pending : Option Nat := none
  history : List Nat := []
  deriving Repr

/-- Abstract authorized response, not an assertion of verifier soundness.
    Responses are indexed by interaction step, independent of wall-clock time. -/
structure Input where
  answer : Nat := 0
  replacement : Option Program := none
  delay : Nat := 0
  deriving Repr

inductive Engine where
  | reference
  | candidate
  deriving Repr, DecidableEq

def dispatchCost : Engine → Nat
  | .reference => 2
  | .candidate => 1

def step (s : State) (i : Input) : State :=
  match s.code with
  | [] => s
  | .record v :: rest => { s with code := rest, archive := v :: s.archive }
  | .rewrite p :: _ => { s with code := p }
  | .request q :: rest =>
      { s with
        code := i.replacement.getD rest
        archive := i.answer :: s.archive
        agenda := s.agenda ++ [q]
        pending := none
        history := q :: s.history }

def operationCost (s : State) (i : Input) : Nat :=
  match s.code with
  | .request _ :: _ => i.delay + (if i.replacement.isSome then 3 else 0)
  | .rewrite _ :: _ => 3
  | _ => 0

structure Result where
  state : State
  cost : Nat
  deriving Repr

/-- Administrative bytecode is data too. The initial reference has one
    redundant accounting instruction; removing it is a model optimization.
    One interpreted opcode costs one abstract unit, not one wall-clock unit. -/
inductive MicroInstruction where
  | account
  | execute
  deriving Repr

def engineCode : Engine → List MicroInstruction
  | .reference => [.account, .execute]
  | .candidate => [.execute]

def executeMicro : List MicroInstruction → State → Input → Result
  | [], s, _ => ⟨s, 0⟩
  | .account :: rest, s, i =>
      let tail := executeMicro rest s i
      ⟨tail.state, 1 + tail.cost⟩
  | .execute :: rest, s, i =>
      let tail := executeMicro rest (step s i) i
      ⟨tail.state, 1 + operationCost s i + tail.cost⟩

def dispatch (e : Engine) (s : State) (i : Input) : Result :=
  executeMicro (engineCode e) s i

theorem dispatch_state (e : Engine) (s : State) (i : Input) :
    (dispatch e s i).state = step s i := by
  cases e <;> rfl

theorem dispatch_cost (e : Engine) (s : State) (i : Input) :
    (dispatch e s i).cost = dispatchCost e + operationCost s i := by
  cases e <;> simp only [dispatch, engineCode, executeMicro, dispatchCost, Nat.add_zero] <;> omega

/-- Complete n-tick continuation including future rewrites. Empty code idles.
    This is a step semantics, not a finite table of outcomes. -/
def run : Nat → Engine → State → (Nat → Input) → Result
  | 0, _, s, _ => ⟨s, 0⟩
  | n + 1, e, s, env =>
      let head := dispatch e s (env 0)
      let tail := run n e head.state (fun k => env (k + 1))
      ⟨tail.state, head.cost + tail.cost⟩

theorem continuation_preserves (n : Nat) (s : State) (env : Nat → Input) :
    (run n .candidate s env).state = (run n .reference s env).state := by
  induction n generalizing s env with
  | zero => rfl
  | succ n ih =>
    simp only [run, dispatch_state]
    exact ih _ _

theorem continuation_cost (n : Nat) (s : State) (env : Nat → Input) :
    (run n .candidate s env).cost + n = (run n .reference s env).cost := by
  induction n generalizing s env with
  | zero => rfl
  | succ n ih =>
    have h := ih (step s (env 0)) (fun k => env (k + 1))
    simp only [run, dispatch_state, dispatch_cost, dispatchCost]
    omega

/-- Same observations and lower abstract cost at a common baseline.
    k must include all remaining validation and installation cost. -/
theorem concrete_switch (n k : Nat) (s : State) (env : Nat → Input) (gain : k < n) :
    (run n .candidate s env).state = (run n .reference s env).state ∧
    k + (run n .candidate s env).cost < (run n .reference s env).cost := by
  constructor
  · exact continuation_preserves n s env
  · have h := continuation_cost n s env
    omega

theorem overhead_removes_gain (n k : Nat) (s : State) (env : Nat → Input)
    (overhead : n ≤ k) :
    ¬ k + (run n .candidate s env).cost < (run n .reference s env).cost := by
  have h := continuation_cost n s env
  omega

theorem deadline_counterexample :
    ¬ (3 + (run 1 .candidate { code := [.record 7] } (fun _ => {})).cost ≤ 2) ∧
    (run 1 .reference { code := [.record 7] } (fun _ => {})).cost ≤ 2 := by
  decide

theorem frozen_incumbent_counterexample :
    (run 2 .reference { code := [.request 0] }
      (fun _ => { replacement := some [.record 9] })).state.archive = [9, 0] ∧
    (run 2 .reference { code := [.request 0] } (fun _ => {})).state.archive = [0] := by
  decide

/-- A service that returns the request time need not give corresponding replies. -/
theorem time_dependent_response_counterexample :
    (run 1 .candidate { code := [.request 0] }
      (fun _ => { answer := dispatchCost .candidate })).state.archive ≠
    (run 1 .reference { code := [.request 0] }
      (fun _ => { answer := dispatchCost .reference })).state.archive := by
  decide

end MathGKM.Machine
