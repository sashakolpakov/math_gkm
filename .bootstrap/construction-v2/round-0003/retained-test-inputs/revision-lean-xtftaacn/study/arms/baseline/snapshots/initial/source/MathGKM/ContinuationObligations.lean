-- Independent builder, 2026-10-17. Specification and generic lemmas only.
-- VALIDATION NOT YET RUN. This does not certify Python/OS/Astra execution.
import Lean

namespace MathGKM.ContinuationObligations

inductive Instruction where
  | request | accept | attach | review | proposeRewrite | install | stop
  deriving Repr, DecidableEq

structure Program where
  code : List Instruction
  deriving Repr, DecidableEq

structure State where
  program : Program
  archive : List String
  agenda : List String
  pending : Option String
  history : List String
  clock : Nat
  resource : Nat
  deriving Repr

/-- Responses and delays are inputs. No probability of proposer success. -/
structure Input where
  response : String
  delay : Nat
  nextProgram : Option Program
  deriving Repr

/-- This is a declared model, not the study's host implementation. Both
continuations may change code at every future step, including after a switch. -/
def step (s : State) (i : Input) : State :=
  match s.program.code with
  | [] => s
  | instruction :: rest =>
    let t := { s with program := ⟨rest⟩,
      history := s.history ++ [i.response], clock := s.clock + i.delay + 1,
      resource := s.resource - (i.delay + 1) }
    match instruction with
    | .request => { t with pending := some i.response }
    | .accept => { t with archive := t.archive ++ [i.response], pending := none }
    | .attach => { t with archive := t.archive ++ [i.response] }
    | .review => { t with agenda := t.agenda ++ [i.response] }
    | .proposeRewrite => { t with pending := some i.response }
    | .install => { t with program := i.nextProgram.getD t.program }
    | .stop => { t with program := ⟨[]⟩ }

def run (n : Nat) (s : State) (env : Nat → Input) : State :=
  match n with
  | 0 => s
  | n+1 => step (run n s env) (env n)

structure Installation where
  candidate : Program
  validationCost : Nat
  migrationCost : Nat
  deadline : Nat

def install (i : Installation) (s : State) : Option State :=
  let cost := i.validationCost + i.migrationCost
  if s.clock + cost ≤ i.deadline ∧ cost ≤ s.resource then
    some { s with program := i.candidate, clock := s.clock + cost,
                  resource := s.resource - cost }
  else none

/-- A whole trace includes all subsequent code, proposals and installations.
The chosen semantics must refine actual effects; arbitrary values are not an
implementation bridge. This declaration keeps that obligation explicit. -/
abbrev Trace := Nat → State

structure WholeSemantics where
  continue : State → (Nat → Input) → Trace
  initial : ∀ s env, continue s env 0 = s
  successor : ∀ s env n, continue s env (n+1) = step (continue s env n) (env n)

def operationalSemantics : WholeSemantics where
  continue := fun s env n => run n s env
  initial := fun _ _ => rfl
  successor := fun _ _ _ => rfl

/-- The whole trace is now determined by executable steps at every horizon. -/
theorem continuation_eq_run (sem : WholeSemantics) (s : State) (env : Nat → Input)
    (n : Nat) : sem.continue s env n = run n s env := by
  induction n with
  | zero => exact sem.initial s env
  | succ n ih => rw [sem.successor, ih]; rfl

def WholeSwitch (sem : WholeSemantics) (utility : Trace → Int)
    (environmentClass : (Nat → Input) → Prop) (s : State) (i : Installation) : Prop :=
  ∃ t, install i s = some t ∧
    ∀ env, environmentClass env → utility (sem.continue s env) < utility (sem.continue t env)

/-- No hypothesis here asserts global proof-system soundness. This bundle is
an obligation type, not a discharged concrete switch certificate. -/
structure ImplementationBinding (HostState HostInput : Type) (sem : WholeSemantics) where
  encode : HostState → State
  encodeInput : HostInput → Input
  hostStep : HostState → HostInput → HostState
  simulates : ∀ s i, encode (hostStep s i) = step (encode s) (encodeInput i)
  contractBytes : String
  incumbentBytes : String
  candidateBytes : String
  migrationBytes : String
  costInterpretation : String
  environmentAssumptions : String

def hostRun {S I : Type} (transition : S → I → S) (n : Nat)
    (s : S) (env : Nat → I) : S :=
  match n with
  | 0 => s
  | n+1 => transition (hostRun transition n s env) (env n)

/-- A local simulation extends to the WHOLE trace, including later installs.
This is useful only after supplying a concrete host simulation; it does not
assume or prove any favorable utility comparison. -/
theorem ImplementationBinding.whole_trace {S I : Type} {sem : WholeSemantics}
    (b : ImplementationBinding S I sem) (s : S) (env : Nat → I) (n : Nat) :
    b.encode (hostRun b.hostStep n s env) =
      sem.continue (b.encode s) (fun k => b.encodeInput (env k)) n := by
  rw [continuation_eq_run]
  induction n with
  | zero => rfl
  | succ n ih =>
    change b.encode (b.hostStep (hostRun b.hostStep n s env) (env n)) = _
    rw [b.simulates, ih]
    rfl

/-- Inhabited model instance, not an assertion about Python/OS/model calls. -/
def modelBinding : ImplementationBinding State Input operationalSemantics where
  encode := id
  encodeInput := id
  hostStep := step
  simulates := fun _ _ => rfl
  contractBytes := "model-only"
  incumbentBytes := "state.program"
  candidateBytes := "input.nextProgram"
  migrationBytes := "install"
  costInterpretation := "natural steps and input delays"
  environmentAssumptions := "arbitrary input streams"

theorem zero_installation_preserves_baseline (s : State) :
    install ⟨s.program, 0, 0, s.clock⟩ s = some s := by
  simp [install]

end MathGKM.ContinuationObligations
