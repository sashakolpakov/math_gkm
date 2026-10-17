-- Codex/Astra. Executed by machinery.engine as its transition guard.
-- Payload, filesystem atomicity, broker execution and OS costs remain outside this model.
import Lean
import Lean.Elab.Tactic.Omega

open Lean
namespace MathGKM.Protocol
structure State where
  pending : Option String := none
  consumed : List String := []
  count : Nat := 0
  limit : Nat := 32
  inflight : Bool := false
  deriving ToJson, FromJson, Repr

inductive Command where
  | issue (id : String)
  | claim (id : String)
  | record
  | finish
  deriving ToJson, FromJson, Repr

def step (s : State) (c : Command) : Option State :=
  match c with
  | .issue id => if s.pending.isNone && !s.inflight then
      some {s with pending := some id} else none
  | .claim id => if s.pending == some id && !s.inflight && !(s.consumed.contains id) then
      some {s with consumed := id :: s.consumed, inflight := true} else none
  | .record => if s.inflight && s.count < s.limit then
      some {s with count := s.count + 1} else none
  | .finish => if s.inflight then some {s with pending := none, inflight := false} else none

theorem preserves_budget (s t : State) (c : Command)
    (h : s.count ≤ s.limit) (accepted : step s c = some t) : t.count ≤ t.limit := by
  cases c <;> simp only [step] at accepted
  all_goals split at accepted <;> simp_all
  all_goals subst t <;> simp_all <;> omega

theorem recorded_only_inflight (s t : State) (h : step s .record = some t) :
    s.inflight = true ∧ t.count = s.count + 1 := by
  simp only [step] at h
  split at h <;> simp_all
  subst t
  rfl

theorem no_replayed_claim (s : State) (id : String) (h : id ∈ s.consumed) :
    step s (.claim id) = none := by
  simp [step, h]

structure Invocation where
  state : State
  command : Command
  deriving FromJson
end MathGKM.Protocol

open Lean MathGKM.Protocol

def main (args : List String) : IO UInt32 := do
  match args with
  | [filename] =>
    let raw ← IO.FS.readFile filename
    match Json.parse raw >>= fromJson? (α := Invocation) with
    | .error e => IO.eprintln e; return 1
    | .ok r =>
      match step r.state r.command with
      | none => IO.eprintln "protocol transition rejected"; return 2
      | some s => IO.println (toJson s).compress; return 0
  | _ => return 1
