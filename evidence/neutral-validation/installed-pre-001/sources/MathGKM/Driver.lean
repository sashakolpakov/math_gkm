-- Machine-authored by Codex/Astra. Executes the actual formal run definition.
import MathGKM.Machine
import Lean

open Lean MathGKM.Machine

deriving instance ToJson, FromJson for Instruction
deriving instance ToJson, FromJson for State
deriving instance ToJson, FromJson for Input
deriving instance ToJson, FromJson for Engine
deriving instance ToJson for Result

structure Invocation where
  horizon : Nat
  engine : Engine
  state : State
  inputs : Array Input
  deriving FromJson

def main (args : List String) : IO UInt32 := do
  match args with
  | [filename] =>
    let raw ← IO.FS.readFile filename
    match Json.parse raw >>= fromJson? (α := Invocation) with
    | .error e => IO.eprintln e; return 1
    | .ok r =>
      if r.horizon > 10000 then
        IO.eprintln "bootstrap horizon limit exceeded"; return 1
      let result := run r.horizon r.engine r.state (fun k => r.inputs[k]?.getD {})
      IO.println (toJson result).compress
      return 0
  | _ => IO.eprintln "usage: lean --run MathGKM/Driver.lean INPUT.json"; return 1
